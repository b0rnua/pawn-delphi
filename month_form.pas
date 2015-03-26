unit month_form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  Tmonth = class(TForm)
    Button1: TButton;
    Button2: TButton;
    StaticText1: TLabel;
    ComboBox1: TComboBox;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  month: Tmonth;

implementation

uses
  main;
{$R *.dfm}

procedure Tmonth.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure Tmonth.Button1Click(Sender: TObject);
begin
  form1.MonthRep;
  Close;
end;

end.
