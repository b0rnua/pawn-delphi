unit login_form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, DB, ADODB, EventEntity, EventADO, DANADO;

type
  Tlogin = class(TForm)
    Button1: TButton;
    Button2: TButton;
    ADODataSet1: TADODataSet;
    DataSource1: TDataSource;
    Edit2: TEdit;
    sEdit1: TEdit;
    StaticText2: TLabel;
    StaticText1: TLabel;
    sLabel1: TLabel;
    ComboBox1: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure dblkcbb1Click(Sender: TObject);
    procedure sEdit1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox1CloseUp(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  login: Tlogin;
    empList : TStringList;
implementation

uses
  main, md5hash, EmployeeADO;

{$R *.dfm}

procedure Tlogin.FormCreate(Sender: TObject);
var
  dDateNow: TDateTime;
begin
  dDateNow := Date;
  Edit2.Text := DateToStr(dDateNow);
  ADODataSet1.ConnectionString := DANADO.utils.getConnectionString;
end;

procedure Tlogin.FormShow(Sender: TObject);
var

  i : Integer;
begin
  empList := TStringList.Create;
  empList := DANADO.employee.getEmployeeList;
// Showmessage(IntToStr(empList.Count));

  combobox1.Clear;
  for i := 0 to empList.count-1 do begin
    combobox1.Items.Add(empList.Names[i]);
  end;
 combobox1.ItemIndex := 1;
 combobox1.SetFocus;
 // ComboBox1.DroppedDown := true;
end;

procedure Tlogin.Button1Click(Sender: TObject);
begin
  ExitProcess(0);
  Close;
end;

procedure Tlogin.Button2Click(Sender: TObject);
var
  wMsg: word;
  event: TEventEntity;
  ADOQuery1 , q2 : TADOQuery;
begin

  //ShowMessage(combobox1.Text);
  ADOQuery1 := TADOQuery.Create(nil);
  ADOQuery1.ConnectionString := DANADO.utils.getConnectionString;

  q2 := TADOQuery.Create(nil);
  q2.ConnectionString := DANADO.utils.getConnectionString;


  ADOQuery1.SQL.Add('SELECT pass FROM employee WHERE pass=:pPass AND id=:pid_Employee');
  ADOQuery1.Parameters.ParamByName('pPass').Value := MD5(sEdit1.Text);
  ADOQuery1.Parameters.ParamByName('pid_Employee').Value :=  empList.Values[combobox1.text];
  ADOQuery1.Open;

  if (ADOQuery1.IsEmpty) and (administratorPassword<>md5(sEdit1.Text))then begin
  //if (ADOQuery1.IsEmpty) and (administratorPassword<>sEdit1.Text)then begin
    sEdit1.Text := '';
    wMsg := MessageDlg('Неверный пароль!',mtError,[mbOk],0);
  end
  else begin

    q2.SQL.Add('UPDATE pasport SET OpenDay=:pOpenDay, id_CurrentEmployee=:pid_Employee');
    q2.Parameters.ParamByName('pOpenDay').Value := Edit2.Text;
    q2.Parameters.ParamByName('pid_Employee').Value := empList.Values[combobox1.text];
    id_CurrentEmployee := strTOInt(empList.Values[combobox1.text]);
    q2.ExecSQL;
    q2.SQL.Clear;
    q2.Close;
    Close;
    currentEmployee := TEmployeeADO.Create.getEmployeeById(strTOInt(empList.Values[combobox1.text]));
    event := TeventEntity.Create;
    event.eventTypeId := 1;
    event.employeeId := currentEmployee.id;
    event.eventDate := Now;
    EventADO.addEvent(event);
  end;
  ADOQuery1.SQL.Clear;
  ADOQuery1.Close;
end;

procedure Tlogin.ComboBox1Change(Sender: TObject);
begin
  //Showmessage(Combobox1.Text);
end;

procedure Tlogin.ComboBox1CloseUp(Sender: TObject);
begin
  sEdit1.SetFocus;
end;

procedure Tlogin.dblkcbb1Click(Sender: TObject);
begin
  button2.Enabled := true;
  //if dblkcbb1.KeyValue>0 then Button2.Enabled := True;
end;

procedure Tlogin.sEdit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (#13 = chr(key)) and (sEdit1.Text <> '') then begin
    Button2Click(Button2);
  end;
end;

end.
