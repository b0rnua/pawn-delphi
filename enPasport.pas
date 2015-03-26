unit enPasport;

interface

type
  TENpasport = class(TOBject)
    private
      id2 : Integer;
      numFilial2 : String;
      dYear2 : String;
      openDay2 : TDate;
      startContractNumber2 : String;
      endContractNumber2 : String;
      freeContractNumber2 : String;
      freeAdditionalNumber2 : String;
      idCurrentEmployee2 : Integer;
      nameFilial2 : String;
      city2 : String;
      orderNumberOut2 : Integer;
      bPage2 : Integer;
      chief2  : String;
      chiefData2 : String;
      lastCashBookDate2 : TDate;
      orderNumberIn2 : Integer;
      phone2  : String;
      lastDate2 : TDate;

      procedure setId(id1 : Integer);
      procedure setNumFilial(id1 : String);
      procedure setDYear(id1 : String);
      procedure setOpenDay(id1 : TDate);
      procedure setStartContractNumber(id1 : String);
      procedure setEndContractNumber(id1 : String);
      procedure setFreeContractNumber(id1 : String);
      procedure setFreeAdditionalNumber(id1 : String);
      procedure setIdCurrentEmployee(id1 : Integer);
      procedure setNameFilial(id1 : String);
      procedure setCity(id1 : String);
      procedure setOrderNumberOut(id1 : Integer);
      procedure setBPage(id1 : Integer);
      procedure setChief(id1 : String);
      procedure setChiefData(id1 : String);
      procedure setLastCashBookDate(id1 : TDate);
      procedure setOrderNumberIn(id1 : Integer);
      procedure setPhone(id1 : String);
      procedure setLastDate(id1 : TDate);

      function getId() : Integer;
      function getNumFilial() : String;
      function getDYear() : String;
      function getOpenDay() : TDate;
      function getStartContractNumber() : String;
      function getEndContractNumber() : String;
      function getFreeContractNumber() : String;
      function getFreeAdditionalNumber() : String;
      function getIdCurrentEmployee() : Integer;
      function getNameFilial() : String;
      function getCity() : String;
      function getOrderNumberOut() : Integer;
      function getBPage() : Integer;
      function getChief() : String;
      function getChiefData() : String;
      function getLastCashBookDate() : TDate;
      function getOrderNumberIn() : Integer;
      function getPhone() : String;
      function getLastDate() : TDate;

    public

      property id : Integer read getId write setId;
      property numFilial : String read getNumFilial write setNumFilial;
      property dYear : String read getDYear write setDYear;
      property openDay : TDate read getOpenDay write setOpenDay;
      property startContractNumber: String read getStartContractNumber write setStartContractNumber;
      property endContractNumber: String read getEndContractNumber write setEndContractNumber;
      property freeContractNumber: String read getFreeContractNumber write setFreeContractNumber;
      property freeAdditionalNumber: String read getFreeAdditionalNumber write setFreeAdditionalNumber;
      property idCurrentEmployee : Integer read getIdCurrentEmployee write setIdCurrentEmployee;
      property nameFilial : String read getNameFilial write setNameFilial;
      property city : String read getCity write setCity;
      property orderNumberOut : Integer read getOrderNumberOut write setOrderNumberOut;
      property bPage : Integer read getBPage write setBPage;
      property chief : String read getChief write setChief;
      property chiefData : String read getChiefData write setChiefData;
      property lastCashBookDate : TDate read getLastCashBookDate write setLastCashBookDate;
      property orderNumberIn : Integer read getOrderNumberIn write setOrderNumberIn;
      property phone : String read getPhone write setPhone;
      property lastDate : TDate read getLastDate write setLastDate;

end;

implementation

{ TENpasport }

function TENpasport.getBPage: Integer;
begin
  RESULT := self.bPage2;
end;

function TENpasport.getChief: String;
begin
  RESULT := self.chief2;
end;

function TENpasport.getChiefData: String;
begin
  RESULT := self.chiefData2;
end;

function TENpasport.getCity: String;
begin
  RESULT := self.city2;
end;

function TENpasport.getDYear: String;
begin
  RESULT := self.dYear2;
end;

function TENpasport.getEndContractNumber: String;
begin
  RESULT := self.endContractNumber2;
end;

function TENpasport.getFreeAdditionalNumber: String;
begin
  RESULT := self.freeAdditionalNumber2;
end;

function TENpasport.getFreeContractNumber: String;
begin
  RESULT := self.freeContractNumber2;
end;

function TENpasport.getId: Integer;
begin
  RESULT := self.id2;
end;

function TENpasport.getIdCurrentEmployee: Integer;
begin
  RESULT := self.idCurrentEmployee2;
end;

function TENpasport.getLastCashBookDate: TDate;
begin
  RESULT := self.lastCashBookDate2;
end;

function TENpasport.getLastDate: TDate;
begin
  RESULT := self.lastDate2;
end;

function TENpasport.getNameFilial: String;
begin
  RESULT := self.nameFilial2;
end;

function TENpasport.getNumFilial: String;
begin
  RESULT := self.numFilial2;
end;

function TENpasport.getOpenDay: TDate;
begin
  RESULT := self.openDay2;
end;

function TENpasport.getOrderNumberOut: Integer;
begin
  RESULT := self.orderNumberOut2;
end;

function TENpasport.getOrderNumberIn: Integer;
begin
  RESULT := self.orderNumberin2;
end;

function TENpasport.getPhone: String;
begin
  RESULT := self.phone2;
end;

function TENpasport.getStartContractNumber: String;
begin
 RESULT := self.startContractNumber2;
end;

procedure TENpasport.setBPage(id1: Integer);
begin
 self.bPage2 := id1;
end;

procedure TENpasport.setChief(id1: String);
begin
 self.chief2 := id1;
end;

procedure TENpasport.setChiefData(id1: String);
begin
  self.chiefData2 := id1;
end;

procedure TENpasport.setCity(id1: String);
begin
  self.city2 := id1;
end;

procedure TENpasport.setDYear(id1: String);
begin
  self.dYear2 := id1;
end;

procedure TENpasport.setEndContractNumber(id1: String);
begin
  self.endContractNumber2 := id1;
end;

procedure TENpasport.setFreeAdditionalNumber(id1: String);
begin
  self.freeAdditionalNumber2 := id1;
end;

procedure TENpasport.setFreeContractNumber(id1: String);
begin
  self.freeContractNumber2 := id1;
end;

procedure TENpasport.setId(id1: Integer);
begin
  self.id2 := id1;
end;

procedure TENpasport.setIdCurrentEmployee(id1: Integer);
begin
  self.idCurrentEmployee2 := id1;
end;

procedure TENpasport.setLastCashBookDate(id1: TDate);
begin
  self.lastCashBookDate2 := id1;
end;

procedure TENpasport.setLastDate(id1: TDate);
begin
  self.lastDate2 := id1;
end;

procedure TENpasport.setNameFilial(id1: String);
begin
  self.nameFilial2 := id1;
end;

procedure TENpasport.setNumFilial(id1: String);
begin
  self.numFilial2 := id1;
end;

procedure TENpasport.setOpenDay(id1: TDate);
begin
  self.openDay2 := id1;
end;

procedure TENpasport.setOrderNumberOut(id1: Integer);
begin
  self.orderNumberOut2 := id1;
end;

procedure TENpasport.setOrderNumberIn(id1: Integer);
begin
  self.orderNumberIn2:= id1;
end;

procedure TENpasport.setPhone(id1: String);
begin
  self.phone2 := id1;
end;

procedure TENpasport.setStartContractNumber(id1: String);
begin
  self.startContractNumber2 := id1;
end;

end.
