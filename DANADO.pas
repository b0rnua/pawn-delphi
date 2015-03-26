unit DANADO;

interface

uses
 Windows,Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, enContract,enOperation,enProduct,enLoyalty, ADODB,
  Grids, ComObj, enDeliverer, enTarif, XMLIntf, XMLDoc, Discounts, DateUtils,
  enArrears, enPasport, enOrder, iniFiles;

type

  TForm7 = class(TForm)
      ContractGrid: TStringGrid;
      ProductGrid: TStringGrid;
      DelivererGrid: TStringGrid;
      OperationGrid: TStringGrid;
      procedure FormCreate(Sender: TObject);
    private
    public
      procedure showMe();
    end;

  { UTILS }
  tado = class(TObject)
    public
      function getConnectionString() : String;
      // Ласт Айди любой таблицы
      function getLastId(tableName : String) : Integer;
      function getOstatokKassa(DD1 : TDateTime) : Double;
      function getLoyalGroup() : Integer;
      function calculateSummBetweenDays(days : Integer; Summ1 : Double; percent1 : Double) : Double;
      function getEmployeeNameByID(id1 : Integer) :  String;
      function getLombardName() : String;
      function getCode_filial() : Integer;
    end;

  { CONTRACT }
  ADOcontract = class(TObject)
    private
      procedure showMe;
    public
      procedure show(c1 : TENcontract2);
      function getContractByNumber (contract_number1 : String) : TENcontract2;
      function getContractById (idContract1 : Integer) : TENcontract2;
      function fill(q1 : TADOQuery) : TENcontract2;
      procedure addX (c1 : TENcontract2; i1,j1 : Integer);
      procedure addXHead (i1 : Integer);
      function ARRgetcontractByDelivererId(idDeliverer : Integer) : TENcontract;
      function getContractPreRepawnByIdContract(id1 : Integer) : Integer;
      procedure closeContractInfo(id1 : Integer ; date1 : TDAte);
      function getConStatusById(id1 : Integer) : boolean;
  end;

  { OPERATION }
  ADOoperation = class(TObject)
    public
      function getOperationById(id1 : Integer) : TENoperation2;
      function getOperationByIdContract(id_contract_op1 : Integer) : TENoperation;
      function getOperationByDateAndCodeFilial(dateOperation : String; codeFilial : Integer) : TENoperation;
    //  function fill(q1 : TADOQuery) : TENoperation; OVERLOAD;
      function fill(q1 : TADOQuery) : TENOperation2; OVERLOAD;
      procedure show(o1 : TENoperation);
      function getSUMopByIdDelivererANDop(idDeliverer : Integer; op : Integer) : TENoperation;
      function sumSUM ( dd1 : TENdeliverer ) : TENDeliverer;
      procedure insertCloseOp ( idContract1 : Integer; summOp : Double;
                                percentOp : Double; DelayOp : Double; dateClose1 : TDate);

  end;

  { PRODUCT_INFO }
  ADOproductInfo = class(TObject)
    public
      function fillArrProduct(p1 : TENproduct ; q1 : TADOQuery) : TENproduct;
      function getProductByIdContract(id_contract1 : Integer) : TENproduct;
      procedure addProductByIdContract(p1: TENproduct; id1: Integer);
      function changeProductStatusById(p1 : TENProduct; id1 : Integer; status1 : Boolean) : TENProduct;
      function changeIdContract(p1 : TENProduct; idContract1 : Integer) : TENProduct;
      procedure show(p1 : TENproduct);
      procedure closeProductInfo(idContract1 : Integer);
  end;

  { DELIVERER }
  ADODeliverer = class(TObject)
    public
      function fill(q1 : TADOQuery) : TENdeliverer;
      procedure show(d1 : TENdeliverer);                                  //Test!
      procedure updateIdTarif(idDeliverer : Integer; idTarif : Integer);  //Work!
      function getDelivererById(id1 : Integer) : TENdeliverer;
      function getPercentAndDelayByIdDeliverer(id1 : Integer) : Double;
      function getLoyalTarifByIdDeliverer(id1 : Integer) : tenTarif;
      procedure setLoyalTarif(id1 : Integer);
      procedure checkNewIdTarif(id1 : Integer);
      function getMagicTarif(oldT : tenTarif; newT : tenTarif; idTarif : Integer) : TENTarif;
      procedure UpdateIdTarifByIdTarif(id1 : Integer; id2 : Integer);
      function getIdDelivererByIdContract(idContract : Integer) : Integer;
      // procedure updateIdTarif(idDeliverer : Integer);
  end;
  { TARIF }
  ADOTarif = class(TObject)
    public
      function getTarifByIdDelivererFromXML(id1 : Integer) : TenTarif;  // Fuck!
  end;

  { LOYALTY }
  ADOLoyalty = class(TObject)
  private
    procedure updateLoyaltyStatusFalseByIdDeliverer(id1: Integer);
    public
      function getLoyaltyByIdDeliverer(id1 : Integer) : TENloyalty;  // Work!
      function getLoyaltyByidLoyalty(id1 : Integer) : TENLoyalty;
      procedure setLoyaltyByIdDeliverer(loyal : TENLoyalty);
      procedure addLoyalty(loyal : TENloyalty);                      // Work!
      procedure deleteLoyaltybyidDeliverer(id1 : Integer);           // !Repair!
      function checkLoyaltyByIdDeliverer(id1 : Integer) : Boolean;   // Work!
      function getLoyalty(OWNLoyalty : TOWNLoyalty; id1 : Integer) : TENLoyalty;
      procedure importLoyaltyFromXML();                              // F1 Use $(
      procedure importLoyaltyFromTableByIdTarifSetPercent(idTarif : Integer; percentage : Double);  // F1 Use $(
      procedure dismissSaleLoyalty();
      function getArrayLoyalty(OWNLoyalty : TOWNLoyalty; id1 : Integer) : TARRLoyalty;
      procedure updateLoyaltyStatusFalse(OWNLoyalty : TOWNLoyalty;id1 : Integer);
      procedure importFromArrears();

  end;
  {ARREARS}
  ADOArrears = class(TObject)
    public
      function getArrearsByIdContract(id1 : Integer) : TENArrears;
      procedure setArrears(arears1 : TENarrears);
      function calculateArrears(sum : Double; arr1 : TENArrears) : TENArrears;
      procedure showArrears(arr1 : TENArrears);
      function getSumArrearsByIdContract(id1 : Integer) : Double;
      procedure updateArrearsSetDateAdd();
    //  procedure
  end;

  ADOPasport = class(TOBject)
    public
      function getPasport() : TENPasport;
      function getMaxNum() : Integer;
      function getContractNumber() : String;
      procedure incContractNumber();
      procedure createNormalNum();
      procedure updateOrdNum(ordIn1 : integer; ordOut1 : Integer);
  end;
  { ORDER }
  ADOOrder = class(TObject)
    public
      function createOrderByIdOperation(id1 : Integer) : TENOrder;
      procedure insertIntoOrders(id1 : TENOrder);
      procedure makeRovno();
      function fill(qq1 : TADOQuery) : TENOrder;
      procedure createTableOrders();
  end;

  ADOEmployee = class(TObject)
    public
      function getEmployeeList() : TStringList;
  end;
var
  Form7: TForm7;
  contract: ADOcontract;
  utils: tado;
  product : ADOproductInfo;
  X : Variant;
  operation : ADOoperation;
  deliverer : ADOdeliverer;
  tarif : ADOTarif;
  loyal : ADOLoyalty;
  arrear : ADOArrears;
  pasport : ADOPasport;
  order : ADOOrder;
  employee : ADOemployee;
  IniFile: TIniFile;
implementation

{$R *.dfm}
uses  main;

// non - complite
procedure ADOcontract.addX(c1: TENcontract2; i1,j1 : Integer);
begin
 { x.Cells.Item[i1,1].value := c1.getId;
  x.Cells.Item[i1,2].value := c1.getIdParentContract;
  x.Cells.Item[i1,3].value := c1.getId_deliverer;
  x.Cells.Item[i1,4].value := c1.getNum_of_day;
  x.Cells.Item[i1,5].value := c1.getLoan_amount;
  x.Cells.Item[i1,6].value := c1.getEstimated_amount;
  x.Cells.Item[i1,7].value := c1.getContract_number;
  x.Cells.Item[i1,8].value := c1.getDate_begin;
  x.Cells.Item[i1,9].value := c1.getDate_end;
  x.Cells.Item[i1,10].value := c1.getCon_percent;
  x.Cells.Item[i1,11].value := c1.getAmount_ref;
  x.Cells.Item[i1,12].value := c1.getCon_status;
  x.Cells.Item[i1,13].value := c1.getSum_percent;
  x.Cells.Item[i1,14].value := c1.getIdEmployee;
  x.Cells.Item[i1,15].value := c1.getDateClose;
  x.Cells.Item[i1,16].value := c1.getSpecialCondition;
  x.Cells.Item[i1,17].value := c1.getEstimatedPercent;
  x.Cells.Item[i1,18].value := c1.getDollarPrice;
  x.Cells.Item[i1,19].value := c1.getEstimatedAmountInDollar;
  x.Cells.Item[i1,20].value := c1.getSpecialAction;
  x.Cells.Item[i1,21].value := c1.getContractTypeGroup;
  }
end;

procedure ADOcontract.addXHead(i1: Integer);
begin
{
  x.Cells.Item[i1,1].value := 'id';
  x.Cells.Item[i1,2].value := 'idParentContract';
  x.Cells.Item[i1,3].value := 'Id_deliverer';
  x.Cells.Item[i1,4].value := 'Num_of_day';
  x.Cells.Item[i1,5].value := 'loan_amount';
  x.Cells.Item[i1,6].value := 'estimated_amount';
  x.Cells.Item[i1,7].value := 'contract_number';
  x.Cells.Item[i1,8].value := 'date_begin';
  x.Cells.Item[i1,9].value := 'date_end';
  x.Cells.Item[i1,10].value := 'con_percent';
  x.Cells.Item[i1,11].value := 'amount_ref';
  x.Cells.Item[i1,12].value := 'con_status';
  x.Cells.Item[i1,13].value := 'sum_percent';
  x.Cells.Item[i1,14].value := 'idEmployee';
  x.Cells.Item[i1,15].value := 'DateClose';
  x.Cells.Item[i1,16].value := 'SpecialCondition';
  x.Cells.Item[i1,17].value := 'EstimatedPercent';
  x.Cells.Item[i1,18].value := 'DollarPrice';
  x.Cells.Item[i1,19].value := 'AstimatedAmountInDollar';
  x.Cells.Item[i1,20].value := 'SpecialAction';
  x.Cells.Item[i1,21].value := 'contractTypeGroup';
  }
end;

function ADOcontract.ARRgetcontractByDelivererId(idDeliverer : Integer): TENcontract;
var
  i : Integer;
  q1 : TADOQuery;
  sql1 : String;
  cc1 : TENcontract;
  count : Integer;
  cca : ADOcontract;
  ooa : ADOoperation;
  idContract : Integer;
begin
  cca := ADOcontract.Create;
  cc1 := TENcontract.Create;
  ooa := ADOoperation.Create;
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := danado.utils.getConnectionString;
  sql1 := 'SELECT count(id) as row FROM contract_info WHERE id_deliverer =:pIdDeliverer';
  q1.SQL.Add(sql1);
  q1.Parameters.ParamByName('pIdDeliverer').Value  := idDeliverer;
  q1.Open;
  cc1.count := q1.FieldByName('row').AsInteger;;
  if (cc1.count > 0 )  then  begin
    setLength(cc1.c, cc1.count);
    q1.Close;
    q1.SQL.Clear;

    i := 0;
    sql1 := 'SELECT id FROM contract_info WHERE id_deliverer =:pIdDeliverer ORDER by id ASC';
    q1.SQL.Add(sql1);
    q1.Parameters.ParamByName('pIdDeliverer').Value  := idDeliverer;
    with q1 do begin
      q1.Open;
      while not eof do begin
          idContract := q1.FieldByName('id').AsInteger;
          cc1.c[i] := TENcontract2.Create;
          //cc1.c[i] := cca.getContractById(idContract);
          cc1.c[i].operation := ooa.getOperationByIdContract(idContract);
          // cca.show(cc1.c[i]);
          inc(i);
        next;
      end;
    end;
  end;
  //cc1.Destroy;
  cca.Destroy;
  ooa.Destroy;
  q1.Destroy;
  RESULT := cc1;
end;

procedure ADOcontract.closeContractInfo(id1: Integer; date1: TDAte);
var
  q1 : TADOQuery;
  sql1 : String;
  dateToday : String;
begin
  dateToday := DateToStr(date1);
  q1 := TADOQUery.Create(nil);
  q1.ConnectionString := utils.getConnectionString;
  sql1 := 'UPDATE contract_info SET con_status=0, DateClose=:pDateClose1 WHERE id=:pId1';
  q1.SQL.Add(sql1);
  q1.Parameters.ParamByName('pId1').Value := id1;
  q1.Parameters.ParamByName('pDateClose1').Value := dateToday;
  try
  q1.ExecSQL;
    Except on e: Exception do begin
      ShowMessage('НЕ Удалось Обновить Договор');
    end;
  end;
  q1.Destroy;
end;

function ADOcontract.fill(q1: TADOQuery): TENcontract2;
var
  c1 : TENContract2;
begin
    c1 := TENcontract2.Create;
  if (q1.FieldByName('id').AsVariant = Null) then c1.id := (0)
    else c1.id := (q1.FieldByName('id').AsInteger);
  if (q1.FieldByName('IdParentContract').AsVariant = Null) then c1.idParentContract := (0)
    else c1.idParentContract := (q1.FieldByName('IdParentContract').AsInteger);
  if (q1.FieldByName('Id_deliverer').AsVariant = Null) then c1.idDeliverer := 0
    else c1.idDeliverer := q1.FieldByName('Id_deliverer').AsInteger;
  if (q1.FieldByName('Num_of_day').AsVariant = Null) then c1.numOfDay := 0
    else c1.numOfDay := (q1.FieldByName('Num_of_day').AsInteger);
  if (q1.FieldByName('Id_employee').AsVariant = Null) then  c1.idEmployee := (0)
    else c1.idEmployee := (q1.FieldByName('Id_employee').AsInteger);
  if (q1.FieldByName('ContractTypeGroup').AsVariant = Null) then c1.contractTypeGroup := (0)
    else c1.contractTypeGroup :=(q1.FieldByName('ContractTypeGroup').AsInteger);
  if (q1.FieldByName('Loan_amount').AsVariant = Null) then c1.loanAmount := 0
    else c1.loanAmount := (q1.FieldByName('Loan_amount').AsFloat);
  if (q1.FieldByName('Estimated_amount').AsVariant = Null) then c1.estimatedAmount := 0
    else c1.estimatedAmount := (q1.FieldByName('Estimated_amount').AsFloat);
  if (q1.FieldByName('Con_percent').AsVariant = Null) then c1.conPercent := 0
    else c1.conPercent := (q1.FieldByName('Con_percent').AsFloat);
  if (q1.FieldByName('Amount_ref').AsVariant = Null) then c1.amountRef := 0
    else c1.amountRef := (q1.FieldByName('Amount_ref').AsFloat);
  if (q1.FieldByName('Sum_percent').AsVariant = Null) then c1.sumPercent := 0
    else c1.sumPercent := (q1.FieldByName('Sum_percent').AsFloat);
  if (q1.FieldByName('EstimatedPercent').AsVariant = Null) then c1.estimatedPercent := (0)
    else c1.estimatedPercent := (q1.FieldByName('EstimatedPercent').AsFloat);
  if (q1.FieldByName('DollarPrice').AsVariant = Null) then c1.dollarPrice := (0)
    else c1.dollarPrice := (q1.FieldByName('DollarPrice').AsFloat);
  if (q1.FieldByName('EstimatedAmountInDollar').AsVariant = Null) then c1.estimatedAmountInDollar := (0)
    else c1.estimatedAmountInDollar := (q1.FieldByName('EstimatedAmountInDollar').AsFloat);
  if (q1.FieldByName('SpecialAction').AsVariant = Null) then c1.specialAction := (0)
    else c1.specialAction := (q1.FieldByName('SpecialAction').AsFloat);
  if (q1.FieldByName('Contract_number').AsVariant = Null) then c1.contractNumber := '0'
    else c1.contractNumber := (q1.FieldByName('Contract_number').AsString);
  if (q1.FieldByName('Date_begin').AsVariant = Null) then c1.dateBegin := '01/01/1988'
    else c1.dateBegin := (q1.FieldByName('Date_begin').AsString);
  if (q1.FieldByName('Date_end').AsVariant = Null) then c1.dateEnd := '01/01/1988'
    else c1.dateEnd := (q1.FieldByName('Date_end').AsString);
  if (q1.FieldByName('DateClose').AsVariant = Null) then c1.dateClose := (' ')
    else c1.dateClose := (q1.FieldByName('DateClose').AsString);
  if (q1.FieldByName('Con_status').AsVariant = Null) then c1.conStatus := (false)
    else c1.conStatus := (q1.FieldByName('Con_status').AsBoolean);
  if (q1.FieldByName('SpecialCondition').AsVariant = Null) then  c1.specialCondition := (false)
    else c1.specialCondition := (q1.FieldByName('SpecialCondition').AsBoolean);
  if (q1.FieldByName('arrears').AsVariant = Null) then c1.arrears := (false)
    else c1.arrears := (q1.FieldByName('arrears').AsBoolean);
  RESULT := c1;
end;

function ADOcontract.getConStatusById(id1: Integer): boolean;
var
  q1 : TADOQuery;
  sql1 : String;
  res : Boolean;
begin
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := utils.getConnectionString;
  sql1 := 'SELECT con_status FROM contract_info WHERE id = :pId';
  q1.SQL.Add(sql1);
  q1.Parameters.ParamByName('pId').Value := id1;
  q1.Open;
  res := q1.FieldByName('con_status').AsBoolean;
  q1.Destroy;
  RESULT := res;
end;

function ADOcontract.getContractById(idContract1: Integer): TENcontract2;
var
  q13 : TADOQuery;
  sql1 : String;
  contract1 : TENcontract2;
begin
  contract1 := TENContract2.Create;
  q13 := TADOQuery.Create(nil);
  q13.ConnectionString:= utils.getConnectionString;
  sql1 := 'SELECT * FROM contract_info WHERE id=:pid_contract';
  q13.SQL.Add(sql1);
  q13.Parameters.ParamByName('pid_contract').Value := idContract1;
  q13.Open;
  contract1 := fill(q13);
  q13.Destroy;
  RESULT := contract1;
end;

function ADOcontract.getContractByNumber(contract_number1: String): TENcontract2;
var
  q1 : TADOQuery;
  sql1 : String;
  contract1 : TENcontract2;
begin
  contract1 := TENContract2.Create;
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString:= utils.getConnectionString;
  sql1 := 'SELECT * FROM contract_info WHERE contract_number = :pContract_number';
  q1.SQL.Add(sql1);
  q1.Parameters.ParamByName('pContract_number').Value := contract_number1;
  try
    q1.Open;
    contract1 := contract.fill(q1);
    q1.Destroy;
  finally
    RESULT := contract1;
  end;
    RESULT := contract1;
end;





function ADOcontract.getContractPreRepawnByIdContract(
  id1: Integer): Integer;
var
  q1 : TADOQuery;
  sql1 : String;
  res : Integer;


begin
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := utils.getConnectionString;

  sql1 := 'SELECT id FROM contract_info WHERE idParentContract =:pId ORDER by id DESC';
  q1.SQL.Add(sql1);
  q1.Parameters.ParamByName('pId').Value := id1;
  q1.Open;

  if (q1.RecordCount > 1) then begin
    with q1 do begin
      try
        next;
        res := q1.FieldByName('id').AsInteger;
       except on e: exception do begin
        res := 0;
       end;
      end;
    end;
  end else begin
     res := 0;
  end;
  RESULT := res;
end;

procedure ADOcontract.show(c1: TENcontract2);
begin
 // form4.ContractGrid.Col := 23;
 // form4.ContractGrid.Row := 2;
  form7.ContractGrid.Cells[0,0] := 'id';
  form7.ContractGrid.Cells[1,0] := 'idParentContract';
  form7.ContractGrid.Cells[2,0] := 'id_deliverer';
  form7.ContractGrid.Cells[3,0] := 'num_of_day';
  form7.ContractGrid.Cells[4,0] := 'loan_amount';
  form7.ContractGrid.Cells[5,0] := 'estimated_amount';
  form7.ContractGrid.Cells[6,0] := 'contract_number';
  form7.ContractGrid.Cells[7,0] := 'date_begin';
  form7.ContractGrid.Cells[8,0] := 'date_end';
  form7.ContractGrid.Cells[9,0] := 'con_percent';
  form7.ContractGrid.Cells[10,0] := 'amount_ref';
  form7.ContractGrid.Cells[11,0] := 'con_status';
  form7.ContractGrid.Cells[12,0] := 'sum_percent';
  form7.ContractGrid.Cells[13,0] := 'idEmployee';
  form7.ContractGrid.Cells[14,0] := 'DateClose';
  form7.ContractGrid.Cells[15,0] := 'SpecialCondition';
  form7.ContractGrid.Cells[16,0] := 'EstimatedPercent';
  form7.ContractGrid.Cells[17,0] := 'DollarPrice';
  form7.ContractGrid.Cells[18,0] := 'AstimatedAmountInDollar';
  form7.ContractGrid.Cells[19,0] := 'SpecialAction';
  form7.ContractGrid.Cells[20,0] := 'contractTypeGroup';
  form7.ContractGrid.Cells[0,1] := IntToStr(c1.id);
  form7.ContractGrid.Cells[1,1] := IntToStr(c1.idParentContract);
  {
  form7.ContractGrid.Cells[2,1] := IntToStr(c1.getId_Deliverer);
  form7.ContractGrid.Cells[3,1] := IntToStr(c1.getNum_of_day);
  form7.ContractGrid.Cells[4,1] := FloatToStr(c1.getLoan_amount);
  form7.ContractGrid.Cells[5,1] := FloatToStr(c1.getEstimated_amount);
  form7.ContractGrid.Cells[6,1] := c1.getContract_number;
  form7.ContractGrid.Cells[7,1] := c1.getDate_begin;
  form7.ContractGrid.Cells[8,1] := c1.getDate_end;
  form7.ContractGrid.Cells[9,1] := FloatTostr(c1.getCon_percent);
  form7.ContractGrid.Cells[10,1] := FloatToStr(c1.getAmount_ref);
  form7.ContractGrid.Cells[11,1] := BoolToStr(c1.getCon_status);
  form7.ContractGrid.Cells[12,1] := FloatToStr(c1.getSum_percent);
  form7.ContractGrid.Cells[13,1] := IntToStr(c1.getIdEmployee);
  form7.ContractGrid.Cells[14,1] := c1.getDateClose;
  form7.ContractGrid.Cells[15,1] := BoolToStr(c1.getSpecialCondition);
  form7.ContractGrid.Cells[16,1] := FloatToStr(c1.getEstimatedPercent);
  form7.ContractGrid.Cells[17,1] := FloatToStr(c1.getDollarPrice);
  form7.ContractGrid.Cells[18,1] := FloatToStr(c1.getEstimatedAmountInDollar);
  form7.ContractGrid.Cells[19,1] := FloatToStr(c1.getSpecialAction);
  form7.ContractGrid.Cells[20,1] := IntToStr(c1.getContractTypeGroup);
  }
  form7.ShowModal;
end;
procedure ADOcontract.showMe;
begin
//
end;

{ TForm4 }

procedure TForm7.FormCreate(Sender: TObject);
begin
  //X := CreateOleobject('Excel.Application');
 // X.WorkBooks.Add('C:\mainPawn\report\x.xlsx');
 // x.DisplayAlerts := false;
end;

procedure TForm7.showMe;
begin
//

end;

{ tado }

function tado.calculateSummBetweenDays(days : Integer; Summ1 : Double;
  percent1: Double): Double;
var
  res : Double;
begin
  res := round((Summ1 * days * percent1) * 100)/100;
  RESULT := res;
end;

function tado.getCode_filial: Integer;
var
  q1 : TADOQuery;
  sql1 : String;
  res : Integer;
begin
  q1 := TADOQuery.create(nil);
  q1.connectionString := getConnectionString;

  sql1 := 'SELECT num_filial FROM pasport';
  q1.SQL.Add(sql1);
  q1.Open;

  res := q1.FieldByName('num_filial').AsInteger;
  q1.close;
  q1.destroy;

  RESULT := res;
end;

function tado.getConnectionString: String;
var
  myKey : Boolean;
  res : String;
  loMDBPath : String;
begin
  myKey := false;
  iniFile := TIniFile.Create('c:\pawn\options.ini');
  loMDBPath := iniFile.ReadString('pathBD','str','C:\pawn\data\lo.mdb');
  iniFile.Destroy;
    if (loMDBPath = '') then begin
      loMDBPath := 'C:\pawn\data\lo.mdb';
    end;

 // ShowMessage(loMDBPath);

if (loMDBPath <> '') then begin
    res := 'Provider=Microsoft.Jet.OLEDB.4.0;'+
    'User ID=Admin;Data Source='+loMDBPath+';Mode=Share Deny None;'+
    'Jet OLEDB:System database="";Jet OLEDB:Registry Path="";'+
    'Jet OLEDB:Database Password="pep01PER";Jet OLEDB:Engine Type=5;'+
    'Jet OLEDB:Database Locking Mode=1;Jet OLEDB:Global Partial Bulk Ops=2;'+
    'Jet OLEDB:Global Bulk Transactions=1;Jet OLEDB:New Database Password="";'+
    'Jet OLEDB:Create System Database=False;Jet OLEDB:Encrypt Database=False;'+
    'Jet OLEDB:Don''t Copy Locale on Compact=False;'+
    'Jet OLEDB:Compact Without Replica Repair=False;Jet OLEDB:SFP=False;';
end;
     RESULT := res;
end;





function tado.getEmployeeNameByID(id1: Integer): String;
var
  q1 : TADOQuery;
  sql1 : String;
  res : String;
begin
  q1 := TADOQuery.create(nil);
  q1.connectionString := DANADO.utils.getConnectionString;
  sql1 := 'SELECT name FROM employee WHERE id=:pId';
  q1.sql.add(sql1);
  q1.parameters.paramByName('pId').value := id1;
  q1.Open;
  res := q1.FieldByName('name').asstring;
  q1.close;
  q1.destroy;
  RESULT := res;
end;

{ Toperation }
  {
function ADOoperation.fill(q1: TADOQuery): TENoperation;
var
  res : TENoperation;
  i : Integer;
begin
  res := TENoperation.Create;
  for i := 0 to 11 do begin
    res.o[i] := TENoperation2.Create;
  end;
  res.count := 0;
  i := 0;
  with q1 do begin
    q1.Open;
    while not eof  do begin
      res.o[i].setId(q1.FieldByName('id').AsInteger);
   if (q1.FieldByName('id').AsVariant = NULL) then res.o[i].setId(0)
    else  res.o[i].setId(q1.FieldByName('id').AsInteger);
  if (q1.FieldByName('op').AsVariant = NULL) then  res.o[i].setOp(0)
    else res.o[i].setOp(q1.FieldByName('op').AsInteger);
  if (q1.FieldByName('id_contract_op').AsVariant = NULL) then res.o[i].setId_contract_op(0)
    else res.o[i].setId_contract_op(q1.FieldByName('id_contract_op').AsInteger);
  if (q1.FieldByName('date_op').AsVariant = NULL) then res.o[i].setDate_op(01/01/1988)
    else  res.o[i].setDate_op(q1.FieldByName('date_op').AsDateTime);
  if (q1.FieldByName('sum_op').AsVariant = NULL) then  res.o[i].setSum_op(0.0)
    else  res.o[i].setSum_op(q1.FieldByName('sum_op').AsFloat);
  if (q1.FieldByName('percent_op').AsVariant = NULL) then res.o[i].setPercent_op(0.0)
    else  res.o[i].setPercent_op(q1.FieldByName('percent_op').AsFloat);
  if (q1.FieldByName('delay_op').AsVariant = NULL) then res.o[i].setDelay_op(0.0)
    else  res.o[i].setDelay_op(q1.FieldByName('delay_op').AsFloat);
  if (q1.FieldByName('TimestampField').AsVariant = NULL) then res.o[i].setTimestampField(0.0)
    else  res.o[i].setTimestampField(q1.FieldByName('TimestampField').AsDateTime);
      inc(i);
      res.count := i;
      next;
    end;
  end;
RESULT := res;



end;
}

function ADOoperation.fill(q1: TADOQuery): TENOperation2;
var
  res : TENoperation2;
begin
  res := TENoperation2.create;
   res.setId(q1.FieldByName('id').AsInteger);
   if (q1.FieldByName('id').AsVariant = NULL) then res.setId(0)
    else  res.setId(q1.FieldByName('id').AsInteger);
  if (q1.FieldByName('op').AsVariant = NULL) then  res.setOp(0)
    else res.setOp(q1.FieldByName('op').AsInteger);
  if (q1.FieldByName('id_contract_op').AsVariant = NULL) then res.setId_contract_op(0)
    else res.setId_contract_op(q1.FieldByName('id_contract_op').AsInteger);
  if (q1.FieldByName('date_op').AsVariant = NULL) then res.setDate_op(01/01/1988)
    else  res.setDate_op(q1.FieldByName('date_op').AsDateTime);
  if (q1.FieldByName('sum_op').AsVariant = NULL) then  res.setSum_op(0.0)
    else  res.setSum_op(q1.FieldByName('sum_op').AsFloat);
  if (q1.FieldByName('percent_op').AsVariant = NULL) then res.setPercent_op(0.0)
    else  res.setPercent_op(q1.FieldByName('percent_op').AsFloat);
  if (q1.FieldByName('delay_op').AsVariant = NULL) then res.setDelay_op(0.0)
    else  res.setDelay_op(q1.FieldByName('delay_op').AsFloat);
  if (q1.FieldByName('TimestampField').AsVariant = NULL) then res.setTimestampField(0.0)
    else  res.setTimestampField(q1.FieldByName('TimestampField').AsDateTime);
  RESULT := res;
end;

function ADOoperation.getOperationByDateAndCodeFilial(dateOperation: String;
  codeFilial: Integer): TENoperation;
var
  q1 : TADOQuery;
  sql1 : String;
begin

end;

function ADOoperation.getOperationById(id1: Integer): TENoperation2;
var
  res : TENoperation2;
  q1 : TADOQuery;
  sql1 : String;
begin
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := utils.getConnectionString;
  sql1 := 'SELECT * FROM operation WHERE id=:pId';
  q1.SQL.Add(sql1);
  q1.Parameters.ParamByName('pId').Value := id1;
  q1.Open;
  res := fill(q1);
  q1.Destroy;
  RESULT := res;

end;

function ADOoperation.getOperationByIdContract(
  id_contract_op1: Integer): TENoperation;
var
  q1 : TADOQuery;
  sql1 : String;
  o1 : TENoperation;
begin
  o1 := TENoperation.Create;
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := utils.getConnectionString;
  sql1 := 'SELECT * FROM operation WHERE id_contract_op =:pId_contract_op';
  q1.SQL.Add(sql1);
  q1.Parameters.ParamByName('pId_contract_op').Value := id_contract_op1;
  q1.Open;
  //o1 := operation.fill(q1) ;
  q1.Destroy;
  RESULT := o1;
end;

function ADOoperation.getSUMopByIdDelivererANDop(idDeliverer,
  op: Integer): TENoperation;
begin
  //
end;



procedure ADOoperation.insertCloseOp(idContract1: Integer; summOp, percentOp,
  DelayOp: Double; dateClose1: TDate);
var
  q1 : TADOQuery;
  sql1 : String;
  dateToday : String;
begin
  dateToday := DateToStr(dateClose1);
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := utils.getConnectionString;

  sql1 := 'INSERT INTO operation (op,date_op,sum_op,id_contract_op,percent_op,delay_op) VALUES (2,:pDate,:pSummOp,:pId,:pPercentOp,:pDelayOp)';
  q1.SQL.Add(sql1);
  q1.Parameters.ParamByName('pDate').Value := dateToday;
  q1.Parameters.ParamByName('pSummOp').Value := summOp;
  q1.Parameters.ParamByName('pId').Value := idContract1;
  q1.Parameters.ParamByName('pPercentOp').Value := percentOp;
  q1.Parameters.ParamByName('pDelayOp').Value := DelayOp;
  try
   q1.ExecSQL;
    except on e: exception do begin
      Showmessage('Не удалось добавить операцию!');
    end;
  end;
  q1.Destroy;  //
end;

procedure ADOoperation.show(o1 : TENoperation);
var
  i : Integer;
begin
  i := 0;
  form7.OperationGrid.RowCount := o1.count+1;
  form7.OperationGrid.Cells[0,0] := 'id';
  form7.OperationGrid.Cells[1,0] := 'op';
  form7.OperationGrid.Cells[2,0] := 'date_op';
  form7.OperationGrid.Cells[3,0] := 'id_contract_op';
  form7.OperationGrid.Cells[4,0] := 'sum_op';
  form7.OperationGrid.Cells[5,0] := 'percent_op';
  form7.OperationGrid.Cells[6,0] := 'delay_op';
  form7.OperationGrid.Cells[7,0] := 'TimeStampField';
  for i := 0 to o1.count-1 do begin
    form7.OperationGrid.Cells[0,i+1] := IntToStr(o1.o[i].getId);
    form7.OperationGrid.Cells[1,i+1] := IntToStr(o1.o[i].getOp);
    form7.OperationGrid.Cells[2,i+1] := DateToStr(o1.o[i].getDate_op);
    form7.OperationGrid.Cells[3,i+1] := IntToStr(o1.o[i].getId_contract_op);
    form7.OperationGrid.Cells[4,i+1] := FloatToStr(o1.o[i].getSum_op);
    form7.OperationGrid.Cells[5,i+1] := FloatToStr(o1.o[i].getPercent_op);
    form7.OperationGrid.Cells[6,i+1] := FloatToStr(o1.o[i].getDelay_op);
    form7.OperationGrid.Cells[7,i+1] := DateTimeToStr(o1.o[i].getTimeStampField);
  end;
end;

function ADOoperation.sumSUM(dd1: TENdeliverer): TENDeliverer;
begin

end;

{ TproductInfo }

procedure ADOproductInfo.addProductByIdContract(p1: TENproduct; id1: Integer);
var
  q1 : TADOQUery;
  sql1 : String;
  i : Integer;
begin
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := utils.getConnectionString;
  i := 0;
  
  for i :=0 to p1.count-1 do begin
    if (p1.p[i].productStatus = true) then begin
      sql1 := 'INSERT INTO product_info (product,metal,num,test,price,weight,weight_net,estimated_amount,id_contract,product_status,SerialNumber,weight_piece)';
      sql1 := sql1 + ' VALUES (:pProduct,:pMetal,:pNum,:pTest,:pPrice,:pWeight,:pWeightNet,:pEstimatedAmount,:pIdContract,:pProductStatus,:pSerialNumber,:pWeightPiece)';
      q1.SQL.Add(sql1);
      q1.Parameters.ParamByName('pProduct').Value := p1.p[i].product;
      q1.Parameters.ParamByName('pMetal').Value := p1.p[i].metal;
      q1.Parameters.ParamByName('pNum').Value := p1.p[i].num;
      q1.Parameters.ParamByName('pTest').Value := p1.p[i].test;
      q1.Parameters.ParamByName('pPrice').Value := p1.p[i].price;
      q1.Parameters.ParamByName('pWeight').Value := p1.p[i].weight;
      q1.Parameters.ParamByName('pWeightNet').Value := p1.p[i].weightNet;
      q1.Parameters.ParamByName('pEstimatedAmount').Value := p1.p[i].estimatedAmount;
      q1.Parameters.ParamByName('pIdContract').Value := p1.p[i].idContract;
      q1.Parameters.ParamByName('pProductStatus').Value := p1.p[i].productStatus;
      q1.Parameters.ParamByName('pSerialNumber').Value := p1.p[i].serialNumber;
      q1.Parameters.ParamByName('pWeightPiece').Value := p1.p[i].weightPiece;
      q1.ExecSQL;
      q1.SQL.Clear;
    end;
    
  end;
  q1.Destroy;
end;

function ADOproductInfo.changeIdContract(p1: TENProduct;
  idContract1: Integer): TENProduct;
var
  i : Integer;
begin
  for i := 0 to p1.count-1   do  begin
    p1.p[i].idContract := idContract1;  
  end;
  RESULT := p1;
end;

function ADOproductInfo.changeProductStatusById(p1: TENProduct;
  id1: Integer; status1 : Boolean): TENProduct;
var
  i : Integer;
begin
  for i := 0 to p1.count-1   do  begin
    if (p1.p[i].id = id1) then begin
      p1.p[i].productStatus := status1;    
    end;
  end;  
  RESULT := p1;
end;

procedure ADOproductInfo.closeProductInfo(idContract1: Integer);
var
  q1 : TADOQuery;
  sql1 : String;
  dateToday : String;
begin
  q1 := TADOQUery.Create(nil);
  q1.ConnectionString := utils.getConnectionString;
  sql1 := 'UPDATE product_info SET product_status=0 WHERE id_contract=:pId1';
  q1.SQL.Add(sql1);
  q1.Parameters.ParamByName('pId1').Value := idContract1;
  try
  q1.ExecSQL;
    Except on e: Exception do begin
      ShowMessage('НЕ Удалось Обновить продукт');
    end;
  end;
  q1.Destroy;
end;

function ADOproductInfo.fillArrProduct(p1: TENproduct; q1: TADOQuery): TENproduct;
begin
 //
end;

function ADOproductInfo.getProductByIdContract(id_contract1 : Integer): TENproduct;
var
  q1 : TADOQuery;
  sql1 : String;
  res : TENproduct;
  i : Integer;
  selfWeightNet : Double;
begin
  selfWeightNet := 0;
  res := TENproduct.Create;
  for i := 0 to 11 do begin
    res.p[i] := TENproduct2.Create;
  end;
  res.count := 0;
  i := 0;
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := DANado.utils.getConnectionString;
  sql1 := 'SELECT * FROM product_info WHERE id_contract =:pId_contract ORDER BY id ASC';
  q1.SQL.Add(sql1);
  q1.Parameters.ParamByName('pId_contract').Value := id_contract1;
  with q1 do begin
    q1.Open;
    while not eof  do begin
      res.p[i].id := (q1.FieldByName('id').AsInteger);
      res.p[i].num := (q1.FieldByName('num').AsInteger);
      res.p[i].test := (q1.FieldByName('test').AsInteger);
      res.p[i].idContract := (q1.FieldByName('id_contract').AsInteger);
      res.p[i].product := (q1.FieldByName('product').AsString);
      res.p[i].metal := (q1.FieldByName('metal').AsString);
      res.p[i].price := (q1.FieldByName('price').AsFloat);
      try
      res.p[i].weight := (q1.FieldByName('weight').AsFloat);
      except on e: exception do begin
      res.p[i].weight := (0);
      end;
      end;
      try
      res.p[i].weightPiece := (q1.FieldByName('weight_piece').AsFloat);
      except on e: exception do begin
      res.p[i].weightPiece := (0);
      end;
      end;
      try
      res.p[i].weightNet := (q1.FieldByName('weight_net').AsFloat);
      except on e: exception do begin
      res.p[i].weightNet := (0);
      end;
      end;
      try
      selfWeightNet := selfWeightNet + q1.FieldByName('weight_net').AsFloat;
      except on e: exception do begin
      selfWeightNet := selfWeightNet +0;
      end;
      end;
      res.p[i].estimatedAmount := (q1.FieldByName('estimated_amount').AsFloat);
      try
      res.p[i].serialNumber := q1.FieldByName('SerialNumber').AsString;
      except on e: exception do begin
      res.p[i].serialNumber := '';
      end;
      end;
      res.p[i].productStatus := (q1.FieldByName('product_status').AsBoolean);
      inc(i);
      res.count := i;
      next;
    end;
  end;
  res.weightNet := selfWeightNet;
RESULT := res;
end;

procedure ADOproductInfo.show(p1: TENproduct);
var
  i : Integer;
begin
  //form7.ContractGrid.Hide;
  form7.ProductGrid.Show;
  form7.ProductGrid.RowCount := p1.count+1;
  form7.ProductGrid.Cells[0,0] := 'id';
  form7.ProductGrid.Cells[1,0] := 'product';
  form7.ProductGrid.Cells[2,0] := 'metal';
  form7.ProductGrid.Cells[3,0] := 'num';
  form7.ProductGrid.Cells[4,0] := 'test';
  form7.ProductGrid.Cells[5,0] := 'price';
  form7.ProductGrid.Cells[6,0] := 'weight';
  form7.ProductGrid.Cells[7,0] := 'weight_piece';
  form7.ProductGrid.Cells[8,0] := 'weight_net';
  form7.ProductGrid.Cells[9,0] := 'estimated_amount';
  form7.ProductGrid.Cells[10,0] := 'id_contract';
  form7.ProductGrid.Cells[11,0] := 'product_status';
  form7.ProductGrid.Cells[12,0] := 'SerialNumber';
  for i := 0 to p1.count-1 do begin
    form7.ProductGrid.Cells[0,i+1] := IntToStr(p1.p[i].id);
    form7.ProductGrid.Cells[1,i+1] := p1.p[i].product;
    form7.ProductGrid.Cells[2,i+1] := p1.p[i].metal;
    form7.ProductGrid.Cells[3,i+1] := IntToStr(p1.p[i].num);
    form7.ProductGrid.Cells[4,i+1] := IntToStr(p1.p[i].test);
    form7.ProductGrid.Cells[5,i+1] := FloatToStr(p1.p[i].price);
    form7.ProductGrid.Cells[6,i+1] := FloatToStr(p1.p[i].weight);
    form7.ProductGrid.Cells[7,i+1] := FloatToStr(p1.p[i].weightPiece);
    form7.ProductGrid.Cells[8,i+1] := FloatToStr(p1.p[i].weightNet);
    form7.ProductGrid.Cells[9,i+1] := FloatToStr(p1.p[i].estimatedAmount);
    form7.ProductGrid.Cells[10,i+1] := IntToStr(p1.p[i].idContract);
    form7.ProductGrid.Cells[11,i+1] := BoolToStr(p1.p[i].productStatus);
    form7.ProductGrid.Cells[12,i+1] := p1.p[i].serialNumber;
  end;
end;

{ TDeliverer }

procedure ADODeliverer.checkNewIdTarif(id1: Integer);
var
  deliv1 : TENDeliverer;
  dela1 : ADOdeliverer;
begin
  dela1 := ADOdeliverer.Create;
  deliv1 := dela1.getDelivererById(id1);
  if (deliv1.getId_tarif < 7) then begin
    dela1.setLoyalTarif(deliv1.getId);
  end;
end;

function ADODeliverer.fill(q1: TADOQuery): TENdeliverer;
var
  d1 : TENDeliverer;
begin
  d1 := TENdeliverer.Create;
  if(q1.FieldByName('id').asVariant = NULL) then  d1.setId(0)
    else d1.setId(q1.FieldByName('id').asInteger);
  if(q1.FieldByName('name').asVariant = NULL) then  d1.setName('ADO FILL')
    else d1.setName(q1.FieldByName('name').asString);
  if(q1.FieldByName('date_of_burn').asVariant = NULL) then  d1.setDate_of_burn(now)
    else d1.setDate_of_burn(q1.FieldByName('date_of_burn').asDateTime);
  if(q1.FieldByName('Adress').asVariant = NULL) then  d1.setAdress('-')
    else d1.setAdress(q1.FieldByName('Adress').asString);
    //ShowMessage(d1.getAdress);
  if(q1.FieldByName('pasport_ser').asVariant = NULL) then  d1.setPasport_ser('-')
    else d1.setPasport_ser(q1.FieldByName('Pasport_ser').asString);
  if(q1.FieldByName('Pasport_num').asVariant = NULL) then  d1.setPasport_num('-')
    else d1.setPasport_num(q1.FieldByName('Pasport_num').asString);
  if(q1.FieldByName('Pasport_vydan').asVariant = NULL) then  d1.setPasport_vydan('-')
    else d1.setPasport_vydan(q1.FieldByName('Pasport_vydan').asString);
  if(q1.FieldByName('Pasport_date').asVariant = NULL) then  d1.setPasport_date(now)
    else d1.setPasport_date(q1.FieldByName('Pasport_date').asDateTime);
  if(q1.FieldByName('Inn').asVariant = NULL) then  d1.setInn('-')
    else d1.setInn(q1.FieldByName('Inn').asString);
  if(q1.FieldByName('Id_tarif').asVariant = NULL) then  d1.setId_tarif(0)
    else d1.setId_tarif(q1.FieldByName('Id_tarif').asInteger);
  if(q1.FieldByName('Id_group_of_risk').asVariant = NULL) then  d1.setId_group_of_risk(0)
    else d1.setId_group_of_risk(q1.FieldByName('Id_group_of_risk').asInteger);
  if(q1.FieldByName('Telephon').asVariant = NULL) then  d1.setTelephon('-')
    else d1.setTelephon(q1.FieldByName('Telephon').asString);
  if(q1.FieldByName('CardNumber').asVariant = NULL) then  d1.setCardNumber('-')
    else d1.setCardNumber(q1.FieldByName('CardNumber').asString);
  if(q1.FieldByName('CardType').asVariant = NULL) then  d1.setCardType('-')
    else d1.setCardType(q1.FieldByName('CardType').asString);
  if(q1.FieldByName('DateAdd').asVariant = NULL) then  d1.setDateAdd(now-500)
    else d1.setDateAdd(q1.FieldByName('DateAdd').asDateTime);
 RESULT := d1;
end;

function ADODeliverer.getDelivererById(id1: Integer): TENdeliverer;
var
  q1 : TADOQuery;
  sql1 : String;
  deliv1 : TENdeliverer;
begin
  deliv1 := TENdeliverer.Create;
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := danado.utils.getConnectionString;
  sql1 := 'SELECT * FROM deliverer WHERE id=:pId';
  q1.SQL.Add(sql1);
  q1.Parameters.ParamByName('pId').Value := id1;
  q1.Open;
  deliv1 := fill(q1);
  q1.Destroy;
  RESULT := deliv1;
end;

function ADODeliverer.getIdDelivererByIdContract(idContract : Integer): Integer;
var
  q1 : TADOQuery;
  sql1 : String;
  res : Integer;
begin
  res := 0;
  q1 := TADOQuery.create(nil);
  q1.ConnectionString := utils.getConnectionString;

  sql1 := 'SELECT id_deliverer FROM contract_info WHERE id = :pId';
  q1.sql.add(sql1);
  q1.parameters.paramByName('pId').value := idContract;
  q1.Open;

  if (q1.REcordCount = 1) then res := q1.FieldByName('id_deliverer').asInteger;

  RESULT := res;
end;

function ADODeliverer.getLoyalTarifByIdDeliverer(id1: Integer): tenTarif;
begin
//
end;

function ADODeliverer.getMagicTarif(oldT, newT: tenTarif;
  idTarif: Integer): TENTarif;
begin
  if (idTarif < 7) then begin
  //
  end else begin
    if ((idTarif = 7) OR (idTarif = 8)) then begin
      if (StrToFloat(newT.getPercent) <> 0) then oldT.setPercent(FloatToStr(StrToFloat(oldT.getPercent)-StrToFloat(newT.getPercent)));
      if (StrToFloat(newT.getTestPrice) <> 0) then oldT.setTestPrice(FloatToStr(StrToFloat(oldT.getTestPrice)+StrToFloat(newT.getTestPrice)));
    end else begin
      if (idTarif = 9) then begin
        if (StrToFloat(newT.getPercent) <> 0) then oldT.setPercent(newT.getPercent);
        if (StrToFloat(newT.getTestPrice) <> 0) then oldT.setTestPrice(newT.getTestPrice);
      end;
    end;
  end;
  RESULT := oldT;
end;

function ADODeliverer.getPercentAndDelayByIdDeliverer(id1: Integer): Double;
var
  q1 : TADOQuery;
  sql1 : String;
  res : Double;
begin
  q1 := TADOQUery.Create(nil);
  q1.ConnectionString := DANADO.utils.getConnectionString;
  sql1 := 'SELECT Sum(operation.percent_op+operation.delay_op) AS res '
  + 'FROM (deliverer INNER JOIN contract_info ON deliverer.id = contract_info.id_deliverer) '
  + 'INNER JOIN operation ON contract_info.id = operation.id_contract_op '
  + 'WHERE (((operation.op)=2)) AND (((deliverer.id)=:id))  '
  + 'GROUP BY deliverer.id, deliverer.id';
  q1.SQL.Add(sql1);
  q1.Parameters.ParamByName('id').Value := id1;
  q1.Open;
  res := q1.FieldByName('res').AsFloat;
  RESULT := res;
end;

procedure ADODeliverer.setLoyalTarif(id1: Integer);
var
  deliv : TENDeliverer;
  dela : ADOdeliverer;
  loyal : Double;
begin
  dela := ADOdeliverer.Create;
  deliv := dela.getDelivererById(id1);
  if (deliv.getId_tarif = 9) then begin
   //
  end else begin
    loyal := dela.getPercentAndDelayByIdDeliverer(deliv.getId);
    if (loyal >= 2000)  then begin

      updateIDtarif(deliv.getId,8);
    end else begin
      if (loyal >=500) then begin

        updateIDtarif(deliv.getId,7);
      end else begin
        updateIDtarif(deliv.getId,0);
      end;
    end;
  end;
end;

procedure ADODeliverer.show(d1: TENdeliverer);
begin
  form7.DelivererGrid.Cells[0,0] := 'id';
  form7.DelivererGrid.Cells[1,0] := 'name';
  form7.DelivererGrid.Cells[2,0] := 'date_of_burn';
  form7.DelivererGrid.Cells[3,0] := 'Adress';
  form7.DelivererGrid.Cells[4,0] := 'pasport_ser';
  form7.DelivererGrid.Cells[5,0] := 'pasport_num';
  form7.DelivererGrid.Cells[6,0] := 'pasport_vydan';
  form7.DelivererGrid.Cells[7,0] := 'pasport_date';
  form7.DelivererGrid.Cells[8,0] := 'inn';
  form7.DelivererGrid.Cells[9,0] := 'id_tarif';
  form7.DelivererGrid.Cells[10,0] := 'id_group_of_risk';
  form7.DelivererGrid.Cells[11,0] := 'telephon';
  form7.DelivererGrid.Cells[12,0] := 'CardNumber';
  form7.DelivererGrid.Cells[13,0] := 'CardType';
  form7.DelivererGrid.Cells[14,0] := 'DateAdd';

  form7.DelivererGrid.Cells[0,1] := IntToStr(d1.getId);
  form7.DelivererGrid.Cells[1,1] := d1.getname;
  form7.DelivererGrid.Cells[2,1] := DateToStr(d1.getdate_of_burn);
  form7.DelivererGrid.Cells[3,1] := d1.getAdress;
  form7.DelivererGrid.Cells[4,1] := d1.getpasport_ser;
  form7.DelivererGrid.Cells[5,1] := d1.getpasport_num;
  form7.DelivererGrid.Cells[6,1] := d1.getpasport_vydan;
  form7.DelivererGrid.Cells[7,1] := DateToStr(d1.getpasport_date);
  form7.DelivererGrid.Cells[8,1] := d1.getinn;
  form7.DelivererGrid.Cells[9,1] := IntToStr(d1.getid_tarif);
  form7.DelivererGrid.Cells[10,1] := IntToStr(d1.getid_group_of_risk);
  form7.DelivererGrid.Cells[11,1] := d1.gettelephon;
  form7.DelivererGrid.Cells[12,1] := d1.getCardNumber;
  form7.DelivererGrid.Cells[13,1] := d1.getCardType;
  form7.DelivererGrid.Cells[14,1] := DateToStr(d1.getDateAdd);

  end;

procedure ADODeliverer.updateIdTarif(idDeliverer, idTarif: Integer);
var
  q1 : TADOQuery;
  sql1 : String;
begin
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := danado.utils.getConnectionString;
  sql1 := 'UPDATE deliverer SET id_tarif = :pIdTarif WHERE id = :pId';
  q1.sql.Add(sql1);
  q1.Parameters.ParamByName('pIdTarif').Value := idTarif;
  q1.Parameters.ParamByName('pId').Value := idDeliverer;
  q1.ExecSQL;
  q1.Close;
 q1.Destroy;
end;



procedure ADODeliverer.UpdateIdTarifByIdTarif(id1, id2: Integer);
var
  q1 : TADOQuery;
  sql1 : String;
begin
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := danado.utils.getConnectionString;
  sql1 := 'UPDATE deliverer SET id_tarif = :id1 WHERE id_tarif = :id2';
  q1.sql.Add(sql1);
  q1.Parameters.ParamByName('id1').Value := id1;
  q1.Parameters.ParamByName('id2').Value := id2;
  q1.ExecSQL;
  q1.Close;
 q1.Destroy;
end;

function tado.getLastId(tableName: String): Integer;
var
  q1 : TADOQuery;
  sql1 : String;
  res : Integer;
begin
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := utils.getConnectionString;
  if (tableName = 'contract_info') then begin
    sql1 := 'SELECT last(id) as res FROM contract_info';
  end;
  if (tableName = 'deliverer') then begin
    sql1 := 'SELECT last(id) as res FROM deliverer';
  end;
  if (tableName = 'eventType') then begin
    sql1 := 'SELECT last(id) as res FROM eventType';
  end;
  if (tableName = 'product_info') then begin
    sql1 := 'SELECT last(id) as res FROM product_info';
  end;
  if (tableName = 'operation') then begin
    sql1 := 'SELECT last(id) as res FROM operation';
  end;
  if (tableName = 'orders') then begin
    sql1 := 'SELECT last(id) as res FROM orders';
  end;
  if (tableName = 'employee') then begin
    sql1 := 'SELECT last(id) as res FROM employee';
  end;
  if (tableName = 'event') then begin
    sql1 := 'SELECT last(id) as res FROM event';
  end;
  q1.SQL.Add(sql1);
  q1.Open;
  res := q1.FieldByName('res').AsInteger;
  q1.Destroy;
  RESULT := res;
end;


function tado.getLombardName: String;
var
  q1 : TADOQuery;
  sql1 : String;
  res : String;
begin
  q1 := TADOQuery.create(nil);
  q1.connectionString := getConnectionString;

  sql1 := 'SELECT name_filial FROM pasport';
  q1.SQL.Add(sql1);
  q1.Open;

  res := q1.FieldByName('name_filial').AsString;
  q1.close;
  q1.destroy;

  RESULT := res;
end;

function tado.getLoyalGroup: Integer;
var
  iniFile : TIniFile;
  res : Integer;
begin
  IniFile := TIniFile.Create('c:\pawn\options.ini');
  res := IniFile.ReadInteger('loyal', 'group', 0);
  RESULT := res;
end;

function tado.getOstatokKassa(DD1: TDateTime): Double;
var
  q1 : TADOQuery;
  sql1 : String;
  DSumComing : Double;
  DD : TDATETIME;
begin
  DD := Now();
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := danado.utils.getConnectionString;
  sql1 :='SELECT SUM(sum_op) FROM operation WHERE date_op<=:Qdate_op AND (op=2 OR op=5)';
  q1.SQL.Add(sql1);
  q1.Parameters.ParamByName('Qdate_op').Value := (DD);
  q1.Open;
  DSumComing := q1.Fields[0].AsFloat;
  DSumComing := round(DSumComing*100)/100;
  q1.SQL.Clear;
  q1.close;
  sql1 := 'SELECT SUM(percent_op) FROM operation WHERE date_op<=:Qdate_op AND (op=2 OR op=5)';
  q1.SQL.Add(sql1);
  q1.Parameters.ParamByName('Qdate_op').Value := (DD);
  q1.Open;
  DSumComing := DSumComing+q1.Fields[0].AsFloat;
  DSumComing := round(DSumComing*100)/100;
  q1.SQL.Clear;
  q1.close;
  q1.SQL.Add('SELECT SUM(delay_op) FROM operation WHERE date_op<=:Qdate_op AND (op=2 OR op=5)');
  q1.Parameters.ParamByName('Qdate_op').Value := (DD);
  q1.Open;
  DSumComing := DSumComing+q1.Fields[0].AsFloat;
  DSumComing := round(DSumComing*100)/100;
  q1.SQL.Clear;
  q1.close;
  q1.SQL.Add('SELECT SUM(sum_op) FROM operation WHERE date_op<=:Qdate_op AND op=10');
  q1.Parameters.ParamByName('Qdate_op').Value := (DD);
  q1.Open;
  DSumComing := DSumComing+q1.Fields[0].AsFloat;
  DSumComing := round(DSumComing*100)/100;
  q1.SQL.Clear;
  q1.close;
  q1.SQL.Add('SELECT SUM(sum_op) FROM operation WHERE date_op<=:Qdate_op AND op=1');
  q1.Parameters.ParamByName('Qdate_op').Value := (DD);
  q1.Open;
  DSumComing := DSumComing-q1.Fields[0].AsFloat;
  DSumComing := round(DSumComing*100)/100;
  q1.SQL.Clear;
  q1.close;
  q1.SQL.Add('SELECT SUM(sum_op) FROM operation WHERE date_op<=:Qdate_op AND op=11');
  q1.Parameters.ParamByName('Qdate_op').Value := (DD);
  q1.Open;
  DSumComing := DSumComing-q1.Fields[0].AsFloat;
  DSumComing := round(DSumComing*100)/100;
  q1.SQL.Clear;
  q1.close;
  RESULT := DSumComing;

end;

{ ADOTarif }

function ADOTarif.getTarifByIdDelivererFromXML(id1: Integer): TenTarif;
var
  newTarif : tenTarif;
  x : IXMLDocument;
  NodeCount : Integer;
  searchNode : String;
  percent : String;
  price : String;
  nodes : IXMLNodeList;
  node : IXMLNode;
  index : Integer;

begin
  percent := '0';
  price := '0';
  searchNode := main.sCodeFilial + IntTostr(id1);
  newTarif := TENtarif.Create;
  x := TXMLDocument.Create(nil);
  x.LoadFromFile('C:\pawn\conf\loyal.xml');
  x.Active := True;
  index := 0;
  nodes := x.DocumentElement.ChildNodes['Loyal'].ChildNodes;

  while (index < nodes.Count) do begin
    node := nodes[index];

    if (node.Attributes['name'] = searchNode) then begin
      percent := VarToStr(node.Attributes['percent']);
      price := VarToStr(node.Attributes['price']);
    end;

    Inc(index);
  end;
  newTarif.setPercent(percent);
  newTarif.setTestPrice(price);
  x.Active := False;
  RESULT := newTarif;
end;

{ ADOLoyalty }

procedure ADOLoyalty.addLoyalty(loyal: TENloyalty);
var
  q2 : TADOQuery;
  sql1 : string;
  vDate : string;
begin
  q2 := TADOQuery.Create(nil);
  q2.ConnectionString := utils.getConnectionString;
  sql1 := 'INSERT INTO loyalty (idDeliverer,idLoyalty,idContract,option1,option2,editDate,status) VALUES (:pIdDeliverer, :pIdLoyalty,:pIdContract, :pOption1, :pOption2, :pEditDate, :status)';
  q2.SQL.Add(sql1);
  q2.Parameters.ParamByName('pIdDeliverer').Value := loyal.IdDeliverer;
  q2.Parameters.ParamByName('pidLoyalty').Value := loyal.IdLoyalty;
  q2.Parameters.ParamByName('pidContract').Value := loyal.idContract;
  q2.Parameters.ParamByName('pOption1').Value := loyal.option1;
  q2.Parameters.ParamByName('pOption2').Value := loyal.option2;
  vDate:=DateToStr(loyal.EditDate);
  q2.Parameters.ParamByName('pEditDate').Value := vDate;
  q2.Parameters.ParamByName('status').Value := loyal.Status;
  Try
    q2.ExecSQL;
  except on e: Exception do begin
    ShowMessage('не Удалось добавить информацию по Лояльносте!! Обратитесь в Техподдержку');
  end;

  End;
   q2.Close;
   q2.Destroy
end;


function ADOLoyalty.checkLoyaltyByIdDeliverer(id1: Integer): Boolean;
var
  q1 : TADOQuery;
  sql1 : string;
  loyal : TENloyalty;
  res : Integer;
begin
  res := 0;
  loyal := TENloyalty.Create;
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := utils.getConnectionString;
  sql1 := 'SELECT * FROM loyalty WHERE idDeliverer = :pIdDeliverer AND status=TRUE';
  q1.SQL.Add(sql1);
  q1.Parameters.ParamByName('pIdDeliverer').Value := id1;
  Try
    q1.open;
    res := q1.RecordCount;
  except on e: Exception do begin
    ShowMessage('не удалось найти данные о программе лояльности! Обратитесь в Техподдержку');
  end;
  end;
  q1.Destroy;
 // ShowMessage(IntToStr(res));
  if(res <> 0) then RESULT := TRUE
  else RESULT := False;
end;

procedure ADOLoyalty.deleteLoyaltybyidDeliverer(id1: Integer);
var
  q1 : TADOQuery;
  sql1 : string;
begin
// ДОПИСАТЬ ПО НЕОБХОДИМОСТИ
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := utils.getConnectionString;
  sql1 := '';
  q1.SQL.Add(sql1);
  q1.Open;
end;

procedure ADOLoyalty.dismissSaleLoyalty;
var
  q1 : TADOQuery;
  sql1 : String;
begin
  q1 := TADOQuery.create(nil);
  q1.ConnectionString := utils.getConnectionString;
  sql1 := 'UPDATE loyalty SET status =0 WHERE ((option1=0) AND (status=-1))';
  q1.SQL.Add(sql1);
  q1.ExecSQL;
  q1.SQL.Clear;
  sql1 := 'UPDATE loyalty SET option2=0 WHERE (status=-1)';
  q1.SQL.Add(sql1);
  q1.ExecSQL;
  q1.SQL.Clear;
  sql1 := 'UPDATE loyalty SET idLoyalty=10 WHERE ((idLoyalty = 11) AND (status=-1))';
  q1.SQL.Add(sql1);
  q1.ExecSQL;
  q1.SQL.Clear;
  sql1 := 'UPDATE loyalty SET idLoyalty=12 WHERE ((idLoyalty = 13) AND (status=-1))';
  q1.SQL.Add(sql1);
  q1.ExecSQL;
  q1.SQL.Clear;
  q1.Destroy;
end;

function ADOLoyalty.getArrayLoyalty(OWNLoyalty : TOWNLoyalty; id1 : Integer): TARRLoyalty;
var
  res : TARRLoyalty;
  q1 : TADOQuery;
  sql1 : String;
  i : Integer;
begin

//  ShowMessage('getArrayLoyalty');

  q1 := TADOQuery.create(nil);
  q1.connectionString := utils.getConnectionString;
  i := 0;
  case ord(OWNLoyalty) of
    1 : begin
      sql1 := 'SELECT * FROM loyalty WHERE ((idDeliverer = :pIdDeliv) AND ((idContract is NULL) OR (idContract=0)) AND (status = TRUE)) ORDER BY idLoyalty ASC';
      q1.SQL.Add(sql1);
      q1.Parameters.ParamByName('pIdDeliv').Value := id1;
    end;

    2 : begin
      sql1 := 'SELECT * FROM loyalty WHERE (idContract = :pIdContract)   ORDER BY idLoyalty ASC';
      q1.SQL.Add(sql1);
      q1.Parameters.ParamByName('pIdContract').Value := id1;
    end;
    3 : begin
      // APP
    end;
  end;

  with q1 do begin
    q1.Open;
    SetLength(res,q1.RecordCount);
    while not eof do begin
      res[i] := TENloyalty.CREATE;
      res[i].id := q1.FieldByName('id').AsInteger;
      res[i].idDeliverer := q1.FieldByName('idDeliverer').AsInteger;
      res[i].idLoyalty  := q1.FieldByName('idLoyalty').AsInteger;
      res[i].idContract := q1.FieldByName('idContract').AsInteger;
      res[i].option1  := q1.FieldByName('option1').AsFloat;
      //ShowMessage(FloatToStr(res[i].option1));
      res[i].option2   := q1.FieldByName('option2').AsFloat;
      res[i].editDate  := q1.FieldByName('editDate').AsDateTime;
      res[i].status := q1.FieldByName('status').AsBoolean;
      inc(i);
      next;
    end;
  end;
  q1.Destroy;
  RESULT := res;
end;

function ADOLoyalty.getLoyalty(OWNLoyalty: TOWNLoyalty; id1: Integer): TENLoyalty;
var
  q1 : TADOQuery;
  sql1 : string;
  loyal : TENloyalty;
begin
  loyal := TENloyalty.Create;
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := utils.getConnectionString;

  case ord(OWNLoyalty) of
    1 : begin
      sql1 := 'SELECT * FROM loyalty WHERE ((idDeliverer=:pId) AND ((idContract=0) OR (idContract is null)) AND (status = true))';
    end;
    2 : begin
      sql1 := 'SELECT * FROM loyalty WHERE idContract=:pId';
    end;
    3 : begin
      sql1 := 'SELECT * FROM loyalty WHERE id=:pId';
    end;
    4 : begin
     // sql1 := 'UPDATE loyalty SET status = 0 WHERE id=:pId';
    end;
  end;

  //sql1 := 'SELECT * FROM loyalty WHERE ((idDeliverer = :pIdDeliverer) AND (status=TRUE))';
  q1.SQL.Add(sql1);
  q1.Parameters.ParamByName('pId').Value := id1;
  Try
    q1.open;
    loyal.Id := (q1.FieldByName('id').AsInteger);
    loyal.IdDeliverer := (q1.FieldByName('idDeliverer').AsInteger);
    loyal.IdLoyalty := (q1.FieldByName('idLoyalty').AsInteger);
    loyal.option1 := (q1.FieldByName('option1').asFloat);
    loyal.option2 := (q1.FieldByName('option2').AsFloat);
    loyal.EditDate := (q1.FieldByName('editDate').AsDateTime);
    loyal.Status := (q1.FieldByName('status').AsBoolean);
  except on e: Exception do begin
    ShowMessage('не удалось загрузить данные о программе лояльности! Обратитесь в Техподдержку');
  end;
  end;
  q1.Close;
  q1.Destroy;
  RESULT := loyal;

end;

function ADOLoyalty.getLoyaltyByIdDeliverer(id1: Integer): TENloyalty;
var
  q1 : TADOQuery;
  sql1 : string;
  loyal : TENloyalty;
begin
  loyal := TENloyalty.Create;
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := utils.getConnectionString;
  sql1 := 'SELECT * FROM loyalty WHERE ((idDeliverer = :pIdDeliverer) AND (status=TRUE))';
  q1.SQL.Add(sql1);
  q1.Parameters.ParamByName('pIdDeliverer').Value := id1;
  Try
    q1.open;
    loyal.Id := (q1.FieldByName('id').AsInteger);
    loyal.IdDeliverer := (q1.FieldByName('idDeliverer').AsInteger);
    loyal.IdLoyalty := (q1.FieldByName('idLoyalty').AsInteger);
    loyal.option1 := (q1.FieldByName('option1').asFloat);
    loyal.option2 := (q1.FieldByName('option2').AsFloat);
    loyal.EditDate := (q1.FieldByName('editDate').AsDateTime);
    loyal.Status := (q1.FieldByName('status').AsBoolean);
  except on e: Exception do begin
    ShowMessage('не удалось загрузить данные о программе лояльности! Обратитесь в Техподдержку');
  end;
  end;
  q1.Close;
  q1.Destroy;
  RESULT := loyal;
end;

function ADOLoyalty.getLoyaltyByidLoyalty(id1: Integer): TENLoyalty;
var
  q1 : TADOQuery;
  sql1 : string;
  loyal : TENloyalty;
begin
  loyal := TENloyalty.Create;
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := utils.getConnectionString;
  sql1 := 'SELECT * FROM loyalty WHERE idLoyalty = :pIdLoyalty';
  q1.SQL.Add(sql1);
  q1.Parameters.ParamByName('pIdLoyalty').Value := id1;
  Try
    q1.open;
    loyal.Id := (q1.FieldByName('id').AsInteger);
    loyal.IdDeliverer := (q1.FieldByName('idDeliverer').AsInteger);
    loyal.IdLoyalty := (q1.FieldByName('idLoyalty').AsInteger);
    loyal.option1 := (q1.FieldByName('option1').asFloat);
    loyal.option2 := (q1.FieldByName('option2').AsFloat);
    loyal.EditDate := (q1.FieldByName('editDate').AsDateTime);
    loyal.Status := (q1.FieldByName('status').AsBoolean);
  except on e: Exception do begin
    ShowMessage('не удалось загрузить данные о программе лояльности! Обратитесь в Техподдержку');
  end;
  end;
  RESULT := loyal;

end;

procedure ADOLoyalty.importFromArrears;
var
  q1,q2 : TADOQuery;
  sql1 , sql2 : String;
  i : Integer;
begin
  q1 := TADOQuery.create(nil);
  q2 := TADOQuery.create(nil);

  q1.connectionString := utils.getConnectionString;
  q2.connectionString := utils.getConnectionString;

  sql1 := 'SELECT * FROM arrears';
  q1.SQL.Add(sql1);

  q1.open;
  with q1 do begin
    while not eof do begin
      sql2 := 'INSERT INTO loyalty (idLoyalty,idDeliverer,status,editDate,idContract,option1,option2) VALUES(50,0,:pStatus,:pEditDate,:pIdContract,:pOption1,:pOption2)';
      q2.SQL.Add(sql2);
      i := q1.FieldByName('idContract').AsInteger;
      q2.Parameters.ParamByName('pEditDate').value := q1.FieldByName('dateAdd').asString;
      q2.Parameters.ParamByName('pIdContract').value := i;
      q2.Parameters.ParamByName('pOption1').value := q1.FieldByName('arrearsPercent').asFloat;
      q2.Parameters.ParamByName('pOption2').value := q1.FieldByName('arrearsDelay').asFloat;
      q2.Parameters.ParamByName('pStatus').Value  := DANADO.contract.getConStatusById(i);
      q2.execSQL;
      q2.Sql.Clear;
    next;
    end;
  end;
  q1.Destroy;
  q2.Destroy;
end;

procedure ADOLoyalty.importLoyaltyFromTableByIdTarifSetPercent(idTarif: Integer;
  percentage: Double);
var
  q1 : TADOQuery;
  sql1 : string;
  lola : TENLoyalty;
begin
  lola := TENLoyalty.CREATE;
  lola.option2  := (0);
  lola.Status := (TRUE);
  lola.IdLoyalty := (10);
  lola.EditDate := (now()-11);
  lola.option1 := (percentage);

  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := utils.getConnectionString;
  sql1 := 'SELECT id FROM deliverer WHERE id_tarif = :pIdTArif';
  q1.SQL.Add(sql1);
  q1.Parameters.ParamByName('pIdTArif').Value := idTarif;

  q1.Open;
  with q1 do begin
    while not eof do begin
      lola.IdDeliverer := (q1.FieldByName('id').AsInteger);
      updateLoyaltyStatusFalseByIdDeliverer(lola.IdDeliverer);
      addLoyalty(lola);
      deliverer.updateIdTarif(lola.IdDeliverer, idTarif+4);
      q1.Next;
    end;
  end;

  q1.Close;
  q1.Destroy;
end;

procedure ADOLoyalty.importLoyaltyFromXML;
var
  iniFile : TIniFile;
  updateChecker : Integer;
  xml: IXMLDocument;
  nodes: IXMLNodeList;
  node: IXMLNode;
  parentNode: IXMLNode;
  targetNodeName: String;
  index: Integer;
  resultPercent: Double;
  resultPrice : Double;
  resultIdDeliverer : Integer;
  codeFilial: String;
  nodeCount: Integer;
  i : Integer;
  importLoyal : TENLoyalty;
  lala : ADOLoyalty;
  deliva : ADODeliverer;
begin
  importLoyal := TENloyalty.CREATE;
  importLoyal.EditDate := (now()-10);
  importLoyal.Status := (TRUE);
  lala := ADOLoyalty.Create;
  deliva := ADODeliverer.Create;
  i := 0;
  danado.deliverer.UpdateIdTarifByIdTarif(9,6);
  IniFile := TIniFile.Create('c:\pawn\options.ini');
  updateChecker := IniFile.ReadInteger('loyal','update', 0);
  if (updateChecker = 0 ) then begin

    ShowMessage('ВНИМАНИЕ!!! Обновление Списка Клиентов 1/3');
    danado.loyal.importLoyaltyFromTableByIdTarifSetPercent(2,0.01);
    ShowMessage('Обновление Списка Клиентов 2/3');
    danado.loyal.importLoyaltyFromTableByIdTarifSetPercent(3,0.02);
    ShowMessage('Обновление Списка Клиентов 3/3');

    codeFilial := main.sCodeFilial;
    resultPercent := 0;
    xml := TXMLDocument.Create(nil);
    xml.LoadFromFile('C:\pawn\conf\loyalty.xml');
    xml.Active := True;
    index := 0;
    parentNode := xml.DocumentElement.ChildNodes['loyalty'];
    node := Discounts.getTargetNode(parentNode, codeFilial);

    if (node<> nil) then begin
      nodeCount := node.ChildNodes.Count;

      while i < nodeCount do begin
        importLoyal.option1 := (node.ChildNodes[i].Attributes['percent']);
        importLoyal.option2 := (node.ChildNodes[i].Attributes['price']);
        importLoyal.IdDeliverer := (node.ChildNodes[i].Attributes['name']);
        if (importLoyal.option1 = 0) then importLoyal.IdLoyalty := (11)
          else if(importLoyal.option2 = 0) then importLoyal.IdLoyalty := (12)
            else importLoyal.IdLoyalty := (13);
        updateLoyaltyStatusFalseByIdDeliverer(importLoyal.IdDeliverer);
        lala.addLoyalty(importLoyal);
        deliva.updateIdTarif(importLoyal.IdDeliverer, 10);
        inc(i);
      end;
    end;

    iniFile.WriteInteger('loyal','update',5);
    iniFile.Free;
  end;
end;

procedure ADOLoyalty.setLoyaltyByIdDeliverer(loyal: TENLoyalty);
var
  q1 : TADOQuery;
  sql1 : string;
  vdate : String;
begin
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := utils.getConnectionString;
  sql1 := 'UPDATE loyalty SET loyalty.idLoyalty=:pIdLoyalty, loyalty.option1=:pOption1, loyalty.option2=:pOption2, loyalty.editDate=:pEditDate WHERE idDeliverer = :pIdDeliverer';
  q1.SQL.Add(sql1);
  q1.Parameters.ParamByName('pIdDeliverer').Value := loyal.IdDeliverer;
  q1.Parameters.ParamByName('pidLoyalty').Value := loyal.IdLoyalty;
  q1.Parameters.ParamByName('pOption1').Value := loyal.option1;
  q1.Parameters.ParamByName('pOption2').Value := loyal.option2;
  vDate:=DateToStr(loyal.EditDate);
  q1.Parameters.ParamByName('pEditDate').Value := vDate;
  try
  q1.ExecSQL;
  except on e: exception  do begin
    ShowMessage('Неудалось обновить информацию!! Обратитесь в Техподдержку');
  end;

  end;
end;

procedure ADOLoyalty.updateLoyaltyStatusFalse(OWNLoyalty : TOWNLoyalty; id1: Integer);
var
  q1 : TADOQUery;
  sql1 : String;
begin
  q1 := TADOQUery.create(nil);
  q1.connectionString := utils.getConnectionString;

  case ord(OWNLoyalty) of
    1 : begin
      sql1 := 'UPDATE loyalty SET status = 0, editDate = :pDate WHERE ((idDeliverer=:pId) AND ((idContract=0) OR (idContract is null)))';
    end;
    2 : begin
      sql1 := 'UPDATE loyalty SET status = 0, editDate = :pDate WHERE idContract=:pId';
    end;
    3 : begin
      sql1 := 'UPDATE loyalty SET status = 0, editDate = :pDate WHERE id=:pId';
    end;
    4 : begin
     // sql1 := 'UPDATE loyalty SET status = 0 WHERE id=:pId';
    end;

  end;
 // sql1 := 'UPDATE loyalty SET status = 0 WHERE id=:pId';
  q1.SQL.Add(sql1);
  q1.Parameters.ParamByName('pId').Value := id1;
  q1.Parameters.ParamByName('pDate').Value := StrToDate(DateToStr(now()));
  q1.ExecSQL;
  q1.Close;
  q1.Destroy;
end;

procedure ADOLoyalty.updateLoyaltyStatusFalseByIdDeliverer(id1: Integer);
var
  q1 : TADOQuery;
  sql1 : string;
  vDate : String;
begin
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := utils.getConnectionString;
  vDate := DateToStr(now);
  sql1 := 'UPDATE loyalty SET loyalty.status=False, editDate=:pDate WHERE idDeliverer =:pId';
  q1.SQL.Add(sql1);
  q1.Parameters.ParamByName('pId').Value := id1;
  q1.Parameters.ParamByName('pDate').Value := vDate;
  try
    q1.ExecSQL;
  except on e: exception do begin
    ShowMessage('Не Удалось Обновить СТАТУС!');
  end;

  end;
  q1.Close;
  q1.Destroy;
end;

{ ADOArears }


function ADOArrears.calculateArrears(sum: Double; arr1: TENArrears): TENArrears;
begin
  if (Sum >= arr1.arrearsOption1) then  begin
    arr1.arrearsOption2 := (arr1.arrearsOption2-(sum-arr1.arrearsOption1));
    arr1.arrearsOption1 := (0);
  end else begin
    arr1.arrearsOption1 := (arr1.arrearsOption1-sum);
  end;

  RESULT := arr1;
end;

function ADOArrears.getArrearsByIdContract(id1: Integer): TENArrears;
var
  q1 : TADOQuery;
  sql1 : String;
  res : TENArrears;
begin
  res := TENArrears.Create;
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := utils.getConnectionString;
  sql1 := 'SELECT * FROM loyalty WHERE ((idContract=:pId) AND (idLoyalty=50))';
  q1.SQL.Add(sql1);
  q1.Parameters.ParamByName('pId').Value := id1;
  q1.Open;
  if (q1.RecordCount > 0 ) then begin
    res.id := (q1.FieldByName('id').AsInteger);
    res.idContract := (q1.FieldByName('idContract').AsInteger);
    res.arrearsOption1 := (q1.FieldByName('option1').AsFloat);
    res.arrearsOption2 := (q1.FieldByName('option2').AsFloat);
    res.dateADd := StrToDate(q1.FieldByName('editDate').AsString);
  end;
  q1.Destroy;
  RESULT := res;
end;

function ADOArrears.getSumArrearsByIdContract(id1: Integer): Double;
var
  q1 : TADOQuery;
  sql1 : String;
  res : Double;
begin
  q1 := TADOQuery.create(nil);
  q1.ConnectionString := danado.utils.getConnectionString;
  sql1 := 'SELECT option1,option2 FROM loyalty WHERE ((idContract =:pIdContract) AND (idLoyalty = 50))';
  q1.sql.add(sql1);
  q1.parameters.paramByName('pIdContract').Value := id1;
  q1.open;
  res := q1.FieldByName('option1').asFloat + q1.FieldByName('option2').asFloat;
  RESULT := res;
end;

procedure ADOArrears.setArrears(arears1: TENarrears);
var
  q1 : TADOQuery;
  sql1 : String;
begin
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := utils.getConnectionString;
  sql1 := 'INSERT INTO loyalty (idLoyalty,idDeliverer,idContract,option1,option2,editDate,status) VALUES (50,0,:pIdContract,:pArrearsOption1,:pArrearsOption2,:pDateAdd,-1)';
  q1.SQL.Add(sql1);
  q1.Parameters.ParamByName('pIdContract').Value := arears1.idContract;
  q1.Parameters.ParamByName('pArrearsOption1').Value := arears1.arrearsOption1;
  q1.Parameters.ParamByName('pArrearsOption2').Value := arears1.arrearsOption2;
  q1.Parameters.ParamByName('pDateAdd').Value := DateToStr(arears1.dateAdd);
  q1.ExecSQL;
  q1.Destroy;
end;

procedure ADOArrears.showArrears(arr1: TENArrears);
begin
  ShowMessage(IntTOStr(arr1.idContract) + ' %:' + FloatToStr(arr1.arrearsOption1) + ' п:' + FloatToStr(arr1.arrearsOption2)+ 'date:' + DateToStr(arr1.dateAdd));
end;

procedure ADOArrears.updateArrearsSetDateAdd;
var
  q1,q2,q3 : TADOQUery;
  sql1,sql2,sql3 : String;

begin
  q1 := TADOQUery.Create(nil);
  q1.ConnectionString := utils.getConnectionString;
  q2 := TADOQUery.Create(nil);
  q2.ConnectionString := utils.getConnectionString;
  q3 := TADOQUery.Create(nil);
  q3.ConnectionString := utils.getConnectionString;

  sql1 := 'SELECT * FROM arrears WHERE dateAdd is NULL';
  q1.SQL.Add(sql1);
  with q1 do begin;
    q1.Open;
    while not eof do begin
      sql2 := 'SELECT date_begin FROM contract_info WHERE id = :pIdContract';
      q2.SQL.Add(sql2);
      q2.Parameters.ParamByName('pIdCOntract').Value := q1.FieldByName('idContract').AsInteger;
      q2.Open;
      sql3 := 'UPDATE arrears SET dateAdd=:pDateAdd WHERE id=:pIdArrears';
      q3.SQL.Add(sql3);
      q3.Parameters.ParamByName('pDateAdd').Value := q2.FieldByName('date_begin').AsString;
      q3.Parameters.ParamByName('pIdArrears').Value := q1.FieldByName('id').AsInteger;
      q3.ExecSQL;
      q3.SQL.Clear;
      q2.SQL.Clear;
      next;
    end;
    q1.Destroy;
    q2.Destroy;
    q3.Destroy;
  end;
end;

{ ADOPasport }

procedure ADOPasport.createNormalNum;
begin

end;

function ADOPasport.getContractNumber: String;
var
  myPas : TENPasport;
  res : String;
begin
//
  myPas := pasport.getPasport;
  res := myPas.freeContractNumber;
end;

function ADOPasport.getMaxNum: Integer;
var
  res : Integer;
  str1 : String;
  myPas : TENPasport;
begin
  myPas := pasport.getPasport;
  if (StrToInt(myPas.freeContractNumber) > StrToInt(myPas.freeAdditionalNumber))
    then begin str1 := myPas.freeContractNumber end else begin str1 := myPas.freeAdditionalNumber; end;
  str1[1] := '0';
  str1[2] := '0';
  str1[3] := '0';
  RESULT := StrToInt(str1);
end;

function ADOPasport.getPasport: TENPasport;
var
  q1 : TADOQuery;
  sql1 : String;
  res : TENPasport;
begin
  q1 := TADOQuery.Create(nil);
  res := TENPasport.Create;
  q1.ConnectionString := utils.getConnectionString;
  sql1 := 'SELECT * FROM pasport';
  q1.SQL.Add(sql1);
  q1.Open;
    // .19
    res.id := q1.FieldByName('id').AsInteger;
    res.numFilial := q1.FieldByName('num_filial').AsString;
    res.dYear := q1.FieldByName('d_year').AsString;
    res.openDay := q1.FieldByName('OpenDay').AsDateTime;
    res.startContractNumber := q1.FieldByName('StartContractNumber').AsString;
    res.endContractNumber := q1.FieldByName('EndContractNumber').AsString;
    res.freeContractNumber := q1.FieldByName('FreeContractNumber').AsString;
    res.freeAdditionalNumber := q1.FieldByName('FreeAdditionalNumber').AsString;
    res.idCurrentEmployee := q1.FieldByName('id_CurrentEmployee').AsInteger;
    res.nameFilial := q1.FieldByName('name_filial').AsString;
    res.city := q1.FieldByName('City').AsString;
    res.orderNumberOut := q1.FieldByName('OrderNumber').AsInteger;
    res.bPage := q1.FieldByName('bPage').AsInteger;
    res.chief := q1.FieldByName('Chief').AsString;
    res.chiefData := q1.FieldByName('ChiefData').AsString;
    res.lastCashBookDate := q1.FieldByName('LastCashBookDate').AsDateTime;
    res.orderNumberIn := q1.FieldByName('OrderNumber2').AsInteger;
    res.phone := q1.FieldByName('phone').AsString;
    res.lastDate := q1.FieldByName('lastDate').AsDateTime;
  q1.Destroy;
  RESULT := res;
end;

procedure ADOPasport.incContractNumber;
begin
  //
end;

procedure ADOPasport.updateOrdNum(ordIn1, ordOut1: Integer);
var
  q1 : TADOQuery;
  sql1 : String;
begin
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := utils.getConnectionString;

  sql1 := 'UPDATE pasport set OrderNumber = :pOrdIn, OrderNumber2 = :pOrdOut';

  q1.SQL.Add(sql1);

  q1.Parameters.ParamByName('pOrdIn').Value := ordIn1;
  q1.Parameters.ParamByName('pOrdOut').Value := ordOut1;

  q1.ExecSQL;
  q1.Destroy;

end;

{ ADOOrder }

function ADOOrder.createOrderByIdOperation(id1: Integer): TENOrder;
var
  res : TENOrder;
  myOp : TENoperation2;
begin
  myOp := operation.getOperationById(id1);


  RESULT := res;
end;

procedure ADOOrder.createTableOrders;
var
  q1 : TADOQuery;
  sql1 : String;

begin
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := utils.getConnectionString;
  q1.SQL.Clear;
  sql1 := 'CREATE TABLE orders5 ('+
      'id AUTOINCREMENT, '+
      'idOperation Int, '+
      'bill char(20), '+
      'Summ Float, '+
      'FromW char, '+
      'Ground char, '+
      'SummInWord char, '+
      'SummCent int, '+
      'chiefAccountant char, '+
      'casheir char, '+
      'numberW int, '+
      'filialNumber int, '+
      'chief char, '+
      'OperationDate DateTime, '+
      'document text, '+
      'recipient text, '+
      'additional char, '+
      'PRIMARY KEY (id) '+
      ')';

      q1.SQL.Add(sql1);
      q1.ExecSQL;
      q1.Destroy;
end;

function ADOOrder.fill(qq1: TADOQuery): TENOrder;
var
  res : TENOrder;
begin

  res := TENOrder.create;

  res.setId(qq1.FieldByName('id').AsInteger);
  res.setOperationId(qq1.FieldByName('OperationId').AsInteger);
  res.setBill(qq1.FieldByName('Bill').AsString);
  res.setSumm(StrToFloat(qq1.FieldByName('Summ').AsString));
  res.setFromW(qq1.FieldByName('FromW').asstring);
  res.setGround(qq1.FieldByName('Ground').AsString);
  res.setSummInWord(qq1.FieldByName('SumminWord').AsString);
  res.setSummCent(round(StrToFloat(qq1.FieldByName('SummCent').AsString)));
  res.setChiefAccountant(qq1.FieldByName('chiefAccountant').AsString);
  res.setCasheir(qq1.FieldByName('casheir').AsString);
  res.setNumberW(StrToInt(qq1.FieldByName('numberW').AsString));
  res.setFilialNumber(StrToInt(qq1.FieldByName('filialNumber').AsString));
  res.setChief(qq1.FieldByName('chief').AsString);
  res.setOperationDate(qq1.FieldByName('OperationDate').AsDateTime);
  res.setDocument(qq1.FieldByName('document').AsString);
  res.setRecipient(qq1.FieldByName('recipient').AsString);
  res.setAdditional(qq1.FieldByName('additional').AsString);

  RESULT := res;

end;

procedure ADOOrder.insertIntoOrders(id1: TENOrder);
var
  q1 : TADOQuery;
  sql1 : String;
begin
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := utils.getConnectionString;

  sql1 := 'INSERT INTO orders (OperationId,Bill,Summ,FromW,Ground,SummInWord,SummCent,chiefAccountant,casheir,numberW,filialNumber,chief,OperationDate,document,recipient,additional) ';
  sql1 := sql1 + ' VALUES (:pOperationId,:pBill,:pSumm,:pFromW,:pGround,:pSummInWord,:pSummCent,:pchiefAccountant,:pcasheir,';
  sql1 := sql1 + ':pnumberW,:pfilialNumber,:pchief,:pOperationDate,:pdocument,:precipient,:padditional)';

  q1.SQL.Add(sql1);

 // q1.Parameters.ParamByName('pId').Value := id1.getId;
  q1.Parameters.ParamByName('pOperationId').Value := id1.getOperationId;
  q1.Parameters.ParamByName('pBill').Value := id1.getBill;
  q1.Parameters.ParamByName('pSumm').Value := id1.getSumm;
  q1.Parameters.ParamByName('pFromW').Value := id1.getFromW;
  q1.Parameters.ParamByName('pGround').Value := id1.getGround;
  q1.Parameters.ParamByName('pSummInWord').Value := id1.getSummInWord;
  q1.Parameters.ParamByName('pSummCent').Value := id1.getSummCent;
  q1.Parameters.ParamByName('pchiefAccountant').Value := id1.getChiefAccountant;
  q1.Parameters.ParamByName('pcasheir').Value := id1.getCasheir;
  q1.Parameters.ParamByName('pnumberW').Value := id1.getNumberW;
  q1.Parameters.ParamByName('pfilialNumber').Value := id1.getFilialNumber;
  q1.Parameters.ParamByName('pchief').Value := id1.getChief;
  q1.Parameters.ParamByName('pOperationDate').Value := StrToDate(DateToStr(id1.getOperationDate));
  q1.Parameters.ParamByName('pdocument').Value := id1.getDocument;
  q1.Parameters.ParamByName('precipient').Value := id1.getRecipient;
  q1.Parameters.ParamByName('padditional').Value := id1.getAdditional;

  q1.ExecSQL;
  q1.Destroy;
 //
end;

procedure ADOOrder.makeRovno;
var
  q1, q2 : TADOQuery;
  sql1, sql2 : String;
  ordIn, ordOut : Integer;
  myOrd2 : TENOrder;
begin


{
SELECT Count(operation.op) AS 1
FROM operation
WHERE ((((operation.op)=1 Or (operation.op)=10) AND ((operation.sum_op<>0))) AND (date_op < #01/10/2014#))
}
  ordIn :=1;
  ordOut :=1;
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := utils.getConnectionString;
  q2 := TADOQuery.Create(nil);
  q2.ConnectionString := utils.getConnectionString;

  sql1 := 'SELECT * INTO newOrd FROM orders WHERE OperationDate > #01/01/2015#';

  q1.SQL.Add(sql1);

  q1.ExecSQL;
  q1.SQL.Clear;

  sql1 := 'DELETE * FROM orders WHERE OperationDate > #01/01/2015#';
  q1.SQL.Add(sql1);
  q1.ExecSQL;
  q1.SQL.Clear;

  sql1 := 'SELECT * FROM newOrd ORDER BY OperationId ASC';
  q1.SQL.Add(sql1);
  q1.Open;

  with q1 do begin
    while not eof do begin
      myOrd2 := DANADO.order.fill(q1);

      if((myOrd2.getBill= '3771') OR ((myOrd2.getBill = '683') AND (myOrd2.getGround = 'Служебное изьятие'))) then begin
        myOrd2.setNumberW(ordOut);
        inc(ordOut);
      end else begin
        if((myOrd2.getBill= '3771, 373, 374') OR ((myOrd2.getBill = '683') AND (myOrd2.getGround = 'Служебное внесение'))) then begin
          myOrd2.setNumberW(ordIn);
          inc(ordIn);
      end;
      end;
      order.insertIntoOrders(myOrd2);
      next;
    end;
  end;
  DANADO.pasport.updateOrdNum(ordOut,ordIn);

  sql2 := 'DROP TABLE newOrd';
  q2.SQL.Add(sql2);
  q2.ExecSQL;
  q1.Destroy;
  q2.Destroy;
end;

{ ADOEmployee }

function ADOEmployee.getEmployeeList: TStringList;
var
  employeeList : TStringList;
  q1 : TADOQUery;
  sql1 : String;
  listStr : String;
begin
  employeeList := TStringList.Create;
  employeeList.Add('123');
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := utils.getConnectionString;
  sql1 := 'SELECT name, id FROM employee WHERE hideEmployee = false';
  q1.SQL.Add(sql1);
  q1.Open;
  with q1 do begin
    while not eof do begin
      employeeList.Values[q1.FieldByName('name').AsString]:= q1.FieldByName('id').AsString;
      next;
    end;
  end;
  q1.Destroy;
  RESULT := employeeList;
end;

end.


