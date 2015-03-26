unit kassa_form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, Mask,DB, ADODB, Menus, ComCtrls, DANADO;

type
  Tkassa = class(TForm)
    StringGrid1: TStringGrid;
    q1: TADOQuery;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Button1: TButton;
    N4: TMenuItem;
    q2: TADOQuery;
    sEdit1: TEdit;
    sLabel1: TLabel;
    sLabel2: TLabel;
    sDateEdit1: TDateTimePicker;
    procedure ShowOperations;
    procedure FormCreate(Sender: TObject);
    procedure sDateEdit1Change(Sender: TObject);
    procedure StringGrid1ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure renewOrder();
  private
    { Private declarations }
  public

  end;

var
  kassa: Tkassa;

implementation

uses
  main,FullSum;
{$R *.dfm}

procedure Tkassa.ShowOperations;
var
  i: Byte;
begin
  i := 1;
  StringGrid1.RowCount := 2;
  DateSeparator := '/';
  //q1.SQL.Add('SELECT id,op,sum_op FROM operation WHERE date_op=#'+DateToStr(sDateEdit1.Date)+'# AND (op=10 OR op=11)');
  q1.SQL.Add('SELECT id,op,sum_op FROM operation WHERE date_op=:date_op AND (op=10 OR op=11)');
  q1.Parameters.ParamByName('date_op').Value := DateToStr(sDateEdit1.Date);
  with q1 do begin
    q1.Open;
    while not Eof do begin
      if q1.Fields[1].AsInteger = 10 then
        StringGrid1.Cells[0,i] := 'Приход';
      if q1.Fields[1].AsInteger = 11 then
        StringGrid1.Cells[0,i] := 'Расход';
      StringGrid1.Cells[1,i] := q1.Fields[2].AsString;
      StringGrid1.Cells[2,i] := q1.Fields[0].AsString;
      Inc(i);
      StringGrid1.RowCount := StringGrid1.RowCount+1;
      Next;
    end;
    q1.Close;
  end;
  q1.SQL.Clear;
  if i=1 then begin
    StringGrid1.Cells[0,1] := '';
    StringGrid1.Cells[1,1] := '';
  end;
  if StringGrid1.RowCount>2 then
    StringGrid1.RowCount := StringGrid1.RowCount-1;
  DateSeparator := '.';
end;

procedure Tkassa.FormCreate(Sender: TObject);
begin
  q1.ConnectionString := DANADO.utils.getConnectionString;
  StringGrid1.Cells[0,0] := 'Операция';
  StringGrid1.Cells[1,0] := 'Сумма';
  StringGrid1.ColWidths[2] := 0;
  sDateEdit1.Date := DOpenDay;
  q1.SQL.Add('SELECT bPage FROM pasport');
  q1.Open;
  sEdit1.Text := q1.Fields[0].AsString;
  q1.Close;
  q1.SQL.Clear;
 // renewOrder();
  ShowOperations;
end;

procedure Tkassa.sDateEdit1Change(Sender: TObject);
begin
 ShowOperations;
end;

procedure Tkassa.StringGrid1ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
var C, R: Integer;
begin
 with TStringGrid(Sender) do begin
  MouseToCell(MousePos.X, MousePos.Y, C, R);
  if (C>=FixedCols) and (R>=FixedRows) then begin
   Row:=R; Col:=C;
  end else Handled:=True;
 end;
end;

procedure Tkassa.Button1Click(Sender: TObject);
var
  bPageNumber: Byte;
begin
  Form1.ADODataSet3.Active := False;
  Form1.ADODataSet3.CommandText := '';
  Form1.rvkassa.Open;
  Form1.ADOQDay3.SQL.Add('SELECT * FROM kassa WHERE dDate=:pdDate');
  Form1.ADOQDay3.Parameters.ParamByName('pdDate').Value := StrToDate(DateToStr(sDateEdit1.Date));
  Form1.ADOQDay3.Open;
  Form1.rvkassa.SetParam('numPages',SumNumToFull(Form1.ADOQDay3.RecordCount));
  Form1.ADOQDay3.Close;
  Form1.ADOQDay3.SQL.Clear;
  Form1.ADODataSet3.CommandText := 'SELECT OrderNumber,sFrom,sWhom,SumComin,SumOutgoin FROM kassa WHERE dDate=:pDateOp';
  Form1.ADODataSet3.Parameters.ParamByName('pDateOp').Value := StrToDate(DateToStr(sDateEdit1.Date));
  Form1.ADODataSet3.Active := True;
  Form1.ADOQDay3.SQL.Add('SELECT bpage FROM pasport');
  Form1.ADOQDay3.Open;
  bPageNumber := StrToInt(sEdit1.Text);
  Form1.rvkassa.SetParam('bPage',IntToStr(bPageNumber));
  Form1.rvkassa.SetParam('dDateDay','"'+FormatDateTime('dd',sDateEdit1.Date)+'"');
  Form1.rvkassa.SetParam('dDateMY',FormatDateTime('mmmm yyyy',sDateEdit1.Date)+'р.');
  Form1.ADOQDay3.Close;
  Form1.ADOQDay3.SQL.Clear;
  Form1.ADOQDay3.SQL.Add('UPDATE pasport SET bpage=:pPage');
  Form1.ADOQDay3.Parameters.ParamByName('pPage').Value := bPageNumber+1;
  Form1.ADOQDay3.ExecSQL;
  Form1.ADOQDay3.Close;
  Form1.ADOQDay3.SQL.Clear;
  Form1.rvkassa.Execute;
  Form1.rvkassa.Close;
  Form1.ADODataSet3.Active := False;
end;

procedure Tkassa.renewOrder();
var
  bOrderNum, yearNum: Integer;
  wYear, wMonth, wDay: Word;
begin
  if bPPOStatus then begin

  bOrderNum := 1;
  yearNum := 1970;
  q1.SQL.Add('DELETE * FROM kassa');
  q1.ExecSQL;
  q1.SQL.Clear;
  q1.Close;
  q1.SQL.Add('SELECT id, op, sum_op, date_op FROM operation WHERE op=10 OR op=11 ORDER BY date_op,id');
  with q1 do begin
    q1.Open;
    while not Eof do begin
      DecodeDate(q1.Fields[3].AsDateTime, wYear, wMonth, wDay);
      if yearNum<>wYear then begin
        yearNum := wYear;
        bOrderNum := 1;
      end;
      q2.SQL.Add('INSERT INTO kassa (id_operation,OrderNumber,sFrom,sWhom,SumComin,dDate)');
      q2.SQL.Add('VALUES (:pid_operation,:pOrderNumber,:psFrom,:psWhom,:pSumComin,:pdDate)');
      q2.Parameters.ParamByName('pid_operation').Value := q1.Fields[0].AsInteger;
      q2.Parameters.ParamByName('pOrderNumber').Value := bOrderNum;
      if q1.Fields[1].AsInteger=10 then begin
        q2.Parameters.ParamByName('psFrom').Value := '"Центральна каса ПТ""ЛОМБАРД З УЧАСТЮ ТОВ""УКР КРЕДИТ СЕРВІС"" І КО"""';
        q2.Parameters.ParamByName('psWhom').Value := 'Служебное внесение';
      end
      else begin
        q2.Parameters.ParamByName('psFrom').Value := 'Служебное изьятие';
        q2.Parameters.ParamByName('psWhom').Value := 'Центральна каса ПТ"ЛОМБАРД З УЧАСТЮ ТОВ"УКР КРЕДИТ СЕРВІС" І КО"';
      end;
      q2.Parameters.ParamByName('pSumComin').Value := q1.Fields[2].AsFloat;
      q2.Parameters.ParamByName('pdDate').Value := q1.Fields[3].AsDateTime;
      q2.ExecSQL;
      q2.Close;
      q2.SQL.Clear;
      Inc(bOrderNum);
      Next;
    end;
    q1.Close;
  end;
  q1.SQL.Clear;
  end;
end;

procedure Tkassa.N4Click(Sender: TObject);
begin
  //renewOrder();
  ShowMessage('Информация по ордерам обновлена');
end;

procedure Tkassa.N1Click(Sender: TObject);
var
  iPositionSell: integer;
begin
  iPositionSell := StringGrid1.Row;
  q1.SQL.Add('SELECT employee.name, OrderNumber, name_filial FROM pasport INNER JOIN employee ON pasport.id_CurrentEmployee=employee.id');
  q1.Open;
  q2.SQL.Add('SELECT OrderNumber,sFrom,sWhom FROM kassa WHERE id_operation=:pIdOp');
  q2.Parameters.ParamByName('pIdOp').Value := StringGrid1.Cells[2,iPositionSell];
  q2.Open;
  Form1.rvcomin1.SetParam('dDateDay',FormatDateTime('dd',sDateEdit1.Date));
  Form1.rvcomin1.SetParam('dDateMY',FormatDateTime('mmmm yyyy',sDateEdit1.Date)+'р.');
  Form1.rvcomin1.SetParam('sNameKassir','');
  Form1.rvcomin1.SetParam('iOrderNumber',q2.Fields[0].AsString);
  Form1.rvcomin1.SetParam('sFilial',q1.Fields[2].AsString);
  Form1.rvcomin1.SetParam('sNameBuch','ФIЛЮШИНА ОЛЕНА МИКОЛАЇВНА');
  Form1.rvcomin1.SetParam('fSum',StringGrid1.Cells[1,iPositionSell]);
  Form1.rvcomin1.SetParam('sSum',SumNumToFull(StrToFloat(StringGrid1.Cells[1,iPositionSell])));
  Form1.rvcomin1.SetParam('fSumCent',FloatToStr(Frac(StrToFloat(StringGrid1.Cells[1,iPositionSell]))*100));
  Form1.rvcomin1.SetParam('sFrom',q2.Fields[1].AsString);
  if StringGrid1.Cells[0,iPositionSell]='Приход' then begin
    Form1.rvcomin1.SetParam('sGround','рко');
    Form1.rvcomin1.SetParam('sGround2','чек кассового аппарата');
  end;
  if StringGrid1.Cells[0,iPositionSell]='Расход' then begin
    Form1.rvcomin1.SetParam('sGround','чек кассового аппарата');
    Form1.rvcomin1.SetParam('sGround2','квитанция рко');
  end;
  Form1.rvcomin1.SetParam('dDateFull',DateToStr(sDateEdit1.Date));
  Form1.rvcomin1.SetParam('sFrom2',q2.Fields[2].AsString);
  q2.Close;
  q2.SQL.Clear;
  q1.Close;
  q1.SQL.Clear;
  Form1.rvcomin1.Execute;
end;

end.
