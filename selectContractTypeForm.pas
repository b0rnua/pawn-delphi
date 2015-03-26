unit selectContractTypeForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, newContract_form, codeSMS,
  ExtCtrls;

type
  TselectContractType = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button7: TButton;
    Button8: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Panel1: TPanel;
    Button18: TButton;
    Button19: TButton;
    Button20: TButton;
    Button21: TButton;
    Button22: TButton;
    Button23: TButton;
    Label1: TLabel;
    Panel2: TPanel;
    Button24: TButton;
    Button25: TButton;
    Button26: TButton;
    Button27: TButton;
    Button28: TButton;
    Button29: TButton;
    Button30: TButton;
    Button31: TButton;
    Button32: TButton;
    Label2: TLabel;
    Panel3: TPanel;
    Label3: TLabel;
    Button33: TButton;
    Button34: TButton;
    Button35: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure Button20Click(Sender: TObject);
    procedure Button21Click(Sender: TObject);
    procedure Button22Click(Sender: TObject);
    procedure Button23Click(Sender: TObject);
    procedure Button30Click(Sender: TObject);
    procedure Button31Click(Sender: TObject);
    procedure Button32Click(Sender: TObject);
    procedure Button25Click(Sender: TObject);
    procedure Button26Click(Sender: TObject);
    procedure Button28Click(Sender: TObject);
    procedure Button24Click(Sender: TObject);
    procedure Button27Click(Sender: TObject);
    procedure Button29Click(Sender: TObject);
    procedure Button34Click(Sender: TObject);
    procedure Button33Click(Sender: TObject);
    procedure Button35Click(Sender: TObject);

  private
    procedure showNewContractWindow(id : Integer);

  public

  end;

var
  selectContractType: TselectContractType;



implementation
{$R *.dfm}

uses main, IniFiles;

procedure TselectContractType.Button10Click(Sender: TObject);
begin
   selectContractTypeForm.selectContractType.Close;
   showNewContractWindow(18);
end;

procedure TselectContractType.Button11Click(Sender: TObject);
begin
   //selectContractTypeForm.selectContractType.Close;
   //showNewContractWindow(26);
end;

procedure TselectContractType.Button12Click(Sender: TObject);
begin
       selectContractTypeForm.selectContractType.Close;
       showNewContractWindow(43);
end;

procedure TselectContractType.Button13Click(Sender: TObject);
begin
     selectContractTypeForm.selectContractType.Close;
     showNewContractWindow(39);
end;

procedure TselectContractType.Button14Click(Sender: TObject);
begin
     selectContractTypeForm.selectContractType.Close;
     showNewContractWindow(47);
end;

procedure TselectContractType.Button15Click(Sender: TObject);
begin
   selectContractTypeForm.selectContractType.Close;
   showNewContractWindow(51);
end;

procedure TselectContractType.Button16Click(Sender: TObject);
begin
   selectContractTypeForm.selectContractType.Close;
   showNewContractWindow(55);
end;

procedure TselectContractType.Button17Click(Sender: TObject);
begin
   selectContractTypeForm.selectContractType.Close;
   showNewContractWindow(59);
end;

procedure TselectContractType.Button18Click(Sender: TObject);
begin
   selectContractTypeForm.selectContractType.Close;
   showNewContractWindow(149);
end;

procedure TselectContractType.Button19Click(Sender: TObject);
begin
   selectContractTypeForm.selectContractType.Close;
   showNewContractWindow(157);
end;

procedure TselectContractType.Button1Click(Sender: TObject);
begin
     selectContractTypeForm.selectContractType.Close;
     showNewContractWindow(1);
end;

procedure TselectContractType.Button20Click(Sender: TObject);
begin
   selectContractTypeForm.selectContractType.Close;
   showNewContractWindow(165);
end;

procedure TselectContractType.Button21Click(Sender: TObject);
begin
   selectContractTypeForm.selectContractType.Close;
   showNewContractWindow(153);
end;

procedure TselectContractType.Button22Click(Sender: TObject);
begin
   selectContractTypeForm.selectContractType.Close;
   showNewContractWindow(161);
end;

procedure TselectContractType.Button23Click(Sender: TObject);
begin
   selectContractTypeForm.selectContractType.Close;
   showNewContractWindow(169);
end;

procedure TselectContractType.Button24Click(Sender: TObject);
begin
   selectContractTypeForm.selectContractType.Close;
   showNewContractWindow(181);
end;

procedure TselectContractType.Button25Click(Sender: TObject);
begin
   selectContractTypeForm.selectContractType.Close;
   showNewContractWindow(177);
end;

procedure TselectContractType.Button26Click(Sender: TObject);
begin
   selectContractTypeForm.selectContractType.Close;
   showNewContractWindow(189);
end;

procedure TselectContractType.Button27Click(Sender: TObject);
begin
   selectContractTypeForm.selectContractType.Close;
   showNewContractWindow(193);
end;

procedure TselectContractType.Button28Click(Sender: TObject);
begin
   selectContractTypeForm.selectContractType.Close;
   showNewContractWindow(201);
end;

procedure TselectContractType.Button29Click(Sender: TObject);
begin
   selectContractTypeForm.selectContractType.Close;
   showNewContractWindow(205);
end;

procedure TselectContractType.Button2Click(Sender: TObject);
begin
     selectContractTypeForm.selectContractType.Close;
     showNewContractWindow(2);
end;

procedure TselectContractType.Button30Click(Sender: TObject);
begin
   selectContractTypeForm.selectContractType.Close;
   showNewContractWindow(173);
end;

procedure TselectContractType.Button31Click(Sender: TObject);
begin
   selectContractTypeForm.selectContractType.Close;
   showNewContractWindow(185);
end;

procedure TselectContractType.Button32Click(Sender: TObject);
begin
   selectContractTypeForm.selectContractType.Close;
   showNewContractWindow(197);
end;

procedure TselectContractType.Button33Click(Sender: TObject);
begin
      selectContractTypeForm.selectContractType.Close;
      showNewContractWindow(137);
end;

procedure TselectContractType.Button34Click(Sender: TObject);
begin
      selectContractTypeForm.selectContractType.Close;
      showNewContractWindow(141);
end;

procedure TselectContractType.Button35Click(Sender: TObject);
begin
      selectContractTypeForm.selectContractType.Close;
      showNewContractWindow(145);
end;

procedure TselectContractType.Button3Click(Sender: TObject);
begin
      selectContractTypeForm.selectContractType.Close;
      showNewContractWindow(3);
end;

procedure TselectContractType.Button4Click(Sender: TObject);
begin
      selectContractTypeForm.selectContractType.Close;
      showNewContractWindow(4);
end;

procedure TselectContractType.Button5Click(Sender: TObject);
begin
      selectContractTypeForm.selectContractType.Close;
      showNewContractWindow(5);
end;

procedure TselectContractType.Button6Click(Sender: TObject);
begin
      selectContractTypeForm.selectContractType.Close;
      showNewContractWindow(6);
end;

procedure TselectContractType.Button7Click(Sender: TObject);
begin

  selectContractTypeForm.selectContractType.Close;
  sleep(1000);
  codeSMS.Form4.setPromoTarifId(31);
  codeSMS.Form4.ShowModal;
end;

procedure TselectContractType.Button8Click(Sender: TObject);
begin
  selectContractTypeForm.selectContractType.Close;
  sleep(1000);
  codeSMS.Form4.setPromoTarifId(35);
  codeSMS.Form4.ShowModal;
end;

procedure TselectContractType.Button9Click(Sender: TObject);
begin
   selectContractTypeForm.selectContractType.Close;
   showNewContractWindow(10);
end;





procedure TselectContractType.FormShow(Sender: TObject);
var
  IniFile: TIniFile;
  TarifButton1 : String;
  TarifButton2 : String;
  TarifButton3 : String;
  TarifLoyal : String;
begin
  panel1.Hide;
  panel2.Hide;
  panel3.Hide;
  selectContractType.Height := 180;
  IniFile := TIniFile.Create('c:\pawn\options.ini');
  TarifButton1 := IniFile.ReadString('newContract', 'tarifButton1', '4');
  TarifButton2 := IniFile.ReadString('newContract', 'tarifButton2', '4');
  TarifButton3 := IniFile.ReadString('newContract', 'tarifButton3', '4');
  TarifLoyal := IniFile.ReadString('loyal','group','0');


  if (TarifButton2 = '5') then begin
    button15.Left := 284;
    button16.Left := 284;
    button17.Left := 284;
    button7.Left := 429;
    button8.Left := 429;
  end else begin
    button15.Hide;
    button16.Hide;
    button17.Hide;
  end;
  if (TarifButton1 = '5') then begin
    button10.Hide;
    button11.Hide;
    button1.Hide;
    button2.Hide;
    button3.Hide;
    button12.Left := 2;
    button13.Left := 2;
    button14.Left := 2;
  end else begin
    button12.Hide;
    button13.Hide;
    button14.Hide;
  end;
  if (TarifButton3 = '5') then begin
    selectContractType.Height := 300;
    panel1.Show;
  end;
  if (TarifButton3 = '6') then begin
    selectContractType.Height := 300;
    panel2.Show;
  end;
  if (TarifLoyal = '1') then begin
    selectContractType.Height := 300;
    panel3.Show;
  end;
end;

procedure TselectContractType.showNewContractWindow(id : Integer);
begin
    newContract_form.newContract := TnewContract.Create(self);
    newContract_form.newContract.contractType := id;
    newContract_form.newContract.mainContractType := id;
    newContract_form.newContract.contractTypeGroup := id;
    newContract_form.newContract.ShowModal;
end;

end.
