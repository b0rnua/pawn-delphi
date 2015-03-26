unit enTarif;

interface

uses
  SysUtils,Dialogs, enProduct,enOperation, ADODB;
type

  tenTarif = Class(TObject)
    private
      percent : string;
      TestPrice : string;
    public
      procedure setPercent(id1 : string);
      procedure setTestPrice(id1 : string);
      function getPercent() : string;
      function getTestPrice() : string;
  end;

implementation

{ tenTarif }

function tenTarif.getPercent: string;
begin
  RESULT := self.percent;
end;

function tenTarif.getTestPrice: string;
begin
  RESULT := self.testPrice;
end;

procedure tenTarif.setPercent(id1: string);
begin
   self.percent := id1;
end;

procedure tenTarif.setTestPrice(id1: string);
begin
   self.testPrice := id1;
end;

end.
