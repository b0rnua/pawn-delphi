unit exitForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, DanUtils, EventEntity, EventADO;

type
  TForm11 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form11: TForm11;

implementation

{$R *.dfm}
uses
  main;

procedure TForm11.Button1Click(Sender: TObject);
var
  DOpenDay : TDateTime;
  ev : TEventEntity;
begin
  ev := TEventEntity.Create;
  ev.employeeId := bIDEmployee;
  ev.eventDate := StrToDate(DateToStr(now()));
  ev.eventTypeId := 222;
  ev.eventText := 'Закрытие Дня';
  eventAdd(ev);
  DanUtils.ex.createDaily(Now());
  ExitProcess(0);
end;

procedure TForm11.Button2Click(Sender: TObject);
begin
  ExitProcess(0);
end;
end.
