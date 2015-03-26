unit semployee_form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, ADODB, StdCtrls, DANADO;

type
  Tsemployee = class(TForm)
    strngrd1: TStringGrid;
    btn1: TButton;
    btn2: TButton;
    q1: TADOQuery;
    Button1: TButton;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  semployee: Tsemployee;

implementation

uses main, edtEmp_form;

{$R *.dfm}

procedure Tsemployee.FormShow(Sender: TObject);
begin
  Button1Click(self);
end;

procedure Tsemployee.btn1Click(Sender: TObject);
begin
  edtEmp_form.edtEmp := TedtEmp.Create(Self);
  edtEmp_form.edtEmp.Caption := 'Добавить';
  edtEmp_form.editFlag := false;
  edtEmp_form.edtEmp.ShowModal;
end;

procedure Tsemployee.btn2Click(Sender: TObject);
var
  q2 : TADOQuery;
begin
  q2 := TADOQuery.Create(nil);
  q2.ConnectionString := DANADO.utils.getConnectionString;

  edtEmp_form.edtEmp := TedtEmp.Create(Self);
  q2.SQL.Add('SELECT name, warrant_date, warrant_num, hideEmployee FROM employee WHERE id=:pid');
  q2.Parameters.ParamByName('pid').Value := strngrd1.Cells[3,strngrd1.Row];
  q2.Open;
  edtEmp_form.edtEmp.edt1.Text := q2.Fields[0].AsString;
  edtEmp_form.edtEmp.edt3.Text := q2.Fields[2].AsString;
  edtEmp_form.edtEmp.dtp1.Date := q2.Fields[1].AsDateTime;
  edtEmp_form.id := StrToInt(strngrd1.Cells[3,strngrd1.Row]);
  if(q2.Fields[3].AsBoolean) then begin
    edtEmp_form.edtEmp.chk1.Checked := true;
  end else edtEmp_form.edtEmp.chk1.Checked := False;
  q2.Close;
  q2.SQL.Clear;
  q2.Destroy;
  edtEmp_form.edtEmp.Caption := 'Редактировать';
  edtEmp_form.editFlag := True;
  edtEmp_form.edtEmp.ShowModal;
  //close;
end;

procedure Tsemployee.Button1Click(Sender: TObject);
var
  i : Integer;
  q4 : TADOQUery;
begin

  q4 := TADOQuery.Create(nil);
  q4.ConnectionString := utils.getConnectionString;
  strngrd1.RowCount := 2;
  i := 1;
  strngrd1.Cells[0,0] := 'ФИО';
  strngrd1.Cells[1,0] := 'Дата дов.';
  strngrd1.Cells[2,0] := '№ Дов.';
  strngrd1.Cells[3,0] := 'id';
  strngrd1.Cells[4,0] := 'ВХОД';
  q4.SQL.Add('SELECT name, warrant_date, warrant_num, id, hideEmployee FROM employee');
  with q4 do begin
    q4.Open;
    while not Eof do begin
      strngrd1.Cells[0,i] := q4.Fields[0].AsString;
      strngrd1.Cells[1,i] := q4.Fields[1].AsString;
      strngrd1.Cells[2,i] := q4.Fields[2].AsString;
      strngrd1.Cells[3,i] := q4.Fields[3].AsString;
      if (q4.Fields[4].AsBoolean) then
        strngrd1.Cells[4,i] := '-'
        else
        strngrd1.Cells[4,i] := 'ДА';

      strngrd1.RowCount := strngrd1.RowCount+1;
      Inc(i);
      Next;
    end;
    q4.Close;
  end;
  q4.Destroy;
  if strngrd1.RowCount>2 then
    strngrd1.RowCount := strngrd1.RowCount-1;
end;

end.
