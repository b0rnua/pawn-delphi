unit usyncthread;

interface

uses
  Classes;

type
  TSyncThread = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
  end;

implementation

uses SysUtils,IniFiles,LogUnit;
{ Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure SyncThread.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

{ SyncThread }

procedure TSyncThread.Execute;
var
  sHost,sUser : string;
  IniFile:  TIniFile;
begin
  { Place thread code here }
  WriteAction('Передача данных: запуск');
  IniFile := TIniFile.Create('c:\pawn\options.ini');
  sHost := IniFile.ReadString('ftp','host','ukc.pp.ua');
  sUser := IniFile.ReadString('ftp','user','002');
  IniFile.Free;
  try
    try

    except
      on e: Exception do
    end;
  finally
    WriteAction('Передача данных: стоп');
  end;
end;

end.
 