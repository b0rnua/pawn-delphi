unit newContract_form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, DB, ADODB, DBCtrls, RpCon,
  RpConDS, RpDefine, RpRave, ExtCtrls, IniFiles, xmldom, XMLIntf, XMLDoc, Order,
  FullSum, msxmldom,DanUtils, enTarif, enDeliverer, Discounts, contractUtils,
  enLoyalty, Loyals, LoyalStore, DANADO;

type
  TnewContract = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    ADOQuery11: TADOQuery;
    StringGrid1: TStringGrid;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Button3: TButton;
    Label7: TLabel;
    Label8: TLabel;
    RvProject5: TRvProject;
    NewConConnection1: TRvDataSetConnection;
    ADOQuery1: TADOQuery;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    Bevel7: TBevel;
    Label9: TLabel;
    Label10: TLabel;
    strngrd1: TStringGrid;
    xmldcmntXMLD: TXMLDocument;

    grp1: TGroupBox;
    chk2: TCheckBox;
    ComboBox3: TComboBox;
    Label11: TLabel;
    passport: TLabel;
    client: TEdit;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    sEdit1: TEdit;
    StaticText1: TLabel;
    StaticText2: TLabel;
    StaticText3: TLabel;
    StaticText4: TLabel;
    StaticText5: TLabel;
    StaticText6: TLabel;
    StaticText7: TLabel;
    StaticText8: TLabel;
    StaticText9: TLabel;
    StaticText10: TLabel;
    StaticText11: TLabel;
    sLabel1: TLabel;
    ComboBox2: TComboBox;
    cbb1: TComboBox;
    ComboBox1: TComboBox;
    chk1: TCheckBox;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Edit5: TEdit;
    Edit6: TEdit;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Button4: TButton;
    Button5: TButton;
    Panel1: TPanel;
    Button6: TButton;
    procedure resetPriceGrid ();
    procedure resetEstimatedGrid();
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button3Click(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox1Exit(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox2Exit(Sender: TObject);
    procedure StringGrid1Exit(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2Change(Sender: TObject);
    procedure StringGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure cbb1Change(Sender: TObject);
    procedure cbb1Exit(Sender: TObject);
    procedure StringGrid1SetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: string);
    procedure chk1Click(Sender: TObject);
    procedure strngrd1Exit(Sender: TObject);
    procedure strngrd1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure strngrd1KeyPress(Sender: TObject; var Key: Char);
    function setSpecialConditions(percent: Double): Double;
    procedure chk2Click(Sender: TObject);
    function chekProduct(): Boolean;
    function SimpleReplace(Tag: string; New: string; MsWord: Variant): boolean;
    procedure ComboBox3Change(Sender: TObject);
    procedure StringGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure StringGrid1Enter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure Label17Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Edit6Change(Sender: TObject);
    procedure Edit6Exit(Sender: TObject);


    procedure Button5Click(Sender: TObject);
  private
    procedure getTestList();
    function getTestPrice(test : string;idDeliverer : Integer): string;

    procedure checkDays();
    procedure mySnapShot(myFileName : String);
  public

    mainContractType : Integer;
    contractTypeGroup : Integer;
    contractType : Integer;
    netW : Double;
    newTarif : tenTarif;
    oldTarif : tenTarif;
    deliverer: TENdeliverer;
    function getContractTypeGroup(idType : integer;newW : Double) : Integer;
    function getFlaerPriceByRegion(regionNM : String) : Double;
    function getGoldTestPrice(contractTypeGroup1 : Integer): string;
  end;

  type TGridCracker = class(TStringGrid)
  public
    procedure SetCaretPosition(Grid: TStringGrid; col, row, x_pos: Integer);

    end;

var
  newContract: TnewContract;
  sum_s: byte;
  DContractNumber: string;
  id: integer;
  bCreditBodyPercentTmp, dSaleSum, increasePercent, enaLargeCreditBodyPercent:
    Double;
  nameProduct: Boolean;
  selecte : TGridCracker;
  lototron : integer;
  flaer : Boolean;
implementation

uses {sclient_form, } DateUtils, main, fr_form, deliverer_form, LogUnit, ComObj,
MyUtils, codeSMS;
{$R *.dfm}

//Описание
//Процедура поиска и замены простых строк//////////////////////////////////////////////////

function TnewContract.SimpleReplace(Tag: string; New: string; MsWord: Variant):
  boolean;
begin
  SimpleReplace := true;
  try
    MsWord.Selection.End := 0;
    MsWord.Selection.Start := 0;
    MsWord.Selection.Find.Forward := true;
    MsWord.Selection.Find.Text := Tag;
    if MsWord.Selection.Find.Execute then
    begin
      MsWord.Selection.Delete;
      MsWord.Selection.InsertAfter(New);
      SimpleReplace(Tag, New, MsWord);
    end
    else
      SimpleReplace := false; //if
  except
    SimpleReplace := false;
  end; //try
end;


//End SimpleReplace//////////////////////////////////////////////////////////////

procedure TnewContract.checkDays;
begin
if(Edit2.Text <> '' ) then begin
case contractTypeGroup of
1:begin
    if (Edit2.Text = '1') then begin
      Edit2.Text := '2';
    end;
  end;
2:begin
    if (Edit2.Text = '1') then begin
      Edit2.Text := '2';
    end;
  end;
3:begin
    if (Edit2.Text = '1') then begin
      Edit2.Text := '2';
    end;
  end;
4:begin
    Edit2.Text := '1';
   // Edit2.Enabled := false;
  end;
5:begin
    Edit2.Text := '1';
   // Edit2.Enabled := false;
  end;
6:begin
    Edit2.Text := '1';
   // Edit2.Enabled := false;
  end;
101 : begin
      if (StrToInt(Edit2.Text) < 4) then begin
      Edit2.Text := '';
      Edit2.Color := clRed;
      end else begin
        Edit2.Color := clWhite;
      end;
end;
end;
end;
end;

function TnewContract.chekProduct(): Boolean;
var
  i: Integer;
begin
  i := 1;
  if not (chk1.Checked) then
    while i < 13 do
    begin

      if StringGrid1.Cells[8, i] <> '' then
      begin
        if StringGrid1.Cells[0, i] = '' then
        begin
          nameProduct := False;
          i := 13;
        end
        else
          nameProduct := True;
      end;

      Inc(i);
    end
  else
    nameProduct := True;
  Result := nameProduct;
end;

function TnewContract.setSpecialConditions(percent: Double): Double;
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create('c:\pawn\sale.ini');
  percent := percent + IniFile.ReadFloat('Group6', 'IncreasePercent', 0);
  IniFile.Free;
  Result := percent;
end;

procedure TnewContract.FormCreate(Sender: TObject);
var
  i, z, count: byte;
  IniFile: TIniFile;
begin

  ADOQuery11.ConnectionString := DANADO.utils.getConnectionString;
  ADOQuery1.ConnectionString := DANADO.utils.getConnectionString;
  deliverer := TENdeliverer.Create;
  oldTarif := TENTarif.create;
  newTarif := TENTarif.create;
  oldTarif.setPercent('0');
  oldTarif.setTestPrice('0');
  button4.Hide;
  label20.Hide;
  label19.Hide;
  label18.Hide;
  edit5.Hide;
  edit6.Hide;
  label1.Hide;
  flaer := false;
  netW :=0;
  label15.Caption := FloatToStr(netW);
  newContract.Caption := '111111111111';
  chk2.Visible := False;
  Combobox3.Visible := False;
  IniFile := TIniFile.Create('c:\pawn\options.ini');
  bCreditBodyPercent := IniFile.ReadInteger('Contract', 'BodyPercent', 82);
  newContract2 :=  IniFile.ReadInteger('newContract', 'new', 0);
  IniFile.Free;
  StringGrid1.Cells[0, 0] := 'Наименование изделия';
  StringGrid1.Cells[1, 0] := 'Тип';
  StringGrid1.Cells[2, 0] := 'Коль-во';
  StringGrid1.Cells[3, 0] := 'Проба';
  StringGrid1.Cells[4, 0] := 'Цена грамм';
  StringGrid1.Cells[5, 0] := 'Вес';
  StringGrid1.Cells[6, 0] := 'Вес вставки';
  StringGrid1.Cells[7, 0] := 'Вес чистый';
  StringGrid1.Cells[8, 0] := 'Сумма оценки';
  ComboBox1.Visible := False;
  ComboBox2.Visible := False;
  Label18.Hide;
  Label19.Hide;
  Label20.Hide;
  Edit5.Hide;
  Edit6.Hide;
  Label17.Caption := '01.01.2013';
  Label17.Hide;
  xmldcmntXMLD.LoadFromFile('c:\pawn\conf\ProductName.xml');
  xmldcmntXMLD.Active := true;
  count := xmldcmntXMLD.DocumentElement.ChildNodes['ROWDATA'].ChildNodes.Count;
  z := 0;
  while z < count do begin
    cbb1.Items.Add(VarToStr(xmldcmntXMLD.DocumentElement.ChildNodes['ROWDATA'].ChildNodes[z].ChildNodes['FProductName'].NodeValue));
    Inc(z);
  end;
  xmldcmntXMLD.Active := false;
  xmldcmntXMLD.LoadFromFile('c:\pawn\conf\ProductName.xml');
  xmldcmntXMLD.Active := true;
  count := xmldcmntXMLD.DocumentElement.ChildNodes['ROWDATA'].ChildNodes.Count;
  z := 0;
  while z < count do begin
    cbb1.Items.Add(VarToStr(xmldcmntXMLD.DocumentElement.ChildNodes['ROWDATA'].ChildNodes[z].ChildNodes['FProductName'].NodeValue));
    Inc(z);
  end;
  xmldcmntXMLD.Active := false;
  {ADOQuery11.SQL.Clear;
  ADOQuery11.SQL.Add('SELECT name_test FROM test_value');
  with ADOQuery11 do
  begin
    ADOQuery11.Open;
    while not Eof do
    begin
      ComboBox2.Items.Add(ADOQuery11.Fields[0].AsString);
      if ADOQuery11.Fields[0].AsString = '585' then
        ComboBox2.ItemIndex := ComboBox2.Items.Count - 1;
      Next;
    end;
    ADOQuery11.Close;
  end;
  ADOQuery11.SQL.Clear;}
  if not (bEditMark) then begin
    ADOQuery11.SQL.Add('SELECT FreeContractNumber,employee.name FROM pasport ');
    ADOQuery11.SQL.Add('INNER JOIN employee ON pasport.id_CurrentEmployee=employee.id');
    ADOQuery11.Open;
    DContractNumber := ADOQuery11.FieldByName('FreeContractNumber').AsString;
    Label7.Caption := ADOQuery11.FieldByName('name').AsString;
    Edit1.Text := DContractNumber;
    ADOQuery11.SQL.Clear;
    ADOQuery11.close;
    // ADOQuery1.Parameters.ParamByName('pNumber').Value := Edit1.Text;
    sum_s := 1;
    Edit3.Text := DateToStr(DOpenDay);
  end else begin
    chk1.Visible := False;
    Button2.Enabled := True;
    Edit1.Text := sEditContractNumber;
    ADOQuery11.SQL.Add('SELECT contract_info.id,deliverer.name,num_of_day,loan_amount,estimated_amount,date_begin,date_end,');
    ADOQuery11.SQL.Add('con_percent,amount_ref,con_status,sum_percent,employee.Name, EstimatedAmountInDollar,deliverer.pasport_ser, deliverer.pasport_num, deliverer.pasport_vydan, deliverer.pasport_date, contract_info.contractTypeGroup FROM (contract_info');
    ADOQuery11.SQL.Add(' INNER JOIN deliverer ON contract_info.id_deliverer=deliverer.id) INNER JOIN employee ON contract_info.id_Employee=employee.id WHERE contract_info.id=:pId');
    ADOQuery11.Parameters.ParamByName('pId').Value :=sEditContractId;
    ADOQuery11.Open;
    contractTypeGroup := ADOQuery11.FieldByName('contractTypeGroup').AsInteger;
    newContract.Caption := newContract.Caption + ' 777 ' +MyUtils.getConditionName(contractTypeGroup);
    if not (ADOQuery11.FieldByName('con_status').AsBoolean) then begin
      Label9.Caption := 'Договор закрыт';
    end;
    Label9.Visible := true;
    Edit1.ReadOnly := true;
    client.ReadOnly := true;
    Edit2.ReadOnly := true;
    Edit1.Enabled := false;
    client.Enabled := false;
    Edit2.Enabled := false;

    if not (bDeepOptions) then begin
      Edit4.Enabled := false;
      Button2.Caption := 'Печать';
      Edit4.ReadOnly := true;
    end else begin
      Button2.Caption := 'Сохранить/печать';
    end;

    Button1.Enabled := false;
    StringGrid1.Enabled := False;
    chk1.Enabled := False;
    strngrd1.Enabled := False;
    Edit3.Enabled := False;
    Edit4.Text := ADOQuery11.FieldByName('estimated_amount').AsString;
    client.Text := ADOQuery11.FieldByName('deliverer.name').AsString;
    Label7.Caption := ADOQuery11.Fields[11].AsString;
    Edit2.Text := ADOQuery11.Fields[2].AsString;
    Label2.Caption := ADOQuery11.Fields[7].AsString;
    Label3.Caption := FloatToStr(ADOQuery11.Fields[7].AsFloat *
    ADOQuery11.Fields[2].AsInteger);

    if (ADOQuery11.Fields[5].AsDateTime <= getLastDate) then begin
      Label4.Caption := '';
      Edit3.Text := '';
    end else begin
      Label4.Caption := ADOQuery11.Fields[6].AsString;
      Edit3.Text := ADOQuery11.Fields[5].AsString;
    end;

    Label8.Caption := ADOQuery11.Fields[10].AsString;
    Label6.Caption := ADOQuery11.Fields[8].AsString;
    Label5.Caption := ADOQuery11.Fields[3].AsString;
    sEdit1.Text := ADOQuery11.Fields[12].AsString;
    id := ADOQuery11.FieldByName('id').AsInteger;

    passport.Caption := ADOQuery11.Fields[13].AsString + ' ' + ADOQuery11.Fields[14].AsString + ' ' + ADOQuery11.Fields[15].AsString;

    ADOQuery11.SQL.Clear;
    ADOQuery11.Close;
    i := 0;
    ADOQuery11.SQL.Add('SELECT product,metal,num,test,price,weight,weight_piece,weight_net,estimated_amount,SerialNumber ');
    ADOQuery11.SQL.Add('FROM product_info WHERE id_contract=:pIDC');
    ADOQuery11.Parameters.ParamByName('pIDC').Value := id;
    with ADOQuery11 do begin
      ADOQuery11.Open;
      while not eof do begin
        if (ADOQuery11.FieldByName('metal').AsString = 'Золото') then begin
          StringGrid1.Cells[0, i + 1] := ADOQuery11.FieldByName('product').AsString;
          StringGrid1.Cells[1, i + 1] := ADOQuery11.FieldByName('metal').AsString;
          StringGrid1.Cells[2, i + 1] := ADOQuery11.FieldByName('num').AsString;
          StringGrid1.Cells[3, i + 1] := ADOQuery11.FieldByName('test').AsString;
          StringGrid1.Cells[4, i + 1] := ADOQuery11.FieldByName('price').AsString;
          StringGrid1.Cells[5, i + 1] := ADOQuery11.FieldByName('weight').AsString;
          StringGrid1.Cells[6, i + 1] := ADOQuery11.FieldByName('weight_piece').AsString;
          StringGrid1.Cells[7, i + 1] := ADOQuery11.FieldByName('weight_net').AsString;
          StringGrid1.Cells[8, i + 1] := ADOQuery11.FieldByName('estimated_amount').AsString;
        end else begin
          if (ADOQuery11.FieldByName('metal').AsString = 'Техника') then begin
            strngrd1.Cells[0, i + 1] := ADOQuery11.FieldByName('product').AsString;;
            strngrd1.Cells[1, i + 1] := ADOQuery11.FieldByName('SerialNumber').AsString;
            strngrd1.Cells[2, i + 1] := ADOQuery11.FieldByName('num').AsString;
            strngrd1.Cells[3, i + 1] := ADOQuery11.FieldByName('estimated_amount').AsString;
          end;
        end;
        inc(i);
        Next;
      end;
      ADOQuery11.Close;
    end;
    ADOQuery11.SQL.Clear;
  end;
  bSaleGroup := 0;
  strngrd1.Cells[0, 0] := 'Наименование';
  strngrd1.Cells[1, 0] := 'Серийный номер/IMEI';
  //strngrd1.Cells[2, 0] := 'Тип';
  strngrd1.Cells[2, 0] := 'Кол-во';
  strngrd1.Cells[3, 0] := 'Сумма оценки';
end;

procedure TnewContract.FormShow(Sender: TObject);
begin
  panel1.Color := clRed;
  panel1.Show;
  newContract.Caption := newContract.Caption + ' ' +MyUtils.getConditionName(contractTypeGroup);

  getTestList;
  if (contractTypeGroup = 3) then begin
    chk1.Enabled := true;
    chk1.Checked := True;
  end;
  label13.Caption := MyUtils.getConditionName(contractTypeGroup);

 // if MyUtils.checkOdessa(StrToInt(main.sCodeFilial)) then panel1.Show;

end;

function TnewContract.getContractTypeGroup(idType: integer;
  newW: Double): Integer;
var
  res : Integer;
begin
  case idType of
    1 : res := 1;
    2 : res := 2;
    3 : res := 3;
    4 : res := 4;
    5 : res := 5;
    6 : res := 6;

    9 : res := 9;
    11 : res := 11;
    13 : res := 13;

    7 : res := 7;
    10 : begin
          if (newW > 25.01) then begin
            res := 16;
          end else begin
            if (newW > 10.01) then begin
              res := 14;
            end else begin
              if (newW > 6.01) then begin
                res := 12;
              end else begin res := 10;
                end;
              end;
            end;
          end;
    18 : begin
          if newW > 25.01 then begin
            res := 24;
          end else begin
          if newW > 10.01 then begin
            res := 22;
          end else begin
            if newW > 6.01 then begin
              res := 20;
            end else begin res := 18;
              end;
            end;
         end;
        end;
    26 : begin
        if newW > 10.01 then begin
            res := 30;
          end else begin
            if newW > 6.01 then begin
              res := 28;
            end else begin
               res := 26;
              end;
            end;
        end;
    31 : begin
          if (newW > 25.01) then begin
            res := 34;
          end else begin
            if (newW > 10.01) then begin
              res := 33;
            end else begin
              if (newW > 6.01) then begin
                res := 32;
              end else begin res := 31;
                end;
              end;
            end;
          end;
    35 : begin
          if (newW > 25.01) then begin
            res := 38;
          end else begin
            if (newW > 10.01) then begin
              res := 37;
            end else begin
              if (newW > 6.01) then begin
                res := 36;
              end else begin res := 35;
                end;
              end;
            end;
          end;
    39 : begin
          if (newW > 25.01) then begin
            res := 42;
          end else begin
            if (newW > 10.01) then begin
              res := 41;
            end else begin
              if (newW > 6.01) then begin
                res := 40;
              end else begin res := 39;
                end;
              end;
            end;
          end;
    43 : begin
          if (newW > 25.01) then begin
            res := 46;
          end else begin
            if (newW > 10.01) then begin
              res := 45;
            end else begin
              if (newW > 6.01) then begin
                res := 44;
              end else begin res := 43;
                end;
              end;
            end;
          end;
   47 : begin
          if (newW > 25.01) then begin
            res := 50;
          end else begin
            if (newW > 10.01) then begin
              res := 49;
            end else begin
              if (newW > 6.01) then begin
                res := 48;
              end else begin res := 47;
                end;
              end;
            end;
          end;
  101 : begin
          if (newW > 25.01) then begin
            res := 104;
          end else begin
            if (newW > 10.01) then begin
              res := 103;
            end else begin
              if (newW > 6.01) then begin
                res := 102;
              end else begin res := 101;
                end;
              end;
            end;
          end;
    105 : begin
        if (newW > 25.01) then begin
          res := 108;
        end else begin
          if (newW > 10.01) then begin
            res := 107;
          end else begin
            if (newW > 6.01) then begin
              res := 106;
            end else begin res := 105;
              end;
            end;
          end;
        end;
    109 : begin
      if (newW > 25.01) then begin
        res := 112;
      end else begin
        if (newW > 10.01) then begin
          res := 111;
        end else begin
          if (newW > 6.01) then begin
            res := 110;
          end else begin res := 109;
            end;
          end;
        end;
      end;
    113 : begin
      if (newW > 25.01) then begin
        res := 116;
      end else begin
        if (newW > 10.01) then begin
          res := 115;
        end else begin
          if (newW > 6.01) then begin
            res := 114;
          end else begin res := 113;
          end;
        end;
      end;
    end;
    117 : begin
    if (newW > 25.01) then begin
      res := 120;
    end else begin
      if (newW > 10.01) then begin
        res := 119;
      end else begin
        if (newW > 6.01) then begin
          res := 118;
        end else begin res := 117;
          end;
        end;
      end;
    end;
    121 : begin
    if (newW > 25.01) then begin
      res := 124;
    end else begin
      if (newW > 10.01) then begin
        res := 123;
      end else begin
        if (newW > 6.01) then begin
          res := 122;
        end else begin res := 121;
          end;
        end;
      end;
    end;
    125 : begin
    if (newW > 25.01) then begin
      res := 128;
    end else begin
      if (newW > 10.01) then begin
        res := 127;
      end else begin
        if (newW > 6.01) then begin
          res := 126;
        end else begin res := 125;
          end;
        end;
      end;
    end;
    129 : begin
    if (newW > 25.01) then begin
      res := 132;
    end else begin
      if (newW > 10.01) then begin
        res := 131;
      end else begin
        if (newW > 6.01) then begin
          res := 130;
        end else begin res := 129;
          end;
        end;
      end;
    end;
    51 : begin
      if (newW > 25.01) then begin
        res := 54;
      end else begin
        if (newW > 10.01) then begin
          res := 53;
        end else begin
          if (newW > 6.01) then begin
            res := 52;
          end else begin res := 51;
          end;
        end;
      end;
    end;
       55 : begin
    if (newW > 25.01) then begin
      res := 58;
    end else begin
      if (newW > 10.01) then begin
        res := 57;
      end else begin
        if (newW > 6.01) then begin
          res := 56;
        end else begin res := 55;
          end;
        end;
      end;
    end;
    // ITEM
  59 : begin
    if (newW > 25.01) then begin
      res := 62;
    end else begin
      if (newW > 10.01) then begin
        res := 61;
      end else begin
        if (newW > 6.01) then begin
          res := 60;
        end else begin res := 59;
          end;
        end;
      end;
    end;
    // END ITEM
   133 : begin
    if (newW > 25.01) then begin
      res := 136;
    end else begin
      if (newW > 10.01) then begin
        res := 135;
      end else begin
        if (newW > 6.01) then begin
          res := 134;
        end else begin res := 133;
          end;
        end;
      end;
    end;


       // ITEM
  149 : begin
    if (newW > 25.01) then begin
      res := 152;
    end else begin
      if (newW > 10.01) then begin
        res := 151;
      end else begin
        if (newW > 6.01) then begin
          res := 150;
        end else begin res := 149;
          end;
        end;
      end;
    end;
    // END ITEM
           // ITEM
  153 : begin
    if (newW > 25.01) then begin
      res := 156;
    end else begin
      if (newW > 10.01) then begin
        res := 155;
      end else begin
        if (newW > 6.01) then begin
          res := 154;
        end else begin res := 153;
          end;
        end;
      end;
    end;
    // END ITEM
          // ITEM
  157 : begin
    if (newW > 25.01) then begin
      res := 160;
    end else begin
      if (newW > 10.01) then begin
        res := 159;
      end else begin
        if (newW > 6.01) then begin
          res := 158;
        end else begin res := 157;
          end;
        end;
      end;
    end;
    // END ITEM
           // ITEM
  161 : begin
    if (newW > 25.01) then begin
      res := 164;
    end else begin
      if (newW > 10.01) then begin
        res := 163;
      end else begin
        if (newW > 6.01) then begin
          res := 162;
        end else begin res := 161;
          end;
        end;
      end;
    end;
    // END ITEM
            // ITEM
  165 : begin
    if (newW > 25.01) then begin
      res := 168;
    end else begin
      if (newW > 10.01) then begin
        res := 167;
      end else begin
        if (newW > 6.01) then begin
          res := 166;
        end else begin res := 165;
          end;
        end;
      end;
    end;
    // END ITEM
           // ITEM
  169 : begin
    if (newW > 25.01) then begin
      res := 172;
    end else begin
      if (newW > 10.01) then begin
        res := 171;
      end else begin
        if (newW > 6.01) then begin
          res := 170;
        end else begin res := 169;
          end;
        end;
      end;
    end;
    // END ITEM
           // ITEM
  173 : begin
    if (newW > 25.01) then begin
      res := 176;
    end else begin
      if (newW > 10.01) then begin
        res := 175;
      end else begin
        if (newW > 6.01) then begin
          res := 174;
        end else begin res := 173;
          end;
        end;
      end;
    end;
    // END ITEM
           // ITEM
  177 : begin
    if (newW > 25.01) then begin
      res := 180;
    end else begin
      if (newW > 10.01) then begin
        res := 179;
      end else begin
        if (newW > 6.01) then begin
          res := 178;
        end else begin res := 177;
          end;
        end;
      end;
    end;
    // END ITEM
           // ITEM
  181 : begin
    if (newW > 25.01) then begin
      res := 184;
    end else begin
      if (newW > 10.01) then begin
        res := 183;
      end else begin
        if (newW > 6.01) then begin
          res := 182;
        end else begin res := 181;
          end;
        end;
      end;
    end;
    // END ITEM
           // ITEM
  185 : begin
    if (newW > 25.01) then begin
      res := 188;
    end else begin
      if (newW > 10.01) then begin
        res := 187;
      end else begin
        if (newW > 6.01) then begin
          res := 186;
        end else begin res := 185;
          end;
        end;
      end;
    end;
    // END ITEM
           // ITEM
  189 : begin
    if (newW > 25.01) then begin
      res := 192;
    end else begin
      if (newW > 10.01) then begin
        res := 191;
      end else begin
        if (newW > 6.01) then begin
          res := 190;
        end else begin res := 189;
          end;
        end;
      end;
    end;
    // END ITEM
           // ITEM
  193 : begin
    if (newW > 25.01) then begin
      res := 196;
    end else begin
      if (newW > 10.01) then begin
        res := 195;
      end else begin
        if (newW > 6.01) then begin
          res := 194;
        end else begin res := 193;
          end;
        end;
      end;
    end;
    // END ITEM
           // ITEM
  197 : begin
    if (newW > 25.01) then begin
      res := 200;
    end else begin
      if (newW > 10.01) then begin
        res := 199;
      end else begin
        if (newW > 6.01) then begin
          res := 198;
        end else begin res := 197;
          end;
        end;
      end;
    end;
    // END ITEM
           // ITEM
  201 : begin
    if (newW > 25.01) then begin
      res := 204;
    end else begin
      if (newW > 10.01) then begin
        res := 203;
      end else begin
        if (newW > 6.01) then begin
          res := 202;
        end else begin res := 201;
          end;
        end;
      end;
    end;
    // END ITEM
           // ITEM
  205 : begin
    if (newW > 25.01) then begin
      res := 208;
    end else begin
      if (newW > 10.01) then begin
        res := 207;
      end else begin
        if (newW > 6.01) then begin
          res := 206;
        end else begin res := 205;
          end;
        end;
      end;
    end;
    // END ITEM
 // ITEM
  137 : begin
    if (newW > 25.01) then begin
      res := 140;
    end else begin
      if (newW > 10.01) then begin
        res := 139;
      end else begin
        if (newW > 6.01) then begin
          res := 138;
      end else begin res := 137;
          end;
        end;
      end;
    end;
    // END ITEM
              // ITEM
  141 : begin
    if (newW > 25.01) then begin
      res := 144;
    end else begin
      if (newW > 10.01) then begin
        res := 143;
      end else begin
        if (newW > 6.01) then begin
          res := 142;
        end else begin res := 141;
          end;
        end;
      end;
    end;
    // END ITEM
              // ITEM
  145 : begin
    if (newW > 25.01) then begin
      res := 148;
    end else begin
      if (newW > 10.01) then begin
        res := 147;
      end else begin
        if (newW > 6.01) then begin
          res := 146;
        end else begin res := 145;
          end;
        end;
      end;
    end;
    // END ITEM

   777 : begin
      res := 777;
    end;

    // END CASE
  end;
    RESULT := res;
end;

function TnewContract.getFlaerPriceByRegion(regionNM: String): Double;
var
  res1 : Double;
begin

  res1 := 425;

  if(regionNM = 'DN') then res1 := 350;

  RESULT := res1;
end;

function TnewContract.getGoldTestPrice(contractTypeGroup1 : Integer): string;
var
  count,countA, z, j, x : Integer;
  res : string;
  loyal : TARRLoyalty;
  loyalS : ILoyal;
  i1  : Integer;
  keyStr : String;
  myXmlNode  : iXMLNode;
begin
  try
    xmldcmntXMLD.LoadFromFile('c:\pawn\conf\goldTestPrice.xml');
  except on e: exception do begin
    Showmessage('Файл с Тарифами не найден! Оформлять ЗАПРЕЩЕНО! Перезайдите в программу, затем звоните в Техподдержку!');
  end;


  end;
  keyStr := DANADO.utils.getLombardName;

  myXmlNode := xmldcmntXMLD.DocumentElement;
 // ShowMEssage('666 FOUND ' + IntToStr(contractTypeGroup));
  xmldcmntXMLD.Active := true;
  count :=xmldcmntXMLD.DocumentElement.ChildNodes['ROWDATA'].ChildNodes.Count;
  z := 0;
  x := 0;
  res := '';


  while (res <> '') do begin
    while (x < count) do begin


      while z < countA do begin
        if(VarToStr(xmldcmntXMLD.DocumentElement.ChildNodes['ROWDATA'].ChildNodes[z].Attributes['id']) = IntToStr(contractTypeGroup1)) then begin
          j := 0;
          // ShowMEssage('777 FOUND '+ IntToStr(contractTypeGroup));
          while j < xmldcmntXMLD.DocumentElement.ChildNodes['ROWDATA'].ChildNodes[z].ChildNodes['testPrice'].ChildNodes.Count do begin
            if VarToStr(xmldcmntXMLD.DocumentElement.ChildNodes['ROWDATA'].ChildNodes[z].ChildNodes['testPrice'].ChildNodes[j].ChildNodes['test'].NodeValue) = '585' then begin
              res := VarToStr(xmldcmntXMLD.DocumentElement.ChildNodes['ROWDATA'].ChildNodes[z].ChildNodes['testPrice'].ChildNodes[j].ChildNodes['price'].NodeValue)
            end;
          Inc(j);
        end;
      z := count;
      end else begin
      Inc(z);
      end;
      end;
    end;
  end;

  {
  while z < count do begin
    if(VarToStr(xmldcmntXMLD.DocumentElement.ChildNodes['ROWDATA'].ChildNodes[z].Attributes['id']) = IntToStr(contractTypeGroup)) then begin
      j := 0;
     // ShowMEssage('777 FOUND '+ IntToStr(contractTypeGroup));
      while j < xmldcmntXMLD.DocumentElement.ChildNodes['ROWDATA'].ChildNodes[z].ChildNodes['testPrice'].ChildNodes.Count do begin
        if VarToStr(xmldcmntXMLD.DocumentElement.ChildNodes['ROWDATA'].ChildNodes[z].ChildNodes['testPrice'].ChildNodes[j].ChildNodes['test'].NodeValue) = '585' then begin
          res := VarToStr(xmldcmntXMLD.DocumentElement.ChildNodes['ROWDATA'].ChildNodes[z].ChildNodes['testPrice'].ChildNodes[j].ChildNodes['price'].NodeValue)
        end;
      Inc(j);
      end;

    z := count;
    end else begin
      Inc(z);
    end;
  end;

  if (idDeliverer <> 0) then begin
    loyal := danado.loyal.getArrayLoyalty(LDELIVERER, idDeliverer);
    for i1 := 0 to length(loyal)-1 do begin
      loyalS := store.get(TLoyalsType(loyal[i1].IdLoyalty));
      if (loyalS <> nil) then begin
        res := FloatToStr(loyalS.getPrice(StrToFloat(res),loyal[i1].option2));
      end;
    end;
  end;
  //ShowMessage(res);

  if(flaer) then begin
    res := FloatToStr(getFlaerPriceByRegion(getRegionByNameFilial(main.sNameFilial)));
  end;

  res := FloatToStr(contractUtils.price.getPriceOfTestFrom585(strToInt(test),strToFloat(res)));
  xmldcmntXMLD.Active := false;

  RESULT := res;    }
end;

procedure TnewContract.getTestList;
var
  count, z, j : Integer;
begin

  if (contractTypeGroup = 777) then begin
    ComboBox2.Items.Add('585');
  end else begin
   xmldcmntXMLD.LoadFromFile('c:\pawn\conf\tarif.xml');
xmldcmntXMLD.Active := true;
count :=xmldcmntXMLD.DocumentElement.ChildNodes['ROWDATA'].ChildNodes.Count;
z := 0;

while z < count do
begin
  if(VarToStr(xmldcmntXMLD.DocumentElement.ChildNodes['ROWDATA'].ChildNodes[z].Attributes['id']) = IntToStr(contractTypeGroup)) then begin
    j := 0;
    while j < xmldcmntXMLD.DocumentElement.ChildNodes['ROWDATA'].ChildNodes[z].ChildNodes['testPrice'].ChildNodes.Count do begin
      ComboBox2.Items.Add(xmldcmntXMLD.DocumentElement.ChildNodes['ROWDATA'].ChildNodes[z].ChildNodes['testPrice'].ChildNodes[j].ChildNodes['test'].NodeValue);
      if VarToStr(xmldcmntXMLD.DocumentElement.ChildNodes['ROWDATA'].ChildNodes[z].ChildNodes['testPrice'].ChildNodes[j].ChildNodes['test'].NodeValue) = '585' then
        ComboBox2.ItemIndex := ComboBox2.Items.Count - 1;
      Inc(j);
    end;

    z := count;
  end
  else begin
    Inc(z);
  end;

end;

xmldcmntXMLD.Active := false;
  end;



end;

function TnewContract.getTestPrice(test : string; idDeliverer : Integer): string;
var
  count, z, j : Integer;
  res : string;
  loyal : TARRLoyalty;
  loyalS : ILoyal;
  i1  : Integer;
begin
  try
    xmldcmntXMLD.LoadFromFile(myUtils.getTestPriceByNameFilial(main.sNameFilial));
  except on e: exception do begin
    Showmessage('Файл с Тарифами не найден! Оформлять ЗАПРЕЩЕНО! Перезайдите в программу, затем звоните в Техподдержку!');
  end;

  end;
 // ShowMEssage('666 FOUND ' + IntToStr(contractTypeGroup));
  xmldcmntXMLD.Active := true;
  count :=xmldcmntXMLD.DocumentElement.ChildNodes['ROWDATA'].ChildNodes.Count;
  z := 0;

  while z < count do begin
    if(VarToStr(xmldcmntXMLD.DocumentElement.ChildNodes['ROWDATA'].ChildNodes[z].Attributes['id']) = IntToStr(contractTypeGroup)) then begin
      j := 0;
     // ShowMEssage('777 FOUND '+ IntToStr(contractTypeGroup));
      while j < xmldcmntXMLD.DocumentElement.ChildNodes['ROWDATA'].ChildNodes[z].ChildNodes['testPrice'].ChildNodes.Count do begin
        if VarToStr(xmldcmntXMLD.DocumentElement.ChildNodes['ROWDATA'].ChildNodes[z].ChildNodes['testPrice'].ChildNodes[j].ChildNodes['test'].NodeValue) = '585' then begin
          res := VarToStr(xmldcmntXMLD.DocumentElement.ChildNodes['ROWDATA'].ChildNodes[z].ChildNodes['testPrice'].ChildNodes[j].ChildNodes['price'].NodeValue)
        end;
      Inc(j);
      end;

    z := count;
    end else begin
      Inc(z);
    end;
  end;

  if (idDeliverer <> 0) then begin
    loyal := danado.loyal.getArrayLoyalty(LDELIVERER, idDeliverer);
    for i1 := 0 to length(loyal)-1 do begin
      loyalS := store.get(TLoyalsType(loyal[i1].IdLoyalty));
      if (loyalS <> nil) then begin
        res := FloatToStr(loyalS.getPrice(StrToFloat(res),loyal[i1].option2));
      end;
    end;
  end;
  //ShowMessage(res);

  if(flaer) then begin
    res := FloatToStr(getFlaerPriceByRegion(getRegionByNameFilial(main.sNameFilial)));
  end;

  res := FloatToStr(contractUtils.price.getPriceOfTestFrom585(strToInt(test),strToFloat(res)));
  xmldcmntXMLD.Active := false;

  RESULT := res;
end;

procedure TnewContract.Label17Click(Sender: TObject);
var
addClientDate : TDate;
addlotoDate : TDate;
begin
  addlotoDate := StrToDate('11.12.2013');
  addClientDate := StrToDate(label17.Caption);
  if (addClientDate >= addlotoDate) then begin
 //   ShowMessage(DateToStr(addClientDate));
  end else begin
    ShowMessage('NORTOTOL');
  end;
end;

 // РАЗМЕР!!!
procedure TnewContract.mySnapShot(myFileName: String);
var
  DC: HDC;
  bmp: TBitmap;
  h: HWND;
  r: TRect;
  l,w : Integer;
begin
  h:=GetForegroundWindow;
  GetWindowRect(h,r);
  //Windows.GetClientRect(h, r);
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


procedure TnewContract.resetEstimatedGrid;
var
i : integer;
begin
if (StringGrid1.Cells[6,StringGrid1.Selection.Bottom] <> '')  then begin
i := 1;
Label5.Caption := '0';
  StringGrid1.Cells[7, StringGrid1.Selection.Bottom] :=
    FloatToStr(StrToFloat(StringGrid1.Cells[5, StringGrid1.Selection.Bottom]) - StrToFloat(StringGrid1.Cells[6, StringGrid1.Selection.Bottom]));
  StringGrid1.Cells[8, StringGrid1.Selection.Bottom] :=
    FloatToStr(Round(StrToFloat(StringGrid1.Cells[4, StringGrid1.Selection.Bottom]) *
    StrToFloat(StringGrid1.Cells[7, StringGrid1.Selection.Bottom]) * 100) / 100);
end;

end;

procedure TnewContract.resetPriceGrid;
var
i : Integer;
tmpFloat : Double;
begin
  for i := 1 to 12 do begin
    if (StringGrid1.Cells[4, i] <> '') then begin
      // need send contractTypeGroup
      tmpFloat := StrToFloat(getTestPrice(StringGrid1.Cells[3, i],newContract.deliverer.getId));
      StringGrid1.Cells[4, i] := FloatToStr(tmpFloat);
      if (StringGrid1.Cells[7,i] <> '' ) then begin
        StringGrid1.Cells[8, i] :=
        FloatToStr(Round(StrToFloat(StringGrid1.Cells[4, i]) *
        StrToFloat(StringGrid1.Cells[7, i]) * 100) / 100);
      end;
    end;
  end;
end;

procedure TnewContract.Button1Click(Sender: TObject);
begin
  //deliverer_form.deliverer := Tdeliverer.Create(Self);
  deliverer_form.deliverer.btn1.Enabled := True;
  deliverer_form.deliverer.ShowModal;
end;

procedure TnewContract.Button2Click(Sender: TObject);
var
  iContractNum, i: integer;
  sEmployeeDov, sEmployeeDovDate, sCity, sPhone,
    sClAdd, sClPasS, sClPasN, sClPasV, sClPasD, sClInn, sClTel: string;
  bPresence: boolean;
  MSWord: OleVariant;
  wReturn: Word;
  done : Boolean;
  orderList : TOrder;
  iIdOp : Integer;
  QL : TADOQuery;
  qsql : string;
  totastr : String;
  cent : String;
  newContractNumber : String;
  ifrepawn : String;
  techNum : String;
  newLoyalty : TENLoyalty;
begin
  mySnapShot(Edit1.Text);
  if not (chekProduct()) then begin
    ShowMessage('Не заполено наименование предмета залога');
    if chk1.Checked then
      strngrd1.SetFocus
    else
      StringGrid1.SetFocus;
    end else begin
      if client.Text = '' then begin
        ShowMessage('Не заполнено поле сдатчика');
        client.SetFocus;
      end else begin
        if  (edit2.Text = '') then begin
          ShowMessage('Не указанно количество ДНЕЙ залога');
          Edit2.SetFocus;
        end else begin
          bPresence := False;
          if not(bEditMark) then begin
            wReturn := MessageDlg('Подтверждаете оформление договора?', mtConfirmation, [mbYes, mbNo],0);
            if wReturn=mrYes then done := True
            else done := False;
            end;
            if (not(bEditMark) and (done)) then begin
              ADOQuery11.SQL.Add('SELECT contract_number FROM contract_info WHERE contract_number=:pContract');
              ADOQuery11.Parameters.ParamByName('pContract').Value := Edit1.Text;
              ADOQuery11.Open;
              if ADOQuery11.IsEmpty then bPresence := false
              else bPresence := true;
              ADOQuery11.Close;
              ADOQuery11.SQL.Clear;
              if bPresence = false then begin
              try
                ADOQuery11.SQL.Add('INSERT INTO contract_info (id_deliverer,num_of_day,loan_amount,estimated_amount,contract_number,date_begin,date_end,con_percent,amount_ref,');
                ADOQuery11.SQL.Add('con_status,sum_percent,id_Employee,SpecialCondition,EstimatedPercent,DollarPrice,EstimatedAmountInDollar,SpecialAction,contractTypeGroup)');
                ADOQuery11.SQL.Add('VALUES (:id_delivere,:num_of_da,:Qloan_amount,:Qestimated_amount,:Qcontract_number,:Qdate_begin,:Qdate_end,:Qpercent,:Qamount_ref,1,');
                ADOQuery11.SQL.Add(':Qsum_percent,:Qid_Employee,:pSpecialCondition,:pEstimatedPercent,:pDollarPrice,:pEstimatedAmountInDollar,:pSpecialAction,:contractTypeGroup)');
                ADOQuery11.Parameters.ParamByName('id_delivere').Value := iClientID;
                ADOQuery11.Parameters.ParamByName('num_of_da').Value := Edit2.Text;
                ADOQuery11.Parameters.ParamByName('Qloan_amount').Value := Label5.Caption;
                ADOQuery11.Parameters.ParamByName('Qestimated_amount').Value := Edit4.Text;
                ADOQuery11.Parameters.ParamByName('Qcontract_number').Value := Edit1.Text;
                ADOQuery11.Parameters.ParamByName('Qdate_begin').Value := Edit3.Text;
                ADOQuery11.Parameters.ParamByName('Qdate_end').Value := Label4.Caption;
                ADOQuery11.Parameters.ParamByName('Qpercent').Value := Label2.Caption;
                ADOQuery11.Parameters.ParamByName('Qamount_ref').Value := Label6.Caption;
                ADOQuery11.Parameters.ParamByName('Qsum_percent').Value := Label8.Caption;
                ADOQuery11.Parameters.ParamByName('Qid_Employee').Value := bIDEmployee;
                ADOQuery11.Parameters.ParamByName('contractTypeGroup').Value := contractTypeGroup;
                if chk2.Checked then ADOQuery11.Parameters.ParamByName('pSpecialCondition').Value := true
                else ADOQuery11.Parameters.ParamByName('pSpecialCondition').Value := False;
                if Edit2.Text = '1' then  ADOQuery11.Parameters.ParamByName('pEstimatedPercent').Value :=
                  bCreditBodyPercentOneDay
                else ADOQuery11.Parameters.ParamByName('pEstimatedPercent').Value :=
                  bCreditBodyPercent;
                ADOQuery11.Parameters.ParamByName('pDollarPrice').Value := Round(dollarPrice)/100;
                ADOQuery11.Parameters.ParamByName('pEstimatedAmountInDollar').Value := StrToFloat(sEdit1.Text);
                ADOQuery11.Parameters.ParamByName('pSpecialAction').Value := ComboBox3.ItemIndex;
                ADOQuery11.ExecSQL;
              except on e: Exception do begin
                 ShowMessage('ВНИМАНИЕ!!!! ОШИБКА №02 не удалось Записать Договор!!! сообщите об Ошибке в Тех.Поддержку');
              end;

              end;
                ADOQuery11.SQL.Clear;
                ADOQuery11.close;
              try
                ADOQuery11.SQL.Add('SELECT id,contract_number FROM contract_info WHERE contract_number=:pcontract_number');
                ADOQuery11.Parameters.ParamByName('pcontract_number').Value := Edit1.Text;
                ADOQuery11.Open;
              except on e: Exception do begin
                 ShowMessage('ВНИМАНИЕ!!!! ОШИБКА №03 не удалось найти договор!!! сообщите об Ошибке в Тех.Поддержку');
              end;

              end;
                id := ADOQuery11.Fields[0].AsInteger;
                ADOQuery11.SQL.Clear;
                ADOQuery11.close;

                // LOTO TIME !!!
                { if (lototron = 1) then  begin
                QL := TADOQuery.Create(nil);
                QL.ConnectionString := MyUtils.getConnectionString;
                QL.SQL.Add('INSERT INTO lototron (idContract, idDeliverer, ticket, sell, timeStampField ) VALUES (:pide, :pidDeliverer, :pTicket, :pSell, :ptimeStampField)');

                QL.Parameters.ParamByName('pide').Value := id;
                QL.Parameters.ParamByName('pidDeliverer').Value := iClientID;
                if  (edit6.Text = '') then  edit6.Text := '0';
                if  (edit5.Text = '') then edit5.Text := '0';
                QL.Parameters.ParamByName('pTicket').Value := StrToInt(Edit5.Text);
                QL.Parameters.ParamByName('pSell').Value := StrToInt(Edit6.Text);
                QL.Parameters.ParamByName('ptimeStampField').Value := Now();
                QL.ExecSQL;
                QL.Destroy;
                end;}
                i := 1;
                if (chk1.Checked) then  begin
                  while strngrd1.Cells[3, i] <> '' do begin
                  ADOQuery11.SQL.Add('INSERT INTO product_info (product,metal,num,'+
                    'test,price,weight,weight_net,estimated_amount,id_contract,'+
                    'product_status,SerialNumber)'+
                    ' VALUES (:produc,:meta,:nu,:tes,:pric,:weigh,:weight_ne,'+
                    ':estimated_amoun,:id_contrac,1,:SerialNumber)');
                  ADOQuery11.Parameters.ParamByName('produc').Value :=
                    strngrd1.Cells[0, i];
                  ADOQuery11.Parameters.ParamByName('meta').Value := 'Техника';
                  techNum := strngrd1.Cells[2, i];
                  if (strngrd1.Cells[2, i] = '') then begin
                     techNum := '1';
                  end;

                  ADOQuery11.Parameters.ParamByName('nu').Value := techNum;
                  ADOQuery11.Parameters.ParamByName('SerialNumber').Value := strngrd1.Cells[1,
                    i];
                  ADOQuery11.Parameters.ParamByName('tes').Value := 0;
                  ADOQuery11.Parameters.ParamByName('pric').Value := 0;
                  ADOQuery11.Parameters.ParamByName('weigh').Value := 0;
                  ADOQuery11.Parameters.ParamByName('weight_ne').Value := 0;
                  ADOQuery11.Parameters.ParamByName('estimated_amoun').Value :=
                    strngrd1.Cells[3, i];
                  ADOQuery11.Parameters.ParamByName('id_contrac').Value := id;
                 try
                  ADOQuery11.ExecSQL;
                 except on e: Exception do begin
                  ShowMessage('ВНИМАНИЕ!!!! ОШИБКА №04 не удалось добавить Изделие!!! сообщите об Ошибке в Тех.Поддержку');
                end;

                end;

                  ADOQuery11.SQL.Clear;
                  ADOQuery11.close;
                  i := i + 1;
                end;
              end else begin
                while StringGrid1.Cells[8, i] <> '' do  begin
                  ADOQuery11.SQL.Add('INSERT INTO product_info (product,metal,num,test,price,weight,weight_net,weight_piece,estimated_amount,id_contract,product_status) VALUES (:produc,:meta,:nu,:tes,:pric,:weigh,:weight_ne,:weight_piece,:estimated_amoun,:id_contrac,1)');
                  ADOQuery11.Parameters.ParamByName('produc').Value :=
                    StringGrid1.Cells[0, i];
                  ADOQuery11.Parameters.ParamByName('meta').Value :=
                    StringGrid1.Cells[1, i];
                  ADOQuery11.Parameters.ParamByName('nu').Value :=
                    StringGrid1.Cells[2, i];
                  ADOQuery11.Parameters.ParamByName('tes').Value :=
                    StringGrid1.Cells[3, i];
                  ADOQuery11.Parameters.ParamByName('pric').Value :=
                    StringGrid1.Cells[4, i];
                  ADOQuery11.Parameters.ParamByName('weigh').Value :=
                    StringGrid1.Cells[5, i];
                  ADOQuery11.Parameters.ParamByName('weight_ne').Value :=
                    StringGrid1.Cells[7, i];
                  ADOQuery11.Parameters.ParamByName('weight_piece').Value :=
                    StringGrid1.Cells[6, i];
                    ADOQuery11.Parameters.ParamByName('estimated_amoun').Value :=
                    StringGrid1.Cells[8, i];
                  ADOQuery11.Parameters.ParamByName('id_contrac').Value := id;
                try
                  ADOQuery11.ExecSQL;
                except on e: Exception do begin
                  // ТУТ НАДА БОЛЕЕ ПОДРОБНЫЙ ОБРАБОТЧИК(( ДО СИХ ПОР ВЫЛЕТАЕТ (
                  ShowMessage('ВНИМАНИЕ!!!! ОШИБКА №05 не удалось добавить Изделие!!! сообщите об Ошибке в Тех.Поддержку');



                end;

                end;
                  ADOQuery11.SQL.Clear;
                  ADOQuery11.close;
                  i := i + 1;
                end;
              end;


              if(flaer) then begin
                newLoyalty := TENLoyalty.CREATE;
                newLoyalty.idDeliverer := iClientID;
                newLoyalty.idLoyalty := 15;
                newLoyalty.idContract := id;
                newLoyalty.option1 := 0.03;
                newLoyalty.option2 := getFlaerPriceByRegion(getRegionByNameFilial(main.sNameFilial));;
                newLoyalty.editDate := now();
                newLoyalty.status := FALSE;
                DANADO.loyal.addLoyalty(newLoyalty);
              end;

              ADOQuery11.SQL.Add('INSERT INTO operation (op,date_op,sum_op,id_contract_op,TimestampField) VALUES (:Qop,:Qdate_op,:Qsum_op,:Qid_contract_op,:TimestampField)');
              ADOQuery11.Parameters.ParamByName('Qop').Value := 1;
              ADOQuery11.Parameters.ParamByName('Qdate_op').Value :=
                StrToDate(Edit3.Text);
              ADOQuery11.Parameters.ParamByName('Qsum_op').Value :=
                StrToFloat(Edit4.Text);
              ADOQuery11.Parameters.ParamByName('Qid_contract_op').Value := id;
              ADOQuery11.Parameters.ParamByName('TimestampField').Value :=
                Now;
             try
              ADOQuery11.ExecSQL;
                   except on e: Exception do begin
                  ShowMessage('ВНИМАНИЕ!!!! ОШИБКА №06 не удалось добавить движение!!! сообщите об Ошибке в Тех.Поддержку');
                end;

                end;
              ADOQuery11.SQL.Clear;
              ADOQuery11.close;
              iContractNum := StrToInt(DContractNumber) + 1;
              //Добавим Нолики перед Договором
              DContractNumber := '';
              if (main.newContract2 = 1) then begin
                DContractNumber := MyUtils.getNulliki(StrToInt(filialNumberMain));
              end;
              DContractNumber := DContractNumber + IntToStr(iContractNum);
              while Length(DContractNumber) < 5 do
                DContractNumber := '0' + DContractNumber;

              ADOQuery11.SQL.Add('UPDATE pasport SET FreeContractNumber=:pFreeContractNumber');
              ADOQuery11.Parameters.ParamByName('pFreeContractNumber').Value :=
              DContractNumber;
              ADOQuery11.ExecSQL;
              ADOQuery11.SQL.Clear;
              ADOQuery11.close;
            end else begin
              ShowMessage('Договор № ' + Edit1.Text + ' уже существует!');
              Edit1.SetFocus;
            end;
          end else begin
            if bDeepOptions then begin
              ADOQuery11.SQL.Add('UPDATE contract_info SET estimated_amount=:pSumma WHERE contract_number=:pContract');
              ADOQuery11.Parameters.ParamByName('pSumma').Value :=
                StrToFloat(Edit4.Text);
              ADOQuery11.Parameters.ParamByName('pContract').Value := Edit1.Text;
              ADOQuery11.ExecSQL;
              ADOQuery11.SQL.Clear;
            end;
          end;
        if bPresence = False then begin
          ADOQuery11.SQL.Add('SELECT employee.warrant_num,employee.warrant_date,City,pasport.phone');
          ADOQuery11.SQL.Add(' FROM pasport INNER JOIN employee ON pasport.id_CurrentEmployee=employee.id');
          ADOQuery11.Open;
          sEmployeeDov := ADOQuery11.Fields[0].AsString;
          sEmployeeDovDate := ADOQuery11.Fields[1].AsString;
          sCity := ADOQuery11.Fields[2].AsString;
          sPhone := ADOQuery11.FieldByName('phone').AsString;
          ADOQuery11.SQL.Clear;
          ADOQuery11.close;
          ADOQuery11.SQL.Add('SELECT deliverer.adress,deliverer.pasport_ser,deliverer.pasport_num');
          ADOQuery11.SQL.Add(',deliverer.pasport_vydan,deliverer.pasport_date,deliverer.inn, deliverer.telephon, contract_info.id');
          ADOQuery11.SQL.Add(' FROM contract_info INNER JOIN deliverer ON contract_info.id_deliverer=deliverer.id');
          ADOQuery11.SQL.Add(' WHERE contract_number=:pContractNumber');
          ADOQuery11.Parameters.ParamByName('pContractNumber').Value :=
            Edit1.Text;
          ADOQuery11.Open;
          sClAdd := ADOQuery11.Fields[0].AsString;
          sClPasS := ADOQuery11.Fields[1].AsString;
          sClPasN := ADOQuery11.Fields[2].AsString;
          sClPasV := ADOQuery11.Fields[3].AsString;
          sClPasD := ADOQuery11.Fields[4].AsString;
          sClInn := ADOQuery11.Fields[5].AsString;
          sClTel := ADOQuery11.Fields[6].AsString;
          ID := ADOQuery11.FieldByName('id').AsInteger;
          ADOQuery11.SQL.Clear;
          ADOQuery11.close;
          if  not(bEditMark) then begin
            if ((bPPOStatus) and (done)) then begin
              ADOQuery11.SQL.Add('SELECT name_filial,employee.name FROM pasport INNER JOIN employee ON pasport.id_CurrentEmployee=employee.id');
              ADOQuery11.Open;
              if fr_form.Form3.ConfirmCheck then
                fr_form.Form3.CheckType('Credit',
                Copy(ADOQuery11.Fields[1].AsString, 1, 8), 'N Дог. ' + Edit1.Text,
                ADOQuery11.Fields[0].AsString, StrToFloat(Edit4.Text));
                ADOQuery11.Close;
                ADOQuery11.SQL.Clear;
              end else if (done) then begin
                ADOQuery1.SQL.Clear;
                ADOQuery1.SQL.Add('SELECT Max(id) FROM operation');
                ADOQuery1.Open;
                iIdOp := ADOQuery1.Fields[0].AsInteger;
                ADOQuery1.Close;
                orderList := TOrder.Create;
                orderList.bill := '3771';
                orderList.summ := Edit4.Text;
                orderList.from := client.Text;
                orderList.ground := 'предоставлен фин. кредит №' +  Edit1.Text;
                orderList.summInWord := SumNumToFull(StrToFloat(Edit4.Text));
                orderList.summCent := FloatToStr(Round(Frac(StrToFloat(Edit4.Text))*100));
                orderList.chief := chief;
                orderList.orderType := 1;
                orderList.date := DateToStr(DOpenDay);
                orderList.document := passport.Caption;
                orderList.saveDocument(iIdOp);
                if orderList.ConfirmCheck then begin
                  orderList.printExpenseReport;
                end;
              end;
            end;
            if (bEditMark) then done := True;
            if (done) then begin
              // ТУТ ДОЛЖЕН БЫТЬ ЕКСЕЛЬ !!!!






                MSWord := CreateOleObject('Word.Application');
              if (main.newContract2 = 1) then begin
                MSWord.Documents.Add('C://Pawn//report//newContract2.doc');
                MSWord.DisplayAlerts := false
              end else begin
                MSWord.Documents.Add('C://Pawn//report//newContract.doc');
                MSWord.DisplayAlerts := false
                //ShowMessage('828NEW');
              end;
        ifRepawn := copy(Edit1.Text,0,1);
        if (bEditMark) AND (ifrepawn='P')  AND (main.newContract2 = 1) then begin
                DanUtils.print.repawn(ID, Edit1.Text);
        end else begin
             DanUtils.print.newContract(ID);
          {

        SimpleReplace('$City', sCity, MSWord);
        SimpleReplace('$phone', sPhone, MSWord);
        SimpleReplace('$date', Edit3.Text, MSWord);
        SimpleReplace('$fiosotryd', Label7.Caption, MSWord);
        SimpleReplace('$num', sEmployeeDov, MSWord);
        SimpleReplace('$dtewar', sEmployeeDovDate, MSWord);
        SimpleReplace('$fioklient', client.Text, MSWord);
        SimpleReplace('$adressklient', sClAdd, MSWord);
        SimpleReplace('$paspseria', sClPasS, MSWord);
        SimpleReplace('$papsnomer', sClPasN, MSWord);
        SimpleReplace('$papsvidan', sClPasV, MSWord);
        SimpleReplace('$papsdate', sClPasD, MSWord);
        SimpleReplace('$inn', sClInn, MSWord);
        SimpleReplace('$telephon', sClTel, MSWord);
        SimpleReplace('$Creditdays', Edit2.Text, MSWord);
        SimpleReplace('$creditvozvrat', Label4.Caption, MSWord);
        SimpleReplace('$contractNumber', Edit1.Text, MSWord);
        if (chk1.Checked) then
        begin
          SimpleReplace('$AQ1', strngrd1.Cells[0, 1]+' '+strngrd1.Cells[1, 1], MSWord);
          SimpleReplace('$AQ2', strngrd1.Cells[0, 2]+' '+strngrd1.Cells[1, 2], MSWord);
          SimpleReplace('$AQ3', strngrd1.Cells[0, 3]+' '+strngrd1.Cells[1, 3], MSWord);
          SimpleReplace('$AQ4', strngrd1.Cells[0, 4]+' '+strngrd1.Cells[1, 4], MSWord);
          SimpleReplace('$AQ5', strngrd1.Cells[0, 5]+' '+strngrd1.Cells[1, 5], MSWord);
          SimpleReplace('$AQ6', strngrd1.Cells[0, 6]+' '+strngrd1.Cells[1, 6], MSWord);
          SimpleReplace('$AQ7', strngrd1.Cells[0, 7]+' '+strngrd1.Cells[1, 7], MSWord);
          SimpleReplace('$AQ8', strngrd1.Cells[0, 8]+' '+strngrd1.Cells[1, 8], MSWord);
          SimpleReplace('$AQ9', strngrd1.Cells[0, 9]+' '+strngrd1.Cells[1, 9], MSWord);
          SimpleReplace('$AQ_10', strngrd1.Cells[0, 10]+' '+strngrd1.Cells[1, 10], MSWord);
          SimpleReplace('$AQ_11', strngrd1.Cells[0, 11]+' '+strngrd1.Cells[1, 11], MSWord);
          SimpleReplace('$AQ_12', strngrd1.Cells[0, 12]+' '+strngrd1.Cells[1, 12], MSWord);
         //SimpleReplace('$Metal1', ComboBox1.Items[1], MSWord);
          //SimpleReplace('$Metal2', ComboBox1.Items[1], MSWord);
          //SimpleReplace('$Metal3', ComboBox1.Items[1], MSWord);
          //SimpleReplace('$Metal4', ComboBox1.Items[1], MSWord);
          //SimpleReplace('$Metal5', ComboBox1.Items[1], MSWord);
          //SimpleReplace('$Metal6', ComboBox1.Items[1], MSWord);
          SimpleReplace('$AR1', '', MSWord);
          SimpleReplace('$AR2', '', MSWord);
          SimpleReplace('$AR3', '', MSWord);
          SimpleReplace('$AR4', '', MSWord);
          SimpleReplace('$AR5', '', MSWord);
          SimpleReplace('$AR6', '', MSWord);
          SimpleReplace('$AR7', '', MSWord);
          SimpleReplace('$AR8', '', MSWord);
          SimpleReplace('$AR9', '', MSWord);
          SimpleReplace('$AR_10', '', MSWord);
          SimpleReplace('$AR_11', '', MSWord);
          SimpleReplace('$AR_12', '', MSWord);

          SimpleReplace('$AW1', strngrd1.Cells[2, 1], MSWord);
          SimpleReplace('$AW2', strngrd1.Cells[2, 2], MSWord);
          SimpleReplace('$AW3', strngrd1.Cells[2, 3], MSWord);
          SimpleReplace('$AW4', strngrd1.Cells[2, 4], MSWord);
          SimpleReplace('$AW5', strngrd1.Cells[2, 5], MSWord);
          SimpleReplace('$AW6', strngrd1.Cells[2, 6], MSWord);
          SimpleReplace('$AW7', strngrd1.Cells[2, 7], MSWord);
          SimpleReplace('$AW8', strngrd1.Cells[2, 8], MSWord);
          SimpleReplace('$AW9', strngrd1.Cells[2, 9], MSWord);
          SimpleReplace('$AW_10', strngrd1.Cells[2, 10], MSWord);
          SimpleReplace('$AW_11', strngrd1.Cells[2, 11], MSWord);
          SimpleReplace('$AW_12', strngrd1.Cells[2, 12], MSWord);

          SimpleReplace('$AE1', '', MSWord);
          SimpleReplace('$AE2', '', MSWord);
          SimpleReplace('$AE3', '', MSWord);
          SimpleReplace('$AE4', '', MSWord);
          SimpleReplace('$AE5', '', MSWord);
          SimpleReplace('$AE6', '', MSWord);
          SimpleReplace('$AE7', '', MSWord);
          SimpleReplace('$AE8', '', MSWord);
          SimpleReplace('$AE9', '', MSWord);
          SimpleReplace('$AE_10', '', MSWord);
          SimpleReplace('$AE_11', '', MSWord);
          SimpleReplace('$AE_12', '', MSWord);

          SimpleReplace('$AY1', '', MSWord);
          SimpleReplace('$AY2', '', MSWord);
          SimpleReplace('$AY3', '', MSWord);
          SimpleReplace('$AY4', '', MSWord);
          SimpleReplace('$AY5', '', MSWord);
          SimpleReplace('$AY6', '', MSWord);
          SimpleReplace('$AY7', '', MSWord);
          SimpleReplace('$AY8', '', MSWord);
          SimpleReplace('$AY9', '', MSWord);
          SimpleReplace('$AY_10', '', MSWord);
          SimpleReplace('$AY_11', '', MSWord);
          SimpleReplace('$AY_12', '', MSWord);

          SimpleReplace('$AO1', strngrd1.Cells[3, 1], MSWord);
          SimpleReplace('$AO2', strngrd1.Cells[3, 2], MSWord);
          SimpleReplace('$AO3', strngrd1.Cells[3, 3], MSWord);
          SimpleReplace('$AO4', strngrd1.Cells[3, 4], MSWord);
          SimpleReplace('$AO5', strngrd1.Cells[3, 5], MSWord);
          SimpleReplace('$AO6', strngrd1.Cells[3, 6], MSWord);
          SimpleReplace('$AO7', strngrd1.Cells[3, 7], MSWord);
          SimpleReplace('$AO8', strngrd1.Cells[3, 8], MSWord);
          SimpleReplace('$AO9', strngrd1.Cells[3, 9], MSWord);
          SimpleReplace('$AO_10', strngrd1.Cells[3, 10], MSWord);
          SimpleReplace('$AO_11', strngrd1.Cells[3, 11], MSWord);
          SimpleReplace('$AO_12', strngrd1.Cells[3, 12], MSWord);


        end
        else
        begin
          SimpleReplace('$AQ1', StringGrid1.Cells[0, 1], MSWord);
          SimpleReplace('$AQ2', StringGrid1.Cells[0, 2], MSWord);
          SimpleReplace('$AQ3', StringGrid1.Cells[0, 3], MSWord);
          SimpleReplace('$AQ4', StringGrid1.Cells[0, 4], MSWord);
          SimpleReplace('$AQ5', StringGrid1.Cells[0, 5], MSWord);
          SimpleReplace('$AQ6', StringGrid1.Cells[0, 6], MSWord);
          SimpleReplace('$AQ7', StringGrid1.Cells[0, 7], MSWord);
          SimpleReplace('$AQ8', StringGrid1.Cells[0, 8], MSWord);
          SimpleReplace('$AQ9', StringGrid1.Cells[0, 9], MSWord);
          SimpleReplace('$AQ_10', StringGrid1.Cells[0, 10], MSWord);
          SimpleReplace('$AQ_11', StringGrid1.Cells[0, 11], MSWord);
          SimpleReplace('$AQ_12', StringGrid1.Cells[0, 12], MSWord);
          SimpleReplace('$AW1', StringGrid1.Cells[2, 1], MSWord);
          SimpleReplace('$AW2', StringGrid1.Cells[2, 2], MSWord);
          SimpleReplace('$AW3', StringGrid1.Cells[2, 3], MSWord);
          SimpleReplace('$AW4', StringGrid1.Cells[2, 4], MSWord);
          SimpleReplace('$AW5', StringGrid1.Cells[2, 5], MSWord);
          SimpleReplace('$AW6', StringGrid1.Cells[2, 6], MSWord);
          SimpleReplace('$AW7', StringGrid1.Cells[2, 7], MSWord);
          SimpleReplace('$AW8', StringGrid1.Cells[2, 8], MSWord);
          SimpleReplace('$AW9', StringGrid1.Cells[2, 9], MSWord);
          SimpleReplace('$AW_10', StringGrid1.Cells[2, 10], MSWord);
          SimpleReplace('$AW_11', StringGrid1.Cells[2, 11], MSWord);
          SimpleReplace('$AW_12', StringGrid1.Cells[2, 12], MSWord);
          SimpleReplace('$AE1', StringGrid1.Cells[1, 1], MSWord);
          SimpleReplace('$AE2', StringGrid1.Cells[1, 2], MSWord);
          SimpleReplace('$AE3', StringGrid1.Cells[1, 3], MSWord);
          SimpleReplace('$AE4', StringGrid1.Cells[1, 4], MSWord);
          SimpleReplace('$AE5', StringGrid1.Cells[1, 5], MSWord);
          SimpleReplace('$AE6', StringGrid1.Cells[1, 6], MSWord);
          SimpleReplace('$AE7', StringGrid1.Cells[1, 7], MSWord);
          SimpleReplace('$AE8', StringGrid1.Cells[1, 8], MSWord);
          SimpleReplace('$AE9', StringGrid1.Cells[1, 9], MSWord);
          SimpleReplace('$AE_10', StringGrid1.Cells[1, 10], MSWord);
          SimpleReplace('$AE_11', StringGrid1.Cells[1, 11], MSWord);
          SimpleReplace('$AE_12', StringGrid1.Cells[1, 12], MSWord);
          SimpleReplace('$AR1', StringGrid1.Cells[3, 1], MSWord);
          SimpleReplace('$AR2', StringGrid1.Cells[3, 2], MSWord);
          SimpleReplace('$AR3', StringGrid1.Cells[3, 3], MSWord);
          SimpleReplace('$AR4', StringGrid1.Cells[3, 4], MSWord);
          SimpleReplace('$AR5', StringGrid1.Cells[3, 5], MSWord);
          SimpleReplace('$AR6', StringGrid1.Cells[3, 6], MSWord);
          SimpleReplace('$AR7', StringGrid1.Cells[3, 7], MSWord);
          SimpleReplace('$AR8', StringGrid1.Cells[3, 8], MSWord);
          SimpleReplace('$AR9', StringGrid1.Cells[3, 9], MSWord);
          SimpleReplace('$AR_10', StringGrid1.Cells[3, 10], MSWord);
          SimpleReplace('$AR_11', StringGrid1.Cells[3, 11], MSWord);
          SimpleReplace('$AR_12', StringGrid1.Cells[3, 12], MSWord);
          SimpleReplace('$AT1', StringGrid1.Cells[5, 1], MSWord);
          SimpleReplace('$AT2', StringGrid1.Cells[5, 2], MSWord);
          SimpleReplace('$AT3', StringGrid1.Cells[5, 3], MSWord);
          SimpleReplace('$AT4', StringGrid1.Cells[5, 4], MSWord);
          SimpleReplace('$AT5', StringGrid1.Cells[5, 5], MSWord);
          SimpleReplace('$AT6', StringGrid1.Cells[5, 6], MSWord);
          SimpleReplace('$AT7', StringGrid1.Cells[5, 7], MSWord);
          SimpleReplace('$AT8', StringGrid1.Cells[5, 8], MSWord);
          SimpleReplace('$AT9', StringGrid1.Cells[5, 9], MSWord);
          SimpleReplace('$AT_10', StringGrid1.Cells[5, 10], MSWord);
          SimpleReplace('$AT_11', StringGrid1.Cells[5, 11], MSWord);
          SimpleReplace('$AT_12', StringGrid1.Cells[5, 12], MSWord);
          SimpleReplace('$AY1', StringGrid1.Cells[6, 1], MSWord);
          SimpleReplace('$AY2', StringGrid1.Cells[6, 2], MSWord);
          SimpleReplace('$AY3', StringGrid1.Cells[6, 3], MSWord);
          SimpleReplace('$AY4', StringGrid1.Cells[6, 4], MSWord);
          SimpleReplace('$AY5', StringGrid1.Cells[6, 5], MSWord);
          SimpleReplace('$AY6', StringGrid1.Cells[6, 6], MSWord);
          SimpleReplace('$AY7', StringGrid1.Cells[6, 7], MSWord);
          SimpleReplace('$AY8', StringGrid1.Cells[6, 8], MSWord);
          SimpleReplace('$AY9', StringGrid1.Cells[6, 9], MSWord);
          SimpleReplace('$AY_10', StringGrid1.Cells[6, 10], MSWord);
          SimpleReplace('$AY_11', StringGrid1.Cells[6, 11], MSWord);
          SimpleReplace('$AY_12', StringGrid1.Cells[6, 12], MSWord);
          SimpleReplace('$AI1', StringGrid1.Cells[4, 1], MSWord);
          SimpleReplace('$AI2', StringGrid1.Cells[4, 2], MSWord);
          SimpleReplace('$AI3', StringGrid1.Cells[4, 3], MSWord);
          SimpleReplace('$AI4', StringGrid1.Cells[4, 4], MSWord);
          SimpleReplace('$AI5', StringGrid1.Cells[4, 5], MSWord);
          SimpleReplace('$AI6', StringGrid1.Cells[4, 6], MSWord);
          SimpleReplace('$AI7', StringGrid1.Cells[4, 7], MSWord);
          SimpleReplace('$AI8', StringGrid1.Cells[4, 8], MSWord);
          SimpleReplace('$AI9', StringGrid1.Cells[4, 9], MSWord);
          SimpleReplace('$AI_10', StringGrid1.Cells[4, 10], MSWord);
          SimpleReplace('$AI_11', StringGrid1.Cells[4, 11], MSWord);
          SimpleReplace('$AI_12', StringGrid1.Cells[4, 12], MSWord);
          SimpleReplace('$AO1', StringGrid1.Cells[8, 1], MSWord);
          SimpleReplace('$AO2', StringGrid1.Cells[8, 2], MSWord);
          SimpleReplace('$AO3', StringGrid1.Cells[8, 3], MSWord);
          SimpleReplace('$AO4', StringGrid1.Cells[8, 4], MSWord);
          SimpleReplace('$AO5', StringGrid1.Cells[8, 5], MSWord);
          SimpleReplace('$AO6', StringGrid1.Cells[8, 6], MSWord);
          SimpleReplace('$AO7', StringGrid1.Cells[8, 7], MSWord);
          SimpleReplace('$AO8', StringGrid1.Cells[8, 8], MSWord);
          SimpleReplace('$AO9', StringGrid1.Cells[8, 9], MSWord);
          SimpleReplace('$AO_10', StringGrid1.Cells[8, 10], MSWord);
          SimpleReplace('$AO_11', StringGrid1.Cells[8, 11], MSWord);
          SimpleReplace('$AO_12', StringGrid1.Cells[8, 12], MSWord);
          SimpleReplace('$AU1', StringGrid1.Cells[7, 1], MSWord);
          SimpleReplace('$AU2', StringGrid1.Cells[7, 2], MSWord);
          SimpleReplace('$AU3', StringGrid1.Cells[7, 3], MSWord);
          SimpleReplace('$AU4', StringGrid1.Cells[7, 4], MSWord);
          SimpleReplace('$AU5', StringGrid1.Cells[7, 5], MSWord);
          SimpleReplace('$AU6', StringGrid1.Cells[7, 6], MSWord);
          SimpleReplace('$AU7', StringGrid1.Cells[7, 7], MSWord);
          SimpleReplace('$AU8', StringGrid1.Cells[7, 8], MSWord);
          SimpleReplace('$AU9', StringGrid1.Cells[7, 9], MSWord);
          SimpleReplace('$AU_10', StringGrid1.Cells[7, 10], MSWord);
          SimpleReplace('$AU_11', StringGrid1.Cells[7, 11], MSWord);
          SimpleReplace('$AU_12', StringGrid1.Cells[7, 12], MSWord);
         end;

        SimpleReplace('$AR1', StringGrid1.Cells[3, 1], MSWord);
        SimpleReplace('$AR2', StringGrid1.Cells[3, 2], MSWord);
        SimpleReplace('$AR3', StringGrid1.Cells[3, 3], MSWord);
        SimpleReplace('$AR4', StringGrid1.Cells[3, 4], MSWord);
        SimpleReplace('$AR5', StringGrid1.Cells[3, 5], MSWord);
        SimpleReplace('$AR6', StringGrid1.Cells[3, 6], MSWord);
        SimpleReplace('$AR7', StringGrid1.Cells[3, 7], MSWord);
        SimpleReplace('$AR8', StringGrid1.Cells[3, 8], MSWord);
        SimpleReplace('$AR9', StringGrid1.Cells[3, 9], MSWord);
        SimpleReplace('$AR_10', StringGrid1.Cells[3, 10], MSWord);
        SimpleReplace('$AR_11', StringGrid1.Cells[3, 11], MSWord);
        SimpleReplace('$AR_12', StringGrid1.Cells[3, 12], MSWord);
        SimpleReplace('$AT1', StringGrid1.Cells[5, 1], MSWord);
        SimpleReplace('$AT2', StringGrid1.Cells[5, 2], MSWord);
        SimpleReplace('$AT3', StringGrid1.Cells[5, 3], MSWord);
        SimpleReplace('$AT4', StringGrid1.Cells[5, 4], MSWord);
        SimpleReplace('$AT5', StringGrid1.Cells[5, 5], MSWord);
        SimpleReplace('$AT6', StringGrid1.Cells[5, 6], MSWord);
        SimpleReplace('$AT7', StringGrid1.Cells[5, 7], MSWord);
        SimpleReplace('$AT8', StringGrid1.Cells[5, 8], MSWord);
        SimpleReplace('$AT9', StringGrid1.Cells[5, 9], MSWord);
        SimpleReplace('$AT_10', StringGrid1.Cells[5, 10], MSWord);
        SimpleReplace('$AT_11', StringGrid1.Cells[5, 11], MSWord);
        SimpleReplace('$AT_12', StringGrid1.Cells[5, 12], MSWord);
        SimpleReplace('$AU1', StringGrid1.Cells[7, 1], MSWord);
        SimpleReplace('$AU2', StringGrid1.Cells[7, 2], MSWord);
        SimpleReplace('$AU3', StringGrid1.Cells[7, 3], MSWord);
        SimpleReplace('$AU4', StringGrid1.Cells[7, 4], MSWord);
        SimpleReplace('$AU5', StringGrid1.Cells[7, 5], MSWord);
        SimpleReplace('$AU6', StringGrid1.Cells[7, 6], MSWord);
        SimpleReplace('$AU7', StringGrid1.Cells[7, 7], MSWord);
        SimpleReplace('$AU8', StringGrid1.Cells[7, 8], MSWord);
        SimpleReplace('$AU9', StringGrid1.Cells[7, 9], MSWord);
        SimpleReplace('$AU_10', StringGrid1.Cells[7, 10], MSWord);
        SimpleReplace('$AU_11', StringGrid1.Cells[7, 11], MSWord);
        SimpleReplace('$AU_12', StringGrid1.Cells[7, 12], MSWord);
        SimpleReplace('$AI1', StringGrid1.Cells[4, 1], MSWord);
        SimpleReplace('$AI2', StringGrid1.Cells[4, 2], MSWord);
        SimpleReplace('$AI3', StringGrid1.Cells[4, 3], MSWord);
        SimpleReplace('$AI4', StringGrid1.Cells[4, 4], MSWord);
        SimpleReplace('$AI5', StringGrid1.Cells[4, 5], MSWord);
        SimpleReplace('$AI6', StringGrid1.Cells[4, 6], MSWord);
        SimpleReplace('$AI7', StringGrid1.Cells[4, 7], MSWord);
        SimpleReplace('$AI8', StringGrid1.Cells[4, 8], MSWord);
        SimpleReplace('$AI9', StringGrid1.Cells[4, 9], MSWord);
        SimpleReplace('$AI_10', StringGrid1.Cells[4, 10], MSWord);
        SimpleReplace('$AI_11', StringGrid1.Cells[4, 11], MSWord);
        SimpleReplace('$AI_12', StringGrid1.Cells[4, 12], MSWord);

        SimpleReplace('$Total1', Label5.Caption, MSWord);
        totastr := FullSum.SumNumToFullUA(StrToFloat(Edit4.Text));
        SimpleReplace('$totastr', totastr, MSWord);
        SimpleReplace('$pt', FloatToStr(Round(StrToFloat(Edit4.Text)/StrToFloat(Label5.Caption)*100)), MSWord);
        SimpleReplace('$delay', FloatToStr(dDelayPercent), MSWord);
        SimpleReplace('$Total2', Edit4.Text, MSWord);
        SimpleReplace('$percente', Label2.Caption, MSWord);
        SimpleReplace('$credit', Label8.Caption, MSWord);
        SimpleReplace('$backcredit', Label6.Caption, MSWord);
        SimpleReplace('$fioklient', Label7.Caption, MSWord);
        SimpleReplace('$fiosotryd', client.Text, MSWord);
        cent := FloatToStr(Round(Frac(StrToFloat(Label5.Caption))*100));
        SimpleReplace('$cent', cent, MSWord);

        WriteAction('11|' + Edit1.Text);

        Close;
        form1.SearchContract;

          MSWord.DisplayAlerts := False;
          MSWord.Visible := True;
          MSWord.Activate;
           }
          end;
          Close;
        form1.SearchContract;
        end;
      end;
    end;
  end;
end;
end;




procedure TnewContract.Button3Click(Sender: TObject);
begin
  mySnapShot(Edit1.Text);
  bEditMark := false;
  close;
end;

procedure TnewContract.Button4Click(Sender: TObject);
var
addClientDate : TDate;
addlotoDate : TDate;
begin
  if (Lototron = 1) then begin

        Edit5.Text := '';
      Edit6.Text := '';
      lototron := 0;
      Label18.Hide;
      Label19.Hide;
      Label20.Hide;
      Edit5.Hide;
      Edit6.Hide;


    //ShowMessage(DateToStr(addClientDate));

      end else begin
      lototron := 1;
      Label18.Show;
      Label19.Show;
      Label20.Show;
      Edit5.Text := '';
      Edit6.Text := '';
      Edit5.Show;
      Edit6.Show;
      end;
end;



procedure TnewContract.Button5Click(Sender: TObject);
begin
  if (flaer) then begin
    flaer:=False;
    button5.Caption := 'ВЫКЛЮЧЕНО';
    panel1.Color := clRed;
  end else begin
    flaer:=True;
    button5.Caption := 'ВКЛЮЧЕНО';
    panel1.Color := clGreen;
  end;

  if(not chk1.Checked) then begin
    StringGrid1Exit(self);
  end else begin
    strngrd1Exit(self);
  end;
  //resetPriceGrid;
//  resetEstimatedGrid;

end;

procedure TnewContract.Edit4Change(Sender: TObject);
var
  dPercentTmp, res, dReducePercent, dFixPercent: double;
  DateTmp, day_end: TDateTime;
  num_day: byte;
  IniFile: TIniFile;
  bReduceDayPercent: byte;
  dSaleOnGram, dSum, percentPerDay, percentTotal: double;
  i: Byte;
  z: Integer;

  j: Integer;
  count: Integer;
  numOfDay, sumStart, sumEnd, percentFromXML: string;
begin
  if not (bEditMark) then
  begin
    dSaleSum := 0;
    try
      if bSaleGroup <> 1 then
      begin
        if bSaleGroup <> 0 then begin
          IniFile := TIniFile.Create('c:\pawn\sale.ini');
          bCreditBodyPercentTmp := 0;
          IniFile.Free;
        end;
      i := 1;
      while i < 13 do begin
        if StringGrid1.Cells[8, i] <> '' then begin
          dSaleOnGram := StrToFloat(StringGrid1.Cells[3, i]) / 585 *
          bCreditBodyPercentTmp;
          dSaleOnGram := StrToFloat(StringGrid1.Cells[7, i]) * dSaleOnGram;
          dSaleSum := dSaleSum + dSaleOnGram;
          if StringGrid1.Cells[0, i] = '' then begin
            nameProduct := False;
          end else
            nameProduct := True;
          end;
        Inc(i);
        end;
      end;

      if (Edit2.Text <> '') and (Edit4.Text <> '') then begin
        if (Edit2.Text = '1') then begin
          dSum := StrToFloat(Label5.Caption) * bCreditBodyPercentOneDay / 100 + dSaleSum;
        end else begin
          dSum := StrToFloat(Label5.Caption) * bCreditBodyPercent / 100 +
            dSaleSum;
        end;
        dSum := round(dSum * 100) / 100;
        {xmldcmntXMLD.LoadFromFile('c:\pawn\conf\tarif.xml');
        xmldcmntXMLD.Active := true;
        count :=
          xmldcmntXMLD.DocumentElement.ChildNodes['ROWDATA'].ChildNodes.Count;
        z := 0;

        while z < count do
        begin
          if(VarToStr(xmldcmntXMLD.DocumentElement.ChildNodes['ROWDATA'].ChildNodes[z].Attributes['id']) = IntToStr(contractTypeGroup)) then begin
            j := 0;

            while j < xmldcmntXMLD.DocumentElement.ChildNodes['ROWDATA'].ChildNodes[z].ChildNodes['tarifPercent'].ChildNodes.Count do begin
              numOfDay :=
                VarToStr(xmldcmntXMLD.DocumentElement.ChildNodes['ROWDATA'].ChildNodes[z].ChildNodes['tarifPercent'].ChildNodes[j].ChildNodes['numofday'].NodeValue);
              sumStart :=
                VarToStr(xmldcmntXMLD.DocumentElement.ChildNodes['ROWDATA'].ChildNodes[z].ChildNodes['tarifPercent'].ChildNodes[j].ChildNodes['sum_begin'].NodeValue);
              sumEnd :=
                VarToStr(xmldcmntXMLD.DocumentElement.ChildNodes['ROWDATA'].ChildNodes[z].ChildNodes['tarifPercent'].ChildNodes[j].ChildNodes['sum_end'].NodeValue);
              percentFromXML :=
                VarToStr(xmldcmntXMLD.DocumentElement.ChildNodes['ROWDATA'].ChildNodes[z].ChildNodes['tarifPercent'].ChildNodes[j].ChildNodes['percent'].NodeValue);
              if StrToInt(Edit2.Text) = StrToInt(numOfDay) then begin
                if (StrToFloat(Edit4.Text) >= StrToInt(sumStart)) and
                  (StrToFloat(Edit4.Text) <= StrToInt(sumEnd)) then begin
                  percentPerDay := StrToFloat(percentFromXML);
                  //percentTotal := percentPerDay * StrToFloat(Edit2.Text);
                end;
              end;
              Inc(j);
            end;

            z := count;
          end
          else begin
            Inc(z);
          end;
        end;

        xmldcmntXMLD.Active := false;
        }
        // ShowMessage(intToStr(contractTypeGroup));
        percentPerDay := MyUtils.getPercentPerDay(contractTypeGroup,StrToFloat(Edit4.Text), StrToInt(Edit2.Text), deliverer.getId);

        if(flaer) then percentPerDay := 0.3;

        if chk2.Checked then
          percentPerDay := setSpecialConditions(percentPerDay);
        // ShowMessage(intToStr(bSaleGroup));
        if bSaleGroup > 1 then begin
          if bSaleGroup = 5 then begin
            IniFile := TIniFile.Create('c:\pawn\sale.ini');
            dFixPercent := IniFile.ReadFloat(sSaleGroup, 'FixPercent', 0);
            IniFile.Free;
            Label2.Caption := FloatToStr(dFixPercent);
            Label3.Caption := FloatToStr(dFixPercent * StrToFloat(Edit2.Text));
          end else begin
            IniFile := TIniFile.Create('C:\Pawn\sale.ini');
            // никаких скидок
            sSaleGroup := 'Group'+IntToStr(bSaleGroup);
            dReducePercent := IniFile.ReadFloat(sSaleGroup, 'ReducePercent', 0);
            IniFile.Free;
            Label2.Caption := FloatToStr(percentPerDay - dReducePercent);
            // ShowMessage('1864 NewContract '+sSaleGroup+ ' ' + FloatToStr(dReducePercent));
          //  Label2.Caption := FloatToStr(percentPerDay);
            Label3.Caption := FloatToStr(StrToFloat(Label2.Caption) *
              StrToFloat(Edit2.Text));
          end;

        end
        else
        begin

          if bSaleGroup = 1 then
          begin
            IniFile := TIniFile.Create('c:\pawn\sale.ini');
            bReduceDayPercent := IniFile.ReadInteger(sSaleGroup,
              'ReduceDayPercent', 0);
            IniFile.Free;
             Label2.Caption := FloatToStr(percentPerDay);
            //Label2.Caption := FloatToStr(percentPerDay - dReducePercent);
            Label3.Caption := FloatToStr(StrToFloat(Label2.Caption) *
              StrToFloat(Edit2.Text));

            if StrToFloat(Edit2.Text) - bReduceDayPercent <= 1 then
              Label3.Caption := FloatToStr(percentPerDay)
            else
              Label3.Caption := FloatToStr(percentPerDay *
                (StrToFloat(Edit2.Text) - bReduceDayPercent));

            ADOQuery11.SQL.Clear;
            ADOQuery11.close;
          end
          else
          begin
            Label2.Caption := FloatToStr(percentPerDay);
            Label3.Caption := FloatToStr(percentPerDay *
              StrToFloat(Edit2.Text));
          end;

        end;

        if (StrToFloat(Edit4.Text) > StrToFloat(Label5.Caption) *
          bCreditBodyPercent / 100 + dSaleSum + dSaleSum) and (Edit2.Text <> '1')
          then
        begin
          Edit4.Text := FloatToStr(Round((StrToFloat(Label5.Caption) *
            bCreditBodyPercent / 100 + dSaleSum) * 100) / 100);
        end;
        if (StrToFloat(Edit4.Text) > StrToFloat(Label5.Caption) *
          bCreditBodyPercentOneDay / 100 + dSaleSum + dSaleSum) and (Edit2.Text =
          '1') then
        begin
          Edit4.Text := FloatToStr(Round((StrToFloat(Label5.Caption) *
            bCreditBodyPercentOneDay / 100 + dSaleSum) * 100) / 100);
        end;

        Button2.Enabled := True;
        DateTmp := DOpenDay;
        num_day := StrToInt(Edit2.Text) - 1;
        day_end := IncDay(DateTmp, num_day);
        Label4.Caption := DateToStr(day_end);
        dPercentTmp := StrToFloat(Edit4.Text) * StrToFloat(Label3.Caption) /
          100;
        dPercentTmp := round(dPercentTmp * 100) / 100;
        if (ComboBox3.ItemIndex = 1) then begin
          Label8.Caption := FloatToStr(Round((dPercentTmp-(dPercentTmp/10))*100)/100);
          Label6.Caption := FloatToStr((Round((dPercentTmp-(dPercentTmp/10))*100)/100)+StrToFloat(Edit4.Text));
        end else begin
          Label8.Caption := FloatToStr(dPercentTmp);
          Label6.Caption := FloatToStr(dPercentTmp+StrToFloat(Edit4.Text));
        end;
        sEdit1.Text := FloatToStr( Round( ( StrToFloat(Edit4.Text) / dollarPrice )*100) / 100 );
      end
      else
      begin
        Label2.Caption := '';
        Label3.Caption := '';
      end;

    except
      on e: Exception do
      begin
        ShowMessage('Непредвиденная ошибка. Обратитесь в техподдержку');
      end;
    end;
  end;
end;

procedure TnewContract.Edit6Change(Sender: TObject);
var
edit6text : Integer;
begin
if (Edit6.Text <> '') then begin

  edit6text := StrToInt(Edit6.Text);
  if (edit6text > 100) then begin
  edit6.Text := '';
  edit6.Color := clRed;

  end;
end;
end;

procedure TnewContract.Edit6Exit(Sender: TObject);
var
  edit6text : Integer;
begin
if (Edit6.Text <> '') then begin
  edit6text := StrToInt(Edit6.Text);
    if (edit6text > 100) OR (edit6text < 2) then begin
      edit6.Text := '';
      edit6.Color := clRed;
    end else begin
      edit6.Color := clWhite;
    end;
end;
end;

procedure TnewContract.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  bCreditBodyPercentTmp := 0;
  Action := caFree;
  newContract_form.newContract := nil;
  codeSMS.Form4.Close
end;

procedure TnewContract.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
  R: TRect;
  i,b  :byte;
  weightInfo : Double;
begin
  weightInfo := 0;
  if  (ACol = 2) or (ACol = 5) or (ACol = 6) then
      StringGrid1.Options := StringGrid1.Options + [goEditing]
  else
      StringGrid1.Options := StringGrid1.Options - [goEditing];

  for i := 1 to 12 do
  begin
    // Подсчёт Веса
    if (Acol = 6) then begin
      if (StringGrid1.Cells[5, i] <> '') then  begin
        weightInfo := weightInfo +  StrToFloat(StringGrid1.Cells[5, i]);

        {if weightInfo > 1 then begin
        for b := 1 to 12 do
          begin
          StringGrid1.cells[7, b];
          StringGrid1.Cells[4, b]:= '111';
          end;

        end;  }

        Label12.Caption := FloatToStr(weightInfo);
      end;
    end;

    //
    if (ACol = 8) and (ARow = i) then
    begin
   //   ShowMessage('now');
    //  StringGrid1.Col := 6;
    //  StringGrid1.Row := 1;
      //StringGrid1.Options:=StringGrid1.Options+[goAlwaysShoweEditor];
    //  StringGrid1.SetFocus;
     // with StringGrid1 do
      selecte.SetCaretPosition(StringGrid1, 6, 1, 2);
      //SetCaretPosition(StringGrid1, 4, 5, 2);
     // StringGrid1SelectCell(self,20,5);
      StringGrid1.SetFocus;
      if (StringGrid1.Cells[4, i] <> '') and (StringGrid1.Cells[6, i] <> '')
        then
      begin
        if StrToFloat(StringGrid1.Cells[5, i]) < StrToFloat(StringGrid1.Cells[6,
          i]) then
        begin
          ShowMessage('Ошибка. Вес вставки не может превышать общий вес изделия');
          StringGrid1.Cells[7, i] := '';
          StringGrid1.Cells[8, i] := '';

        end
        else
        begin

          StringGrid1.Cells[8, i] :=
            FloatToStr(Round(StrToFloat(StringGrid1.Cells[4, i]) *
            StrToFloat(StringGrid1.Cells[7, i]) * 100) / 100);
          //StringGrid1.Options := StringGrid1.Options - [goEditing];
        end;
      end;
    end;
 {   if ((ACol = 1) and (ARow = i)) and (StringGrid1.Cells[0, i] <> '') then
    begin
      chk1.Enabled := false;
      R := StringGrid1.CellRect(ACol, ARow);
      R.Left := R.Left + StringGrid1.Left;
      R.Right := R.Right + StringGrid1.Left;
      R.Top := R.Top + StringGrid1.Top;
      R.Bottom := R.Bottom + StringGrid1.Top;
      ComboBox1.Left := R.Left + 1;
      ComboBox1.Top := R.Top + 1;
      ComboBox1.Width := (R.Right + 1) - R.Left;
      ComboBox1.Height := (R.Bottom + 1) - R.Top;
      ComboBox1.Visible := True;
      ComboBox1.SetFocus;
      ComboBox1.ItemIndex := 0;
    end;
    }
    if ((ACol = 3) and (ARow = i)) and (StringGrid1.Cells[0, i] <> '') then
    begin
      chk1.Enabled := false;
      //PROBA

      {Ширина и положение ComboBox должно соответствовать ячейке StringGrid}
      R := StringGrid1.CellRect(ACol, ARow);
      R.Left := R.Left + StringGrid1.Left;
      R.Right := R.Right + StringGrid1.Left;
      R.Top := R.Top + StringGrid1.Top;
      R.Bottom := R.Bottom + StringGrid1.Top;
      ComboBox2.Left := R.Left + 1;
      ComboBox2.Top := R.Top + 1;
      ComboBox2.Width := (R.Right + 1) - R.Left;
      ComboBox2.Height := (R.Bottom + 1) - R.Top; {Покажем combobox}
      ComboBox2.Visible := True;
      //ShowMessage('hhi');
      ComboBox2.SetFocus;
    end;
    if ((ACol = 0) and (ARow = i)) then
    begin
      chk1.Enabled := false;
      {Ширина и положение ComboBox должно соответствовать ячейке StringGrid}
      cbb1.Style := csDropDown;
      cbb1.Height := 19;
      R := StringGrid1.CellRect(ACol, ARow);
      R.Left := R.Left + StringGrid1.Left;
      R.Right := R.Right + StringGrid1.Left;
      R.Top := R.Top + StringGrid1.Top;
      R.Bottom := R.Bottom + StringGrid1.Top;
      cbb1.Left := R.Left + 1;
      cbb1.Top := R.Top + 1;
      cbb1.Width := (R.Right + 1) - R.Left;
      cbb1.Height := (R.Bottom + 1) - R.Top; {Покажем combobox}
      cbb1.Visible := True;
      //SendMessage(cbb1.Handle, CB_SHOWDROPDOWN, 1, 0);
      //cbb1.DroppedDown := True;
      cbb1.SetFocus;
    end;
    if ((ACol = 4) and (ARow = i)) then
    begin
      {chk1.Enabled := false;
      ADOQuery11.SQL.Add('SELECT price_test FROM test_value WHERE name_test=:Qtest_value');
      ADOQuery11.Parameters.ParamByName('Qtest_value').Value :=
        StringGrid1.Cells[3, i];
      ADOQuery11.Open;
      StringGrid1.Cells[4, i] := ADOQuery11.Fields[0].AsString;
      ADOQuery11.SQL.Clear;
      ADOQuery11.close;
      //StringGrid1.Options := StringGrid1.Options - [goEditing];
      }
      if((StringGrid1.Cells[1,i] <> '') AND (StringGrid1.Cells[3,i] <> '')) Then begin
        // need send contractTypeGroup
        StringGrid1.Cells[4, i] :=  getTestPrice(StringGrid1.Cells[3,i], newContract.deliverer.getId);
      end;
    end;
    CanSelect := True;
  end;
end;

procedure TnewContract.ComboBox1Change(Sender: TObject);
begin
  if chk1.Checked then
  begin
    ComboBox1.ItemIndex := 1;
   // ShowMessage('NEWCONTRACT 1412 UP');
    strngrd1.Cells[strngrd1.Col, strngrd1.Row] :=
      ComboBox1.Items[ComboBox1.ItemIndex];
    ComboBox1.Visible := False;
    strngrd1.SetFocus;
    chk1.Enabled := true;
  end
  else
  begin
  //  ComboBox1.ItemIndex := 0;
    StringGrid1.Cells[1, StringGrid1.Row] :=
      ComboBox1.Items[ComboBox1.ItemIndex];
    ComboBox1.Visible := False;
    StringGrid1.SetFocus;
   // chk1.Enabled := true;
   // ShowMEssage(ComboBox1.Items[Combobox1.ItemIndex]);
  end;
end;

procedure TnewContract.ComboBox1Exit(Sender: TObject);
begin
  if chk1.Checked then
  begin
    //strngrd1.Cells[strngrd1.Col, strngrd1.Row] :=
    //  ComboBox1.Items[ComboBox1.ItemIndex];
    //ComboBox1.Visible := False;
    //strngrd1.SetFocus;
    //chk1.Enabled := true;
  end
  else
  begin
    StringGrid1.Cells[StringGrid1.Col, StringGrid1.Row] :=
      ComboBox1.Items[ComboBox1.ItemIndex];
    ComboBox1.Visible := False;
    StringGrid1.SetFocus;
    //chk1.Enabled := true;
  end;
end;

procedure TnewContract.ComboBox2Change(Sender: TObject);
begin
  StringGrid1.Cells[StringGrid1.Col, StringGrid1.Row] :=
    ComboBox2.Items[ComboBox2.ItemIndex];
  ComboBox2.Visible := False;
  StringGrid1.SetFocus;
  chk1.Enabled := true;

end;

procedure TnewContract.ComboBox2Exit(Sender: TObject);
begin
  StringGrid1.Cells[StringGrid1.Col, StringGrid1.Row] :=
    ComboBox2.Items[ComboBox2.ItemIndex];
  ComboBox2.Visible := False;
  StringGrid1.SetFocus;
  chk1.Enabled := true;
end;

procedure TnewContract.StringGrid1Exit(Sender: TObject);
var
i : Integer;
d : Double;
begin
  Label5.Caption := '0';
  if (StringGrid1.Cells[8,1] <> '')  then begin
    sum_s := 1;
    ResetPriceGrid();
    resetEstimatedGrid;
    edit2.Text := '';
    label5.Caption := '0';

    for i := 1 to 12 do begin
      if (StringGrid1.Cells[5, i] <> '') then begin
         d := StrToFloat(StringGrid1.Cells[5, i]);
         StringGrid1.Cells[5, i] := FloatToStr(d);
      end;
      if (StringGrid1.Cells[6, i] <> '') then begin
         d := StrToFloat(StringGrid1.Cells[6, i]);
         StringGrid1.Cells[6, i] := FloatToStr(d);
      end;
      if (StringGrid1.Cells[8,i] <> '') then begin
        if (StringGrid1.Cells[2,i] = '')  then begin
          ShowMessage('Вы не указали количество изделий в договоре!! По умолчанию программа установила: 1');
          StringGrid1.Cells[2,i] := '1';
        end;
      end;

      if ((StringGrid1.Cells[5, i] <> '') AND (StringGrid1.Cells[6 , i] <> '') AND (StringGrid1.Cells[8 , i] <> '')) then  begin
        if StrToFloat(StringGrid1.Cells[ 5,i ]) < StrToFloat(StringGrid1.Cells[6 , i]) then begin
          ShowMessage('Ошибка. Вес вставки не может превышать общий вес изделия');
          StringGrid1.Cells[7, StringGrid1.Selection.Bottom] := '';
          StringGrid1.Cells[8, StringGrid1.Selection.Bottom] := '';
          StringGrid1.Cells[6, StringGrid1.Selection.Bottom ] := '';
        end else begin
          Label5.Caption := FloatToStr(StrToFloat(Label5.Caption) + StrToFloat(StringGrid1.Cells[8, i]));
        end;
      end;

    end;

  end;


end;
 // StringGrid1.Cells[4, i] := getTestPrice(StringGrid1.Cells[3, i]);
 //     if (StringGrid1.Cells[7,i] <> '' ) then begin
 //       StringGrid1.Cells[8, i] :=
 //       FloatToStr(Round(StrToFloat(StringGrid1.Cells[4, i]) *
 //       StrToFloat(StringGrid1.Cells[7, i]) * 100) / 100);
procedure TnewContract.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', ',', #8]) then
    Key := #0;
end;

procedure TnewContract.Edit2Change(Sender: TObject);
var
  IniFile: TIniFile;
  i: Byte;
  bReduceDayPercent: byte;
  dSaleOnGram: double;
  dSum: Double;
  weightInfo : double;
begin
 // ShowMessage(BoolToStr(bEditMark));
 if (chk1.Checked = true) then begin
 if Edit2.Text <> '' then
    begin
      if (StrToInt(Edit2.Text) > 30) or (StrToInt(Edit2.Text) = 0) then
        Edit2.Text := '30';
      if (Label5.Caption <> '0') then
      begin
        if (StrToInt(Edit2.Text) > 1) then
        begin
          dSum := StrToFloat(Label5.Caption) * bCreditBodyPercent / 100 +
            dSaleSum;
        end
        else
        begin
          dSum := StrToFloat(Label5.Caption) * bCreditBodyPercentOneDay / 100 +
            dSaleSum;
        end;
      end;
    end;
    dSaleSum := 0;
    if (Edit2.Text = '1') then bCreditBodyPercentTmp := 0;
    if bSaleGroup <> 1 then
    begin
    if bSaleGroup <> 0 then begin
      if (chk2.Checked) and (Edit2.Text <> '1') then begin
        IniFile := TIniFile.Create('c:\pawn\sale.ini');
        bCreditBodyPercentTmp := IniFile.ReadInteger('Group6','EnaLargeCreditBody', 0);
        IniFile.Free;
      end else bCreditBodyPercentTmp := 0;
   {
    IniFile := TIniFile.Create('c:\pawn\sale.ini');
    bCreditBodyPercentTmp := bCreditBodyPercentTmp + IniFile.ReadInteger(sSaleGroup,
      'EnaLargeCreditBody', 0);
    IniFile.Free;
    }
    end;
      i := 1;

    end;
    if (Edit2.Text = '1') then
    begin
      dSum := StrToFloat(Label5.Caption) * bCreditBodyPercentOneDay / 100 +
        dSaleSum;
    end
    else
    begin
      dSum := StrToFloat(Label5.Caption) * bCreditBodyPercent / 100 + dSaleSum;
    end;
    dSum := round(dSum * 100) / 100;
    Label12.Caption := FloatToStr(weightInfo);
    Edit4.Text := FloatToStr(dSum);
    Edit4Change(Edit2);

 end else begin


  weightInfo := 0;
  if not (bEditMark) then
  begin
    //ShowMessage(FloatToStr(myUtils.getOldReducePercent(4)));
    if Edit2.Text <> '' then
    begin
      if (StrToInt(Edit2.Text) > 30) or (StrToInt(Edit2.Text) = 0) then
        Edit2.Text := '30';
      if (Label5.Caption <> '0') then
      begin
        if (StrToInt(Edit2.Text) > 1) then
        begin
          dSum := StrToFloat(Label5.Caption) * bCreditBodyPercent / 100 +
            dSaleSum;
        end
        else
        begin
          dSum := StrToFloat(Label5.Caption) * bCreditBodyPercentOneDay / 100 +
            dSaleSum;
        end;
      end;
    end;
    dSaleSum := 0;
    if (Edit2.Text = '1') then bCreditBodyPercentTmp := 0;
    if bSaleGroup <> 1 then
    begin
    if bSaleGroup <> 0 then begin
      if (chk2.Checked) and (Edit2.Text <> '1') then begin
        IniFile := TIniFile.Create('c:\pawn\sale.ini');
        bCreditBodyPercentTmp := IniFile.ReadInteger('Group6','EnaLargeCreditBody', 0);
        IniFile.Free;
      end else bCreditBodyPercentTmp := 0;
   {
    IniFile := TIniFile.Create('c:\pawn\sale.ini');
    bCreditBodyPercentTmp := bCreditBodyPercentTmp + IniFile.ReadInteger(sSaleGroup,
      'EnaLargeCreditBody', 0);
    IniFile.Free;
    }
    end;
      i := 1;
      while i < 13 do
      begin
        if StringGrid1.Cells[8, i] <> '' then
        begin
          dSaleOnGram := StrToFloat(StringGrid1.Cells[3, i]) / 585 *
            bCreditBodyPercentTmp;
          dSaleOnGram := StrToFloat(StringGrid1.Cells[7, i]) * dSaleOnGram;
          dSaleSum := dSaleSum + dSaleOnGram;
          weightInfo := weightInfo +  StrToFloat(StringGrid1.Cells[5, i]);
        end;
        Inc(i);
      end;
    end;
    if (Edit2.Text = '1') then
    begin
      dSum := StrToFloat(Label5.Caption) * bCreditBodyPercentOneDay / 100 +
        dSaleSum;
    end
    else
    begin
      dSum := StrToFloat(Label5.Caption) * bCreditBodyPercent / 100 + dSaleSum;
    end;
    dSum := round(dSum * 100) / 100;
    Label12.Caption := FloatToStr(weightInfo);
    Edit4.Text := FloatToStr(dSum);
    Edit4Change(Edit2);
  end;
 end;
end;

procedure TnewContract.Edit2Exit(Sender: TObject);
begin
checkDays();
Edit4Change(Edit2);
end;

procedure TnewContract.StringGrid1KeyPress(Sender: TObject; var Key: Char);
var
  f : Double;
begin
  if (Key in ['.']) then
    Key := ',';
end;

procedure TnewContract.cbb1Change(Sender: TObject);
begin
  StringGrid1.Cells[StringGrid1.Col, StringGrid1.Row] :=
    cbb1.Items[cbb1.ItemIndex];
  cbb1.Visible := False;

  chk1.Enabled := true;
  if (contractTypeGroup = 777) then  begin
    StringGrid1.Cells[1, StringGrid1.Row] := 'Серебро';
  end else begin
    StringGrid1.Cells[1, StringGrid1.Row] := 'Золото';
  end;



   StringGrid1.Cells[2,StringGrid1.Row] := '1';
   cbb1.ItemIndex := 0;
   StringGrid1.Col := 2;
   StringGrid1.SetFocus;

end;

procedure TnewContract.cbb1Exit(Sender: TObject);
begin
  
  StringGrid1.Cells[StringGrid1.Col, StringGrid1.Row] :=
    cbb1.Items[cbb1.ItemIndex];
  cbb1.Visible := False;
  StringGrid1.SetFocus;
end;

procedure TnewContract.StringGrid1SetEditText(Sender: TObject; ACol,
  ARow: Integer; const Value: string);
var
  R: TRect;
  i: byte;
begin
  for i := 1 to 13 do
  begin
    if ((ACol = 0) and (ARow = i)) then
    begin

      chk1.Enabled := false;
      {Ширина и положение ComboBox должно соответствовать ячейке StringGrid}
      R := StringGrid1.CellRect(ACol, ARow);
      R.Left := R.Left + StringGrid1.Left;
      R.Right := R.Right + StringGrid1.Left;
      R.Top := R.Top + StringGrid1.Top;
      R.Bottom := R.Bottom + StringGrid1.Top;
      cbb1.Left := R.Left + 1;
      cbb1.Top := R.Top + 1;
      cbb1.Width := (R.Right + 1) - R.Left;
      cbb1.Height := (R.Bottom + 1) - R.Top; {Покажем combobox}
      cbb1.Visible := True;
      cbb1.Style := csSimple;
      cbb1.Height := 100;
      cbb1.SetFocus;
    end;
  end;
end;

procedure TnewContract.chk1Click(Sender: TObject);
var
  IniFile: TIniFile;
begin
  if (chk1.Checked) then
  begin
    StringGrid1.Visible := False;
    strngrd1.Visible := True;
    bCreditBodyPercent := 100;
  end
  else
  begin
    strngrd1.Visible := false;
    StringGrid1.Visible := True;
    IniFile := TIniFile.Create('c:\pawn\options.ini');
    bCreditBodyPercent := IniFile.ReadInteger('Contract', 'BodyPercent', 82);
    IniFile.Free;
  end;
end;

procedure TnewContract.strngrd1Exit(Sender: TObject);
begin
  Label5.Caption := '0';
  while (strngrd1.Cells[3, sum_s] <> '') do
  begin
    Label5.Caption := FloatToStr(StrToFloat(Label5.Caption) +
      StrToFloat(strngrd1.Cells[3, sum_s]));
    Inc(sum_s);
  end;
  sum_s := 1;
  if (edit2.Text <> '') then Edit2Change(self);

end;

procedure TnewContract.strngrd1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
  R: TRect;
  i: byte;
begin
  for i := 1 to 6 do
  begin
    if ((ACol = 1) and (ARow = i)) then
    begin
      //chk1.Enabled := false;
      {Ширина и положение ComboBox должно соответствовать ячейке StringGrid}
      //R := strngrd1.CellRect(ACol, ARow);
      //R.Left := R.Left + strngrd1.Left;
      //R.Right := R.Right + strngrd1.Left;
      //R.Top := R.Top + strngrd1.Top;
      //R.Bottom := R.Bottom + strngrd1.Top;
      //ComboBox1.Left := R.Left + 1;
      //ComboBox1.Top := R.Top + 1;
      //ComboBox1.Width := (R.Right + 1) - R.Left;
      //ComboBox1.Height := (R.Bottom + 1) - R.Top; {Покажем combobox}
      //ComboBox1.Visible := True;
      //ComboBox1.SetFocus;
      ComboBox1.ItemIndex := 1;
    end;
  end;
end;

procedure TnewContract.strngrd1KeyPress(Sender: TObject; var Key: Char);
begin
  if length(strngrd1.Cells[strngrd1.Col, strngrd1.Row]) = 25 then
    key := #0;
  if (Key in ['"']) then
    Key := #39;
end;

procedure TnewContract.chk2Click(Sender: TObject);
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create('c:\pawn\sale.ini');

  if chk2.Checked then
    bCreditBodyPercentTmp := bCreditBodyPercentTmp + IniFile.ReadInteger('Group6',
      'EnaLargeCreditBody', 0)
  else
    bCreditBodyPercentTmp := bCreditBodyPercentTmp - IniFile.ReadInteger('Group6',
      'EnaLargeCreditBody', 0);

  IniFile.Free;
  Edit2Change(chk2);
end;

procedure TnewContract.ComboBox3Change(Sender: TObject);
begin
Edit2Change(ComboBox3);
end;

procedure TnewContract.StringGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  i : Integer;
  f : Double;
begin

  if (StringGrid1.Selection.Left = 2) then begin
    if not (Key in [48..57, 96..105]) then StringGrid1.Cells[2,StringGrid1.Row] := '1';
  end;

  if (StringGrid1.Selection.Left = 8) then begin
     ResetPriceGrid();
  end;

  if (StringGrid1.Selection.Left = 5) then begin
    if NOT (TryStrToFloat(StringGrid1.Cells[5,StringGrid1.Row],f)) then begin
      StringGrid1.Cells[5,StringGrid1.Row] := '0';
    end;
  end;

  if (StringGrid1.Selection.Left = 6) then begin
    if NOT (TryStrToFloat(StringGrid1.Cells[6,StringGrid1.Row],f)) then begin
      StringGrid1.Cells[6,StringGrid1.Row] := '0';
    end;
  end;

  if (StringGrid1.Selection.Left = 6) then begin
    if (StringGrid1.Cells[6, StringGrid1.Selection.Bottom] = '') then begin
      StringGrid1.Cells[6, StringGrid1.Selection.Bottom] := '0' ;
    end;
    if (StringGrid1.Cells[4, StringGrid1.Selection.Bottom] <> '') and (StringGrid1.Cells[5, StringGrid1.Selection.Bottom] <> '') then begin
      if StrToFloat(StringGrid1.Cells[5, StringGrid1.Selection.Bottom]) < StrToFloat(StringGrid1.Cells[6,StringGrid1.Selection.Bottom]) then begin
        ShowMessage('Ошибка. Вес вставки не может превышать общий вес изделия');
        StringGrid1.Cells[7, StringGrid1.Selection.Bottom] := '';
        StringGrid1.Cells[8, StringGrid1.Selection.Bottom] := '';
        StringGrid1.Cells[6, StringGrid1.Selection.Bottom ] := '';
      end else begin
        netW:=0;
        if 16 > 15 then begin //   Эпический ИФ ;))
          resetEstimatedGrid;
        //ВАЖНЫЙ МОМЕНТ ПОДСЧЁТА ЧИСТОГО ВЕСА
          for i := 1 to 12 do begin
            if (StringGrid1.Cells[7, i] <> '') then  begin
              netW := netW + StrToFloat(StringGrid1.Cells[7, i]);
              label15.Caption := FloatToStr(netW);
            end;
          end;
          //ТУТ МЕНЯЕМ ЦЕНУ НА ЗОЛОТО И ПЕРЕСЧИТЫВАЕМ ОЦЕНКУ
          // ShowMessage(IntToStr(ContractTypeGroup));
          ContractTypeGroup := getContractTypeGroup(contractType,netW);

          ResetPriceGrid();
          Edit2.Text := '';
          Edit4.Text := '';
          Label8.Caption := '0';
          Label6.Caption := '0';
          Label13.Caption := myUtils.getConditionName(ContractTypeGroup);
          newContract_form.newContract.Caption := 'Новый договор = ' +  Label13.Caption;
        end else begin
          StringGrid1.Cells[7, StringGrid1.Selection.Bottom] :=
            FloatToStr(StrToFloat(StringGrid1.Cells[5, StringGrid1.Selection.Bottom]) - StrToFloat(StringGrid1.Cells[6, StringGrid1.Selection.Bottom]));
          StringGrid1.Cells[8, StringGrid1.Selection.Bottom] :=
            FloatToStr(Round(StrToFloat(StringGrid1.Cells[4, StringGrid1.Selection.Bottom]) *
            StrToFloat(StringGrid1.Cells[7, StringGrid1.Selection.Bottom]) * 100) / 100);
           // netW := netW + StrToFloat(StringGrid1.Cells[7, StringGrid1.Selection.Bottom]);
        end;
      end;
    end;
  end;
end;

procedure TnewContract.StringGrid1Enter(Sender: TObject);
begin
  if (StringGrid1.Selection.Left = 3) then begin
    chk1.Enabled := false;
    if(StringGrid1.Cells[0,StringGrid1.Row] <> '') then begin
     // StringGrid1.Cells[4, StringGrid1.Selection.Bottom] :=
      //  getTestPrice(StringGrid1.Cells[3, StringGrid1.Selection.Bottom], newContract.deliverer.getId);
    end;
  end;
  if (StringGrid1.Selection.Left = 1) then begin
    StringGrid1.Cells[2, StringGrid1.Selection.Bottom] := '1';
  end;
end;

{ TGridCracker }

procedure TGridCracker.SetCaretPosition(Grid: TStringGrid; col, row,
  x_pos: Integer);
begin
  Grid.Col := Col;
  Grid.Row := Row;
  with TGridCracker(Grid) do
  InplaceEditor.SelStart := x_pos;
end;

end.




