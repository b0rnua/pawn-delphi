unit CashBook;

interface

uses
  ADODB, SysUtils, DateUtils, FullSum, Dialogs, DANADO, danUtils;

type
  TCashBook = class(TObject)
  public
    orderNumber : String;
    pageNumber : Integer;
    mamber : String;
    bill : String;
    sum : String;
    sumBegin : String;
    sumEnd : String;
    operation : Boolean;
    cashier : string;
    procedure showCashBook(date: TDateTime);
  private
    function calcBalanceAtTheStarting(date: TDateTime): Double;
    procedure getPageNumber();
    procedure setPageNumber(pageNumber: Integer; date: TDateTime);
    function checkLastCahsBookDate(date: TDateTime): Boolean;
end;

implementation

uses
  main;


{ TCachBook }

function TCashBook.calcBalanceAtTheStarting(date: TDateTime): Double;
var
  q1 : TADOQuery;
  sqlQuery : string;
  balance : Double;
begin
  balance := 0;
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := DANADO.utils.getConnectionString;

  sqlQuery := 'SELECT SUM(sum_op) FROM operation WHERE (op=1 OR op=11) AND date_op<:pdate_op';
  q1.SQL.Add(sqlQuery);
  q1.Parameters.ParamByName('pdate_op').Value := date;
  q1.Open;
    balance := balance - q1.Fields[0].AsFloat;
  q1.Close;
  q1.SQL.Clear;

  sqlQuery := 'SELECT SUM(sum_op) FROM operation WHERE (op=2 OR op=5 OR op=10) AND date_op<:pdate_op';
  q1.SQL.Add(sqlQuery);
  q1.Parameters.ParamByName('pdate_op').Value := date;
  q1.Open;
    balance := balance + q1.Fields[0].AsFloat;
  q1.Close;
  q1.SQL.Clear;

  sqlQuery := 'SELECT SUM(percent_op) FROM operation WHERE (op=2 OR op=5) AND date_op<:pdate_op';
  q1.SQL.Add(sqlQuery);
  q1.Parameters.ParamByName('pdate_op').Value := date;
  q1.Open;
    balance := balance + q1.Fields[0].AsFloat;
  q1.Close;
  q1.SQL.Clear;

  sqlQuery := 'SELECT SUM(delay_op) FROM operation WHERE (op=2 OR op=5) AND date_op<:pdate_op';
  q1.SQL.Add(sqlQuery);
  q1.Parameters.ParamByName('pdate_op').Value := date;
  q1.Open;
    balance := balance + q1.Fields[0].AsFloat;
  q1.Close;
  q1.SQL.Clear;

  q1.Destroy;
  Result := balance;
end;

function TCashBook.checkLastCahsBookDate(date: TDateTime): Boolean;
var
  q1 : TADOQuery;
  sqlQuery : string;
  res : Boolean;
begin
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := DANADO.utils.getConnectionString;

  sqlQuery := 'SELECT LastCashBookDate FROM pasport';
  q1.SQL.Add(sqlQuery);
  q1.Open;
      if (q1.Fields[0].AsDateTime < date) then res := True
      else res := False;
  q1.Close;
  q1.SQL.Clear;
  Result := res;
end;

procedure TCashBook.getPageNumber;
var
  q1 : TADOQuery;
  balance : Double;
  sqlQuery : string;
begin
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := DANADO.utils.getConnectionString;

  sqlQuery := 'SELECT employee.name, bPage, name_filial, Chief FROM pasport INNER JOIN employee ON pasport.id_CurrentEmployee=employee.id';
  q1.SQL.Add(sqlQuery);
  q1.Open;
      pageNumber := q1.Fields[1].AsInteger;
      cashier := q1.Fields[0].AsString;
  q1.Close;
  q1.SQL.Clear;
end;

procedure TCashBook.setPageNumber(pageNumber : Integer; date: TDateTime);
var
  q1 : TADOQuery;
  sqlString : string;
begin
  Inc(pageNumber);
  sqlString := 'UPDATE pasport SET bPage=' + IntToStr(pageNumber)+', LastCashBookDate=:LastCashBookDate';
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := DANADO.utils.getConnectionString;
  q1.CursorLocation := clUseServer;
  q1.LockType := ltReadOnly;
  q1.CursorType := ctOpenForwardOnly;
  q1.SQL.Add(sqlString);
  q1.Parameters.ParamByName('LastCashBookDate').Value := date;
  q1.ExecSQL;
  q1.Close;
  q1.SQL.Clear;
  q1.Destroy;
end;

procedure TCashBook.showCashBook(date: TDateTime);
var
  q1 : TADOQuery;
  balance : Double;
  sqlQuery : string;
  numOfOrders : Integer;
begin


  getPageNumber;
  if(danUtils.print.checkDNR) then begin
  Form1.frxReport1.LoadFromFile('c:\pawn\report\cashBookDNR.fr3');
  end else begin
  Form1.frxReport1.LoadFromFile('c:\pawn\report\cashBook.fr3');
  end;

  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := DANADO.utils.getConnectionString;

  sqlQuery := 'SELECT COUNT(orders.numberW)' +
   ' FROM orders INNER JOIN operation ON (orders.OperationDate = operation.date_op) AND (orders.OperationId = operation.id)' +
   ' WHERE (((orders.OperationDate)=:OperationDate) AND ((operation.op)=2 Or (operation.op)=5 Or (operation.op)=10))';
  q1.SQL.Add(sqlQuery);
  q1.Parameters.ParamByName('OperationDate').Value := date;
  q1.Open;
     Form1.frxReport1.Variables['incomeCount'] := ''''+SumNumToFull(q1.Fields[0].AsFloat)+'''';
     numOfOrders := q1.Fields[0].AsInteger;
  q1.Close;
  q1.SQL.Clear;

  sqlQuery := 'SELECT COUNT(orders.numberW)' +
   ' FROM orders INNER JOIN operation ON (orders.OperationDate = operation.date_op) AND (orders.OperationId = operation.id)' +
   ' WHERE (((orders.OperationDate)=:OperationDate) AND ((operation.op)=1 Or (operation.op)=11))';
  q1.SQL.Add(sqlQuery);
  q1.Parameters.ParamByName('OperationDate').Value := date;
  q1.Open;
    Form1.frxReport1.Variables['outgoingCount'] := '''' + SumNumToFull(q1.Fields[0].AsFloat) + '''';
    numOfOrders := numOfOrders + q1.Fields[0].AsInteger;
  q1.Close;
  q1.SQL.Clear;

  sqlQuery := 'SELECT SUM(operation.sum_op), SUM(operation.percent_op),SUM(operation.delay_op)' +
   ' FROM orders INNER JOIN operation ON (orders.OperationDate = operation.date_op) AND (orders.OperationId = operation.id)' +
   ' WHERE (((orders.OperationDate)=:OperationDate) AND ((operation.op)=2 Or (operation.op)=5 Or (operation.op)=10))';
  q1.SQL.Add(sqlQuery);
  q1.Parameters.ParamByName('OperationDate').Value := date;
  q1.Open;
    Form1.frxReport1.Variables['incomeSum'] := q1.Fields[0].AsFloat+
    q1.Fields[1].AsFloat+q1.Fields[2].AsFloat;
  q1.Close;
  q1.SQL.Clear;

  sqlQuery := 'SELECT SUM(operation.sum_op)' +
   ' FROM orders INNER JOIN operation ON (orders.OperationDate = operation.date_op) AND (orders.OperationId = operation.id)' +
   ' WHERE (((orders.OperationDate)=:OperationDate) AND ((operation.op)=1 Or (operation.op)=11))';
  q1.SQL.Add(sqlQuery);
  q1.Parameters.ParamByName('OperationDate').Value := date;
  q1.Open;
    Form1.frxReport1.Variables['outgoingSum'] := ''''+q1.Fields[0].AsString+'''';
  q1.Close;
  q1.SQL.Clear;
  q1.Destroy;

  if ((checkLastCahsBookDate(date)) AND (numOfOrders > 0)) then begin
    setPageNumber(pageNumber,date)
  end
  else begin
    Dec(pageNumber);
  end;

  Form1.frxReport1.Variables['myDate'] := '''' + DateToStr(date) + '''';
  balance := calcBalanceAtTheStarting(date);
  balance := Round(balance*100)/100;
  Form1.frxReport1.Variables['sumBegin'] := balance;

  Form1.ADODataSet2.Active := False;
  Form1.ADODataSet2.CommandText := '';
  Form1.ADODataSet2.CommandText := 'SELECT orders.numberW, orders.FromW, orders.Bill, orders.Summ  ' +
   '  FROM orders INNER JOIN operation ON (orders.OperationDate = operation.date_op) AND (orders.OperationId = operation.id) ' +
   '  WHERE (((orders.OperationDate)=:OperationDate) AND ((operation.op)=2 Or (operation.op)=5 Or (operation.op)=10))';
  Form1.ADODataSet2.Parameters.ParamByName('OperationDate').Value := date;
  Form1.ADODataSet2.Active := True;

  Form1.ADODataSet3.Active := False;
  Form1.ADODataSet3.CommandText := '';
  Form1.ADODataSet3.CommandText := 'SELECT orders.numberW, orders.FromW, orders.Bill, orders.Summ  ' +
   '  FROM orders INNER JOIN operation ON (orders.OperationDate = operation.date_op) AND (orders.OperationId = operation.id) ' +
   '  WHERE (((orders.OperationDate)=:OperationDate) AND ((operation.op)=1 Or (operation.op)=11))';
  Form1.ADODataSet3.Parameters.ParamByName('OperationDate').Value := date;
  Form1.ADODataSet3.Active := True;


  balance := calcBalanceAtTheStarting(IncDay(date,1));

  balance := Round(balance*100)/100;

  Form1.frxReport1.Variables['sumEnd'] := balance;

  Form1.frxReport1.Variables['firsPageNumber'] := '''' +  IntToStr(pageNumber) + '''';

  Form1.frxReport1.Variables['cashier'] := '''' + cashier + '''';

  Form1.frxReport1.ShowReport(true);

  Form1.ADODataSet3.Active := False;

  Form1.ADODataSet2.Active := False;

end;

end.
