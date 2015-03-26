unit RunExtObject;

interface

uses
  Classes;

type
  TRunExtObject = class(TThread)
  public
    procedure runExtObj();
  private
  protected
    procedure Execute; override;
  end;

implementation

uses
  main;

{ RunExtObject }

procedure TRunExtObject.Execute;
begin
  Form1.Timer1.Enabled := True;
  Form1.Timer1.Interval := 5000;//7200000;
 //Form1.Timer1.OnTimer := TRunExtObject.runExtObj();

end;

procedure TRunExtObject.runExtObj;
begin
  ExecAndWait('start.bat','', 0);
  //Form1.Timer1.Enabled := False;
  Form1.Timer1.Enabled := True;
end;

end.
