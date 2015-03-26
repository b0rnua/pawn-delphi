unit contractUtils;

interface

uses
  DANADO,SysUtils,Dialogs;

  type
    TPPrice  = (p583 = 583, p585 = 585);


  type
    TPrice = class(TObject)
      function getPriceOfTestFrom585(Test : Integer; price585 : Double) : Double;

    end;



var
  price : TPrice;
{ TPrice }

implementation

function TPrice.getPriceOfTestFrom585(test: Integer; price585: Double): Double;
var
res : Double;
begin
  res := 0;
  if ((test <> 0) AND (price585 <> 0)) then begin
    res := round((price585/585*test)*100)/100;
  end;
  RESULT := res;
end;

end.
