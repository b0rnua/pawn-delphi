unit closeOp_form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DB, ADODB, xmldom, XMLIntf,
  msxmldom, XMLDoc, DANADO;

type
  TcloseOp = class(TForm)
    Button1: TButton;
    Button2: TButton;
    ADOQuery1: TADOQuery;
    StaticText1: TLabel;
    MaskEdit1: TMaskEdit;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure MaskEdit1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  closeOp: TcloseOp;

implementation

uses
  md5hash, main;
{$R *.dfm}

procedure TcloseOp.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TcloseOp.FormCreate(Sender: TObject);
begin
  ADOQuery1.ConnectionString := DANADO.utils.getConnectionString;
end;

procedure TcloseOp.Button1Click(Sender: TObject);
var
  wMsg: word;
  passw : String;
begin
   passw := MD5(MaskEdit1.Text);




  ADOQuery1.SQL.Add('SELECT passw FROM setoptions WHERE passw=:ppsw');
  ADOQuery1.Parameters.ParamByName('ppsw').Value := passw;
  ADOQuery1.Open;
  if (ADOQuery1.IsEmpty) and (administratorPassword <> passw) and (managerPassword <> passw) then begin
    MaskEdit1.Text := '';
    wMsg := MessageDlg('Неверный пароль!',mtError,[mbOk],0);
  end
  else begin

    bDeepOptions := true;

    if (administratorPassword = MD5(MaskEdit1.Text)) then begin
      form1.N28.Visible := true;
      form1.N20.Visible := true;
      form1.N33.Visible := true;
    end;
    Close;
  end;
  ADOQuery1.SQL.Clear;
  ADOQuery1.Close

end;

procedure TcloseOp.MaskEdit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (#13 = chr(key)) and (MaskEdit1.Text <> '') then begin
    Button1Click(Button1);
  end;
end;

end.
