unit zperiod_form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ComObj, ComCtrls;

type
  Tzperiod = class(TForm)
    Button1: TButton;
    Button2: TButton;
    sLabel1: TLabel;
    sLabel2: TLabel;
    sDateEdit1: TDateTimePicker;
    sDateEdit2: TDateTimePicker;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  zperiod: Tzperiod;

implementation

{$R *.dfm}
uses
  fr_form,main;

procedure Tzperiod.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure Tzperiod.Button1Click(Sender: TObject);
var
  wYear,wMonth,wDay:  Word;
  sDate1,sDate2,sMonth,sDay:  string;
begin
    if fr_form.Form3.ConfirmCheck then begin
      kassa := CreateOleObject('ArtSoft.Maria301MTM');
      kassa.debugger(true);
      kassa.OpenPort(StrToInt(sPPOCom),9600);
      kassa.SmenBegin('1111111111','kassir');
      DecodeDate(sDateEdit1.Date,wYear,wMonth,wDay);
      if wMonth<10 then sMonth := '0'+IntToStr(wMonth)
      else sMonth := IntToStr(wMonth);
      if wDay<10 then sDay := '0'+IntToStr(wDay)
      else sDay := IntToStr(wDay);
      sDate1 := IntToStr(wYear)+sMonth+sDay;
      DecodeDate(sDateEdit2.Date,wYear,wMonth,wDay);
      if wMonth<10 then sMonth := '0'+IntToStr(wMonth)
      else sMonth := IntToStr(wMonth);
      if wDay<10 then sDay := '0'+IntToStr(wDay)
      else sDay := IntToStr(wDay);
      sDate2 := IntToStr(wYear)+sMonth+sDay;
      kassa.RepByDateFull(sDate1,sDate2);
      kassa.ClosePort;
    end;
end;

end.
