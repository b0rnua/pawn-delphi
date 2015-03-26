unit Extensions;

interface

uses
  ADODB, SysUtils, LogUnit, DANADO;

type
  TdataArray = array of array of Double;

type
  TExtension = class(TObject)
  private
    arrayOfData : TdataArray;
    marker : Boolean;
  public
    procedure checkTheExtensions();
    procedure createAnArrayOfData();
    procedure clearArrayOfData();
    procedure fixDataInDB();
    procedure showArray();
end;

implementation

uses
  main;

{ TExtension }

procedure TExtension.checkTheExtensions();
var
  i : Integer;
begin
  for i := 0 to (Length(arrayOfData) - 1) do
    if ((i<>0) and (arrayOfData[i,2] <> 0)) then
      if (arrayOfData[i,2] <> arrayOfData[i-1,2]) then
        if ((arrayOfData[i-1,2] - arrayOfData[i-1,4]) <> arrayOfData[i,2]) then
          if ((arrayOfData[i-1,2] + arrayOfData[i,3]) = arrayOfData[i,2]) then begin {---} end
          else begin
            Self.showArray;
            if (arrayOfData[i-1,4] > 0) then arrayOfData[i,2] := arrayOfData[i-1,2] - arrayOfData[i-1,4]
            else if (arrayOfData[i,3] > 0) then arrayOfData[i,2] := arrayOfData[i-1,2] + arrayOfData[i,3]
                  else arrayOfData[i,2] := arrayOfData[i-1,2];
            arrayOfData[i,5] := 100;
            WriteAction('edit repawn|' + FloatToStr(arrayOfData[i,0]) + '|' + FloatToStr(arrayOfData[i,1]) + '|' + FloatToStr(arrayOfData[i,2]) + '|' +
              FloatToStr(arrayOfData[i,3]) + '|' + FloatToStr(arrayOfData[i,4]) + '|' + FloatToStr(arrayOfData[i,5]));
            Self.marker := True;
          end;
end;

procedure TExtension.clearArrayOfData;
var
  i : Integer;
  j : Integer;
begin
  for i := 0 to (Length(arrayOfData) - 1) do begin
    for j := 0 to (Length(arrayOfData[i]) - 1) do begin
      arrayOfData[i,j] := 0;
    end;
  end;
end;

procedure TExtension.createAnArrayOfData();
var
  q1 : TADOQuery;
  q2 : TADOQuery;
  q1QueryString : string;
  q2QueryString : string;
  previousID : Integer;
  i : Integer;
begin
  previousID := 0;
  q1QueryString := 'SELECT id, estimated_amount, EstimatedPercent FROM contract_info WHERE'+
    ' date_begin >= #01/01/2013#';
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := DANADO.utils.getConnectionString;
  q2 := TADOQuery.Create(nil);
  q2.ConnectionString := DANADO.utils.getConnectionString;
  SetLength(arrayOfData,30,6);
  q1.SQL.Add(q1QueryString);

  with q1 do begin
    q1.Open;

    while not Eof do begin
       Self.marker := False;
       Self.clearArrayOfData();
       i := 0;
       q2QueryString := 'SELECT contract_info.id, contract_info.loan_amount, contract_info.estimated_amount,'+
        ' operation.sum_op, contract_info.EstimatedPercent'+
        ' FROM contract_info INNER JOIN operation ON contract_info.id = operation.id_contract_op'+
        ' WHERE (((contract_info.idParentContract)=' + q1.Fields[0].AsString + '))'+
        ' ORDER BY date_begin, contract_info.id, operation.op';
       q2.SQL.Add(q2QueryString);

       with q2 do begin
          q2.Open;

          while not Eof do begin
            if (q2.Fields[0].AsInteger = previousID) then begin
              arrayOfData[i-1,4] := q2.Fields[3].AsFloat;
            end
            else begin
              previousID := q2.Fields[0].AsInteger;
              arrayOfData[i,0] := q2.Fields[0].AsFloat;
              arrayOfData[i,1] := q2.Fields[1].AsFloat;
              arrayOfData[i,2] := q2.Fields[2].AsFloat;
              arrayOfData[i,3] := q2.Fields[3].AsFloat;
              arrayOfData[i,5] := q2.Fields[4].AsFloat;
              Inc(i);
            end;
            Next;
          end;

          q2.Close;
       end;

       Self.checkTheExtensions();
       if (Self.marker) then Self.fixDataInDB();
       q2.SQL.Clear;
       Next;
    end;

    q1.Close;
  end;

  q1.SQL.Clear;
end;

procedure TExtension.fixDataInDB;
var
  q1 : TADOQuery;
  q1QueryString : string;
  i : Integer;
begin
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := DANADO.utils.getConnectionString;;
  for i := 0 to (Length(arrayOfData)-1) do begin
    if ((i <> 0) and (arrayOfData[i,0] <> 0)) then begin
      WriteAction('update repawn|' + FloatToStr(arrayOfData[i,0]) + '|' + FloatToStr(arrayOfData[i,2]) + '|' + FloatToStr(arrayOfData[i,5]));
      q1QueryString := 'UPDATE contract_info SET estimated_amount=' + FloatToStr(arrayOfData[i,2]) + ', EstimatedPercent=' + IntToStr(Round(arrayOfData[i,5])) + ' WHERE id=' + IntToStr(Round(arrayOfData[i,0]));
      q1.SQl.Add(q1QueryString);
      //q1.ExecSQL;
      q1.Close;
      q1.SQL.Clear;
    end;
  end;
  q1.Destroy;
end;

procedure TExtension.showArray;
var
  i : Integer;
begin
  for i := 0 to (Length(arrayOfData) - 1) do begin
    if (arrayOfData[i,0] <> 0) then
    WriteAction('show repawn|' + FloatToStr(arrayOfData[i,0]) + '|' + FloatToStr(arrayOfData[i,1]) + '|' + FloatToStr(arrayOfData[i,2]) + '|' +
      FloatToStr(arrayOfData[i,3]) + '|' + FloatToStr(arrayOfData[i,4]) + '|' + FloatToStr(arrayOfData[i,5]));
  end;
end;

end.
