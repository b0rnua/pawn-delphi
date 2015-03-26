unit EventTypeADO;

interface

uses
 ADODB, EventTypeEntity, SysUtils, DanAdo;

function getEventTypeByCode(code: Integer):TEventTypeEntity;

implementation

function getEventTypeByCode(code: Integer):TEventTypeEntity;
var
  q1: TADOQuery;
  sql: string;
  eventType: TEventTypeEntity;
begin
  eventType := TEventTypeEntity.Create;
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := danAdo.utils.getConnectionString;
  sql := 'SELECT * FROM event_type WHERE eventCode='+IntToStr(code);
  q1.SQL.Add(sql);
  q1.Open;
    eventType.id := q1.FieldByName('id').AsInteger;
    eventType.eventType := q1.FieldByName('EventType').AsString;
    eventType.eventCode := q1.FieldByName('EventCode').AsInteger;
  q1.Close;
  q1.SQL.Clear;
  q1.Destroy;
  Result := eventType;
end;

end.
