unit DelivererADO;

interface

uses
  ADODB, DelivererEntity, SysUtils, DanAdo;

type
 TDelivererADO = class(TObject)
   public
   function getDelivererById(id: Longint): TDelivererClass;
 end;

implementation

{ TDelivererADO }

function TDelivererADO.getDelivererById(id: Integer): TDelivererClass;
var
  q1: TADOQuery;
  sql: string;
  deliverer: TDelivererClass;
begin
  deliverer := TDelivererClass.Create;
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := danAdo.utils.getConnectionString;
  sql := 'SELECT * FROM deliverer WHERE id='+IntToStr(id);
  q1.SQL.Add(sql);
  q1.Open;
    deliverer.id := id;
    deliverer.name := q1.FieldByName('name').AsString;
    deliverer.passport := q1.FieldByName('pasport_ser').AsString;
    deliverer.passportNumber := q1.FieldByName('pasport_num').AsString;
    deliverer.issuingPassport := q1.FieldByName('pasport_vydan').AsString;
    deliverer.dateOfIssue := q1.FieldByName('pasport_date').AsDateTime;
  q1.Close;
  q1.SQL.Clear;
  q1.Destroy;
  Result := deliverer;
end;

end.
