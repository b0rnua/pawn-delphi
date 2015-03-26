unit enArrears;

interface

type
  TENarrears = class(TOBject)
    private
      id2 : Integer;
      idContract2 : Integer;
      arrearsOption12 : Double;
      arrearsOption22 : Double;
      dateAdd2 : Tdate;
      function getId() : Integer;
      function getIdContract : Integer;
      function getArrearsOption1 : Double;
      function getArrearsOption2 : Double;
      function getDateAdd : Tdate;
      procedure setId(id1 : Integer);
      procedure setIdContract(id1 : Integer);
      procedure setArrearsOption1(id1 : Double);
      procedure setArrearsOption2(id1 : Double);
      procedure setDateAdd(id1 : Tdate);
    public
      property id : Integer read getId write setId;
      property idContract : Integer read getIdContract write setIdContract;
      property arrearsOption1 : Double read getArrearsOption1 write setArrearsOption1;
      property arrearsOption2 : Double read getArrearsOption2 write setArrearsOption2;
      property dateAdd : Tdate read getDateAdd write setDateAdd;

    //  procedure
      constructor create();
  end;

implementation

{ TENarears }

constructor TENarrears.create;
begin
  self.id := 0;
  self.idContract := 0;
  self.arrearsOption1 := 0;
  self.arrearsOption2 :=0;
end;

function TENarrears.getArrearsOption1: Double;
begin
  RESULT := self.arrearsOption12;
end;

function TENarrears.getArrearsOption2: Double;
begin
  RESULT := self.arrearsOption22;
end;

function TENarrears.getDateAdd: TDAte;
begin
  RESULT := self.dateAdd2;
end;

function TENarrears.getId: Integer;
begin
  RESULT := self.id2;
end;

function TENarrears.getIdContract: Integer;
begin
  RESULT := self.idContract2;
end;

procedure TENarrears.setArrearsOption1(id1: Double);
begin
  self.arrearsOption12 := id1;
end;

procedure TENarrears.setArrearsOption2(id1: Double);
begin
  self.arrearsOption22 := id1;
end;

procedure TENarrears.setDateAdd(id1: TDate);
begin
  SELF.dateAdd2 := id1;
end;

procedure TENarrears.setId(id1: Integer);
begin
  self.id2:= id1;
end;

procedure TENarrears.setIdContract(id1: Integer);
begin
  self.idContract2 := id1;
end;

end.
