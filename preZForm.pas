unit preZForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TpreZ = class(TForm)
    Label1: TLabel;
    Timer1: TTimer;
    Label2: TLabel;
    Label3: TLabel;
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  preZ: TpreZ;
  counter : Integer;

implementation

{$R *.dfm}

procedure TpreZ.Timer1Timer(Sender: TObject);
begin
  counter := counter -1;
  if ( counter = 0) then Close
  else Label2.Caption := IntToStr(counter);
end;

end.
