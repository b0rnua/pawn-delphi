unit dayReport_form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RpCon, RpConDS, DB, ADODB, RpDefine, RpRave, ComCtrls,
  Mask, danUtils, DANADo;

type
  TdayReport = class(TForm)
    Button1: TButton;
    Button2: TButton;
    StaticText1: TLabel;
    DTP1: TDateTimePicker;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dayReport: TdayReport;

implementation

uses main, ComObj, MyUtils;
{$R *.dfm}

procedure TdayReport.Button1Click(Sender: TObject);
var
  DateTmp2: TDateTime;
  SSumComing, SSumOut, SSumSsudaV,SSumSsudaP,
  SSumDelay,SSumPercent,DD,DD2: string;
  DSumComing, DSumEnd: double;
  query : string;
  MSExcel: variant;
  i,numOpenContract, numCloseContract: Integer;
  q1 : TADOQuery;
  sql1 : String;
begin

  q1 := TADOquery.Create(nil);
  q1.ConnectionString := DANADO.utils.getConnectionString;



  MSExcel := CreateOleObject('Excel.Application');
  MSExcel.WorkBooks.Add('C:\Pawn\report\dayReport.xls');
 MSExcel.DisplayAlerts := false;
  query := '';
  i := 9;



  MsExcel.Cells.Item[4,4] := DD;
  Form1.ADOQDay1.SQL.Clear;
  //DateSeparator := '/';
  numOpenContract := 0;
  numCloseContract := 0;
  {
  query := 'SELECT contract_info.contract_number,operation.sum_op,operation.percent_op,operation.delay_op FROM operation INNER JOIN contract_info ON operation.id_contract_op=contract_info.id ';
  query := query+'WHERE (operation.date_op= :pDate1) AND (operation.op=5 OR operation.op=2)';
  Form1.ADOQDay1.SQL.Add(query);
  Form1.ADOQDay1.Parameters.ParamByName('pDate1').Value :=  dd;
  }

  sql1 := 'SELECT contract_info.contract_number,operation.sum_op,operation.percent_op,operation.delay_op FROM operation INNER JOIN contract_info ON operation.id_contract_op=contract_info.id WHERE  (operation.date_op=:pDate1) AND (operation.op=5 OR operation.op=2)';
  q1.SQL.Add(sql1);
  DD := DateToStr(MyUtils.checkLastDate(DTP1.Date));
  q1.Parameters.ParamByName('pDate1').Value := DD;
  with q1 do begin
    q1.Open;
    while not Eof do begin
      MsExcel.Cells.Item[i,2] := q1.FieldByName('contract_number').AsString;
      MsExcel.Cells.Item[i,3] := q1.FieldByName('sum_op').AsFloat;
      MsExcel.Cells.Item[i,4] := q1.FieldByName('percent_op').AsFloat;
      MsExcel.Cells.Item[i,5] := q1.FieldByName('delay_op').AsFloat;
      Inc(numCloseContract);
      Inc(i);
      Next;
    end;
    q1.Close;
  end;

  q1.SQL.Clear;
  sql1 := 'SELECT contract_info.contract_number,operation.sum_op FROM operation INNER JOIN contract_info ON contract_info.id=operation.id_contract_op WHERE operation.op=1 AND operation.date_op=:pDate1';
  q1.SQL.Add(sql1);
  q1.Parameters.ParamByName('pDate1').Value := dd;
  with q1 do begin
    q1.Open;
    while not eof do begin
      MsExcel.Cells.Item[i,2] := q1.FieldByName('contract_number').AsString;
      MsExcel.Cells.Item[i,6] := q1.FieldByName('sum_op').AsFloat;
      Inc(numOpenContract);
      Inc(i);
      next;
    end;
    q1.SQL.Clear;
    q1.Close;
  end;


  DateSeparator := '.';
  form1.ADOQDay3.SQL.Add('SELECT SUM(sum_op) FROM operation WHERE date_op=:Qdate_op AND op=1');
  form1.ADOQDay3.Parameters.ParamByName('Qdate_op').Value := DD;
  form1.ADOQDay3.Open;
  SSumSsudaV := form1.ADOQDay3.Fields[0].AsString;
  form1.ADOQDay3.SQL.Clear;
  form1.ADOQDay3.close;
  if SSumSsudaV='' then SSumSsudaV := '0';
  DSumEnd := DSumEnd-StrToFloat(SSumSsudaV);
  DSumEnd := round(DSumEnd*100)/100;
  Form1.RVProject1.SetParam('sum_ssudav',SSumSsudaV);
  form1.ADOQDay3.SQL.Add('SELECT SUM(delay_op) FROM operation WHERE date_op=:Qdate_op AND (op=2 OR op=5)');
  form1.ADOQDay3.Parameters.ParamByName('Qdate_op').Value := DD;
  form1.ADOQDay3.Open;
  SSumDelay := form1.ADOQDay3.Fields[0].AsString;
  form1.ADOQDay3.SQL.Clear;
  form1.ADOQDay3.close;
  if SSumDelay='' then SSumDelay := '0';
  DSumEnd := DSumEnd+StrToFloat(SSumDelay);
  DSumEnd := round(DSumEnd*100)/100;
  Form1.RVProject1.SetParam('sum_delay',SSumDelay);
  form1.ADOQDay3.SQL.Add('SELECT SUM(percent_op) FROM operation WHERE date_op=:Qdate_op AND (op=2 OR op=5)');
  form1.ADOQDay3.Parameters.ParamByName('Qdate_op').Value := DD;
  form1.ADOQDay3.Open;
  SSumPercent := form1.ADOQDay3.Fields[0].AsString;
  form1.ADOQDay3.SQL.Clear;
  form1.ADOQDay3.close;
  if SSumPercent='' then SSumPercent := '0';
  DSumEnd := DSumEnd+StrToFloat(SSumPercent);
  DSumEnd := round(DSumEnd*100)/100;
  Form1.RVProject1.SetParam('sum_percent',SSumPercent);
  form1.ADOQDay3.SQL.Add('SELECT SUM(sum_op) FROM operation WHERE date_op=:Qdate_op AND (op=2 OR op=5)');
  //form1.ADOQDay3.SQL.Add('SELECT SUM(sum_op) FROM operation WHERE date_op<:Qdate_op AND (op=2 OR op=5)');
  form1.ADOQDay3.Parameters.ParamByName('Qdate_op').Value := DD;
  form1.ADOQDay3.Open;
  SSumSsudaP := form1.ADOQDay3.Fields[0].AsString;
  form1.ADOQDay3.SQL.Clear;
  form1.ADOQDay3.close;
  if SSumSsudaP='' then SSumSsudaP := '0';
  DSumEnd := DSumEnd+StrToFloat(SSumSsudaP);
  DSumEnd := round(DSumEnd*100)/100;
  Form1.RVProject1.SetParam('sum_ssudap',SSumSsudaP);

  form1.ADOQDay3.SQL.Add('SELECT SUM(sum_op) FROM operation WHERE date_op=:Qdate_op AND op=10');
  form1.ADOQDay3.Parameters.ParamByName('Qdate_op').Value := DD;
  form1.ADOQDay3.Open;
  SSumComing := form1.ADOQDay3.Fields[0].AsString;
  form1.ADOQDay3.SQL.Clear;
  form1.ADOQDay3.close;
  if SSumComing='' then SSumComing := '0';
  DSumEnd := DSumEnd+StrToFloat(SSumComing);
  DSumEnd := round(DSumEnd*100)/100;
  MsExcel.Cells.Item[i+3,2] := 'Прочий приход';
  MsExcel.Cells.Item[i+3,3] := SSumComing;

  form1.ADOQDay3.SQL.Add('SELECT SUM(sum_op) FROM operation WHERE date_op=:Qdate_op AND op=11');
  form1.ADOQDay3.Parameters.ParamByName('Qdate_op').Value := DD;
  form1.ADOQDay3.Open;
  SSumOut := form1.ADOQDay3.Fields[0].AsString;
  form1.ADOQDay3.SQL.Clear;
  form1.ADOQDay3.close;
  if SSumOut='' then SSumOut := '0';
  DSumEnd := DSumEnd-StrToFloat(SSumOut);
  DSumEnd := round(DSumEnd*100)/100;
  MsExcel.Cells.Item[i+4,2] := 'Прочий расход';
  MsExcel.Cells.Item[i+4,3] := SSumOut;


  form1.ADOQDay3.SQL.Add('SELECT SUM(sum_op) FROM operation WHERE date_op<:Qdate_op AND (op=2 OR op=5)');
  form1.ADOQDay3.Parameters.ParamByName('Qdate_op').Value := DD;
  form1.ADOQDay3.Open;
  DSumComing := form1.ADOQDay3.Fields[0].AsFloat;
  DSumComing := round(DSumComing*100)/100;
  form1.ADOQDay3.SQL.Clear;
  form1.ADOQDay3.close;
  form1.ADOQDay3.SQL.Add('SELECT SUM(percent_op) FROM operation WHERE date_op<:Qdate_op AND (op=2 OR op=5)');
  form1.ADOQDay3.Parameters.ParamByName('Qdate_op').Value := DD;
  form1.ADOQDay3.Open;
  DSumComing := DSumComing+form1.ADOQDay3.Fields[0].AsFloat;
  DSumComing := round(DSumComing*100)/100;
  form1.ADOQDay3.SQL.Clear;
  form1.ADOQDay3.close;
  form1.ADOQDay3.SQL.Add('SELECT SUM(delay_op) FROM operation WHERE date_op<:Qdate_op AND (op=2 OR op=5)');
  form1.ADOQDay3.Parameters.ParamByName('Qdate_op').Value := DD;
  form1.ADOQDay3.Open;
  DSumComing := DSumComing+form1.ADOQDay3.Fields[0].AsFloat;
  DSumComing := round(DSumComing*100)/100;
  form1.ADOQDay3.SQL.Clear;
  form1.ADOQDay3.close;
  form1.ADOQDay3.SQL.Add('SELECT SUM(sum_op) FROM operation WHERE date_op<:Qdate_op AND op=10');
  form1.ADOQDay3.Parameters.ParamByName('Qdate_op').Value := DD;
  form1.ADOQDay3.Open;
  DSumComing := DSumComing+form1.ADOQDay3.Fields[0].AsFloat;
  DSumComing := round(DSumComing*100)/100;
  form1.ADOQDay3.SQL.Clear;
  form1.ADOQDay3.close;
  form1.ADOQDay3.SQL.Add('SELECT SUM(sum_op) FROM operation WHERE date_op<:Qdate_op AND op=1');
  form1.ADOQDay3.Parameters.ParamByName('Qdate_op').Value := DD;
  form1.ADOQDay3.Open;
  DSumComing := DSumComing-form1.ADOQDay3.Fields[0].AsFloat;
  DSumComing := round(DSumComing*100)/100;
  form1.ADOQDay3.SQL.Clear;
  form1.ADOQDay3.close;
  main.form1.ADOQDay3.SQL.Add('SELECT SUM(sum_op) FROM operation WHERE date_op<:Qdate_op AND op=11');
  form1.ADOQDay3.Parameters.ParamByName('Qdate_op').Value := DD;
  form1.ADOQDay3.Open;
  DSumComing := DSumComing-form1.ADOQDay3.Fields[0].AsFloat;
  DSumComing := round(DSumComing*100)/100;
  form1.ADOQDay3.SQL.Clear;
  form1.ADOQDay3.close;
  DSumEnd := DSumComing+DSumEnd;

  Form1.ADOQDay3.SQL.Add('SELECT name_filial FROM pasport');
  Form1.ADOQDay3.Open;
  MsExcel.Cells.Item[3,4] := Form1.ADOQDay3.Fields[0].AsInteger;
  Form1.ADOQDay3.Close;
  Form1.ADOQDay3.SQL.Clear;
  MsExcel.Cells.Item[4,4] := StrToDate(dd);
  MsExcel.Cells.Item[6,6] := DSumComing;
  MsExcel.Cells.Item[i,2] := 'Итого';
  MsExcel.Cells.Item[i,3].Formula := '=Sum(R8C3:R'+IntToStr(i-1)+'C3)';
  MsExcel.Cells.Item[i,4].Formula := '=Sum(R8C4:R'+IntToStr(i-1)+'C4)';
  MsExcel.Cells.Item[i,5].Formula := '=Sum(R8C5:R'+IntToStr(i-1)+'C5)';
  MsExcel.Cells.Item[i,6].Formula := '=Sum(R8C6:R'+IntToStr(i-1)+'C6)';
  MsExcel.Cells.Item[i+1,2] := 'Кол-во договоров';
  MsExcel.Cells.Item[i+1,3] := numCloseContract;
  MsExcel.Cells.Item[i+1,6] := numOpenContract;
  MsExcel.Cells.Item[i+5,4] := 'Остаток на конец';
  MsExcel.Cells.Item[i+5,6] := DSumEnd;
  MsExcel.Range[MsExcel.Cells[9, 2], MsExcel.Cells[i, 6]].Select;
  MsExcel.Selection.Borders.LineStyle:=1;
  MsExcel.Range[MsExcel.Cells[i, 2], MsExcel.Cells[i, 6]].Select;
  MsExcel.Selection.Font.Bold := True;
  Close;
 // MsExcel.ActiveWorkBook.SaveAs('c:\test.xls');
  MsExcel.Visible := True;
end;

procedure TdayReport.FormCreate(Sender: TObject);
begin
 DTP1.Date := DOpenDay;
 DTP1.MinDate := getLastDate+1;
end;

procedure TdayReport.Button2Click(Sender: TObject);
begin
  Close;
end;

end.
