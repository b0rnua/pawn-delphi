unit RemovedFromStorage_form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, ExtCtrls,dateUtils;

type
  TRemovedFromStorage = class(TForm)
    edt1: TEdit;
    btn1: TButton;
    lbl1: TLabel;
    q1: TADOQuery;
    edt2: TEdit;
    chk1: TCheckBox;
    Label1: TLabel;
    Panel1: TPanel;
    Label2: TLabel;
    Button1: TButton;
    Edit1: TEdit;
    procedure btn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RemovedFromStorage: TRemovedFromStorage;

implementation

uses
  main;

{$R *.dfm}

procedure TRemovedFromStorage.btn1Click(Sender: TObject);
var
  id: integer;
  status: Boolean;
  dDelay, dPercent, dEstimated : Double;
  date_end1, num_of_day1 : String;
  BNumDate,BNumDate2 :byte;
begin
  status := False;
  if(edt1.Text<>'') then begin
    q1.SQL.Add('SELECT id, con_status, date_end, num_of_day, estimated_amount FROM contract_info WHERE contract_number=:pContractNumber');
    q1.Parameters.ParamByName('pContractNumber').Value := edt1.Text;
    q1.Open;
    id := q1.Fields[0].AsInteger;
    status :=q1.Fields[1].AsBoolean;
    date_end1 := q1.FieldByName('date_end').AsString;
    num_of_day1 := q1.FieldByName('num_of_day').AsString;
    BNumDate := StrToInt(num_of_day1);
    BNumDate2 := DaysBetween(StrToDate(date_end1), DOpenDay);
    dEstimated := q1.FieldByName('estimated_amount').AsFloat;
    q1.Close;
    q1.SQL.Clear;
    if(status) then begin
      if chk1.Checked=True then begin
        q1.SQL.Add('UPDATE contract_info SET con_status=0, DateClose=:pDateClose WHERE id=:pID');
        q1.Parameters.ParamByName('pID').Value := id;
        q1.Parameters.ParamByName('pDateClose').Value := StrToDate(edt2.Text);
        q1.ExecSQL;
        q1.Close;
        q1.SQL.Clear;
        q1.SQL.Add('UPDATE product_info SET product_status=0 WHERE id_contract=:pID');
        q1.Parameters.ParamByName('pID').Value := id;
        q1.ExecSQL;
        q1.Close;
        q1.SQL.Clear;
        // Для быстрой УВ ;)
        {
        dDelay := dEstimated * (0.01 * BNumDate2) / 100;
        dDelay := round(dDelay * 100) / 100;
        dPercent := 0.1 * BNumDate * dEstimated / 100;
        dPercent := round(dPercent * 100) / 100;
        q1.SQL.Add('INSERT INTO operation (op,id_contract_op,date_op,timeStampField,sum_op,percent_op, delay_op) VALUES (5,:pID,:pDateClose,:pTime,:pDEstimate,:pDPercent,:pDDelay)');
        q1.Parameters.ParamByName('pID').Value := id;
        q1.Parameters.ParamByName('pDateClose').Value := StrToDate(edt2.Text);
        q1.Parameters.ParamByName('pTime').Value := now();
        q1.Parameters.ParamByName('pDPercent').Value := DPercent;
        q1.Parameters.ParamByName('pDEstimate').Value := DEstimated;
        q1.Parameters.ParamByName('pDDelay').Value := DDelay;
        q1.ExecSQL;
        q1.Close;
        q1.SQL.Clear;
         }

        q1.SQL.Add('INSERT INTO operation (op,id_contract_op,date_op,timeStampField) VALUES (6,:pID,:pDateClose,:pTime)');
        q1.Parameters.ParamByName('pID').Value := id;
        q1.Parameters.ParamByName('pDateClose').Value := StrToDate(edt2.Text);
        q1.Parameters.ParamByName('pTime').Value := now();
        q1.ExecSQL;
        q1.Close;
        q1.SQL.Clear;

        ShowMessage('Договор №'+edt1.Text+' переведён на склад ЦО');
      end
      else begin
        q1.SQL.Add('UPDATE contract_info SET con_status=0, DateClose=:pDateClose WHERE id=:pID');
        q1.Parameters.ParamByName('pID').Value := id;
        q1.Parameters.ParamByName('pDateClose').Value := StrToDate(edt2.Text);
        q1.ExecSQL;
        q1.Close;
        q1.SQL.Clear;
        q1.SQL.Add('UPDATE product_info SET product_status=0 WHERE id_contract=:pID');
        q1.Parameters.ParamByName('pID').Value := id;
        q1.ExecSQL;
        q1.Close;
        q1.SQL.Clear;
        q1.SQL.Add('INSERT INTO operation (op,id_contract_op,date_op,timeStampField) VALUES (7,:pID,:pDateClose,:pTime)');
        q1.Parameters.ParamByName('pID').Value := id;
        q1.Parameters.ParamByName('pDateClose').Value := StrToDate(edt2.Text);
        q1.Parameters.ParamByName('pTime').Value := now();
        q1.ExecSQL;
        q1.Close;
        q1.SQL.Clear;
        ShowMessage('Договор №'+edt1.Text+' снят с хранения и изъят')
      end
    end
    else ShowMessage('Договор не найден или уже закрыт!');
  end;
end;

procedure TRemovedFromStorage.FormCreate(Sender: TObject);
begin
  edt2.Text := DateToStr(DOpenDay);

end;

end.
