unit uslv_form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, ADODB, Menus,
  Buttons, ComCtrls, Order, enContract, enDeliverer, DANADO;

type
  Tuslv = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    ADOQuery1: TADOQuery;
    StringGrid1: TStringGrid;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    N2: TMenuItem;
    N3: TMenuItem;
    BitBtn1: TBitBtn;
    N4: TMenuItem;
    DateTimePicker1: TDateTimePicker;
    CheckBox1: TCheckBox;
    Edit1: TEdit;
    Edit2: TEdit;
    StaticText1: TLabel;
    StaticText2: TLabel;
    StaticText3: TLabel;
    StaticText4: TLabel;
    Button4: TButton;
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure StringGrid1ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure N1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
  private
    procedure ScreenResult;
  public

  end;

var
  uslv: Tuslv;

implementation

uses main, DateUtils, ComObj, fr_form, FullSum, AddClient_form,newContract_form;

type
  THackGrid = class(TStringGrid);

var
  dSumContract, dSumPercent, dSumDelay, dSumAll: double;
  iNumContract: integer;
  MSExcel: variant;
{$R *.dfm}

procedure Tuslv.ScreenResult;
begin
  dSumContract := round(dSumContract * 100) / 100;
  uslv.Label1.Caption := FloatToStr(dSumContract);
  dSumPercent := round(dSumPercent * 100) / 100;
  uslv.Label2.Caption := FloatToStr(dSumPercent);
  dSumDelay := round(dSumDelay * 100) / 100;
  uslv.Label3.Caption := FloatToStr(dSumDelay);
  uslv.Label4.Caption := FloatToStr(iNumContract);
  dSumAll := dSumContract + dSumPercent + dSumDelay;
  uslv.Label5.Caption := FloatToStr(dSumAll);
end;

procedure Tuslv.Button3Click(Sender: TObject);
begin
  Close;
end;

procedure Tuslv.FormCreate(Sender: TObject);
begin
  ADOQuery1.ConnectionString := DANADO.utils.getConnectionString;
  CheckBox1.Visible := FALSE;
  DateTimePicker1.Date := DOpenDay;
  Edit2.Text := '10';
  StringGrid1.Cells[0, 0] := '#';
  StringGrid1.Cells[1, 0] := 'Номер договора';
  StringGrid1.Cells[2, 0] := 'Дата окончания';
  StringGrid1.Cells[3, 0] := 'Сумма договора';
  StringGrid1.Cells[4, 0] := 'Сумма %';
  StringGrid1.Cells[5, 0] := 'Просрочка';
  StringGrid1.Cells[6, 0] := 'Кол-во дней';
  dSumContract := 0;
  dSumPercent := 0;
  dSumDelay := 0;
  dSumAll := 0;
  iNumContract := 0;
  if (bDeepOptions) then
  begin
    Button2.Visible := True;
    CheckBox1.Visible := FALSE;
  end;
end;

procedure Tuslv.Button1Click(Sender: TObject);
var
  BNumDate, BNumDate2: byte;
  i: integer;
  dDelay, dPercent: double;
begin
  i := 0;
  Label1.Caption := '';
  Label2.Caption := '';
  Label3.Caption := '';
  Label4.Caption := '';
  Label5.Caption := '';
  dSumContract := 0;
  dSumPercent := 0;
  dSumDelay := 0;
  INUMCONTRACT := 0;
  StringGrid1.ColWidths[6] := 87;
  BNumDate := StrToInt(Edit2.Text);
  //DDay := IncDay(DateTimePicker1.Date, -BNumDate);
  form1.ADOQDay3.SQL.Add('SELECT contract_number, estimated_amount, date_end, num_of_day,');
  form1.ADOQDay3.SQL.Add('deliverer.name,contract_info.id ');
  form1.ADOQDay3.SQL.Add('FROM contract_info INNER JOIN deliverer ON');
  form1.ADOQDay3.SQL.Add('contract_info.id_deliverer=deliverer.id');
  form1.ADOQDay3.SQL.Add('WHERE con_status=-1 AND date_end<:Qdate');
  form1.ADOQDay3.Parameters.ParamByName('Qdate').Value := IncDay(DateTimePicker1.Date, -BNumDate);
  with form1.ADOQDay3 do
  begin
    form1.ADOQDay3.Open;

    if not (form1.ADOQDay3.IsEmpty) then
      StringGrid1.RowCount := 1

    else
      StringGrid1.Rows[1].Clear;

    while not eof do
    begin
      BNumDate := form1.ADOQDay3.Fields[3].AsInteger;
      BNumDate2 := DaysBetween(form1.ADOQDay3.Fields[2].AsDateTime, DOpenDay);
      StringGrid1.RowCount := StringGrid1.RowCount + 1;
      StringGrid1.Cells[0, i + 1] := IntToStr(i + 1);
      StringGrid1.Cells[1, i + 1] := form1.ADOQDay3.Fields[0].AsString;
      StringGrid1.Cells[2, i + 1] := form1.ADOQDay3.Fields[2].AsString;
      StringGrid1.Cells[3, i + 1] := form1.ADOQDay3.Fields[1].AsString;
      StringGrid1.Cells[6, i + 1] := form1.ADOQDay3.Fields[3].AsString;
      StringGrid1.Cells[7, i + 1] := form1.ADOQDay3.Fields[4].AsString;
      StringGrid1.Cells[8, i + 1] := form1.ADOQDay3.FieldByName('id').AsString;
      dDelay := form1.ADOQDay3.Fields[1].AsFloat * (0.01 * BNumDate2) / 100;
      dDelay := round(dDelay * 100) / 100;
      dPercent := 0.1 * BNumDate * form1.ADOQDay3.Fields[1].AsFloat / 100;
      dPercent := round(dPercent * 100) / 100;
      dSumContract := dSumContract + form1.ADOQDay3.Fields[1].AsFloat;
      dSumPercent := dSumPercent + dPercent;
      dSumDelay := dSumDelay + dDelay;
      Inc(iNumContract);
      StringGrid1.Cells[4, i + 1] := FloatToStr(dPercent);
      StringGrid1.Cells[5, i + 1] := FloatToStr(dDelay);
      inc(i);
      Next;
    end;
    form1.ADOQDay3.Close;
  end;
  form1.ADOQDay3.SQL.Clear;
  {if StringGrid1.ScrollBars = ssVertical then
    StringGrid1.ColWidths[5] := StringGrid1.ColWidths[5] -
      GetSystemMetrics(SM_CXVSCROLL);
      }
  if StringGrid1.RowCount > 1 then
    StringGrid1.FixedRows := 1;
  ScreenResult;
end;

procedure Tuslv.Button2Click(Sender: TObject);
var
  idContract: real;
  i, iNextOrderNumber: integer;
  sEmployee, sFilial, sContract: string;
  dSum: Double;
  iIdOp: Integer;
  orderList : TOrder;
  op11 : Double;
  summe : Double;
begin
  //i := 0;
  op11 := 0.0;

  ADOQuery1.SQL.Add('SELECT name_filial,employee.name FROM pasport INNER JOIN employee ON pasport.id_CurrentEmployee=employee.id');
  ADOQuery1.Open;
  sEmployee := Copy(ADOQuery1.Fields[1].AsString, 1, 8);
  sFilial := ADOQuery1.Fields[0].AsString;
  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  i := 0;
  while i < StringGrid1.RowCount - 1 do begin
     { ADOQuery1.SQL.Add('SELECT id FROM contract_info WHERE contract_number=:pContractNum');
      ADOQuery1.Parameters.ParamByName('pContractNum').Value :=
        StringGrid1.Cells[1, i + 1];
      ADOQuery1.Open;
      idContract := ADOQuery1.Fields[0].AsInteger;
      ADOQuery1.SQL.Clear;
      ADOQuery1.Close;
      }
      ADOQuery1.SQL.Add('UPDATE contract_info SET con_status=0,DateClose=:pDateClose WHERE id=:pIDContract');
      idContract := StrToInt(StringGrid1.Cells[8,i+1]);
      ADOQuery1.Parameters.ParamByName('pIDContract').Value := idContract;
      ADOQuery1.Parameters.ParamByName('pDateClose').Value := DOpenDay;
      ADOQuery1.ExecSQL;
      ADOQuery1.SQL.Clear;
      ADOQuery1.Close;
      ADOQuery1.SQL.Add('UPDATE product_info SET product_status=0 WHERE id_contract=:pIDUP');
      ADOQuery1.Parameters.ParamByName('pIDUP').Value := idContract;
      ADOQuery1.ExecSQL;
      ADOQuery1.SQL.Clear;
      ADOQuery1.Close;
      ADOQuery1.SQL.Add('INSERT INTO operation (op,date_op,sum_op,id_contract_op,percent_op,delay_op)');
      ADOQuery1.SQL.Add('VALUES (:Qop,:Qdate_op,:Qsum_op,:Qid_contract_op,:Qpercent_op,:Qdelay_op)');
      ADOQuery1.Parameters.ParamByName('Qop').Value := 5;
      ADOQuery1.Parameters.ParamByName('Qdate_op').Value := DOpenDay;
      ADOQuery1.Parameters.ParamByName('Qsum_op').Value := StringGrid1.Cells[3, i
        + 1];
      ADOQuery1.Parameters.ParamByName('Qid_contract_op').Value := idContract;
      ADOQuery1.Parameters.ParamByName('Qpercent_op').Value :=
        StringGrid1.Cells[4, i + 1];
      ADOQuery1.Parameters.ParamByName('Qdelay_op').Value := StringGrid1.Cells[5, i
        + 1];
      ADOQuery1.ExecSQL;
      ADOQuery1.SQL.Clear;
      ADOQuery1.Close;
      op11 := op11 + StrToFloat(StringGrid1.Cells[3, i + 1])
      + StrToFloat(StringGrid1.Cells[4, i + 1])
      + StrToFloat(StringGrid1.Cells[5, i + 1]);
      summe := 0.0;
      summe := StrToFloat(StringGrid1.Cells[3, i + 1])
      + StrToFloat(StringGrid1.Cells[4, i + 1])
      + StrToFloat(StringGrid1.Cells[5, i + 1]);
      if (bPPOStatus) then begin

          if (CheckBox1.Checked) then begin
            dSum := StrToFloat(StringGrid1.Cells[3, i + 1]) +
            StrToFloat(StringGrid1.Cells[4, i + 1]) +
            StrToFloat(StringGrid1.Cells[5, i + 1]);
            sContract := 'N Дог. ' + StringGrid1.Cells[1, i + 1];
            fr_form.Form3.CheckType('BayOut', sEmployee, sContract, sFilial, dSum);
          end else begin
            if (Form3.ConfirmCheck('по договору ' + StringGrid1.Cells[1, i + 1])) then begin
              dSum := StrToFloat(StringGrid1.Cells[3, i + 1]) +
              StrToFloat(StringGrid1.Cells[4, i + 1]) +
              StrToFloat(StringGrid1.Cells[5, i + 1]);
              sContract := 'N Дог. ' + StringGrid1.Cells[1, i + 1];
              fr_form.Form3.CheckType('BayOut', sEmployee, sContract, sFilial, dSum);
            end;
          end;
      end else begin
        orderList := TOrder.Create;
        ADOQuery1.SQL.Clear;
        ADOQuery1.SQL.Add('SELECT Max(id) FROM operation');
        ADOQuery1.Open;
        iIdOp := ADOQuery1.Fields[0].AsInteger;
        ADOQuery1.SQL.Clear;
        ADOQuery1.Close;
        orderList.bill := '3771, 373, 374';
        orderList.summ := FloatToStr(summe);
        orderList.from := StringGrid1.Cells[7, i+1];
        orderList.ground := 'возврат фин. кредит №' +  StringGrid1.Cells[1, i+1];
        orderList.summInWord := SumNumToFull(summe);
        orderList.summCent := FloatToStr(Round(Frac(summe)*100)/100*100);
        orderList.date := DateToStr(DOpenDay);
        orderList.additional := 'фин. кредит - '+FloatToStr(StrToFloat(StringGrid1.Cells[3, i+1]))+' % - '+StringGrid1.Cells[4, i+1]+' пеня - '+StringGrid1.Cells[5, i+1];
        orderList.orderType := 2;
        orderList.saveDocument(iIdOp);
        if orderList.ConfirmCheck then begin
        orderList.printReceiptDocument;
        end;
        orderList.Destroy;

      end;
    Inc(i);
  end;
    ADOQuery1.SQL.Add('INSERT INTO operation (op,date_op,sum_op,id_contract_op,percent_op,delay_op,TimestampField)');
    ADOQuery1.SQL.Add('VALUES (:Qop,:Qdate_op,:Qsum_op,:Qid_contract_op,:Qpercent_op,:Qdelay_op,:TimestampField)');
    ADOQuery1.Parameters.ParamByName('Qop').Value := 11;
    ADOQuery1.Parameters.ParamByName('Qdate_op').Value := DOpenDay;
    ADOQuery1.Parameters.ParamByName('Qsum_op').Value := op11;
    ADOQuery1.Parameters.ParamByName('Qid_contract_op').Value := 0;
    ADOQuery1.Parameters.ParamByName('Qpercent_op').Value := 0;
    ADOQuery1.Parameters.ParamByName('Qdelay_op').Value := 0;
    ADOQuery1.Parameters.ParamByName('TimestampField').Value := Now;
    ADOQuery1.ExecSQL;
    ADOQuery1.SQL.Clear;
    ADOQuery1.Close;
  if bPPOStatus then begin
    if Form3.ConfirmCheck('Прочий расход') = True then begin
      fr_form.Form3.InOutSum('Out', 'kassir', dSumAll);
    end;
  end else begin

      orderList := TOrder.Create;
        ADOQuery1.SQL.Clear;
        ADOQuery1.SQL.Add('SELECT Max(id) FROM operation');
        ADOQuery1.Open;
        iIdOp := ADOQuery1.Fields[0].AsInteger;
        ADOQuery1.SQL.Clear;
        ADOQuery1.Close;
        orderList.bill := '683';
        orderList.summ := FloatToStr(op11);
       // orderList.from := StringGrid1.Cells[7, i+1];
        orderList.from := chief;
        orderList.ground := 'Служебное изьятие';
        orderList.summInWord := SumNumToFull(op11);
        orderList.summCent := FloatToStr(Round(Frac(op11)*100)/100*100);
        orderList.date := DateToStr(DOpenDay);
        orderList.document := chiefData;
        orderList.chief := chief;
        orderList.orderType := 1;
        orderList.saveDocument(iIdOp);
        if Form3.ConfirmCheck('ОРДЕР НА РАСХОД') = True then begin
        orderList.printExpenseReport;
        end;
        orderList.Destroy;
  end;

  Close;
end;

procedure Tuslv.StringGrid1ContextPopup(Sender: TObject; MousePos: TPoint; var
  Handled: Boolean);
var
  C, R: Integer;
begin
  with TStringGrid(Sender) do
  begin
    MouseToCell(MousePos.X, MousePos.Y, C, R);
    if (C >= FixedCols) and (R >= FixedRows) then
    begin
      Row := R;
      Col := C;
    end
    else
      Handled := True;
  end;
end;

procedure Tuslv.N1Click(Sender: TObject);
var
  i, iPositionSell, iPositionTop: integer;
begin
  i := 0;
  iPositionSell := StringGrid1.Row;
  iPositionTop := StringGrid1.TopRow;
  dSumContract := dSumContract - StrToFloat(StringGrid1.Cells[3,
    iPositionSell]);
  dSumPercent := dSumPercent - StrToFloat(StringGrid1.Cells[4, iPositionSell]);
  dSumDelay := dSumDelay - StrToFloat(StringGrid1.Cells[5, iPositionSell]);
  Dec(iNumContract);
  THackGrid(StringGrid1).DeleteRow(StringGrid1.Row);
  StringGrid1.TopRow := iPositionTop;
  if iPositionSell > StringGrid1.RowCount - 1 then
    iPositionSell := StringGrid1.RowCount - 1;
  StringGrid1.Row := iPositionSell;
  while i < StringGrid1.RowCount do
  begin
    StringGrid1.Cells[0, i + 1] := IntToStr(i + 1);
    Inc(i);
  end;
  //StringGrid1.RowCount := StringGrid1.RowCount-1;
  ScreenResult;
end;

procedure Tuslv.Button4Click(Sender: TObject);
var
  inContract : String;
  contract1 : TENContract2;
  BNumDate, BNumDate2 : Integer;
  dDelay, dPercent : Double;
  i : Integer;
  already : Boolean;
begin
//
  already := FALSE;
  inContract := '';
  inContract := InputBox('Добавить по номеру договора','Номер договора :', '');
  if (inContract <> '') then begin
    contract1 := DANADO.contract.getContractByNumber(inContract);
    contract1.deliverer := DANADO.deliverer.getDelivererById(contract1.idDeliverer);
    if (contract1.contractNumber <> '0') then  begin
      // Проверка на совпадение
      for i := 1 to StringGrid1.RowCount do begin
        if (StringGrid1.Cells[1,i] = contract1.contractNumber) then already := TRUE;
      end;

      if (not Already) then begin
        if (StringGrid1.Cells[0,1] <> '') then begin
          StringGrid1.RowCount := StringGrid1.RowCount + 1;
        end;
        StringGrid1.Cells[0, StringGrid1.RowCount-1] := IntToStr(StringGrid1.RowCount-1);
        BNumDate := contract1.numOfDay;
        BNumDate2 := DaysBetween(StrToDate(contract1.dateEnd), DOpenDay);
        StringGrid1.Cells[1, StringGrid1.RowCount-1] := contract1.contractNumber;
        StringGrid1.Cells[2, StringGrid1.RowCount-1] := contract1.dateEnd;
        StringGrid1.Cells[3, StringGrid1.RowCount-1] := FloatToStr(contract1.estimatedAmount);
        StringGrid1.Cells[6, StringGrid1.RowCount-1] := IntToStr(contract1.numOfDay);
        StringGrid1.Cells[7, StringGrid1.RowCount-1] := contract1.deliverer.getName;
        StringGrid1.Cells[8, StringGrid1.RowCount-1] := IntToStr(contract1.id);
        dDelay := contract1.estimatedAmount * (0.01 * BNumDate2) / 100;
        dDelay := round(dDelay * 100) / 100;
        dPercent := 0.1 * BNumDate * contract1.estimatedAmount / 100;
        dPercent := round(dPercent * 100) / 100;
        dSumContract := dSumContract + contract1.estimatedAmount;
        dSumPercent := dSumPercent + dPercent;
        dSumDelay := dSumDelay + dDelay;
        StringGrid1.Cells[4, StringGrid1.RowCount-1] := FloatToStr(dPercent);
        StringGrid1.Cells[5, StringGrid1.RowCount-1] := FloatToStr(dDelay);
      end else ShowMessage('Договор уже есть в Списке!');
    end;
  end;
  ScreenResult;
end;

procedure Tuslv.N2Click(Sender: TObject);
var
  idDeliverer: Integer;
  conNumber : String;
begin
  bEditMark := True;
  AddClient_form.AddClient := TAddClient.Create(Self);
  ADOQuery1.SQL.Add('SELECT id_deliverer FROM contract_info WHERE contract_number=:pcn');
  conNumber := StringGrid1.Cells[1, StringGrid1.Row];
  ADOQuery1.Parameters.ParamByName('pcn').Value := conNumber;
  ADOQuery1.Open;
  idDeliverer := ADOQuery1.FieldByName('id_deliverer').AsInteger;
  ADOQuery1.SQL.Clear;
  addClient.fillDelivererFromId(idDeliverer);
  AddClient_form.AddClient.ShowModal;
end;

procedure Tuslv.BitBtn1Click(Sender: TObject);
var
  MSExcel: variant;
  i: integer;
  myContract : TENContract2;
  myDeliv : TENDeliverer;
begin
  myContract := TENContract2.Create;
  myDeliv := TENDeliverer.Create;

  MSExcel := CreateOleobject('Excel.Application');
  MSExcel.WorkBooks.Add('C:\Pawn\report\overdue.xls');

  MsExcel.Cells.Item[1,5].Value := 'Клиент';
  MsExcel.Cells.Item[1,6].Value :=  'Телефон';
  For i := 1 to StringGrid1.RowCount-1 do begin
    myContract := DANADO.contract.getContractById(StrToInt(StringGrid1.Cells[8, i]));
    myDeliv := DANADO.deliverer.getDelivererById(myContract.idDeliverer);

    MsExcel.Cells.Item[i+1,1].Value := i;
    MsExcel.Cells.Item[i+1,2].Value := #39+myContract.contractNumber;
    MsExcel.Cells.Item[i+1,3].Value := #39+myContract.DateEnd;
    MsExcel.Cells.Item[i+1,4].Value := #39+FloatToStr(myContract.estimatedAmount);
    MsExcel.Cells.Item[i+1,5].Value := #39+myDeliv.getName;
    MsExcel.Cells.Item[i+1,6].Value := #39+myDeliv.getTelephon;
  end;

  MsExcel.Range[MsExcel.Cells[2, 1], MsExcel.Cells[i, 6]].Select;
  MsExcel.Selection.Borders.LineStyle:=1;
  MsExcel.Visible := True;
end;

procedure Tuslv.N4Click(Sender: TObject);
var
  x: integer;
begin
  bEditMark := true;
  x := StringGrid1.Row;
  sEditContractNumber := StringGrid1.Cells[1, x];
  sEditContractId := StringGrid1.Cells[8, x];
  //ShowMessage(sEditContractId);
  newContract_form.newContract := TnewContract.Create(Self);
  newContract_form.newContract.Caption := 'Информация о договоре';
  newContract_form.newContract.ShowModal;
end;

end.

