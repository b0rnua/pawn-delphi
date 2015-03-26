unit promo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs;

type
  TForm6 = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  TPromo = class(TObject)
  public
    function getName() : String;

  end;
var
  Form6: TForm6;

implementation

{$R *.dfm}

{ TPromo }

function TPromo.getName: String;
begin
//
end;

end.
