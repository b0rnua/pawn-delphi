unit exchangeRepawnContractType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, ExtCtrls;

type
  TForm10 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Panel1: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    Label9: TLabel;
    Label10: TLabel;
    Button1: TButton;
    procedure FormShow(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    function getConPercentWithNumOfDayAndWeightNetAndIdTraifByContractTypeGroup(numOfDay : Integer; WeightNet : Double;idTarif : Integer; ContractTypeGroup : Integer) : Double;
    { Public declarations }
  end;

var
  Form10: TForm10;
    idContract : Integer;
    contractNumber : String;
    newLoyalContractType : Integer;
    newidTarif : Integer;
    newWeightNet : Double;
implementation

uses
  danado,enContract,enDeliverer,enProduct,MyUtils,newContract_form,repawning_form;

{$R *.dfm}

procedure TForm10.Button1Click(Sender: TObject);
begin
  form10.Close;
end;

procedure TForm10.FormShow(Sender: TObject);
var
  contract : TENcontract2;
  deliverer : TENdeliverer;
  product : TENproduct;
begin
  if (contractNumber = '') then begin
    ShowMessage('Нет Информации по договору');
  end else begin
    contract := TENcontract2.Create;
    deliverer := TENdeliverer.Create;
    product := TENproduct.Create;
    contract := danado.contract.getContractByNumber(contractNumber);
    deliverer := danado.deliverer.getDelivererById(contract.idDeliverer);
    newidTarif := deliverer.getId_tarif;
    product := danado.product.getProductByIdContract(contract.id);
    newWeightNet := product.weightNet;
    edit1.Text := IntToStr(contract.numOfDay);
    edit2.Text := IntToStr(contract.numOfDay);
    edit3.Text := IntToStr(contract.numOfDay);
    edit4.Text := IntToStr(contract.numOfDay);
    edit5.Text := floatToStr(contract.conPercent);
    edit6.Text := floatToStr(getConPercentWithNumOfDayAndWeightNetAndIdTraifByContractTypeGroup(contract.numOfDay,newWeightNet,newidTarif,141));
    edit7.Text := floatToStr(getConPercentWithNumOfDayAndWeightNetAndIdTraifByContractTypeGroup(contract.numOfDay,newWeightNet,newidTarif,137));
    edit8.Text := floatToStr(getConPercentWithNumOfDayAndWeightNetAndIdTraifByContractTypeGroup(contract.numOfDay,newWeightNet,newidTarif,145));
    RadioButton2Click(self);
    end;
end;
function TForm10.getConPercentWithNumOfDayAndWeightNetAndIdTraifByContractTypeGroup(
  numOfDay: Integer; WeightNet: Double; idTarif : Integer; ContractTypeGroup: Integer): Double;
var
  res : Double;
  tmpContractType : Integer;
begin
  tmpContractType := MyUtils.getLoyalTarif(idTarif,ContractTypeGroup);
  tmpContractType := newContract_form.newContract.getContractTypeGroup(tmpContractType,WeightNet);
  res := MyUtils.getPercentPerDay(tmpContractType,0,numOfDay);
  RESULT := res;
end;

procedure TForm10.RadioButton2Click(Sender: TObject);
begin
  newLoyalContractType := MyUtils.getLoyalTarif(newidTarif,141);
  newLoyalContractType := newContract_form.newContract.getContractTypeGroup(newLoyalContractType,newWeightNet);
  repawning_form.repawning.contractTypeGroup := newLoyalContractType;
end;

procedure TForm10.RadioButton3Click(Sender: TObject);
begin
  newLoyalContractType := MyUtils.getLoyalTarif(newidTarif,137);
  newLoyalContractType := newContract_form.newContract.getContractTypeGroup(newLoyalContractType,newWeightNet);
  repawning_form.repawning.contractTypeGroup := newLoyalContractType;
end;

procedure TForm10.RadioButton4Click(Sender: TObject);
begin
  newLoyalContractType := MyUtils.getLoyalTarif(newidTarif,145);
  newLoyalContractType := newContract_form.newContract.getContractTypeGroup(newLoyalContractType,newWeightNet);
  repawning_form.repawning.contractTypeGroup := newLoyalContractType;
end;

end.
