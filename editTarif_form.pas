unit editTarif_form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, Grids, DBGrids;

type
  TeditTarif = class(TForm)
    Button1: TButton;
    Button2: TButton;
    StringGrid1: TStringGrid;
    q1: TADOQuery;
    q2: TADOQuery;
    btn1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  editTarif: TeditTarif;

implementation

uses main;
{$R *.dfm}


procedure TeditTarif.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TeditTarif.btn1Click(Sender: TObject);
var
  i,j: Byte;
  sPrevMin, sPrevMax: String;
begin
  i := 2;
  j := 1;
  sPrevMin := 'q';
  sPrevMax := 'q';
  StringGrid1.Width := 500;
  StringGrid1.ColWidths[0] := 30;
  StringGrid1.Cells[0,0] := 'От';
  StringGrid1.Cells[1,0] := 'До';
  StringGrid1.ColWidths[1] := 30;
  while i<StringGrid1.ColCount do begin
    StringGrid1.Cells[i,0] := IntToStr(i-1);
    StringGrid1.ColWidths[i] := 25;
    inc(i);
  end;
  i := 2;
  q1.SQL.Add('SELECT sum_begin, sum_end FROM tarif');
  with q1 do begin
    q1.Open;
    while not eof do begin
      if (StringGrid1.Cells[0,j]<>sPrevMin) and (StringGrid1.Cells[1,j]<>sPrevMax) then begin
        StringGrid1.Cells[0,j] := q1.Fields[0].AsString;
        StringGrid1.Cells[1,j] := q1.Fields[1].AsString;
        sPrevMin := q1.Fields[0].AsString;
        sPrevMax := q1.Fields[1].AsString;
      end;
      q2.SQL.Add('SELECT percent FROM tarif WHERE sum_begin=:pSumBegin AND sum_end=:pSumEnd');
      q2.Parameters.ParamByName('pSumBegin').Value := StringGrid1.Cells[0,j];
      q2.Parameters.ParamByName('pSumEnd').Value := StringGrid1.Cells[1,j];
      with q2 do begin
        q2.Open;
        while not eof do begin
           StringGrid1.Cells[i,j] := q2.Fields[0].AsString;
           inc(i);
           Next;
        end;
        q2.Close;
      end;
      q2.SQL.Clear;
      inc(j);
      Next;
    end;
    q1.Close;
  end;
  q1.SQL.Clear;
end;

end.
