unit bayout_form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, ADODB, ExtCtrls, IniFiles, xmldom,
  XMLIntf, msxmldom, XMLDoc, Order, FullSum, enDeliverer, DANADO, enArrears;

type
  Tbayout = class(TForm)
    Label1: TLabel;
    DBGrid1: TDBGrid;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Button2: TButton;
    ADODataSet1: TADODataSet;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    Button3: TButton;
    Bevel5: TBevel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bevel6: TBevel;
    Bevel7: TBevel;
    Bevel9: TBevel;
    Bevel8: TBevel;
    Bevel10: TBevel;
    Button1: TButton;
    xmldcmntXMLD: TXMLDocument;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    StaticText11: TLabel;
    StaticText3: TLabel;
    StaticText1: TLabel;
    StaticText2: TLabel;
    StaticText5: TLabel;
    StaticText6: TLabel;
    StaticText7: TLabel;
    StaticText8: TLabel;
    StaticText9: TLabel;
    StaticText10: TLabel;
    StaticText12: TLabel;
    StaticText13: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Bevel11: TBevel;
    Bevel12: TBevel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    function codetarif(code_filial : Integer) : Integer;
    procedure FormShow(Sender: TObject);
  private
    contractTypeGroup : Integer;
  public

  end;

var
  bayout: Tbayout;
  id: string;
  SaleType: Byte;
  iDelivererId: Integer;
  specialCondition: boolean;
  deliverer: TENdeliverer;
  bayoutArrears : TENArrears;
  arrearsInBayoutForm : Boolean;
implementation

uses main, DateUtils, fr_form, sclient_form, sale_form, newContract_form, MyUtils;
{$R *.dfm}

procedure Tbayout.Button1Click(Sender: TObject);
var
  q: string;
  num_d, i, bCreditBodyPercentTmp: byte;
  bStatus: boolean;
  DateTmp, DateNow, DateEnd, DateBegin: TDateTime;
  res, percent_new, penya, prc, dReducePercent, percentPerDay, percentTotal: double;
  IniFile: TIniFile;
  dFixPercent,conPercent: Double;
  z: Integer;
  count: Integer;
  numOfDay, sumStart, sumEnd, percentFromXML: string;
  specialAction : Integer;
  daysInContract : Integer;
begin
  if Edit1.Text <> '' then begin
  deliverer := TENDeliverer.Create;
    ADOQuery1.SQL.Add('SELECT id,con_status,SpecialCondition,SpecialAction, contractTypeGroup, num_of_day, arrears FROM contract_info WHERE id=:pId');
    ADOQuery1.Parameters.ParamByName('pId').Value := main.Form1.StringGrid1.Cells[10,main.Form1.StringGrid1.Row];
    ADOQuery1.Open;
    id := ADOQuery1.Fields[0].AsString;
    bStatus := ADOQuery1.Fields[1].AsBoolean;
    SpecialCondition := ADOQuery1.Fields[2].AsBoolean;
    daysInContract := ADOQuery1.FieldByName('num_of_day').AsInteger;
    arrearsInBayoutForm := ADOQuery1.FieldByName('arrears').AsBoolean;


    if ((ADOQuery1.FieldByName('contractTypeGroup').AsString = '') OR (ADOQuery1.FieldByName('contractTypeGroup').AsString = '100')) then begin
     contractTypeGroup := codetarif(StrToInt(sNameFilial));
    end
    else begin
      contractTypeGroup := ADOQuery1.FieldByName('contractTypeGroup').AsInteger;
    end;
    if (SpecialCondition) then begin
      bayout.Caption := 'Выкуп изделия (Специальные условия)';
      Label2.Caption := 'Специальные условия';
    end;
    specialAction := ADOQuery1.Fields[3].AsInteger;
    ADOQuery1.SQL.Clear;
    ADOQuery1.close;
    if bStatus then begin
      Button2.Enabled := True;
      q := 'SELECT product,metal,num,test,price,weight,weight_net,estimated_amount FROM product_info WHERE id_contract=' + id;
      ADODataSet1.CommandText := q;
      ADODataSet1.Active := True;
      for i := 1 to 6 do
      begin
        DBGrid1.Columns[i].Width := 67;
      end;
      DBGrid1.Columns[0].Width := 100;
      DBGrid1.Columns[7].Width := 80;
      DBGrid1.Columns[0].Title.Caption := 'Изделие';
      DBGrid1.Columns[1].Title.Caption := 'Метал';
      DBGrid1.Columns[2].Title.Caption := 'Кол-во';
      DBGrid1.Columns[3].Title.Caption := 'Проба';
      DBGrid1.Columns[4].Title.Caption := 'Цена';
      DBGrid1.Columns[5].Title.Caption := 'Вес';
      DBGrid1.Columns[6].Title.Caption := 'Вес чистый';
      DBGrid1.Columns[7].Title.Caption := 'Сумма оценки';
      ADOQuery1.SQL.Add('SELECT deliverer.name,num_of_day,loan_amount,estimated_amount,date_begin,date_end,con_percent,amount_ref,sum_percent,deliverer.id,deliverer.id_tarif');
      ADOQuery1.SQL.Add('FROM contract_info INNER JOIN deliverer ON deliverer.id=contract_info.id_deliverer WHERE contract_info.id=:pId');
      ADOQuery1.Parameters.ParamByName('pId').Value := id;
      ADOQuery1.Open;
      Label1.Caption := ADOQuery1.Fields[0].AsString;
      Label3.Caption := ADOQuery1.Fields[1].AsString;
      Label4.Caption := ADOQuery1.Fields[6].AsString;
      Label5.Caption := ADOQuery1.Fields[4].AsString;
      Label6.Caption := ADOQuery1.Fields[5].AsString;
      Label7.Caption := ADOQuery1.Fields[3].AsString;
      Label8.Caption := ADOQuery1.Fields[8].AsString;
      Label11.Caption := ADOQuery1.Fields[2].AsString;
      Label10.Caption := ADOQuery1.Fields[7].AsString;
      iDelivererId := ADOQuery1.Fields[9].AsInteger;
      bSaleGroup := ADOQuery1.Fields[10].AsInteger;
      sSaleGroup := 'Group' + IntToStr(bSaleGroup);
      SaleType := ADOQuery1.Fields[10].AsInteger;
      conPercent := ADOQuery1.FieldByName('con_percent').AsFloat;
      ADOQuery1.SQL.Clear;
      ADOQuery1.close;
      deliverer := DANADO.deliverer.getDelivererById(iDelivererId);
      DateNow := StrToDate(Edit2.Text);
      DateEnd := StrToDate(Label6.Caption);
      DateBegin := StrToDate(Label5.Caption);
      if (DateNow < DateEnd) then begin
        if bSaleGroup <> 5 then begin
          if (specialCondition) then begin
            IniFile := TIniFile.Create('C:\Pawn\sale.ini');
            dReducePercent := dReducePercent - IniFile.ReadFloat('Group6', 'IncreasePercent', 0);
            bCreditBodyPercentTmp := bCreditBodyPercentTmp + IniFile.ReadInteger('Group6', 'EnaLargeCreditBody', 0);
            IniFile.Free;
          end;
          IniFile := TIniFile.Create('C:\Pawn\sale.ini');
          dReducePercent := IniFile.ReadFloat(sSaleGroup, 'ReducePercent', 0);
          bCreditBodyPercentTmp := bCreditBodyPercentTmp + IniFile.ReadInteger(sSaleGroup, 'EnaLargeCreditBody', 0);
          IniFile.Free;
        end
        else begin
          IniFile := TIniFile.Create('c:\pawn\sale.ini');
          dFixPercent := IniFile.ReadFloat(sSaleGroup, 'FixPercent', 0);
          IniFile.Free;
        end;
        num_d := DaysBetween(DateBegin, DateNow);
        if num_d = 0 then num_d := 1
        else num_d := num_d + 1;
        Label3.Caption := IntToStr(num_d);
        if (contractTypeGroup = 100) then begin
            percentPerDay := MyUtils.getPercentPerDay(contractTypeGroup,StrToFloat(Label7.Caption),num_d, deliverer.getId);
            percentTotal := percentPerDay * num_d;
        end else begin
            percentPerDay := MyUtils.getPercentPerDay(contractTypeGroup,StrToFloat(Label7.Caption),num_d, deliverer.getId, StrToInt(id));
            percentTotal := percentPerDay * num_d;
           // ShowMessage(FloatToStr(percentPerDay));
        end;
        if specialCondition then percentPerDay := newContract.setSpecialConditions(percentPerDay);
        //Label4.Caption := FloatToStr(percentPerDay - dReducePercent);
        if bSaleGroup = 5 then begin
         // Label4.Caption := FloatToStr(dFixPercent);
        end;
        percent_new := StrToFloat(Label4.Caption) * num_d;
        res := StrToFloat(Label7.Caption) / 100 * percent_new + StrToFloat(Label7.Caption);
        res := round(res * 100) / 100;
        prc := StrToFloat(Label7.Caption) * percent_new / 100;
        if (specialAction = 1) then begin
          prc := round((prc - (prc / 10)) * 100) / 100;
          Label8.Caption := FloatToStr(prc);
        end
        else begin
          prc := round(prc * 100) / 100;
          Label8.Caption := FloatToStr(prc);
        end;
        Label10.Caption := FloatToStr( StrToFloat(Label7.Caption) + StrToFloat(Label8.Caption));
      end;

      if (DateNow > DateEnd) then begin
        percentPerDay := MyUtils.getPercentPerDay(contractTypeGroup,StrToFloat(Label7.Caption),daysInContract, deliverer.getId, StrToInt(id));
        num_d := DaysBetween(DateEnd, DateNow);
        percentTotal :=StrToFloat(Label7.Caption)* percentPerDay /100* (daysInContract);
        label4.Caption := FloatToStr(percentPerDay);
        label8.Caption := FLoatToStr(round(percentTotal*100)/100);
        penya := ((StrToFloat(Label7.Caption) + ((StrToFloat(Label7.Caption) * conPercent / 100 * daysInContract)))* dDelayPercent) / 100 * num_d;
        penya := round(penya * 100) / 100;
        res := StrToFloat(Label7.Caption) + StrToFloat(Label8.Caption) + penya;
        res := round(res * 100) / 100;
        Label9.Caption := FloatToStr(penya);
        Label10.Caption := FloatToStr(res);
      end;
      if (DateNow = DateEnd) then begin
        percentPerDay := MyUtils.getPercentPerDay(contractTypeGroup,StrToFloat(Label7.Caption),daysInContract, deliverer.getId, StrToInt(id));
        percentTotal :=StrToFloat(Label7.Caption)* percentPerDay /100* (daysInContract);
        //label4.Caption := FloatToStr(percentPerDay);
        label8.Caption := FLoatToStr(round(percentTotal*100)/100);
        label10.Caption := FloatToStr(StrToFloat(Label7.Caption) + StrToFloat(Label8.Caption));
      end;
    end  else begin //
     end;
  end;
      if (arrearsInBayoutForm) then
    begin
      label13.Show;
      bevel11.Show;
      bevel12.Show;
      label12.Show;
      label14.Show;
      bayoutArrears := DANADO.ADOArrears.Create.getArrearsByIdContract(StrToInt(id));
      label12.Caption := FloatToStr(bayoutArrears.arrearsOption1);
      label14.Caption := FloatToStr(bayoutArrears.arrearsOption2);
      label10.Caption := FloatToStr(StrToFloat(label10.Caption) + bayoutArrears.arrearsOption1 + bayoutArrears.arrearsOption2);
    end;
end;

procedure Tbayout.FormCreate(Sender: TObject);
begin
  Edit2.Text := DateToStr(DOpenDay);
  label12.Hide;
  label13.Hide;
  label14.Hide;
  bevel11.Hide;
  bevel12.Hide;
end;

procedure Tbayout.FormShow(Sender: TObject);
begin
  //

end;

procedure Tbayout.Button2Click(Sender: TObject);
var
orderList: TOrder;
iIdOp : Integer;
wReturn : Word;
begin
  {
  if SaleType = 0 then begin
    sale_form.sale := Tsale.Create(Self);
    sale_form.sale.ShowModal;
  end;
  }
  wReturn := MessageDlg('Подтверждаете Выкуп?', mtConfirmation, [mbYes, mbNo], 0);
  if wReturn = mrYes then begin
   if (arrearsInBayoutForm) then begin
    Label8.Caption := FloatToStr(StrToFLoat(label8.Caption) + bayoutArrears.arrearsOption1);
    label9.Caption := FloatToStr(StrToFloat(label9.Caption) + bayoutArrears.arrearsOption2);
   end;
  ADOQuery1.SQL.Add('INSERT INTO operation (op,date_op,sum_op,id_contract_op,percent_op,delay_op,TimestampField)');
  ADOQuery1.SQL.Add('VALUES (:Qop,:Qdate_op,:Qsum_op,:Qid_contract_op,:Qpercent_op,:Qdelay_op,:TimestampField)');
  ADOQuery1.Parameters.ParamByName('Qop').Value := 2;
  ADOQuery1.Parameters.ParamByName('Qdate_op').Value := Edit2.Text;
  ADOQuery1.Parameters.ParamByName('Qsum_op').Value := Label7.Caption;
  ADOQuery1.Parameters.ParamByName('Qid_contract_op').Value := id;
  ADOQuery1.Parameters.ParamByName('Qpercent_op').Value := Label8.Caption;
  ADOQuery1.Parameters.ParamByName('Qdelay_op').Value := Label9.Caption;
  ADOQuery1.Parameters.ParamByName('TimestampField').Value := Now;
  ADOQuery1.ExecSQL;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('UPDATE contract_info SET con_status=0, DateClose=:QDateClose WHERE id=:Qid');
  ADOQuery1.Parameters.ParamByName('QDateClose').Value := DOpenDay;
  ADOQuery1.Parameters.ParamByName('Qid').Value := id;
  ADOQuery1.ExecSQL;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('UPDATE product_info SET product_status=0 WHERE id_contract=:Qid');
  ADOQuery1.Parameters.ParamByName('Qid').Value := id;
  ADOQuery1.ExecSQL;
  ADOQuery1.SQL.Clear;
  ADOQuery1.close;
  if bPPOStatus then begin
    ADOQuery1.SQL.Add('SELECT name_filial,employee.name FROM pasport INNER JOIN employee ON pasport.id_CurrentEmployee=employee.id');
    ADOQuery1.Open;
    if fr_form.Form3.ConfirmCheck then
      fr_form.Form3.CheckType('BayOut', Copy(ADOQuery1.Fields[1].AsString, 1, 8), 'N Дог. ' + Edit1.Text, ADOQuery1.Fields[0].AsString, StrToFloat(Label10.Caption));
    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    end else begin
      ADOQuery1.SQL.Clear;
      ADOQuery1.SQL.Add('SELECT Max(id) FROM operation');
      ADOQuery1.Open;
      iIdOp := ADOQuery1.Fields[0].AsInteger;
      ADOQuery1.Close;
    orderList := TOrder.Create;
    orderList.bill := '3771, 373, 374';
    orderList.summ := Label10.Caption;
    orderList.from := Label1.Caption;
    orderList.ground := 'возврат фин. кредит №' +  Edit1.Text;
    orderList.summInWord := SumNumToFull(StrToFloat(Label10.Caption));
    orderList.summCent := FloatToStr(Frac(StrToFloat(Label10.Caption))*100);
    orderList.date := DateToStr(DOpenDay);
    orderList.additional := 'фин. кредит - '+Label7.Caption+' % - '+ Label8.Caption +' пеня - '+Label9.Caption;
    orderList.orderType := 2;
    orderList.recipient := '111';
    OrderList.document := '111';
    orderList.saveDocument(iIdOp);
    if orderList.ConfirmCheck then begin
    orderList.printReceiptDocument;
    orderList.Destroy;
    end;

  end;
  form1.SearchContract;
  Close;
  end;
end;

procedure Tbayout.Button3Click(Sender: TObject);
begin
  Close;
end;

function Tbayout.codetarif(code_filial: Integer): Integer;
var
res : Integer;
begin
  res :=0;
    case code_filial of
    18, 3,4,6,9,10,13,15,16,19,39,44,46,52 : res := 70;
    53 : res :=71;
    1,5,14,30,38,47 : res := 72;
    12 : res := 73;
    45 : res := 74;
    17,21,22,23,24,25,26,33,34,50,51 : res := 75;
    2,7,8,11 : res := 76;
    28,29,31,40,43 : res := 77;
    end;
    Result := res;
end;

procedure Tbayout.FormActivate(Sender: TObject);
begin
  if Edit1.Text <> '' then begin
    Button1.Perform(WM_LBUTTONDOWN, 0, 0);
    Button1.Perform(WM_LBUTTONUP, 0, 0);
  end;
end;

end.

