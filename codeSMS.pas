unit codeSMS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, delivererADO, StdCtrls, enDeliverer,
  DANADO;

type
  TForm4 = class(TForm)
    SMSButton1: TButton;
    SMSLabel1: TLabel;
    SMSEdit1: TEdit;
    procedure SMSButton1Click(Sender: TObject);
    procedure ShowNewContractWindowFromSMS(idGroup,
  idDeliverer: Integer);
    procedure FormShow(Sender: TObject);

  private
    promoTarifId: Integer;
  public
    procedure setPromoTarifId(id: Integer);
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}
uses
 main, DelivererEntity, selectContractTypeForm, newContract_form, deliverer_form;

procedure TForm4.setPromoTarifId(id: Integer);
begin
  Self.promoTarifId := id;
end;

procedure TForm4.FormShow(Sender: TObject);
begin
  selectContractTypeForm.selectContractType.Close;
end;

procedure TForm4.ShowNewContractWindowFromSMS(idGroup, idDeliverer: Integer);
var
deliv : TDelivererClass;
deliverer : TENdeliverer;
begin
    deliv := TDelivererADO.Create.getDelivererById(StrToInt(SMSEdit1.Text));
    deliverer := DANADO.ADODeliverer.Create.getDelivererById(StrToInt(SMSEdit1.Text));
    newContract_form.newContract := TnewContract.Create(self);
    deliverer_form.iClientID := deliv.id;
    newContract_form.newContract.deliverer := deliverer;
    newContract_form.newContract.contractType := idGroup;
    newContract_form.newContract.contractTypeGroup := idGroup;
    newContract_form.newContract.client.Text := deliv.name;
    newContract_form.newContract.passport.Caption := deliv.passport +' '+ deliv.passportNumber + ' ' + deliv.issuingPassport + ' ' +DateToStr(deliv.dateOfIssue);
   // newContract.label17.Caption := deliv.
    //newContract
     newContract_form.newContract.button1.hide;
    newContract_form.newContract.ShowModal;

     {
       passport: string;
      passportNumber: string;
      issuingPassport: string;
      dateOfIssue: TDateTime;
  passport := StringGrid1.Cells[3,StringGrid1.Row] + ' ' +
  StringGrid1.Cells[4,StringGrid1.Row] + ' ' +
  StringGrid1.Cells[5,StringGrid1.Row] + ' ' +
  StringGrid1.Cells[6,StringGrid1.Row];
  iClientID := StrToInt(StringGrid1.Cells[11,StringGrid1.Row]);
  bSaleGroup := StrToInt(StringGrid1.Cells[9,StringGrid1.Row]);
  sSaleGroup := 'Group'+IntToStr(bSaleGroup);
  newContract.client.Text := StringGrid1.Cells[StringGrid1.Selection.Left,StringGrid1.Selection.Bottom];
  newContract.passport.Caption := passport;
  newContract.label17.Caption := StringGrid1.Cells[12,StringGrid1.Row];
  btn1.Enabled := False;
  Close;
   }

end;

procedure TForm4.SMSButton1Click(Sender: TObject);
var
deliv : TDelivererClass;
group : TselectContractType;
begin

  ShowNewContractWindowFromSMS(Self.promoTarifId, StrToInt(SMSEdit1.Text));

 // deliv := TDelivererADO.Create.getDelivererById(StrToInt(SMSEdit1.Text));


 // group := TSelectContractType.Create;
end;

end.
