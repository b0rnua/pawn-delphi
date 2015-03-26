unit DelivererEntity;

interface

type
  TDelivererClass = class(TObject)
    public
      id: Longint;
      name: string;
      passport: string;
      passportNumber: string;
      issuingPassport: string;
      dateOfIssue: TDateTime;
  end;

implementation

end.
