unit ContractEntity;

interface

uses
  DelivererEntity, EmployeeEntity;

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
      deliverer: TDelivererClass;
      employeeId: Longint;
      employee: TEmployee;
      number: string;
      specialCondition: Boolean;
      con_percent: Double;
      contractTypeGroup: Integer;
      arrears : Boolean;
      arrearsAmount : String;
end;

implementation



end.
