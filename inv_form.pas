unit inv_form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, main, Mask, ReportXLS, ProductADO, MyUtils;

type
  Tinventar = class(TForm)
    btn1: TButton;
    btn2: TButton;
    txt1: TLabel;
    dtp1: TDateTimePicker;
    Button1: TButton;
    procedure btn2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  inventar: Tinventar;

implementation

{$R *.dfm}

procedure Tinventar.btn2Click(Sender: TObject);
begin
  Close
end;

procedure Tinventar.Button1Click(Sender: TObject);
var
  sEmployee, sFilial, sDate: string;
begin
          Form1.inventarDataSet.Active := False;
          Form1.ADOQDay3.SQL.Add('SELECT employee.name,name_filial,OpenDay FROM pasport INNER JOIN employee ON pasport.id_CurrentEmployee=employee.id');
          Form1.ADOQDay3.Open;
          sEmployee := Form1.ADOQDay3.Fields[0].AsString;
          sFilial := Form1.ADOQDay3.Fields[1].AsString;
          Form1.ADOQDay3.Close;
          Form1.ADOQDay3.SQL.Clear;
          sDate := DateToStr(dtp1.Date);
          Form1.inventarDataSet.Parameters.ParamByName('date_begin').Value := StrToDate(sDate);
          Form1.inventarDataSet.Parameters.ParamByName('DateClose').Value := StrToDate(sDate);
          Form1.inventarDataSet.Active := True;
          Form1.RVProject3.SetParam('employee',sEmployee);
          Form1.RVProject3.SetParam('filial',sFilial);
          Form1.RVProject3.SetParam('oday',DateToStr(dtp1.Date));
          Form1.RVProject3.Execute;
end;

procedure Tinventar.btn1Click(Sender: TObject);
var
  sEmployee, sFilial, sDate: string;
begin
        sDate := DateToStr(dtp1.Date);
      ReportXLS.inventoryReport(getProductsOnDate(StrToDate(sDate)),
        StrToDate(sDate));
end;

procedure Tinventar.FormCreate(Sender: TObject);
begin
  dtp1.MinDate := getLastDate + 1;
  dtp1.Date := Date();
end;

end.
