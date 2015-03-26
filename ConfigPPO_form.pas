unit ConfigPPO_form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IniFiles;

type
  TConfigPPO = class(TForm)
    btn1: TButton;
    btn2: TButton;
    lbl1: TLabel;
    edt1: TEdit;
    txt1: TLabel;
    txt2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ConfigPPO: TConfigPPO;
  IniFile: TIniFile;

implementation

{$R *.dfm}
uses
  main;

procedure TConfigPPO.FormCreate(Sender: TObject);
begin
  if bPPOStatus then begin
    lbl1.Caption := 'Подключен';
    btn1.Enabled := False;
  end
  else begin
    lbl1.Caption := 'Отключен';
    btn2.Enabled := False;
  end;
  edt1.Text := sPPOCom;
end;

procedure TConfigPPO.btn1Click(Sender: TObject);
begin
  bPPOStatus := True;
  sPPOCom := edt1.Text;
  lbl1.Caption := 'Подключен';
  IniFile := TIniFile.Create('c:\pawn\options.ini');
  IniFile.WriteBool('ppo','status',True);
  IniFile.WriteString('ppo','com',edt1.Text);
  IniFile.Free;
  btn1.Enabled := False;
  btn2.Enabled := True;
end;

procedure TConfigPPO.btn2Click(Sender: TObject);
begin
  bPPOStatus := False;
  lbl1.Caption := 'Отключен';
  IniFile := TIniFile.Create('c:\pawn\options.ini');
  IniFile.WriteBool('ppo','status',False);
  IniFile.Free;
  btn1.Enabled := True;
  btn2.Enabled := False;
end;

end.
