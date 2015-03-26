unit editBK;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls;

type
  TForm5 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;
  idContract7 : Integer;
implementation

uses lototronEntity,lototronADO,EventEntity, EventADO,main;
{$R *.dfm}

procedure TForm5.Button1Click(Sender: TObject);
begin
  self.Close;
end;

procedure TForm5.Button2Click(Sender: TObject);
var
  eva : TEventEntity;
  loto1 : TLototron;
  lotoADO : TlototronADO;
begin
  lotoADO := TLototronADO.Create;
  loto1 := Tlototron.Create;
  loto1.setIdDeliverer(0);
  loto1.setIdContract(idContract7);
  loto1.setTicket(Edit1.Text);
  loto1.setSell(Edit2.Text);
  lotoADO.addLototron(loto1);
  eva := TEventEntity.Create;

  eva.eventDate := now();
  eva.eventText := 'Сохранили скидку по дог№ ' + label4.Caption + ' Билет № ' + loto1.getTicket+ ' Скидка%: '+ loto1.getSell;
  eva.eventTypeid  := 6;
  eva.comment :=  '';
  eva.employeeId := main.id_CurrentEmployee;
  eventADO.addEvent(eva);

  self.Close;
end;

procedure TForm5.FormShow(Sender: TObject);
var
  lotADO : TLototronADO;
  loto : Tlototron;
  eva : TeventEntity;
begin
  lotADO := TLototronADO.Create;
  loto := TLototron.Create;
  loto := lotADO.getLototronByIdContract(idContract7);
  self.edit1.Text := loto.getTicket;
  self.edit2.Text := loto.getSell;
  eva := TEventEntity.Create;
  eva.eventDate := now();
  eva.eventText := 'Открыли окно скидки по дог№ ' + label4.Caption + ' Билет № ' + loto.getTicket+ ' Скидка%: '+ loto.getSell;
  eva.eventTypeid  := 7;
  eva.comment :=  '';
  eva.employeeId := main.id_CurrentEmployee;
  eventADO.addEvent(eva);
end;

end.
