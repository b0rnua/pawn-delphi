unit EventADO;

interface

uses
  ADODB, EventEntity, EmployeeADO, SysUtils, DateUtils, EventTypeADO, DanADO;

function getEventByDate(date: TDateTime):TEventEntity;
procedure addEvent(event: TEventEntity);
procedure eventAdd(ev : TEventEntity);

implementation

function getEventByDate(date: TDateTime):TEventEntity;
var
  q1: TADOQuery;
  sql: string;
  event: TEventEntity;
begin
  event := TEventEntity.Create;
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := danAdo.utils.getConnectionString;
  sql := 'SELECT * FROM event WHERE EventDate=#'+FormatDateTime('d/m/yyyy',date)+'#';
  q1.SQL.Add(sql);
  q1.Open;
  event.id := q1.FieldByName('id').AsInteger;
  event.eventDate := q1.FieldByName('EventDate').AsDateTime;
  event.eventText := q1.FieldByName('eventText').AsString;
  event.comment := q1.FieldByName('Comment').AsString;
  event.employee := TEmployeeADO.Create.getEmployeeById(q1.FieldByName('EmployeeId').AsVariant);
  event.eventType := EventTypeADO.getEventTypeByCode(q1.FieldByName('EventTypeId').AsVariant);
  q1.Close;
  q1.SQL.Clear;
  q1.Destroy;
  Result := event;
end;

procedure addEvent(event: TEventEntity);
var
  q1: TADOQuery;
  sql: string;
  pp : TDateTime;
begin
  pp := StrToDate(DateToStr(event.eventDate));
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := DanAdo.utils.getConnectionString;
  sql := 'INSERT INTO event'+
    ' (EventDate,EventText,Comment,EventTypeId,EmployeeId,timeStampField)'+
    ' VALUES (:EventDate,:eventText,:Comment,:EventTypeId,:EmployeeId,:timeStampField)';
  q1.SQL.Add(sql);
  q1.Parameters.ParamByName('EventDate').Value := pp;
  q1.Parameters.ParamByName('EventText').Value := event.eventText;
  q1.Parameters.ParamByName('EventTypeId').Value := event.eventTypeid;
  q1.Parameters.ParamByName('Comment').Value := event.comment;
  q1.Parameters.ParamByName('EmployeeId').Value := event.employeeId;
  q1.Parameters.ParamByName('timeStampField').Value := event.eventDate;
  q1.ExecSQL;
  q1.Destroy
end;

procedure eventAdd(ev : TEventEntity);
var
  q1: TADOQuery;
  sql: string;
begin
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := DanAdo.utils.getConnectionString;
  sql := 'INSERT INTO event'+
    ' (EventDate,EventText,Comment,EventTypeId,EmployeeId,timeStampField)'+
    ' VALUES (:EventDate,:eventText,:Comment,:EventTypeId,:EmployeeId,:timeStampField)';
  q1.SQL.Add(sql);
  q1.Parameters.ParamByName('EventDate').Value := ev.eventDate;
  q1.Parameters.ParamByName('EventText').Value := ev.eventText;
  q1.Parameters.ParamByName('Comment').Value := ev.comment;
  q1.Parameters.ParamByName('EventTypeId').Value := ev.eventTypeid;
  q1.Parameters.ParamByName('EmployeeId').Value := ev.employeeId;
  q1.Parameters.ParamByName('timeStampField').Value := now();
  q1.ExecSQL;
  q1.Destroy
end;

end.
