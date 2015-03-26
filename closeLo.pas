unit closeLo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, ExtCtrls, ADODB ,  danado, xmldom, XMLIntf, DS2XML,
  myUtils,
  msxmldom, XMLDoc, main, DB, DBTables;

type
  TForm9 = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    Button1: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Label3: TLabel;
    Button3: TButton;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Button2: TButton;
    Button4: TButton;
    procedure Button2Click(Sender: TObject);
    procedure ExportCloses();
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);

  private
    { Private declarations }
  public

  end;

var
  Form9: TForm9;

implementation

{$R *.dfm}



procedure TForm9.Button1Click(Sender: TObject);
var
   q1 : TADOQuery;
  sql1 : String;

begin
  { q1 := TADOQuery.Create(nil);
   q1.ConnectionString := danado.utils.getConnectionString;
   sql1 := 'SELECT * FROM contract_info WHERE id > 10';
   q1.SQL.Add(sql1);
   q1.Open;
   }
   ExportCloses;
end;

procedure TForm9.Button2Click(Sender: TObject);
var
   q1 : TADOQuery;
  sql1 : String;

begin

   q1 := TADOQuery.Create(nil);
   q1.ConnectionString := danado.utils.getConnectionString;
   sql1 := 'SELECT deliverer.* INTO myCNTR3 FROM deliverer';
   q1.SQL.Add(sql1);
   q1.ExecSQL;
   q1.Destroy;
   q1 := TADOQuery.Create(nil);
   q1.ConnectionString := danado.utils.getConnectionString;
   sql1 :=  'SELECT DISTINCT myCNTR3.* ' +
            'FROM myCNTR3 ' +
            'INNER JOIN contract_info '+
            'ON myCNTR3.id = contract_info.id_deliverer ' +
            'WHERE (((contract_info.con_status)=True))';
  // ExportCloses;
  q1.SQL.Add(sql1);
  q1.Open;
    with q1 do begin
    while not eof  do begin
      q1.Edit;
      q1.FieldByName('name').AsString := ' __****__';
      next;
  end;
  end;
   DatasetToXML(q1, 'C:/Pawn/xml/delivererCloses.xml');

   q1.Destroy;
   q1 := TADOQuery.Create(nil);
   q1.ConnectionString := danado.utils.getConnectionString;
   sql1 := 'DROP TABLE myCNTR3';
   q1.SQL.Add(sql1);
   q1.ExecSQL;
   q1.Destroy;

end;


procedure TForm9.Button3Click(Sender: TObject);
var
  sFileName, filialNumber: string;
  F: TextFile;
  ADOXML, ADOQDay3: TADOQuery;
  q1 : TADOQuery;
  sql1 : string;
  q2 : TADOQuery;
  sql2 : string;
  q3 : TADOQuery;
  sql3 : string;
  q4 : TADOQuery;
  sql4 : string;
begin
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := danado.utils.getConnectionString;
  q2 := TADOQuery.Create(nil);
  q2.ConnectionString := danado.utils.getConnectionString;
  q3 := TADOQuery.Create(nil);
  q3.ConnectionString := danado.utils.getConnectionString;
  q4 := TADOQuery.Create(nil);
  q4.ConnectionString := danado.utils.getConnectionString;

  sql1 := 'SELECT DISTINCT deliverer.* ' +
  'FROM deliverer ' +
  'INNER JOIN contract_info '+
  'ON deliverer.id = contract_info.id_deliverer ' +
  'WHERE (((contract_info.con_status)=True))';

  q1.SQL.Add(sql1);
  q1.Open;
  Label6.Caption := IntToStr(q1.RecordCount);


  sql2 := 'SELECT * FROM contract_info WHERE con_status=True';
  q2.SQL.Add(sql2);
  q2.Open;
  Label4.Caption := IntToStr(q2.RecordCount);

  sql3 := 'SELECT * FROM product_info WHERE product_status=True';
  q3.SQL.Add(sql3);
  q3.Open;
  Label5.Caption := IntToStr(q3.RecordCount);

end;

procedure TForm9.Button4Click(Sender: TObject);
var
  my : TField;
  i : Integer;
  ost : Double;
begin
           ost := danado.utils.getOstatokKassa(now());



end;

procedure TForm9.ExportCloses();
var
  sFileName, filialNumber: string;
  F: TextFile;
  ADOXML, ADOQDay3: TADOQuery;
  q1 : TADOQuery;
  sql1 : string;
  q2 : TADOQuery;
  sql2 : string;
  q3 : TADOQuery;
  sql3 : string;
  q4 : TADOQuery;
  sql4 : string;
begin
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := danado.utils.getConnectionString;
  q2 := TADOQuery.Create(nil);
  q2.ConnectionString := danado.utils.getConnectionString;
  q3 := TADOQuery.Create(nil);
  q3.ConnectionString := danado.utils.getConnectionString;
  q4 := TADOQuery.Create(nil);
  q4.ConnectionString := danado.utils.getConnectionString;

  sql1 := 'SELECT DISTINCT deliverer.* ' +
  'FROM deliverer ' +
  'INNER JOIN contract_info '+
  'ON deliverer.id = contract_info.id_deliverer ' +
  'WHERE (((contract_info.con_status)=True))';

  q1.SQL.Add(sql1);
  q1.Open;
  {
  with q1 do begin
    while not eof  do begin
      q1.Edit;
      q1.FieldByName('name').AsString := '—¿Ã€≈  –Œ¬¿¬€≈ __****__';
      next;
  end;
  end;
  }
  DatasetToXML(q1, 'C:/Pawn/xml/delivererCloses.xml');

  sql2 := 'SELECT * FROM contract_info WHERE con_status=True';
  q2.SQL.Add(sql2);
  q2.Open;
  DatasetToXML(q2, 'C:/Pawn/xml/contractInfoCloses.xml');

  sql3 := 'SELECT * FROM product_info WHERE product_status=True';
  q3.SQL.Add(sql3);
  q3.Open;
  DatasetToXML(q3, 'C:/Pawn/xml/productInfoCloses.xml');

  sql4 := 'SELECT name_filial FROM pasport';
  q4.SQL.Add(sql4);
  q4.Open;

  sFileName := 'CLOSED_LO_' + q4.FieldByName('name_filial').AsString + '_' +'.rar';
  filialNumber := myUtils.getNulliki(q4.FieldByName('name_filial').AsInteger)+q4.FieldByName('name_filial').AsString;

  ExecAndWait('C:\Pawn\Rar.exe', 'a C:\Pawn\archives\' + sFileName +
    ' C:\Pawn\xml\*Closes.xml -ep', 0);
  CopyFile(PWideChar('C:\Pawn\archives\' + sFileName),
    PWideChar('C:\filialdata\Dropbox\update\CLOSES\' + sFileName), false);
  DeleteFile('C:\Pawn\xml\delivererCloses.xml');
  DeleteFile('C:\Pawn\xml\contractInfoCloses.xml');
  DeleteFile('C:\Pawn\xml\productInfoCloses.xml');
end;

end.
