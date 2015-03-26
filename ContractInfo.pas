unit ContractInfo;

interface

type
  TContractInfo = class (TObject)
  private
    contractNumber : string;
    percentPerDay : Double;
    dateBegin : TDateTime;
    dateEnd : TDateTime;
    loanAmount : Double;
    estimatedAmount : Double;
    specialAction : Integer;
    arrayOfProducts : array [0..5,0..8] of string;
  public
    procedure setContractNumber(contractNumber : string);
    procedure setPercentPerDay(percentPerDay : Double);
    procedure setDateBegin(dateBegin : TDateTime);
    procedure setDateEnd(numberOfDays : Integer);
    procedure setLoanAmount(loanAmount : Double);
    procedure setEstimatedAmount(estimatedAmount : Double);
    procedure setSpecialCondition(specialCondition : Integer);
    procedure setValueAtIndexInArrayOfProducts(index : Integer; value : string);

    function getContractNumber : string;
    function getPercentPerDay : Double;
    function getDateBegin : TDateTime;
    function getDateEnd : TDateTime;
    function getLoanAmount : Double;
    function getEstimatedAmount : Double;
    function getSpecialCondition : Integer;

    function calculatePercentage() : Double;
    //function calculateTheAmountToBeReturned() : Double;
    function calculateTheAmountOfInterestToBeReturned() : Double;
end;

implementation

{ TContractInfo }

function TContractInfo.calculatePercentage: Double;
begin

end;

function TContractInfo.calculateTheAmountOfInterestToBeReturned: Double;
begin

end;

function TContractInfo.getContractNumber: string;
begin

end;

function TContractInfo.getDateBegin: TDateTime;
begin

end;

function TContractInfo.getDateEnd: TDateTime;
begin

end;

function TContractInfo.getEstimatedAmount: Double;
begin

end;

function TContractInfo.getLoanAmount: Double;
begin

end;

function TContractInfo.getPercentPerDay: Double;
begin

end;

function TContractInfo.getSpecialCondition: Integer;
begin

end;

procedure TContractInfo.setContractNumber(contractNumber: string);
begin

end;

procedure TContractInfo.setDateBegin(dateBegin: TDateTime);
begin

end;

procedure TContractInfo.setDateEnd(numberOfDays: Integer);
begin

end;

procedure TContractInfo.setEstimatedAmount(estimatedAmount: Double);
begin

end;

procedure TContractInfo.setLoanAmount(loanAmount: Double);
begin

end;

procedure TContractInfo.setPercentPerDay(percentPerDay: Double);
begin

end;

procedure TContractInfo.setSpecialCondition(specialCondition: Integer);
begin

end;

procedure TContractInfo.setValueAtIndexInArrayOfProducts(index: Integer;
  value: string);
begin

end;

end.
 