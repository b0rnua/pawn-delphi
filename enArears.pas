unit enArrears;

interface

type
  TENarears = class(TOBject)
    private
      id : Integer;
      idContract : Integer;
      arearsPercent : Double;
      arearsDelay : Double;
    public
      function getId() : Integer;
      function getIdContract : Integer;
      function getArearsPercent : Double;
      function getArearsDelay : Double;
      procedure setId(id1 : Integer);
      procedure setIdContract(id1 : Integer);
      procedure setArearsPercent(id1 : Double);
      procedure setArearsDelay(id1 : Double);
      constructor create();
  end;

implementation

{ TENarears }

constructor TENarears.create;
begin
  self.id := 0;
  self.idContract := 0;
  self.arearsPercent := 0;
  self.arearsDelay :=0;
end;

function TENarears.getArearsDelay: Double;
begin
  RESULT := self.arearsDelay;
end;

function TENarears.getArearsPercent: Double;
begin
  RESULT := self.arearsPercent;
end;

function TENarears.getId: Integer;
begin
  RESULT := self.id;
end;

function TENarears.getIdContract: Integer;
begin
  RESULT := self.idContract;
end;

procedure TENarears.setArearsDelay(id1: Double);
begin
  self.arearsDelay := id1;
end;

procedure TENarears.setArearsPercent(id1: Double);
begin
  self.arearsPercent := id1;
end;

procedure TENarears.setId(id1: Integer);
begin
  self.id:= id1;
end;

procedure TENarears.setIdContract(id1: Integer);
begin
  self.idContract := id1;
end;

end.
