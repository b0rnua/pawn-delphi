unit Product;

interface

uses
ContractEntity;

type
  TProductEntity = class(TObject)

    public
    id : Longint;
    product : string;
    metal : string;
    num : Integer;
    test : string;
    price : Double;
    weight : Double;
    weightNet : Double;
    weightPiece : Double;
    estimatedAmount : Double;
    contract : TContract;
    contractId : Longint;
    productStatus : boolean;
    SerialNumber : string;

    private

end;

implementation

end.
