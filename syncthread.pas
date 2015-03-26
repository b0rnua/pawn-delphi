unit syncthread;

interface

uses
  Classes,SysUtils;

type
  SyncThread = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
  end;

implementation

uses sync_form;
{ Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure SyncThread.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

{ SyncThread }

procedure SyncThread.Execute;
var
  sHost,sUser : string;
  IniFile:  TIniFile;
begin
  { Place thread code here }
  IniFile := TIniFile.Create('c:\pawn\options.ini');
  sHost := IniFile.ReadString('ftp','host','ukc.pp.ua');
  sUser := IniFile.ReadString('ftp','user','002');
  IniFile.Free;
  try
    sync_form.sync.ftpConnect(sHost,sUser);
  except
    on e: Exception do begin
       sync_form.sync.mmo1.Lines.Add(e.Message);
       sync_form.sync.Synchronization;
    end;

  end;

end;

end.
 