unit sbjct_form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, main, DB, ADODB;

type
  Tsbjct = class(TForm)
    strngrd1: TStringGrid;
    btn1: TButton;
    btn2: TButton;
    q1: TADOQuery;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  sbjct: Tsbjct;

implementation

{$R *.dfm}

procedure Tsbjct.FormCreate(Sender: TObject);
var
  i : Integer;
begin
 { i := 1;
  strngrd1.Cells[0,0] := 'Наименование';
  q1.SQL.Add('SELECT FProductName FROM ProductName ORDER BY FProductName');
  with q1 do begin
    q1.Open;
    while not Eof do begin
      strngrd1.Cells[i,0] := q1.Fields[0].AsString;
      strngrd1.RowCount := strngrd1.RowCount+1;
      Inc(i);
      Next;
    end;
    q1.Close;
  end;
  q1.SQL.Clear; }
end;

end.
