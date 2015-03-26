unit Order;

interface

uses
  ADODB, SysUtils, Dialogs, OperationEntity, OperationList, OperationADO,
  Classes, FullSum, Contnrs, DateUtils, DanAdo, ContractEntity;

type
  TArrayOfOrders = array of array of string;
  //TArrayOfOrders = array of TOrder;

var
  fieldList : array [0..14] of array [0..1] of string = (
                                                    ('bill',''),
                                                    ('summ',''),
                                                    ('from',''),
                                                    ('ground',''),
                                                    ('summInWord',''),
                                                    ('summCent',''),
                                                    ('chiefAccountant',''),
                                                    ('casheir',''),
                                                    ('number',''),
                                                    ('filialNumber',''),
                                                    ('chief',''),
                                                    ('document',''),
                                                    ('date',''),
                                                    ('additional',''),
                                                    ('recipient','')
                                                    );

type
  TOrder = class(TObject)
  public
    id : Longint;
    bill : string;
    summ : string;
    from : string;
    ground : string;
    summInWord : string;
    summCent : string;
    chiefAccountant : string;
    casheir : string;
    number : string;
    filialNumber : string;
    chief : string;
    document : string;
    date : string;
    recipient : string;
    additional : string;
    orderType : Integer;
    opearionId : Longint;
    operation: TOperation;
    procedure printReceiptDocument();
    procedure saveReceiptDocument(id1 : String);
    procedure printExpenseReport();
    procedure saveDocument(operationId: Integer);
    function ConfirmCheck(): Boolean;
    function getOrdersByDate(date: TDateTime): TArrayOfOrders;
    function getCountOrdesByDate(date: TDateTime): Integer;
    function getOrderById(id: Integer): Boolean;
    function getOrderByOpeartionId(id: Integer): Boolean;
    procedure print();
    procedure createOrderByOperationId(operation: OperationEntity.TOperation);
    procedure renewOrders();
    procedure editOrder();
    procedure setSumInWord(sum: Double);
    procedure createOrderByOperation(operation: OperationEntity.TOperation);
  private
    procedure getOrderNumber();
    procedure clearFieldList;
    procedure fillFieldList();
    procedure fillReport(reportType : Integer);
    procedure IncOrderNumber(orderNumber: Integer; allOrderType: Boolean);
    function getLastOrderDate(): TDateTime;
    function getLastValidOrderNumber(): Integer;
    procedure clearOrdersTable();

    procedure createOrderByIdOperationToSAVE(idOp1 : Integer);
end;

implementation


uses
  main;

{ TOrder }

procedure TOrder.clearFieldList;
var
 i : Integer;
begin
  for i := 0 to (Length(fieldList)-1) do begin
    fieldList[i,1] := '';
  end;
end;

procedure TOrder.fillFieldList;
begin
    fieldList[0,1] := bill;
    fieldList[1,1] := summ;
    fieldList[2,1] := from;
    fieldList[3,1] := ground;
    fieldList[4,1] := summInWord;
    fieldList[5,1] := summCent;
    fieldList[6,1] := chiefAccountant;
    fieldList[7,1] := casheir;
    fieldList[8,1] := number;
    fieldList[9,1] := filialNumber;
    fieldList[10,1] := chief;
    fieldList[11,1] := document;
    fieldList[12,1] := date;
    fieldList[13,1] := additional;
    fieldList[14,1] := recipient;
end;

procedure TOrder.fillReport(reportType: Integer);
var
 i : Integer;
begin
  if (reportType = 1) then begin
    for i := 0 to (Length(fieldList)-1) do begin
      Form1.expenseReport.SetParam(fieldList[i,0],fieldList[i,1]);

    end
  end;
  if (reportType = 2) then begin
    for i := 0 to (Length(fieldList)-1) do begin
      Form1.receiptDocument.SetParam(fieldList[i,0],fieldList[i,1]);
    end;
  end;
  clearFieldList;
end;

function TOrder.getOrderById(id: Integer): Boolean;
Var
  q1 : TADOQuery;
  sqlString : string;
  op : Integer;
begin
  sqlString := 'SELECT Bill, Summ, FromW, Ground, SummInWord, SummCent,'+
    ' ChiefAccountant, casheir, numberW, filialNumber, chief, OperationDate,'+
    ' document, recipient, [operation.op] AS op, additional'+
    ' FROM orders INNER JOIN operation ON orders.OperationId=operation.id'+
    ' WHERE orders.id='+IntToStr(id);
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := DANADO.utils.getConnectionString;
  q1.SQL.Add(sqlString);
  q1.Open;
    bill := q1.FieldByName('Bill').AsString;
    summ := q1.FieldByName('Summ').AsString;
    from := q1.FieldByName('FromW').AsString;
    ground := q1.FieldByName('Ground').AsString;
    summInWord := q1.FieldByName('summInWord').AsString;
    summCent := q1.FieldByName('summCent').AsString;
    chiefAccountant := q1.FieldByName('chiefAccountant').AsString;
    casheir := q1.FieldByName('casheir').AsString;
    number := q1.FieldByName('numberW').AsString;
    filialNumber := q1.FieldByName('filialNumber').AsString;
    chief := q1.FieldByName('chief').AsString;
    document := q1.FieldByName('document').AsString;
    date := q1.FieldByName('OperationDate').AsString;
    recipient := q1.FieldByName('recipient').AsString;
    additional := q1.FieldByName('additional').AsString;
    if (q1.FieldByName('op').AsInteger = 2) OR
    (q1.FieldByName('op').AsInteger = 5) OR
    (q1.FieldByName('op').AsInteger = 10) then
      orderType := 2
    else orderType := 1;

  q1.Close;
  q1.SQL.Clear;
  q1.Destroy;
end;

function TOrder.getOrderByOpeartionId(id: Integer): Boolean;
Var
  q1 : TADOQuery;
  sqlString : string;
  op : Integer;
  empty: Boolean;
begin
  empty := true;
  sqlString := 'SELECT [orders.id] AS orderId,Bill, Summ, FromW, Ground, SummInWord, SummCent,'+
    ' ChiefAccountant, casheir, numberW, filialNumber, chief, OperationDate,'+
    ' document, recipient, operationId, [operation.op] AS op'+
    ' FROM orders INNER JOIN operation ON orders.OperationId=operation.id'+
    ' WHERE orders.OperationId='+IntToStr(id);
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := DANADO.utils.getConnectionString;
  q1.SQL.Add(sqlString);
  with q1 do begin
    q1.Open;
    while not eof do begin
      self.bill := q1.FieldByName('Bill').AsString;
      summ := q1.FieldByName('Summ').AsString;
      from := q1.FieldByName('FromW').AsString;
      ground := q1.FieldByName('Ground').AsString;
      summInWord := q1.FieldByName('summInWord').AsString;
      summCent := q1.FieldByName('summCent').AsString;
      chiefAccountant := q1.FieldByName('chiefAccountant').AsString;
      casheir := q1.FieldByName('casheir').AsString;
      number := q1.FieldByName('numberW').AsString;
      filialNumber := q1.FieldByName('filialNumber').AsString;
      chief := q1.FieldByName('chief').AsString;
      document := q1.FieldByName('document').AsString;
      date := q1.FieldByName('OperationDate').AsString;
      recipient := q1.FieldByName('recipient').AsString;
      Self.id := q1.FieldByName('orderId').AsInteger;
      operationId := q1.FieldByName('operationId').AsInteger;
      if (q1.FieldByName('op').AsInteger = 2) OR
      (q1.FieldByName('op').AsInteger = 5) OR
      (q1.FieldByName('op').AsInteger = 10) then
        orderType := 2
      else orderType := 1;
      empty := false;
      Next;
    end;
    q1.Close;
  end;
  q1.SQL.Clear;
  q1.Destroy;
  Result := empty;
end;

procedure TOrder.getOrderNumber();
var
  q1 : TADOQuery;
  sqlString : string;
  orderNumberVarName : string;
begin
  if (orderType = 1) then begin
    sqlString := ('SELECT [employee.name] AS name, OrderNumber, name_filial, Chief FROM pasport INNER JOIN employee ON pasport.id_CurrentEmployee=employee.id');
    orderNumberVarName := 'OrderNumber';
  end
  else begin
    sqlString := ('SELECT [employee.name] AS name, OrderNumber2, name_filial, Chief FROM pasport INNER JOIN employee ON pasport.id_CurrentEmployee=employee.id');
    orderNumberVarName := 'OrderNumber2';
  end;
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := DANADO.utils.getConnectionString;
  q1.SQL.Add(sqlString);
  q1.Open;
    chiefAccountant := q1.FieldByName('name').AsString;
    casheir := chiefAccountant;
    number := q1.FieldByName(orderNumberVarName).AsString;
    filialNumber := q1.FieldByName('name_filial').AsString;
    chief := q1.FieldByName('Chief').AsString;
  q1.Close;
  q1.SQL.Clear;
  q1.Destroy;
end;

procedure TOrder.IncOrderNumber(orderNumber: Integer; allOrderType: Boolean);
var
  q1 : TADOQuery;
  sqlString : string;
begin
  Inc(orderNumber);
  if (orderType = 1) then
    sqlString := 'UPDATE pasport SET OrderNumber=' + IntToStr(orderNumber)
  else
    sqlString := 'UPDATE pasport SET OrderNumber2=' + IntToStr(orderNumber);
  if (allOrderType) then
    sqlString := 'UPDATE pasport SET OrderNumber=' + IntToStr(orderNumber) +','+
    'OrderNumber2=' + IntToStr(orderNumber);
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := DANADO.utils.getConnectionString;
  q1.CursorLocation := clUseServer;
  q1.LockType := ltReadOnly;
  q1.CursorType := ctOpenForwardOnly;
  q1.SQL.Add(sqlString);
  q1.ExecSQL;
  q1.Close;
  q1.SQL.Clear;
  q1.Destroy;
end;

procedure TOrder.print;
begin
  if (orderType = 1) then printExpenseReport
  else printReceiptDocument;
end;

procedure TOrder.printExpenseReport();

begin
  fillFieldList;
  fillReport(1);
  Form1.expenseReport.Execute;
end;

procedure TOrder.printReceiptDocument();
begin
  fillFieldList;
  fillReport(2);
  Form1.receiptDocument.Execute;
end;

procedure TOrder.saveReceiptDocument(id1 : String);
begin
  fillFieldList;
  fillReport(2);
  //Form1.receiptDocument.
 // Form1.receiptDocument.SaveToFile(id1);
 //
end;

procedure TOrder.saveDocument(operationId: Integer);
var
  q1 : TADOQuery;
  sqlString : string;
begin
  getOrderNumber();
  sqlString := 'INSERT INTO orders ' +
    '(OperationId, Bill, Summ, FromW, Ground, SummInWord, SummCent, chiefAccountant, ' +
    'casheir, numberW, filialNumber, chief, OperationDate, document, recipient, additional) VALUES ' +
    '('+IntToStr(operationId)+', "'+bill+'", "'+summ+'", "'+from+'", "'+ground+'", "'+summInWord+
    '", "'+summCent+'", "'+chiefAccountant+'", "' +casheir+'", "'+number+
    '", "'+filialNumber+'", "'+chief+'", :pOperationDate, "'+document+'", "'+recipient+'", :pAp )';
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := DANADO.utils.getConnectionString;
  q1.CursorLocation := clUseServer;
  q1.LockType := ltReadOnly;
  q1.CursorType := ctOpenForwardOnly;
  q1.SQL.Add(sqlString);
  q1.Parameters.ParamByName('pOperationDate').Value := StrToDate(date);
  q1.Parameters.ParamByName('pAp').Value := additional;
  q1.ExecSQL;
  q1.Close;
  q1.SQL.Clear;
  q1.Destroy;
  IncOrderNumber(StrToInt(number),FALSE);
end;

procedure TOrder.setSumInWord(sum: Double);
begin
  summInWord := SumNumToFull(sum);
  summCent := FloatToStr(Round(Frac(sum)*100));
end;

procedure TOrder.clearOrdersTable;
var
  q1 : TADOQuery;
  sql : string;
begin
  sql := 'DELETE * FROM orders';
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := danAdo.utils.getConnectionString;
  q1.SQL.Add(sql);
  q1.ExecSQL;
  q1.Close;
  q1.SQL.Clear;
  q1.Close;
end;

function TOrder.ConfirmCheck(): Boolean;
var
  wReturn: Word;
begin
  wReturn := MessageDlg('Печатать ордер? (нужно положить в принтер чистый лист бумаги)', mtConfirmation, [mbYes, mbNo],0);
  if wReturn=6 then result := True
  else result := False;
end;

procedure TOrder.createOrderByIdOperationToSAVE(idOp1: Integer);
var
  contract : TContract;
begin


end;

procedure TOrder.createOrderByOperation(operation: OperationEntity.TOperation);
begin
  case operation.operationType of
    1: begin
      orderType := 1;
      bill := '3771';
      ground := 'предоставлен фин. кредит №' + operation.contract.number;
      document := operation.contract.deliverer.passport + ' ' +
      operation.contract.deliverer.passportNumber + ' ' +
      operation.contract.deliverer.issuingPassport + ' ' +
      DateToStr(operation.contract.deliverer.dateOfIssue);
      //Добавить класс руководитель либо класс отделение
      chief := chief;
      from := operation.contract.deliverer.name;
    end;
    11: begin
      orderType := 1;
      bill := '683';
      ground := 'служебное изьятие';
      document := chiefData;
      from := chief;
    end;
    10: begin
      orderType := 2;
      bill := '683';
      ground := 'служебное внесение';
      //Добавить класс руководитель либо класс отделение
      //chief := chief;
      from := chief;
    end;
    2: begin
      orderType := 2;
      bill := '3771, 373, 374';
      ground := 'возврат фин. кредита №' + operation.contract.number;
      from := operation.contract.deliverer.name;
    end;
    5: begin
      orderType := 2;
      bill := '3771, 373, 374';
      ground := 'возврат фин. кредита №' + operation.contract.number;
      from := operation.contract.deliverer.name;
    end;
  end;

  summ := FloatToStr(operation.summa + operation.percentSumma +
    operation.delaySumma);
  //chiefAccountant := operation.contract.employee.name;
  //casheir := operation.contract.employee.name;
  date := DateToStr(operation.date);
  filialNumber := filialNumberMain;
  summInWord := SumNumToFull(operation.summa + operation.percentSumma +
    operation.delaySumma);
  summCent := FloatToStr(Round(Frac(operation.summa + operation.percentSumma +
    operation.delaySumma)*100));
    additional := 'фин. кредит - '+FloatToStr(operation.summa)+' % - '+FloatToStr(operation.percentSumma)+' пеня - '+FloatToStr(operation.delaySumma);
end;

procedure TOrder.createOrderByOperationId(
  operation: OperationEntity.TOperation);
var
  q1 : TADOquery;
  sql1 : String;
begin


end;

procedure TOrder.editOrder;
var
  q1 : TADOQuery;
  sqlQuery : string;

begin
   q1 := TADOQuery.Create(nil);
    q1.ConnectionString := danAdo.utils.getConnectionString;
    sqlQuery := 'UPDATE orders SET' +
    ' Bill=:bill,'+
    ' Summ=:summ,'+
    ' FromW=:from,'+
    ' Ground=:ground,'+
    ' SummInWord=:summInWord,'+
    ' SummCent=:summCent,'+
    ' ChiefAccountant=:chiefAccountant,'+
    ' casheir=:casheir,'+
    ' numberW=:number,'+
    ' filialNumber=:filialNumber,'+
    ' chief=:chief,'+
    ' document=:document,'+
    ' OperationDate=:date,'+
    ' recipient=:recipient,'+
    ' additional=:additional,'+
    ' OperationId=:operationId' +
    ' WHERE orders.id =:id';
  q1.SQL.Add(sqlQuery);
  q1.Parameters.ParamByName('bill').Value := bill ;
  q1.Parameters.ParamByName('summ').Value := summ ;
  q1.Parameters.ParamByName('from').Value := from ;
  q1.Parameters.ParamByName('ground').Value := ground;
  q1.Parameters.ParamByName('summInWord').Value := summInWord;
  q1.Parameters.ParamByName('summCent').Value := summCent;
  q1.Parameters.ParamByName('chiefAccountant').Value := chiefAccountant;
  q1.Parameters.ParamByName('casheir').Value := casheir;
  q1.Parameters.ParamByName('number').Value := number;
  q1.Parameters.ParamByName('filialNumber').Value := filialNumber;
  q1.Parameters.ParamByName('chief').Value := chief;
  q1.Parameters.ParamByName('document').Value := document;
  q1.Parameters.ParamByName('date').Value := date;
  q1.Parameters.ParamByName('recipient').Value := recipient;
  q1.Parameters.ParamByName('operationId').Value := operationId;
  q1.Parameters.ParamByName('additional').Value := additional;
  q1.Parameters.ParamByName('id').Value := id;
  q1.ExecSQL;
  q1.Destroy;
end;

function TOrder.getOrdersByDate(date: TDateTime): TArrayOfOrders;
var
  arrayOfOrders: TArrayOfOrders;
  q1 : TADOQuery;
  sqlQuery : string;
  i : Integer;
  arrayLength : Integer;
begin
  i := 0;
  arrayLength := getCountOrdesByDate(date);
  if (arrayLength > 0) then SetLength(arrayOfOrders,arrayLength,5)
  else SetLength(arrayOfOrders,1,5);
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := DANADO.utils.getConnectionString;
  sqlQuery := 'SELECT numberW, Bill, Summ, Ground, id FROM orders WHERE OperationDate=:OperationDate';
  q1.SQL.Add(sqlQuery);
  q1.Parameters.ParamByName('OperationDate').Value := date;
  with q1 do begin
    q1.Open;
    while not Eof do begin
      arrayOfOrders[i,0] := q1.FieldByName('numberW').AsString;
      arrayOfOrders[i,1] := q1.FieldByName('Bill').AsString;
      arrayOfOrders[i,2] := q1.FieldByName('Summ').AsString;
      arrayOfOrders[i,3] := q1.FieldByName('Ground').AsString;
      arrayOfOrders[i,4] := q1.FieldByName('id').AsString;
      Inc(i);
      Next;
    end;
    q1.Close;
  end;
  q1.SQL.Clear;
  q1.Destroy;
  Result := arrayOfOrders;
end;

function TOrder.getCountOrdesByDate(date: TDateTime): Integer;
var
  q1 : TADOQuery;
  sqlQuery : string;
  res : Integer;
begin
  res := 0;
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := DANADO.utils.getConnectionString;
  sqlQuery := 'SELECT COUNT(Summ) FROM orders WHERE OperationDate=:OperationDate';
  q1.SQL.Add(sqlQuery);
  q1.Parameters.ParamByName('OperationDate').Value := date;
  q1.Open;
    res := q1.Fields[0].AsInteger;
  q1.Close;
  q1.SQL.Clear;
  q1.Destroy;
  Result := res;
end;

function TOrder.getLastOrderDate: TDateTime;
var
  q1 : TADOQuery;
  sql : string;
  res : TDateTime;
begin
  sql := 'SELECT TOP 1 dDate FROM kassa ORDER BY id DESC';
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := danAdo.utils.getConnectionString;
  q1.SQL.Add(sql);
  q1.Open;
    res := q1.FieldByName('dDate').AsDateTime;
  q1.Close;
  q1.SQL.Clear;
  q1.Close;
  Result := res;
end;

function TOrder.getLastValidOrderNumber: Integer;
var
  q1 : TADOQuery;
  sql : string;
  res : Integer;
begin
  sql := 'SELECT TOP 1 OrderNumber FROM kassa ORDER BY id DESC';
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := danAdo.utils.getConnectionString;
  q1.SQL.Add(sql);
  q1.Open;
    res := q1.FieldByName('OrderNumber').AsInteger;
  q1.Close;
  q1.SQL.Clear;
  q1.Close;
  Result := res;
end;

procedure TOrder.renewOrders();
var
  q1 : TADOQuery;
  sql : string;
  operations : TOperationList;
  i : Integer;
  operation : OperationEntity.TOperation;
  lastOrderDate: TDateTime;
  currentDate: TDateTime;
  lastValidOrderNumber: Integer;
  mYear, mMonth, mDay : Word;
  mYearNow, mMonthNow, mDayNow : Word;
begin
{
  lastOrderDate := getLastOrderDate();
  DecodeDate(lastOrderDate,mYear, mMonth, mDay);
  currentDate := SysUtils.Date;
  DecodeDate(currentDate,mYearNow, mMonthNow, mDayNow);
  if (mYearNow<>mYear) then begin
    lastValidOrderNumber := 0;
    lastOrderDate := EncodeDate(mYear, 12, 31)
  end
  else begin
    lastValidOrderNumber := getLastValidOrderNumber();
  end;
}
  lastOrderDate := EncodeDate(2014, 12, 31);
  lastValidOrderNumber := 0;
  operations := TOperationADO.Create.getOperationsByDate(IncDay(lastOrderDate,1),
    TOperationType.INCOME);
  IncOrderNumber(lastValidOrderNumber, TRUE);
  clearOrdersTable;
  for i := 0 to (Length(operations)-1) do begin
    number := IntToStr(i+1);
    operation := operations[i];
    if (operation.summa = 0 ) AND (operation.percentSumma = 0) then begin

    end
    else begin
      createOrderByOperation(OperationEntity.TOperation(operations[i]));
      saveDocument(OperationEntity.TOperation(operations[i]).id);
    end;
  end;

end;

end.
