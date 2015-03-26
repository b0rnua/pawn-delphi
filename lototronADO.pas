unit lototronADO;

interface

uses
  ADODB, SysUtils, Dialogs, MyUtils, lototronEntity, DANADO;

type
  TLototronADO = class(TObject)
    public
      function getLototronByIdContract(idContract1 : Integer) : TLototron;
      procedure updateLototronByIdContract(loto : TLototron);
      procedure addLototron(loto: TLototron);
  end;
implementation

{ TLototronADO }

procedure TLototronADO.addLototron(loto: TLototron);
var
  q1 : TADOQuery;
  sql1 : String;
begin
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := DANADO.utils.getConnectionString;
   sql1 := 'UPDATE lototron SET idDeliverer=:pIdDeliverer, ticket=:pTicket, sell=:pSell WHERE idContract=:pIdContract';
  //sql1 := 'INSERT INTO lototron (idContract, idDeliverer, ticket, sell) VALUES (:pIdContract, :pIdDeliverer, :pTicket, :pSell)';
  q1.SQL.Add(sql1);
  q1.Parameters.ParamByName('pIdContract').Value := loto.getIdContract;
  q1.Parameters.ParamByName('pIdDeliverer').Value := loto.getIdDeliverer;
  if (loto.getTicket = '') then loto.setTicket('0');
  if (loto.getSell = '') then loto.setSell('0');
  q1.Parameters.ParamByName('pTicket').Value := loto.getTicket;
  q1.Parameters.ParamByName('pSell').Value := loto.getSell;
  q1.ExecSQL;
  q1.Close;
  q1.Destroy;
end;

function TLototronADO.getLototronByIdContract(idContract1 : Integer): TLototron;
var
  q1 : TADOQuery;
  sql1 : String;
  loto : TLototron;
begin
  loto := TLototron.Create;
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := DANADO.utils.getConnectionString;
  sql1 := 'SELECT * FROM lototron WHERE idContract = :pIdContract';
  q1.SQL.Add(sql1);
  q1.Parameters.ParamByName('pIdContract').Value := idContract1;
    q1.Open;
    loto.setIdContract(q1.FieldByName('idContract').AsInteger);
    loto.setIdDeliverer(q1.FieldByName('idDeliverer').AsInteger);
    loto.setTicket(q1.FieldByName('ticket').AsString);
    loto.setSell(q1.FieldByName('sell').AsString);

    if (loto.getIdContract = 0) then
      begin
        Q1.SQL.Clear;
        Q1.SQL.Add('INSERT INTO lototron (idContract, idDeliverer, ticket, sell, timeStampField ) VALUES (:pide, :pidDeliverer, :pTicket, :pSell, :ptimeStampField)');
                Q1.Parameters.ParamByName('pide').Value := idContract1;
                Q1.Parameters.ParamByName('pidDeliverer').Value := 0;
                Q1.Parameters.ParamByName('pTicket').Value := '0';
                Q1.Parameters.ParamByName('pSell').Value := '0';
                Q1.Parameters.ParamByName('ptimeStampField').Value := Now();
                Q1.ExecSQL;
        loto.setIdContract(idContract1);
        loto.setIdDeliverer(0);
        loto.setTicket('');
        loto.setSell('');
      end;
  RESULT := loto;
end;

procedure TLototronADO.updateLototronByIdContract(loto: TLototron);
begin

end;

end.
