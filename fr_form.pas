unit fr_form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComObj;

type
  TForm3 = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Report(sRepType, sNameEmployee: string);
    procedure InOutSum(sType,sNameEmployee:string; fSum: Double);
    procedure CheckType(sType,sNameEmployee, sContract, sFilial:string; fSum: Double);
    function ConfirmCheck(): Boolean; overload;
    function ConfirmCheck(contractNumber:string): Boolean; overload;
  end;

var
  Form3: TForm3;
  kassa : Variant;

implementation

{$R *.dfm}
uses
  main;

function TForm3.ConfirmCheck(): Boolean;
var
  wReturn: Word;
begin
  wReturn := MessageDlg('Печатать чек?', mtConfirmation, [mbYes, mbNo],0);
  if wReturn=mrYes then result := True
  else result := False;
end;

function TForm3.ConfirmCheck(contractNumber:string): Boolean;
var
  wReturn: Word;
begin
  wReturn := MessageDlg('Печатать чек '+contractNumber+' ?', mtConfirmation, [mbYes, mbNo],0);
  if wReturn=mrYes then result := True
  else result := False;
end;

procedure TForm3.Report(sRepType, sNameEmployee: string);
begin
  kassa := CreateOleObject('ArtSoft.Maria301MTM');
  kassa.debugger(true);
  kassa.OpenPort(StrToInt(sPPOCom),9600);
  kassa.SmenBegin('1111111111',sNameEmployee);
  if sRepType = 'XReport' then kassa.XReport;
  if sRepType = 'ZReport' then kassa.ZReport;
  if sRepType = 'NullCheck' then kassa.NullCheck;
  kassa.ClosePort;
end;

procedure TForm3.InOutSum(sType, sNameEmployee:string; fSum: Double);
begin
  kassa := CreateOleObject('ArtSoft.Maria301MTM');
  kassa.debugger(true);
  kassa.OpenPort(StrToInt(sPPOCom),9600);
  kassa.SmenBegin('1111111111',sNameEmployee);
  if sType = 'In' then kassa.InOut(fSum*100);
  if sType = 'Out' then kassa.InOut((fSum*100)*(-1));
  kassa.ClosePort;
end;

procedure TForm3.CheckType(sType,sNameEmployee, sContract, sFilial:string; fSum: Double);
var
    iTaxA, iTaxB, iTaxV, iTaxG, iTaxD, iTaxE, iTaxJ, iTaxZ: Integer;
begin
  iTaxA := 0;
  iTaxB := 0;
  iTaxV := 0;
  iTaxG := 0;
  iTaxD := 0;
  iTaxE := 0;
  iTaxJ := 0;
  iTaxZ := 0;
  kassa := CreateOleObject('ArtSoft.Maria301MTM');
  kassa.debugger(true);
  kassa.OpenPort(StrToInt(sPPOCom),9600);
  kassa.SmenBegin('1111111111',sNameEmployee);
  kassa.OpenCheck(sFilial);
  if sType='BayOut' then
    kassa.RegistrItem('ПОВЕРН.',fSum*100,fSum*100,1,1,0,iTaxA, iTaxB, iTaxV, iTaxG, iTaxD, iTaxE, iTaxJ, iTaxZ,1,'0',0);
  if sType='Credit' then
    kassa.ReturnItem('ПОЗИКА',fSum*100,fSum*100,1,1,0,iTaxA, iTaxB, iTaxV, iTaxG, iTaxD, iTaxE, iTaxJ, iTaxZ,1,'0',0);
  kassa.TextComment(1,0,0,sContract);
  kassa.CloseCheck(0,0,0,0,0,0);
  kassa.ClosePort;

end;

end.
