unit outgoing_form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB,DANADO;

type
  Toutgoings = class(TForm)
    Button1: TButton;
    ADOQuery1: TADOQuery;
    Button2: TButton;
    chk1: TCheckBox;
    Edit1: TEdit;
    sEdit2: TEdit;
    sEdit1: TEdit;
    StaticText1: TLabel;
    sLabel1: TLabel;
    sLabel2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  outgoings: Toutgoings;

implementation

uses
  main, fr_form, FullSum, Order;
{$R *.dfm}

procedure Toutgoings.Button1Click(Sender: TObject);
var
  iNextOrderNumber, iIdOp: Integer;
  orderList : TOrder;
begin
  if bPPOStatus then begin
    if fr_form.Form3.ConfirmCheck then
      fr_form.Form3.InOutSum('Out','kassir',StrToFloat(edit1.Text));
    if not(chk1.Checked) then begin
      ADOQuery1.SQL.Add('INSERT INTO operation (op,date_op,sum_op) VALUES (11,:Qdate_op,:Qsum_op)');
      ADOQuery1.Parameters.ParamByName('Qdate_op').Value := DOpenDay;
      ADOQuery1.Parameters.ParamByName('Qsum_op').Value := Edit1.Text;
      ADOQuery1.ExecSQL;
      ADOQuery1.SQL.Clear;
      ADOQuery1.Close;
      ADOQuery1.SQL.Add('SELECT employee.name, OrderNumber, name_filial FROM pasport INNER JOIN employee ON pasport.id_CurrentEmployee=employee.id');
      ADOQuery1.Open;
      Form1.rvcomin1.SetParam('dDateDay',FormatDateTime('dd',DOpenDay));
      Form1.rvcomin1.SetParam('dDateMY',FormatDateTime('mmmm yyyy',DOpenDay)+'р.');
      Form1.rvcomin1.SetParam('sNameKassir','');
      Form1.rvcomin1.SetParam('iOrderNumber',ADOQuery1.Fields[1].AsString);
      Form1.rvcomin1.SetParam('sFilial',ADOQuery1.Fields[2].AsString);
      iNextOrderNumber := ADOQuery1.Fields[1].AsInteger+1;
      Form1.rvcomin1.SetParam('sNameBuch','ФIЛЮШИНА ОЛЕНА МИКОЛАIВНА');
      Form1.rvcomin1.SetParam('fSum',Edit1.Text);
      Form1.rvcomin1.SetParam('sSum',SumNumToFull(StrToFloat(Edit1.Text)));
      Form1.rvcomin1.SetParam('fSumCent',FloatToStr(Frac(StrToFloat(Edit1.Text))*100));
      Form1.rvcomin1.SetParam('sFrom',sEdit1.Text);
      Form1.rvcomin1.SetParam('sGround','чек кассового аппарата');
      Form1.rvcomin1.SetParam('dDateFull',DateToStr(DOpenDay));
      Form1.rvcomin1.SetParam('sFrom2',sEdit2.Text);
      Form1.rvcomin1.SetParam('sGround2','квитанция рко');
      ADOQuery1.Close;
      ADOQuery1.SQL.Clear;
      ADOQuery1.SQL.Add('SELECT Max(id) FROM operation');
      ADOQuery1.Open;
      iIdOp := ADOQuery1.Fields[0].AsInteger;
      ADOQuery1.Close;
      ADOQuery1.SQL.Clear;
      ADOQuery1.SQL.Add('INSERT INTO kassa (id_operation,OrderNumber,sFrom,sWhom,SumComin,dDate) VALUES (:pIdOp,:pOrderNumber,:pFrom,:pWhom,:pSumComin,:pDate)');
      ADOQuery1.Parameters.ParamByName('pIdOp').Value := iIdOp;
      ADOQuery1.Parameters.ParamByName('pOrderNumber').Value := iNextOrderNumber-1;
      ADOQuery1.Parameters.ParamByName('pFrom').Value := sEdit1.Text;
      ADOQuery1.Parameters.ParamByName('pWhom').Value := sEdit2.Text;
      ADOQuery1.Parameters.ParamByName('pSumComin').Value := StrToFloat(Edit1.Text);
      ADOQuery1.Parameters.ParamByName('pDate').Value := DOpenDay;
      ADOQuery1.ExecSQL;
      ADOQuery1.SQL.Clear;
      ADOQuery1.Close;
      ADOQuery1.SQL.Add('UPDATE pasport SET OrderNumber=:pOrderNumber');
      ADOQuery1.Parameters.ParamByName('pOrderNumber').Value := iNextOrderNumber;
      ADOQuery1.ExecSQL;
      ADOQuery1.SQL.Clear;
      ADOQuery1.Close;
      Form1.rvcomin1.Execute;
    end;
  end
  else begin
    ADOQuery1.SQL.Add('INSERT INTO operation (op,date_op,sum_op,TimestampField) VALUES (11,:Qdate_op,:Qsum_op,:pTimestampField)');
    ADOQuery1.Parameters.ParamByName('Qdate_op').Value := DOpenDay;
    ADOQuery1.Parameters.ParamByName('Qsum_op').Value := Edit1.Text;
    ADOQuery1.Parameters.ParamByName('pTimestampField').Value := now();
    ADOQuery1.ExecSQL;
    ADOQuery1.SQL.Clear;
    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add('SELECT Max(id) FROM operation');
    ADOQuery1.Open;
    iIdOp := ADOQuery1.Fields[0].AsInteger;
    ADOQuery1.Close;
    orderList := TOrder.Create;

      orderList.bill := '683';
      orderList.summ := Edit1.Text;
      orderList.from := chief;
      orderList.ground := 'Служебное изьятие';
      orderList.summInWord := SumNumToFull(StrToFloat(Edit1.Text));
      orderList.summCent := FloatToStr(Round(Frac(StrToFloat(Edit1.Text))*100)/100*100);
      orderList.chief := chief;
      orderList.date := DateToStr(DOpenDay);
      orderList.document := chiefData;
      orderList.orderType := 1;
      orderList.saveDocument(iIdOp);
      if orderList.ConfirmCheck then begin
      orderList.printExpenseReport;
    end;
  end;
  Close;
end;

procedure Toutgoings.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure Toutgoings.FormCreate(Sender: TObject);
begin
  ADOQuery1.ConnectionString := DANADO.utils.getConnectionString;
end;

end.
