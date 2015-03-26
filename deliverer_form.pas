unit deliverer_form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DB, ADODB, StdCtrls, Menus, ComObj, Discounts, DiscountStore;

type
  Tdeliverer = class(TForm)
    q1: TADOQuery;
    StringGrid1: TStringGrid;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    pm1: TPopupMenu;
    N28: TMenuItem;
    grp1: TGroupBox;
    N1: TMenuItem;
    lbltxt1: TLabel;
    lbl1: TLabel;
    EST1: TMenuItem;
    DiscountGrid: TStringGrid;
    Button4: TButton;
    pm2: TPopupMenu;
    SILVER1: TMenuItem;
    GOLD1: TMenuItem;
    VIP1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    Label2: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    N2401: TMenuItem;
    N2: TMenuItem;
    N5: TMenuItem;
    ChekIT1: TMenuItem;
    DelivererGrid: TStringGrid;
    Button2: TButton;
    Edit2: TEdit;
    Edit3: TEdit;
    pm3: TPopupMenu;
    N6: TMenuItem;
    N7: TMenuItem;
    N9: TMenuItem;
    procedure SearchClient(parameter: string; key: string);
    procedure FormCreate(Sender: TObject);
    procedure edt1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn3Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure N28Click(Sender: TObject);
    procedure StringGrid1ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure N1Click(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);



    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure sortByColumn(column : Integer);
    procedure DiscountGridContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure SILVER1Click(Sender: TObject);
    procedure GOLD1Click(Sender: TObject);
    procedure VIP1Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure DiscountGridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SearchDiscountClient(parameter: string; key: string);
    procedure pm2Popup(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
    procedure RadioButton5Click(Sender: TObject);
    procedure RadioButton6Click(Sender: TObject);
    procedure RadioButton7Click(Sender: TObject);
    procedure RadioButton8Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure N2401Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure ChekIT1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);

    procedure fillDelivererGridFromQ1(q1 : TADOQuery);
    procedure Edit2Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure findDelivererByName(name1 : String);
    procedure findDelivererByTelephon(telephone1 : String);
    procedure DelivererGridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure DelivererGridContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure FormShow(Sender: TObject);



  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  deliverer: Tdeliverer;
  iClientID: integer;
  bSaleGroup: Byte;
  sSaleGroup: string;
  manager : boolean;
implementation

{$R *.dfm}
uses
  main, AddClient_form, newContract_form, enDeliverer, DANADO, enContract, enOperation, enProduct, MyUtils ;

procedure Tdeliverer.SearchClient(parameter: string; key: string);
var
  i:  Integer;
begin
  i := 1;
  if (DiscountGrid.Cells[0,1] = '') then begin
    StringGrid1.RowCount := 2;
    StringGrid1.Rows[1].Clear;
    if key='idTarif' then begin
      q1.SQL.Add('SELECT name, date_of_burn, adress, pasport_ser, pasport_num,');
      q1.SQL.Add('pasport_vydan, pasport_date, inn, telephon, id_tarif, CardNumber, id, dateAdd');
      q1.SQL.Add('FROM deliverer WHERE id_tarif > 6 ORDER BY id_tarif,name');
    end;
    if key='name' then begin
      q1.SQL.Add('SELECT name, date_of_burn, adress, pasport_ser, pasport_num,');
      q1.SQL.Add('pasport_vydan, pasport_date, inn, telephon, id_tarif, CardNumber, id, dateAdd');
      q1.SQL.Add('FROM deliverer WHERE name like :pparameter ORDER BY name');
      q1.Parameters.ParamByName('pparameter').Value := parameter+'%';
    end;
    if key='phone' then begin
      q1.SQL.Add('SELECT name, date_of_burn, adress, pasport_ser, pasport_num,');
      q1.SQL.Add('pasport_vydan, pasport_date, inn, telephon, id_tarif, CardNumber, id, dateAdd');
      q1.SQL.Add('FROM deliverer WHERE telephon like :pparameter ORDER BY name');
      q1.Parameters.ParamByName('pparameter').Value := parameter+'%';
    end;
    with q1 do begin
      q1.Open;
      while not Eof do begin
        StringGrid1.Cells[0,i] := q1.Fields[0].AsString;
        StringGrid1.Cells[1,i] := q1.Fields[1].AsString;
        StringGrid1.Cells[2,i] := q1.Fields[2].AsString;
        StringGrid1.Cells[3,i] := q1.Fields[3].AsString;
        StringGrid1.Cells[4,i] := q1.Fields[4].AsString;
        StringGrid1.Cells[5,i] := q1.Fields[5].AsString;
        StringGrid1.Cells[6,i] := q1.Fields[6].AsString;
        StringGrid1.Cells[7,i] := q1.Fields[7].AsString;
        StringGrid1.Cells[8,i] := q1.Fields[8].AsString;
        StringGrid1.Cells[9,i] := q1.Fields[9].AsString;
        StringGrid1.Cells[10,i] := q1.Fields[10].AsString;
        StringGrid1.Cells[11,i] := q1.Fields[11].AsString;
        StringGrid1.Cells[12,i] := q1.Fields[12].AsString;
        StringGrid1.RowCount := StringGrid1.RowCount+1;
        Inc(i);
        Next;
      end;
      q1.Close;
    end;
    q1.SQL.Clear;
    if StringGrid1.RowCount>2 then
      StringGrid1.RowCount := StringGrid1.RowCount-1;
  end;
end;

procedure Tdeliverer.SearchDiscountClient(parameter, key: string);
var
  q1 : TADOQuery;
  sql1 : String;
  idCount : Integer;
  i : Integer;
  RowCount : Integer;
begin
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := danado.utils.getConnectionString;
  if key = 'name' then begin
    sql1 := 'SELECT count(id) as idCount FROM deliverer WHERE name  like :pParameter';
    q1.SQL.Add(sql1);
    q1.Parameters.ParamByName('pParameter').value := parameter+'%';
    q1.Open;



    RowCount := q1.FieldByName('idCount').AsInteger;

    RowCount := danado.utils.getLastId('deliverer');

    if (RowCount > 0) then  begin
      q1.SQL.Clear;
      sql1 := 'SELECT count(id) as idCount FROM deliverer ';
      q1.SQL.Add(sql1);
      q1.Open;
      idCount := q1.FieldByName('idCount').AsInteger;
      idCount := danado.utils.getLastId('deliverer');
      DiscountGrid.RowCount := idCount+1;
      q1.SQL.Clear;
      for I := 1 to idCount do begin
        DiscountGrid.Cells[0,i] := '0';
        DiscountGrid.Cells[1,i] := '0';
        DiscountGrid.Cells[2,i] := '0';
        DiscountGrid.Cells[3,i] := '0';
        DiscountGrid.Cells[4,i] := '0';
        DiscountGrid.Cells[5,i] := '0';
        DiscountGrid.Cells[6,i] := '0';
        DiscountGrid.Cells[7,i] := '0';
        DiscountGrid.Cells[8,i] := '0';
        DiscountGrid.Cells[9,i] := '0';
        DiscountGrid.Cells[10,i] := '0';
        DiscountGrid.Cells[11,i] := '0';
      end;
      sql1 := 'SELECT id, id_tarif, name , telephon , DateAdd FROM deliverer WHERE name like :pParameter';
      q1.SQL.Add(sql1);
      q1.Parameters.ParamByName('pParameter').value := parameter+'%';
      with q1 do begin
        q1.Open;
        while not eof do begin
          idCount := q1.FieldByName('Id').AsInteger;
          DiscountGrid.Cells[0,idCount] := q1.FieldByName('Id').AsString;
          If(q1.FieldByName('id_tarif').AsVariant = NULL) then
            DiscountGrid.Cells[1,idCount] := '0'
          else
            DiscountGrid.Cells[1,idCount] := q1.FieldByName('id_tarif').AsString;
          DiscountGrid.Cells[2,idCount] := q1.FieldByName('name').AsString;
          DiscountGrid.Cells[3,idCount] := q1.FieldByName('DateAdd').AsString;
          DiscountGrid.Cells[4,idCount] := q1.FieldByName('telephon').AsString;
          next;
        end;
      end;
      q1.sql.Clear;
      sql1 := 'SELECT Count(operation.op) AS [COUNT], deliverer.id, Sum(operation.sum_op) AS sum_op, Sum(operation.percent_op) AS percent_op, Sum(operation.delay_op) AS delay_op, Last(operation.date_op) AS Lastdate ' +
        'FROM (contract_info INNER JOIN deliverer ON contract_info.id_deliverer = deliverer.id) INNER JOIN operation ON contract_info.id = operation.id_contract_op ' +
        'WHERE (((operation.op)=1) AND name  like :pParameter) '+
        'GROUP BY deliverer.id, (contract_info.id_deliverer)';
      q1.SQL.Add(sql1);
      q1.Parameters.ParamByName('pParameter').value := parameter+'%';
      with q1 do begin
        q1.Open;
        while not eof do begin
          idCount := q1.FieldByName('id').AsInteger;
          DiscountGrid.Cells[6,idCount] := q1.FieldByName('sum_op').AsString;
          DiscountGrid.Cells[5,idCount] := q1.FieldByName('COUNT').AsString;
          next;
        end;
      end;
      q1.sql.Clear;
      sql1 := 'SELECT Count(operation.op) AS [COUNT], deliverer.id, Sum(operation.sum_op) AS sum_op, Sum(operation.percent_op) AS percent_op, Sum(operation.delay_op) AS delay_op, Last(operation.date_op) AS Lastdate ' +
        'FROM (contract_info INNER JOIN deliverer ON contract_info.id_deliverer = deliverer.id) INNER JOIN operation ON contract_info.id = operation.id_contract_op ' +
        'WHERE (((operation.op)=2) AND name  like :pParameter) '+
        'GROUP BY deliverer.id, (contract_info.id_deliverer)';
      q1.SQL.Add(sql1);
      q1.Parameters.ParamByName('pParameter').value := parameter+'%';
      with q1 do begin
        q1.Open;
        while not eof do begin
          idCount := q1.FieldByName('id').AsInteger;
          DiscountGrid.Cells[7,idCount] := q1.FieldByName('COUNT').AsString;
          DiscountGrid.Cells[8,idCount] := q1.FieldByName('sum_op').AsString;
          DiscountGrid.Cells[9,idCount] := FloatToStr(q1.FieldByName('percent_op').AsFloat + q1.FieldByName('delay_op').AsFloat);
          next;
        end;
      end;
      q1.sql.Clear;
      sql1 := 'SELECT Count(operation.op) AS [COUNT], deliverer.id, Sum(operation.sum_op) AS sum_op, Sum(operation.percent_op) AS percent_op, Sum(operation.delay_op) AS delay_op, Last(operation.date_op) AS Lastdate ' +
        'FROM (contract_info INNER JOIN deliverer ON contract_info.id_deliverer = deliverer.id) INNER JOIN operation ON contract_info.id = operation.id_contract_op ' +
        'WHERE (((operation.op)=5) AND name like :pParameter) '+
        'GROUP BY deliverer.id, (contract_info.id_deliverer)';
      q1.SQL.Add(sql1);
      q1.Parameters.ParamByName('pParameter').value := parameter+'%';
      with q1 do begin
        q1.Open;
          while not eof do begin
            idCount := q1.FieldByName('id').AsInteger;
            DiscountGrid.Cells[10,idCount] := q1.FieldByName('COUNT').AsString;
            DiscountGrid.Cells[11,idCount] := q1.FieldByName('sum_op').AsString;
            next;
          end;
      end;
      sortByColumn(0);
      DiscountGrid.RowCount := RowCount+1;
    end;
  end;
end;

procedure Tdeliverer.SILVER1Click(Sender: TObject);
var
  dA : ADODeliverer;
begin

  dA := ADOdeliverer.Create;
  da.updateIdTarif(StrToInt(DiscountGrid.Cells[0,DiscountGrid.Row]),7);
  DiscountGrid.Cells[1,DiscountGrid.Row] := '7';

end;

procedure Tdeliverer.sortByColumn(column: Integer);
var
  c, r: integer;
  s: integer;
  p: integer;
  m: integer;
  buf: array[0..11] of string;
  i: integer;
begin
  for r := 1 to DiscountGrid.rowcount - 1 do
  begin
    m := r;
    for i := r to DiscountGrid.rowcount - 1 do
      if StrToFloat(DiscountGrid.cells[column, i]) > StrToFloat(DiscountGrid.cells[column, m]) then
        m := i;
    if r <> m then
    begin
      for c := 0 to 11 do
      begin
        buf[c] := DiscountGrid.Cells[c, r];
        DiscountGrid.Cells[c, r] := DiscountGrid.Cells[c, m];
        DiscountGrid.Cells[c, m] := buf[c];
      end;
    end;
  end;
end;

procedure Tdeliverer.FormCreate(Sender: TObject);
begin
{
  manager := true;
  RadioButton1.Hide;
  RadioButton2.Hide;
  RadioButton3.Hide;
  RadioButton4.Hide;
  RadioButton5.Hide;
  RadioButton6.Hide;
  RadioButton7.Hide;
  RadioButton8.Hide;
  Label2.Hide;
  Edit1.hide;
  Button1.hide;
  ChekIt1.Visible := False;
  edt1.Hide;// := True;
  edt2.Hide;// := True;
  DiscountGrid.hide;
  StringGrid1.Width := StringGrid1.Width-8;
  StringGrid1.Cells[0,0] := 'ФИО';
  StringGrid1.ColWidths[0] := 200;
  StringGrid1.Cells[1,0] := 'Дата рождения';
  StringGrid1.ColWidths[1] := 85;
  StringGrid1.Cells[2,0] := 'Адрес';
  StringGrid1.ColWidths[2] := 40;
  StringGrid1.Cells[3,0] := 'Серия';
  StringGrid1.ColWidths[3] := 40;
  StringGrid1.Cells[4,0] := 'Номер';
  StringGrid1.ColWidths[4] := 40;
  StringGrid1.Cells[5,0] := 'Кем выдан';
  StringGrid1.ColWidths[5] := 40;
  StringGrid1.Cells[6,0] := 'Дата';
  StringGrid1.ColWidths[6] := 40;
  StringGrid1.Cells[7,0] := 'ИНН';
  StringGrid1.ColWidths[7] := 40;
  StringGrid1.Cells[8,0] := 'Телефон';
  StringGrid1.ColWidths[8] := 70;
  StringGrid1.Cells[9,0] := 'Скидка';
  StringGrid1.ColWidths[9] := 40;
  StringGrid1.Cells[10,0] := '№ Карточки';
  StringGrid1.Cells[12,0] := 'Добавлен';
  StringGrid1.ColWidths[10] := 40;
  StringGrid1.ColWidths[11] := 0;
  StringGrid1.ColWidths[12] := 50;
//  SearchClient('%','name');
  StringGrid1.hide;

 }

 
end;



procedure Tdeliverer.FormShow(Sender: TObject);
begin
 DelivererGrid.Cells[0,0] := 'ФИО';
  DelivererGrid.Cells[1,0] := 'Телефон';
  DelivererGrid.Cells[2,0] := 'id';
  DelivererGrid.Cells[3,0] := 'id_tarif';
  findDelivererByName('%');
end;

procedure Tdeliverer.GOLD1Click(Sender: TObject);
var
  dA : ADODeliverer;
begin

  dA := ADOdeliverer.Create;
  da.updateIdTarif(StrToInt(DiscountGrid.Cells[0,DiscountGrid.Row]),8);
  DiscountGrid.Cells[1,DiscountGrid.Row] := '8';


end;

procedure Tdeliverer.edt1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (DiscountGrid.Cells[0,1] <> '') then  begin
  //
  end;
end;

procedure Tdeliverer.btn3Click(Sender: TObject);
begin
  Close();
end;

procedure Tdeliverer.Button10Click(Sender: TObject);
begin
sortByColumn(11);
end;





procedure Tdeliverer.Button1Click(Sender: TObject);
var
  pass : String;
begin
  pass := Edit1.text;
  if(pass = '1133') then begin
    Label2.Caption := 'Пароль ВВЕДЁН!';
    edit1.Hide;
    button1.Hide;
    manager := true;
  end;
end;

procedure Tdeliverer.Button2Click(Sender: TObject);
var
  q1 : TADOQuery;
  sql1 : String;
begin
  q1 := TADOQuery.create(nil);
  q1.ConnectionString := DANADO.utils.getConnectionString;

  sql1 := 'SELECT name, telephon, id, id_tarif FROM deliverer';
  q1.sql.add(sql1);
  DelivererGrid.Cells[0,0] := 'ФИО';
  DelivererGrid.Cells[1,0] := 'Телефон';
  DelivererGrid.Cells[2,0] := 'id';
  DelivererGrid.RowHeights[2] := 0;
  DelivererGrid.Cells[3,0] := 'id_tarif';
  fillDelivererGridFromQ1(q1);
end;

procedure Tdeliverer.Button4Click(Sender: TObject);
var
  q1 : TADOQuery;
  sql1 : String;
  idCount : Integer;
  i : Integer;
begin

if (DiscountGrid.Cells[0,1] = '') then begin

  deliverer.Caption := 'НОВЫЙ СПРАВОЧНИК КЛИЕНТОВ';

  StringGrid1.hide;
  label2.show;
  Edit1.show;
  Button1.show;
  DiscountGrid.show;


  DiscountGrid.Cells[0,0] := 'id';
  DiscountGrid.Cells[1,0] := 'ПЛ';
  DiscountGrid.Cells[2,0] := 'ФИО';
  DiscountGrid.Cells[3,0] := 'Дата Добавления';
  DiscountGrid.Cells[4,0] := 'Телефон';
  DiscountGrid.Cells[5,0] := 'Открыто';
  DiscountGrid.Cells[6,0] := 'Сумма Открытых';
  DiscountGrid.Cells[7,0] := 'Закрыто';
  DiscountGrid.Cells[8,0] := 'Сумма Закрытых';
  DiscountGrid.Cells[9,0] := 'Доход %+П';
  DiscountGrid.Cells[10,0] := 'Коль-во*';
  DiscountGrid.Cells[11,0] := 'Сумма *';
  DiscountGrid.ColWidths[0] := 30;
  DiscountGrid.ColWidths[1] := 30;
  DiscountGrid.ColWidths[2] := 220;
  DiscountGrid.ColWidths[4] := 100;

 SearchDiscountClient('%' , 'name' );

//sortByColumn(0);



end else begin
  deliverer.Caption := 'СТАРЫЙ СПРАВОЧНИК КЛИЕНТОВ';
  StringGrid1.Show;

  label2.Hide;
  edit1.Hide;
  button1.Hide;
  DiscountGrid.Hide;
  DiscountGrid.Cells[0,1] := '';
end;


end;

procedure Tdeliverer.Button5Click(Sender: TObject);
var
  i : Integer;
  cc1 : TenContract;
  cc2 : TenContract;
  ccA : ADOcontract;
  ooA : ADOoperation;
  dd1 : Array[0..1994] of TENdeliverer;
  q1 : TADOQuery;
  sql1 : String;
begin
  i := 0;
  cc1 := TenContract.create;
  cc2 := TENcontract.create;
  cca := ADOcontract.Create;
  ooA := ADOoperation.Create;
  //SetLength(cc2.c, 20);

  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := danado.utils.getConnectionString;
  sql1 := 'SELECT id FROM deliverer WHERE id < 100';
  q1.SQL.Add(sql1);
  with q1 do begin
      q1.Open;
      while not eof  do begin
        dd1[i] := TENdeliverer.Create;
      //  dd1[i].con := ccA.ARRgetcontractByDelivererId(q1.FieldByName('id').AsInteger);
        inc(i);
        next;
      end;
  end;


end;

procedure Tdeliverer.Button6Click(Sender: TObject);
begin
sortByColumn(5);
end;

procedure Tdeliverer.Button7Click(Sender: TObject);
begin
sortByColumn(6);
end;

procedure Tdeliverer.Button8Click(Sender: TObject);
begin
sortByColumn(8);
end;

procedure Tdeliverer.Button9Click(Sender: TObject);
begin
sortByColumn(9);
end;

procedure Tdeliverer.ChekIT1Click(Sender: TObject);
var
  deliv : TENDeliverer;
  dela : ADOdeliverer;
begin
  dela := ADOdeliverer.Create;
  deliv := dela.getDelivererById(StrToInt(DiscountGrid.Cells[0,DiscountGrid.Row]));


  DANADO.deliverer.checkNewIdTarif(deliv.getId);

  //danado.tarif.getTarifByIdDelivererFromXML('del0332116');
end;

procedure Tdeliverer.DelivererGridContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
var
  C, R: Integer;
begin
  with TStringGrid(Sender) do begin
  MouseToCell(MousePos.X, MousePos.Y, C, R);
  if (C>=FixedCols) and (R>=FixedRows) then begin
   Row:=R; Col:=C;
  end else Handled:=True;
 end;
end;

procedure Tdeliverer.DelivererGridDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
{
if ((DelivererGrid.Cells[ACol,ARow] <> '') and (ARow <> 0)) then begin
  if (DelivererGrid.Cells[3,ARow] = '7')then
      begin
        DelivererGrid.Canvas.Brush.Color:=clWebLightSteelBlue;
        DelivererGrid.Canvas.FillRect(Rect);
        DelivererGrid.Canvas.TextOut(Rect.Left,Rect.Top,DelivererGrid.Cells[Acol,Arow]);
      end;
      if (DelivererGrid.Cells[3,ARow] = '8')then
      begin
        DelivererGrid.Canvas.Brush.Color:=clWebBurlywood;
        DelivererGrid.Canvas.FillRect(Rect);
        DelivererGrid.Canvas.TextOut(Rect.Left,Rect.Top,DelivererGrid.Cells[Acol,Arow]);
      end;
      if (DelivererGrid.Cells[3,ARow] = '9')then
      begin
        DelivererGrid.Canvas.Brush.Color:=clWebSteelBlue;
        DelivererGrid.Canvas.FillRect(Rect);
        DelivererGrid.Canvas.TextOut(Rect.Left,Rect.Top,DelivererGrid.Cells[Acol,Arow]);
      end;
end;
}
end;

procedure Tdeliverer.DiscountGridContextPopup(Sender: TObject; MousePos: TPoint;
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

procedure Tdeliverer.DiscountGridDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
if ((DiscountGrid.Cells[ACol,ARow] <> '') and (ARow <> 0)) then begin
  if (DiscountGrid.Cells[1,ARow] = '7')then
      begin
        DiscountGrid.Canvas.Brush.Color:=clWebLightSteelBlue;
        DiscountGrid.Canvas.FillRect(Rect);
        DiscountGrid.Canvas.TextOut(Rect.Left,Rect.Top,DiscountGrid.Cells[Acol,Arow]);
      end;
      if (DiscountGrid.Cells[1,ARow] = '8')then
      begin
        DiscountGrid.Canvas.Brush.Color:=clWebBurlywood;
        DiscountGrid.Canvas.FillRect(Rect);
        DiscountGrid.Canvas.TextOut(Rect.Left,Rect.Top,DiscountGrid.Cells[Acol,Arow]);
      end;
      if (DiscountGrid.Cells[1,ARow] = '9')then
      begin
        DiscountGrid.Canvas.Brush.Color:=clWebSteelBlue;
        DiscountGrid.Canvas.FillRect(Rect);
        DiscountGrid.Canvas.TextOut(Rect.Left,Rect.Top,DiscountGrid.Cells[Acol,Arow]);
      end;
end;
end;

procedure Tdeliverer.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then  begin
    button1click(self);
  end;
end;

procedure Tdeliverer.Edit2Change(Sender: TObject);
begin
  //if (Edit2.Text <> '') then  begin
    findDelivererByName(Edit2.Text);
  //end;
end;

procedure Tdeliverer.Edit3Change(Sender: TObject);
begin
  //if (Edit3.Text <> '') then  begin
    findDelivererByTelephon(Edit3.Text);
  //end;
end;

procedure Tdeliverer.btn2Click(Sender: TObject);
begin
  AddClient_form.AddClient := TAddClient.Create(Self);
  //ShowMessage('SET FALSE');
  //main.bEditMark := False;
  iClientID := 0;
  AddClient_form.AddClient.ShowModal;
end;

procedure Tdeliverer.btn1Click(Sender: TObject);
var
  passport: string;
  discount : Integer;
  adoDeliv : ADOdeliverer;
  deliverer : TENdeliverer;
  LoyalGroup : Integer;
  idDeliv : Integer;
  pppl : String;
  itemId : Integer;
  idTarif: integer;
begin

  // FILL DELIVER {
  {
  if (DiscountGrid.Cells[0,1] = '') then begin
    iClientID := StrToInt(StringGrid1.Cells[11,StringGrid1.Row]);
  end else begin
    iClientID := StrToInt(DiscountGrid.Cells[0,DiscountGrid.Row])
  end;
  }
  iClientID := StrToInt(DelivererGrid.Cells[2,DelivererGrid.Row]);
  adoDeliv := ADODeliverer.Create;
  deliverer := TENdeliverer.Create;
  deliverer := adoDeliv.getDelivererById(iClientID);
 // idTarif := Discounts.getTarifFromXMLByDelivererId(deliverer.getId);
  {
  if (idTarif = Ord(TDiscountType.GOLD)) then begin
    DANADO.ADODeliverer.Create.updateIdTarif(deliverer.getId, idTarif);
    deliverer.setId_tarif(idTarif);
  end;
   }
  passport := deliverer.getPasport_ser + ' ' + deliverer.getPasport_num+ ' ' + deliverer.getPasport_vydan+ ' ' + DateToStr(deliverer.getPasport_date);
  newContract.client.Text := deliverer.getName;
  newContract.passport.Caption := passport;
  btn1.Enabled := False;
  bSaleGroup := deliverer.getId_tarif;
  //DANADO.deliverer.checkNewIdTarif(deliv.getId);
{
   // ТУТ ПРОИСХОДИТ ПОЛ ЧУДА

  //Если не индивидуальная скидка то ищем по ид группы скидок Иначе по ид клиента
  if (deliv.getId_tarif <> 9) then begin
    //Делаем ид группы отрицательным
    itemId := -(deliv.getId_tarif);
  end else begin
    itemId := deliv.getId
  end;

  newContract.newTarif  := DANADO.tarif.getTarifByIdDelivererFromXML(itemId);


   // Тут всё остальное
  newContract.oldTarif := DANADO.deliverer.getMagicTarif(newContract.oldTarif, newContract.newTarif, deliv.getId_tarif);
}

 //newContract.oldTarif.setTestPrice(FloatToStr(TReduced.Create.getDiscountedPrice(deliverer, 0)));


  newContract.deliverer := deliverer;
 // bSaleGroup := 0;

 if (newContract.chk1.Checked = TRUE) then begin
 //
 end else begin
  pppl := 'без категории';
  newContract.resetPriceGrid;
  newContract.resetEstimatedGrid;
  newContract.StringGrid1Exit(self);




  // } FILL DELIVER

  // DISCOUNT
   {
  if ((BSaleGroup = 7) OR (BSaleGroup = 8) OR (BSaleGroup = 9)) then begin
    discount := myUtils.getLoyalTarif(bSaleGroup, newContract.MainContractType);
    newContract.Edit2.Text := '';
    newContract.Edit4.Text := '';
    newContract.ContractTypeGroup := discount;
    newContract.ContractType := discount;
    if (newContract.netW > 0) then begin
      newContract.ContractTypeGroup := newContract.getContractTypeGroup(discount,newContract.netW);
      newContract.resetPriceGrid();
      newContract.resetEstimatedGrid;
      newContract.StringGrid1Exit(self);
    end;
    newContract.Label13.Caption := getConditionName(newContract.ContractTypeGroup);
    newCOntract.Caption := 'Новый договор = ' + newContract.Label13.Caption;
    newContract.Button1.Hide;
  end;
   }
if(newContract.Edit2.Text <> '' ) then begin
   newContract.Edit2.Text := '';
   newContract.Edit4.Text := '';
end;
 end;

 Close;
end;

procedure Tdeliverer.N2401Click(Sender: TObject);
var
  d1 :TENdeliverer;
  dado : ADODeliverer;
begin
  ShowMessage(DiscountGrid.Cells[0,DiscountGrid.Row]);
end;

procedure Tdeliverer.N28Click(Sender: TObject);
begin
  //bEditMark := True;
  AddClient_form.AddClient := TAddClient.Create(Self);
  iClientID := StrToInt(StringGrid1.Cells[11,StringGrid1.Row]);
  addClient.fillDelivererFromId(iClientID);
  AddClient_form.AddClient.ShowModal;
end;

procedure Tdeliverer.N2Click(Sender: TObject);
begin
  Form1.Edit3.Text := StringGrid1.Cells[0, StringGrid1.Row];
  deliverer.close;
  Form1.SearchContract();
  Form1.Edit3.Text := '';


end;

procedure Tdeliverer.N3Click(Sender: TObject);
begin
  AddClient_form.AddClient := TAddClient.Create(Self);
  iClientID := StrToInt(DiscountGrid.cells[0,DiscountGrid.Row]);
  addClient.fillDelivererFromId(iClientID);
  AddClient_form.AddClient.ShowModal;
end;

procedure Tdeliverer.N4Click(Sender: TObject);
begin
 Form1.Edit3.Text := DiscountGrid.Cells[2, DiscountGrid.Row];
  deliverer.close;
  Form1.SearchContract();
  Form1.Edit3.Text := '';
end;

procedure Tdeliverer.N5Click(Sender: TObject);
var
  MSWord : Variant;
  stringArray: TStringList;
  delivA : TENDeliverer;
begin

  delivA := TENDeliverer.create;
  delivA := DANADO.deliverer.getDelivererById(StrToInt(DiscountGrid.cells[0, DiscountGrid.Row]));
  stringArray := TStringList.Create;
  stringArray.Delimiter := ' ';
  stringArray.DelimitedText := delivA.getName;
  MSWord := CreateOleObject('Word.Application');
  MSWord.Documents.Add('C://Pawn//report//clientForm.doc');
  newContract_form.newContract.SimpleReplace('@_dateOfCompletion', FormatDateTime('dddddd',main.DOpenDay), MSWord);
  newContract_form.newContract.SimpleReplace('@sureName', stringArray[0], MSWord);
  newContract_form.newContract.SimpleReplace('@firstName', stringArray[1], MSWord);
  try
    newContract_form.newContract.SimpleReplace('@middleName', stringArray[2], MSWord);
    except on e: Exception do begin
      newContract_form.newContract.SimpleReplace('@middleName', ' ', MSWord);
    end;
  end;
  newContract_form.newContract.SimpleReplace('@dateOfBirth', DateToStr(delivA.getDate_of_burn), MSWord);
  newContract_form.newContract.SimpleReplace('@passport', delivA.getPasport_ser, MSWord);
  newContract_form.newContract.SimpleReplace('@_passportNumber', delivA.getPasport_num, MSWord);
  newContract_form.newContract.SimpleReplace('@issued', delivA.getPasport_vydan, MSWord);
  newContract_form.newContract.SimpleReplace('@dateOfIssue', dateToStr(delivA.getPasport_date), MSWord);
  newContract_form.newContract.SimpleReplace('@address', delivA.getAdress, MSWord);
  newContract_form.newContract.SimpleReplace('@inn', deliva.getInn, MSWord);
  newContract_form.newContract.SimpleReplace('@phone', deliva.getTelephon, MSWord);
  newContract_form.newContract.SimpleReplace('@Employee', DANADO.utils.getEmployeeNameByID(main.bIDEmployee), MSWord);
  MSWord.DisplayAlerts:=False;
  MSWord.Visible := True;
  MSWord.Activate;
end;

procedure Tdeliverer.N6Click(Sender: TObject);
begin
  AddClient_form.AddClient := TAddClient.Create(Self);
  iClientID := StrToInt(DelivererGrid.Cells[2,DelivererGrid.Row]);
  addClient.fillDelivererFromId(iClientID);
  AddClient_form.AddClient.ShowModal;
end;

procedure Tdeliverer.N7Click(Sender: TObject);
var
  MSWord : Variant;
  stringArray: TStringList;
  delivA : TENDeliverer;
begin

  delivA := TENDeliverer.create;
  delivA := DANADO.deliverer.getDelivererById(StrToInt(DelivererGrid.cells[2, DelivererGrid.Row]));
  stringArray := TStringList.Create;
  stringArray.Delimiter := ' ';
  stringArray.DelimitedText := delivA.getName;
  MSWord := CreateOleObject('Word.Application');
  MSWord.Documents.Add('C://Pawn//report//clientForm.doc');
  newContract_form.newContract.SimpleReplace('@_dateOfCompletion', FormatDateTime('dddddd',main.DOpenDay), MSWord);
  newContract_form.newContract.SimpleReplace('@sureName', stringArray[0], MSWord);
  newContract_form.newContract.SimpleReplace('@firstName', stringArray[1], MSWord);
  try
    newContract_form.newContract.SimpleReplace('@middleName', stringArray[2], MSWord);
    except on e: Exception do begin
      newContract_form.newContract.SimpleReplace('@middleName', ' ', MSWord);
    end;
  end;
  newContract_form.newContract.SimpleReplace('@dateOfBirth', DateToStr(delivA.getDate_of_burn), MSWord);
  newContract_form.newContract.SimpleReplace('@passport', delivA.getPasport_ser, MSWord);
  newContract_form.newContract.SimpleReplace('@_passportNumber', delivA.getPasport_num, MSWord);
  newContract_form.newContract.SimpleReplace('@issued', delivA.getPasport_vydan, MSWord);
  newContract_form.newContract.SimpleReplace('@dateOfIssue', dateToStr(delivA.getPasport_date), MSWord);
  newContract_form.newContract.SimpleReplace('@address', delivA.getAdress, MSWord);
  newContract_form.newContract.SimpleReplace('@inn', deliva.getInn, MSWord);
  newContract_form.newContract.SimpleReplace('@phone', deliva.getTelephon, MSWord);
  newContract_form.newContract.SimpleReplace('@Employee', DANADO.utils.getEmployeeNameByID(main.bIDEmployee), MSWord);
  MSWord.DisplayAlerts:=False;
  MSWord.Visible := True;
  MSWord.Activate;
end;
procedure Tdeliverer.N9Click(Sender: TObject);
begin
  Form1.Edit3.Text := DelivererGrid.Cells[0, DelivererGrid.Row];
  deliverer.close;
  Form1.SearchContract();
  Form1.Edit3.Text := '';
end;

procedure Tdeliverer.pm2Popup(Sender: TObject);
begin
  if(manager) then begin
    SILVER1.Visible := False;
    GOLD1.Visible := False;
    VIP1.Visible  := False;
  end;
end;

procedure Tdeliverer.RadioButton1Click(Sender: TObject);
begin
sortByColumn(5);
end;

procedure Tdeliverer.RadioButton2Click(Sender: TObject);
begin
sortByColumn(6);
end;

procedure Tdeliverer.RadioButton3Click(Sender: TObject);
begin
sortByColumn(7);
end;

procedure Tdeliverer.RadioButton4Click(Sender: TObject);
begin
sortByColumn(8);
end;

procedure Tdeliverer.RadioButton5Click(Sender: TObject);
begin
sortByColumn(10);
end;

procedure Tdeliverer.RadioButton6Click(Sender: TObject);
begin
sortByColumn(11);
end;

procedure Tdeliverer.RadioButton7Click(Sender: TObject);
begin
sortByColumn(9);
end;

procedure Tdeliverer.RadioButton8Click(Sender: TObject);
begin
sortByColumn(1);
end;

procedure Tdeliverer.StringGrid1ContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
var C, R: Integer;
begin
 with TStringGrid(Sender) do begin
  MouseToCell(MousePos.X, MousePos.Y, C, R);
  if (C>=FixedCols) and (R>=FixedRows) then begin
   Row:=R; Col:=C;
  end else Handled:=True;
 end;
end;

procedure Tdeliverer.fillDelivererGridFromQ1(q1: TADOQuery);
var
  i : Integer;
begin
  i := 1;
  DelivererGrid.rows[1].Clear;
  DelivererGrid.Cells[0,0] := 'ФИО';
  DelivererGrid.Cells[1,0] := 'Телефон';
  DelivererGrid.Cells[2,0] := 'id';
  DelivererGrid.ColWidths[2] := 0;
  DelivererGrid.Cells[3,0] := 'id_tarif';
  q1.Open;
  DelivererGrid.RowCount := q1.RecordCount;

  if (DelivererGrid.RowCount < 2) then begin
      DelivererGrid.RowCount := 2;
      DelivererGrid.FixedRows := 1;
    end;


    while not q1.Eof do begin
      DelivererGrid.Cells[0,i] := q1.FieldByName('name').asstring;
      DelivererGrid.Cells[1,i] := q1.FieldByName('telephon').asstring;
      DelivererGrid.Cells[2,i] := q1.FieldByName('id').asstring;
      DelivererGrid.Cells[3,i] := q1.FieldByName('id_tarif').asstring;
      inc(i);
      q1.Next;
    end;



    DelivererGrid.FixedRows := 1;

end;

procedure Tdeliverer.findDelivererByName(name1: String);
var
  q122 : TADOQuery;
  sql1 : String;
begin
  q122 := TADOQuery.create(nil);
  q122.ConnectionString := DANADO.utils.getConnectionString;
  sql1 := 'SELECT name,telephon, id, id_tarif FROM deliverer WHERE name like :p11 ';
  q122.sql.Add(sql1);
  q122.Parameters.ParamByName('p11').Value := name1+'%';
  fillDelivererGridFromQ1(q122);
  q122.Close;
  q122.Destroy;
end;

procedure Tdeliverer.findDelivererByTelephon(telephone1: String);
var
  q1 : TADOQuery;
  sql1 : String;
begin
  q1 := TADOQuery.create(nil);
  q1.ConnectionString := DANADO.utils.getConnectionString;
  sql1 := 'SELECT name,telephon, id, id_tarif FROM deliverer WHERE telephon like :pTelephon';
  q1.sql.Add(sql1);
  q1.Parameters.ParamByName('pTelephon').Value := telephone1+'%';
  fillDelivererGridFromQ1(q1);
  q1.Close;
  q1.Destroy;
end;

procedure Tdeliverer.N1Click(Sender: TObject);
var
  MSWord: OleVariant;
  stringArray: TStringList;
begin
  stringArray := TStringList.Create;
  stringArray.Delimiter := ' ';
  stringArray.DelimitedText := StringGrid1.Cells[0,StringGrid1.Row];
  MSWord := CreateOleObject('Word.Application');
  MSWord.Documents.Add('C://Pawn//report//clientForm.doc');
  newContract_form.newContract.SimpleReplace('@_dateOfCompletion', FormatDateTime('dddddd',main.DOpenDay), MSWord);
  newContract_form.newContract.SimpleReplace('@sureName', stringArray[0], MSWord);
  newContract_form.newContract.SimpleReplace('@firstName', stringArray[1], MSWord);
  newContract_form.newContract.SimpleReplace('@middleName', stringArray[2], MSWord);
  newContract_form.newContract.SimpleReplace('@dateOfBirth', StringGrid1.Cells[1,StringGrid1.Row], MSWord);
  newContract_form.newContract.SimpleReplace('@passport', StringGrid1.Cells[3,StringGrid1.Row], MSWord);
  newContract_form.newContract.SimpleReplace('@_passportNumber', StringGrid1.Cells[4,StringGrid1.Row], MSWord);
  newContract_form.newContract.SimpleReplace('@issued', StringGrid1.Cells[5,StringGrid1.Row], MSWord);
  newContract_form.newContract.SimpleReplace('@dateOfIssue', StringGrid1.Cells[6,StringGrid1.Row], MSWord);
  newContract_form.newContract.SimpleReplace('@address', StringGrid1.Cells[2,StringGrid1.Row], MSWord);
  newContract_form.newContract.SimpleReplace('@inn', StringGrid1.Cells[7,StringGrid1.Row], MSWord);
  newContract_form.newContract.SimpleReplace('@phone', StringGrid1.Cells[8,StringGrid1.Row], MSWord);
  newContract_form.newContract.SimpleReplace('@Employee', DANADO.utils.getEmployeeNameByID(main.bIDEmployee), MSWord);
  MSWord.DisplayAlerts:=False;
  MSWord.Visible := True;
  MSWord.Activate;
end;

procedure Tdeliverer.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
if ((StringGrid1.Cells[ACol,ARow] <> '') and (ACol = 9) and (ARow <> 0)) then begin
  if (StringGrid1.Cells[9,ARow] = '7')then
      begin
        StringGrid1.Canvas.Brush.Color:=clWebLemonChiffon;
        StringGrid1.Canvas.FillRect(Rect);
        StringGrid1.Canvas.TextOut(Rect.Left,Rect.Top,StringGrid1.Cells[Acol,Arow]);
      end;
      if (StringGrid1.Cells[9,ARow] = '8')then
      begin
        StringGrid1.Canvas.Brush.Color:=clWebGold;
        StringGrid1.Canvas.FillRect(Rect);
        StringGrid1.Canvas.TextOut(Rect.Left,Rect.Top,StringGrid1.Cells[Acol,Arow]);
      end;
      if (StringGrid1.Cells[9,ARow] = '9')then
      begin
        StringGrid1.Canvas.Brush.Color:=clGreen;
        StringGrid1.Canvas.FillRect(Rect);
        StringGrid1.Canvas.TextOut(Rect.Left,Rect.Top,StringGrid1.Cells[Acol,Arow]);
      end;
end;
end;

procedure Tdeliverer.VIP1Click(Sender: TObject);
var
  dA : ADODeliverer;
begin
  dA := ADODeliverer.Create;
  da.updateIdTarif(StrToInt(DiscountGrid.Cells[0,DiscountGrid.Row]),9);
  DiscountGrid.Cells[1,DiscountGrid.Row] := '9';
end;

end.
