unit ContractEntity;

interface

type
  TContract = class(TObject)
    public
      id: Longint;
      parentContractId: Longint;
      loanAmount: Double;
      estimatedAmount: Double;
      days: Integer;
      active: Boolean;
      dateOfTheContract: TDateTime;
      completionDateOfTheContract: TDateTime;
      delivererId: Longint;

  end;

implementation



end.
