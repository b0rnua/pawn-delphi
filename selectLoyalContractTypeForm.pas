unit selectLoyalContractTypeForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, newContract_form, StdCtrls,
  ExtCtrls, codesms;

type
  TForm12 = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Label1: TLabel;
    Panel2: TPanel;
    Label2: TLabel;
    Button24: TButton;
    Button25: TButton;
    Button26: TButton;
    Button27: TButton;
    Button28: TButton;
    Button29: TButton;
    Button30: TButton;
    Button31: TButton;
    Button32: TButton;
    Panel3: TPanel;
    Label3: TLabel;
    Button18: TButton;
    Button19: TButton;
    Button20: TButton;
    Button21: TButton;
    Button22: TButton;
    Button23: TButton;
    Button4: TButton;
    Panel4: TPanel;
    Label4: TLabel;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Label5: TLabel;
    Button8: TButton;
    Button9: TButton;
    procedure Button18Click(Sender: TObject);
    procedure showNewContractWindow(id1 : Integer);
    procedure Button19Click(Sender: TObject);
    procedure Button20Click(Sender: TObject);
    procedure Button21Click(Sender: TObject);
    procedure Button22Click(Sender: TObject);
    procedure Button30Click(Sender: TObject);
    procedure Button31Click(Sender: TObject);
    procedure Button32Click(Sender: TObject);
    procedure Button25Click(Sender: TObject);
    procedure Button26Click(Sender: TObject);
    procedure Button28Click(Sender: TObject);
    procedure Button24Click(Sender: TObject);
    procedure Button27Click(Sender: TObject);
    procedure Button29Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button23Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
 Form12: TForm12;

implementation

uses
  IniFiles;
var

  IniFile: TIniFile;




{$R *.dfm}

procedure TForm12.Button19Click(Sender: TObject);
begin
  selectLoyalContractTypeForm.form12.Close;
  showNewContractWindow(157);
end;

procedure TForm12.Button1Click(Sender: TObject);
begin
selectLoyalContractTypeForm.form12.Close;
  showNewContractWindow(141);
end;

procedure TForm12.Button20Click(Sender: TObject);
begin
selectLoyalContractTypeForm.form12.Close;
  showNewContractWindow(165);
end;

procedure TForm12.Button21Click(Sender: TObject);
begin
selectLoyalContractTypeForm.form12.Close;
  showNewContractWindow(153);
end;

procedure TForm12.Button22Click(Sender: TObject);
begin
selectLoyalContractTypeForm.form12.Close;
  showNewContractWindow(161);
end;

procedure TForm12.Button23Click(Sender: TObject);
begin
selectLoyalContractTypeForm.form12.Close;
  showNewContractWindow(169);
end;

procedure TForm12.Button24Click(Sender: TObject);
begin
selectLoyalContractTypeForm.form12.Close;
showNewContractWindow(181);
end;

procedure TForm12.Button25Click(Sender: TObject);
begin
selectLoyalContractTypeForm.form12.Close;
  showNewContractWindow(177);
end;

procedure TForm12.Button26Click(Sender: TObject);
begin
selectLoyalContractTypeForm.form12.Close;
showNewContractWindow(189);
end;

procedure TForm12.Button27Click(Sender: TObject);
begin
selectLoyalContractTypeForm.form12.Close;
  showNewContractWindow(193);
end;

procedure TForm12.Button28Click(Sender: TObject);
begin
selectLoyalContractTypeForm.form12.Close;
  showNewContractWindow(201);
end;

procedure TForm12.Button29Click(Sender: TObject);
begin
selectLoyalContractTypeForm.form12.Close;
  showNewContractWindow(205);
end;

procedure TForm12.Button2Click(Sender: TObject);
begin
  selectLoyalContractTypeForm.form12.Close;
  showNewContractWindow(137);
end;

procedure TForm12.Button30Click(Sender: TObject);
begin
  selectLoyalContractTypeForm.form12.Close;
  showNewContractWindow(173);
end;

procedure TForm12.Button31Click(Sender: TObject);
begin
  selectLoyalContractTypeForm.form12.Close;
  showNewContractWindow(185);
end;

procedure TForm12.Button32Click(Sender: TObject);
begin
  selectLoyalContractTypeForm.form12.Close;
  showNewContractWindow(197);
end;

procedure TForm12.Button3Click(Sender: TObject);
begin
  selectLoyalContractTypeForm.form12.Close;
  showNewContractWindow(145);
end;

procedure TForm12.Button4Click(Sender: TObject);
begin
  newContract_form.newContract := TnewContract.Create(self);
  newContract.chk1.Checked := True;
  selectLoyalContractTypeForm.form12.Close;

  showNewContractWindow(3);
end;

procedure TForm12.Button5Click(Sender: TObject);
var
  iniFiletmp : Integer;
  contrGroup : Integer;
begin
  contrGroup := 4;
  IniFile := TIniFile.Create('c:\pawn\options.ini');
  iniFileTMP := IniFile.ReadInteger('newContract', 'prikaz22', 1);
//if (iniFileTMP = 5) then contrGroup := 9;
  selectLoyalContractTypeForm.form12.Close;
  showNewContractWindow(contrGroup);
end;


procedure TForm12.Button6Click(Sender: TObject);
var
iniFiletmp : Integer;
contrGroup : Integer;
begin
  contrGroup := 5;
  IniFile := TIniFile.Create('c:\pawn\options.ini');
  iniFileTMP := IniFile.ReadInteger('newContract', 'prikaz22', 1);
//if (iniFileTMP = 5) then contrGroup := 11;
  selectLoyalContractTypeForm.form12.Close;
  showNewContractWindow(contrGroup);
end;

procedure TForm12.Button7Click(Sender: TObject);
var
iniFiletmp : Integer;
contrGroup : Integer;
begin
  contrGroup := 6;
  IniFile := TIniFile.Create('c:\pawn\options.ini');
  iniFileTMP := IniFile.ReadInteger('newContract', 'prikaz22', 1);
//if (iniFileTMP = 5) then contrGroup := 13;
  selectLoyalContractTypeForm.form12.Close;
  showNewContractWindow(contrGroup);
end;

procedure TForm12.Button8Click(Sender: TObject);
begin
  newContract_form.newContract := TnewContract.Create(self);
  newContract.chk1.Checked := True;
  selectLoyalContractTypeForm.form12.Close;

  showNewContractWindow(777);
end;

procedure TForm12.FormCreate(Sender: TObject);
begin
  Panel2.Hide;
  panel3.Hide;
  button8.Hide;
end;

procedure TForm12.showNewContractWindow(id1 : Integer);
begin
  newContract_form.newContract := TnewContract.Create(self);
  newContract_form.newContract.contractType := id1;
  newContract_form.newContract.mainContractType := id1;
  newContract_form.newContract.contractTypeGroup := id1;
  newContract_form.newContract.ShowModal;
end;

procedure TForm12.Button18Click(Sender: TObject);
begin
  selectLoyalContractTypeForm.form12.Close;
  showNewContractWindow(149);
end;

end.
