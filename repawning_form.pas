unit repawning_form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, ADODB, ExtCtrls, RpCon, RpConDS,
  RpDefine, RpRave, IniFiles, xmldom, XMLIntf, msxmldom, XMLDoc, Order, FullSum,
  ContractADO, ContractEntity, EmployeeADO, EmployeeEntity,
  frxClass, frxDBSet, DanUtils, enDeliverer, DiscountStore, piecePay, enArrears, enLoyalty,
  enProduct;
type
  Trepawning = class(TForm)
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Button2: TButton;
    ADOQuery1: TADOQuery;
    ADODataSet1: TADODataSet;
    DataSource1: TDataSource;
    Label17: TLabel;
    Button3: TButton;
    Bevel7: TBevel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    Bevel8: TBevel;
    Bevel9: TBevel;
    reRv: TRvProject;
    reReport: TRvDataSetConnection;
    ADOQuery2: TADOQuery;
    reReport2: TRvDataSetConnection;
    ADOQuery3: TADOQuery;
    q1: TADOQuery;
    StringGrid1: TStringGrid;
    xmldcmntXMLD: TXMLDocument;
    Edit1: TEdit;
    Edit2: TEdit;
    Label10: TEdit;
    pnl1: TPanel;
    Label16: TLabel;
    Label15: TLabel;
    Label14: TLabel;
    Label13: TLabel;
    Label12: TLabel;
    Bevel14: TBevel;
    Bevel13: TBevel;
    Bevel12: TBevel;
    Bevel11: TBevel;
    lbl1: TLabel;
    Label2: TLabel;
    Label18: TLabel;
    Edit4: TEdit;
    Edit3: TEdit;
    sEdit1: TEdit;
    StaticText21: TLabel;
    StaticText3: TLabel;
    StaticText1: TLabel;
    StaticText2: TLabel;
    StaticText5: TLabel;
    StaticText6: TLabel;
    StaticText7: TLabel;
    StaticText8: TLabel;
    StaticText9: TLabel;
    StaticText10: TLabel;
    StaticText11: TLabel;
    StaticText12: TLabel;
    StaticText13: TLabel;
    StaticText14: TLabel;
    StaticText15: TLabel;
    StaticText16: TLabel;
    StaticText17: TLabel;
    StaticText18: TLabel;
    StaticText19: TLabel;
    StaticText20: TLabel;
    sLabel1: TLabel;
    ComboBox1: TComboBox;
    printRepawn: TButton;
    frxReport1: TfrxReport;
    newRepDS: TADODataSet;
    frxDBDataset1: TfrxDBDataset;
    PiecePayBTN: TButton;
    Label19: TLabel;
    Bevel10: TBevel;
    Label20: TLabel;
    Label21: TLabel;
    Bevel15: TBevel;
    Label22: TLabel;
    Label23: TLabel;


    procedure Button1Click();
    procedure FormCreate(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Label10KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox1Exit(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Label10Exit(Sender: TObject);
    procedure applyRePawn;
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit4Exit(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    function codetarif(code_filial : Integer) : Integer;
    procedure Buttn1Click(Sender: TObject);
    procedure Buttonkey1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure printRepawnClick(Sender: TObject);
    procedure PiecePayBTNClick(Sender: TObject);
    procedure piecePayApply(sm1 : String);
    procedure showArrearsInForm(arr1 : TENArrears);
    procedure mySnapShot(myFileName : String);
    function getRepawnCodeFilial(conNumber: String): String;
    procedure setProductStatusFalseByIdProduct(id1 : Integer);
    procedure ComboBox1Click(Sender: TObject);
  private

    con_percent: Double;
    contract : TContract;
    procedure init();
  public
    contractTypeGroup : Integer;
    newIdTarif : Integer;
    deliverer: TENdeliverer;
   // procedure DrawGridCheckBox(Canvas: TCanvas; Rect: TRect; Checked: boolean);
    { Public declarations }
  end;

var
  repawning: Trepawning;
  sSaleGroup, DContractNumber, id, sIdParentContract: string;
  DFullSumToReturn: double;
  bSaleGroup: byte;
  SaleType: Integer;
  specialCondition: Boolean;
  estimatedPercent: Double;
  dollarPriceTmp : Double;
  dSum: Double;
  bCreditBodyPercentTmp : Double;
  dReducePercent : Double;
  delivererName : string;
  delivererPasport : string;
  parentContract : TContract;
  netWeight : Double;
  i : Integer;
  edit4text : Double;
  maxAmount : Double;
  lab21 : Double;
  contractPieceLast : Double;
  arrears : Boolean;
  arrearsInForm : Boolean;
  repawnArrears : TENArrears;
  newProduct : TENProduct;
  minSumm : Double;
implementation

uses
main, DateUtils, fr_form, sclient_form, bayout_form, sale_form,
MyUtils, newContract_form, sprice_form, danado,exchangeRepawnContractType;
{$R *.dfm}

procedure Trepawning.Buttn1Click(Sender: TObject);
var

  addClientDate : TDate;
addlotoDate : TDate;
begin


end;

procedure Trepawning.Button1Click();
var
  q: string;
  i, j: byte;
  num_d : Integer;
  DateNow, DateEnd, DateBegin: TDateTime;
  res, percent_new, penya, prc,
    percentPerDay, percentTotal: double;
  IniFile: TIniFile;
  bStatus: Boolean;
  dFixPercent: Double;
  numOfDay, sumStart, sumEnd, percentFromXML: string;
  z, count: Integer;
  specialAction : Integer;
  dSaleOnGram: double;
  contractPercent : Double;
  piece : Array[1..12] of String;
  lab8, lab20 : Double;
  tmpConNumber : string;
  idCOntract : Integer;
  conPercent : Double;
  daysInContract : Integer;

begin
minSumm := 0;
  repawnArrears := TENArrears.create;
  j := 0;
  estimatedPercent := 100;
  dReducePercent := 0;
  bCreditBodyPercentTmp := 0;
  if Edit1.Text <> '' then begin
    idContract:= StrToInt(main.Form1.StringGrid1.Cells[10,main.Form1.StringGrid1.Row]);

    newProduct := danado.product.getProductByIdContract(idContract);
    //ShowMessage(IntToStr(newProduct.p[0].idContract));
    //newProduct := DANADO.product.changeIdContract(newProduct,12272);
   // newProduct := DANADO.product.changeProductStatusById(newProduct,31822,false);
   // ShowMessage(IntToStr(newProduct.p[0].idContract));
   // DANADO.product.addProductByIdContract(newProduct,777);

    ADOQuery1.SQL.Add('SELECT id, con_status, idParentContract, SpecialCondition, EstimatedPercent, DollarPrice, SpecialAction, date_begin, con_percent,contractTypeGroup, ');
    ADOQuery1.SQL.Add(' arrears, num_of_day');
    ADOQuery1.SQL.Add('FROM contract_info WHERE id = :pId');
    ADOQuery1.Parameters.ParamByName('pId').Value := idContract;
    ADOQuery1.Open;
    specialCondition := ADOQuery1.FieldByName('SpecialCondition').AsBoolean;
    contract.id := ADOQuery1.FieldByName('id').AsInteger;
    contract.dateOfTheContract := ADOQuery1.FieldByName('date_begin').AsDateTime;
    contract.parentContractId := ADOQuery1.FieldByName('idParentContract').AsInteger;
    contract.con_percent := ADOQuery1.FieldByName('con_percent').AsFloat;
    arrearsInForm :=  ADOQuery1.FieldByName('arrears').AsBoolean;
    conPercent := ADOQuery1.FieldByName('con_percent').AsFloat;
    daysInContract := ADOQuery1.FieldByName('num_of_day').AsInteger;
    //contract.arrearsAmount := ADOQuery1.FieldByName('arrearsAmount').AsString;
    contractPercent := contract.con_percent;
    //ShowMessage(ADOQuery1.FieldByName('con_percent').AsString);

    // Самые Старые Договора
    if ((ADOQuery1.FieldByName('contractTypeGroup').AsString = '') OR (ADOQuery1.FieldByName('contractTypeGroup').AsString = '100')) then  begin
      contractTypeGroup := codetarif(StrToInt(sNameFilial));
    end
    else begin
      contractTypeGroup := ADOQuery1.FieldByName('contractTypeGroup').AsInteger;
    end;

    //ShowMessage(IntToStr(contractTypeGroup));
    // основной Договор
    if (contract.parentContractId=0)then begin
      parentContract := contract;
    end
    else begin
      parentContract := TContractADO.Create.getParentContract(contract);
    end;

    // Проценты
    if (ADOQuery1.FieldByName('EstimatedPercent').AsFloat <> 0) then begin
      estimatedPercent := ADOQuery1.FieldByName('EstimatedPercent').AsFloat;
    end;

    specialAction := ADOQuery1.FieldByName('SpecialAction').AsInteger;

    if (ADOQuery1.FieldByName('DollarPrice').AsFloat = 0) then begin
      dollarPriceTmp := dollarPrice
      end
      else begin
      dollarPriceTmp := ADOQuery1.FieldByName('DollarPrice').AsFloat;
    end;

    id := ADOQuery1.FieldByName('id').AsString;

    if (ADOQuery1.FieldByName('idParentContract').AsString = '0') then begin
      sIdParentContract := '';
    end
    else begin
      sIdParentContract := ADOQuery1.FieldByName('idParentContract').AsString;
    end;

    bStatus := ADOQuery1.FieldByName('con_status').AsBoolean;

    ADOQuery1.SQL.Clear;
    ADOQuery1.close;
    // Изделия
    if bStatus then begin
      ADOQuery1.SQL.Add('SELECT product,metal,num,test,price,weight,weight_net,estimated_amount,product_status,id, weight_piece FROM product_info WHERE id_contract=:pidc');
      ADOQuery1.Parameters.ParamByName('pidc').Value := StrToInt(id);

      StringGrid1.ColWidths[8] := 110;
      with ADOQuery1 do begin
        ADOQuery1.Open;
        while not eof do begin
          StringGrid1.Cells[0, j + 1] := ADOQuery1.FieldByName('product').AsString;
          StringGrid1.Cells[1, j + 1] := ADOQuery1.FieldByName('metal').AsString;
          StringGrid1.Cells[2, j + 1] := ADOQuery1.FieldByName('num').AsString;
          StringGrid1.Cells[3, j + 1] := ADOQuery1.FieldByName('test').AsString;
          StringGrid1.Cells[4, j + 1] := ADOQuery1.FieldByName('price').AsString;
          StringGrid1.Cells[5, j + 1] := ADOQuery1.FieldByName('weight').AsString;
          StringGrid1.Cells[6, j + 1] := ADOQuery1.FieldByName('weight_net').AsString;
          StringGrid1.Cells[7, j + 1] := ADOQuery1.FieldByName('estimated_amount').AsString;
          piece[j] :=  ADOQuery1.FieldByName('weight_piece').AsString;
          // Проверка на статус изделия.
          if ADOQuery1.Fields[8].AsBoolean = True then begin
            StringGrid1.Cells[8, j + 1] := 'В залоге';
          end
          else begin
            StringGrid1.Cells[8, j + 1] := 'Выкуплено';
          end;
          StringGrid1.Cells[9, j + 1] := ADOQuery1.Fields[9].AsString;
          StringGrid1.RowCount := j + 2;
          inc(j);
          Next;
        end;
        ADOQuery1.Close;
      end;
      ADOQuery1.SQL.Clear;
      // Для Забивки в Форму
      ADOQuery1.SQL.Add('SELECT deliverer.name,num_of_day,loan_amount,estimated_amount,date_begin,date_end,con_percent,amount_ref,sum_percent,deliverer.id_tarif,deliverer.id,contract_info.idParentContract,');
      ADOQuery1.SQL.Add('deliverer.pasport_ser, deliverer.pasport_num, deliverer.pasport_vydan,');
      ADOQuery1.SQL.Add('deliverer.pasport_date ');
      ADOQuery1.SQL.Add('FROM contract_info INNER JOIN deliverer ON deliverer.id=contract_info.id_deliverer WHERE contract_info.id=:pId');
      ADOQuery1.Parameters.ParamByName('pId').Value := idContract;
      ADOQuery1.Open;
      delivererName := ADOQuery1.Fields[0].AsString;
      delivererPasport := ADOQuery1.Fields[12].AsString +' ' +
      ADOQuery1.Fields[13].AsString + ' ' +
      ADOQuery1.Fields[14].AsString + ' ' +
      ADOQuery1.Fields[15].AsString;
      // Склеиваем Айди Тариф из бд к Группе для ХМЛ
      bSaleGroup := ADOQuery1.Fields[9].AsInteger;
      sSaleGroup := 'Group' + IntToStr(bSaleGroup);
      //
      Label1.Caption := ADOQuery1.Fields[0].AsString;
      Label3.Caption := ADOQuery1.Fields[1].AsString;
      Label4.Caption := ADOQuery1.Fields[6].AsString;
      Label5.Caption := ADOQuery1.Fields[4].AsString;
      Label6.Caption := ADOQuery1.Fields[5].AsString;
      Label7.Caption := ADOQuery1.Fields[3].AsString;
      Label8.Caption := ADOQuery1.Fields[8].AsString;
      Label11.Caption := ADOQuery1.Fields[2].AsString;
      Label17.Caption := ADOQuery1.Fields[8].AsString;
      DFullSumToReturn := ADOQuery1.Fields[7].AsFloat;
      // WHAT ????
      bayout_form.iDelivererId := ADOQuery1.Fields[10].AsInteger;
      //
      DateNow := StrToDate(Edit2.Text);
      DateEnd := StrToDate(Label6.Caption);
      DateBegin := StrToDate(Label5.Caption);
      edit4text := StrToFloat(Label7.Caption);

      if bSaleGroup <> 5 then begin
        if (specialCondition) then begin
          //Showmessage(DateToStr(parentContract.dateOfTheContract));
          if (parentContract.dateOfTheContract < StrToDate('13.06.2013')) then begin
            dReducePercent := dReducePercent - 0.1;
            bCreditBodyPercentTmp := bCreditBodyPercentTmp + 5;
          end else begin
            IniFile := TIniFile.Create('C:\Pawn\sale.ini');
            dReducePercent := dReducePercent - IniFile.ReadFloat('Group6', 'IncreasePercent', 0);
            //bCreditBodyPercentTmp := bCreditBodyPercentTmp + IniFile.ReadInteger('Group6', 'EnaLargeCreditBody', 0);
            IniFile.Free;
          end;
        end;
        //Вес тут для подсчёта реальной суммы ссуды при спец условии
        i := 1;
        dSaleSum := 0;
        netWeight := 0;

        while i < 13 do begin
          if StringGrid1.Cells[7, i] <> '' then begin
            try // Костылик Трай ;) был баг с пустой грид[3i]
              dSaleOnGram := StrToFloat(StringGrid1.Cells[3, i]) / 585 * bCreditBodyPercentTmp;
              except on e:exception do begin
                dSaleOnGram := 0
              end;
            end;
            dSaleOnGram := StrToFloat(StringGrid1.Cells[6, i]) * dSaleOnGram;
            dSaleSum := dSaleSum + dSaleOnGram;
            netWeight := netWeight + (StrToFloat(StringGrid1.Cells[3, i])/585*StrToFloat(StringGrid1.Cells[6, i]) );
          end;
          Inc(i);
        end;

         netWeight := round(netWeight*100)/100;
         dSaleSum := round(dSaleSum*100)/100;
      end else begin
        IniFile := TIniFile.Create('c:\pawn\sale.ini');
        dFixPercent := IniFile.ReadFloat(sSaleGroup, 'FixPercent', 0);
        IniFile.Free;
      end;

      if (DateNow < DateEnd) then begin
        num_d := DaysBetween(DateBegin, DateNow);
        if num_d = 0 then num_d := 1
          else num_d := num_d + 1;
        Label3.Caption := IntToStr(num_d);
        if ((contractTypeGroup > 60) AND (contractTypeGroup < 101)) then begin
            percentPerDay := MyUtils.getPercentPerDay(contractTypeGroup,StrToFloat(Label7.Caption),num_d, deliverer.getId,idContract);
            //ShowMessage(FloatToStr(percentPerDay));
            percentTotal := percentPerDay * num_d;
        end
        else begin
            percentPerDay := MyUtils.getPercentPerDay(contractTypeGroup,StrToFloat(Label7.Caption),num_d,deliverer.getId,idContract);
            //ShowMessage(FloatToStr(percentPerDay));
            percentTotal := contractPercent * num_d;
        end;
       // Label4.Caption := FloatToStr(percentPerDay);
        if bSaleGroup = 5 then begin
          Label4.Caption := FloatToStr(dFixPercent);
        end;
        percent_new := StrToFloat(Label4.Caption) * num_d;
        prc := StrToFloat(Label7.Caption) * percent_new / 100;
        prc := round(prc * 100) / 100;
        if (specialAction = 1) then begin
          prc := round((prc - (prc / 10)) * 100) / 100;
          Label8.Caption := FloatToStr(prc);
        end
        else begin
          prc := round(prc * 100) / 100;
          Label8.Caption := FloatToStr(prc);
        end;
        res := StrToFloat(Label8.Caption);
        res := round(res * 100) / 100;
        Label17.Caption := FloatToStr(res);
        Label10.Text := FloatToStr(res);
        DFullSumToReturn := res + StrToFloat(Label7.Caption);
      end
      else begin
        if (DateNow > DateEnd) then begin
        //WHYYY
          percentPerDay := MyUtils.getPercentPerDay(contractTypeGroup,StrToFloat(Label7.Caption),daysInContract, deliverer.getId, StrToInt(id));

         // percentPerDay := MyUtils.getPercentPerDay(contractTypeGroup,StrToFloat(Label7.Caption),daysInContract, deliverer.getId, StrToInt(id));

        //showMessage(FloatToStr(percentPerDay));

          num_d := DaysBetween(DateEnd, DateNow);
          percentTotal :=StrToFloat(Label7.Caption)* percentPerDay /100* (daysInContract);
          //label4.Caption := FloatToStr(percentPerDay);

       //   ShowMEssage(intToStr(num_d));

      //    ShowMessage('1_' + label8.Caption);
          label8.Caption := FLoatToStr(round(percentTotal*100)/100);
  //        ShowMessage('2_' + label8.Caption);
          penya := ((StrToFloat(Label7.Caption) + ((StrToFloat(Label7.Caption) * conPercent / 100 * daysInContract)))* dDelayPercent) / 100 * num_d;
          penya := round(penya * 100) / 100;
          res := StrToFloat(Label7.Caption) + StrToFloat(Label8.Caption) + penya;
          res := round(res * 100) / 100;
          Label9.Caption := FloatToStr(penya);
          //Label10.Text := FloatToStr(res);
          label17.Caption := FloatTOStr(StrToFloat(label8.Caption)+StrToFloat(label9.Caption));
          label10.Text := Label17.Caption;
          DFullSumToReturn := res ;
        //  DFullSumToReturn := StrToFloat(Label17.Caption);
        end
        else begin
          if (DateNow = DateEnd) then begin
          percentPerDay := MyUtils.getPercentPerDay(contractTypeGroup,StrToFloat(Label7.Caption),daysInContract, deliverer.getId, StrToInt(id));
          percentTotal :=StrToFloat(Label7.Caption)* percentPerDay /100* (daysInContract);
          //label4.Caption := FloatToStr(percentPerDay);
          label8.Caption := FLoatToStr(round(percentTotal*100)/100);
          label17.Caption := Label8.Caption;
          Label10.Text := label17.Caption;
        end;
        //
          res := StrToFloat(Label7.Caption) + StrToFloat(Label8.Caption);
          Label17.Caption := FloatToStr(StrToFloat(Label8.Caption));
          Label10.Text := FloatToStr(StrToFloat(Label8.Caption));
          DFullSumToReturn := res ;
          // Label10.Text := trunc((Label8.Caption*100)/100);
        end;
      end;


      if Label10.Text <> '' then
      begin
      // Заполняем Впервые поле с СУДОЙ

     // ShowMessage('edit4text '+ FloatToStr(edit4Text));
    //  ShowMessage('EPIC FULL SUM TO RETRN' + FloatToStr(DFullSumToReturn));
      Edit4.Text := FloatToStr(DFullSumToReturn - StrToFloat(Label10.Text));
   //   ShowMessage('edit4.text '+ edit4.Text);
   //   edit4text := strToFloat(Edit4.Text);
    //  ShowMessage (edit4.Text);

   //   ShowMessage (floatToStr(edit4text));
     // ShowMessage(Edit4.Text);

      end;
      if(arrearsInForm) then begin

        repawnArrears := DANADO.ADOArrears.Create.getArrearsByIdContract(contract.id);
        //DANADO.ADOArrears.Create.showArrears(repawnArrears);
        Label20.Show;
        label19.Show;
        label21.Show;
        bevel10.Show;
        bevel15.Show;
        label19.Caption := FloatToStr(repawnArrears.arrearsOption1);
        label21.Caption := FloatToStr(repawnArrears.arrearsOption2);
        label17.Caption := FloatToStr(strToFloat(Label17.Caption)+repawnArrears.arrearsOption1+repawnArrears.arrearsOption2);
        DFullSumToReturn := DFullSumToReturn + repawnArrears.arrearsOption1+repawnArrears.arrearsOption2;
        label10.Text := FloatToStr(StrToFloat(label10.Text) + repawnArrears.arrearsOption1+repawnArrears.arrearsOption2);
      end;
      // ShowMessage('EPIC FULL SUM TO RETRN' + FloatToStr(DFullSumToReturn));

       ADOQuery1.SQL.Clear;
      ADOQuery1.close;
      ADOQuery1.SQL.Add('SELECT FreeAdditionalNumber FROM pasport');
      ADOQuery1.Open;
      DContractNumber := ADOQuery1.Fields[0].AsString;
      ADOQuery1.SQL.Clear;
      ADOQuery1.close;
     // Label16.Caption := 'P' + DContractNumber;

     // Костылик для своеобразной нумерации перезалогов( при переносе с Других ЛО)
      tmpConNumber := getRepawnCodeFilial(edit1.Text);
      tmpConNumber := tmpConNumber + Copy(DContractNumber,5);
      Label16.caption := 'P' + tmpConNumber;
     // Label16.Caption := 'P' + DContractNumber;
    end;
   // ShowMessage(fLOATtOsTR(estimatedPercent));
  // ShowMessage('in6');
    Label18.Caption := FloatToStr((Round((StrToFloat(Label11.Caption)*(estimatedPercent/100))*100)/100) + dSaleSum);
  // ShowMessage('out 6');

  end;

end;

procedure Trepawning.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  lototron := 0;
end;

procedure Trepawning.FormCreate(Sender: TObject);
begin
//  ShowMessage('MUST GO ON');
ADOQuery1.ConnectionString := DANADO.utils.getConnectionString;
ADODataSet1.ConnectionString := DANADO.utils.getConnectionString;
ADOQuery2.ConnectionString := DANADO.utils.getConnectionString;
ADOQuery3.ConnectionString := DANADO.utils.getConnectionString;


  StringGrid1.Cells[0, 0] := 'Изделие';
  StringGrid1.Cells[1, 0] := 'Метал';
  StringGrid1.Cells[2, 0] := 'Кол-во';
  StringGrid1.Cells[3, 0] := 'Проба';
  StringGrid1.Cells[4, 0] := 'Цена';
  StringGrid1.Cells[5, 0] := 'Вес';
  StringGrid1.Cells[6, 0] := 'Вес чистый';
  StringGrid1.Cells[7, 0] := 'Сумма оценки';
  StringGrid1.ColWidths[9] := 0;
  Edit2.Text := DateToStr(DOpenDay);
  //StringGrid1.DefaultRowHeight := ComboBox1.Height; {Спрятать combobox}
  ComboBox1.Visible := False;
  ComboBox1.Items.Add('В залоге');
  ComboBox1.Items.Add('Выкуплено');
  maxAmount := 0;
  printRepawn.Hide;
  arrears := FALSE;
  Label20.Hide;
  label19.Hide;
  label21.Hide;
  bevel10.Hide;
  bevel15.Hide;
  label23.hide;
  label22.hide;
 // PiecePayBTN.Hide;
end;

procedure Trepawning.applyRePawn;
var
  iContractNum, sIDDeliverer, iIDNew: integer;
  sProduct, sMetal, sNum, sTest, sPrice, sWeight,
    sWeightNet, sEstimatedAmount, sWeightPiece : string;
  sEmployeeDov, sEmployeeDovDate, sEmployeeName,
    sClAdd, sClPasS, sClPasN, sClPasV, sClPasD, sClInn, sCity: string;
  dSumOp: double;

  DPercent, DResult, dFixPercent,
  percentPerDay, percentTotal: double;
  DateTmp, DEndDay: TDateTime;
  BNumOfDay: Byte;
  Inifile: TIniFile;
  numOfDay, sumStart, sumEnd, percentFromXML: string;
  z, count, v: Integer;
  orderList: TOrder;
  iIdOp1 : Integer;
  iIdOp2 : Integer;
  increaseSumm: Double;
  setialNumb : String;
  orderPercent : Double;
  orderDelay : Double;
  i2 : Integer;
  q2 : TADOQUery;
  sql2 : String;
begin
  orderPercent := 0;
  orderDelay := 0;
  mySnapShot(edit1.Text);
  if (Label17.Caption = Label10.Text) and (Label7.Caption = Edit4.Text) then begin
    Edit4.Text := Label7.Caption;
  end;
  DateTmp := StrToDate(Edit2.Text);
  BNumOfDay := StrToInt(Edit3.Text);
  DEndDay := IncDay(DateTmp, BNumOfDay - 1);
  Label14.Caption := DateToStr(DEndDay);

  if bSaleGroup = 5 then begin
    IniFile := TIniFile.Create('c:\pawn\sale.ini');
    dFixPercent := IniFile.ReadFloat(sSaleGroup, 'FixPercent', 0);
    IniFile.Free;
    Label12.Caption := FloatToStr(dFixPercent);
    DPercent := dFixPercent * StrToInt(Edit3.Text);
  end
  else begin
    IniFile := TIniFile.Create('C:\Pawn\sale.ini');
    dReducePercent := IniFile.ReadFloat(sSaleGroup, 'ReducePercent', 0);
    bCreditBodyPercentTmp := IniFile.ReadInteger(sSaleGroup, 'EnaLargeCreditBody', 0);
    IniFile.Free;
    {
    xmldcmntXMLD.LoadFromFile('c:\pawn\conf\tarif.xml');
    xmldcmntXMLD.Active := true;
    count := xmldcmntXMLD.DocumentElement.ChildNodes['ROWDATA'].ChildNodes.Count;
    z := 0;

    while z < count do begin
      numOfDay := VarToStr(xmldcmntXMLD.DocumentElement.ChildNodes['ROWDATA'].ChildNodes[z].ChildNodes['numofday'].NodeValue);
      sumStart := VarToStr(xmldcmntXMLD.DocumentElement.ChildNodes['ROWDATA'].ChildNodes[z].ChildNodes['sum_begin'].NodeValue);
      sumEnd := VarToStr(xmldcmntXMLD.DocumentElement.ChildNodes['ROWDATA'].ChildNodes[z].ChildNodes['sum_end'].NodeValue);
      percentFromXML := VarToStr(xmldcmntXMLD.DocumentElement.ChildNodes['ROWDATA'].ChildNodes[z].ChildNodes['percent'].NodeValue);
      if StrToInt(Edit3.Text) = StrToInt(numOfDay) then
        if (StrToFloat(Edit4.Text) >= StrToInt(sumStart)) and (StrToFloat(Edit4.Text) <= StrToInt(sumEnd)) then begin
          percentPerDay := StrToFloat(percentFromXML);
          percentTotal := percentPerDay * StrToFloat(Edit3.Text);
        end;

      Inc(z);
    end;

    xmldcmntXMLD.Active := false;
    //При сохранении увеличивал и так увеличенный процент
    //if specialCondition then percentPerDay := newContract.setSpecialConditions(percentPerDay);
    }



    if (contractTypeGroup = 100) then begin
            percentPerDay := MyUtils.getPercentPerDay(contractTypeGroup,StrToFloat(Label7.Caption),BNumOfDay, deliverer.getId);
            percentTotal := percentPerDay * BNumOfDay;
    end
    else begin
           // percentPerDay := MyUtils.getPercentPerDay(contractTypeGroup,StrToFloat(Label7.Caption),daysInContract);
            percentPerDay := contract.con_percent;
            percentTotal := contract.con_percent * BNumOfDay;
    end;

    DPercent := StrToFloat(Label12.Caption) * StrToInt(Edit3.Text);
  end;
  DResult := StrToFloat(Edit4.Text) / 100 * DPercent + StrToFloat(Edit4.Text);
  DResult := round(DResult * 100) / 100;
  Label15.Caption := FloatToStr(DResult);
  DPercent := StrToFloat(Edit4.Text) * DPercent / 100;
  DPercent := round(DPercent * 100) / 100;
  Label13.Caption := FloatToStr(DPercent);
 // label12.Caption := FloatToStr(percentPerDay);
  // - dReducePercent);
 {
  if bSaleGroup = 0 then begin
    sale_form.sale := Tsale.Create(Self);
    sale_form.sale.ShowModal;
  end;
  }

  if (NOT arrears AND arrearsInForm) then begin
    orderPercent := StrToFloat(Label8.Caption)-lab21+StrToFloat(label19.Caption);
    orderDelay := StrToFloat(Label9.Caption)+StrToFloat(label21.Caption);
  end;
  if (arrears AND arrearsInForm) then begin
    orderPercent := StrToFloat(Label8.Caption)-lab21+StrToFloat(label19.Caption)-StrToFloat(label22.Caption);
    orderDelay := StrToFloat(Label9.Caption)+StrToFloat(label21.Caption)-StrToFloat(label23.Caption);
  end;
  if(arrears AND NOT arrearsInForm) then begin
    orderPercent := StrToFloat(Label8.Caption)-lab21-StrToFloat(label22.Caption);
    orderDelay := StrToFloat(Label9.Caption)-StrToFloat(label23.Caption);
  end;
   if(NOT arrears AND NOT arrearsInForm) then begin
    orderPercent := StrToFloat(Label8.Caption)-lab21;
    orderDelay := StrToFloat(Label9.Caption);
  end;

  orderPercent := Round(orderPercent*100)/100 ;
  orderDelay :=  Round(orderDelay*100)/100 ;

  ADOQuery1.SQL.Add('INSERT INTO operation (op,date_op,sum_op,id_contract_op,percent_op,delay_op,TimestampField)');
  ADOQuery1.SQL.Add('VALUES (:Qop,:Qdate_op,:Qsum_op,:Qid_contract_op,:Qpercent_op,:Qdelay_op,:TimestampField)');
  ADOQuery1.Parameters.ParamByName('Qop').Value := 2;
  ADOQuery1.Parameters.ParamByName('Qdate_op').Value := Edit2.Text;
  ADOQuery1.Parameters.ParamByName('Qsum_op').Value := StrToFloat(Label10.Text) - StrToFloat(Label17.Caption);
  ADOQuery1.Parameters.ParamByName('Qid_contract_op').Value := id;
  ADOQuery1.Parameters.ParamByName('Qpercent_op').Value := orderPercent;
  ADOQuery1.Parameters.ParamByName('Qdelay_op').Value := orderDelay;
  ADOQuery1.Parameters.ParamByName('TimestampField').Value := Now;
  ADOQuery1.ExecSQL;
  ADOQuery1.SQL.Clear;
  // Закрыть все лоялти
  DANADO.loyal.updateLoyaltyStatusFalse(LCONTRACT,StrToInt(id));
    with StringGrid1 do begin
    i2 := 1;
    q2 := TADOQuery.Create(nil);
    q2.ConnectionString := utils.getConnectionString;
    while StringGrid1.Cells[9,i2] <> ''  do begin
      if (StringGrid1.Cells[8,i2] = 'Выкуплено') then begin
      setProductStatusFalseByIdProduct(StrToInt(StringGrid1.Cells[9,i2]));
      end;
      inc(i2);
    end;
    q2.Destroy;
  end;
  sleep(3000);
  /////kyky
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('SELECT MAX(id) FROM operation');
  ADOQuery1.Open;
  iIdOp2 := ADOQuery1.Fields[0].AsInteger;
  ADOQuery1.SQL.Clear;
  ADOQuery1.Close;

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('SELECT id_deliverer FROM contract_info WHERE contract_number=:pIDContract');
  ADOQuery1.Parameters.ParamByName('pIDContract').Value := Edit1.Text;
  ADOQuery1.Open;
  sIDDeliverer := ADOQuery1.Fields[0].Value;
  ADOQuery1.SQL.Clear;
  ADOQuery1.close;

  ADOQuery1.SQL.Add('INSERT INTO contract_info (idParentContract,id_deliverer,num_of_day,loan_amount,estimated_amount,contract_number,date_begin,date_end,con_percent,amount_ref,con_status,sum_percent,id_Employee,SpecialCondition,EstimatedPercent,');
  ADOQuery1.SQL.Add('contractTypeGroup,arrears)');
  ADOQuery1.SQL.Add('VALUES (:pidParentContract,:id_delivere,:num_of_da,:Qloan_amount,:Qestimated_amount,:Qcontract_number,:Qdate_begin,:Qdate_end,:Qpercent,:Qamount_ref,1,:Qsum_percent,:Qid_Employee,:pSpecialCondition,:pEstimatedPercent,');
  ADOQuery1.SQL.Add(':pContractTypeGroup,:pArrears)');
  if sIdParentContract = '' then ADOQuery1.Parameters.ParamByName('pidParentContract').Value := id
  else ADOQuery1.Parameters.ParamByName('pidParentContract').Value := sIdParentContract;
  ADOQuery1.Parameters.ParamByName('id_delivere').Value := sIDDeliverer;
  ADOQuery1.Parameters.ParamByName('num_of_da').Value := Edit3.Text;
  ADOQuery1.Parameters.ParamByName('Qloan_amount').Value := Label11.Caption;
  ADOQuery1.Parameters.ParamByName('Qestimated_amount').Value := Edit4.Text;
  ADOQuery1.Parameters.ParamByName('Qcontract_number').Value := Label16.Caption;
  ADOQuery1.Parameters.ParamByName('Qdate_begin').Value := Edit2.Text;
  ADOQuery1.Parameters.ParamByName('Qdate_end').Value := Label14.Caption;
  ADOQuery1.Parameters.ParamByName('Qpercent').Value := Label12.Caption;
  ADOQuery1.Parameters.ParamByName('Qamount_ref').Value := Label15.Caption;
  ADOQuery1.Parameters.ParamByName('Qsum_percent').Value := Label13.Caption;
  ADOQuery1.Parameters.ParamByName('Qid_Employee').Value := bIDEmployee;
  ADOQuery1.Parameters.ParamByName('pSpecialCondition').Value := specialCondition;
  ADOQuery1.Parameters.ParamByName('pArrears').Value := arrears;
  if ((contractTypeGroup > 69) AND (contractTypeGroup < 101) ) then begin
  ADOQuery1.Parameters.ParamByName('pContractTypeGroup').Value := 100;
  ADOQuery1.Parameters.ParamByName('pEstimatedPercent').Value := 100;
  end else begin
    ADOQuery1.Parameters.ParamByName('pContractTypeGroup').Value := contractTypeGroup;
    ADOQuery1.Parameters.ParamByName('pEstimatedPercent').Value := estimatedPercent;
  end;
  ADOQuery1.ExecSQL;
  ADOQuery1.SQL.Clear;
  ADOQuery1.close;

  ADOQuery1.SQL.Add('SELECT id FROM contract_info WHERE contract_number=:con_numbe AND date_begin=:pdate_begin AND estimated_amount=:pestimated_amount');
  ADOQuery1.Parameters.ParamByName('con_numbe').Value := Label16.Caption;
  ADOQuery1.Parameters.ParamByName('pdate_begin').Value := StrToDate(Edit2.Text);
  ADOQuery1.Parameters.ParamByName('pestimated_amount').Value := Edit4.Text;
  ADOQuery1.Open;
  iIDNew := ADOQuery1.Fields[0].AsInteger;
  ADOQuery1.SQL.Clear;
  ADOQuery1.close;

  if(arrears) then begin
    repawnArrears.idContract := (iIDNew);
    DANADO.ADOArrears.Create.setArrears(repawnArrears);
  end;


  newProduct := DANADO.product.changeIdContract(newProduct,iIDNew);

  DANADO.product.addProductByIdContract(newProduct,777);
  v := 1;
 {
  ADOQuery1.SQL.Add('SELECT product,metal,num,test,price,weight,weight_net,estimated_amount,weight_piece,SerialNumber ');
  ADOQuery1.SQL.Add(' FROM product_info WHERE id_contract=:pIDCon AND product_status=-1');
  ADOQuery1.Parameters.ParamByName('pIDCon').Value := id;
  with ADOQuery1 do begin
    ADOQuery1.Open;
    while not eof do begin
      sProduct := ADOQuery1.Fields[0].Value;
      sMetal := ADOQuery1.Fields[1].Value;
      sNum := ADOQuery1.Fields[2].Value;
      sTest := ADOQuery1.Fields[3].Value;
      sPrice := ADOQuery1.Fields[4].Value;
      sWeight := ADOQuery1.Fields[5].Value;
      sWeightNet := ADOQuery1.Fields[6].Value;
      sEstimatedAmount := ADOQuery1.Fields[7].Value;
      setialNumb := ADOQuery1.FieldByName('SerialNumber').AsString;
      if (ADOQuery1.Fields[8].Value = TRUE) then
          begin
            sWeightPiece := ADOQuery1.Fields[8].Value;
          end
        else
          begin
            sWeightPiece := '0'
          end;
      reRv.SetParam('ProductName'+IntToStr(v), ADOQuery1.Fields[0].Value);
      reRv.SetParam('ProductProba'+IntToStr(v), ADOQuery1.Fields[3].Value);
      reRv.SetParam('ProductVes'+IntToStr(v), ADOQuery1.Fields[5].Value);
      reRv.SetParam('PrVesCl'+IntToStr(v), ADOQuery1.Fields[6].Value);

      q1.SQL.Add('INSERT INTO product_info (product,metal,num,test,price,weight,weight_net,estimated_amount,id_contract,product_status, weight_piece, SerialNumber)');
      q1.SQL.Add(' VALUES (:pProduct,:pMetal,:pNum,:pTest,:pPrice,:pWeight,:pWeightNet,:pEstimatedAmount,:pID_Contract,1,:pWeightPiece, :pSerialNumber)');
      q1.Parameters.ParamByName('pProduct').Value := sProduct;
      q1.Parameters.ParamByName('pMetal').Value := sMetal;
      q1.Parameters.ParamByName('pNum').Value := sNum;
      q1.Parameters.ParamByName('pTest').Value := sTest;
      q1.Parameters.ParamByName('pPrice').Value := sPrice;
      q1.Parameters.ParamByName('pWeight').Value := sWeight;
      q1.Parameters.ParamByName('pWeightNet').Value := sWeightNet;
      q1.Parameters.ParamByName('pEstimatedAmount').Value := sEstimatedAmount;
      q1.Parameters.ParamByName('pID_Contract').Value := iIDNew;
      q1.Parameters.ParamByName('pWeightPiece').Value := sWeightPiece;
      q1.Parameters.ParamByName('pSerialNumber').Value := setialNumb;
      q1.ExecSQL;
      q1.close;
      q1.SQL.Clear;
      Inc(v);
      Next;

    end;
    ADOQuery1.close;
  end;
  ADOQuery1.SQL.Clear;
  }
  // LOTO
 { if (lototron = 1) then  begin
                Q1 := TADOQuery.Create(nil);
                Q1.ConnectionString := MyUtils.getConnectionString;
                Q1.SQL.Add('INSERT INTO lototron (idContract, idDeliverer, ticket, sell, timeStampField ) VALUES (:pide, :pidDeliverer, :pTicket, :pSell, :ptimeStampField)');

                Q1.Parameters.ParamByName('pide').Value := iIDNew;
                Q1.Parameters.ParamByName('pidDeliverer').Value := iClientID;
                if  (edit6.Text = '') then  edit6.Text := '0';
                if  (edit5.Text = '') then  edit5.Text := '0';
                Q1.Parameters.ParamByName('pTicket').Value := StrToInt(Edit5.Text);
                Q1.Parameters.ParamByName('pSell').Value := StrToInt(Edit6.Text);
                Q1.Parameters.ParamByName('ptimeStampField').Value := Now();
                Q1.ExecSQL;
                Q1.Destroy;
              end;
     }

  ADOQuery1.SQL.Add('UPDATE product_info SET product_status=0 WHERE id_contract=:pIDCont');
  ADOQuery1.Parameters.ParamByName('pIDCont').Value := id;
  ADOQuery1.ExecSQL;
  ADOQuery1.SQL.Clear;
  ADOQuery1.close;

  ADOQuery1.SQL.Add('INSERT INTO operation (op,date_op,sum_op,id_contract_op)');
  ADOQuery1.SQL.Add('VALUES (:Qop,:Qdate_op,:Qsum_op,:Qid_contract_op)');
  ADOQuery1.Parameters.ParamByName('Qop').Value := 1;
  ADOQuery1.Parameters.ParamByName('Qdate_op').Value := Edit2.Text;
  dSumOp := StrToFloat(Edit4.Text) - StrToFloat(Label7.Caption);
  if dSumOp < 0 then dSumOp := 0;
  ADOQuery1.Parameters.ParamByName('Qsum_op').Value := dSumOp;
  ADOQuery1.Parameters.ParamByName('Qid_contract_op').Value := iIDNew;
  //Нет надобности повторять время закрытия договора
  // ADOQuery1.Parameters.ParamByName('TimeStampField').Value := now();
  ADOQuery1.ExecSQL;

  /////kyky
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('SELECT Max(id) FROM operation');
  ADOQuery1.Open;
  iIdOp1 := ADOQuery1.Fields[0].AsInteger;
  ADOQuery1.SQL.Clear;
  ADOQuery1.Close;

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('UPDATE contract_info SET con_status=0, DateClose=:QDateClose WHERE id=:Qid');
  ADOQuery1.Parameters.ParamByName('QDateClose').Value := DOpenDay;
  ADOQuery1.Parameters.ParamByName('Qid').Value := id;
  ADOQuery1.ExecSQL;
  ADOQuery1.SQL.Clear;
  ADOQuery1.close;
  // Добавим нолики перед Договором в зависимости от номера ЛО
  iContractNum := StrToInt(DContractNumber) + 1;
  DContractNumber := '';
  if (main.newContract2 = 1) then begin
    DContractNumber := MyUtils.getNulliki(StrToInt(filialNumberMain));
  end;
  DContractNumber := DContractNumber + IntToStr(iContractNum);
  while Length(DContractNumber) < 5 do
    DContractNumber := '0' + DContractNumber;
  ADOQuery1.SQL.Add('UPDATE pasport SET FreeAdditionalNumber=:pFreeContractNumber');
  ADOQuery1.Parameters.ParamByName('pFreeContractNumber').Value := DContractNumber;
  ADOQuery1.ExecSQL;
  ADOQuery1.SQL.Clear;
  ADOQuery1.close;

  ADOQuery1.SQL.Add('SELECT employee.name,employee.warrant_num,employee.warrant_date,City');
  ADOQuery1.SQL.Add(' FROM pasport INNER JOIN employee ON pasport.id_CurrentEmployee=employee.id');
  ADOQuery1.Open;
  sEmployeeName := ADOQuery1.Fields[0].AsString;
  sEmployeeDov := ADOQuery1.Fields[1].AsString;
  sEmployeeDovDate := ADOQuery1.Fields[2].AsString;
  sCity := ADOQuery1.Fields[3].AsString;
  ADOQuery1.SQL.Clear;
  ADOQuery1.close;
  if bPPOStatus then begin
    ADOQuery1.SQL.Add('SELECT name_filial,employee.name FROM pasport INNER JOIN employee ON pasport.id_CurrentEmployee=employee.id');
    ADOQuery1.Open;
    if fr_form.Form3.ConfirmCheck then
      fr_form.Form3.CheckType('BayOut', Copy(ADOQuery1.Fields[1].AsString, 1, 8), 'N Дог. ' + Edit1.Text, ADOQuery1.Fields[0].AsString, StrToFloat(Label10.Text));
    if StrToFloat(Edit4.Text) > StrToFloat(Label7.Caption) then
      if fr_form.Form3.ConfirmCheck then
        fr_form.Form3.CheckType('Credit', Copy(ADOQuery1.Fields[1].AsString, 1, 8), 'N Дог. ' + Edit1.Text, ADOQuery1.Fields[0].AsString, StrToFloat(Edit4.Text) - StrToFloat(Label7.Caption));
    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    end
    else begin
      orderList := TOrder.Create;
      orderList.bill := '3771, 373, 374';
      orderList.summ := Label10.Text;
      orderList.from := Label1.Caption;
      orderList.ground := 'возврат фин. кредит №' +  Edit1.Text;
      orderList.summInWord := SumNumToFull(StrToFloat(Label10.Text));
      orderList.summCent := FloatToStr(Frac(StrToFloat(Label10.Text))*100);
      orderList.date := DateToStr(DOpenDay);
      orderList.additional := 'фин. кредит - '+FloatToStr(StrToFloat(Label10.Text) - StrToFloat(Label17.Caption))+' % - '+FloatToStr(orderPercent)+' пеня - '+FloatToStr(orderDelay);
      orderList.orderType := 2;
      orderList.saveDocument(iIdOp2);
      if orderList.ConfirmCheck then begin
        orderList.printReceiptDocument;
        orderList.Destroy;
      end;
        //  я добавил, для печати  второго ордера
        increaseSumm := StrToFloat(Edit4.Text) - StrToFloat(Label7.Caption);
        if (increaseSumm > 0) then begin
          orderList := TOrder.Create;
          orderList.bill := '3771';
          orderList.summ := FloatToStr(increaseSumm);
          orderList.from := delivererName;
          orderList.ground := 'увеличение суммы кредита по договору № ' +  Label16.Caption;
          orderList.summInWord := SumNumToFull(increaseSumm);
          orderList.summCent := FloatToStr(Round(Frac(increaseSumm)*100)/100*100);
          orderList.chief := chief;
          orderList.date := DateToStr(DOpenDay);
          orderList.document := delivererPasport;
          orderList.additional := 'фин. кредит - '+FloatToStr(StrToFloat(Label10.Text) - StrToFloat(Label17.Caption))+' % - '+Label8.Caption+' пеня - '+Label9.Caption;
          orderList.orderType := 1;
          orderList.saveDocument(iIdOp1);
          if orderList.ConfirmCheck then begin
            orderList.printExpenseReport;
          end;
        orderList.Destroy;
     end;
  end;

  if sIdParentContract = '' then reRv.SetParam('numberContract', Edit1.Text)
  else begin
    ADOQuery1.SQL.Add('SELECT contract_number FROM contract_info WHERE idParentContract=:pidCN ORDER by id DESC');
    ADOQuery1.Parameters.ParamByName('pidCN').Value := sIdParentContract;
    ADOQuery1.Open;
    With ADOQuery1 do begin
       next;
    reRv.SetParam('numberContract', ADOQuery1.Fields[0].AsString);
    end;
    ADOQuery1.Close;
    ADOQuery1.SQL.Clear
  end;
  reRv.SetParam('date', Edit2.Text);
  reRv.SetParam('empl', sEmployeeName);
  reRv.SetParam('numberDov', sEmployeeDov);
  reRv.SetParam('dayDov', sEmployeeDovDate);
  reRv.SetParam('deliv', Label1.Caption);
  reRv.SetParam('numDay', Edit3.Text);
  reRv.SetParam('vozvratDay', Label14.Caption);
  {reRv.SetParam('ProductName1', StringGrid1.Cells[0, 1]);
  reRv.SetParam('ProductName2', StringGrid1.Cells[0, 2]);
  reRv.SetParam('ProductName3', StringGrid1.Cells[0, 3]);
  reRv.SetParam('ProductName4', StringGrid1.Cells[0, 4]);
  reRv.SetParam('ProductName5', StringGrid1.Cells[0, 5]);
  reRv.SetParam('ProductName6', StringGrid1.Cells[0, 6]);
  reRv.SetParam('ProductProba1', StringGrid1.Cells[3, 1]);
  reRv.SetParam('ProductProba2', StringGrid1.Cells[3, 2]);
  reRv.SetParam('ProductProba3', StringGrid1.Cells[3, 3]);
  reRv.SetParam('ProductProba4', StringGrid1.Cells[3, 4]);
  reRv.SetParam('ProductProba5', StringGrid1.Cells[3, 5]);
  reRv.SetParam('ProductProba6', StringGrid1.Cells[3, 6]);
  reRv.SetParam('ProductVes1', StringGrid1.Cells[5, 1]);
  reRv.SetParam('ProductVes2', StringGrid1.Cells[5, 2]);
  reRv.SetParam('ProductVes3', StringGrid1.Cells[5, 3]);
  reRv.SetParam('ProductVes4', StringGrid1.Cells[5, 4]);
  reRv.SetParam('ProductVes5', StringGrid1.Cells[5, 5]);
  reRv.SetParam('ProductVes6', StringGrid1.Cells[5, 6]);
  reRv.SetParam('PrVesCl1', StringGrid1.Cells[6, 1]);
  reRv.SetParam('PrVesCl2', StringGrid1.Cells[6, 2]);
  reRv.SetParam('PrVesCl3', StringGrid1.Cells[6, 3]);
  reRv.SetParam('PrVesCl4', StringGrid1.Cells[6, 4]);
  reRv.SetParam('PrVesCl5', StringGrid1.Cells[6, 5]);
  reRv.SetParam('PrVesCl6', StringGrid1.Cells[6, 6]);
  }
  reRv.SetParam('sumBack', Label15.Caption);
  reRv.SetParam('sumDog', Edit4.Text);
  reRv.SetParam('sumPerc', Label13.Caption);
  reRv.SetParam('percent', Label12.Caption);
  if (main.newContract2 = 1) then begin
                //MyUtils.printRepawnContract(iIDNew);
                DanUtils.print.repawn(iIDNew, Edit1.Text);
              end else begin
                reRv.Execute;
              end;
  form1.SearchContract;
  Close;
end;

procedure Trepawning.Edit3Change(Sender: TObject);
var
  LoyalGroup : Integer;
  DPercent, DResult, dFixPercent,
    percentPerDay, percentTotal: double;
  DateTmp, DEndDay: TDateTime;
  BNumOfDay: Byte;
  Inifile: TIniFile;
  numOfDay, sumStart, sumEnd, percentFromXML: string;
  z, count: Integer;
begin
  if Edit3.Text <> '' then begin
    if (StrToInt(Edit3.Text) > 30) or (StrToInt(Edit3.Text) = 0) then Edit3.Text := '30';
    if((arrears) AND  (StrToInt(Edit3.Text) > 10) or (StrToInt(Edit3.Text) = 0)) then Edit3.Text := '10';

  end;
  if (Edit3.Text <> '') and (Label10.Text > '') then
  begin
    Button2.Enabled := True;
    DateTmp := StrToDate(Edit2.Text);
    BNumOfDay := StrToInt(Edit3.Text);
    DEndDay := IncDay(DateTmp, BNumOfDay - 1);
    Label14.Caption := DateToStr(DEndDay);
    if bSaleGroup = 5 then begin
      IniFile := TIniFile.Create('c:\pawn\sale.ini');
      dFixPercent := IniFile.ReadFloat(sSaleGroup, 'FixPercent', 0);
      IniFile.Free;
      Label12.Caption := FloatToStr(dFixPercent);
      DPercent := dFixPercent * StrToInt(Edit3.Text);
    end
    else begin
      IniFile := TIniFile.Create('C:\Pawn\sale.ini');
      dReducePercent := IniFile.ReadFloat(sSaleGroup, 'ReducePercent', 0);
      bCreditBodyPercentTmp := IniFile.ReadInteger(sSaleGroup, 'EnaLargeCreditBody', 0);
      IniFile.Free;
      {xmldcmntXMLD.LoadFromFile('c:\pawn\conf\tarif.xml');
      xmldcmntXMLD.Active := true;
      count := xmldcmntXMLD.DocumentElement.ChildNodes['ROWDATA'].ChildNodes.Count;
      z := 0;

      while z < count do begin
        numOfDay := VarToStr(xmldcmntXMLD.DocumentElement.ChildNodes['ROWDATA'].ChildNodes[z].ChildNodes['numofday'].NodeValue);
        sumStart := VarToStr(xmldcmntXMLD.DocumentElement.ChildNodes['ROWDATA'].ChildNodes[z].ChildNodes['sum_begin'].NodeValue);
        sumEnd := VarToStr(xmldcmntXMLD.DocumentElement.ChildNodes['ROWDATA'].ChildNodes[z].ChildNodes['sum_end'].NodeValue);
        percentFromXML := VarToStr(xmldcmntXMLD.DocumentElement.ChildNodes['ROWDATA'].ChildNodes[z].ChildNodes['percent'].NodeValue);
        if StrToInt(Edit3.Text) = StrToInt(numOfDay) then
          if (StrToFloat(Edit4.Text) >= StrToInt(sumStart)) and (StrToFloat(Edit4.Text) <= StrToInt(sumEnd)) then begin
            percentPerDay := StrToFloat(percentFromXML);
            percentTotal := percentPerDay * StrToFloat(Edit3.Text);
          end;

        Inc(z);
      end;

      xmldcmntXMLD.Active := false;
      }
      //if specialCondition then percentPerDay := newContract.setSpecialConditions(percentPerDay);

     { if (contractTypeGroup = 100) then begin

            percentPerDay := MyUtils.getPercentPerDay(contractTypeGroup,StrToFloat(Label7.Caption),StrToInt(Edit3.Text));
      //      ShowMessage(FloatToStr(percentPerDay));
            percentTotal := percentPerDay * StrToInt(Edit3.Text);
        end
        else
        }
        // Важно.
         LoyalGroup := danado.utils.getLoyalGroup;
         // Меняем Старые договора на Новые типы

       //  contractTypeGroup := MyUtils.getDiscountTarif(bSaleGroup,contractTypeGroup,LoyalGroup);
         percentPerDay := MyUtils.getPercentPerDay(contractTypeGroup, StrToFloat(Edit4.Text), StrToInt(Edit3.Text), deliverer.getId);
          //ShowMessage(IntToStr(contractTypeGroup));
      //percentTotal := percentPerDay * StrToFloat(Edit3.Text);
      //   ShowMessage(FloatToStr(percentPerDay));
      Label12.Caption := FloatToStr(percentPerDay- dReducePercent);
      DPercent := StrToFloat(Label12.Caption) * StrToInt(Edit3.Text);
    end;
    DResult := StrToFloat(Edit4.Text) / 100 * DPercent + StrToFloat(Edit4.Text);
    DResult := round(DResult * 100) / 100;
    Label15.Caption := FloatToStr(DResult);
    DPercent := StrToFloat(Edit4.Text) * DPercent / 100;
    DPercent := round(DPercent * 100) / 100;
    Label13.Caption := FloatToStr(DPercent);
  end;
  Button2.Enabled := True;
  Edit3.Color := clWhite;
  Edit4.Color := clWhite;
  Label10.Color := clWhite;
end;

procedure Trepawning.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  if (Key in ['.']) then Key := ',';
  if not (Key in ['0'..'9', ',', #8]) then Key := #0;
end;

procedure Trepawning.Button3Click(Sender: TObject);
begin
  mySnapShot(Edit1.Text);
  i := 0;
  Close;
end;

procedure Trepawning.Buttonkey1Click(Sender: TObject);
begin
  MyUtils.printRepawnContract(1000);
end;

function Trepawning.codetarif(code_filial: integer): Integer;
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

procedure Trepawning.Label10KeyPress(Sender: TObject; var Key: Char);
begin
  if (Key in ['.']) then Key := ',';
  if not (Key in ['0'..'9', ',', #8]) then Key := #0;
  edit4.Enabled := False;
end;

procedure Trepawning.mySnapShot(myFileName: String);
var
  DC: HDC;
  bmp: TBitmap;
  h: HWND;
  r: TRect;
  l,w : Integer;
begin
  h:=GetForegroundWindow;
  GetWindowRect(h,r);
  bmp:=TBitmap.Create;
  bmp.PixelFormat := pf1bit;
  bmp.Width:=r.Right-r.Left;
  bmp.Height:=r.Bottom - r.Top;
  DC:=GetDC(0);
  bitblt(bmp.Canvas.Handle, 0-r.Left, 0-r.Top, r.Right, r.Bottom, DC, 0, 0, SRCCOPY);
  CreateDirectory('c:/pawn/nscr/',0);
  bmp.SaveToFile('c:/pawn/nscr/'+myFileName+IntToStr(Random(100))); //Здесь можешь изменить путь, куда нужно сохранить файл. Так же в этой строчке изменяется название файла.
  ReleaseDC(0, DC);
  bmp.Free;
end;

procedure Trepawning.piecePayApply(sm1 : String);
var
  tmppercent : Double;
  DC: HDC;
begin


  //ShowMessage(sm1);
  contractPieceLast := StrToFloat(Label17.Caption) - StrToFloat(sm1);
 // ShowMessage(FloatToStr(ContractPieceLast));
  Label10.Text := sm1;
  label10.Enabled := False;
  edit4.Enabled := False;
  PiecePayBTN.Enabled := false;
  edit4.Text := label7.Caption;
  EDIT3.text := '';
  Label17.Caption := sm1;

  if (arrearsInForm) then begin
    repawnArrears.arrearsOption1 := (StrToFloat(label8.Caption)+StrToFloat(label19.Caption));
    repawnArrears.arrearsOption2 := (StrToFloat(label9.Caption)+StrToFloat(label21.Caption));
  end else begin
    repawnArrears.arrearsOption1 := (StrToFloat(label8.Caption));
    repawnArrears.arrearsOption2 := (StrToFloat(label9.Caption));
  end;
  repawnArrears := danado.ADOArrears.Create.calculateArrears(StrToFloat(sm1),repawnArrears);
  repawnArrears.dateAdd := StrToDate(Edit2.Text);
  showArrearsInForm(repawnArrears);
  arrears := TRUE;

end;

procedure Trepawning.PiecePayBTNClick(Sender: TObject);
begin
  piecePay.Form17.Label3.Caption := FloatToStr(round((StrToFloat(Label10.Text)*0.25)*100)/100);
  piecePay.Form17.ShowModal;
end;

procedure Trepawning.printRepawnClick(Sender: TObject);
var
   pp : TDateTime;
   x : Variant;
   report : TfrxReport;
   dataSet : TADODataSet;
begin
  report := Form1.frxReport1;
  report.LoadFromFile('c:\pawn\report\newRep.fr3');
  report.Variables['777'] := 10;
  dataSet := newRepDS;
 // dataSet.Active := true;
  //dataSet.CommandText := 'SELECT product,num,metal,test,weight,weight_piece,weight_net,price,estimated_amount FROM product_info WHERE id_contract =:idContract';
 // dataSet.Parameters.ParamByName('idContract').Value := 5;
 // dataSet.Parameters.ParamByName('EventDateEnd').Value := dateEnd;
  //dataSet.Active := true;
  //report.Variables['abc'] :=  Edit1.Text ;
  report.ShowReport(true);
 // dataSet.Active := false;
end;

procedure Trepawning.setProductStatusFalseByIdProduct(id1: Integer);
var
  q1 : TADOQuery;
  sql1 : String;
begin
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := utils.getConnectionString;
  sql1 := 'UPDATE product_info SET product_status=0 WHERE id=:pID';
  q1.SQL.Add(sql1);
  q1.Parameters.ParamByName('pID').Value := id1;
  q1.ExecSQL;
  q1.Close;
  q1.SQL.Clear;
end;

procedure Trepawning.showArrearsInForm(arr1: TENArrears);
begin
  bevel15.Show;
  bevel10.Show;
  label21.hide;
  label19.hide;
  label20.Show;
  label23.Show;
  label22.Show;

  Label22.Caption := FloatToStr(arr1.ArrearsOption1);
  label23.Caption := FloatToStr(arr1.ArrearsOption2);
end;

procedure Trepawning.ComboBox1Change(Sender: TObject);
var
  fByInProduct: Double;
begin
  minSumm := StrToFloat(label10.Text);
  if StringGrid1.Cells[StringGrid1.Col, StringGrid1.Row] = 'В залоге' then begin

    if Combobox1.ItemIndex = 1 then begin

      newProduct := DANADO.product.changeProductStatusById(newProduct,StrToInt(StringGrid1.Cells[9,StringGrid1.Row]),false);
      if estimatedPercent <> 0 then begin
        fByInProduct := StrToFloat(StringGrid1.Cells[7, StringGrid1.Row]) / 100 * estimatedPercent;
      end else begin
        fByInProduct := StrToFloat(StringGrid1.Cells[7, StringGrid1.Row]) / 100 * bCreditBodyPercent;
      end;
      fByInProduct := round(fByInProduct * 100) / 100;
      Label10.Text := FloatToStr(Round((StrToFloat(Label10.Text) + fByInProduct) * 100) / 100);
     //ShowMessage(edit4.Text);
      Edit4.Text := FloatToStr(Round((DFullSumToReturn - StrToFloat(Label10.Text)) * 100) / 100);
     // ShowMessage('in 1');
      Label11.Caption := FloatToStr(StrToFloat(Label11.Caption) - StrToFloat(StringGrid1.Cells[7, StringGrid1.Row]));
     // ShowMessage('out 1');
    end;
  end;

  if StringGrid1.Cells[StringGrid1.Col, StringGrid1.Row] = 'Выкуплено' then
    if ComboBox1.ItemIndex = 0 then begin
      newProduct := DANADO.product.changeProductStatusById(newProduct,StrToInt(StringGrid1.Cells[9,StringGrid1.Row]),true);
      ADOQuery1.SQL.Add('UPDATE product_info SET product_status=1 WHERE id=:pID');
      ADOQuery1.Parameters.ParamByName('pID').Value := StringGrid1.Cells[9, StringGrid1.Row];
      ADOQuery1.ExecSQL;
      ADOQuery1.Close;
      ADOQuery1.SQL.Clear;
      if estimatedPercent <> 0 then begin
        fByInProduct := StrToFloat(StringGrid1.Cells[7, StringGrid1.Row]) / 100 * estimatedPercent;
      end else begin
        fByInProduct := StrToFloat(StringGrid1.Cells[7, StringGrid1.Row]) / 100 * bCreditBodyPercent;
      end;
      fByInProduct := round(fByInProduct * 100) / 100;
      Label10.Text := FloatToStr(Round((StrToFloat(Label10.Text) - fByInProduct) * 100) / 100);
     // ShowMessage('in 2');
      Label11.Caption := FloatToStr(StrToFloat(Label11.Caption) + StrToFloat(StringGrid1.Cells[7, StringGrid1.Row]));
      //ShowMessage('out 2');
      Edit4.Text := FloatToStr(Round((DFullSumToReturn - StrToFloat(Label10.Text)) * 100) / 100);
    end;
  StringGrid1.Cells[StringGrid1.Col, StringGrid1.Row] := ComboBox1.Items[ComboBox1.ItemIndex];
  ComboBox1.Visible := False;
  minSumm := StrToFloat(label10.Text);
  Label10.SetFocus;
end;

procedure Trepawning.ComboBox1Click(Sender: TObject);
begin
//  ComboBox1.ItemIndex := 0;
end;

procedure Trepawning.ComboBox1Exit(Sender: TObject);
begin
  StringGrid1.Cells[StringGrid1.Col, StringGrid1.Row] := ComboBox1.Items[ComboBox1.ItemIndex];
  ComboBox1.Visible := False;
  StringGrid1.SetFocus;
end;

procedure Trepawning.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
  R: TRect;
begin
  if (StringGrid1.RowCount > 2) then begin
    if ((ACol = 8) and (ARow <> 0) and (StringGrid1.Cells[7, StringGrid1.Row] <> '')) then
    begin
    {Ширина и положение ComboBox должно соответствовать ячейке StringGrid}
      R := StringGrid1.CellRect(ACol, ARow); R.Left := R.Left + StringGrid1.Left;
      R.Right := R.Right + StringGrid1.Left; R.Top := R.Top + StringGrid1.Top;
      R.Bottom := R.Bottom + StringGrid1.Top; ComboBox1.Left := R.Left + 1;
      ComboBox1.Top := R.Top + 1; ComboBox1.Width := (R.Right + 1) - R.Left;
      ComboBox1.Height := 30; {Покажем combobox}
      ComboBox1.Visible := True;
      ComboBox1.SetFocus;
      if(Combobox1.ItemIndex = -1) then Combobox1.ItemIndex := 0;
      if(StringGrid1.Cells[8,ARow] = 'В залоге') then Combobox1.ItemIndex := 0;
      if(StringGrid1.Cells[8,ARow] = 'Выкуплено') then Combobox1.ItemIndex := 1;
    end;
    CanSelect := True;
  end;
end;

procedure Trepawning.Label10Exit(Sender: TObject);
begin
  Edit4.Color := clWhite;
  if Label10.Text <> '' then begin
    if StrToFloat(Label10.Text) < StrToFloat(Label17.Caption) then begin
      Label10.Text := Label17.Caption;
      Label10.Color := clRed;
    end else begin
      Label10.Color := clWhite;
    end;
     //  если от клиента больше чем сумма ссуды + к возврату
    if StrToFloat(Label10.Text) > ((StrToFloat(Label7.Caption) + StrToFloat(Label17.Caption))-1.01) then begin
      Label10.Text := Label17.Caption;
      Label10.Color := clRed;
      Edit4.Text := Label7.Caption;
      Edit4.Color := clRed;
    end;

    if(StrToFloat(Label10.Text) < minSumm) then Label10.Text := FloatToStr(minSumm);

     Edit4.Text := FloatToStr(Round((DFullSumToReturn - (Trunc(StrToFloat(Label10.Text)*100)/100)*100/100)*100)/100);
    sEdit1.Text := FloatToStr( Round( ( StrToFloat(Edit4.Text) / dollarPriceTmp )*100) / 100 );
  end;
end;

procedure Trepawning.Button2Click(Sender: TObject);
var
  message: string;
  wReturn: Word;
  employee: TEmployee;
begin

  employee := TEmployeeADO.Create.getEmployeeById(id_currentEmployee);
  message := #13#10 + 'Сумма ссуды до перезалога: ' + Label7.Caption + #13#10;
  message := message + #13#10 + 'Начисленная сумма %: ' + Label17.Caption + #13#10;
  message := message + #13#10 + 'Сумма от клиента: ' + Label10.Text + #13#10;
  message := message + #13#10 + 'Изменение суммы ссуды: ' + FloatToStr(StrToFloat(Edit4.Text) - StrToFloat(Label7.Caption)) + #13#10;
  message := message + #13#10 + 'Сумма ссуды после перезалога: ' + Edit4.Text + #13#10;
  wReturn := MessageDlg('Я, специалист ломбарда, ' + employee.name + ', подтверждаю оформление договора!' + #13#10 +
  'Убедитесь в правильности данных перезалога' + #13#10 + message, mtConfirmation, [mbYes, mbNo], 0);
  if wReturn = mrYes then applyRePawn();
end;

procedure Trepawning.FormShow(Sender: TObject);
begin
  repawning.init;
  repawning.Button1Click;

  sEdit1.Text := FloatToStr( (Round( ( StrToFloat(Edit4.Text) / dollarPriceTmp )*100) / 100) / 100 );
  //ShowMessage(IntToStr(contractTypeGroup));
  //sEdit1.Text := '1';
 {
  if ((contractTypeGroup > 60)AND(contractTypeGroup < 101)) then begin
    if ((newIdTarif > 6) AND (newIdTarif < 10)) then begin
      exchangeRepawnContractType.Form10 := TForm10.Create(Self);
      exchangeRepawnContractType.contractNumber := Edit1.Text;
      exchangeRepawnContractType.Form10.ShowModal;
    end else begin
   // ShowMessage('Внимание! Вы делаете старый перезалог клиенту без программы лояльности!');
    end;
  end;
  }
end;

function Trepawning.getRepawnCodeFilial(conNumber: String): String;
var
  res : String;
begin
  if (conNumber[1] = 'P') then begin
    res := copy(conNumber,2,3);
  end else begin
    res := copy(conNumber,1,3);
  end;
  RESULT := res;
end;

procedure Trepawning.init;
begin
  contract := TContract.Create();
  parentContract := TContract.Create();
end;

procedure Trepawning.Edit4Exit(Sender: TObject);
begin
  if (StrToFloat(Edit4.Text) < StrToFloat(Label7.Caption) - StrToFloat(Label10.Text) + StrToFloat(Label17.Caption)) then begin
    Edit4.Text := FloatToStr(round((StrToFloat(Label7.Caption) - StrToFloat(Label10.Text) + StrToFloat(Label17.Caption))*100)/100);
  end;
end;

procedure Trepawning.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
  if (Key in ['.']) then Key := ',';
  if not (Key in ['0'..'9', ',', #8]) then Key := #0;
end;

procedure Trepawning.Edit4Change(Sender: TObject);
var
  editAmount : Double;
  editEstimatedPercent : Double;
  nextAmount : Double;
  scAmount : Double;
begin
  // Dan s code
  edit4.Color := clWhite;
  editAmount := StrToFloat(Edit4.Text);
  scAmount := 0;
  if (maxAmount = 0) then begin
  //ShowMessage('in3');
    maxAmount := (Round((StrToFloat(Label11.Caption)*(estimatedPercent/100))*100)/100);
   // ShowMessage('out 13');
  end;
  if (specialCondition) then begin
      //  ShowMessage('in4');
        scAmount := (Round((StrToFloat(Label11.Caption)*(estimatedPercent/100))*100)/100) + (netWeight*25);
       // ShowMessage('out 4');
        maxAmount := scAmount;
  end;
  // ShowMessage(FloatToStr(maxAmount)) ;
  if (edit4text > maxAmount) then begin
    maxAmount := edit4text;
      if (editAmount > maxAmount) then begin
        edit4.Text := FloatToStr(maxAmount);
        edit4.Color := clRed;
      end;
  end ;
  if (editAmount > maxAmount) then begin
        edit4.Text := FloatToStr(edit4text);
        edit4.Color := clRed;
  end;
 {
  //ShowMessage(FloatToStr(percent)) ;

  editEstimatedPercent := 100;

  //ShowMessage(FloatToStr(editEstimatedPercent)) ;
  maxAmount := (Round((StrToFloat(Label11.Caption)*(estimatedPercent/100))*100)/100);
  nextAmount := maxAmount;
  //+ dSaleSum;
   //Showmessage(FloatToStr(maxAmount));
 // Showmessage(FloatToStr(dSaleSum));
   //ShowMessage (FloatToStr(Round((StrToFloat(Label11.Caption)*(estimatedPercent/100))*100)));

   ShowMessage (FloatToStr(maxAmount));

  if (editAmount > maxAmount) then begin



    if (bSaleGroup = 4) then begin
      maxAmount := maxAmount + (netWeight*7);
    end;

    if (bSaleGroup = 3)  then begin
      maxAmount := maxAmount + (netWeight*3);
    end;

    ShowMessage(FloatToStr(maxAmount));
  end;

  if (editAmount > maxAmount) then begin
    if (i < 2) then begin
    Edit4.Text := FloatToStr(maxAmount);
    end;

  end;
  }
  Edit3.Text := '';
  //Edit3.SetFocus;
  Edit3.Color := clRed;
  Button2.Enabled := False;
 // ShowMessage (Edit4.Text);
end;

end.

