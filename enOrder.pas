unit enOrder;

interface

uses
  SysUtils;

type
  TENOrder = class(Tobject)
    private
      id	:	Integer;
      operationId	 :	Integer;
      bill	:	String;
      summ	:	Double;
      fromW	 :	String ;
      ground	 :	String ;
      summInWord	:	String ;
      summCent	:	Integer;
      chiefAccountant	 :	String  ;
      casheir	 :	String;
      numberW	:	Integer;
      filialNumber	:	Integer;
      chief	 :	String ;
      operationDate	 :	TDate;
      document	:	String ;
      recipient	:	String ;
      additional	:	String ;

    public
      procedure setId(id1 : Integer);
      procedure setOperationId(id1 : Integer);
      procedure setBill(id1	:	String);
      procedure setSumm(id1	:	Double);
      procedure setFromW(id1	:	String);
      procedure setGround(id1	:	String);
      procedure setSummInWord(id1	:	String);
      procedure setSummCent(id1 : Integer);
      procedure setChiefAccountant(id1 :	String);
      procedure setCasheir(id1 : String);
      procedure setNumberW(id1 : Integer);
      procedure setFilialNumber(id1 : Integer);
      procedure setChief(id1 : String);
      procedure setOperationDate(id1 : TDate);
      procedure setDocument(id1	:	String);
      procedure setRecipient(id1 : String);
      procedure setAdditional(id1	:	String);

      function getId() : Integer;
      function getOperationId() : Integer;
      function getBill() : String;
      function getSumm() : Double;
      function getFromW() : String;
      function getGround() : String;
      function getSummInWord() : String;
      function getSummCent() : Integer;
      function getChiefAccountant() : String;
      function getCasheir() : String;
      function getNumberW() : Integer;
      function getFilialNumber() : Integer;
      function getChief() : String;
      function getOperationDate() : TDate;
      function getDocument() : String;
      function getRecipient() : String;
      function getAdditional() : String;

      function toString() : String;

      constructor create();

  end;



implementation

{ TENOrder }

constructor TENOrder.create;
begin
  self.id :=0;
  self.operationId := 0;
  self.bill := '';
  self.summ := 0;
  self.fromW := '';
  self.ground := '';
  self.summInWord := '';
  self.summCent := 0;
  self.chiefAccountant := '';
  self.casheir := '';
  self.numberW := 0;
  self.filialNumber := 0;
  self.chief := '';
  self.operationDate := 1/1/2014;
  self.document := '';
  self.recipient := '';
  self.additional := '';

end;

function TENOrder.getAdditional: String;
begin
  RESULT := self.additional;
end;

function TENOrder.getBill: String;
begin
  RESULT := self.bill
end;

function TENOrder.getCasheir: String;
begin
  RESULT := self.casheir;
end;

function TENOrder.getChief: String;
begin
  RESULT := self.chief;
end;

function TENOrder.getChiefAccountant: String;
begin
  RESULT := self.chiefAccountant;
end;

function TENOrder.getDocument: String;
begin
  RESULT := self.document;
end;

function TENOrder.getFilialNumber: Integer;
begin
  RESULT := self.filialNumber;
end;

function TENOrder.getFromW: String;
begin
  RESULT := self.fromW;
end;

function TENOrder.getGround: String;
begin
  RESULT := self.ground;
end;

function TENOrder.getId: Integer;
begin
  RESULT := self.id;
end;

function TENOrder.getNumberW: Integer;
begin
  RESULT := self.numberW;
end;

function TENOrder.getOperationDate: TDate;
begin
  RESULT := self.operationDate;
end;

function TENOrder.getOperationId: Integer;
begin
  RESULT := self.operationId;
end;

function TENOrder.getRecipient: String;
begin
  RESULT := self.recipient;
end;

function TENOrder.getSumm: Double;
begin
  RESULT := self.summ;
end;

function TENOrder.getSummCent: Integer;
begin
  RESULT := self.summCent;
end;

function TENOrder.getSummInWord: String;
begin
  RESULT := self.summInWord;
end;

procedure TENOrder.setAdditional(id1: String);
begin
  self.additional := id1;
end;

procedure TENOrder.setBill(id1: String);
begin
  self.bill := id1;
end;

procedure TENOrder.setCasheir(id1: String);
begin
  self.casheir := id1;
end;

procedure TENOrder.setChief(id1: String);
begin
  self.chief := id1;
end;

procedure TENOrder.setChiefAccountant(id1: String);
begin
  self.chiefAccountant := id1;
end;

procedure TENOrder.setDocument(id1: String);
begin
  self.document := id1;
end;

procedure TENOrder.setFilialNumber(id1: Integer);
begin
  self.filialNumber := id1;
end;

procedure TENOrder.setFromW(id1: String);
begin
  self.fromW := id1;
end;

procedure TENOrder.setGround(id1: String);
begin
  self.ground := id1;
end;

procedure TENOrder.setId(id1: Integer);
begin
  self.id := id1;
end;

procedure TENOrder.setNumberW(id1: Integer);
begin
  self.numberW := id1;
end;

procedure TENOrder.setOperationDate(id1 : TDate);
begin
  self.operationDate := id1;
end;

procedure TENOrder.setOperationId(id1: Integer);
begin
  self.operationId := id1;
end;

procedure TENOrder.setRecipient(id1: String);
begin
  self.recipient := id1;
end;

procedure TENOrder.setSumm(id1: Double);
begin
  self.summ := id1;
end;

procedure TENOrder.setSummCent(id1: Integer);
begin
  self.summCent := id1;
end;

procedure TENOrder.setSummInWord(id1: String);
begin
  self.summInWord := id1;
end;

function TENOrder.toString: String;
var
  res : String;
begin
  res := 'id: '+IntToStr(self.id) + ' OperationId: '+IntToStr(self.operationId)+' Bill: '+self.bill+' Summ: '+FloatToStr(self.summ)+' FromW: '+self.fromW+' Ground: '+self.ground+' SummInWord'+self.summInWord+' SummCent: '+IntToStr(self.summCent)+' ';
  res := res + ' ChiefAccountant: '+self.chiefAccountant+' Cashier: '+self.casheir+' NumberW: '+IntToStr(self.numberW);
  res := res + ' FilialNumber: '+IntToStr(self.filialNumber)+' Chief: '+self.chief+' OperationDate: '+DateToStr(self.operationDate);
  res := res + ' Document: '+self.document+' Recipient: '+self.recipient+' Additional: '+self.additional;

  RESULT := res;
end;

end.
