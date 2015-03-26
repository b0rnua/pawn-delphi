unit sale_form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB;

type
  Tsale = class(TForm)
    btn1: TButton;
    q1: TADOQuery;
    edt1: TEdit;
    txt1: TLabel;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  sale: Tsale;

implementation

uses main, bayout_form;

{$R *.dfm}

procedure Tsale.btn1Click(Sender: TObject);
begin
  q1.SQL.Add('UPDATE deliverer SET deliverer.id_tarif=2, CardNumber=:pCardNumber, CardType="red" WHERE deliverer.id=:pIdDeliverer');
  q1.Parameters.ParamByName('pCardNumber').Value := edt1.Text;
  q1.Parameters.ParamByName('pIdDeliverer').Value:= bayout_form.iDelivererId;
  q1.ExecSQL;
  q1.SQL.Clear;
  q1.Close;
  Close;
end;

end.
