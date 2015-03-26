unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ADODB, RpCon, RpConDS, RpDefine, RpRave, Grids,
  DBGrids, DBCtrls, StdCtrls, ComCtrls, ExtCtrls, Buttons, xmldom, XMLIntf,
  msxmldom, XMLDoc, TabNotBk, IniFiles, ShellAPI, Mask,
  RunExtObject, Extensions, CashBook, frxClass, frxDBSet, MyUtils, Order,
  FullSum, EmployeeEntity, GlobalVar, ProductADO, ReportXLS, Reports, selectContractTypeForm,
  exchangeRepawnContractType, LogBookEmployee, ComObj, exitForm,selectLoyalContractTypeForm,
  DanUtils, frxExportPDF, DiscountStore, Discounts, contractUtils, enLoyalty, Loyals, LoyalStore,
  ShowContractDateEnd, DANADO, RpBase, RpFiler, RpRender, RpRenderPDF,
  RpRenderRTF, RpRenderHTML, RpRenderText, reportDeliverer,enArrears,enPasport,enOrder;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;

    N15: TMenuItem;
    RvDataSetConnection3: TRvDataSetConnection;
    RvProject2: TRvProject;
    RvProject3: TRvProject;
    N16: TMenuItem;
    ADODataSet1: TADODataSet;
    ADOQDay1: TADOQuery;
    ADOQDay2: TADOQuery;
    ADOQDay3: TADOQuery;
    RvProject1: TRvProject;
    RvDataSetConnection1: TRvDataSetConnection;
    RvDataSetConnection2: TRvDataSetConnection;
    N17: TMenuItem;
    StatusBar1: TStatusBar;
    StringGrid1: TStringGrid;
    Splitter1: TSplitter;
    Button1: TButton;
    GroupBox1: TGroupBox;
    ADODataSet2: TADODataSet;
    RvDataSetConnection4: TRvDataSetConnection;
    ADOXML: TADOQuery;
    XMLD: TXMLDocument;
    N23: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    StringGrid2: TStringGrid;
    PopupMenu1: TPopupMenu;
    N28: TMenuItem;
    Button2: TButton;
    Button3: TButton;
    N29: TMenuItem;
    tmr1: TTimer;
    N30: TMenuItem;
    rb1: TRadioButton;
    rb2: TRadioButton;
    N01: TMenuItem;
    Z1: TMenuItem;
    X1: TMenuItem;
    rvcomin1: TRvProject;
    N27: TMenuItem;
    rvkassa: TRvProject;
    N20: TMenuItem;
    ADODataSet3: TADODataSet;
    N18: TMenuItem;
    RvDataSetConnection5: TRvDataSetConnection;
    Z2: TMenuItem;
    N19: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    N31: TMenuItem;
    N32: TMenuItem;
    N34: TMenuItem;
    xml: TXMLDocument;
    N33: TMenuItem;
    pm1: TPopupMenu;
    N35: TMenuItem;
    Panel6: TPanel;
    Timer1: TTimer;
    N36: TMenuItem;
    N37: TMenuItem;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    q1: TADOQuery;
    receiptDocument: TRvProject;
    expenseReport: TRvProject;
    CashBook: TRvProject;
    ADOQuery1: TADOQuery;
    N38: TMenuItem;
    RvDataSetConnection6: TRvDataSetConnection;
    ADODataSet6: TADODataSet;
    Edit3: TEdit;
    Edit1: TEdit;
    Panel5: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel1: TPanel;
    sPanel1: TPanel;
    sPanel2: TPanel;
    StaticText8: TLabel;
    StaticText6: TLabel;
    sLabel1: TLabel;
    StaticText1: TLabel;
    StaticText5: TLabel;
    StaticText2: TLabel;
    StaticText4: TLabel;
    StaticText3: TLabel;
    sLabel2: TLabel;
    sLabel3: TLabel;
    sLabel4: TLabel;
    sLabel5: TLabel;
    sLabel6: TLabel;
    ComboBox1: TComboBox;
    DTP2: TDateTimePicker;
    DTP1: TDateTimePicker;
    inventar: TRvDataSetConnection;
    inventarDataSet: TADODataSet;
    Label11: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label13: TLabel;
    income: TfrxDBDataset;
    frxReport1: TfrxReport;
    outgoing: TfrxDBDataset;
    N39: TMenuItem;
    test1: TMenuItem;
    test21: TMenuItem;
    N40: TMenuItem;
    contractChangesDataSet: TADODataSet;
    conChanges: TfrxDBDataset;
    ContractType1: TMenuItem;
    N41: TMenuItem;
    Splitter2: TSplitter;
    Panel10: TPanel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Panel11: TPanel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    N43: TMenuItem;
    N44: TMenuItem;
    N45: TMenuItem;
    Panel7: TPanel;
    N46: TMenuItem;
    N42: TMenuItem;
    XMLButton: TButton;
    NCloseLo: TMenuItem;
    Panel8: TPanel;
    frxPDFExport1: TfrxPDFExport;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    N47: TMenuItem;
    RvRenderPDF1: TRvRenderPDF;
    RvNDRWriter1: TRvNDRWriter;
    RvRenderRTF1: TRvRenderRTF;
    RvRenderHTML1: TRvRenderHTML;
    RvRenderText1: TRvRenderText;
    N48: TMenuItem;
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure MonthRep();
    procedure ExportXML(dDate1, dDate2: TDateTime);  // Standart
    procedure ExportXML2(dDate1, dDate2: TDateTime);  // Update operation TimeStamp
    procedure ExportXML3(dDate1, dDate2: TDateTime); // Update Deliverer full
    procedure SearchContract();
    procedure SearchContractOld();
    procedure SearchExtension();
    procedure Apply();
    procedure Cancel();
    procedure ContractInfo();
    procedure Archiv();
    procedure N16Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Panel1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Panel1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Panel1Click(Sender: TObject);
    procedure Panel2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Panel2MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Panel2Click(Sender: TObject);
    procedure Panel3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Panel3MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Panel3Click(Sender: TObject);
    procedure Panel4MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Panel4MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Panel4Click(Sender: TObject);
    procedure Panel5MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Panel5MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Panel5Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure N22Click(Sender: TObject);
    procedure StringGrid1DblClick(Sender: TObject);
    procedure N24Click(Sender: TObject);
    procedure StringGrid1Click(Sender: TObject);
    procedure StringGrid2ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N28Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure XMLButtonClick(Sender: TObject);
    procedure StringGrid2Exit(Sender: TObject);
    procedure N29Click(Sender: TObject);
    procedure N26Click(Sender: TObject);
    procedure X1Click(Sender: TObject);
    procedure N01Click(Sender: TObject);
    procedure Z1Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N31Click(Sender: TObject);
    procedure N27Click(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure Z2Click(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure N32Click(Sender: TObject);
    procedure N33Click(Sender: TObject);
    procedure Panel2M(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure Panel2MouseLeave(Sender: TObject);
    procedure Panel1MouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure Panel1MouseLeave(Sender: TObject);
    procedure Panel3MouseLeave(Sender: TObject);
    procedure Panel3MouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure Panel4MouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure Panel4MouseLeave(Sender: TObject);
    procedure Panel5MouseLeave(Sender: TObject);
    procedure Panel5MouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure N35Click(Sender: TObject);
    procedure StringGrid1ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure rb1Click(Sender: TObject);
    procedure rb2Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure spanel1Click(Sender: TObject);
    procedure Panel7MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Panel7MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sPanel1MouseLeave(Sender: TObject);
    procedure sPanel1MouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure sPanel2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sPanel2MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sPanel2MouseLeave(Sender: TObject);
    procedure sPanel2MouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure sPanel2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure N36Click(Sender: TObject);
    procedure N37Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Edit3Click(Sender: TObject);
    procedure DTP1Change(Sender: TObject);
    procedure DTP2Change(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Panel8Click(Sender: TObject);
    procedure N38Click(Sender: TObject);
    procedure Label15Click(Sender: TObject);
    procedure N39Click(Sender: TObject);
    procedure test2Click(Sender: TObject);
    procedure test21Click(Sender: TObject);
    procedure N40Click(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure Edit3KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ContractType1Click(Sender: TObject);
    procedure N41Click(Sender: TObject);
    procedure N42Click(Sender: TObject);
    procedure N44Click(Sender: TObject);
    procedure N45Click(Sender: TObject);
    procedure sPanel1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sPanel1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Panel7Click(Sender: TObject);
    procedure N46Click(Sender: TObject);
    procedure NCloseLoClick(Sender: TObject);
    procedure ADOROWSTEST1Click(Sender: TObject);
    procedure Panel8MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Panel8MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N47Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N48Click(Sender: TObject);
    // SEARCH METHODs
    procedure fillFormFromQuery(q1 : TADOQuery);
    function searchByContractNumber(searchText : String) : TADOQuery;
    function searchByDelivererName(searchText : String) : TADOQuery;
    function searchDelivererContractsByidContract(id1 : Integer) : TADOQuery;
    function searchOpenByDate(date1 : TDate; date2 : TDAte) : TADOQuery;
    procedure pm1Popup(Sender: TObject);

  private
    { Private declarations }
    procedure crateFieldInTable();
    function SumOperation(SField: string; BOperation: byte;
      DDate: TDateTime): double;
    procedure numContracts(date1: TDateTime; date2: TDateTime);
  public
    { Public declarations }
    function SelectTarif(iIDTarif: Integer): string;
  end;

function ExecAndWait(const FileName, Params: ShortString; const WinState: Word)
  : Boolean; export;

var
  Form1: TForm1;
  DOpenDay: TDateTime;
  bIDEmployee, bCreditBodyPercent, bCreditBodyPercentOneDay: byte;
  bEditMark, bDeepOptions, bPPOStatus, bUseRAS: Boolean;
  sNameFilial,sCodeFilial, sEditContractNumber, sPPOCom, administratorPassword, managerPassword: string;
  sEditContractId : string;
  dollarPrice: double;
  iIDContract: Integer;
  dDelayPercent: double;
  chief: string;
  chiefData: string;
  orderNumber: Integer;
  filialNumberMain : string;
  id_CurrentEmployee : Integer;
  operationId : Integer;
  currentEmployee: TEmployee;
  newContract2 : Integer;
implementation

uses
  uslv_form, dayReport_form, DateUtils, sclient_form, newContract_form,
  semployee_form, bayout_form, coming_form, outgoing_form, repawning_form,
  sprice_form, login_form, editTarif_form, month_form, changepsw_form,
  editPasport_form, DS2XML, openday_form, export_form, closeOp_form,
  fr_form, inv_form, deliverer_form, ConfigPPO_form, config_form, kassa_form,
  zperiod_form,
  chekInOut_form, LogUnit, usyncthread, RemovedFromStorage_form, about_form,
  sbjct_form,
  answerForm, preZForm, cashBookFormUnit, EventEntity, EventADO, OperationADO,
  OperationEntity, ContractEntity, ContractADO, EditContractOperationForm,
  NewContractForm_2, Product, Contnrs, contractChangesForm, ContractsList, editBK,
  enContract, enOperation, enProduct, enDeliverer, closeLo;

{$R *.dfm}

procedure TForm1.N2Click(Sender: TObject);
begin
  deliverer_form.deliverer.ShowModal;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
  exitForm.Form11 := TForm11.Create(self);
  form11.ShowModal;
end;

procedure TForm1.N40Click(Sender: TObject);
begin
  contractChangesForm.contractChanges := TcontractChanges.Create(Self);
  contractChangesForm.contractChanges.ShowModal;
end;

procedure TForm1.N41Click(Sender: TObject);
begin
  ShowMessage( '04/09 -исключены ошибки в суммах при перезалогах. нет ошибки при увеличении суммы , если у клиента золотая карта. Убрал Айди контракта в операции при автоматическом расходе менеджера. из меню скрыл лишние пункты. и.т.д');
end;

procedure TForm1.N42Click(Sender: TObject);
var
  c1 : TENContract2;
  cADO : ADOcontract;
  pADO : ADOproductInfo;
  oADO : ADOoperation;
begin
{
  c1 := TENcontract2.create();
  cADO := DANADO.ADOcontract.Create;
  c1 := cADO.getContractByNumber(StringGrid1.Cells[1,StringGrid1.Row]);
  c1.product := TENproduct.Create;
  pADO := DANADO.ADOproductInfo.Create;
  c1.product := pado.getProductByIdContract(c1.id);
  c1.operation := TENoperation.Create;
  c1.operation := oADO.getOperationByIdContract(c1.id);
  cADO.show(c1);
  pADO.show(c1.product);
  oADO.show(c1.operation);
  DANADO.Form7.ShowModal;
  }
end;

procedure TForm1.N44Click(Sender: TObject);
begin
ShellExecute(Handle, nil, 'mailto:support@ucs-lombard.com.ua', nil,
    nil, SW_SHOW);
end;

procedure TForm1.N45Click(Sender: TObject);
begin
ShellExecute(Handle, nil, 'mailto:golos@ucs-lombard.com.ua', nil,
    nil, SW_SHOW);
end;

procedure TForm1.N46Click(Sender: TObject);
var
  sFileName : String;
  filialNumber : String;
  F: TextFile;
begin
{
    ADOXML.SQL.Add
      ('SELECT id,idContract,idDeliverer,ticket,sell,TimeStampField  FROM lototron');
  ADOXML.Active := true;
  DatasetToXML(ADOXML, 'C:/Pawn/xml/lototron.xml');
  ADOXML.SQL.Clear;
  ADOXML.Active := false;
  ADOQDay3.SQL.Add('SELECT name_filial FROM pasport');
  ADOQDay3.Open;
  sFileName := 'Lototron_' + ADOQDay3.Fields[0].AsString + '.rar';
  if Length(ADOQDay3.Fields[0].AsString) = 1 then
    filialNumber := '00' + ADOQDay3.Fields[0].AsString;
  if Length(ADOQDay3.Fields[0].AsString) = 2 then
    filialNumber := '0' + ADOQDay3.Fields[0].AsString;
  if Length(ADOQDay3.Fields[0].AsString) = 3 then
    filialNumber := ADOQDay3.Fields[0].AsString;
  ADOQDay3.Close;
  ADOQDay3.SQL.Clear;
  ExecAndWait('C:\Pawn\Rar.exe', 'a C:\Pawn\archives\' + sFileName +
    ' C:\Pawn\xml\lototron.xml -ep', 0);
  CopyFile(PWideChar('C:\Pawn\archives\' + sFileName),
    PWideChar('C:\Dropbox\' + filialNumber + '\data\' + sFileName), false);
  AssignFile(F, 'C:/Pawn/Number');
  Rewrite(F);
  WriteLn(F, filialNumber);
  CloseFile(F);
  }
end;

procedure TForm1.N47Click(Sender: TObject);
begin
    ShowContractDateEnd.TForm15.Create(self);
    ShowContractDateEnd.Form15.ShowModal;
end;

procedure TForm1.N48Click(Sender: TObject);
begin
  //reportDeliverer.TForm16.Create(self);
  reportDeliverer.Form16.ShowModal;
end;

procedure TForm1.N4Click(Sender: TObject);
var
  intCodeFilial : integer;
begin
  intCodeFilial := StrToInt(sCodeFilial);
  case intCodeFilial of
  //  NO WHITE LO
    4,14,3,17,22,990,13,982,24,26,19,12,992,38,45,47 : n21.Visible := False;
    else n21.Visible := True;
  end;
  NCloseLo.Visible := true;
end;

procedure TForm1.NCloseLoClick(Sender: TObject);
begin
  closeLo.Form9.ShowModal;
end;

procedure TForm1.N5Click(Sender: TObject);
begin
  newContract_form.newContract := TnewContract.Create(Self);
  newContract_form.newContract.ShowModal;
end;

procedure TForm1.N6Click(Sender: TObject);
begin
  semployee_form.semployee.ShowModal;
end;

procedure TForm1.N7Click(Sender: TObject);
begin
  bayout_form.bayout := Tbayout.Create(Self);
  bayout_form.bayout.ShowModal;
end;

procedure TForm1.N13Click(Sender: TObject);
begin
  coming_form.coming := Tcoming.Create(Self);
  coming_form.coming.ShowModal;
end;

procedure TForm1.N14Click(Sender: TObject);
begin
  outgoing_form.outgoings := Toutgoings.Create(Self);
  outgoing_form.outgoings.ShowModal;
end;

procedure TForm1.N10Click(Sender: TObject);
begin
  dayReport_form.dayReport := TdayReport.Create(Self);
  dayReport_form.dayReport.ShowModal;
end;

procedure TForm1.N8Click(Sender: TObject);
begin
  repawning_form.repawning := Trepawning.Create(Self);
  repawning_form.repawning.ShowModal;
end;

procedure TForm1.MonthRep;
var
  BNumOfDay, BDayInMonth: byte;
  DateTmp: TDateTime;
  WYear, WMonth, WDay, WDayBegin: Word;
  DSumComing, DReturnTmp5, DReturnPercentTmp5, DReturnDelayTmp5, DIssuedTmp,
    DReturnTmp, DReturnPercentTmp, DReturnDelayTmp, DIncomeTmp, DChargeTmp,
    DBalanceTmp: real;
  TMPBalanceTMP : real;
  myMonth : Word;
  myYear : Word;
  myDay : Word;
  q11 : TADOQuery;
  sql11 : String;
begin
  q11 := TADOQuery.Create(nil);
  q11.ConnectionString := DANADO.utils.getConnectionString;

  sql11 := 'DELETE * FROM  PrintMonthReportTmp';
  q11.SQL.Add(sql11);
  q11.ExecSQL;
  q11.SQL.Clear;

  DateTmp := Date;

  DecodeDate(DateTmp, WYear, WMonth, WDay);

  //WYear := 2014;
  BNumOfDay := 1;
  if month_form.month.ComboBox1.Text = 'Январь' then
    WMonth := 1;
  if month_form.month.ComboBox1.Text = 'Февраль' then
    WMonth := 2;
  if month_form.month.ComboBox1.Text = 'Март' then
    WMonth := 3;
  if month_form.month.ComboBox1.Text = 'Апрель' then
    WMonth := 4;
  if month_form.month.ComboBox1.Text = 'Май' then
    WMonth := 5;
  if month_form.month.ComboBox1.Text = 'Июнь' then
    WMonth := 6;
  if month_form.month.ComboBox1.Text = 'Июль' then
    WMonth := 7;
  if month_form.month.ComboBox1.Text = 'Август' then
    WMonth := 8;
  if month_form.month.ComboBox1.Text = 'Сентябрь' then
    WMonth := 9;
  if month_form.month.ComboBox1.Text = 'Октябрь' then
    WMonth := 10;
  if month_form.month.ComboBox1.Text = 'Ноябрь' then
    WMonth := 11;
  if month_form.month.ComboBox1.Text = 'Декабрь' then
    WMonth := 12;

  DecodeDate(getLastDate+1, myYear, myMonth, myDay);

  //myYear := 2014;
  BDayInMonth := DaysInAMonth(WYear, WMonth);
  WDayBegin := 1;
  DateTmp := EncodeDate(WYear, WMonth, WDayBegin);

  sql11 := 'SELECT SUM(sum_op) as Sum1 FROM operation WHERE date_op<:Qdate_op AND (op=2 OR op=5)';
  q11.SQL.Add(sql11);
  q11.Parameters.ParamByName('Qdate_op').Value := DateTmp;
  q11.Open;
  DSumComing := q11.FieldByName('Sum1').AsFloat;
  DSumComing := round(DSumComing * 100) / 100;
  q11.Close;
  q11.SQL.Clear;

  sql11 := 'SELECT SUM(percent_op) as Sum2 FROM operation WHERE date_op<:Qdate_op AND (op=2 OR op=5)';
  q11.SQL.Add(sql11);
  q11.Parameters.ParamByName('Qdate_op').Value := DateTmp;
  q11.Open;
  DSumComing := DSumComing + q11.FieldByName('Sum2').AsFloat;
  DSumComing := round(DSumComing * 100) / 100;
  q11.Close;
  q11.SQL.Clear;

  sql11 := 'SELECT SUM(delay_op) as Sum3 FROM operation WHERE date_op<:Qdate_op AND (op=2 OR op=5)';
  q11.SQL.Add(sql11);
  q11.Parameters.ParamByName('Qdate_op').Value := DateTmp;
  q11.Open;
  DSumComing := DSumComing + q11.FieldByName('Sum3').AsFloat;
  DSumComing := round(DSumComing * 100) / 100;
  q11.Close;
  q11.SQL.Clear;

  sql11 := 'SELECT SUM(sum_op) as Sum4 FROM operation WHERE date_op<:Qdate_op AND op=10';
  q11.SQL.Add(sql11);
  q11.Parameters.ParamByName('Qdate_op').Value := DateTmp;
  q11.Open;
  DSumComing := DSumComing + q11.FieldByName('Sum4').AsFloat;
  DSumComing := round(DSumComing * 100) / 100;
  q11.Close;
  q11.SQL.Clear;

  sql11 := 'SELECT SUM(sum_op) as Sum5 FROM operation WHERE date_op<:Qdate_op AND op=1';
  q11.SQL.Add(sql11);
  q11.Parameters.ParamByName('Qdate_op').Value := DateTmp;
  q11.Open;
  DSumComing := DSumComing - q11.FieldByName('Sum5').AsFloat;
  DSumComing := round(DSumComing * 100) / 100;
  q11.Close;
  q11.SQL.Clear;

  sql11 := 'SELECT SUM(sum_op) as Sum6 FROM operation WHERE date_op<:Qdate_op AND op=11';
  q11.SQL.Add(sql11);
  q11.Parameters.ParamByName('Qdate_op').Value := DateTmp;
  q11.Open;
  DSumComing := DSumComing - q11.FieldByName('Sum6').AsFloat;
  DSumComing := round(DSumComing * 100) / 100;
  q11.SQL.Clear;
  q11.Close;
  // -------------------------------------------
  DBalanceTmp := DSumComing;
  while (BNumOfDay <= BDayInMonth) do
  begin
    WDay := BNumOfDay;
    DateTmp := EncodeDate(WYear, WMonth, WDay);
    BNumOfDay := BNumOfDay + 1;
    DIssuedTmp := SumOperation('sum_op', 1, DateTmp);
    DReturnTmp := SumOperation('sum_op', 2, DateTmp);
    DReturnPercentTmp := SumOperation('percent_op', 2, DateTmp);
    DReturnDelayTmp := SumOperation('delay_op', 2, DateTmp);
    DReturnTmp5 := SumOperation('sum_op', 5, DateTmp);
    DReturnPercentTmp5 := SumOperation('percent_op', 5, DateTmp);
    DReturnDelayTmp5 := SumOperation('delay_op', 5, DateTmp);
    DIncomeTmp := SumOperation('sum_op', 10, DateTmp);
    DChargeTmp := SumOperation('sum_op', 11, DateTmp);
    DBalanceTmp := DBalanceTmp - DIssuedTmp + DReturnTmp5 + DReturnPercentTmp5 +
      DReturnDelayTmp5 + DReturnTmp + DReturnPercentTmp + DReturnDelayTmp +
      DIncomeTmp - DChargeTmp;
      //так нада. Никита 0.99
    DBalanceTmp := round(DBalanceTmp*100)/100;

    sql11 := 'INSERT INTO PrintMonthReportTmp (DateTmp,IssuedTmp,ReturnTmp,ReturnPercentTmp,ReturnDelayTmp,IncomeTmp,ChargeTmp,BalanceTmp) ';
    sql11 := sql11 + 'VALUES (:QDateTmp,:QIssuedTmp,:QReturnTmp,:QReturnPercentTmp,:QReturnDelayTmp, :QIncomeTmp,:QChargeTmp,:QBalanceTmp) ';
    q11.SQL.Add(sql11);
    q11.Parameters.ParamByName('QDateTmp').Value := DateTmp;
    q11.Parameters.ParamByName('QIssuedTmp').Value := DIssuedTmp;
    q11.Parameters.ParamByName('QReturnTmp').Value := DReturnTmp + DReturnTmp5;
    q11.Parameters.ParamByName('QReturnPercentTmp').Value := DReturnPercentTmp + DReturnPercentTmp5;
    q11.Parameters.ParamByName('QReturnDelayTmp').Value := DReturnDelayTmp + DReturnDelayTmp5;
    q11.Parameters.ParamByName('QIncomeTmp').Value := DIncomeTmp;
    q11.Parameters.ParamByName('QChargeTmp').Value := DChargeTmp;
    q11.Parameters.ParamByName('QBalanceTmp').Value := DBalanceTmp;
    q11.ExecSQL;
    q11.SQL.Clear;
    q11.Close;
  end;
  q11.Destroy;
  ADODataSet1.Active := true;
  RvProject2.SetParam('month_report', month_form.month.ComboBox1.Text);
  RvProject2.SetParam('sum_begin', FloatToStr(DSumComing));
  RvProject2.SetParam('num_filial', sNameFilial);
  RvProject2.Execute;
  ADODataSet1.Active := false;
end;

function TForm1.SumOperation(SField: string; BOperation: byte;
  DDate: TDateTime): double;
var
  q12 : TADOQuery;
  sql12 : String;
  res : Double;
begin
  q12 := TADOQuery.Create(nil);
  q12.ConnectionString := danado.utils.getConnectionString;
  sql12 := 'SELECT SUM(' + SField +
    ') as Sum12 FROM operation WHERE date_op=:Qdate_op AND op=:Qop';
  q12.SQL.Add(sql12);
  q12.Parameters.ParamByName('Qdate_op').Value := DDate;
  q12.Parameters.ParamByName('Qop').Value := BOperation;
  q12.Open;
  res := q12.FieldByName('Sum12').AsFloat;
  q12.Destroy;
  RESULT := res;
end;

procedure TForm1.test2Click(Sender: TObject);
begin
NewContractForm_2.NewContract_2 := TNewContract_2.Create(Self);
NewContractForm_2.NewContract_2.ShowModal;
end;

procedure TForm1.test21Click(Sender: TObject);
var
list : TObjectList;
begin
  //MyUtils.showTList();
  //list := TObjectList.Create;
  //.Assign(getProductsOnDate(StrToDate('01.01.2013')));
  //ShowMessage(TProductEntity(list[0]).product);
  ReportXLS.inventoryReport(getProductsOnDate(StrToDate('07.07.2013')),
    StrToDate('07.07.2013'));
  //ShowMessage(IntToStr(getCountProductOnDate(StrToDate('07.07.2013'))));
end;

procedure TForm1.N16Click(Sender: TObject);
begin
  sprice_form.sprice := Tsprice.Create(Self);
  sprice_form.sprice.ShowModal;
end;

procedure TForm1.N17Click(Sender: TObject);
begin
  uslv_form.uslv := Tuslv.Create(Self);
  uslv_form.uslv.ShowModal;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  dDateNow: TDateTime;
  val: TRect;
  iMenuHeight, iTitleHeight: Integer;
  IniFile: TIniFile;
  WYear, WMonth, WDay: Word;
  SyncThread: TSyncThread;
  sHost, sUser: string;
  z: Integer;
  openExtObjThread: TRunExtObject;
  sqlQuery: string;
  tempOrderNumber: Integer;
  test : string;
  newContractButton2 : Integer;
  befDate : TDateTime;
  ev : TEventEntity;
begin
  deliverer_form.deliverer := Tdeliverer.Create(Self);
  sEditContractId := '0';
  ADOQDay3.ConnectionString := danado.utils.getConnectionString;
  ADODataSet1.ConnectionString := danado.utils.getConnectionString;
  ADODataSet2.ConnectionString := danado.utils.getConnectionString;
  ADODataSet3.ConnectionString := danado.utils.getConnectionString;
  ADOQDay1.ConnectionString := danado.utils.getConnectionString;
  ADOQDay2.ConnectionString := danado.utils.getConnectionString;
  inventarDataSet.ConnectionString := danado.utils.getConnectionString;
  contractChangesDataSet.ConnectionString := danado.utils.getConnectionString;
  if (DANUtils.print.checkDNR) then  begin
    form1.expenseReport.SetProjectFile('C:\pawn\report\expenseReportDNR.rav');
    form1.receiptDocument.SetProjectFile('C:\pawn\report\receiptDocumentDNR.rav');
  end else begin
    form1.expenseReport.SetProjectFile('C:\pawn\report\expenseReport.rav');
    form1.receiptDocument.SetProjectFile('C:\pawn\report\receiptDocument.rav');
  end;

  try
    ADOQDay3.SQL.Add('SELECT * FROM loyalty');
    ADOQDay3.Open;
    ADOQDay3.Close;
    ADOQDay3.SQL.Clear;
  except
    on e: Exception do
    begin
      sqlQuery := 'CREATE TABLE loyalty ('+
      'id AUTOINCREMENT, '+
      'idLoyalty Int, '+
      'idDeliverer Int, '+
      'idContract Int, '+
      'arrearsOption1 Float, '+
      'arrearsOprtion2 Float, '+
      'editDate DateTime,'+
      'status LOGICAL,' +
      'PRIMARY KEY (id) '+
      ')';
      ADOQDay3.SQL.Clear;
      ADOQDay3.SQL.Add(sqlQuery);
      ADOQDay3.ExecSQL;
      ADOQDay3.Close;
      ADOQDay3.SQL.Clear;
    end;
  end;

  try
    ADOQDay3.SQL.Add('SELECT * FROM loyalty');
    ADOQDay3.Open;
    ADOQDay3.FieldByName('idContract').Value;
    ADOQDay3.Close;
    ADOQDay3.SQL.Clear;
  except
    on e: Exception do
    begin
      sqlQuery := 'ALTER TABLE loyalty ADD iDContract int';
      ADOQDay3.SQL.Clear;
      ADOQDay3.SQL.Add(sqlQuery);
      ADOQDay3.ExecSQL;
      ADOQDay3.Close;
      ADOQDay3.SQL.Clear;
    end;
   end;


  {
  try
    ADOQDay3.SQL.Add('ALTER TABLE loyalty ADD option1 Float');
    ADOQDay3.ExecSQL;
    ADOQDay3.SQL.Clear;
    ADOQDay3.SQL.Add('UPDATE loyalty SET option1=percentage');
    ADOQDay3.ExecSQL;
    ADOQDay3.SQL.Clear;
    ADOQDay3.SQL.Add('ALTER TABLE loyalty DROP COLUMN percentage');
    ADOQDay3.ExecSQL;
    ADOQDay3.SQL.Clear;
    ADOQDay3.Close;

  except
    on e: Exception do
    begin
      ADOQDay3.SQL.Clear;
    end;
  end;

  try
    ADOQDay3.SQL.Add('ALTER TABLE loyalty ADD option2 Float');
    ADOQDay3.ExecSQL;
    ADOQDay3.SQL.Clear;
    ADOQDay3.SQL.Add('UPDATE loyalty SET option2=price');
    ADOQDay3.ExecSQL;
    ADOQDay3.SQL.Clear;
    ADOQDay3.SQL.Add('ALTER TABLE loyalty DROP COLUMN price');
    ADOQDay3.ExecSQL;
    ADOQDay3.SQL.Clear;
    ADOQDay3.Close;
  except
    on e: Exception do
    begin
      ADOQDay3.SQL.Clear;
    end;
  end;

  }

  try
    ADOQDay3.SQL.Add('SELECT arrears FROM contract_info');
    ADOQDay3.Open;
    ADOQDay3.FieldByName('arrears').Value;
    ADOQDay3.Close;
    ADOQDay3.SQL.Clear;
  except
    on e: Exception do
    begin
      sqlQuery := 'ALTER TABLE contract_info ADD arrears logical';
      ADOQDay3.SQL.Clear;
      ADOQDay3.SQL.Add(sqlQuery);
      ADOQDay3.ExecSQL;
      ADOQDay3.Close;
      ADOQDay3.SQL.Clear;
    end;
  end;

  try
    ADOQDay3.SQL.Add('ALTER TABLE product_info ALTER COLUMN product text(50)');
    ADOQDay3.ExecSQL;
    ADOQDay3.Close;
    ADOQDay3.SQL.Clear;
  except
    on e: Exception do
    begin
      sqlQuery := 'ALTER TABLE product_info ALTER COLUMN product text(50)';
      ADOQDay3.SQL.Clear;
      ADOQDay3.SQL.Add(sqlQuery);
      ADOQDay3.ExecSQL;
      ADOQDay3.Close;
      ADOQDay3.SQL.Clear;
    end;
   end;

    DTP1.MinDate := getLastDate+1;
    DTP2.MinDate := getLastDate+1;



    try
    ADOQDay3.SQL.Clear;
    ADOQDay3.SQL.Add('SELECT * FROM arrears');
    ADOQDay3.Open;
    ADOQDay3.Close;
    ADOQDay3.SQL.Clear;

    DANADO.loyal.importFromArrears;

    ADOQDay3.SQL.Add('DELETE * FROM arrears');
    ADOQDay3.ExecSQL;
    ADOQDay3.Close;
    ADOQDay3.SQL.Clear;

  except
    on e: Exception do
    begin
    //
    end;
  end;

  {
try
    ADOQDay3.SQL.Add('ALTER TABLE product_info ALTER COLUMN price float');
    ADOQDay3.ExecSQL;
    ADOQDay3.Close;
    ADOQDay3.SQL.Clear;
  except
    on e: Exception do
    begin
      sqlQuery := 'ALTER TABLE deliverer ALTER COLUMN pasport_ser text(4)';
      ADOQDay3.SQL.Clear;
      ADOQDay3.SQL.Add(sqlQuery);
      ADOQDay3.ExecSQL;
      ADOQDay3.Close;
      ADOQDay3.SQL.Clear;
    end;
   end;

try
    ADOQDay3.SQL.Add('ALTER TABLE deliverer ALTER COLUMN adress text(200)');
    ADOQDay3.ExecSQL;
    ADOQDay3.Close;
    ADOQDay3.SQL.Clear;
  except
    on e: Exception do
    begin
      sqlQuery := 'ALTER TABLE deliverer ALTER COLUMN pasport_ser text(4)';
      ADOQDay3.SQL.Clear;
      ADOQDay3.SQL.Add(sqlQuery);
      ADOQDay3.ExecSQL;
      ADOQDay3.Close;
      ADOQDay3.SQL.Clear;
    end;
   end;
 try
    ADOQDay3.SQL.Add('ALTER TABLE pasport ALTER COLUMN bPage int');
    ADOQDay3.ExecSQL;
    ADOQDay3.Close;
    ADOQDay3.SQL.Clear;
  except
    on e: Exception do
    begin
      sqlQuery := 'ALTER TABLE deliverer ALTER COLUMN pasport_ser text(4)';
      ADOQDay3.SQL.Clear;
      ADOQDay3.SQL.Add(sqlQuery);
      ADOQDay3.ExecSQL;
      ADOQDay3.Close;
      ADOQDay3.SQL.Clear;
    end;
   end;

try
    ADOQDay3.SQL.Add('ALTER TABLE deliverer ALTER COLUMN pasport_ser text(4)');
    ADOQDay3.ExecSQL;
    ADOQDay3.Close;
    ADOQDay3.SQL.Clear;
  except
    on e: Exception do
    begin
      sqlQuery := 'ALTER TABLE deliverer ALTER COLUMN pasport_ser text(4)';
      ADOQDay3.SQL.Clear;
      ADOQDay3.SQL.Add(sqlQuery);
      ADOQDay3.ExecSQL;
      ADOQDay3.Close;
      ADOQDay3.SQL.Clear;
    end;
  end;

try
    ADOQDay3.SQL.Add('SELECT Count(eventType) as [count] FROM eventType WHERE eventCode = 6');
    ADOQDay3.Open;
    ADOQDay3.FieldByName('count').Value;
    if (ADOQDay3.FieldByName('count').Value = 0) then
    begin
    ADOQDay3.Close;
    ADOQDay3.SQL.Clear;
    sqlQuery := 'INSERT INTO eventType VALUES (6 , "Несовершенно летний клиент!", 6)';
    ADOQDay3.SQL.Clear;
    ADOQDay3.SQL.Add(sqlQuery);
    ADOQDay3.ExecSQL;
    ADOQDay3.Close;
    ADOQDay3.SQL.Clear;
    end;
    ADOQDay3.Close;
    ADOQDay3.SQL.Clear;
  except
    on e: Exception do
    begin
      ShowMessage('eee');
    end;
   end;

   try
    ADOQDay3.SQL.Add('SELECT Count(eventType) as [count] FROM eventType WHERE eventCode = 7');
    ADOQDay3.Open;
    ADOQDay3.FieldByName('count').Value;
    if (ADOQDay3.FieldByName('count').Value = 0) then
    begin
    ADOQDay3.Close;
    ADOQDay3.SQL.Clear;
    sqlQuery := 'INSERT INTO eventType VALUES (7 , "Открытие Дня", 7)';
    ADOQDay3.SQL.Clear;
    ADOQDay3.SQL.Add(sqlQuery);
    ADOQDay3.ExecSQL;
    ADOQDay3.Close;
    ADOQDay3.SQL.Clear;
    end;
    ADOQDay3.Close;
    ADOQDay3.SQL.Clear;
  except
    on e: Exception do
    begin
      ShowMessage('eee');
    end;
   end;

   try
    ADOQDay3.SQL.Add('SELECT Count(eventType) as [count] FROM eventType WHERE eventCode = 8');
    ADOQDay3.Open;
    ADOQDay3.FieldByName('count').Value;
    if (ADOQDay3.FieldByName('count').Value = 0) then
    begin
    ADOQDay3.Close;
    ADOQDay3.SQL.Clear;
    sqlQuery := 'INSERT INTO eventType VALUES (8 , "Закрытие Дня", 8)';
    ADOQDay3.SQL.Clear;
    ADOQDay3.SQL.Add(sqlQuery);
    ADOQDay3.ExecSQL;
    ADOQDay3.Close;
    ADOQDay3.SQL.Clear;
    end;
    ADOQDay3.Close;
    ADOQDay3.SQL.Clear;
  except
    on e: Exception do
    begin
      ShowMessage('eee');
    end;
   end;

 try
    ADOQDay3.SQL.Add('SELECT weight_piece FROM product_info');
    ADOQDay3.Open;
    ADOQDay3.FieldByName('weight_piece').Value;
    ADOQDay3.Close;
    ADOQDay3.SQL.Clear;
  except
    on e: Exception do
    begin
      sqlQuery := 'ALTER TABLE product_info ADD weight_piece varchar(255)';
      ADOQDay3.SQL.Clear;
      ADOQDay3.SQL.Add(sqlQuery);
      ADOQDay3.ExecSQL;
      ADOQDay3.Close;
      ADOQDay3.SQL.Clear;
    end;
   end;

   try
    ADOQDay3.SQL.Add('SELECT phone FROM pasport');
    ADOQDay3.Open;
    ADOQDay3.FieldByName('phone').Value;
    ADOQDay3.Close;
    ADOQDay3.SQL.Clear;
  except
    on e: Exception do
    begin
      sqlQuery := 'ALTER TABLE pasport ADD phone varchar(255)';
      ADOQDay3.SQL.Clear;
      ADOQDay3.SQL.Add(sqlQuery);
      ADOQDay3.ExecSQL;
      ADOQDay3.Close;
      ADOQDay3.SQL.Clear;
    end;
   end;

  try
    ADOQDay3.SQL.Add('SELECT TimestampField FROM operation');
    ADOQDay3.Open;
    ADOQDay3.FieldByName('TimestampField').Value;
    ADOQDay3.Close;
    ADOQDay3.SQL.Clear;
  except
    on e: Exception do
    begin
      sqlQuery := 'ALTER TABLE operation ADD TimestampField date';
      ADOQDay3.SQL.Clear;
      ADOQDay3.SQL.Add(sqlQuery);
      ADOQDay3.ExecSQL;
      ADOQDay3.Close;
      ADOQDay3.SQL.Clear;
    end;
   end;

   try
    ADOQDay3.SQL.Add('SELECT contractTypeGroup FROM contract_info');
    ADOQDay3.Open;
    ADOQDay3.FieldByName('contractTypeGroup').Value;
    ADOQDay3.Close;
    ADOQDay3.SQL.Clear;
  except
    on e: Exception do
    begin
      sqlQuery := 'ALTER TABLE contract_info ADD contractTypeGroup Int';
      ADOQDay3.SQL.Clear;
      ADOQDay3.SQL.Add(sqlQuery);
      ADOQDay3.ExecSQL;
      ADOQDay3.Close;
      ADOQDay3.SQL.Clear;
    end;
   end;

  try
    ADOQDay3.SQL.Add('SELECT SerialNumber FROM product_info');
    ADOQDay3.Open;
    ADOQDay3.FieldByName('SerialNumber').Value;
    ADOQDay3.Close;
    ADOQDay3.SQL.Clear;
  except
    on e: Exception do
    begin
      sqlQuery := 'ALTER TABLE product_info ADD SerialNumber varchar(255)';
      ADOQDay3.SQL.Clear;
      ADOQDay3.SQL.Add(sqlQuery);
      ADOQDay3.ExecSQL;
      ADOQDay3.Close;
      ADOQDay3.SQL.Clear;
    end;
   end;

  try
    ADOQDay3.SQL.Add('SELECT * FROM lototron');
    ADOQDay3.Open;
    ADOQDay3.Close;
    ADOQDay3.SQL.Clear;
  except
    on e: Exception do
    begin
      sqlQuery := 'CREATE TABLE lototron ('+
      'id AUTOINCREMENT, '+
      'idContract Int, '+
      'idDeliverer Int, '+
      'ticket Int, '+
      'sell Int, '+
      'TimeStampField DateTime, '+
      'PRIMARY KEY (id) '+
      ')';
      ADOQDay3.SQL.Clear;
      ADOQDay3.SQL.Add(sqlQuery);
      ADOQDay3.ExecSQL;
      ADOQDay3.Close;
      ADOQDay3.SQL.Clear;
    end;
  end;



  try
    ADOQDay3.SQL.Add('SELECT * FROM event');
    ADOQDay3.Open;
    ADOQDay3.Close;
    ADOQDay3.SQL.Clear;
  except
    on e: Exception do
    begin
      sqlQuery := 'CREATE TABLE event ('+
      'id AUTOINCREMENT, '+
      'EventDate Date, '+
      'EventText Varchar(255), '+
      'Comment Varchar(255), '+
      'EventTypeId Int, '+
      'EmployeeId Int, '+
      'PRIMARY KEY (id) '+
      ')';
      ADOQDay3.SQL.Clear;
      ADOQDay3.SQL.Add(sqlQuery);
      ADOQDay3.ExecSQL;
      ADOQDay3.Close;
      ADOQDay3.SQL.Clear;
    end;
  end;
  try
    ADOQDay3.SQL.Add('SELECT * FROM eventType');
    ADOQDay3.Open;
    ADOQDay3.Close;
    ADOQDay3.SQL.Clear;
  except
    on e: Exception do
    begin
      sqlQuery := 'CREATE TABLE eventType ('+
      'id AUTOINCREMENT, '+
      'eventType varchar(255), '+
      'eventCode int, '+
      'PRIMARY KEY (id) '+
      ')';
      ADOQDay3.SQL.Clear;
      ADOQDay3.SQL.Add(sqlQuery);
      ADOQDay3.ExecSQL;
      ADOQDay3.Close;
      ADOQDay3.SQL.Clear;
      sqlQuery :=
        'INSERT INTO eventType (eventType, eventCode)'+
        ' VALUES("Открытие рабочего дня",1)';
      ADOQDay3.SQL.Clear;
      ADOQDay3.SQL.Add(sqlQuery);
      ADOQDay3.ExecSQL;
      ADOQDay3.Close;
      ADOQDay3.SQL.Clear;
      sqlQuery :=
        'INSERT INTO eventType (eventType, eventCode)'+
        ' VALUES("Закрытие работчего дня",2)';
      ADOQDay3.SQL.Clear;
      ADOQDay3.SQL.Add(sqlQuery);
      ADOQDay3.ExecSQL;
      ADOQDay3.Close;
      ADOQDay3.SQL.Clear;
      sqlQuery :=
        'INSERT INTO eventType (eventType, eventCode)'+
        ' VALUES("Подготовлен для редактирования",3)';
      ADOQDay3.SQL.Clear;
      ADOQDay3.SQL.Add(sqlQuery);
      ADOQDay3.ExecSQL;
      ADOQDay3.Close;
      ADOQDay3.SQL.Clear;
      sqlQuery :=
        'INSERT INTO eventType (eventType, eventCode)'+
        ' VALUES("Редактирование подтверждено",4)';
      ADOQDay3.SQL.Clear;
      ADOQDay3.SQL.Add(sqlQuery);
      ADOQDay3.ExecSQL;
      ADOQDay3.Close;
      ADOQDay3.SQL.Clear;
      sqlQuery :=
        'INSERT INTO eventType (eventType, eventCode)'+
        ' VALUES("Отмена редактирования",5)';
      ADOQDay3.SQL.Clear;
      ADOQDay3.SQL.Add(sqlQuery);
      ADOQDay3.ExecSQL;
      ADOQDay3.Close;
      ADOQDay3.SQL.Clear;
    end;
  end;
  }



 // DiscountStore.store := DiscountStore.getInstance();
 // DiscountStore.store.initialize(3);
  // DiscountStore.store.put(TFixed.Create, TDiscountType.GOLD);
 //  DiscountStore.store.put(TReduced.Create, TDiscountType.BASIC);
  // DiscountStore.store.put(TReduced.Create, TDiscountType.SILVER);

  LoyalStore.store := LoyalStore.getInstance();
  LoyalStore.store.initialize(5);
  LoyalStore.store.put(ReduceReduce.create, TLoyalsType.ReduceReduce2);   //Work!
  LoyalStore.store.put(ReduceFixed.create, TLoyalsType.ReduceFixed2);
  LoyalStore.store.put(FixedReduce.create, TLoyalsType.FixedReduce2);
  LoyalStore.store.put(FixedFixed.create, TLoyalsType.FixedFixed2);
  LoyalStore.store.put(FreeDays.create, TLoyalsType.FreeDays2);

  logBookEmployee.setStatusButton(TRUE);

  rb1.Checked := true;
  bDeepOptions := false;
  bEditMark := false;
  dDateNow := Date;
  panel11.Hide;
  xml.LoadFromFile('c:\pawn\conf\Security.xml');
  xml.Active := true;
  administratorPassword := VarToStr(xml.DocumentElement.ChildNodes['ROWDATA']
    .ChildNodes[0].NodeValue);
  managerPassword:= VarToStr(xml.DocumentElement.ChildNodes['ROWDATA']
    .ChildNodes[1].NodeValue);

  xml.Active := false;

  xml.LoadFromFile('c:\pawn\conf\usd.xml');
  xml.Active := true;
  dollarPrice :=
    round(StrToFloat(VarToStr(xml.DocumentElement.ChildNodes['ROWDATA']
    .ChildNodes[0].NodeValue))) / 100;
  xml.Active := false;
  Panel6.Caption := '$' + FloatToStr(dollarPrice);
  IniFile := TIniFile.Create('c:\pawn\options.ini');
  dDelayPercent := IniFile.ReadFloat('Contract', 'Delay', 1);
  bCreditBodyPercent := IniFile.ReadInteger('Contract', 'BodyPercent', 82);
  bCreditBodyPercentOneDay := IniFile.ReadInteger('Contract',
    'BodyPercentOneDay', 82);
  bPPOStatus := IniFile.ReadBool('ppo', 'status', false);
  sPPOCom := IniFile.ReadString('ppo', 'com', '1');
  bUseRAS := IniFile.ReadBool('connection', 'useras', false);
  sHost := IniFile.ReadString('ftp', 'host', 'ftp.ucs-lombard.com.ua');
  sUser := IniFile.ReadString('ftp', 'user', '002');
  newContract2 :=  IniFile.ReadInteger('newContract', 'new', 0);
  newContractButton2 :=  IniFile.ReadInteger('newContract', 'button2', 0);

  IniFile.Free;
  if bPPOStatus then begin
    N18.Visible := true;
    N38.Visible := false;
  end else begin
    N18.Visible := false;
    X1.Visible := false;
    N01.Visible := false;
    Z1.Visible := false;
    z2.Visible := false;
    n19.Visible := false;
    test21.Visible := false;
    N38.Visible := true;
  end;
  if newContractButton2 = 1 then  begin
    panel7.Visible := True;
  end else begin
    panel7.Hide;
  end;

  ADOQDay3.SQL.Add('SELECT OpenDay FROM pasport');
  ADOQDay3.Open;
  befDate := ADOQDay3.Fields[0].AsDateTime;

  //id_CurrentEmployee := ADOQDay3.Fields[1].AsInteger;
  ADOQDay3.SQL.Clear;
  ADOQDay3.Close;
  ADOQDay3.SQL.Add('SELECT name_filial, num_filial FROM pasport');
  ADOQDay3.Open;
  sNameFilial := ADOQDay3.Fields[0].Value;
  sCodeFilial := ADOQDay3.FieldByName('num_filial').AsString;
  ADOQDay3.SQL.Clear;
  ADOQDay3.Close;
  MyUtils.getAndUpdateChiefData(sNameFilial);

   danado.loyal.importLoyaltyFromXML;

  if (myUtils.checkTHISfilial(strToInt(sCodeFilial))) then begin


  end else begin
    n21.Visible := False;
    NCloseLo.Visible := False;
  end;


  login_form.login := Tlogin.Create(Self);
  login_form.login.ShowModal;
  ADOQDay3.SQL.Clear;
  ADOQDay3.SQL.Add
    ('SELECT OpenDay, employee.name, id_CurrentEmployee, Chief, ChiefData, name_filial FROM pasport INNER JOIN employee ON employee.id=pasport.id_CurrentEmployee');
  ADOQDay3.Open;
  StatusBar1.Panels[0].Text := ADOQDay3.FieldByName('name_filial').AsString + ' Ло. Рабочая дата: ' + ADOQDay3.Fields[0].AsString;
  StatusBar1.Panels[1].Text := 'Сотрудник: ' + ADOQDay3.Fields[1].AsString;
  DOpenDay := StrToDate(DateToStr(now()));
  chief := ADOQDay3.Fields[3].AsString;
  chiefData := ADOQDay3.Fields[4].AsString;
  filialNumberMain := ADOQDay3.Fields[5].AsString;
  DTP2.Date := DOpenDay;
  DTP1.Date := DOpenDay;
  bIDEmployee := ADOQDay3.Fields[2].AsInteger;
  ADOQDay3.SQL.Clear;
  ADOQDay3.Close;
 // ShowMessage(dateToStr(now()));
  if (dateToStr(now()) = '25.11.2014') then begin
 // ShowMessage('ifTrue');
    DanUtils.ex.createXmlLoyalty(Now()-1);

  end else begin



  if befDate < dDateNow then
  begin
    DecodeDate(dDateNow, WYear, WMonth, WDay);
    if (WDay = 1) and (WMonth = 1) then
    begin
      ADOQDay3.SQL.Add('UPDATE pasport SET OrderNumber=1,bPage=1');
      ADOQDay3.ExecSQL;
      ADOQDay3.Close;
      ADOQDay3.SQL.Clear;
    end;



    ev := TEventEntity.Create;
    ev.employeeId := bIDEmployee;
    ev.eventDate := StrToDate(DateToStr(now()));
    ev.eventTypeId := 111;
    ev.eventText := 'Открытие Дня';
    eventAdd(ev);

      // DAILY
     DanUtils.ex.createDaily(Now()-1);
    Archiv;
  end;
  end;


  SystemParametersInfo(SPI_GETWORKAREA, 0, Addr(val), 0);
  iMenuHeight := GetSystemMetrics(SM_CYMENU);
  iTitleHeight := GetSystemMetrics(SM_CYCAPTION);
  PageControl1.Width := val.Right - val.Left - 170;
  StringGrid1.Width := val.Right - val.Left - 170;
  StringGrid2.Width := val.Right - val.Left - 171;
  StringGrid1.Height := val.Bottom - val.Top - StatusBar1.Height - iMenuHeight -
    iTitleHeight - Panel1.Height - 110;
  GroupBox1.Height := val.Bottom - val.Top - StatusBar1.Height - iMenuHeight -
    iTitleHeight - Panel1.Height - 4;
  //StringGrid1.DefaultColWidth := 100;
  StringGrid1.Cells[0, 0] := '№ п/п';
  StringGrid1.Cells[1, 0] := '№ Договора';
  StringGrid1.Cells[2, 0] := 'Дата';
  StringGrid1.Cells[3, 0] := 'Сумма оценки';
  StringGrid1.Cells[4, 0] := 'Сумма договора';
  StringGrid1.Cells[5, 0] := 'Клиент';
  StringGrid1.Cells[6, 0] := 'Сотрудник';
  StringGrid1.Cells[7, 0] := 'Статус';
  StringGrid1.Cells[8, 0] := 'Дата закрытия';
  StringGrid1.Cells[9, 0] := 'Программа';
  StringGrid1.ColWidths[9] := 120;
  StringGrid2.Cells[0, 0] := '№ п/п';
  StringGrid2.Cells[1, 0] := 'Операция';
  StringGrid2.Cells[2, 0] := 'Дата';
  StringGrid2.Cells[3, 0] := 'Тело кредита';
  StringGrid2.Cells[4, 0] := 'Сумма %';
  StringGrid2.Cells[5, 0] := 'Просрочка';
  StringGrid2.Cells[6, 0] := 'Дата / Время';
  StringGrid2.ColWidths[6] := 120;
  // openExtObjThread := TRunExtObject.Create(True);
  // openExtObjThread.FreeOnTerminate := True;
  // openExtObjThread.Priority := tpLower;
  // openExtObjThread.Resume;
  SearchContract;
  ContractInfo;
  ADOQDay3.SQL.Add('SELECT Instruction FROM employee WHERE id=' +
    IntToStr(bIDEmployee));
  // ADOQDay3.Parameters.ParamByName('id').Value := bIDEmployee;
  // ADOQDay3.Parameters.ParamByName('pid').Value := bIDEmployee;
  ADOQDay3.Open;
  if (ADOQDay3.Fields[0].AsFloat = 0) then
  begin
    answerForm.answer := Tanswer.Create(Self);
    answerForm.answer.Show;
  end;
  ADOQDay3.Close;
  ADOQDay3.SQL.Clear;
  MyUtils.updateSale(filialNumberMain);
end;

procedure TForm1.N18Click(Sender: TObject);

begin
  kassa_form.kassa := Tkassa.Create(Self);
  kassa_form.kassa.ShowModal;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  SearchContract;
  ContractInfo;
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
var
  X: Integer;
begin
  bEditMark := true;
  X := StringGrid1.Row;
  sEditContractNumber := StringGrid1.Cells[1, X];
  Edit1.Text := sEditContractNumber;
  newContract_form.newContract := TnewContract.Create(Self);
  newContract_form.newContract.ShowModal;
end;

procedure TForm1.Panel1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Panel1.BevelOuter := bvLowered;
end;

procedure TForm1.Panel1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Panel1.BevelOuter := bvSpace;
end;

procedure TForm1.Panel1Click(Sender: TObject);
begin
  {newContract_form.newContract := TnewContract.Create(Self);
  newContract_form.newContract.ShowModal;

  selectContractTypeForm.selectContractType := TselectContractType.create(self);
  selectContractTypeForm.selectContractType.ShowModal;
   }
  selectLoyalContractTypeForm.Form12 := TForm12.Create(self);
  selectLoyalContractTypeForm.Form12.ShowModal;
end;

procedure TForm1.Panel2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Panel2.BevelOuter := bvLowered;
end;

procedure TForm1.Panel2MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Panel2.BevelOuter := bvSpace;
end;

procedure TForm1.Panel2Click(Sender: TObject);
var
  X, idContract: Integer;
  wConfirm: Word;
  sMessage: string;
  dDateForDel: TDateTime;
begin
  X := StringGrid1.Row;
  {
  sEditContractNumber := StringGrid1.Cells[1, X];
  sMessage := 'Удалить договор ' + sEditContractNumber + ' ?';
  if sEditContractNumber <> '' then
  begin
    ADOQDay3.SQL.Add
      ('SELECT id,date_begin FROM contract_info WHERE contract_number=:pContractNumber');
    ADOQDay3.Parameters.ParamByName('pContractNumber').Value :=
      sEditContractNumber;
    ADOQDay3.Open;
    idContract := ADOQDay3.Fields[0].AsInteger;
    dDateForDel := ADOQDay3.Fields[1].AsDateTime;
    ADOQDay3.SQL.Clear;
    ADOQDay3.Close;
    if dDateForDel = DOpenDay then
    begin
      wConfirm := MessageDLG(sMessage, mtConfirmation, [mbYes, mbNo], 0);
      if wConfirm = mrYes then
      begin
        ADOQDay3.SQL.Add('DELETE * FROM contract_info WHERE id=:idCon');
        ADOQDay3.Parameters.ParamByName('idCon').Value := idContract;
        ADOQDay3.ExecSQL;
        ADOQDay3.SQL.Clear;
        ADOQDay3.Close;
        ADOQDay3.Close;
        ADOQDay3.SQL.Add
          ('DELETE * FROM product_info WHERE id_contract=:idCont');
        ADOQDay3.Parameters.ParamByName('idCont').Value := idContract;
        ADOQDay3.ExecSQL;
        ADOQDay3.SQL.Clear;
        ADOQDay3.Close;
        ADOQDay3.Close;
        ADOQDay3.SQL.Add
          ('DELETE * FROM operation WHERE id_contract_op=:idContr');
        ADOQDay3.Parameters.ParamByName('idContr').Value := idContract;
        ADOQDay3.ExecSQL;
        ADOQDay3.SQL.Clear;
        ADOQDay3.Close;
      end;
    end
    else
      wConfirm := MessageDLG('Операция вне рабочей даты', mtError, [mbOK], 0);
  end;
  SearchContract;  }
end;

procedure TForm1.Panel3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Panel3.BevelOuter := bvLowered;
end;

procedure TForm1.Panel3MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Panel3.BevelOuter := bvSpace;
end;

procedure TForm1.Panel3Click(Sender: TObject);
var
  X: Integer;
begin
  bEditMark := true;
  X := StringGrid1.Row;
  sEditContractNumber := StringGrid1.Cells[1, X];
  newContract_form.newContract := TnewContract.Create(Self);
  newContract_form.newContract.Caption := 'Информация о договоре ';
  newContract_form.newContract.ShowModal;
end;

procedure TForm1.Panel4MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Panel4.BevelOuter := bvLowered;
end;

procedure TForm1.Panel4MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Panel4.BevelOuter := bvSpace;
end;

procedure TForm1.Panel4Click(Sender: TObject);
var
  X: Integer;
begin
  X := StringGrid1.Row;
  sEditContractNumber := StringGrid1.Cells[1, X];
  bayout_form.bayout := Tbayout.Create(Self);
  bayout.Edit1.Text := sEditContractNumber;
  bayout_form.bayout.ShowModal;
end;

procedure TForm1.Panel5MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Panel5.BevelOuter := bvLowered;
end;

procedure TForm1.Panel5MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Panel5.BevelOuter := bvSpace;
end;

procedure TForm1.Panel5Click(Sender: TObject);
var
  X: Integer;
  contract : TENcontract2;
  deliverer  : TENdeliverer;
  idTarif: Integer;
begin
  // refactoring...
  X := StringGrid1.Row;
  sEditContractNumber := StringGrid1.Cells[1, X];
  repawning_form.repawning := Trepawning.Create(Self);
  repawning.Edit1.Text := sEditContractNumber;
  contract := TENcontract2.Create;
  deliverer := TENdeliverer.Create;
  contract := danado.contract.getContractByid(StrToInt(StringGrid1.Cells[10, X]));
  deliverer := danado.deliverer.getDelivererById(contract.idDeliverer);
  repawning.newIdTarif := deliverer.getId_tarif;
  repawning.deliverer := deliverer;
  repawning_form.repawning.ShowModal;
end;

procedure TForm1.N11Click(Sender: TObject);
begin
  month_form.month := Tmonth.Create(Self);
  month_form.month.ShowModal;
end;

procedure TForm1.N21Click(Sender: TObject);
begin
  RemovedFromStorage_form.RemovedFromStorage :=
    TRemovedFromStorage.Create(Self);
  RemovedFromStorage_form.RemovedFromStorage.ShowModal;
end;

procedure TForm1.N22Click(Sender: TObject);
begin
  editPasport_form.editPasport := TeditPasport.Create(Self);
  editPasport_form.editPasport.ShowModal;
end;

procedure TForm1.ExportXML(dDate1, dDate2: TDateTime);
var
  iIDStart, iIDEnd: Integer;
  dDateExport1, dDateExport2: TDateTime;
  sDate1, sDate2, sFileName, filialNumber: string;
  F: TextFile;
begin


  iIDStart := 0;
  dDateExport1 := dDate1;
  dDateExport2 := dDate2;
  if (dDateExport1 <> dDateExport2) then
  begin
    ADOXML.SQL.Add
      ('SELECT contract_info.id,idParentContract,id_deliverer,num_of_day,loan_amount,estimated_amount,');
    ADOXML.SQL.Add
      ('contract_number,date_begin,date_end,con_percent,amount_ref,con_status,');
    ADOXML.SQL.Add
      ('sum_percent,id_Employee,DateClose,SpecialCondition,EstimatedPercent,DollarPrice,EstimatedAmountInDollar,SpecialAction, contractTypeGroup FROM contract_info ');
    ADOXML.SQL.Add
      ('WHERE date_begin>=:pDateExport1 AND date_begin<=:pDateExport2 ORDER BY contract_info.id');
    ADOXML.Parameters.ParamByName('pDateExport1').Value :=
      IncDay(dDateExport1, -1);
    ADOXML.Parameters.ParamByName('pDateExport2').Value := dDateExport2;
  end
  else
  begin
    ADOXML.SQL.Add
      ('SELECT contract_info.id,idParentContract,id_deliverer,num_of_day,loan_amount,estimated_amount,');
    ADOXML.SQL.Add
      ('contract_number,date_begin,date_end,con_percent,amount_ref,con_status,');
    ADOXML.SQL.Add
      ('sum_percent,id_Employee,DateClose,SpecialCondition,EstimatedPercent,DollarPrice,EstimatedAmountInDollar,SpecialAction, contractTypeGroup FROM contract_info ');
    ADOXML.SQL.Add('WHERE date_begin=:pDateExport ORDER BY contract_info.id');
    ADOXML.Parameters.ParamByName('pDateExport').Value := dDateExport1;
  end;
  with ADOXML do
  begin
    ADOXML.Open;
    while not eof do
    begin
      if iIDStart = 0 then
        iIDStart := ADOXML.Fields[0].AsInteger;
      iIDEnd := ADOXML.Fields[0].AsInteger;
      Next;
    end;
    ADOXML.Close;
  end;
  ADOXML.Active := true;
  DatasetToXML(ADOXML, 'C:/Pawn/xml/contract_info.xml');
  ADOXML.SQL.Clear;
  ADOXML.Active := false;

  ADOXML.SQL.Add
    ('SELECT product_info.id,product,metal,num,test,price,weight,weight_net,');
  ADOXML.SQL.Add('estimated_amount,id_contract,product_status ');
  ADOXML.SQL.Add
    ('FROM product_info WHERE id_contract>=:pIDStart AND id_contract<=:pIDEnd');
  ADOXML.Parameters.ParamByName('pIDStart').Value := iIDStart;
  ADOXML.Parameters.ParamByName('pIDEnd').Value := iIDEnd;
  ADOXML.Active := true;
  DatasetToXML(ADOXML, 'C:/Pawn/xml/product_info.xml');
  ADOXML.SQL.Clear;
  ADOXML.Active := false;

  if (dDateExport1 <> dDateExport2) then
  begin
    ADOXML.SQL.Add
      ('SELECT id,op,date_op,sum_op,id_contract_op,percent_op,delay_op,TimestampField ');
    ADOXML.SQL.Add
      ('FROM operation WHERE date_op>=:pDateOp1 AND date_op<=:pDateOp2 ORDER BY date_op');
    ADOXML.Parameters.ParamByName('pDateOp1').Value := IncDay(dDateExport1, -1);
    ADOXML.Parameters.ParamByName('pDateOp2').Value := dDateExport2;
  end
  else
  begin
    ADOXML.SQL.Add
      ('SELECT id,op,date_op,sum_op,id_contract_op,percent_op,delay_op,TimestampField ');
    ADOXML.SQL.Add('FROM operation WHERE date_op=:pDateOp ORDER BY date_op');
    ADOXML.Parameters.ParamByName('pDateOp').Value := dDateExport1;

  end;
  ADOXML.Active := true;
  DatasetToXML(ADOXML, 'C:/Pawn/xml/operation.xml');
  ADOXML.SQL.Clear;
  ADOXML.Active := false;

  if (dDateExport1 <> dDateExport2) then
  begin
    ADOXML.SQL.Add
      ('SELECT deliverer.id, deliverer.name, deliverer.id_tarif, deliverer.DateAdd, deliverer.telephon, deliverer.id_group_of_risk');
    ADOXML.SQL.Add
      ('FROM deliverer INNER JOIN contract_info ON deliverer.id=contract_info.id_deliverer');
    ADOXML.SQL.Add
      ('WHERE (DateAdd>=:pDateExport1 AND DateAdd<=:pDateExport2) OR (contract_info.date_begin>=:pDateExport3 AND contract_info.date_begin<=:pDateExport4)');
    ADOXML.Parameters.ParamByName('pDateExport1').Value :=
      IncDay(dDateExport1, -1);
    ADOXML.Parameters.ParamByName('pDateExport2').Value := dDateExport2;
    ADOXML.Parameters.ParamByName('pDateExport3').Value :=
      IncDay(dDateExport1, -1);
    ADOXML.Parameters.ParamByName('pDateExport4').Value := dDateExport2;
  end
  else
  begin
    ADOXML.SQL.Add
      ('SELECT deliverer.id, deliverer.name, deliverer.id_tarif, deliverer.DateAdd, deliverer.telephon');
    ADOXML.SQL.Add
      ('FROM deliverer INNER JOIN contract_info ON deliverer.id=contract_info.id_deliverer');
    ADOXML.SQL.Add
      ('WHERE (contract_info.date_begin=:pDateExport2) OR (DateAdd=:pDateExport)');
    ADOXML.Parameters.ParamByName('pDateExport').Value := dDateExport1;
    ADOXML.Parameters.ParamByName('pDateExport2').Value := dDateExport1;
  end;
  ADOXML.Active := true;
  DatasetToXML(ADOXML, 'C:/Pawn/xml/deliverer.xml');
  ADOXML.SQL.Clear;
  ADOXML.Active := false;

  ADOXML.SQL.Add('SELECT id,name,Instruction');
  ADOXML.SQL.Add('FROM employee');
  ADOXML.Active := true;
  DatasetToXML(ADOXML, 'C:/Pawn/xml/employee.xml');
  ADOXML.SQL.Clear;
  ADOXML.Active := false;
 { //FOR LOTOTRON
  ADOXML.SQL.Add('SELECT * ');
  ADOXML.SQL.Add('FROM lototron');
  ADOXML.Active := true;
  DatasetToXML(ADOXML, 'C:/Pawn/xml/slimLoto.xml');
  ADOXML.SQL.Clear;
  ADOXML.Active := false;
 }
  sDate1 := FormatDateTime('ddmmyyyy', dDateExport1);
  sDate2 := FormatDateTime('ddmmyyyy', dDateExport2);

  ADOQDay3.SQL.Add('SELECT name_filial FROM pasport');
  ADOQDay3.Open;
  sFileName := 'daily_' + ADOQDay3.Fields[0].AsString + '_' + sDate1 + '_' +
    sDate2 + '.rar';
  if Length(ADOQDay3.Fields[0].AsString) = 1 then
    filialNumber := '00' + ADOQDay3.Fields[0].AsString;
  if Length(ADOQDay3.Fields[0].AsString) = 2 then
    filialNumber := '0' + ADOQDay3.Fields[0].AsString;
  if Length(ADOQDay3.Fields[0].AsString) = 3 then
    filialNumber := ADOQDay3.Fields[0].AsString;
  ADOQDay3.Close;
  ADOQDay3.SQL.Clear;
  ExecAndWait('C:\Pawn\Rar.exe', 'a C:\Pawn\archives\' + sFileName +
    ' C:\Pawn\xml\*.xml -ep', 0);
  CopyFile(PWideChar('C:\Pawn\archives\' + sFileName),
    PWideChar('C:\Dropbox\' + filialNumber + '\data\' + sFileName), false);
  AssignFile(F, 'C:/Pawn/Number');
  Rewrite(F);
  WriteLn(F, filialNumber);
  CloseFile(F);
end;
 // EXPORT ALL OP
procedure TForm1.ExportXML2(dDate1, dDate2: TDateTime);
var
  iIDStart, iIDEnd: Integer;
  dDateExport1, dDateExport2: TDateTime;
  sDate1, sDate2, sFileName, filialNumber: string;
  F: TextFile;
begin
  iIDStart := 0;
  dDateExport1 := dDate1;
  dDateExport2 := dDate2;

  ADOXML.SQL.Clear;
  ADOXML.Active := false;

  ADOXML.SQL.Add
    ('SELECT id, TimeStampField');
  ADOXML.SQL.Add
    ('FROM operation WHERE date_op >= #12/01/2013# AND date_op < #01/01/2014# AND timeStampField <> NULL');
   ADOXML.Active := true;
  DatasetToXML(ADOXML, 'C:/Pawn/xml/operation2.xml');
  ADOXML.SQL.Clear;
  ADOXML.Active := false;

  sDate1 := FormatDateTime('ddmmyyyy', dDateExport1);
  sDate2 := FormatDateTime('ddmmyyyy', dDateExport2);

  ADOQDay3.SQL.Add('SELECT name_filial FROM pasport');
  ADOQDay3.Open;
  sFileName := 'operation_' + ADOQDay3.Fields[0].AsString + '_' + sDate1 + '_' +
    sDate2 + '.rar';
  if Length(ADOQDay3.Fields[0].AsString) = 1 then
    filialNumber := '00' + ADOQDay3.Fields[0].AsString;
  if Length(ADOQDay3.Fields[0].AsString) = 2 then
    filialNumber := '0' + ADOQDay3.Fields[0].AsString;
  if Length(ADOQDay3.Fields[0].AsString) = 3 then
    filialNumber := ADOQDay3.Fields[0].AsString;
  ADOQDay3.Close;
  ADOQDay3.SQL.Clear;
  ExecAndWait('C:\Pawn\Rar.exe', 'a C:\Pawn\archives\' + sFileName +
    ' C:\Pawn\xml\*.xml -ep', 0);
  CopyFile(PWideChar('C:\Pawn\archives\' + sFileName),
    PWideChar('C:\Dropbox\' + filialNumber + '\data\' + sFileName), false);
  AssignFile(F, 'C:/Pawn/Number');
  Rewrite(F);
  WriteLn(F, filialNumber);
  CloseFile(F);
end;

procedure TForm1.ExportXML3(dDate1, dDate2: TDateTime);
var
  iIDStart, iIDEnd: Integer;
  dDateExport1, dDateExport2: TDateTime;
  sDate1, sDate2, sFileName, filialNumber: string;
  F: TextFile;
begin
  iIDStart := 0;
  dDateExport1 := dDate1;
  dDateExport2 := dDate2;

  ADOXML.SQL.Clear;
  ADOXML.Active := false;

  ADOXML.SQL.Add
    ('SELECT id, name, date_of_burn, adress, pasport_ser, pasport_num, pasport_vydan, pasport_date, inn , id_tarif, telephon');
  ADOXML.SQL.Add
    ('FROM deliverer ORDER BY id ASC');
   ADOXML.Active := true;
  DatasetToXML(ADOXML, 'C:/Pawn/xml/deliverer3.xml');
  ADOXML.SQL.Clear;
  ADOXML.Active := false;

  sDate1 := FormatDateTime('ddmmyyyy', dDateExport1);
  sDate2 := FormatDateTime('ddmmyyyy', dDateExport2);

  ADOQDay3.SQL.Add('SELECT name_filial FROM pasport');
  ADOQDay3.Open;
  sFileName := 'deliverer3_' + ADOQDay3.Fields[0].AsString + '_' + sDate1 + '_' +
    sDate2 + '.rar';
  if Length(ADOQDay3.Fields[0].AsString) = 1 then
    filialNumber := '00' + ADOQDay3.Fields[0].AsString;
  if Length(ADOQDay3.Fields[0].AsString) = 2 then
    filialNumber := '0' + ADOQDay3.Fields[0].AsString;
  if Length(ADOQDay3.Fields[0].AsString) = 3 then
    filialNumber := ADOQDay3.Fields[0].AsString;
  ADOQDay3.Close;
  ADOQDay3.SQL.Clear;
  ExecAndWait('C:\Pawn\Rar.exe', 'a C:\Pawn\archives\' + sFileName +
    ' C:\Pawn\xml\*.xml -ep', 0);
  CopyFile(PWideChar('C:\Pawn\archives\' + sFileName),
    PWideChar('C:\Dropbox\' + filialNumber + '\data\' + sFileName), false);
  AssignFile(F, 'C:/Pawn/Number');
  Rewrite(F);
  WriteLn(F, filialNumber);
  CloseFile(F);
end;

procedure TForm1.fillFormFromQuery(q1: TADOQuery);
var
  i : Integer;
begin
  i := 0;
  StringGrid1.RowCount := 2;
  StringGrid1.Rows[1].Clear;
  if (q1.RecordCount > 0) then  begin
    StringGrid1.RowCount := q1.RecordCount+1;
    with q1 do begin
      while not eof do begin
      //ShowMEssage(IntToStr(StringGrid1.RowCount));
        if (q1.FieldByName('date_begin').AsDateTime <= getLastDate ) then begin
          StringGrid1.Cells[2, i + 1] := '';
          StringGrid1.Cells[1, i + 1] := '';
          StringGrid1.Cells[8, i + 1] := '';
        end else begin
          StringGrid1.Cells[2, i + 1] := q1.FieldByName('date_begin').AsString;
          StringGrid1.Cells[1, i + 1] := q1.FieldByName('contract_number').AsString;
          StringGrid1.Cells[8, i + 1] := q1.FieldByName('DateClose').AsString;
        end;
        StringGrid1.Cells[0, i + 1] := IntToStr(i + 1);
        StringGrid1.Cells[3, i + 1] := q1.FieldByName('loan_amount').AsString;
        StringGrid1.Cells[4, i + 1] := q1.FieldByName('estimated_amount').AsString;
        StringGrid1.Cells[6, i + 1] := q1.FieldByName('employeeName').AsString;
        StringGrid1.Cells[5, i + 1] := q1.FieldByName('delivererName').AsString;
        if q1.FieldByName('con_status').AsBoolean = true 
          then StringGrid1.Cells[7, i + 1] := 'Открыт'
          else StringGrid1.Cells[7, i + 1] := 'Закрыт';
        StringGrid1.Cells[9, i+1] := MyUtils.getConditionName(q1.FieldByName('ContractTypeGroup').AsInteger);
        StringGrid1.Cells[10, i+1] := q1.FieldByName('id').AsString;   
        next;
        inc(i);
      end;
    end;
  end;
  q1.Destroy;
end;

procedure TForm1.StringGrid1DblClick(Sender: TObject);
var
  X: Integer;
begin
  bEditMark := true;
  X := StringGrid1.Row;
  sEditContractNumber := StringGrid1.Cells[1, X];
  sEditContractId := StringGrid1.Cells[10, X];
  newContract_form.newContract := TnewContract.Create(Self);
  newContract_form.newContract.Caption := 'Информация о договоре';
  newContract_form.newContract.ShowModal;
end;




procedure TForm1.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  {
  var
  contract : Tcontract;

contract := TContract.Create();
contract := TContractADO.Create.getContractByNumber(StringGrid1.Cells[1,StringGrid1.Row]);

with StringGrid1, StringGrid1.Canvas do
if (contract.specialCondition = true) then
 begin
  Canvas.Brush.Color:=clRed;
  FillRect(Rect);
  TextOut(Rect.Left+2, Rect.Top+2, Cells[ACol, ARow]);
 end;
 }
end;

procedure TForm1.N24Click(Sender: TObject);
begin
  export_form.exportbd := Texportbd.Create(Self);
  export_form.exportbd.ShowModal;
end;

procedure TForm1.SearchContractOld;
var
  contracts: TContractsList;
  i: Integer;
  contractLength: Integer;
  mask: string;
begin
  mask := Edit3.Text;

  if (Length(mask)>=3) then begin
    contracts := TContractADO.Create.getContractsByDelivererName(mask+'%');
    i := 0;
    contractLength := Length(contracts);
    StringGrid1.RowCount := 2;
    StringGrid1.Rows[1].Clear;

    if (contractLength>0) then begin
      while (i < contractLength) do begin
        StringGrid1.RowCount := StringGrid1.RowCount + 1;
        StringGrid1.Cells[0, i+1] := IntToStr(i+1);
        StringGrid1.Cells[1, i+1] := contracts[i].number;
        StringGrid1.Cells[2, i+1] := DateToStr(contracts[i].dateOfTheContract);
        StringGrid1.Cells[3, i+1] := FloatToStr(contracts[i].loanAmount);
        StringGrid1.Cells[4, i+1] := FloatToStr(contracts[i].estimatedAmount);
        StringGrid1.Cells[5, i+1] := contracts[i].deliverer.name;
        StringGrid1.Cells[6, i+1] := contracts[i].employee.name;
        StringGrid1.Cells[7, i+1] := '';//ntracts[i-1]
        StringGrid1.Cells[8, i+1] := '';//contracts[i-1]
        StringGrid1.Cells[9, i+1] := IntToStr(contracts[i].contractTypeGroup);
        Inc(i);
      end;
    end
    else begin
      StringGrid1.RowCount := 2;
      StringGrid1.Rows[1].Clear;
    end;

  end;
end;

function TForm1.searchDelivererContractsByidContract(id1: Integer): TADOQuery;
var
  q1, res : TADOQUery;
  sql1,sql2 : String;
  idDeliverer : Integer;
begin
  q1 := TADOQuery.Create(nil);
  res  := TADOQuery.Create(nil);

  q1.ConnectionString := danado.utils.getConnectionString;
  res.ConnectionString := danado.utils.getConnectionString;

  sql1 := 'SELECT id_deliverer FROM contract_info WHERE id = :pId';
  q1.SQL.Add(sql1);
  q1.Parameters.ParamByName('pId').Value := id1;

  q1.Open;
  if (q1.RecordCount > 0) then begin
    idDeliverer := q1.FieldByName('id_deliverer').AsInteger;
    sql2 := 'SELECT TOP 50 contract_info.loan_amount, contract_info.estimated_amount,contract_info.date_begin,contract_info.contract_number, contract_info.con_status,contract_info.DateClose, contract_info.id,contract_info.contractTypeGroup, ';
    sql2 := sql2 + 'deliverer.name as delivererName,employee.name as employeeName ';
    sql2 := sql2 + 'FROM (contract_info LEFT JOIN deliverer ON contract_info.id_deliverer = deliverer.id) LEFT JOIN employee ON contract_info.id_Employee = employee.id ';
    sql2 := sql2 + ' WHERE (contract_info.id_deliverer = :pIdDeliverer) ';
    sql2 := sql2 + 'ORDER BY con_status ASC, date_begin DESC';
    
    res.SQL.Add(sql2);

    res.Parameters.ParamByName('pIdDeliverer').Value := idDeliverer;
    res.Open;
  end;
  RESULT := res;
end;

procedure TForm1.SearchContract;
var
  i: Integer;
  sWorkDay, sWorkDay2, sName: string;
  numClosedContracts: Integer;
  numRepawningContracts: Integer;
  numOpenContracts: Integer;
  contractADO : TContractADO;
begin
  i := 0;
  StringGrid1.RowCount := 2;
  contractADO := TContractADO.Create;

  if (DTP1.Date > DTP2.Date) then
  begin
    DTP2.Date := DTP1.Date;
  end;
  ADOQDay3.SQL.Clear;
  if ComboBox1.ItemIndex = 0 then
  begin
    if (Edit1.Text = '') and (Edit3.Text = '') then
    begin;
      sWorkDay := DateToStr(DTP1.Date);
      sWorkDay2 := DateToStr(DTP2.Date);
      if rb1.Checked then
      begin
        ADOQDay3.SQL.Add
          ('SELECT deliverer.name,loan_amount,estimated_amount,contract_number,date_begin,con_status,employee.name,DateClose, contract_info.id , contract_info.contractTypeGroup');
        ADOQDay3.SQL.Add
          ('FROM (contract_info INNER JOIN deliverer ON contract_info.id_deliverer=deliverer.id) INNER JOIN employee ON contract_info.id_Employee=employee.id WHERE date_begin>=:pdate_begin AND date_begin<=:pdate_end ORDER BY con_status ASC, date_begin DESC');
        ADOQDay3.Parameters.ParamByName('pdate_begin').Value := sWorkDay;
        // DTP1.DateTime;
        ADOQDay3.Parameters.ParamByName('pdate_end').Value := sWorkDay2;
        // DTP2.DateTime;
      end;
      if rb2.Checked then
      begin
        ADOQDay3.SQL.Add
          ('SELECT deliverer.name,loan_amount,estimated_amount,contract_number,date_begin,con_status,employee.name,DateClose, contract_info.id , contract_info.contractTypeGroup');
        ADOQDay3.SQL.Add
          ('FROM (contract_info INNER JOIN deliverer ON contract_info.id_deliverer=deliverer.id) INNER JOIN employee ON contract_info.id_Employee=employee.id ');
        ADOQDay3.SQL.Add
          ('WHERE ((DateClose>=:pDateClose1 AND DateClose<=:pDateClose2) AND (date_begin >:pLastDate))');
        ADOQDay3.SQL.Add('ORDER BY con_status ASC, date_begin DESC');
        ADOQDay3.Parameters.ParamByName('pDateClose1').Value := sWorkDay;
        // DTP1.Date;
        ADOQDay3.Parameters.ParamByName('pDateClose2').Value := sWorkDay2;

        ADOQDay3.Parameters.ParamByName('pLastDate').Value := dateToStr(getLastDate);
        //howMessage();
        // DTP2.Date;
      end;
    end
    else
    begin
      if (Edit3.Text <> '') then
      begin
        sName := Edit3.Text + '%';
        ADOQDay3.SQL.Add
          ('SELECT deliverer.name,loan_amount,estimated_amount,contract_number,date_begin,con_status,employee.name,DateClose, contract_info.id, contract_info.contractTypeGroup ');
        ADOQDay3.SQL.Add
          ('FROM (contract_info INNER JOIN deliverer ON contract_info.id_deliverer=deliverer.id) INNER JOIN employee ON contract_info.id_Employee=employee.id WHERE deliverer.name LIKE :pename ORDER BY con_status ASC, date_begin DESC');
        ADOQDay3.Parameters.ParamByName('pename').Value := sName;
      end
      else
      begin

        if (Edit1.Text[1] = 'P') OR (Edit1.Text[1] = 'p') then
        begin
          sName := Edit1.Text + '%';
        end
        else
        begin
          if (Length(Edit1.Text) >= 4) then
          begin
            sName := '%' + Edit1.Text + '%';
          end
          else
          begin
            sName := Edit1.Text + '%';
          end;
        end;
        { SELECT contract_info.*, deliverer.*, employee.*, contract_info.contract_number
FROM (contract_info LEFT JOIN deliverer ON contract_info.id_deliverer = deliverer.id) LEFT JOIN employee ON contract_info.id_Employee = employee.id
WHERE (((contract_info.contract_number) Like "*001*"))
ORDER BY contract_info.date_begin DESC


         }

        ADOQDay3.SQL.Add
          ('SELECT deliverer.name,loan_amount,estimated_amount,contract_number,date_begin,con_status,employee.name,DateClose, contract_info.id, contract_info.contractTypeGroup ');
        ADOQDay3.SQL.Add
          ('FROM (contract_info INNER JOIN deliverer ON contract_info.id_deliverer=deliverer.id) INNER JOIN employee ON contract_info.id_Employee=employee.id WHERE contract_number like :pContractNumb');
        ADOQDay3.SQL.Add(' ORDER BY con_status ASC, date_begin DESC');
        ADOQDay3.Parameters.ParamByName('pContractNumb').Value := sName;
      end;
    end;
  end;
  if ComboBox1.ItemIndex = 1 then
  begin
    if (Edit1.Text = '') and (Edit3.Text = '') then
    begin
      sWorkDay := DateToStr(DTP1.Date);
      sWorkDay2 := DateToStr(DTP2.Date);
      ADOQDay3.SQL.Add
        ('SELECT deliverer.name,loan_amount,estimated_amount,contract_number,date_begin,con_status,employee.name,DateClose, contract_info.id, contract_info.contractTypeGroup');
      ADOQDay3.SQL.Add
        ('FROM (contract_info INNER JOIN deliverer ON contract_info.id_deliverer=deliverer.id) INNER JOIN employee ON contract_info.id_Employee=employee.id WHERE date_begin>=:pdate_begin AND date_begin<=:pdate_end AND con_status=true ');
      ADOQDay3.SQL.Add(' ORDER BY con_status ASC, date_begin DESC');
      ADOQDay3.Parameters.ParamByName('pdate_begin').Value := DTP1.Date;
      ADOQDay3.Parameters.ParamByName('pdate_end').Value := DTP2.Date;
    end
    else
    begin
      if (Edit3.Text <> '') then
      begin
        sName := Edit3.Text + '%';
        ADOQDay3.SQL.Add
          ('SELECT deliverer.name,loan_amount,estimated_amount,contract_number,date_begin,con_status,employee.name,DateClose, contract_info.id , contract_info.contractTypeGroup');
        ADOQDay3.SQL.Add
          ('FROM (contract_info INNER JOIN deliverer ON contract_info.id_deliverer=deliverer.id) INNER JOIN employee ON contract_info.id_Employee=employee.id WHERE deliverer.name LIKE :pename AND con_status=true ORDER BY con_status ASC, date_begin DESC');
        ADOQDay3.Parameters.ParamByName('pename').Value := sName;
      end
      else
      begin
        if (Edit1.Text[1] = 'P') OR (Edit1.Text[1] = 'p') then
        begin
          sName := Edit1.Text + '%';
        end
        else
        begin
          if (Length(Edit1.Text) >= 5) then
          begin
            sName := '%' + Edit1.Text + '%';
          end
          else
          begin
            sName := Edit1.Text + '%';
          end;
        end;
        ADOQDay3.SQL.Add
          ('SELECT deliverer.name,loan_amount,estimated_amount,contract_number,date_begin,con_status,employee.name,DateClose, contract_info.id, contract_info.contractTypeGroup ');
        ADOQDay3.SQL.Add
          ('FROM (contract_info INNER JOIN deliverer ON contract_info.id_deliverer=deliverer.id) INNER JOIN employee ON contract_info.id_Employee=employee.id WHERE contract_number like :pContractNumb AND con_status=-1');
        ADOQDay3.Parameters.ParamByName('pContractNumb').Value := sName;
      end;
    end;
  end;
  if ComboBox1.ItemIndex = 2 then
  begin
    if (Edit1.Text = '') and (Edit3.Text = '') then
    begin
      sWorkDay := DateToStr(DTP1.Date);
      sWorkDay2 := DateToStr(DTP2.Date);
      ADOQDay3.SQL.Add
        ('SELECT deliverer.name,loan_amount,estimated_amount,contract_number,date_begin,con_status,employee.name,DateClose, contract_info.id, contract_info.contractTypeGroup ');
      ADOQDay3.SQL.Add
        ('FROM (contract_info INNER JOIN deliverer ON contract_info.id_deliverer=deliverer.id) INNER JOIN employee ON contract_info.id_Employee=employee.id WHERE date_begin>=:pdate_begin AND date_begin<=:pdate_end AND con_status=0 ');
      ADOQDay3.SQL.Add(' ORDER BY con_status ASC, date_begin DESC');
      ADOQDay3.Parameters.ParamByName('pdate_begin').Value := DTP1.Date;
      ADOQDay3.Parameters.ParamByName('pdate_end').Value := DTP2.Date;
    end
    else
    begin
      if (Edit3.Text <> '') then
      begin
        sName := Edit3.Text + '%';
        ADOQDay3.SQL.Add
          ('SELECT deliverer.name,loan_amount,estimated_amount,contract_number,date_begin,con_status,employee.name,DateClose, contract_info.id , contract_info.contractTypeGroup');
        ADOQDay3.SQL.Add
          ('FROM (contract_info INNER JOIN deliverer ON contract_info.id_deliverer=deliverer.id) INNER JOIN employee ON contract_info.id_Employee=employee.id WHERE deliverer.name LIKE :pename AND con_status=0 ORDER BY con_status ASC, date_begin DESC');
        ADOQDay3.Parameters.ParamByName('pename').Value := sName;
      end
      else
      begin
        if (Edit1.Text[1] = 'P') OR (Edit1.Text[1] = 'p') then
        begin
          sName := Edit1.Text + '%';
        end
        else
        begin
          if (Length(Edit1.Text) >= 5) then
          begin
            sName := '%' + Edit1.Text + '%';
          end
          else
          begin
            sName := Edit1.Text + '%';
          end;
        end;
        ADOQDay3.SQL.Add
          ('SELECT deliverer.name,loan_amount,estimated_amount,contract_number,date_begin,con_status,employee.name,DateClose, contract_info.id , contract_info.contractTypeGroup, contract_info.id');
        ADOQDay3.SQL.Add
          ('FROM (contract_info INNER JOIN deliverer ON contract_info.id_deliverer=deliverer.id) INNER JOIN employee ON contract_info.id_Employee=employee.id WHERE contract_number like :pContractNumb AND con_status=0');
        ADOQDay3.Parameters.ParamByName('pContractNumb').Value := sName;
      end;
    end;
  end;
  with ADOQDay3 do
  begin
    ADOQDay3.Open;
    if not(ADOQDay3.IsEmpty) then
    begin
      StringGrid1.RowCount := 1;

      while not eof do
      begin
        StringGrid1.RowCount := StringGrid1.RowCount + 1;
          if (ADOQDay3.Fields[4].AsDateTime <= getLastDate ) then begin
            StringGrid1.Cells[2, i + 1] := '';
            StringGrid1.Cells[1, i + 1] := '';
            StringGrid1.Cells[8, i + 1] := '';
          end else begin
            StringGrid1.Cells[2, i + 1] := ADOQDay3.Fields[4].AsString;
            StringGrid1.Cells[1, i + 1] := ADOQDay3.Fields[3].AsString;
            StringGrid1.Cells[8, i + 1] := ADOQDay3.Fields[7].AsString;
          end;

        StringGrid1.Cells[0, i + 1] := IntToStr(i + 1);


        StringGrid1.Cells[3, i + 1] := ADOQDay3.Fields[1].AsString;
        StringGrid1.Cells[4, i + 1] := ADOQDay3.Fields[2].AsString;
        StringGrid1.Cells[6, i + 1] := ADOQDay3.Fields[6].AsString;
        StringGrid1.Cells[5, i + 1] := ADOQDay3.Fields[0].AsString;
        if ADOQDay3.Fields[5].AsBoolean = true then
          StringGrid1.Cells[7, i + 1] := 'Открыт'
        else
        begin
          StringGrid1.Cells[7, i + 1] := 'Закрыт';
        end;

        if (ADOQDay3.Fields[3].AsString[1] = 'P') then
          Inc(numRepawningContracts);
        if (ADOQDay3.Fields[3].AsString[1] <> 'P') then
          Inc(numOpenContracts);
          StringGrid1.Cells[9, i+1] := MyUtils.getConditionName(ADOQDay3.Fields[9].AsInteger);
          StringGrid1.Cells[10, i+1] := ADOQDay3.FieldByName('id').AsString;
          //StringGrid1.ColWidths[10] := 0;
        Inc(i);
        Next;
      end;
      ADOQDay3.Close
    end
    else
    begin
      ADOQDay3.Close;

      StringGrid1.RowCount := 2;
      StringGrid1.Rows[1].Clear;

    end;
  end;
  ADOQDay3.SQL.Clear;
  if StringGrid1.RowCount > 1 then
    StringGrid1.FixedRows := 1;
  numContracts(DTP1.Date, DTP2.Date);
end;

procedure TForm1.SearchExtension;
var
  i: Integer;
  idParentContract: Integer;
begin

if(StringGrid1.Cells[10,StringGrid1.Row] <> '') then begin
    sEditContractId := StringGrid1.Cells[10,StringGrid1.Row];

    i := 0;
    StringGrid1.RowCount := 2;
    ADOQDay3.SQL.Add
        ('SELECT idParentContract FROM contract_info WHERE id=:pid');
    ADOQDay3.Parameters.ParamByName('pid').Value := sEditContractId;
    ADOQDay3.Open;
    idParentContract := ADOQDay3.Fields[0].AsInteger;
    ADOQDay3.SQL.Clear;
    ADOQDay3.Close;
    if (idParentContract=0) then begin
      idParentContract := strToInt(sEditContractId);
    end;

    ADOQDay3.SQL.Add
      ('SELECT deliverer.name,loan_amount,estimated_amount,contract_number,date_begin,con_status,employee.name,DateClose ,contract_info.contractTypeGroup, contract_info.id');
    ADOQDay3.SQL.Add
      ('FROM (contract_info INNER JOIN deliverer ON contract_info.id_deliverer=deliverer.id) INNER JOIN employee ON contract_info.id_Employee=employee.id WHERE contract_info.idParentContract=:pIdParentContract OR contract_info.id=:pIdParentContract2');
    ADOQDay3.SQL.Add
      (' ORDER BY contract_info.con_status ASC, contract_info.id DESC');
    ADOQDay3.Parameters.ParamByName('pIdParentContract').Value :=
      idParentContract;
    ADOQDay3.Parameters.ParamByName('pIdParentContract2').Value :=
      idParentContract;

    with ADOQDay3 do
    begin
      ADOQDay3.Open;

      while not eof do
      begin
        StringGrid1.RowCount := StringGrid1.RowCount + 1;


        if (ADOQDay3.Fields[4].AsDateTime <= getLastDate ) then begin
            StringGrid1.Cells[2, i + 1] := '';
            StringGrid1.Cells[1, i + 1] := '';
            StringGrid1.Cells[8, i + 1] := '';
          end else begin
            StringGrid1.Cells[2, i + 1] := ADOQDay3.Fields[4].AsString;
            StringGrid1.Cells[1, i + 1] := ADOQDay3.Fields[3].AsString;
            StringGrid1.Cells[8, i + 1] := ADOQDay3.Fields[7].AsString;
          end;
        StringGrid1.Cells[0, i + 1] := IntToStr(i + 1);

        StringGrid1.Cells[3, i + 1] := ADOQDay3.Fields[1].AsString;
        StringGrid1.Cells[4, i + 1] := ADOQDay3.Fields[2].AsString;
        StringGrid1.Cells[6, i + 1] := ADOQDay3.Fields[6].AsString;
        StringGrid1.Cells[5, i + 1] := ADOQDay3.Fields[0].AsString;
        StringGrid1.Cells[10, i+ 1] := ADOQDay3.fieldByName('id').AsString;
        if ADOQDay3.Fields[5].AsBoolean = true then
          StringGrid1.Cells[7, i + 1] := 'Открыт'
        else
          StringGrid1.Cells[7, i + 1] := 'Закрыт';
        StringGrid1.Cells[9, i + 1] := MyUtils.getConditionName(ADOQDay3.Fields[8].AsInteger);
        Inc(i);
        Next;
      end;
      StringGrid1.RowCount := StringGrid1.RowCount - 1;
      ADOQDay3.Close
    end;

    ADOQDay3.SQL.Clear;

    if StringGrid1.RowCount > 1 then
    begin
      StringGrid1.FixedRows := 1;
    end;
    StringGrid1.Row := 1;

end;
end;

function TForm1.searchOpenByDate(date1, date2: TDAte): TADOQuery;
var
  res : TADOQuery;
  sql1 : String;
begin
  res := TADOQUery.Create(nil);
  res.ConnectionString := DANADO.utils.getConnectionString;

  sql1 := 'SELECT TOP 50 contract_info.loan_amount, contract_info.estimated_amount,contract_info.date_begin,contract_info.contract_number, contract_info.con_status,contract_info.DateClose, contract_info.id,contract_info.contractTypeGroup, ';
  sql1 := sql1 + 'deliverer.name as delivererName,employee.name as employeeName ';
  sql1 := sql1 + 'FROM (contract_info LEFT JOIN deliverer ON contract_info.id_deliverer = deliverer.id) LEFT JOIN employee ON contract_info.id_Employee = employee.id ';
  sql1 := sql1 + ' WHERE (contract_info.date_begin < :pdate1) AND contract_info';
  sql1 := sql1 + 'ORDER BY contract_info.con_status,contract_info.id DESC';
  // (contract_info.con_status =-1) AND
  res.SQL.Add(sql1);

 // res.Parameters.ParamByName('pSearchText').Value := '%'+searchtext+'%';
  res.Open;

  RESULT := res;

end;

procedure TForm1.StringGrid1Click(Sender: TObject);
begin
  ContractInfo;
end;

procedure TForm1.ContractInfo;
var
  X, i: Integer;
  bStatus: Boolean;
  inLastDate : TDate;
begin
  i := 0;
  X := StringGrid1.Row;
  sEditContractId :=  StringGrid1.Cells[10,X];
  if (sEditContractId = '') then begin
    sEditContractId := '0';
  end;
  sEditContractNumber := StringGrid1.Cells[1, X];
  StaticText8.Caption := StringGrid1.Cells[1, X];
  ADOQDay3.SQL.Add
    ('SELECT con_status FROM contract_info WHERE id=:pId');
  ADOQDay3.Parameters.ParamByName('pId').Value := sEditContractId;
  ADOQDay3.Open;
  iIDContract := StrToInt(sEditContractId);
  bStatus := ADOQDay3.Fields[0].AsBoolean;
  ADOQDay3.SQL.Clear;
  ADOQDay3.Close;
  if not(bStatus) then
  begin
    Panel4.Enabled := false;
    Panel4.Font.Color := ClSilver;
    Panel5.Enabled := false;
    Panel5.Font.Color := ClSilver;
  end
  else
  begin
    Panel4.Enabled := true;
    Panel4.Font.Color := clWindowText;
    Panel5.Enabled := true;
    Panel5.Font.Color := clWindowText;
  end;
  if iIDContract <> 0 then
  begin
    ADOQDay3.SQL.Add
      ('SELECT op,date_op,sum_op,percent_op,delay_op,timeStampField FROM operation WHERE id_contract_op=:pIDContract ORDER BY op');
    ADOQDay3.Parameters.ParamByName('pIDContract').Value := iIDContract;
    with ADOQDay3 do
    begin
      ADOQDay3.Open;
      if not(ADOQDay3.IsEmpty) then
        StringGrid2.RowCount := 1
      else
      begin
        StringGrid2.RowCount := 2;
        StringGrid2.Rows[1].Clear;
      end;
       inLastDate := ADOQDay3.FieldByName('date_op').AsDateTime;
      while not eof do
      begin
        if (inLastDate <= getLastDate) then begin
          StringGrid2.Cells[2, i + 1] := '';
          StringGrid2.Cells[6, i + 1] := '';
        end else begin

          StringGrid2.Cells[2, i + 1] := ADOQDay3.Fields[1].AsString;
          StringGrid2.Cells[6, i + 1] := ADOQDay3.FieldByName('timeStampField').AsString;
        end;

        StringGrid2.RowCount := StringGrid2.RowCount + 1;
        StringGrid2.Cells[0, i + 1] := IntToStr(i + 1);
        if ADOQDay3.Fields[0].AsInteger = 1 then
          StringGrid2.Cells[1, i + 1] := 'Открытие договора';
        if ADOQDay3.Fields[0].AsInteger = 2 then
          StringGrid2.Cells[1, i + 1] := 'Закрытие договора';
        if ADOQDay3.Fields[0].AsInteger = 5 then
          StringGrid2.Cells[1, i + 1] := 'Закрытие договора*';

        StringGrid2.Cells[3, i + 1] := ADOQDay3.Fields[2].AsString;
        StringGrid2.Cells[4, i + 1] := ADOQDay3.Fields[3].AsString;
        StringGrid2.Cells[5, i + 1] := ADOQDay3.Fields[4].AsString;

        Inc(i);
        Next;
      end;
      ADOQDay3.Close;
    end;
    ADOQDay3.SQL.Clear;
    if StringGrid2.RowCount > 1 then
      StringGrid2.FixedRows := 1;
  end;
end;

procedure TForm1.ContractType1Click(Sender: TObject);
begin
  selectContractTypeForm.selectContractType := TselectContractType.create(self);
  selectContractTypeForm.selectContractType.ShowModal;
end;

procedure TForm1.StringGrid2ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
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
      Handled := true;
  end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  exitForm.Form11 := TForm11.Create(self);
  exitForm.form11.ShowModal;

  //ShowMessage('DAAAA');
  //ExitProcess(0);
end;

procedure TForm1.N28Click(Sender: TObject);
var
  i: Integer;
  op: string;
  dDateForDel, dDateForDe2: TDateTime;
  wConfirm: Word;
  event: TEventEntity;
  contract: ContractEntity.TContract;
begin
  ADOQDay3.SQL.Add
    ('SELECT date_begin, DateClose FROM contract_info WHERE contract_number=:pContractNumber');
  ADOQDay3.Parameters.ParamByName('pContractNumber').Value :=
    sEditContractNumber;
  ADOQDay3.Open;
  dDateForDel := ADOQDay3.Fields[0].AsDateTime;
  dDateForDel := ADOQDay3.Fields[1].AsDateTime;
  ADOQDay3.SQL.Clear;
  ADOQDay3.Close;

  if ((dDateForDel = DOpenDay) or (dDateForDe2 = DOpenDay)) then
  begin
    //contract := ContractEntity.TContract;
    //contract := TContractADO.Create.getContractByOperationId(
    //  StrToInt(StringGrid2.Cells[6,1])
    //);
    //event := TEventEntity.Create;
    //event.eventText := 'Договор ' + contract.number + ' откры для редактирования'+
    // ' ';
    i := 1;
    StringGrid2.Options := StringGrid2.Options - [goRowSelect];
    StringGrid2.Row := 1;
    StringGrid2.Col := 3;
    StringGrid2.Options := StringGrid2.Options + [goEditing];
    Button2.Enabled := true;
    Button3.Enabled := true;
    //WriteAction('20|Открыт для редактирования|' + StaticText8.Caption);

    while i < StringGrid2.RowCount do
    begin
      if StringGrid2.Cells[1, i] = 'Закрытие договора' then
        op := '2';
      if StringGrid2.Cells[1, i] = 'Открытие договора' then
        op := '1';
      WriteAction('21|' + op + '|' + StringGrid2.Cells[3, i] + '|' +
        StringGrid2.Cells[4, i] + '|' + StringGrid2.Cells[5, i]);
      Inc(i);
    end;

  end
  else
    wConfirm := MessageDLG('Операция вне рабочей даты', mtError, [mbOK], 0);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Apply;
end;

procedure TForm1.XMLButtonClick(Sender: TObject);
var
  pp : TDateTime;
  x : Variant;
  report : TfrxReport;
  dataSet : TADODataSet;
  testFloat : String;
  f : Double;
 // x : IXMLDocument;
  RootNode,CurNode : IXMLNODE;

  loyal : TENLoyalty;
  loyalS : ILoyal;
  res : Double;
  day1 : TDAte;
  day2 : TDate;
  q1,q2 : TADOQUery;
  sql1,sql2 : String;

  summ, percentOp,delayOp : Double;
  numOfDay : Integer;
  daysBetweenPercent, daysBetweenDelay : Integer;
  dateCloseToday : TDate;
  orderList : TOrder;

  NdrStream: TMemoryStream;
  OutStream: TMemoryStream;
  name:string;
  u, p, n , r: Integer;
  FileNames : String;
  ar,ab : TENArrears;
  arADO : ADOArrears;
  myTestFloat : Double;

  myLoyalty1 : TARRLoyalty;
  i1 : Integer;
  myPasport : TENPasport;
  myOrder : TENOrder;
  myOp : OperationEntity.TOperation;
  myOpADO : TOPERATIONADO;
  myOrd : TOrder;
 // SMTP : TIdSMTP;
begin

  // xml test
 // ShowMessage(danUtils.danxml.getGoldTestPrice585(137));

  {  ПЕЧАТАТЬ ЛЮБОЙ ОРДЕР
  myOp := OperationEntity.TOperation.Create;
  myOpADO := TOperationADO.Create;
  myOp := myOpADO.getOperationByContractIdAndType(StrToInt(StringGrid1.Cells[10,StringGrid1.Row]),1);
  myOrd  := TORder.Create;
  MyOrd.createOrderByOperation(myOp);
  MyOrd.casheir := 'Масляк Вита Александровна';
  MyOrd.number := '1789';
  MyOrd.printExpenseReport;
  }



 // PRINT NEW CONTRACT
  danUtils.print.newContract(DANADO.utils.getLastId('contract_info'));

 //    ShowMessage(myUtils.getTestPriceByNameFilial('14'));
//  myLoyalty1 := DANADO.loyal.getArrayLoyalty(LCONTRACT,20832);
///  ShowMessage('fillOk');
//  for i1 :=0 to length(myLoyalty1)-1 do begin
//    myLoyalty1[i1].showLoyalty(myLoyalty1[i1]);
////    DANADO.loyal.updateLoyaltyStatusFalse(LDELIVERER,myLoyalty1[i1].idDeliverer);
//  end;

  // myTestFloat := 1.767435;
  // ShowMessage(FloatToStr(myTestFloat));
  //// myTestFloat := Trunc(myTestFloat*100)/100;
  // ShowMessage(FloatToStr(myTestFloat));
  //ShowMessage(myUtils.getTarifStringByCodeFilial(174));
   {
  r := Random(100);
  n := 0;
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := DANADO.utils.getConnectionString;

  q2 := TADOQuery.Create(nil);
  q2.ConnectionString := DANADO.utils.getConnectionString;

  dateCloseToday := StrToDate('22.12.2014');
  sql1 := 'SELECT id, date_begin, date_end, num_of_day, estimated_amount, contract_number, id_deliverer ' +
  'FROM contract_info WHERE con_status =-1  ';
  q1.SQL.Add(sql1);
  X := CreateOleObject('Excel.Application');
  X.WorkBooks.Add('C:\Pawn\report\orders.xlsx');
  X.DisplayAlerts := false;
  u := 0;
  p := 0;
  With q1 do begin
    q1.Open;
  while not eof do begin
   n := n + 1;
    summ := 0;
    percentOp := 0;
    delayOp := 0;
    summ := q1.FieldByName('estimated_amount').AsFloat;
    numOfDay := q1.FieldByName('num_of_day').AsInteger;
    daysBetweenPercent := DaysBetween(q1.FieldByName('date_begin').AsDateTime,dateCloseToday)+1;
    if (daysBetweenPercent > numOfDay) then  begin
      daysBetweenDelay := DaysBetween(q1.FieldByName('date_end').AsDateTime, dateCloseToday) + 1;
      delayOp := DANADO.utils.calculateSummBetweenDays(daysBetweenDelay,summ,0.001);
      percentOp := DANADO.utils.calculateSummBetweenDays(numOfDay,summ,0.001);
    end else begin
      percentOp := DANADO.utils.calculateSummBetweenDays(daysBetweenPercent,summ,0.001);
    end;
    danAdo.contract.closeContractInfo(q1.FieldByName('id').AsInteger,dateCloseToday);
    danado.product.closeProductInfo(q1.FieldByName('id').AsInteger);
    danado.operation.insertCloseOp(q1.FieldByName('id').AsInteger,summ,percentOp,delayOp,dateCloseToday);
        sql2 := 'SELECT name FROM deliverer WHERE id=:pId';
    q2.SQL.Add(sql2);
    q2.Parameters.ParamByName('pId').Value := q1.FieldByName('id_deliverer').AsInteger;
    try
        q2.Open;
      except on e: exception do begin
        Showmessage('Неудалось найти Клиента');
      end;
    end;
    orderList := TOrder.Create;
    orderList.bill := '3771, 373, 374';
    orderList.summ := FloatToStr(summ+percentOp+delayOp);
    orderList.from :=  q2.FieldByName('name').AsString;
    orderList.ground := 'возврат фин. кредит №' +  q1.FieldByName('contract_number').AsString;
    orderList.summInWord := SumNumToFull(summ+percentOp+delayOp);
    orderList.summCent := FloatToStr(Round(Frac(summ+percentOp+delayOp)*100));
    orderList.date := DateToStr(dateCloseToday);
    orderList.additional := 'фин. кредит - '+FloatToStr(summ)+' % - '+ FloatToStr(percentOp) +' пеня - '+FloatToStr(delayOp);
    orderList.orderType := 2;
    orderList.recipient := '111';
    OrderList.document := '111';
    orderList.saveDocument(danado.utils.getlastid('operation'));

    X.cells[8+u,7] :=  orderList.filialNumber;
    X.cells[11+u,8] := orderList.number;
    X.cells[12+u,6] := orderList.date;
    X.cells[15+u,2] := orderList.bill;
    X.cells[15+u,6] := orderList.summ;
    X.cells[16+u,5] := q2.FieldByName('name').AsString;
    X.cells[18+u,4] := orderList.ground;
    X.cells[20+u,4] := orderList.summInWord + ' гривен';
    X.cells[20+u,8] := FloatToStr(Round(StrToFloat(orderList.summCent))) + ' копеек';
    X.cells[22+u,4] := orderList.additional;
    X.cells[24+u,6] := orderList.casheir;
    X.cells[26+u,6] := orderList.casheir;

    if p = 0 then begin
      p:=1;
      u:=27;
    end else begin
      p:=0;
      u:=0;
      FileNames :=  orderList.filialNumber + '_' + IntToStr(n)+ '_' + IntToStr(r);
      X.ActiveWorkBook.SaveAs('C:\pawn\ore\' +FileNames+ '.xlsx');
    end;
     // ShowmEssage(IntToStr(n) + '_' + IntToStr(q1.RecordCount));
    if (q1.RecordCount = n) then begin
      FileNames :=  orderList.filialNumber + '_' + IntToStr(n)+ '_LAST_' + IntToStr(r);
      X.ActiveWorkBook.SaveAs('C:\pawn\ore\' +FileNames+ '.xlsx');
    end;
    q2.SQL.Clear;
    q2.Close;
     next;
  end;
end;
    }


end;

procedure TForm1.ADOROWSTEST1Click(Sender: TObject);
var
  q1 : TADOQuery;
  sql1 : String;
begin
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := DANADO.utils.getConnectionString;
  sql1 := 'SELECT * FROM contract_info WHERE id_Deliverer =1';
  q1.SQL.Add(sql1);
  q1.Open;
  ShowMessage(IntToStr(q1.RowsAffected));
end;

procedure TForm1.Apply;
var
  i, bOpType: byte;
  order: TOrder;
  employee : TEmployee;
  event: TEventEntity;
  operation: OperationEntity.TOperation;
begin
  operation := OperationEntity.TOperation.Create;
  i := 1;

  while i < StringGrid2.RowCount do begin
   // ShowMessage('Start');
    operation := TOperationADO.Create.getOperationById(StrToInt(StringGrid2.Cells[6, i]));
   // ShowMessage(StringGrid2.Cells[6, i]);
    operation.summa := StrToFloat(StringGrid2.Cells[3, i]);
    operation.percentSumma := StrToFloat(StringGrid2.Cells[4, i]);
    operation.delaySumma := StrToFloat(StringGrid2.Cells[5, i]);

    if StringGrid2.Cells[1, i] = 'Закрытие договора' then
      operation.operationType := 2;
    if StringGrid2.Cells[1, i] = 'Открытие договора' then
      operation.operationType := 1;

    TOperationADO.Create.updateOperation(operation);

    //Записываем сообщение о редактировании операции в лог
    event := TEventEntity.Create;
    event.eventDate := Now;
    event.eventText := 'Редактирование операции ' + StringGrid2.Cells[1, i] +
      ' по договру №' + operation.contract.number;
    event.employeeId := currentEmployee.id;

    event.eventTypeId := 2;
    EventADO.addEvent(event);
    //Ищем ордер операции и если успех редактируем его
    order := TOrder.Create;

    if not(order.getOrderByOpeartionId(operation.id)) then begin
      order.summ := FloatToStr(StrToFloat(StringGrid2.Cells[3, i]) +
        StrToFloat(StringGrid2.Cells[4, i]) +
        StrToFloat(StringGrid2.Cells[5, i]));
      order.summInWord := SumNumToFull(StrToFloat(order.summ));
      order.summCent :=  FloatToStr(Round(Frac(StrToFloat(order.summ))*100));
      operationId := StrToInt(StringGrid2.Cells[6, i]);
      order.editOrder();
    end;

    Inc(i);
  end;

  StringGrid2.Options := StringGrid2.Options - [goEditing];
  StringGrid2.Options := StringGrid2.Options + [goRowSelect];
  Button2.Enabled := false;
  Button3.Enabled := false;
end;

procedure TForm1.Cancel;
begin
  StringGrid2.Options := StringGrid2.Options - [goEditing];
  StringGrid2.Options := StringGrid2.Options + [goRowSelect];
  Button2.Enabled := false;
  Button3.Enabled := false;
end;

procedure TForm1.StringGrid2Exit(Sender: TObject);
var
  iBTNSelected: Integer;
begin
  if Button2.Enabled = true then
  begin
    iBTNSelected := MessageDLG('Сохранить изменения?', mtConfirmation,
      [mbYes, mbCancel], 0);
    if iBTNSelected = mrYes then
      Apply
    else
      Cancel;
    StringGrid1.Row := StringGrid1.Row;
  end;
end;

procedure TForm1.N29Click(Sender: TObject);
begin
  if not(bDeepOptions) then
  begin
    closeOp_form.closeOp := TcloseOp.Create(Self);
    closeOp_form.closeOp.ShowModal;
  end;
end;

function TForm1.SelectTarif(iIDTarif: Integer): string;
begin
  SelectTarif := 'Group' + IntToStr(iIDTarif);
end;
// end;

procedure TForm1.N26Click(Sender: TObject);
begin
  Archiv;
end;

procedure TForm1.Archiv();
var
  sFileName, sDay, filialNumber: string;
begin
  sDay := FormatDateTime('dd', DOpenDay);
  ADOQDay3.SQL.Add('SELECT name_filial FROM pasport');
  ADOQDay3.Open;
  sFileName := 'full_' + ADOQDay3.Fields[0].AsString + '_' + sDay + '.rar';
  if Length(ADOQDay3.Fields[0].AsString) = 1 then
    filialNumber := '00' + ADOQDay3.Fields[0].AsString;
  if Length(ADOQDay3.Fields[0].AsString) = 2 then
    filialNumber := '0' + ADOQDay3.Fields[0].AsString;
  if Length(ADOQDay3.Fields[0].AsString) = 3 then
    filialNumber := ADOQDay3.Fields[0].AsString;
  ADOQDay3.Close;
  ADOQDay3.SQL.Clear;
  CopyFile('C:\Pawn\data\lo.mdb', 'C:\Pawn\tmp\lo.mdb', true);
  CopyFile('C:\Pawn\Log.ucs', 'C:\Pawn\tmp\Log.ucs', true);
  ExecAndWait('C:\Pawn\Rar.exe', 'a C:\Pawn\archives\' + sFileName +
    ' C:\Pawn\tmp\lo.mdb C:\Pawn\tmp\Log.ucs -ep', 0);
  CopyFile(PWideChar('C:\Pawn\archives\' + sFileName),
    PWideChar('C:\Pawn\backup\' + sFileName), false);
  CopyFile(PWideChar('C:\Pawn\archives\' + sFileName),
    PWideChar('C:\Dropbox\' + filialNumber + '\data\' + sFileName), false);
  DeleteFile('C:\Pawn\tmp\lo.mdb');
  DeleteFile('C:\Pawn\tmp\Log.ucs');
  //ShowMessage('Резервная копия создана.');
end;

function ExecAndWait(const FileName, Params: ShortString; const WinState: Word)
  : Boolean; export;
var
  StartInfo: TStartupInfo;
  ProcInfo: TProcessInformation;
  CmdLine: ShortString;
begin
  { Помещаем имя файла между кавычками, с соблюдением всех пробелов в именах Win9x }
  CmdLine := '"' + FileName + '" ' + Params;
  FillChar(StartInfo, SizeOf(StartInfo), #0);
  with StartInfo do
  begin
    cb := SizeOf(StartInfo);
    dwFlags := STARTF_USESHOWWINDOW;
    wShowWindow := WinState;
  end;
  Result := CreateProcess(nil, PChar(string(CmdLine)), nil, nil, false,
    CREATE_NEW_CONSOLE or NORMAL_PRIORITY_CLASS, nil,
    PChar(ExtractFilePath(FileName)), StartInfo, ProcInfo);
  { Ожидаем завершения приложения }
  if Result then
  begin
    WaitForSingleObject(ProcInfo.hProcess, INFINITE);
    { Free the Handles }
    CloseHandle(ProcInfo.hProcess);
    CloseHandle(ProcInfo.hThread);
  end;
end;

procedure TForm1.X1Click(Sender: TObject);
begin
  fr_form.Form3.Report('XReport', 'kassir');
end;

procedure TForm1.N01Click(Sender: TObject);
begin
  if fr_form.Form3.ConfirmCheck then
    fr_form.Form3.Report('NullCheck', 'kassir');
end;

procedure TForm1.Z1Click(Sender: TObject);
var
  SyncThread: TSyncThread;
  wReturn: Word;
begin
  wReturn := MessageDLG('Убедитесь в подключении к сети интернет!',
    mtConfirmation, [mbYes, mbNo], 0);
  if wReturn = mrYes then
  begin
    Archiv;
    ExportXML(DOpenDay, DOpenDay);
    preZForm.counter := 120;
    preZForm.preZ.ShowModal;
    if fr_form.Form3.ConfirmCheck then
    begin
      fr_form.Form3.Report('ZReport', 'kassir');
    end;
  end;
end;

procedure TForm1.N15Click(Sender: TObject);
begin
  inv_form.inventar := Tinventar.Create(Self);
  inv_form.inventar.ShowModal;
end;

procedure TForm1.N31Click(Sender: TObject);

begin
  about_form.about := Tabout.Create(Self);
  about_form.about.ShowModal;
end;

procedure TForm1.N27Click(Sender: TObject);
begin
  config_form.config := Tconfig.Create(Self);
  config_form.config.ShowModal;
end;

procedure TForm1.N20Click(Sender: TObject);
begin
  openday_form.openday := Topenday.Create(Self);
  openday_form.openday.Show;
end;

procedure TForm1.Z2Click(Sender: TObject);
begin
  zperiod_form.zperiod := Tzperiod.Create(Self);
  zperiod_form.zperiod.Show;
end;

procedure TForm1.N19Click(Sender: TObject);
begin
  chekInOut_form.chekInOut := TchekInOut.Create(Self);
  chekInOut_form.chekInOut.ShowModal;
end;

procedure TForm1.N32Click(Sender: TObject);
begin
  sbjct_form.sbjct := Tsbjct.Create(Self);
  sbjct_form.sbjct.ShowModal;
end;

procedure TForm1.N33Click(Sender: TObject);
var
  dDateForDel: TDateTime;
  wConfirm: Word;
begin
  ADOQDay3.SQL.Add
    ('SELECT DateClose FROM contract_info WHERE contract_number=:pContractNumber');
  ADOQDay3.Parameters.ParamByName('pContractNumber').Value :=
    sEditContractNumber;
  ADOQDay3.Open;
  dDateForDel := ADOQDay3.Fields[0].AsDateTime;
  ADOQDay3.SQL.Clear;
  ADOQDay3.Close;

  if (dDateForDel = DOpenDay) then
  begin
    ADOQDay3.SQL.Add
      ('DELETE * FROM operation WHERE id_contract_op=:pIDC AND (op=2 OR op=5)');
    ADOQDay3.Parameters.ParamByName('pIDC').Value := iIDContract;
    ADOQDay3.ExecSQL;
    ADOQDay3.SQL.Clear;
    ADOQDay3.SQL.Add
      ('UPDATE product_info SET product_status=-1 WHERE id_contract=:pIDC');
    ADOQDay3.Parameters.ParamByName('pIDC').Value := iIDContract;
    ADOQDay3.ExecSQL;
    ADOQDay3.SQL.Clear;
    ADOQDay3.SQL.Add
      ('UPDATE contract_info SET con_status=-1,DateClose=null WHERE id=:pIDC');
    ADOQDay3.Parameters.ParamByName('pIDC').Value := iIDContract;
    ADOQDay3.ExecSQL;
    ADOQDay3.SQL.Clear;
    WriteAction('10|' + sEditContractNumber);
    SearchContract;
    ContractInfo;
    ShowMessage('Договор ' + sEditContractNumber + ' принудительно открыт');
  end
  else
    wConfirm := MessageDLG('Операция вне рабочей даты', mtError, [mbOK], 0);
end;

procedure TForm1.Panel2M(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  Panel2.Color := clCream;
end;

procedure TForm1.Panel2MouseLeave(Sender: TObject);
begin
  Panel2.Color := clBtnFace;
end;

procedure TForm1.Panel1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  Panel1.Color := clCream;
end;

procedure TForm1.Panel1MouseLeave(Sender: TObject);
begin
  Panel1.Color := clBtnFace;
end;

procedure TForm1.Panel3MouseLeave(Sender: TObject);
begin
  Panel3.Color := clBtnFace;
end;

procedure TForm1.Panel3MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  Panel3.Color := clCream;
end;

procedure TForm1.Panel4MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  Panel4.Color := clCream;
end;

procedure TForm1.Panel4MouseLeave(Sender: TObject);
begin
  Panel4.Color := clBtnFace;
end;

procedure TForm1.Panel5MouseLeave(Sender: TObject);
begin
  Panel5.Color := clBtnFace;
end;

procedure TForm1.Panel5MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  Panel5.Color := clCream;
end;

procedure TForm1.N35Click(Sender: TObject);
var
  i, iPositionSell: Integer;
begin
  i := 0;
  iPositionSell := StringGrid1.Row;
  Edit3.Text := StringGrid1.Cells[5, iPositionSell];
  SearchContract();
  Edit3.Text := '';
end;

procedure TForm1.StringGrid1ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
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
      Handled := true;
  end;
end;

procedure TForm1.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  SearchContract;
  ContractInfo;
end;

procedure TForm1.Edit3KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
if (Length(Edit3.Text) > 2) then begin
      fillFormFromQuery(searchByDelivererName(edit3.Text));
end;
end;

procedure TForm1.rb1Click(Sender: TObject);
begin
  ComboBox1.Enabled := true;
  Edit3.Text := '';
  Edit1.Text := '';
  SearchContract;
  ContractInfo;
end;

procedure TForm1.rb2Click(Sender: TObject);
begin
  ComboBox1.ItemIndex := 0;
  ComboBox1.Enabled := false;
  Edit3.Text := '';
  Edit1.Text := '';
  SearchContract;
  ContractInfo;
end;

function TForm1.searchByContractNumber(searchtext: String): TADOQuery;
var
  res : TADOQuery;
  sql1 : String;
begin
  res := TADOQUery.Create(nil);
  res.ConnectionString := DANADO.utils.getConnectionString;

  sql1 := 'SELECT TOP 10 contract_info.loan_amount, contract_info.estimated_amount,contract_info.date_begin,contract_info.contract_number, contract_info.con_status,contract_info.DateClose, contract_info.id,contract_info.contractTypeGroup, ';
  sql1 := sql1 + 'deliverer.name as delivererName,employee.name as employeeName ';
  sql1 := sql1 + 'FROM (contract_info LEFT JOIN deliverer ON contract_info.id_deliverer = deliverer.id) LEFT JOIN employee ON contract_info.id_Employee = employee.id ';
  sql1 := sql1 + 'WHERE contract_info.contract_number like :pSearchText ';
  sql1 := sql1 + 'ORDER BY contract_info.con_status,contract_info.id DESC';

  res.SQL.Add(sql1);

  res.Parameters.ParamByName('pSearchText').Value := '%'+searchtext+'%';
  res.Open;

  RESULT := res;
end;

function TForm1.searchByDelivererName(searchText: String): TADOQuery;
var
  res : TADOQuery;
  sql1 : String;
begin
  res := TADOQUery.Create(nil);
  res.ConnectionString := DANADO.utils.getConnectionString;

  sql1 := 'SELECT TOP 50 contract_info.loan_amount, contract_info.estimated_amount,contract_info.date_begin,contract_info.contract_number, contract_info.con_status,contract_info.DateClose, contract_info.id,contract_info.contractTypeGroup, ';
  sql1 := sql1 + 'deliverer.name as delivererName,employee.name as employeeName ';
  sql1 := sql1 + 'FROM (contract_info LEFT JOIN deliverer ON contract_info.id_deliverer = deliverer.id) LEFT JOIN employee ON contract_info.id_Employee = employee.id ';
  sql1 := sql1 + ' WHERE (deliverer.name like :pSearchText) ';
  sql1 := sql1 + 'ORDER BY contract_info.con_status,contract_info.id DESC';
  // (contract_info.con_status =-1) AND
  res.SQL.Add(sql1);

  res.Parameters.ParamByName('pSearchText').Value := '%'+searchtext+'%';
  res.Open;

  RESULT := res;

end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
   if (Length(Edit1.Text) > 1) then begin
      fillFormFromQuery(searchByContractNumber(edit1.Text));
   end;
   {
      if (Length(Edit1.Text) > 5) then begin
      SearchContract;
      ContractInfo;
   end;
   }
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  Form1.repaint;
end;

procedure TForm1.spanel1Click(Sender: TObject);
var
  i, iPositionSell: Integer;
begin
  if(StringGrid1.Cells[10,StringGrid1.Row] <> '') then begin
  fillFormFromQuery(searchDelivererContractsByidContract(StrToInt(StringGrid1.Cells[10,StringGrid1.Row])));
  end;
  {  i := 0;
  iPositionSell := StringGrid1.Row;
  Edit3.Text := StringGrid1.Cells[5, iPositionSell];
  //ShowMessage(StringGrid1.Cells[5, iPositionSell]);
  SearchContract();
  Edit3.Text := '';
  }
end;

procedure TForm1.Panel7Click(Sender: TObject);
var
  MsWord: Variant;
begin

  MSWord := CreateOleObject('Word.Application');
  MSWord.Documents.Add('C://Pawn//report//newContractback.doc');
  MSWord.DisplayAlerts := False;
  MSWord.Visible := True;
  MSWord.Activate;
end;

procedure TForm1.Panel7MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Panel7.BevelOuter := bvLowered;
end;

procedure TForm1.Panel7MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Panel7.BevelOuter := bvSpace;
end;


procedure TForm1.sPanel1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  sPanel1.BevelOuter := bvLowered;
end;

procedure TForm1.sPanel1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  sPanel1.BevelOuter := bvSpace;
end;


procedure TForm1.sPanel1MouseLeave(Sender: TObject);
begin
  sPanel1.Color := clBtnFace;
end;

procedure TForm1.sPanel1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  sPanel1.Color := clCream;
end;


procedure TForm1.sPanel2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  sPanel2.BevelOuter := bvLowered;
end;

procedure TForm1.sPanel2MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  sPanel2.BevelOuter := bvSpace;
end;

procedure TForm1.sPanel2MouseLeave(Sender: TObject);
begin
  sPanel2.Color := clBtnFace;
end;

procedure TForm1.sPanel2MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  sPanel2.Color := clCream;
end;

procedure TForm1.sPanel2Click(Sender: TObject);
begin
  SearchExtension;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  ExecAndWait('c:\Pawn\start.bat', '', 0);
end;

procedure TForm1.N36Click(Sender: TObject);
begin
  answerForm.answer := Tanswer.Create(Self);
  answerForm.answer.Show;
end;

procedure TForm1.N37Click(Sender: TObject);
var
  ex: TExtension;
begin
  ex := TExtension.Create;
  ex.createAnArrayOfData;
  ex.Destroy;
end;

procedure TForm1.numContracts(date1: TDateTime; date2: TDateTime);
var
  numClosedContracts: Integer;
  numNominalClosedContracts: Integer;
  numRepawningContracts: Integer;
  numOpenContracts: Integer;
begin
  numClosedContracts := 0;
  numNominalClosedContracts := 0;
  numRepawningContracts := 0;
  numOpenContracts := 0;
  q1.connectionString := DANADO.utils.getConnectionString;
  q1.SQL.Add
    ('SELECT contract_info.contract_number, contract_info.estimated_amount, operation.op, operation.sum_op');
  q1.SQL.Add
    ('FROM contract_info INNER JOIN operation ON contract_info.id=operation.id_contract_op');
  q1.SQL.Add('WHERE date_op>=:date_op1 AND date_op<=:date_op2');
  q1.Parameters.ParamByName('date_op1').Value := DateToStr(date1);
  q1.Parameters.ParamByName('date_op2').Value := DateToStr(date2);
  with q1 do
  begin
    q1.Open;
    while not eof do
    begin
      if (q1.Fields[2].AsInteger = 1) then begin
        if (q1.Fields[3].AsFloat <> q1.Fields[1].AsFloat) then
          Inc(numRepawningContracts)
        else
          Inc(numOpenContracts);
      end
      else if (q1.Fields[2].AsInteger = 2) then begin
        if (q1.Fields[3].AsFloat = q1.Fields[1].AsFloat) then
          Inc(numClosedContracts);
      end
      else if (q1.Fields[2].AsInteger = 5) then begin
        if (q1.Fields[3].AsFloat = q1.Fields[1].AsFloat) then
          Inc(numNominalClosedContracts);
      end;
      Next;
    end;
    q1.Close;
  end;
  q1.SQL.Clear;
  Label7.Caption := IntToStr(numClosedContracts);
  Label13.Caption := IntToStr(numNominalClosedContracts);
  Label8.Caption := IntToStr(numRepawningContracts);
  Label9.Caption := IntToStr(numOpenContracts);
end;

procedure TForm1.Edit1Click(Sender: TObject);
begin
  Edit3.Text := '';
end;

procedure TForm1.Edit3Click(Sender: TObject);
begin
  Edit1.Text := '';
end;

procedure TForm1.DTP1Change(Sender: TObject);
begin
DTP1.Date := MyUtils.checkLastDate(DTP1.Date);
  if (StringGrid1.Cells[0, 0] = '№ п/п') then begin

    if (DTP1.Date <= DTP2.Date) then begin
      SearchContract
   end else
    begin
      DTP1.Date := DTP2.Date;
      SearchContract;
    end;
  end;
end;

procedure TForm1.DTP2Change(Sender: TObject);
begin
  DTP2.Date := MyUtils.checkLastDate(DTP2.Date);
  if (StringGrid1.Cells[0, 0] = '№ п/п') then begin

    if (DTP1.Date <= DTP2.Date) then begin

      SearchContract
    end
    else
    begin
      DTP1.Date := DTP2.Date;
      SearchContract;
    end;
  end;
end;

procedure TForm1.Label15Click(Sender: TObject);
begin
  ShellExecute(Handle, nil, 'mailto:support@ucs-lombard.com.ua', nil,
    nil, SW_SHOW);
end;

procedure TForm1.Label3Click(Sender: TObject);
begin
  ShellExecute(Handle, nil, 'mailto:golos@ucs-lombard.com.ua', nil,
    nil, SW_SHOW);
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  SearchContract;
  ContractInfo;
end;

procedure TForm1.Panel8Click(Sender: TObject);
begin
 // deliverer_form.deliverer := Tdeliverer.Create(Self);
  deliverer_form.deliverer.ShowModal;
end;

procedure TForm1.Panel8MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Panel8.BevelOuter := bvLowered;
end;

procedure TForm1.Panel8MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Panel8.BevelOuter :=  bvSpace;
end;

procedure TForm1.pm1Popup(Sender: TObject);
begin
  n42.Visible := False;
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
  //
end;

procedure TForm1.N38Click(Sender: TObject);
begin
  cashBookFormUnit.cashBookForm := TcashBookForm.Create(Self);
  cashBookFormUnit.cashBookForm.ShowModal;
end;

procedure TForm1.N39Click(Sender: TObject);
var
  contract: TContract;
  operation: OperationEntity.TOperation;
  event: TEventEntity;
begin
  EditContractOperationForm.editContractOPeration :=
  TeditContractOperation.Create(Self);
  contract := TContract.Create;
  contract := TContractADO.Create.getContractByNumber(StringGrid1.Cells[1,StringGrid1.Row]);
  EditContractOperationForm.editContractOPeration.Label5.Caption :=
    contract.number;
  operation :=
    TOperationADO.Create.getOperationByContractIdAndType(contract.id, 2);
    if ((operation.operationType = 2) and (operation.date = DOpenDay)) then begin
  EditContractOperationForm.editContractOPeration.Edit1.Text :=
    FloatToStr(operation.summa);
  EditContractOperationForm.editContractOPeration.Edit2.Text :=
    FloatToStr(operation.percentSumma);
  EditContractOperationForm.editContractOPeration.Edit3.Text :=
    FloatToStr(operation.delaySumma);
  EditContractOperationForm.editContractOPeration.Edit4.Text :=
    FloatToStr(operation.summa+operation.percentSumma+operation.delaySumma);
  EditContractOperationForm.editContractOPeration.setOperation(operation);
  event := TEventEntity.Create;
  event.eventDate := Now;
  event.eventText := 'Договор: '+ contract.number +'; Тело кредита: '+FloatToStr(operation.summa)+'; Сумма%: '+
    FloatToStr(operation.percentSumma)+'; Сумма пени: '+
    FloatToStr(operation.delaySumma)+ '; Общая: '+ FloatToStr(operation.summa+operation.percentSumma+operation.delaySumma);
  event.eventTypeId := 3;
  event.employeeId := currentEmployee.id;
  EventADO.addEvent(event);
  EditContractOperationForm.editContractOPeration.ShowModal;
    end else begin
    if (operation.operationType = 2) then begin
      ShowMessage('Операция вне рабочей даты');
    end else begin
      ShowMessage('Нет возможности редактировать данный договор');
    end;
    end;

end;

procedure TForm1.crateFieldInTable;
begin

end;

end.
