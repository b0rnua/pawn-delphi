unit AddClient_form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, ADODB, Mask, DateUtils,Loyalty, ExtCtrls,
  enLoyalty;

type
  TAddClient = class(TForm)
    btn1: TButton;
    btn2: TButton;
    q1: TADOQuery;
    edt1: TEdit;
    edt2: TEdit;
    edt3: TEdit;
    edt4: TEdit;
    edt5: TEdit;
    edt6: TEdit;
    edt7: TEdit;
    edt9: TEdit;
    txt11: TLabel;
    txt1: TLabel;
    txt2: TLabel;
    txt3: TLabel;
    txt4: TLabel;
    txt5: TLabel;
    txt6: TLabel;
    txt7: TLabel;
    txt8: TLabel;
    txt9: TLabel;
    dtp1: TDateTimePicker;
    dtp2: TDateTimePicker;
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    ComboBox1: TComboBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    Edit2: TEdit;
    Edit3: TEdit;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    Label2: TLabel;
    Label3: TLabel;
    RadioButton1: TRadioButton;
    Panel2: TPanel;
    RadioButton2: TRadioButton;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Button2: TButton;
    Button3: TButton;
    TabSheet3: TTabSheet;
    procedure btn2Click(Sender: TObject);
    procedure edt1KeyPress(Sender: TObject; var Key: Char);
    procedure btn1Click(Sender: TObject);
    procedure edt6KeyPress(Sender: TObject; var Key: Char);
    procedure edt7KeyPress(Sender: TObject; var Key: Char);
    procedure edt4KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    function checkBirthDay(bDay: TDAteTime) : boolean;
    procedure fillDelivererFromId(id1 : Integer);
    function getIdTarifToText(id1 : Integer) : String;
    procedure Button1Click(Sender: TObject);
    function checkEdits() : Boolean;
    procedure ComboBox1Change(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure fillLoyaltyToForm(loyal : TENLoyalty);
    function createIdLoyalty() : Integer;
    procedure Button2Click(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    function CheckFloat(id1 : String) : Boolean;
    procedure Edit3Exit(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AddClient: TAddClient;

implementation

uses
  main, deliverer_form,danado;

{$R *.dfm}

procedure TAddClient.btn2Click(Sender: TObject);
begin
  //bEditMark := False;
  Close;
end;

procedure TAddClient.Button1Click(Sender: TObject);
var
  sTmpDate: string;
  ii: Integer;
  q2 :TADOQuery;
  q5 : TADOQuery;
  sql2 : String;
  sql3 : String;
begin


  if (checkEdits) then  begin
    q2 := TADOQuery.create(nil);
    q2.ConnectionString := danAdo.utils.getConnectionString;
    sql2 := 'SELECT id FROM deliverer WHERE telephon = :tlphn';
    q2.SQL.Add(sql2);
    q2.Parameters.ParamByName('tlphn').Value := edt7.Text;
    q2.Open;
    if (q2.RecordCount = 0) then begin
      q5 := TADOQuery.create(nil);
      q5.ConnectionString := danAdo.utils.getConnectionString;
      sql3 := 'INSERT INTO deliverer (name,date_of_burn,adress,pasport_ser,pasport_num,pasport_vydan,pasport_date,inn,telephon,DateAdd)';
      sql3 := sql3+' VALUES (:pName2,:pDateBirth, :pAdress,:pPS, :pPN, :pPV, :pPD, :pINN, :pTel, :pDateAdd)';
      q5.SQL.Add(sql3);

      q5.Parameters.ParamByName('pName2').Value := edt1.Text;
      sTmpDate := DateToStr(dtp1.Date);
      q5.Parameters.ParamByName('pDateBirth').Value := StrToDate(sTmpDate);
      q5.Parameters.ParamByName('pAdress').Value := edt2.Text;
      q5.Parameters.ParamByName('pPS').Value := edt3.Text;
      q5.Parameters.ParamByName('pPN').Value := edt4.Text;
      q5.Parameters.ParamByName('pPV').Value := edt5.Text;
      sTmpDate := DateToStr(dtp2.Date);
      q5.Parameters.ParamByName('pPD').Value := StrToDate(sTmpDate);
      q5.Parameters.ParamByName('pINN').Value := edt6.Text;
      q5.Parameters.ParamByName('pTel').Value := edt7.Text;
      q5.Parameters.ParamByName('pDateAdd').Value := DOpenDay;
       try
      q5.ExecSQL;
      q5.Close;
      q5.SQL.Clear;
      sleep(1000);
      deliverer_form.deliverer.Edit2.Text := edt1.Text;
      //deliverer_form.deliverer.findDelivererByName(edt1.Text);
      Close;
      Except on e: Exception do begin
        ShowMessage('ОШИБКА D1 ! клиент не добавлен! перезайдите в программу!');
      end;
      end;
    end else begin
      ShowMessage('Клиент с таким ТЕЛЕФОНОМ уже ЕСТЬ! Убедитесь что ввели уникальный номер телефона');
    end;
  end;
end;

procedure TAddClient.Button2Click(Sender: TObject);
var
  newLoyalty : TENLoyalty;
  LoyADO : ADOLoyalty;
begin

  if (radioButton1.Checked) then begin
    newLoyalty := TENLoyalty.create;
    newLoyalty.IdDeliverer := iClientID;
    newLoyalty.IdLoyalty := createIdLoyalty;
    if (edit2.text <> '') then newLoyalty.option1 := StrToFloat(edit2.text);
    if (edit3.text <> '') then newLoyalty.option2 := StrToFloat(edit3.text);
    newLoyalty.EditDate := now;
    newLoyalty.Status := TRUE;
    danado.loyal.updateLoyaltyStatusFalse(LDELIVERER,iClientID);
    danado.loyal.addLoyalty(newLoyalty);
    danado.deliverer.updateIdTarif(newLoyalty.IdDeliverer, 10);
  end else begin
    if (radioButton2.Checked) then begin
      loyADO := ADOLoyalty.create;
      loyADO.updateLoyaltyStatusFalse(LDELIVERER,iClientID);
    end;
  end;

  PageControl1.ActivePage := TabSheet1;
  AddClient.Close;
  //Добавить ивент!
end;

procedure TAddClient.Button3Click(Sender: TObject);
begin
  close;
end;

function TAddClient.checkBirthDay(bDay: TDAteTime) : boolean;
var
  tDay : TDateTime;
  res : integer;
begin
  tDay := Date;
  res := DaysBetween(tDay, bDay);
  res := res div 356;
  if res > 17 then
    begin
    Result := True;
    end
  else
    begin
    Result := False;
    end;
end;

procedure TAddClient.CheckBox2Click(Sender: TObject);
begin
  if (checkBox2.Checked) then label2.Caption := 'ФИКСИРОВАННЫЙ %'
  else label2.Caption := '- ПРОЦЕНТ В ДЕНЬ';
end;

procedure TAddClient.CheckBox3Click(Sender: TObject);
begin
  if (checkBox3.Checked) then label3.Caption := 'ПОСТОЯННАЯ ЦЕНА'
  else label3.Caption := '+ ЦЕНА ЗА ГРАММ';
end;

function TAddClient.checkEdits: Boolean;
var
  res : Boolean;
begin
  res := TRUE;
if edt1.Text = '' then begin
  ShowMessage('не заполнено ФИО клиента!');
  res := FALSE;
end;
if not (checkBirthDay(dtp1.Date)) then begin
  ShowMessage('Клиент не совершеннолетний');
  res := FALSE;
end;
if edt2.Text = '' then begin
  ShowMessage('не заполнен Адрес клиента!');
  res := FALSE;
end;
if edt3.Text = '' then begin
  ShowMessage('не заполнена Серия паспорта!');
  res := FALSE;
end;
if edt4.Text = '' then begin
  ShowMessage('не заполнен Номер паспорта!');
  res := FALSE;
end;
if edt5.Text = '' then begin
  ShowMessage('не заполнен Адрес выдачи паспорта!');
  res := FALSE;
end;
if edt6.Text = '' then begin
  ShowMessage('не указан ИНН! Если у клиента НЕТ ИНН укажите случайное число от 100 до 10000 ');
  res := FALSE;
end;
if edt7.Text = '' then begin
  ShowMessage('не указан ТЕЛЕФОН! ;)');
  res := FALSE;
end;


 RESULT := res;
end;

function TAddClient.CheckFloat(id1: String): Boolean;
var
  res : Boolean;
begin
  res := False;
  id1 := StringReplace(id1,'.',',',[rfReplaceAll, rfIgnoreCase]);
  try
    StrToFloat(id1);
    res := TRUE;
    except on e: exception do begin
      res := False;
      ShowMessage('Внимание! ВВедено НЕ число! Программма поставила 0 !');
    end;
  end;
  RESULT := res;
end;

procedure TAddClient.ComboBox1Change(Sender: TObject);
begin
  if combobox1.ItemIndex = 0 then begin


  end;
  if combobox1.ItemIndex = 1 then begin


  end;

   if combobox1.ItemIndex = 2 then begin
    Loyalty.Form14 := TForm14.Create(self);
    Loyalty.idDeliverer := iClientID;
    Loyalty.Form14.ShowModal;
  end;

end;

function TAddClient.createIdLoyalty: Integer;
var
  res : Integer;
begin
  res := 10;
  if ((checkbox2.Checked)AND(checkbox3.Checked)) then res := 13
  else begin
    if (checkbox2.Checked) then res := 12;
    if (checkbox3.Checked) then res := 11;
  end;
  RESULT := res;
end;

procedure TAddClient.Edit2Exit(Sender: TObject);
begin
  edit2.Text := StringReplace(edit2.Text,'.',',',[rfReplaceAll, rfIgnoreCase]);
  if (edit2.Text <> '') then  begin
    try
      edit2.Text := FloatToStr(StrToFloat(edit2.Text));
      except on e: exception do begin
        edit2.Text := '0';
        ShowMessage('ВВедите корректное число!');
      end;
    end;
  end;
end;

procedure TAddClient.Edit3Exit(Sender: TObject);
begin
  edit3.Text := StringReplace(edit3.Text,'.',',',[rfReplaceAll, rfIgnoreCase]);
  if (edit3.Text <> '') then  begin

  try
    edit3.Text := FloatToStr(StrToFloat(edit3.Text));
    except on e: exception do begin
      edit3.Text := '0';
      ShowMessage('ВВедите корректное число!');
    end;
  end;
  end;

end;

procedure TAddClient.edt1KeyPress(Sender: TObject; var Key: Char);
var
  sName: string;
begin
  sName := edt1.Text;
  if (edt1.Text='') and (Key in[' ']) then Key := #0;
  if Key in['0'..'9',',','.'] then Key := #0;
  if (Key in[' ']) and (sName[Length(sName)]=' ') then Key := #0;
end;

procedure TAddClient.btn1Click(Sender: TObject);
var
  sTmpDate: string;
  ii: Integer;
  q2 :TADOQuery;
  sql2 : String;
begin
if (checkEdits) then begin
    try
      q1.SQL.Add('UPDATE deliverer SET name=:pName,date_of_burn=:pDateBirth,adress=:pAdress,');
      q1.SQL.Add('pasport_ser=:pPS,pasport_num=:pPN,pasport_vydan=:pPV,pasport_date=:pPD,inn=:pINN,telephon=:pTel,CardNumber=:pCardNumber,CardType=:pCardType');
      q1.SQL.Add('WHERE id=:pID');
      q1.Parameters.ParamByName('pName').Value := edt1.Text;
      sTmpDate := DateToStr(dtp1.Date);
      q1.Parameters.ParamByName('pDateBirth').Value := StrToDate(sTmpDate);
      q1.Parameters.ParamByName('pAdress').Value := edt2.Text;
      q1.Parameters.ParamByName('pPS').Value := edt3.Text;
      q1.Parameters.ParamByName('pPN').Value := edt4.Text;
      q1.Parameters.ParamByName('pPV').Value := edt5.Text;
      sTmpDate := DateToStr(dtp2.Date);
      q1.Parameters.ParamByName('pPD').Value := StrToDate(sTmpDate);
      q1.Parameters.ParamByName('pINN').Value := edt6.Text;
      q1.Parameters.ParamByName('pTel').Value := edt7.Text;
      q1.Parameters.ParamByName('pID').Value := iClientID;
      q1.Parameters.ParamByName('pCardNumber').Value := edt9.Text;
      q1.ExecSQL;
      q1.Close;
      q1.SQL.Clear;
      except on e: Exception do begin
          ShowMessage('ОШИБКА D2 ! клиент не добавлен! перезайдите в программу!');
      end;
    end;
    deliverer_form.deliverer.SearchClient(edt1.Text,'name');
   // bEditMark := False;
    Close;
  end else begin
    ShowMessage('Клиента необходимо Добавить!');
  end;
end;

procedure TAddClient.edt6KeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in['0'..'9',#8]) then Key := #0;
end;

procedure TAddClient.edt7KeyPress(Sender: TObject; var Key: Char);
begin
 if not(Key in['0'..'9',#8]) then Key := #0;
end;

procedure TAddClient.fillDelivererFromId(id1: Integer);
var
  q1 : TADOQuery;
  sql1 : String;
  idTarif1 : Integer;
begin

  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := danado.utils.getconnectionstring;
  sql1 := 'SELECT * FROM deliverer WHERE id =:pId';
  q1.SQL.Add(sql1);
  q1.Parameters.ParamByName('pId').Value := id1;
  q1.Open;

  edt1.Text := q1.FieldByName('name').AsString;
  if (q1.FieldByName('date_of_burn').AsVariant <> NULL) then
    dtp1.Date := q1.FieldByName('date_of_burn').AsDateTime;
  edt2.Text := q1.FieldByName('adress').AsString;
  edt3.Text := q1.FieldByName('pasport_ser').AsString;
  edt4.Text := q1.FieldByName('pasport_num').AsString;
  edt5.Text := q1.FieldByName('pasport_vydan').AsString;
  if (q1.FieldByName('pasport_date').AsVariant <> NULL) then
    dtp2.Date := q1.FieldByName('pasport_date').AsDateTime;
  edt6.Text := q1.FieldByName('inn').AsString;
  idTarif1 := q1.FieldByName('id_tarif').AsInteger;
  edit1.Text := getIdTarifToText(idTarif1);
  edt7.Text := q1.FieldByName('telephon').AsString;
  edt9.Text := q1.FieldByName('CardNumber').AsString;
  combobox1.Items.Add('Индивидуальная');
  if ((idTarif1 >= 10) AND (idTarif1 <=13))  then begin
    combobox1.ItemIndex :=2;
  end else  combobox1.ItemIndex :=0;



end;

procedure TAddClient.fillLoyaltyToForm(loyal: TENLoyalty);
begin
//
  if (loyal.IdLoyalty=11) then begin
    checkbox3.Checked := True;
  end;
  if (loyal.IdLoyalty=12) then begin
    checkbox2.Checked := True;
  end;
  if (loyal.IdLoyalty=13) then begin
    checkbox2.Checked := True;
    checkbox3.Checked := True;
  end;
  if (Loyal.option1 <> 0) then Edit2.Text := FloatToStr(loyal.option1);
  if (Loyal.option2 <> 0) then Edit3.Text := FloatToStr(loyal.option2);

end;

procedure TAddClient.edt4KeyPress(Sender: TObject; var Key: Char);
begin
 if not(Key in['0'..'9',#8]) then Key := #0;
end;

procedure TAddClient.FormCreate(Sender: TObject);
begin
  PageControl1.ActivePage := TabSheet1;
  if bEditMark then begin

    edt9.Enabled := True;
  end;
end;

function TAddClient.getIdTarifToText(id1: Integer): String;
var
  res : String;
begin
  case id1 of
    1  : Res := '--';
    2  : res := 'Old_Красная';
    3  : res := 'Old_Серебро';
    4  : res := 'Old_Золото';
    5  : res := 'Fixed';
    6  : res := '---';
    7  : res := 'Silver';
    8  : res := 'Gold';
    9  : res := 'Platinum';
  end;
  RESULT := res;
end;

procedure TAddClient.PageControl1Change(Sender: TObject);
var
  oldLoyal : TENLoyalty;
begin
  if (PageControl1.ActivePage = Tabsheet2) then begin
    if (DANADO.loyal.checkLoyaltyByIdDeliverer(iClientID)) then begin
      radiobutton1.Checked := True;
      oldLoyal := TENLoyalty.Create;
      oldLoyal := DANADO.loyal.getLoyalty(LDELIVERER,iClientID);
      fillLoyaltyToForm(oldLoyal);
    end else begin
      radiobutton2.checked := True;
      radiobutton2click(self);
    end;

  end;

end;

procedure TAddClient.RadioButton1Click(Sender: TObject);
begin
    if(Radiobutton1.Checked) Then begin
    RadioButton2.Checked := false;
    CheckBox2.Enabled := true;
    CheckBox3.Enabled := true;
    edit2.Enabled := true;
    edit2.Color := CLWhite;
    edit3.Enabled := true;
    edit3.Color := CLWhite;
    //RadioButton2.Enabled := false;
  end;
end;

procedure TAddClient.RadioButton2Click(Sender: TObject);
begin
  if(Radiobutton2.Checked) Then begin
    RadioButton1.Checked := false;
    //RadioButton1.Enabled := false;
    CheckBox2.Enabled := False;
    CheckBox3.Enabled := False;
    edit2.Enabled := false;
    edit2.Color := clMedGray;
    edit3.Enabled := false;
    edit3.Color := clMedGray;
  end;
end;

end.
