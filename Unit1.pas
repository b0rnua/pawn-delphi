unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdFTP, ComCtrls;

type
  TForm1 = class(TForm)
    idftp2: TIdFTP;
    btn1: TButton;
    mmo1: TMemo;
    lbl1: TLabel;
    pb1: TProgressBar;
    procedure btn1Click(Sender: TObject);
    procedure idftp2Work(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCount: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btn1Click(Sender: TObject);
var
  searchResult : TSearchRec;
  sFilePath: string;
  i: Byte;
begin
  i := 1;
  idftp2.Host := '89.105.242.159';
  idftp2.Username := '001';
  idftp2.Password := 'ukS001';
  idftp2.Connect(True);
  if FindFirst('C:\Pawn\archives\*.rar',faAnyFile,searchResult) = 0 then begin
  repeat
    sFilePath := 'C:\Pawn\archives\'+ searchResult.Name;
    mmo1.Lines.Add('Копирование файла '+searchResult.Name);
    mmo1.Lines.Add(IntToStr(searchResult.Size));
    idftp2.Put(sFilePath,searchResult.Name,False);
    //DeleteFile(sFilePath);
    //Inc(i);
  until FindNext(searchResult)<>0;
  FindClose(searchResult);
  end
  else mmo1.Lines.Add('Нет файлов для копирования');
  idftp2.Disconnect;
end;

procedure TForm1.idftp2Work(Sender: TObject; AWorkMode: TWorkMode;
  const AWorkCount: Integer);
begin
 pb1.Position := AWorkCount;
 pb1.Refresh;
end;

end.
