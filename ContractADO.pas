unit ContractADO;

interface

uses
  ADODB, ContractEntity, SysUtils, DelivererADO, EmployeeADO, Dialogs, MyUtils,
  ContractsList, DanAdo;

type
  TContractADO = class(TObject)
    public
      function getContractById(id: Longint): TContract;
      function getContractByOperationId(id: Longint): TContract;
      function getContractByNumber(number: string): TContract;
      function getParentContract(contract: TContract): TContract;
      function getContractsByDelivererName(name: string): TContractsList;
      function gerContractByDatePeraiod(dateBegin: TDateTime;
        dateEnd: TDateTime): TContractsList;
  end;

implementation

{ TContractADO }

function TContractADO.gerContractByDatePeraiod(dateBegin,
  dateEnd: TDateTime): TContractsList;
begin

end;

function TContractADO.getContractById(id: Integer): TContract;
var
  q1: TADOQuery;
  sql: string;
  contract: TContract;
begin
  contract := TContract.Create;
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := danAdo.utils.getConnectionString;
  sql := 'SELECT * FROM contract_info WHERE id='+IntToStr(id);
  q1.SQL.Add(sql);
  q1.Open;
    contract.id := id;
    contract.parentContractId := q1.FieldByName('idParentContract').AsInteger;
    contract.loanAmount := q1.FieldByName('loan_amount').AsFloat;
    contract.estimatedAmount := q1.FieldByName('estimated_amount').AsFloat;
    contract.number := q1.FieldByName('contract_number').AsString;
    contract.active := q1.FieldByName('con_status').AsBoolean;
    contract.employeeId := q1.FieldByName('id_employee').AsInteger;
    contract.delivererId := q1.FieldByName('id_deliverer').AsInteger;
    contract.deliverer := TDelivererADO.Create.getDelivererById(contract.delivererId);
    contract.employee := TEmployeeADO.Create.getEmployeeById(contract.employeeId);
    contract.specialCondition := q1.FieldByName('SpecialCondition').AsBoolean;
    contract.con_percent := q1.FieldByName('con_percent').AsFloat;
    contract.contractTypeGroup := q1.FieldByName('contractTypeGroup').AsInteger;
  q1.Close;
  q1.SQL.Clear;
  q1.Destroy;
  Result := contract;
end;

function TContractADO.getContractByNumber(number: string): TContract;
var
  q1: TADOQuery;
  sql: string;
  contract: TContract;
begin
  contract := TContract.Create;
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := danAdo.utils.getConnectionString;
  sql := 'SELECT * FROM contract_info WHERE contract_number="'+number+'" ORDER by id DESC';
  q1.SQL.Add(sql);
  q1.Open;
    contract.id := q1.FieldByName('id').AsInteger;;
    contract.parentContractId := q1.FieldByName('idParentContract').AsInteger;
    contract.loanAmount := q1.FieldByName('loan_amount').AsFloat;
    contract.estimatedAmount := q1.FieldByName('estimated_amount').AsFloat;
    contract.number := q1.FieldByName('contract_number').AsString;
    contract.active := q1.FieldByName('con_status').AsBoolean;
    contract.employeeId := q1.FieldByName('id_employee').AsInteger;
    contract.delivererId := q1.FieldByName('id_deliverer').AsInteger;
    contract.deliverer := TDelivererADO.Create.getDelivererById(contract.delivererId);
    contract.employee := TEmployeeADO.Create.getEmployeeById(contract.employeeId);
    contract.specialCondition := q1.FieldByName('SpecialCondition').AsBoolean;
    contract.con_percent := q1.FieldByName('con_percent').AsFloat;
    contract.contractTypeGroup := q1.FieldByName('contractTypeGroup').AsInteger;
  q1.Close;
  q1.SQL.Clear;
  q1.Destroy;
  Result := contract;
end;

function TContractADO.getContractByOperationId(id: Integer): TContract;
var
  q1: TADOQuery;
  sql: string;
  contract: TContract;
begin
  contract := TContract.Create;
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := danAdo.utils.getConnectionString;
  sql := 'SELECT contract_info.* FROM contract_info INNER JOIN operation'+
  'ON contract_info.id=operation.id_contract_op WHERE operation.id='+IntToStr(id);
  q1.SQL.Add(sql);
  q1.Open;
    contract.id := id;
    contract.parentContractId := q1.FieldByName('idParentContract').AsInteger;
    contract.loanAmount := q1.FieldByName('loan_amount').AsFloat;
    contract.estimatedAmount := q1.FieldByName('estimated_amount').AsFloat;
    contract.number := q1.FieldByName('contract_number').AsString;
    contract.active := q1.FieldByName('con_status').AsBoolean;
    contract.employeeId := q1.FieldByName('id_employee').AsInteger;
    contract.delivererId := q1.FieldByName('id_deliverer').AsInteger;
    contract.deliverer := TDelivererADO.Create.getDelivererById(contract.delivererId);
    contract.employee := TEmployeeADO.Create.getEmployeeById(contract.employeeId);
    contract.specialCondition := q1.FieldByName('SpecialCondition').AsBoolean;
    contract.con_percent := q1.FieldByName('con_percent').AsFloat;
    contract.contractTypeGroup := q1.FieldByName('contractTypeGroup').AsInteger;
  q1.Close;
  q1.SQL.Clear;
  q1.Destroy;
  Result := contract;
end;



function TContractADO.getContractsByDelivererName(name: string): TContractsList;
var
  q1: TADOQuery;
  sql: String;
  contract: TContract;
  contracts: TContractsList;
  i: Integer;
begin
  i := 0;
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := DANADO.utils.getConnectionString;
  sql := 'SELECT contract_info.*, [deliverer.name] AS name FROM contract_info INNER JOIN deliverer'+
    ' ON contract_info.id_deliverer=deliverer.id WHERE'+
    ' deliverer.name like :name' +
    'ORDER BY id';
  q1.SQL.Add(sql);
  q1.Parameters.ParamByName('name').Value := name;
  with q1 do begin
    q1.Open;
    SetLength(contracts,q1.RecordCount);
    while not eof do begin
      contract := TContract.Create;
      contract.id := q1.FieldByName('id').AsInteger;
      contract.parentContractId := q1.FieldByName('idParentContract').AsInteger;
      contract.loanAmount := q1.FieldByName('loan_amount').AsFloat;
      contract.estimatedAmount := q1.FieldByName('estimated_amount').AsFloat;
      contract.dateOfTheContract := q1.FieldByName('date_begin').AsDateTime;
      contract.days := q1.FieldByName('num_of_day').AsInteger;
      contract.number := q1.FieldByName('contract_number').AsString;
      contract.completionDateOfTheContract := q1.FieldByName('date_end').AsDateTime;
      contract.active := q1.FieldByName('con_status').AsBoolean;
      contract.employeeId := q1.FieldByName('id_employee').AsInteger;
      contract.delivererId := q1.FieldByName('id_deliverer').AsInteger;
      contract.employee := TEmployeeADO.Create.getEmployeeById(contract.employeeId);
      contract.deliverer.name := q1.FieldByName('name').AsString;
      //TDelivererADO.Create.getDelivererById(contract.delivererId);
      contract.specialCondition := q1.FieldByName('SpecialCondition').AsBoolean;
      contract.con_percent := q1.FieldByName('con_percent').AsFloat;
      contract.contractTypeGroup := q1.FieldByName('contractTypeGroup').AsInteger;
      contracts[i] := contract;
      Inc(i);
      Next;
    end;
  q1.Close;
  end;
  q1.SQL.Clear;
  q1.Destroy;
  Result := contracts;
end;

function TContractADO.getParentContract(contract: TContract): TContract;
var
  q1: TADOQuery;
  sql: String;
  res: TContract;
begin

  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := DANADO.utils.getConnectionString;
  sql := 'SELECT * FROM contract_info WHERE id='+ IntToStr(contract.parentContractId);
 // q1.Parameters.ParamByName('id').Value := '3647';
  q1.SQL.Add(sql);
  q1.Open;
  res := TContract.Create;
  res.id := q1.FieldByName('id').AsInteger;
  res.parentContractId := q1.FieldByName('idParentContract').AsInteger;
  res.loanAmount := q1.FieldByName('loan_amount').AsFloat;
  res.estimatedAmount := q1.FieldByName('estimated_amount').AsFloat;
  res.dateOfTheContract := q1.FieldByName('date_begin').AsDateTime;
  res.days := q1.FieldByName('num_of_day').AsInteger;
  res.number := q1.FieldByName('contract_number').AsString;
  res.completionDateOfTheContract := q1.FieldByName('date_end').AsDateTime;
  res.active := q1.FieldByName('con_status').AsBoolean;
  res.employeeId := q1.FieldByName('id_employee').AsInteger;
  res.delivererId := q1.FieldByName('id_deliverer').AsInteger;
  res.employee := TEmployeeADO.Create.getEmployeeById(res.employeeId);
  res.deliverer := TDelivererADO.Create.getDelivererById(res.delivererId);
  res.specialCondition := q1.FieldByName('SpecialCondition').AsBoolean;
  contract.con_percent := q1.FieldByName('con_percent').AsFloat;
  contract.contractTypeGroup := q1.FieldByName('contractTypeGroup').AsInteger;
  q1.Close;
  q1.SQL.Clear;
  q1.Destroy;
  Result := res;
 end;

end.
