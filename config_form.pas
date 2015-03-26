unit config_form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DB, ADODB, StdCtrls, Mask, MyUtils, ExtCtrls, DANADO;

type
  Tconfig = class(TForm)
    pgc1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    ts3: TTabSheet;
    ts4: TTabSheet;
    grp1: TGroupBox;
    btn1: TButton;
    QPasport: TADOQuery;
    btn3: TButton;
    grp2: TGroupBox;
    lbl1: TLabel;
    btn5: TButton;
    btn2: TButton;
    grp3: TGroupBox;
    btn6: TButton;
    ADOQuery1: TADOQuery;
    Button1: TButton;
    btn4: TButton;
    edt6: TEdit;
    edt7: TEdit;
    edt10: TEdit;
    edt2: TEdit;
    edt3: TEdit;
    edt4: TEdit;
    edt1: TEdit;
    edt5: TEdit;
    edt8: TEdit;
    sEdit3: TEdit;
    edt9: TEdit;
    txt8: TLabel;
    txt2: TLabel;
    txt1: TLabel;
    txt4: TLabel;
    sLabel5: TLabel;
    txt3: TLabel;
    txt5: TLabel;
    txt6: TLabel;
    txt7: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    txt9: TLabel;
    txt10: TLabel;
    sGroupBox2: TGroupBox;
    sLabel1: TLabel;
    sComboBox1: TComboBox;
    sCheckBox1: TCheckBox;
    sGroupBox3: TGroupBox;
    sLabel2: TLabel;
    sLabel3: TLabel;
    sLabel4: TLabel;
    sEdit1: TEdit;
    sEdit2: TEdit;
    sMaskEdit1: TMaskEdit;
    sGroupBox1: TGroupBox;
    StaticText1: TLabel;
    StaticText2: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    Edite1: TEdit;
    Label1: TLabel;
    Edt18: TEdit;
    Label2: TLabel;
    Edt19: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Edt20: TEdit;
    Label5: TLabel;
    TabSheet1: TTabSheet;
    Panel1: TPanel;
    Edit7: TEdit;
    Button4: TButton;
    Panel2: TPanel;
    Button2: TButton;
    Button5: TButton;
    Button3: TButton;
    Button6: TButton;
    Button7: TButton;
    Label6: TLabel;
    Button8: TButton;
    DateTimePicker1: TDateTimePicker;
    Edit1: TEdit;
    Button9: TButton;
    OpenDialog1: TOpenDialog;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    procedure btn1Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure ts2Show(Sender: TObject);
    procedure ts1Show(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sCheckBox1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);

    procedure Edit7Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Edit7KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Edit7KeyPress(Sender: TObject; var Key: Char);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure changeLastDate(date1 : TDate);
    procedure Button9Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  config: Tconfig;

implementation

{$R *.dfm}
uses
  main, IniFiles, md5hash;
var
  IniFile: TIniFile;

procedure Tconfig.btn1Click(Sender: TObject);
begin
  QPasport.SQL.Add('UPDATE pasport SET StartContractNumber=:psnumber,EndContractNumber=:penumber,');
  QPasport.SQL.Add(' FreeContractNumber=:pfnumber,name_filial=:pname,City=:pCity, OrderNumber=:pOrder, FreeAdditionalNumber=:pfan, phone =:pPhone, OrderNumber2=:pOrder2, bpage=:pbpage, LastCashBookDate=:pLastCashBookDate');
  QPasport.Parameters.ParamByName('psnumber').Value := Edt2.Text;
  QPasport.Parameters.ParamByName('penumber').Value := Edt3.Text;
  QPasport.Parameters.ParamByName('pfnumber').Value := Edt4.Text;
  QPasport.Parameters.ParamByName('pname').Value := Edt1.Text;
  QPasport.Parameters.ParamByName('pCity').Value := Edt5.Text;
  QPasport.Parameters.ParamByName('pOrder').Value := Edt8.Text;
  QPasport.Parameters.ParamByName('pfan').Value := SEdit3.Text;
  QPasport.Parameters.ParamByName('pPhone').Value := Edite1.Text;
  QPasport.Parameters.ParamByName('pOrder2').Value := edt18.text;
  QPasport.Parameters.ParamByName('pbpage').Value := edt19.text;
  QPasport.Parameters.ParamByName('pLastCashBookDate').Value := edt20.text;

  QPasport.ExecSQL;
  QPasport.SQL.Clear;
  QPasport.Close;

  IniFile.WriteString('contract','delay',edt6.Text);
  IniFile.WriteString('contract','BodyPercent',edt10.Text);
  IniFile.WriteString('contract','BodyPercentOneDay',edt7.Text);
  bCreditBodyPercent := StrToInt(edt10.Text);
  bCreditBodyPercentOneDay := StrToInt(edt7.Text);
end;

procedure Tconfig.btn3Click(Sender: TObject);
begin
  Close;
end;

procedure Tconfig.ts2Show(Sender: TObject);
begin
  if IniFile.ReadBool('ppo','status',True) then begin
    lbl1.Caption := 'Подключен';
    btn5.Enabled := False;
    btn2.Enabled := True;
  end
  else begin
    lbl1.Caption := 'Отключен';
    btn5.Enabled := True;
    btn2.Enabled := False;
  end;
  edt9.Text := IniFile.ReadString('ppo','com','');
end;

procedure Tconfig.Edit7click(Sender: TObject);
begin
  Edit7.Clear;
  edit7.PasswordChar := #48;
end;

procedure Tconfig.Edit7KeyPress(Sender: TObject; var Key: Char);
begin
   if (Key = #13) then  begin
    button4click(self);
  end;
end;

procedure Tconfig.Edit7KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (edit7.Text = '*Пароль') then begin

    edit7click(self);
  end else begin

  end;
  if (#13 = chr(key)) and (Edit7.Text <> '') then begin
    button4.Click;
  end;
end;

procedure Tconfig.ts1Show(Sender: TObject);
begin
  QPasport.SQL.Add('SELECT StartContractNumber,EndContractNumber,FreeContractNumber,name_filial,City,OrderNumber,FreeAdditionalNumber, phone, LastCashBookDate, OrderNumber2, bPage FROM pasport');
  QPasport.Open;
  Edt2.Text := QPasport.Fields[0].AsString;
  Edt3.Text := QPasport.Fields[1].AsString;
  Edt4.Text := QPasport.Fields[2].AsString;
  Edt1.Text := QPasport.Fields[3].AsString;
  Edt5.Text := QPasport.Fields[4].AsString;
  Edt8.Text := QPasport.Fields[5].AsString;
  sEdit3.Text := QPasport.Fields[6].AsString;
  Edite1.Text := QPasport.FieldByName('phone').AsString;
  Edt18.Text := QPasport.FieldByName('OrderNumber2').AsString;
//  Edt20.Text := QPasport.FieldByName('LastCashBookDate').AsString;
  Edt20.Text := '01.01.2014';
  Edt19.Text := QPasport.FieldByName('bPage').AsString;
  QPasport.SQL.Clear;
  QPasport.Close;
  edt6.Text := IniFile.ReadString('contract','delay','');
  edt10.Text := IniFile.ReadString('contract','BodyPercent','');
  edt7.Text := IniFile.ReadString('contract','BodyPercentOneDay','');
end;

procedure Tconfig.btn2Click(Sender: TObject);
begin
  bPPOStatus := False;
  lbl1.Caption := 'Отключен';
  IniFile.WriteBool('ppo','status',False);
  btn5.Enabled := True;
  btn2.Enabled := False;
  form1.N38.Visible := true;
  form1.N18.Visible := false;
end;

procedure Tconfig.btn5Click(Sender: TObject);
begin
  bPPOStatus := True;
  sPPOCom := edt9.Text;
  lbl1.Caption := 'Подключен';
  IniFile.WriteBool('ppo','status',True);
  IniFile.WriteString('ppo','com',edt9.Text);
  IniFile.Free;
  btn5.Enabled := False;
  btn2.Enabled := True;
  form1.N18.Visible := true;
  form1.N38.Visible := false;
end;

procedure Tconfig.Button1Click(Sender: TObject);
var
  wMsg: word;
begin
  ADOQuery1.SQL.Add('UPDATE setoptions SET passw=:ppsw WHERE passw=:ppswold');
  ADOQuery1.Parameters.ParamByName('ppsw').Value := MD5(MaskEdit2.Text);
  ADOQuery1.Parameters.ParamByName('ppswold').Value := MD5(MaskEdit1.Text);
  ADOQuery1.ExecSQL;
  if ADOQuery1.RowsAffected=0 then wMsg := MessageDlg('Неверный пароль!',mtError,[mbOk],0);
  ADOQuery1.SQL.Clear;
  ADOQuery1.Close
end;

procedure Tconfig.Button2Click(Sender: TObject);
var
  q1 : TADOQuery;
  sql1 : String;
  new, repawn, maxnew : String;
  scn,ecn,fcn,fan  : String;
  namefilial : Integer;
begin
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := DANADO.utils.getConnectionString;
  sql1 := 'SELECT * FROM pasport';
  q1.SQL.Add(sql1);
  q1.Open;
  nameFilial := q1.FieldByName('name_filial').AsInteger;
  q1.SQL.Clear;
  scn := MyUtils.getNulliki(nameFilial)+IntToStr(nameFilial)+'00001';
  ecn := MyUtils.getNulliki(nameFilial)+IntToStr(nameFilial)+'99999';
  fcn := MyUtils.getNulliki(nameFilial)+IntToStr(nameFilial)+'00001';
  fan := MyUtils.getNulliki(nameFilial)+IntToStr(nameFilial)+'00001';
  sql1 := 'UPDATE pasport SET StartContractNumber =:scn, EndContractNumber=:ecn  ,FreeContractNumber=:fcn,FreeAdditionalNumber =:fan';
  q1.SQL.Add(sql1);
  q1.Parameters.ParamByName('scn').Value := scn;
  q1.Parameters.ParamByName('ecn').Value := ecn;
  q1.Parameters.ParamByName('fcn').Value := fcn;
  q1.Parameters.ParamByName('fan').Value := fan;
  q1.ExecSQL;
   IniFile := TIniFile.Create('c:\pawn\options.ini');
  IniFile.WriteInteger('newContract', 'new', 1);
  IniFile.WriteInteger('newContract', 'button2', 1);
  ShowMessage('ПАСПОРТ обновлён! Перезайди в программу!');
end;

procedure Tconfig.Button3Click(Sender: TObject);
var
  iniFiletmp : Integer;
begin
  IniFile := TIniFile.Create('c:\pawn\options.ini');
  iniFileTMP := IniFile.ReadInteger('newContract', 'tarifButton1', 0);
   if (iniFileTMP = 5) then
   begin
      IniFile.WriteInteger('newContract', 'tarifButton1', 2);
      button3.Caption := 'Тариф Открытие [ВЫКЛ]';
   end else begin
      IniFile.WriteInteger('newContract', 'tarifButton1', 5);
      button3.Caption := 'Тариф Открытие [ВКЛ]';
   end;
end;



procedure Tconfig.Button4Click(Sender: TObject);
var
  inifileTMP : Integer;
  iniFileSTR : String;
begin
  if (Edit7.Text = '1133') then begin
    DateTimePicker1.Date := getLastDate;
   panel2.Show;
   iniFileTMP := IniFile.ReadInteger('newContract', 'new', 0);
   if (iniFileTMP > 0) then
   begin
      Button2.Caption := 'Новые Договора [ВКЛ]';
   end else begin
      Button2.Caption := 'Новые Договора [ВЫКЛ]';
   end;
    iniFileSTR := iniFile.ReadString('pathBD','str','');
   if (iniFileSTR <> '') then
   begin
      edit1.Text := iniFileSTR;
   end else begin
      edit1.Text := 'C:\pawn\data\lo.mdb';
   end;

   iniFileTMP := IniFile.ReadInteger('newContract', 'tarifButton1', 0);
   if (iniFileTMP = 5) then
   begin
      Button3.Caption := 'Тариф Открытие [ВКЛ]';
   end else begin
      Button3.Caption := 'Тариф Открытие [ВЫКЛ]';
   end;
      iniFileTMP := IniFile.ReadInteger('newContract', 'tarifButton2', 0);
   if (iniFileTMP = 5) then
   begin
      Button6.Caption := 'Тариф GOLD [ВКЛ]';
   end else begin
      Button6.Caption := 'Тариф GOLD [ВЫКЛ]';
   end;
   iniFileTMP := IniFile.ReadInteger('loyal', 'group', 0);
   if (iniFileTMP = 1) then
   begin
      button7.Caption := 'Группа Лояльности: 1';
   end;
   if (iniFileTMP = 2) then
   begin
      button7.Caption := 'Группа Лояльности: 2';
   end;
   iniFileTMP := IniFile.ReadInteger('newContract', 'prikaz22', 1);
   if (iniFileTMP = 1) then
   begin
      button8.Caption := 'Приказ №22 [ВЫКЛ]';
   end;
   if (iniFileTMP = 5) then
   begin
      button8.Caption := 'Приказ №22 [ВКЛ]';
   end;
   if (iniFileTMP = 6) then
   begin
      button8.Caption := 'Приказ №11 2 [ВКЛ]';
   end;
  end else begin
   panel2.Hide;
   edit7.Text := '';
  end;
end;

procedure Tconfig.Button5Click(Sender: TObject);
begin
  edit7.Text := '';
   edit7.PasswordChar := #0;
   button4.Click;
end;

procedure Tconfig.Button6Click(Sender: TObject);
var
  iniFiletmp : Integer;
begin
  IniFile := TIniFile.Create('c:\pawn\options.ini');
  iniFileTMP := IniFile.ReadInteger('newContract', 'tarifButton2', 0);
   if (iniFileTMP = 5) then
   begin
      IniFile.WriteInteger('newContract', 'tarifButton2', 2);
      Button6.Caption := 'Тариф GOLD [ВЫКЛ]';
   end else begin
      IniFile.WriteInteger('newContract', 'tarifButton2', 5);
      Button6.Caption := 'Тариф GOLD [ВКЛ]';
   end;
end;

procedure Tconfig.Button7Click(Sender: TObject);
var
  iniFiletmp : Integer;
begin
IniFile := TIniFile.Create('c:\pawn\options.ini');
iniFileTMP := IniFile.ReadInteger('loyal', 'group', 0);

   if (iniFileTMP = 0) then
   begin
      IniFile.WriteInteger('loyal', 'group', 1);
      button7.Caption := 'Группа Лояльности: 1';
   end;

   if (iniFileTMP = 1) then
   begin
      IniFile.WriteInteger('loyal', 'group', 2);
      button7.Caption := 'Группа Лояльности: 2';
   end;

   if (iniFileTMP = 2) then begin
      IniFile.WriteInteger('loyal', 'group', 0);
      button7.Caption := 'Группа Лояльности: 0';
   end;
end;

procedure Tconfig.Button8Click(Sender: TObject);
var
  iniFiletmp : Integer;
begin
IniFile := TIniFile.Create('c:\pawn\options.ini');
iniFileTMP := IniFile.ReadInteger('newContract', 'prikaz22', 1);

   if (iniFileTMP = 1) then
   begin
      IniFile.WriteInteger('newContract', 'prikaz22', 5);
      button8.Caption := 'Приказ №22 [ВКЛ]';
   end;
   if (iniFileTMP = 5) then
   begin
      IniFile.WriteInteger('newContract', 'prikaz22', 1);
      button8.Caption := 'Приказ №22 [ВЫКЛ]';
   end;
  // if (iniFileTMP = 6) then
 //  begin
 //     IniFile.WriteInteger('newContract', 'prikaz22', 1);
 //     button8.Caption := 'Приказ №22 [ВЫКЛ]';
 //  end;
end;

procedure Tconfig.Button9Click(Sender: TObject);
begin
  OpenDialog1.Create(self);
   openDialog1.Options := [ofFileMustExist];
    openDialog1.Filter := 'Accsess only - |*.mdb|';
  if openDialog1.Execute then begin
   // ShowMessage('File : '+openDialog1.FileName);
    edit1.Text := OpenDialog1.FileName;
  end;
   IniFile.WriteString('pathBD', 'str', OpenDialog1.FileName );
end;

procedure Tconfig.changeLastDate(date1: TDate);
var
  q1 : TADOQUery;
  sql1 : String;
begin
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := DANADO.utils.getConnectionString;
  sql1 := 'UPDATE pasport SET lastDate=:pDate1';
  q1.SQL.Add(sql1);
  q1.Parameters.ParamByName('pDate1').Value := DateToStr(date1);
  q1.ExecSQL;
  q1.Destroy;
end;

procedure Tconfig.DateTimePicker1Change(Sender: TObject);
begin
  changeLastDate(DateTimePicker1.Date);
  main.Form1.DTP1.MinDate := getLastDate+1;
  main.Form1.DTP2.MinDate := getLastDate+1;
end;

procedure Tconfig.FormCreate(Sender: TObject);
begin
  QPasport.ConnectionString := DANADO.utils.getConnectionString;
  ADOQuery1.ConnectionString := DANADO.utils.getConnectionString;
  TabSheet1.Caption := 'Админ';
  pgc1.ActivePage:= ts1;
  IniFile := TIniFile.Create('c:\pawn\options.ini');
 // IniFile.WriteInteger('newContract', 'tarifButton1', 5);
   // button2.Hide;
    label5.Hide;
    label4.Hide;
//    Label3.Hide;
    Label2.Hide;
    Edt20.Hide;
//    Edt19.Hide;
    Edt18.Hide;
    Edt8.Hide;
    Txt8.Hide;
    panel2.Hide;
    button4.Click;
end;

procedure Tconfig.sCheckBox1Click(Sender: TObject);
begin
  if sCheckBox1.Checked then
    sComboBox1.Enabled := True
  else sComboBox1.Enabled := False;
end;

end.
