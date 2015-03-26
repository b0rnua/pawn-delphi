unit export_form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Mask,DanUtils, MyUtils;

type
  Texportbd = class(TForm)
    Button1: TButton;
    Button2: TButton;
    StaticText1: TLabel;
    DateTimePicker1: TDateTimePicker;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  exportbd: Texportbd;

implementation

uses
  main;
{$R *.dfm}

procedure Texportbd.Button2Click(Sender: TObject);
begin
  Close;
end;



procedure Texportbd.Button1Click(Sender: TObject);
begin
  DanUtils.ex.createDaily(DateTimePicker1.Date);
  Close;
end;

procedure Texportbd.FormCreate(Sender: TObject);
begin
  DateTimePicker1.Date := DOpenDay-1;
  DateTimePicker1.MinDate := getLastDate +1 ;
 // DateTimePicker2.Date := DOpenDay;
end;

end.
