unit EmployeeADO;

interface

uses
  ADODB, EmployeeEntity, SysUtils, DanAdo;

type
  TEmployeeADO = class(TObject)
    public
      function getEmployeeById(id: Longint): TEmployee;
  end;

implementation

{ TEmployeeADO }

function TEmployeeADO.getEmployeeById(id: Integer): TEmployee;
var
  q1: TADOQuery;
  sql: string;
  employee: TEmployee;
begin
  // изменённый комментарий
  employee := TEmployee.Create;
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := danAdo.utils.getConnectionString;
  sql := 'SELECT * FROM employee WHERE id='+IntToStr(id);
  q1.SQL.Add(sql);
  q1.Open;
    employee.id := id;
    employee.name := q1.FieldByName('name').AsString;
    employee.warrant_num := q1.FieldByName('warrant_num').AsInteger;
    employee.warrant_date := q1.FieldByName('warrant_date').AsString;
    employee.hideEmployee := q1.FieldByName('hideEmployee').AsBoolean;
    employee.pass := q1.FieldByName('pass').AsString;
    employee.Instruction := q1.FieldByName('Instruction').AsInteger;
  q1.Close;
  q1.SQL.Clear;
  q1.Destroy;
  Result := employee;
end;

end.
