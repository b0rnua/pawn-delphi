unit DS2XML;

interface

uses
  Classes, DB;

procedure DatasetToXML(Dataset: TDataset; FileName: string);

implementation

uses
  SysUtils, main;

var
  SourceBuffer: PAnsiChar;

procedure WriteString(Stream: TFileStream; s: string);
begin
  StrPCopy(SourceBuffer, AnsiString(s));
  Stream.Write(SourceBuffer[0], StrLen(SourceBuffer));
end;

procedure WriteFileBegin(Stream: TFileStream; Dataset: TDataset);

  function XMLFieldType(fld: TField): string;
  begin
    case fld.DataType of
      ftString: Result := '"string" WIDTH="' + IntToStr(fld.Size) + '"';
      ftSmallint: Result := '"i4"'; //??
      ftInteger: Result := '"i4"';
      ftWord: Result := '"i4"'; //??
      ftBoolean: Result := '"boolean"';
      ftAutoInc: Result := '"i4" SUBTYPE="Autoinc"';
      ftFloat: Result := '"r8"';
      ftCurrency: Result := '"r8" SUBTYPE="Money"';
      ftBCD: Result := '"r8"'; //??
      ftDate: Result := '"date"';
      ftTime: Result := '"time"'; //??
      ftDateTime: Result := '"datetime"';
    else
    end;
    if fld.Required then
      Result := Result + ' required="true"';
    if fld.Readonly then
      Result := Result + ' readonly="true"';
  end;

var
  sFilial: string;
  i: Integer;
begin
  form1.ADOQDay3.SQL.Add('SELECT num_filial FROM pasport');
  form1.ADOQDay3.Open;
  sFilial := form1.ADOQDay3.Fields[0].AsString;
  form1.ADOQDay3.SQL.Clear;
  form1.ADOQDay3.Close;
  WriteString(Stream, '<?xml version="1.0" encoding="windows-1251"?><DATAPACKET Version="2.0">');
  WriteString(Stream, '<FILIAL>'+SFilial+'</FILIAL>');
  WriteString(Stream, '<METADATA><FIELDS>');

  {write th metadata}
  with Dataset do
    for i := 0 to FieldCount-1 do
    begin
      WriteString(Stream, '<FIELD attrname="' +
                          Fields[i].FieldName +
                          '" fieldtype=' +
                          XMLFieldType(Fields[i]) +
                          '/>');
    end;
  WriteString(Stream, '</FIELDS>');
  WriteString(Stream, '<PARAMS DEFAULT_ORDER="1" PRIMARY_KEY="1" LCID="1033"/>');
  WriteString(Stream, '</METADATA><ROWDATA>');
end;

procedure WriteFileEnd(Stream: TFileStream);
begin
  WriteString(Stream, '</ROWDATA></DATAPACKET>');
end;

procedure WriteRowStart(Stream: TFileStream; IsAddedTitle: Boolean);
begin
  if not IsAddedTitle then
    WriteString(Stream, '<ROW');
end;

procedure WriteRowEnd(Stream: TFileStream; IsAddedTitle: Boolean);
begin
  if not IsAddedTitle then
    WriteString(Stream, '/>');
end;

procedure WriteData(Stream: TFileStream; fld: TField; AString: ShortString);
begin
  if Assigned(fld) and (AString <> '') then begin
    AString := stringReplace (AString, '"' , '' ,[rfReplaceAll]);
    AString := stringReplace (AString, '#39' , '' ,[rfReplaceAll]);
    WriteString(Stream, ' ' + fld.FieldName + '="' + AString + '"');
  end;
end;

function GetFieldStr(Field: TField): string;

  function GetDig(i, j: Word): string;
  begin
    Result := IntToStr(i);
    while (Length(Result) < j) do
      Result := '0' + Result;
  end;

var Hour, Min, Sec, MSec: Word;
begin
  case Field.DataType of
    ftBoolean: begin//Result := UpperCase(Field.AsString);
                if (Field.AsString='False') then Result := '0'
                else  Result := '1';
               end;
    ftDate: Result := FormatDateTime('dd.mm.yyyy', Field.AsDateTime);
    ftTime: Result := FormatDateTime('hhnnss', Field.AsDateTime);
    ftDateTime: begin
                  Result := FormatDateTime('dd.mm.yyyy', Field.AsDateTime);
                  //if (Result='30.12.1899') then Result := '';
                  DecodeTime(Field.AsDateTime, Hour, Min, Sec, MSec);
                  if (Hour <> 0) or (Min <> 0) or (Sec <> 0) or (MSec <> 0) then
                    Result := Result + ' ' + GetDig(Hour, 2) + ':' + GetDig(Min, 2) + ':' + GetDig(Sec, 2) + GetDig(MSec, 3);
                end;
  else
    Result := Field.AsString;
  end;
end;

procedure DatasetToXML(Dataset: TDataset; FileName: string);
var
  Stream: TFileStream;
  bkmark: TBookmark;
  i: Integer;
begin
  Stream := TFileStream.Create(FileName, fmCreate);
  SourceBuffer := PAnsiChar(StrAlloc(1024));
  WriteFileBegin(Stream, Dataset);

  with DataSet do
  begin
    DisableControls;
    bkmark := GetBookmark;
    First;

    {write a title row}
    WriteRowStart(Stream, True);
    for i := 0 to FieldCount-1 do
      WriteData(Stream, nil, Fields[i].DisplayLabel);
    {write the end of row}
    WriteRowEnd(Stream, True);

    while (not EOF) do
    begin
      WriteRowStart(Stream, False);
      for i := 0 to FieldCount-1 do
        WriteData(Stream, Fields[i], GetFieldStr(Fields[i]));
      {write the end of row}
      WriteRowEnd(Stream, False);

      Next;
    end;

    GotoBookmark(bkmark);
    EnableControls;
  end;

  WriteFileEnd(Stream);
  Stream.Free;
  StrDispose(SourceBuffer);
end;


end.
