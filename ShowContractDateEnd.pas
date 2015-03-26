unit ShowContractDateEnd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, ComCtrls, ADODB, DANADO;

type
  TForm15 = class(TForm)
    DateTimePicker1: TDateTimePicker;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    function queryContractByDateEnd(dateEnd : TDAte) : TADOQuery;
    procedure showOnMainScreenContractsFromQuery (q1 : TADOQuery);
  end;

var
  Form15: TForm15;

implementation

uses
main, myUtils;
{$R *.dfm}

procedure TForm15.Button1Click(Sender: TObject);
var
  qq : TADOQuery;
begin
  close;
  showOnMainScreenContractsFromQuery(queryContractByDateEnd(DateTimePicker1.Date));  
end;

function TForm15.queryContractByDateEnd(dateEnd: TDAte): TADOQuery;
var
  q1 : TADOQuery;
  sql1 : String;
  dateendstr : String;
begin
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := DANADo.utils.getConnectionString;
  sql1 := 'SELECT deliverer.name,loan_amount,estimated_amount,contract_number,date_begin,con_status,employee.name,DateClose, contract_info.id , contract_info.contractTypeGroup ' ;
  sql1 := sql1 + ' FROM (contract_info INNER JOIN deliverer ON contract_info.id_deliverer=deliverer.id) INNER JOIN employee ON contract_info.id_Employee=employee.id ';
  sql1 := sql1 + ' WHERE  (contract_info.con_status=true AND contract_info.date_end = :pDate)';
  q1.SQL.Add(sql1);
  dateendstr := DateToStr(dateEnd);
  q1.Parameters.ParamByName('pDate').Value := dateendstr;
  try
    q1.Open;
    RESULT := q1;
  // ShowMessage(IntTOStr(q1.RecordCount));  
  except on e: Exception do begin
   //
  end;

  end;
  //RESULT := q1;
end;

procedure TForm15.showOnMainScreenContractsFromQuery(q1: TADOQuery);
var
  i : Integer;
begin
  i := 0;
  main.Form1.StringGrid1.RowCount := 1;
  with q1 do begin
    while not eof  do begin
       main.Form1.StringGrid1.RowCount := main.Form1.StringGrid1.RowCount + 1;
        main.Form1.StringGrid1.Cells[0, i + 1] := IntToStr(i + 1);
        main.Form1.StringGrid1.Cells[1, i + 1] := q1.Fields[3].AsString;
        main.Form1.StringGrid1.Cells[2, i + 1] := q1.Fields[4].AsString;
        main.Form1.StringGrid1.Cells[3, i + 1] := q1.Fields[1].AsString;
        main.Form1.StringGrid1.Cells[4, i + 1] := q1.Fields[2].AsString;
        main.Form1.StringGrid1.Cells[6, i + 1] := q1.Fields[6].AsString;
        main.Form1.StringGrid1.Cells[5, i + 1] := q1.Fields[0].AsString;
        if q1.FieldByName('con_status').AsBoolean = true then
          main.Form1.StringGrid1.Cells[7, i + 1] := 'Открыт'
        else
        begin
          main.Form1.StringGrid1.Cells[7, i + 1] := 'Закрыт';
        end;
        main.Form1.StringGrid1.Cells[8, i + 1] := q1.Fields[7].AsString;
        main.Form1.StringGrid1.Cells[9, i+1] := MyUtils.getConditionName(q1.FieldByName('contractTypeGroup').asInteger);
        main.Form1.StringGrid1.Cells[10, i + 1] := q1.FieldByName('id').AsString;
        Inc(i);
        Next;
    
    end;
  end;
  if main.Form1.StringGrid1.RowCount > 1 then begin
    main.Form1.StringGrid1.FixedRows := 1;
  end else begin
    main.Form1.StringGrid1.RowCount := 2;
    main.Form1.StringGrid1.FixedRows := 1;
  end;
end;

end.
