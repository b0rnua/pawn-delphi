unit chekInOut_form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ConfigPPO_form, main, DB, ADODB,fr_form,DANADO;

type
  TchekInOut = class(TForm)
    Button1: TButton;
    Button2: TButton;
    ADOQuery1: TADOQuery;
    Edit1: TEdit;
    sLabel1: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  chekInOut: TchekInOut;

implementation

{$R *.dfm}

procedure TchekInOut.Button2Click(Sender: TObject);
begin
    if bPPOStatus then begin
      ADOQuery1.SQL.Add('SELECT name_filial,employee.name FROM pasport INNER JOIN employee ON pasport.id_CurrentEmployee=employee.id');
      ADOQuery1.Open;
      if fr_form.Form3.ConfirmCheck then
        fr_form.Form3.CheckType('BayOut',Copy(ADOQuery1.Fields[1].AsString,1,8),'N Дог. ',ADOQuery1.Fields[0].AsString,StrToFloat(Edit1.Text));
      ADOQuery1.Close;
      ADOQuery1.SQL.Clear;
    end;
    Close;
end;

procedure TchekInOut.FormCreate(Sender: TObject);
begin
  ADOQuery1.ConnectionString := DANADO.utils.getConnectionString;

end;

procedure TchekInOut.Button1Click(Sender: TObject);
begin
  if bPPOStatus then begin
    ADOQuery1.SQL.Add('SELECT name_filial,employee.name FROM pasport INNER JOIN employee ON pasport.id_CurrentEmployee=employee.id');
    ADOQuery1.Open;
    if fr_form.Form3.ConfirmCheck then
      fr_form.Form3.CheckType('Credit',Copy(ADOQuery1.Fields[1].AsString,1,8),'N Дог. ',ADOQuery1.Fields[0].AsString,StrToFloat(Edit1.Text));
    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
  end;
  Close;
end;

end.
