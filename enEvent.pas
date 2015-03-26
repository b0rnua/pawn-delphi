unit enEvent;

interface

type
  TENEvent = class(TObject)
    private
      id2 : Integer;
      eventDate2 : TDate;
      eventText2 : String;
      comment2 : String;
      eventTypeId2  : Integer;
      employeeId2 : Integer;
      timeStampField2 : String;
      idContract2 : Integer;
      idLoyalty2 : Integer;

      procedure setId(id1 : Integer);
      procedure setEventDate(id1 : TDate);
      procedure setEventText(id1 : String);
      procedure setComment(id1 : String);
      procedure setEventTypeId(id1 : Integer);
      procedure setEmployeeId(id1 : Integer);
      procedure setTimeStampField(id1 : String);
      procedure setIdContract(id1 : Integer);
      procedure setIdLoyalty(id1 : Integer);

      function getId() : Integer;
      function getEventDate() : TDate;
      function getEventText() : String;
      function getComment() : String;
      function getEventTypeId() : Integer;
      function getEmployeeId() : Integer;
      function getTimeStampField() : String;
      function getIdLoyalty() : Integer;
      function getIdContract() : Integer;

    public

      property id : Integer read getId write setId;
      property eventDate : TDate read getEventDate write setEventDate;
      property eventText : String read getEventText write setEventText;
      property comment : String read getComment write setComment;
      property eventTypeId : Integer read getEventTypeId write setEventTypeId;
      property employeeId : Integer read getEmployeeId write setEmployeeId;
      property timeStampField : String read getTimeStampField write setTimeStampField;
      property idContract : Integer read getIdContract write setIdContract;
      property idLoyalty : Integer read getIdLoyalty write setIdLoyalty;


  end;

implementation

{ TENEvent }

function TENEvent.getComment: String;
begin
  RESULT := self.comment2;
end;

function TENEvent.getEmployeeId: Integer;
begin
  RESULT := self.employeeId2;
end;

function TENEvent.getEventDate: TDate;
begin
  RESULT := self.eventDate2;
end;

function TENEvent.getEventText: String;
begin
  RESULT := self.eventText2;
end;

function TENEvent.getEventTypeId: Integer;
begin
  RESULT := self.eventTypeId2;
end;

function TENEvent.getId: Integer;
begin
  RESULT := self.id2;
end;

function TENEvent.getIdContract: Integer;
begin
  RESULT := self.idContract2;
end;

function TENEvent.getIdLoyalty: Integer;
begin
  RESULT := self.idLoyalty2;
end;

function TENEvent.getTimeStampField: String;
begin
  RESULT := self.timeStampField2;
end;

procedure TENEvent.setComment(id1 : String);
begin
  self.comment2 := id1;
end;

procedure TENEvent.setEmployeeId(id1 : Integer);
begin
  self.employeeId2 := id1;
end;

procedure TENEvent.setEventDate(id1 : TDate);
begin
  self.eventDate2 := id1;
end;

procedure TENEvent.setEventText(id1 : String);
begin
  self.eventText2 := id1;
end;

procedure TENEvent.setEventTypeId(id1 : Integer);
begin
  self.eventTypeId2 := id1;
end;

procedure TENEvent.setId(id1 : Integer);
begin
  self.id2 := id1;
end;

procedure TENEvent.setIdContract(id1 : Integer);
begin
  self.idContract2 := id1;
end;

procedure TENEvent.setIdLoyalty(id1 : Integer);
begin
  self.idLoyalty2 := id1;
end;

procedure TENEvent.setTimeStampField(id1 : String);
begin
  self.timeStampField2 := id1;
end;

end.
