unit lototronEntity;

interface

uses
  promo,dialogs;

type
  TLototron = class(TObject)
    private
      id : Integer;
      idContract  : Integer;
      idDeliverer : Integer;

      sell : String;
    public
    ticket : String;
      procedure setIdContract(idContract1 : Integer);
      procedure setIdDeliverer(idDeliverer1 : Integer);
      procedure setTicket(ticket1 : String);
      procedure setSell(sell1 : String);
      function getIdContract() : Integer;
      function getIdDeliverer() : Integer;
      function getTicket() : String;
      function getSell() : String;
      function getName() : String;
  end;

implementation

{ TLototron }

function TLototron.getIdContract: Integer;
begin
  RESULT := self.idContract;
end;

function TLototron.getIdDeliverer: Integer;
begin
  RESULT := self.idDeliverer;
end;

function TLototron.getName: String;
begin
 // RESULT := self.
end;

function TLototron.getSell: String;
begin
  RESULT := self.sell;
end;

function TLototron.getTicket: String;
begin
  RESULT := self.ticket;
end;

procedure TLototron.setIdContract(idContract1: Integer);
begin
  self.idContract := idContract1;
end;

procedure TLototron.setIdDeliverer(idDeliverer1: Integer);
begin
  self.idDeliverer := idDeliverer1;
end;

procedure TLototron.setSell(sell1: String);
begin
  self.sell := sell1;
end;

procedure TLototron.setTicket(ticket1: String);
begin
  self.ticket := ticket1;
end;

end.
