unit cashBookFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ComCtrls, Menus, EventEntity, EventADO,MyUtils, DANADO;

type
  TcashBookForm = class(TForm)
    DateTimePicker1: TDateTimePicker;
    StringGrid1: TStringGrid;
    Button1: TButton;
    PopupMenu1: TPopupMenu;
    printOrder: TMenuItem;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure StringGrid1ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure printOrderClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    procedure fillStringGrid;
  public
    { Public declarations }
  end;

var
  cashBookForm: TcashBookForm;
  event : TEvententity;
implementation

uses
  main, Order, CashBook;

{$R *.dfm}

procedure TcashBookForm.FormCreate(Sender: TObject);
begin
  StringGrid1.ColWidths[5] := -1;
  DateTimePicker1.Date := DOpenDay;
  DateTimePicker1.MinDate := getLastDate+1;
  fillStringGrid;
end;

procedure TcashBookForm.printOrderClick(Sender: TObject);
var
 order : TOrder;
begin
  order := TOrder.Create;
  order.getOrderById(StrToInt(StringGrid1.Cells[5,StringGrid1.Row]));
  order.print;
  order.Destroy;
end;

procedure TcashBookForm.StringGrid1ContextPopup(Sender: TObject;
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

procedure TcashBookForm.Button2Click(Sender: TObject);
var
  wReturn: Word;
begin
  wReturn := MessageDlg('Это действие может НАРУШИТЬ нумерацию ордеров!'+
  ' Подтверждаете?', mtConfirmation, [mbYes, mbNo],0);
  if wReturn=6 then TOrder.Create.renewOrders;
end;

procedure TcashBookForm.Button3Click(Sender: TObject);
begin
//  DANADO.order.makeRovno;
end;

procedure TcashBookForm.DateTimePicker1Change(Sender: TObject);
begin
  if (DateTimePicker1.Date>DOpenDay) then begin
    Button1.Enabled := False;
  end
  else begin
    Button1.Enabled := True;
  end;
  fillStringGrid;
end;

procedure TcashBookForm.fillStringGrid;
var
 arrayOfOrders : TArrayOfOrders;
 //orders : TArrayOfOrders;
 i : Integer;
begin
  StringGrid1.RowCount := 2;
  StringGrid1.Rows[1].Clear;
 arrayOfOrders := TOrder.Create.getOrdersByDate(StrToDate(DateToStr(DateTimePicker1.Date)));
 for i := 1 to Length(arrayOfOrders) do begin
    StringGrid1.Cells[0,i] := IntToStr(i);
    StringGrid1.Cells[1,i] := arrayOfOrders[i-1,0]; //Номер ордера
    StringGrid1.Cells[2,i] := arrayOfOrders[i-1,1]; //Счет
    StringGrid1.Cells[3,i] := arrayOfOrders[i-1,2]; //Сумма
    StringGrid1.Cells[4,i] := arrayOfOrders[i-1,3]; //Основание
    StringGrid1.Cells[5,i] := arrayOfOrders[i-1,4]; //id
    StringGrid1.RowCount := StringGrid1.RowCount + 1;
 end;
 if (StringGrid1.RowCount > 2) then
  StringGrid1.RowCount := StringGrid1.RowCount - 1;

end;

procedure TcashBookForm.Button1Click(Sender: TObject);
begin
 // Ивент для мониторинга открытия Кассовой Книги.
{
  event := TEvententity.Create;
  event.eventTypeId := 2;
  event.employeeId := currentEmployee.id;
  event.eventDate := Now;
  EventADO.addEvent(event);

}

  TCashBook.Create.showCashBook(StrToDate(DateToStr(DateTimePicker1.Date)));
end;

end.
