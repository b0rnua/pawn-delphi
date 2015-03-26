unit contractChangesForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, ComCtrls, MyUtils;

type
  TcontractChanges = class(TForm)
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  contractChanges: TcontractChanges;

implementation

uses
 Reports;

{$R *.dfm}

procedure TcontractChanges.Button1Click(Sender: TObject);
begin
  Reports.contractChanges(
    DateTimePicker1.DateTime,
    DateTimePicker2.DateTime
    );
end;

procedure TcontractChanges.FormCreate(Sender: TObject);
begin
  DateTimePicker1.DateTime := Now();
  DateTimePicker2.DateTime := Now();
  DateTimePicker1.MinDate := getLastDate+1;
  DateTimePicker2.MinDate := getLastDate+1;
end;

end.
