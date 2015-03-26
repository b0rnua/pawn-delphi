unit enLoyalty;

interface

uses
  SysUtils,Dialogs;

Type
  TENloyalty = Class(TObject)
    private
      Fid : Integer;
      FidDeliverer : Integer;
      FidLoyalty : Integer;
      FidContract : Integer;
      Foption1 : Double;
      Foption2 : Double;
      FeditDate : TDate;
      Fstatus : Boolean;

      procedure setId(id1 : Integer);
      procedure setIdDeliverer(id1 : Integer);
      procedure setIdLoyalty(id1 : Integer);
      procedure setIdContract(id1 : Integer);
      procedure setOption1(id1 : Double);
      procedure setOption2(id1 : Double);
      procedure setEditDate(id1 : TDate);
      procedure setStatus(id1 : Boolean);
      function getId : Integer;
      function getIdDeliverer : Integer;
      function getIdLoyalty : Integer;
      function getIdContract : Integer;
      function getOption1 : Double;
      function getOption2 : Double;
      function getEditDate : TDate;
      function getStatus : Boolean;
    public

      procedure showLoyalty(lol : TENLoyalty);

      property id : Integer read getId write setId;
      property idDeliverer: Integer read getIdDeliverer write setIdDeliverer;
      property idLoyalty : Integer read getIdLoyalty write setIdLoyalty;
      property idContract : Integer read getIdContract write setIdContract;
      property option1 : Double read getOption1 write setOption1;
      property option2 : Double read getOption2 write setOption2;
      property editDate : TDate read geteditDate write seteditDate;
      property status : Boolean read getstatus write setstatus;

      constructor CREATE();
  End;

  TARRLoyalty = Array of TENLoyalty;

  TOWNLoyalty = (LDELIVERER = 1, LCONTRACT = 2, LLOYALTY = 3, LPOWN = 4);

implementation

{ TENloyalty }

constructor TENloyalty.CREATE;
begin
  self.Foption1 := 0;
  self.Foption2 := 0;
  self.FidLoyalty := 0;
  self.FidDeliverer := 0;
  self.FidContract := 0;
  self.FeditDate := now();
  self.Fstatus := FALSE;
end;

function TENloyalty.getEditDate: TDate;
begin
  RESULT := self.FeditDate;
end;

function TENloyalty.getId: Integer;
begin
  RESULT := self.Fid;
end;

function TENloyalty.getIdContract: Integer;
begin
  RESULT := self.FidContract;
end;

function TENloyalty.getIdDeliverer: Integer;
begin
  RESULT := self.FidDeliverer;
end;

function TENloyalty.getIdLoyalty: Integer;
begin
  RESULT := self.FidLoyalty;
end;

function TENloyalty.getOption1: Double;
begin
  RESULT := self.Foption1
end;

function TENloyalty.getOption2: Double;
begin
  RESULT := self.Foption2;
end;

function TENloyalty.getStatus: Boolean;
begin
  RESULT := self.Fstatus;
end;

procedure TENloyalty.setEditDate(id1: TDate);
begin
  self.FeditDate := id1;
end;

procedure TENloyalty.setId(id1: Integer);
begin
  self.Fid := id1;
end;

procedure TENloyalty.setIdContract(id1: Integer);
begin
  self.FidContract := id1;
end;

procedure TENloyalty.setIdDeliverer(id1: Integer);
begin
  self.FidDeliverer := id1;
end;

procedure TENloyalty.setIdLoyalty(id1: Integer);
begin
  self.FidLoyalty := id1;
end;

procedure TENloyalty.setOption1(id1: Double);
begin
  self.Foption1 := id1;
end;

procedure TENloyalty.setOption2(id1: Double);
begin
  self.Foption2 := id1;
end;

procedure TENloyalty.setStatus(id1: Boolean);
begin
  self.Fstatus := id1;
end;

procedure TENloyalty.showLoyalty(lol: TENLoyalty);
begin
  ShowMessage('% ' + IntTOStr(lol.id) +' ' + IntTOStr(lol.idDeliverer)+' '  + IntTOStr(lol.idLoyalty)+' ' + IntTOStr(lol.idContract)+' ' + FloatToStr(lol.option1)+' '  + FloatToStr(lol.option2)+' ' + DateToStr(lol.editDate));
end;

end.
