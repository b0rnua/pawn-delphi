unit enDeliverer;

interface

type
  TENdeliverer = class(TObject)
    private

      id : Integer;
      name : String;
      date_of_burn : TDateTime;
      adress : String;
      pasport_ser : String;
      pasport_num : String;
      pasport_vydan : String;
      pasport_date : TDateTime;
      inn  : String;
      id_tarif : Integer;
      id_group_of_risk : Integer;
      telephon : String;
      CardNumber : String;
      CardType : String;
      DateAdd : TDateTime;

    public
      sumOp1 : Double;
      sumOp2 : Double;
      sumOp5 : Double;
      sumPercent : Double;
      sumDelay : Double;
      constructor Create();

      procedure setId(id1 : Integer);
      procedure setName(name1 : String);
      procedure setDate_of_burn(Date_of_burn1 : TDateTime);
      procedure setAdress(Adress1 : String);
      procedure setPasport_ser(pasport_ser1 : String);
      procedure setPasport_num(pasport_num1 : String);
      procedure setPasport_vydan(pasport_vydan1 : String);
      procedure setPasport_date(pasport_date1 : TDateTime);
      procedure setInn(inn1 : String);
      procedure setId_tarif(id_tarif1 : Integer);
      procedure setId_group_of_risk(id_group_of_risk1 : Integer);
      procedure setTelephon(telephon1 : String);
      procedure setCardNumber(cardNumber1 : String);
      procedure setCardType(cardType1 : String);
      procedure setDateAdd(dateAdd1 : TDateTime);

      function getId() : Integer;
      function getName() : String;
      function getDate_of_burn() : TDateTime;
      function getAdress() : String;
      function getPasport_ser() : String;
      function getPasport_num() : String;
      function getPasport_vydan() : String;
      function getPasport_date() : TDateTime;
      function getInn() : String;
      function getId_tarif() : Integer;
      function getid_group_of_risk() : Integer;
      function getTelephon() : String;
      function getCardNumber() : String;
      function getCardType() : String;
      function getDateAdd() : TDateTime;



  end;

implementation


constructor TENdeliverer.Create;
begin
  self.id := 0;
  self.name := 'CREATE';
  self.date_of_burn := 01/01/2000;
  self.adress := '=';
  self.pasport_ser := '=';
  self.pasport_num := '=';
  self.pasport_vydan := '=';
  self.pasport_date := 01/01/2000;
  self.inn := '=';
  self.id_tarif := 0;
  self.id_group_of_risk := 0;
  self.telephon := '=';
  self.CardNumber := '=';
  self.CardType := '=';
  self.DateAdd := 01/01/2000;
end;

function TENdeliverer.getAdress: String;
begin
  RESULT := self.adress;
end;

function TENdeliverer.getCardNumber: String;
begin
  RESULT := self.CardNumber;
end;

function TENdeliverer.getCardType: String;
begin
  RESULT := self.CardType;
end;

function TENdeliverer.getDateAdd: TDateTime;
begin
  RESULT := self.DateAdd;
end;

function TENdeliverer.getDate_of_burn: TDateTime;
begin
  RESULT := self.date_of_burn;
end;

function TENdeliverer.getId: Integer;
begin
  RESULT := self.id;
end;

function TENdeliverer.getid_group_of_risk: Integer;
begin
  RESULT := self.id_group_of_risk;
end;

function TENdeliverer.getId_tarif: Integer;
begin
  RESULT := self.id_tarif;
end;

function TENdeliverer.getInn: String;
begin
  RESULT := self.inn;
end;

function TENdeliverer.getName: String;
begin
  RESULT := self.name;
end;

function TENdeliverer.getPasport_date: TDateTime;
begin
  RESULT := self.pasport_date;
end;

function TENdeliverer.getPasport_num: String;
begin
  RESULT := self.pasport_num;
end;

function TENdeliverer.getPasport_ser: String;
begin
  RESULT := self.pasport_ser;
end;

function TENdeliverer.getPasport_vydan: String;
begin
  RESULT := self.pasport_vydan;
end;

function TENdeliverer.getTelephon: String;
begin
  RESULT := self.telephon;
end;

procedure TENdeliverer.setAdress(Adress1: String);
begin
  self.adress := adress1;
end;

procedure TENdeliverer.setCardNumber(cardNumber1: String);
begin
  self.CardNumber := CardNumber1;
end;

procedure TENdeliverer.setCardType(cardType1: String);
begin
  self.cardType := cardType1;
end;

procedure TENdeliverer.setDateAdd(dateAdd1: TDateTime);
begin
  self.dateAdd := dateAdd1;
end;

procedure TENdeliverer.setDate_of_burn(Date_of_burn1: TDateTime);
begin
  self.Date_of_burn := Date_of_burn1;
end;

procedure TENdeliverer.setId(id1: Integer);
begin
  self.id := id1;
end;

procedure TENdeliverer.setId_group_of_risk(id_group_of_risk1: Integer);
begin
  self.id_group_of_risk := id_group_of_risk1;
end;

procedure TENdeliverer.setId_tarif(id_tarif1: Integer);
begin
  self.id_tarif := id_tarif1;
end;

procedure TENdeliverer.setInn(inn1: String);
begin
  self.inn := inn1;
end;

procedure TENdeliverer.setName(name1: String);
begin
  self.name := name1;
end;

procedure TENdeliverer.setPasport_date(pasport_date1: TDateTime);
begin
  self.pasport_date := pasport_date1;
end;

procedure TENdeliverer.setPasport_num(pasport_num1: String);
begin
  self.pasport_num := pasport_num1;
end;

procedure TENdeliverer.setPasport_ser(pasport_ser1: String);
begin
  self.pasport_ser := pasport_ser1;
end;

procedure TENdeliverer.setPasport_vydan(pasport_vydan1: String);
begin
  self.pasport_vydan := pasport_vydan1;
end;

procedure TENdeliverer.setTelephon(telephon1: String);
begin
  self.telephon := telephon1;
end;

end.
