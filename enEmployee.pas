unit enEmployee;

interface

uses SysUtils;

type
  TENemployee = class(TOBject)
    private
       id : Integer;
       name : String;
       warrantNum: String;
       warrantDate : TDAte;
       hideEmployee : boolean;
       pass : String;
       instruction : Boolean;
    public
      procedure setId(id1 : Integer );
      procedure setName(id1 : String );
      procedure setWarrantNum(id1 : String);
      procedure setWarrantDate(id1 : TDAte );
      procedure setHideEmployee(id1 : boolean);
      procedure setPass(id1 :String );
      procedure setInstruction(id1 : boolean);

      function getId() : Integer ;
      function getName() : String ;
      function getWarrantyNum() : String ;
      function getWarrantyDate() : TDAte;
      function getHideEmployee() : boolean ;
      function getPass() : String ;
      function getInstruction() : boolean ;

      constructor create();
  end;


implementation

{ TENemployee }

constructor TENemployee.create;
begin
  self.id := 0;
  self.name := 'create()';
  self.warrantNum := '0';
  self.warrantDate := now();
  self.hideEmployee := true;
  self.pass := '';
  self.instruction := true;
end;

function TENemployee.getHideEmployee: boolean;
begin
  RESULT := self.hideEmployee;
end;

function TENemployee.getId: Integer;
begin
  RESULT := self.id;
end;

function TENemployee.getInstruction: boolean;
begin
  RESULT := self.instruction;
end;

function TENemployee.getName: String;
begin
  RESULT := self.name;
end;

function TENemployee.getPass: String;
begin
  RESULT := self.pass;
end;

function TENemployee.getWarrantyDate: TDAte;
begin
  RESULT := self.warrantDate;
end;

function TENemployee.getWarrantyNum: String;
begin
  RESULT := self.warrantNum;
end;

procedure TENemployee.setHideEmployee(id1: boolean);
begin
  self.hideEmployee := id1;
end;

procedure TENemployee.setId(id1: Integer);
begin
  self.id := id1;
end;

procedure TENemployee.setInstruction(id1: boolean);
begin
  self.instruction := id1;
end;

procedure TENemployee.setName(id1: String);
begin
  self.name := id1;
end;

procedure TENemployee.setPass(id1: String);
begin
  self.pass := id1;
end;

procedure TENemployee.setWarrantDate(id1: TDAte);
begin
  self.warrantDate := id1;
end;

procedure TENemployee.setWarrantNum(id1: String);
begin
   self.warrantNum := id1;
end;

end.
