unit changepsw_form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, Mask;

type
  Tchangepsw = class(TForm)
    Button1: TButton;
    Button2: TButton;
    ADOQuery1: TADOQuery;
    StaticText1: TLabel;
    StaticText2: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  changepsw: Tchangepsw;

implementation

uses md5hash, main;

{$R *.dfm}

procedure Tchangepsw.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure Tchangepsw.Button1Click(Sender: TObject);
var
  wMsg: word;
begin
  ADOQuery1.SQL.Add('UPDATE setoptions SET passw=:ppsw WHERE passw=:ppswold');
  ADOQuery1.Parameters.ParamByName('ppsw').Value := MD5(MaskEdit2.Text);
  ADOQuery1.Parameters.ParamByName('ppswold').Value := MD5(MaskEdit1.Text);
  ADOQuery1.ExecSQL;
  if ADOQuery1.RowsAffected=0 then wMsg := MessageDlg('Неверный пароль!',mtError,[mbOk],0)
  else Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.Close
end;

end.
