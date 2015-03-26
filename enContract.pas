unit enContract;

interface

uses
  SysUtils,Dialogs, enProduct, enOperation, enDeliverer;
type
  TENcontract2 =class(TObject)
    private
      id2 : Integer;
      idParentContract2: integer;
      idDeliverer2: integer;
      numOfDay2 : integer;
      idEmployee2 : integer;
      contractTypeGroup2: integer;
      loanAmount2  : Double;
      estimatedAmount2  : Double;
      conPercent2 : Double;
      amountRef2 : Double;
      sumPercent2 : Double;
      estimatedPercent2 : Double;
      dollarPrice2 : Double;
      estimatedAmountInDollar2 : Double;
      specialAction2 : Double;
      dateBegin2 : string;
      dateEnd2 : string;
      dateClose2 : string;
      contractNumber2 : string;
      conStatus2 : Boolean;
      specialCondition2 : Boolean;
      arrears2 : Boolean;
      procedure setId                       (id1 : Integer);
      procedure setIdParentContract         (idParentContract1 : Integer);
      procedure setIdDeliverer             (idDeliverer1 : Integer);
      procedure setNumOfDay               (numOfDay1 : Integer);
      procedure setIdEmployee               (idEmployee1 : Integer);
      procedure setContractTypeGroup        (contractTypeGroup1 : Integer);
      procedure setLoanAmount              (loanAmount1 : Double);
      procedure setEstimatedAmount         (estimatedAmount1 : Double);
      procedure setConPercent              (conPercent1 : Double);
      procedure setAmountRef               (amountRef1 : Double );
      procedure setSumPercent              (sumPercent1 : Double );
      procedure setEstimatedPercent         (estimatedPercent1 : Double );
      procedure setDollarPrice              (dollarPrice1 : Double );
      procedure setEstimatedAmountInDollar  (estimatedAmountInDollar1 : Double );
      procedure setSpecialAction            (specialAction1 : Double );
      procedure setContractNumber          (contractNumber1 : String );
      procedure setDateBegin               (dateBegin1 : String );
      procedure setDateEnd                 (dateEnd1 : String );
      procedure setDateClose                (dateClose1 : String );
      procedure setConStatus               (conStatus1 : Boolean );
      procedure setSpecialCondition         (specialCondition1 : Boolean );
      procedure setArrears                  (arrears1 : Boolean);

      function getId () : Integer;
      function getIdParentContract () : Integer;
      function getIdDeliverer () : Integer;
      function getNumOfDay () : Integer;
      function getIdEmployee () : Integer;
      function getContractTypeGroup () : Integer;
      function getLoanAmount () : Double;
      function getEstimatedAmount () : Double;
      function getConPercent () : Double;
      function getAmountRef () : Double;
      function getSumPercent () : Double;
      function getEstimatedPercent () : Double;
      function getDollarPrice () : Double;
      function getEstimatedAmountInDollar () : Double;
      function getSpecialAction () : Double;
      function getContractNumber () : String;
      function getDateBegin () : String;
      function getDateEnd () : String;
      function getDateClose () : String;
      function getConStatus () : Boolean;
      function getSpecialCondition () : Boolean;
      function getArrears () : Boolean;

    public
      product : TENproduct;
      operation : TENoperation;
      deliverer : TENdeliverer;

      constructor Create();

      property id : integer read getId write setId;
      property idParentContract : Integer read getIdParentContract write setIdParentContract;
      property idDeliverer : Integer read getIdDeliverer write setIdDeliverer;
      property idEmployee : Integer read getIdEmployee write setIdEmployee;
      property numOfDay : Integer read getNumOfDay write setNumOfDay;
      property contractTypeGroup: integer read getContractTypeGroup write setContractTypeGroup;
      property loanAmount : Double read getLoanAmount write setLoanAmount;
      property estimatedAmount : Double read getEstimatedAmount write setEstimatedAmount;
      property conPercent : Double read getConPercent write setConPercent;
      property amountRef : Double read getAmountRef write setAmountRef;
      property sumPercent : Double read getSumPercent write setSumPercent;
      property estimatedPercent : Double read getEstimatedPercent write setEstimatedPercent;
      property dollarPrice : Double read getDollarPrice write setDollarPrice;
      property estimatedAmountInDollar : Double read getEstimatedAmountInDollar write setEstimatedAmountInDollar;
      property specialAction : Double read getSpecialAction write setSpecialAction;
      property dateBegin : string read getDateBegin write setDateBegin;
      property dateEnd : String read getDateEnd write setDateEnd;
      property dateClose : String read getDateClose write setDateClose;
      property contractNumber : string read getContractNumber write setContractNumber;
      property conStatus : Boolean read getConStatus write setConStatus;
      property specialCondition : Boolean read getSpecialCondition write setSpecialCondition;
      property arrears : Boolean read getArrears write setArrears;

  end;

  TENcontract = class(TObject)
    public
      count : Integer;
      c : Array of TENcontract2;
  end;


implementation

constructor TENcontract2.Create;
begin
  id2                        := 0;
  idParentContract2          := 0;
  idDeliverer2              := 0;
  numOfDay2                := 0;
  idEmployee2                := 0;
  contractTypeGroup2         := 0;
  loanAmount2               := 0.0;
  estimatedAmount2          := 0.0;
  conPercent2              := 0.0;
  amountRef2                := 0.0;
  sumPercent2               := 0.0;
  estimatedPercent2          := 0.0;
  dollarPrice2               := 0.0;
  estimatedAmountInDollar2   := 0.0;
  specialAction2             := 0.0;
  contractNumber2           := '0';
  dateBegin2                := '';
  dateEnd2                  := '';
  dateClose2                 := '';
  conStatus2                := TRUE;
  specialCondition2          := FALSE;
  arrears2                   := FALSE;
end;

function TENcontract2.getAmountRef: Double;
begin
  RESULT := self.amountRef2;
end;

function TENcontract2.getArrears: Boolean;
begin
  RESULT := self.arrears2
end;

function TENcontract2.getContractTypeGroup: Integer;
begin
  RESULT := self.contractTypeGroup2;
end;

function TENcontract2.getContractNumber: String;
begin
  RESULT := self.contractNumber2;
end;

function TENcontract2.getConPercent: Double;
begin
  RESULT := self.conPercent2;
end;

function TENcontract2.getConStatus: Boolean;
begin
  RESULT := self.conStatus2;
end;

function TENcontract2.getDateClose: String;
begin
  RESULT := self.dateClose2;
end;

function TENcontract2.getDateBegin: String;
begin
  RESULT := self.dateBegin2;
end;

function TENcontract2.getDateEnd: String;
begin
  RESULT := self.dateEnd2;
end;

function TENcontract2.getDollarPrice: Double;
begin
  RESULT := self.dollarPrice2;
end;

function TENcontract2.getEstimatedAmountInDollar: Double;
begin
  RESULT := self.estimatedAmountInDollar2;
end;

function TENcontract2.getEstimatedPercent: Double;
begin
  RESULT := self.estimatedPercent2;
end;

function TENcontract2.getEstimatedAmount: Double;
begin
  RESULT := self.estimatedAmount2;
end;

function TENcontract2.getId: Integer;
begin
  RESULT := self.id2;
end;

function TENcontract2.getIdParentContract: Integer;
begin
  RESULT := self.idParentContract2;
end;

function TENcontract2.getIdDeliverer: Integer;
begin
  RESULT := self.idDeliverer2;
end;

function TENcontract2.getIdEmployee: Integer;
begin
  RESULT := self.idEmployee2;
end;

function TENcontract2.getLoanAmount: Double;
begin
  RESULT := self.loanAmount2;
end;

function TENcontract2.getNumOfDay: Integer;
begin
  RESULT := self.numOfDay2;
end;

function TENcontract2.getSpecialAction: Double;
begin
  RESULT := self.specialAction2;
end;

function TENcontract2.getSpecialCondition: Boolean;
begin
  RESULT := self.specialCondition2;
end;

function TENcontract2.getSumPercent: Double;
begin
  RESULT := self.sumPercent2;
end;

procedure TENcontract2.setAmountRef(amountRef1: Double);
begin
  self.amountRef2 := amountRef1;
end;

procedure TENcontract2.setArrears(arrears1: Boolean);
begin
  self.arrears2 := arrears1;
end;

procedure TENcontract2.setContractTypeGroup(contractTypeGroup1: Integer);
begin
  self.contractTypeGroup2 := contractTypeGroup1;
end;

procedure TENcontract2.setContractNumber(contractNumber1: String);
begin
  self.contractNumber2 := contractNumber1;
end;

procedure TENcontract2.setConPercent(conPercent1: Double);
begin
  self.conPercent2 := conPercent1;
end;

procedure TENcontract2.setConStatus(conStatus1: Boolean);
begin
  self.conStatus2 := conStatus1;
end;

procedure TENcontract2.setDateClose(dateClose1: String);
begin
  self.dateClose2 := dateClose1;
end;

procedure TENcontract2.setDateBegin(dateBegin1: String);
begin
  self.dateBegin2 := dateBegin1;
end;

procedure TENcontract2.setDateEnd(dateEnd1: String);
begin
  self.dateEnd2 := dateEnd1;
end;

procedure TENcontract2.setDollarPrice(dollarPrice1: Double);
begin
  self.dollarPrice2 := dollarPrice1;
end;

procedure TENcontract2.setEstimatedAmountInDollar(estimatedAmountInDollar1: Double);
begin
  self.estimatedAmountInDollar2 := estimatedAmountInDollar1;
end;

procedure TENcontract2.setEstimatedPercent(estimatedPercent1: Double);
begin
  self.estimatedPercent2 := estimatedPercent1;
end;

procedure TENcontract2.setEstimatedAmount(estimatedAmount1: Double);
begin
  self.estimatedAmount2 := estimatedAmount1;
end;

procedure TENcontract2.setId(id1: Integer);
begin
  self.id2 := id1;
end;

procedure TENcontract2.setIdParentContract(idParentContract1: Integer);
begin
  self.idParentContract2 := idParentContract1;
end;

procedure TENcontract2.setIdDeliverer(idDeliverer1: Integer);
begin
  self.idDeliverer2 := idDeliverer1;
end;

procedure TENcontract2.setIdEmployee(idEmployee1: Integer);
begin
  self.idEmployee2 := idEmployee1;
end;

procedure TENcontract2.setLoanAmount(loanAmount1: Double);
begin
  self.loanAmount2 := loanAmount1;
end;

procedure TENcontract2.setNumOfDay(numOfDay1: Integer);
begin
  self.numOfDay2 := numOfDay1;
end;

procedure TENcontract2.setSpecialAction(specialAction1: Double);
begin
  self.specialAction2 := specialAction1;
end;

procedure TENcontract2.setSpecialCondition(specialCondition1: Boolean);
begin
  self.specialCondition2 := specialCondition1;
end;

procedure TENcontract2.setSumPercent(sumPercent1: Double);
begin
  self.sumPercent2 := sumPercent1;
end;

end.
