unit OperationEntity;

interface

uses
  ContractEntity;

type
  TOperation = class(TObject)
    public
      id: Longint;
      operationType: Integer;
      date: TDateTime;
      summa: Double;
      percentSumma: Double;
      delaySumma: Double;
      contractId: Longint;
      contract: TContract;
  end;

implementation

end.
