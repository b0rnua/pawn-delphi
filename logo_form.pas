unit logo_form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls;

type
  Tlogo = class(TForm)
    Timer1: TTimer;
    Image1: TImage;
    Timer2: TTimer;
    Panel1: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    Button1: TButton;
    procedure Timer1Timer(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  logo: Tlogo;

implementation

{$R *.dfm}

procedure Tlogo.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  Close;
end;

procedure Tlogo.FormPaint(Sender: TObject);
begin
 Canvas.Brush.Color:=Color;
 Canvas.BrushCopy(Rect(0,0,Image1.Width,Image1.Height),
 Image1.Picture.Bitmap,
 Rect(0,0,Image1.Width,Image1.Height),
 Image1.Picture.Bitmap.Canvas.Pixels[40,40]);
end;

procedure Tlogo.Timer2Timer(Sender: TObject);
begin
 if ((StrToInt(Label1.Caption))>=0) then begin
  Label1.Caption :=  IntToStr(StrToInt(Label1.Caption)-1);
 end;
end;

procedure Tlogo.Button1Click(Sender: TObject);
begin
Timer1.Enabled := False;
Close;
end;

end.
