unit piecePay;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, enArrears;

type
  TForm17 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form17: TForm17;

implementation

uses
  repawning_form;
{$R *.dfm}

procedure TForm17.Button1Click(Sender: TObject);
begin
  if (StrToFloat(label3.Caption) <= StrToFloat(Edit1.Text)) then
  begin
    repawning_form.repawning.piecePayApply(Edit1.Text);
    close;
  end;
end;

procedure TForm17.Button2Click(Sender: TObject);
begin
  close;
end;

procedure TForm17.Edit1KeyPress(Sender: TObject; var Key: Char);
var
  f : Double;
  s : Double;
  e : double;
begin
  if Key = #13 then Button1.SetFocus;
  if (Key in ['.']) then Key := ',';
  if not (Key in ['0'..'9', ',', #8]) then Key := #0;


end;

procedure TForm17.Edit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  f,s,e : Double;
begin
  if NOT (TryStrToFloat(edit1.Text,f)) then edit1.Text := '';
  s := StrToFloat(repawning_form.repawning.label17.Caption);
  e := StrToFloat(Edit1.Text);
  if (e >= s) then edit1.Text := '';
end;

procedure TForm17.FormShow(Sender: TObject);
begin
  edit1.Text := '';
  edit1.SetFocus;
end;

end.
