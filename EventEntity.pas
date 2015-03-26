unit EventEntity;

interface

uses
  EventTypeEntity, EmployeeEntity, Classes;

Type
  TEventEntity = class(TObject)
    public
      id: Longint;
      eventDate: TDateTime;
      eventText: string;
      comment: string;
      eventTypeId: Longint;
      eventType: TEventTypeEntity;
      employeeId: Longint;
      employee: TEmployee;
      timeStampField : TDateTime;
  end;

implementation

end.
