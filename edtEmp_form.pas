unit edtEmp_form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, ADODB, DANADO;

type
  TedtEmp = class(TForm)
    edt1: TEdit;
    edt3: TEdit;
    edt4: TEdit;
    chk1: TCheckBox;
    dtp1: TDateTimePicker;
    btn1: TButton;
    btn2: TButton;
    q1: TADOQuery;
    chk2: TCheckBox;
    lbltxt1: TLabel;
    lbltxt3: TLabel;
    lbltxt2: TLabel;
    lbltxt4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure chk2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  edtEmp: TedtEmp;
  editFlag: Boolean;
  id: Integer;

implementation

uses
  main,md5hash,semployee_form;

{$R *.dfm}

procedure TedtEmp.FormCreate(Sender: TObject);
begin
  dtp1.Date := DOpenDay;
  q1.ConnectionString := DANADO.utils.getConnectionString;
end;

procedure TedtEmp.btn1Click(Sender: TObject);
var
  q3 : TADOQuery;
begin
  q3 := TADOQuery.Create(nil);
  q3.ConnectionString := DANADO.utils.getConnectionString;

  if(editFlag) then begin
    if(chk2.Checked) then begin
      if (edt4.text<>'') then begin
      q3.SQL.Add('UPDATE employee SET name=:pname, warrant_num=:pwarrant_num, warrant_date=:pwarrant_date, hideEmployee=:phideEmployee, pass=:ppass WHERE id=:pid');
      q3.Parameters.ParamByName('pname').Value := edt1.Text;
      q3.Parameters.ParamByName('pwarrant_num').Value := edt3.Text;
      q3.Parameters.ParamByName('pwarrant_date').Value := StrToDate(DateToStr(dtp1.Date));
      q3.Parameters.ParamByName('phideEmployee').Value := chk1.Checked;
      q3.Parameters.ParamByName('ppass').Value := MD5(edt4.Text);
      q3.Parameters.ParamByName('pid').Value := id;
      q3.ExecSQL;
      q3.Close;
      q3.SQL.Clear;
      Close;
      end
      else ShowMessage('Поле "Пароль" не должно быть пустым!');
    end
    else begin
      q3.SQL.Add('UPDATE employee SET name=:pname, warrant_num=:pwarrant_num, warrant_date=:pwarrant_date, hideEmployee=:phideEmployee WHERE id=:pid');
      q3.Parameters.ParamByName('pname').Value := edt1.Text;
      q3.Parameters.ParamByName('pwarrant_num').Value := edt3.Text;
      q3.Parameters.ParamByName('pwarrant_date').Value := StrToDate(DateToStr(dtp1.Date));
      q3.Parameters.ParamByName('phideEmployee').Value := chk1.Checked;
      q3.Parameters.ParamByName('pid').Value := id;
      q3.ExecSQL;
      q3.Close;
      q3.SQL.Clear;
      Close;
    end;
  end
  else begin
  q3.SQL.Clear;
  q3.SQL.Add('INSERT INTO employee (name,warrant_num,warrant_date,hideEmployee,pass) VALUES (:pname,:pwarrant_num,:pwarrant_date,:phideEmployee,:ppass)');
  q3.Parameters.ParamByName('pname').Value := edt1.Text;
  q3.Parameters.ParamByName('pwarrant_num').Value := StrToInt(edt3.Text);
  q3.Parameters.ParamByName('pwarrant_date').Value := StrToDate(DateToStr(dtp1.Date));
  if(chk1.Checked) then
    q3.Parameters.ParamByName('phideEmployee').Value := True
  else q3.Parameters.ParamByName('phideEmployee').Value := False;
  q3.Parameters.ParamByName('ppass').Value := MD5(edt4.Text);
  q3.ExecSQL;
  q3.Close;
  q3.SQL.Clear;
  Close;

  end;
  q3.Destroy;



  semployee_form.semployee.Button1Click(self);
end;

procedure TedtEmp.btn2Click(Sender: TObject);
begin
  Close;
end;

procedure TedtEmp.chk2Click(Sender: TObject);
begin
  if(chk2.Checked) then begin
    edt4.Enabled := True;
  end
  else begin
    edt4.Enabled := False;
  end;

end;

end.
