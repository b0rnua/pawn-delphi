unit LogBookEmployee;

interface

uses
 ADODB, DateUtils, EmployeeADO, MyUtils, DANADO;

function getStatusFromBD() : boolean;
procedure setStatusButton(Status: boolean);
//procedure addEvent(Status: boolean);

implementation

uses
  main;

function getStatusFromBD() : boolean;
var
  q1: TADOQuery;
  sql: string;
begin
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := DANADO.utils.getConnectionString;
  sql := 'SELECT id, EventTypeId, EmployeeId FROM event WHERE (EventTypeId = 8) OR (EventTypeId = 7) ORDER BY id DESC';
end;
procedure setStatusButton(Status: boolean);
begin
    if (Status) then
    begin
      Form1.Panel10.Visible := FALSE;
      Form1.Panel11.Visible := TRUE;
    end
    else
     begin
      Form1.Panel10.Visible := TRUE;
      Form1.Panel11.Visible := FALSE;
    end;
end;

end.
