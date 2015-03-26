unit EditContractOperationForm;

interface

uses
  Windows, Messages, SysUtils, Variants,
  Classes, Graphics,
  OperationEntity, OperationADO, EventEntity, EventADO, Controls, Forms,
   Dialogs, StdCtrls, Order;

type
  TeditContractOperation = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Memo1: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Button1: TButton;
    Button2: TButton;
    Edit4: TEdit;
    Label7: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
  private
    operation : OperationEntity.TOperation;
    function getTotalSum(summ: String; percent: String; delay: String): Double;
  public
    procedure setOperation(operation: OperationEntity.TOperation);
  end;

var
  editContractOperation: TeditContractOperation;

implementation

uses
  main;

{$R *.dfm}

procedure TeditContractOperation.Button1Click(Sender: TObject);
var
  event: TEventEntity;
  //operation: OperationEntity.TOperation;
  i: Integer;
  order: TOrder;
begin
  if (memo1.Lines.Capacity = 0) then begin
    showmessage('Укажите причину редактирования');
  end else begin
    event := TEventEntity.Create;
    event.eventDate := Now;
    event.eventText := 'Договор: '+ self.operation.contract.number +'; Тело кредита: '+ Edit1.Text +'; Сумма% :'+
      Edit2.Text +'; Сумма пени: '+ Edit3.Text + '; Общая: ' + Edit4.Text;
    event.eventTypeId := 4;
    event.employeeId := currentEmployee.id;
    for i:=0 to (memo1.Lines.Capacity-1) do begin
      event.comment := event.comment + ' ' + memo1.Lines[i];
    end;
    EventADO.addEvent(event);
    self.operation.percentSumma := StrToFloat(Edit2.Text);
    self.operation.delaySumma := StrToFloat(Edit3.Text);
    order := TOrder.Create;
    order.getOrderByOpeartionId(self.operation.id);
    order.summ := Edit4.Text;
    order.setSumInWord(StrToFloat(Edit4.Text));
    order.additional := 'фин. кредит - '+Edit1.Text+' % - '+Edit2.Text+' пеня - '+Edit3.Text;
    order.editOrder;
    TOperationADO.Create.updateOperation(operation);
    Close;
  end;
end;

procedure TeditContractOperation.Button2Click(Sender: TObject);
var
  event: TEventEntity;
begin
  event := TEventEntity.Create;
  event.eventDate := Now;
  event.eventText := 'Договор: '+ self.operation.contract.number +';Тело кредита: '+ Edit1.Text +'; Сумма%: '+
    Edit2.Text +'; Сумма пени: '+ Edit3.Text + '; Общая: ' + Edit4.Text;
  event.eventTypeId := 5;
  event.employeeId := currentEmployee.id;
  EventADO.addEvent(event);
  Close;
end;

procedure TeditContractOperation.Edit2Change(Sender: TObject);
begin
  Edit4.Text := FloatToStr(getTotalSum(Edit1.Text,Edit2.Text,Edit3.Text));
end;

procedure TeditContractOperation.Edit3Change(Sender: TObject);
begin
  Edit4.Text := FloatToStr(getTotalSum(Edit1.Text,Edit2.Text,Edit3.Text));
end;

function TeditContractOperation.getTotalSum(summ, percent,
  delay: String): Double;
begin
 try
  Result := StrToFloat(Edit1.Text) + StrToFloat(Edit2.Text) +
    StrToFloat(Edit3.Text);
 except
 on e : Exception do begin
   ShowMessage('Неверные данные в поле');
 end;
 
 end;
 
end;

procedure TeditContractOperation.setOperation(
  operation: OperationEntity.TOperation);
begin
  self.operation := operation;
end;

end.
