unit OperationADO;

interface

uses
  ADODB, OperationList, OperationEntity, ContractADO, Classes, Contnrs, Dialogs,
  SysUtils, ContractEntity, DanAdo;

type
  TOperationType = (INCOME, OUTGOING);
  TOperationADO = class(TObject)
  public
    //function getOperationsByDate(date: TDateTime): TOperationList;
    function getOperationsByDate(date: TDateTime;
   operationType:TOperationType): TOperationList;
    function getOperationById(id: Longint): OperationEntity.TOperation;
    function getOperationByContractIdAndType(id: Longint; typeOp: Integer): OperationEntity.TOperation;
    procedure updateOperation(operation: OperationEntity.TOperation);
  end;

implementation

{ TOperationADO }

function TOperationADO.getOperationByContractIdAndType(id: Longint;
  typeOp: Integer): OperationEntity.TOperation;
var
  q1: TADOQuery;
  sql: string;
  operation: OperationEntity.TOperation;
begin
  sql := 'SELECT * FROM operation WHERE id_contract_op=:id_contract_op AND op=:op';
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := danAdo.utils.getConnectionString;
   q1.SQL.Add(sql);
   q1.Parameters.ParamByName('id_contract_op').Value := id;
   q1.Parameters.ParamByName('op').Value := typeOp;
   q1.Open;
    operation := OperationEntity.TOperation.Create;
    operation.id := q1.FieldByName('id').AsInteger;
    operation.operationType := q1.FieldByName('op').AsInteger;
    operation.date := q1.FieldByName('date_op').AsDateTime;
    operation.summa := q1.FieldByName('sum_op').AsFloat;
    operation.percentSumma := q1.FieldByName('percent_op').AsFloat;
    operation.delaySumma := q1.FieldByName('delay_op').AsFloat;
    operation.contractId := q1.FieldByName('id_contract_op').AsInteger;
    operation.contract := TContract.Create;
    operation.contract :=
      TContractADO.Create.getContractById(operation.contractId);
   q1.Destroy;
   Result := operation;
end;

function TOperationADO.getOperationById(id: Integer): OperationEntity.TOperation;
var
  q1: TADOQuery;
  sql: string;
  operation: OperationEntity.TOperation;
begin
  sql := 'SELECT * FROM operation WHERE id=:id';
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := danAdo.utils.getConnectionString;
   q1.SQL.Add(sql);
   q1.Parameters.ParamByName('id').Value := id;
   q1.Open;
    operation := OperationEntity.TOperation.Create;
    operation.id := q1.FieldByName('id').AsInteger;
    operation.operationType := q1.FieldByName('op').AsInteger;
    operation.date := q1.FieldByName('date_op').AsDateTime;
    operation.summa := q1.FieldByName('sum_op').AsFloat;
    operation.percentSumma := q1.FieldByName('percent_op').AsFloat;
    operation.delaySumma := q1.FieldByName('delay_op').AsFloat;
    operation.contractId := q1.FieldByName('id_contract_op').AsInteger;
    operation.contract := TContract.Create;
    operation.contract :=
      TContractADO.Create.getContractById(operation.contractId);
   q1.Destroy;
   Result := operation;
end;

function TOperationADO.getOperationsByDate(date: TDateTime;
   operationType:TOperationType): TOperationList;
var
  q1: TADOQuery;
  sql: string;
  sqlCountRow: string;
  //operations : TObjectList;
  operations : TOperationList;
  //operations2 : array [0..3] of OperationEntity.TOperation;
  operation: OperationEntity.TOperation;
  i : Integer;
begin
  //operations := TObjectList.Create;
  i := 0;
{  case operationType of
    INCOME: begin
      sql := 'SELECT * FROM operation WHERE date_op>=:date_op' +
      ' AND (op=2 OR op=5 OR op=10)';
      sqlCountRow := 'SELECT COUNT(op) FROM operation WHERE date_op>=:date_op' +
      ' AND (op=2 OR op=5 OR op=10)';
    end;
    OUTGOING: sql := 'SELECT * FROM operation WHERE date_op>=:date_op' +
      ' AND (op=1 OR op=11)';
  end;
}
  sql := 'SELECT * FROM operation WHERE date_op>=:date_op ORDER BY date_op,id';
  sqlCountRow := 'SELECT COUNT(op) FROM operation WHERE date_op>=:date_op';
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := danAdo.utils.getConnectionString;
  q1.SQL.Add(sqlCountRow);
  q1.Parameters.ParamByName('date_op').Value := date;
  q1.Open;
    Setlength(operations,q1.Fields[0].AsInteger);
  q1.Close;
  q1.SQL.Clear;

  q1.SQL.Add(sql);
  q1.Parameters.ParamByName('date_op').Value := date;
  with q1 do begin
    q1.Open;
    while not eof  do begin
      operations[i] := OperationEntity.TOperation.Create();
      operations[i].id := q1.FieldByName('id').AsInteger;
      operations[i].operationType := q1.FieldByName('op').AsInteger;
      operations[i].contractId := q1.FieldByName('id_contract_op').AsLargeInt;
      operations[i].contract :=
      TContractADO.Create.getContractById(q1.FieldByName('id_contract_op').AsLargeInt);
      operations[i].date := q1.FieldByName('date_op').AsDateTime;
      operations[i].summa := q1.FieldByName('sum_op').AsFloat;
      operations[i].percentSumma := q1.FieldByName('percent_op').AsFloat;
      operations[i].delaySumma := q1.FieldByName('delay_op').AsFloat;
      Inc(i);
      Next;
    end;
    q1.Close;
  end;
  q1.SQL.Clear;
  Result := operations;
end;

procedure TOperationADO.updateOperation(operation: OperationEntity.TOperation);
var
  q1: TADOQuery;
  sql: string;
begin
  sql := 'UPDATE operation SET date_op=:date_op,sum_op=:sum_op,' +
  ' percent_op=:percent_op, delay_op=:delay_op, id_contract_op=:id_contract_op'+
  ' WHERE id=:id AND op=:op';
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := danAdo.utils.getConnectionString;
   q1.SQL.Add(sql);
   q1.Parameters.ParamByName('id').Value := operation.id;
   q1.Parameters.ParamByName('op').Value := operation.operationType;
   q1.Parameters.ParamByName('date_op').Value := operation.date;
   q1.Parameters.ParamByName('sum_op').Value := operation.summa;
   q1.Parameters.ParamByName('percent_op').Value := operation.percentSumma;
   q1.Parameters.ParamByName('delay_op').Value := operation.delaySumma;
   q1.Parameters.ParamByName('id_contract_op').Value := operation.contract.id;
   q1.ExecSQL;
   q1.Destroy;
end;

end.
