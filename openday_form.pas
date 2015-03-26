unit openday_form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Mask;

type
  Topenday = class(TForm)
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
  openday: Topenday;

implementation

uses main, DateUtils;

{$R *.dfm}

procedure Topenday.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure Topenday.Button1Click(Sender: TObject);
var
  sDateTmp: string;
begin
  sDateTmp := DateToStr(DateTimePicker1.Date);
  DOpenDay := StrToDate(sDateTmp);
  Form1.StatusBar1.Panels[0].Text := 'Рабочая дата: ' + sDateTmp;
  Close;
end;

procedure Topenday.FormCreate(Sender: TObject);
begin
  DateTimePicker1.Date := IncDay(Date(),-1);
end;

end.
