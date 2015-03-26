unit Loyalty;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, ExtCtrls, enLoyalty, DANADO, enDeliverer;

type
  TForm14 = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    Panel1: TPanel;
    CheckBox1: TCheckBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Panel2: TPanel;
    CheckBox2: TCheckBox;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    Edit3: TEdit;
    Edit4: TEdit;
    Panel3: TPanel;
    Edit5: TEdit;
    CheckBox3: TCheckBox;
    Label2: TLabel;
    Label3: TLabel;
    Edit6: TEdit;
    CheckBox4: TCheckBox;
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
    procedure radiobuttonGroup1click();
    procedure radiobuttonGroup2click();
    procedure clearEdits();
    function setIdTarif() : Integer;
    procedure Button1Click(Sender: TObject);
    procedure fillFormFromloyal(loyal : TENLoyalty);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form14: TForm14;
  idTarif : Integer;
  idDeliverer : Integer;
  loyalDeliv : TENDeliverer;
  loyalADO : ADOloyalty;
  loyal : TENloyalty;
  formPrice : Double;
  formPercent : Double;
implementation

uses
  deliverer_form;
{$R *.dfm}

procedure TForm14.Button1Click(Sender: TObject);
begin
  formPrice := 0;
  formPercent:=0;
  loyal.IdLoyalty := setidTarif;
  Loyal.option1 := formPercent;
  loyal.option2 := formPrice;
  loyal.EditDate := StrToDate(DateToStr(now));


 // loyal.showLoyalty(loyal);


  if (loyalADO.checkLoyaltyByIdDeliverer(loyalDeliv.getId)) then begin
    loyalADO.setLoyaltyByIdDeliverer(loyal);
  end else begin
    loyalADO.addLoyalty(loyal);
  end;


end;

procedure TForm14.Button2Click(Sender: TObject);
begin
  close;
end;

procedure TForm14.CheckBox1Click(Sender: TObject);
begin
  if checkBox1.Checked then begin
      radioButton1.Enabled := True;
      radioButton2.Enabled := True;
       button1.Enabled := True;
  end else begin
      radioButton1.Enabled := False;
      radioButton2.Checked := true;
      radioButton2.Enabled := False;
      if  (checkBox2.Checked) then
      else begin button1.Enabled := false;
      clearEdits;
      end;
  end;
end;

procedure TForm14.CheckBox2Click(Sender: TObject);
begin
  if checkBox2.Checked then begin
      radioButton3.Enabled := True;
      radioButton4.Enabled := True;
      button1.Enabled := True;
  end else begin
      radioButton3.Enabled := False;
      radioButton4.Checked := true;
      radioButton4.Enabled := False;
      if  (checkBox1.Checked) then
        else begin button1.Enabled := false;

      clearEdits;

      end;
  end;
end;

procedure TForm14.clearEdits;
begin
  edit1.Text := '';
  edit2.Text := '';
  edit3.Text := '';
  edit4.Text := '';
end;

procedure TForm14.fillFormFromloyal(loyal: TENLoyalty);
begin

  if (loyal.Id <> 0) then begin
   // ShowMessage('fillFormFromloyal');
    checkbox1.Checked := True;
    checkbox2.Checked := True;
    if (loyal.IdLoyalty = 10 ) then begin
      radiobutton1.Enabled := true;
      radiobutton1.Checked := true;
      radiobutton3.Enabled := true;
      radiobutton3.Checked := true;
      edit1.Text := FloatToStr(loyal.option1);
      edit3.Text := FloatToStr(loyal.option2);
   end;
   if (loyal.IdLoyalty = 11 ) then begin
      radiobutton1.Enabled := true;
      radiobutton1.Checked := true;
      radiobutton4.Enabled := true;
      radiobutton4.Checked := true;
      edit1.Text := FloatToStr(loyal.option1);
      edit4.Text := FloatToStr(loyal.option2);
   end;
   if (loyal.IdLoyalty = 12 ) then begin
      radiobutton2.Enabled := true;
      radiobutton2.Checked := true;
      radiobutton3.Enabled := true;
      radiobutton3.Checked := true;
      edit2.Text := FloatToStr(loyal.option1);
      edit3.Text := FloatToStr(loyal.option2);
   end;
   if (loyal.IdLoyalty = 14 ) then begin
      radiobutton2.Enabled := true;
      radiobutton2.Checked := true;
      radiobutton4.Enabled := true;
      radiobutton4.Checked := true;
      edit2.Text := FloatToStr(loyal.option1);
      edit4.Text := FloatToStr(loyal.option2);
   end;


  end;

end;

procedure TForm14.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Button1.Enabled := False;
  radioButton1.Enabled := False;
  radioButton2.Enabled := False;
  radioButton3.Enabled := False;
  radioButton4.Enabled := False;
  edit1.Enabled := false;
  edit2.Enabled := false;
  edit3.Enabled := false;
  edit4.Enabled := false;
end;

procedure TForm14.FormCreate(Sender: TObject);
begin
  idTarif := 0;
  Button1.Enabled := False;
  radioButton1.Enabled := False;
  radioButton2.Enabled := False;
  radioButton3.Enabled := False;
  radioButton4.Enabled := False;
  edit1.Enabled := false;
  edit2.Enabled := false;
  edit3.Enabled := false;
  edit4.Enabled := false;
 // loyalDeliv := TENDeliverer.Create;
end;

procedure TForm14.FormShow(Sender: TObject);
begin
   loyalDeliv := TENdeliverer.Create;
   loyalDeliv := DANADO.deliverer.getDelivererById(iClientID);
   loyalADO := ADOLoyalty.Create;
   loyal := TENloyalty.Create;
   if (loyalADO.checkLoyaltyByIdDeliverer(loyalDeliv.getId)) then begin
     loyal := loyalADO.getLoyaltyByIdDeliverer(loyalDeliv.getId);
     fillFormFromloyal(loyal);
   end;
end;

procedure TForm14.RadioButton1Click(Sender: TObject);
begin
  radiobuttonGroup1click;
end;

procedure TForm14.RadioButton2Click(Sender: TObject);
begin
  radiobuttonGroup1click;
end;

procedure TForm14.RadioButton3Click(Sender: TObject);
begin
  radiobuttonGroup2click;
end;

procedure TForm14.RadioButton4Click(Sender: TObject);
begin
  radiobuttonGroup2click;
end;

procedure TForm14.radiobuttonGroup1click;
begin
  if (radioButton1.Checked) then begin
    edit1.Enabled := true;
    edit2.Enabled := false;
    edit2.Text := '';
  end
  else begin
    edit1.Enabled := false;
    edit2.Enabled := true;
    edit1.Text := '';
  end;
end;

procedure TForm14.radiobuttonGroup2click;
begin
  if (radioButton3.Checked) then begin
    edit3.Enabled := true;
    edit4.Enabled := false;
    edit4.Text := '';
  end
  else begin
    edit3.Enabled := false;
    edit4.Enabled := true;
    edit4.Text := '';
  end;
end;

function TForm14.setIdTarif;
begin
  if (radioButton1.Checked) then begin
    formPercent := strToFloat(edit1.Text);
    if (radioButton3.Checked) then begin
        idTarif := 10;

        formPrice := strToFloat(edit3.Text);
    end else begin
        idTarif := 11;
        formPrice := strToFloat(edit4.Text);
    end;
  end else begin
    ShowMessage('YThen');
    formPercent := strToFloat(edit2.Text);
    if (radioButton3.Checked) then begin
          idTarif := 12;
          formPrice := strToFloat(edit3.Text);
    end else begin
          idTarif := 13;
          formPrice := strToFloat(edit4.Text);
    end;
  end;
  RESULT := idTarif;
end;

end.
