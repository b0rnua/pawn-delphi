unit LoyalStore;

interface

uses
  Loyals,Dialogs, SysUtils, enLoyalty;

type
  TLoyalsType = (ReduceReduce2 = 10 , ReduceFixed2 = 11, FixedReduce2 = 12, FixedFixed2 = 13, FreeDays2 = 15);
type
  TLoyalDescription = class(TObject)
    private
      key: TLoyalsType;
      content: ILoyal;
    public
      procedure setKey(key: TLoyalsType);
      procedure setContent(lola: ILoyal);
      function getKey(): TLoyalsType;
      function getContent(): ILoyal;
  end;

type
  TLoyalList = array of TLoyalDescription;

type
  TLoyalStore = class(TObject)
    private
      loyals: TLoyalList;
    public
      procedure initialize(size: Integer);
      function put(lola: ILoyal; key: TLoyalsType): Integer;
      function get(key: TLoyalsType): ILoyal;
   //   procedure sort(ArrLoyalty : TARRLoyalty);

   //   constructor CREATE();
  end;

var
  store : TLoyalStore;

function getInstance(): TLoyalStore;

implementation

function getInstance(): TLoyalStore;
begin
  if (store = nil) then store := TLoyalStore.Create;
  result := store;
end;

procedure TLoyalStore.initialize(size: Integer);
begin
  SetLength(self.loyals, size);
end;

function TLoyalStore.put(lola: ILoyal; key: TLoyalsType): Integer;
var
i: Integer;
res: Integer;
loyalDescription: TLoyalDescription;
begin
  res := -1;
  loyalDescription := TLoyalDescription.Create;
  loyalDescription.setContent(lola);
  loyalDescription.setKey(key);

  for i := 0 to Length(self.loyals)-1 do begin

    if (self.loyals[i] = nil) then begin
      self.loyals[i] := loyalDescription;

      if (i = Length(self.loyals)-1) then res := 0
      else res := 1;
      break;
    end;
  end;

  result := res;
end;

function TLoyalStore.get(key: TLoyalsType): ILoyal;
var
i: Integer;
discount: ILoyal;
begin
  discount := nil;

  for i := 0 to Length(self.loyals)-1 do begin
    if (self.loyals[i].getKey = key) then discount := self.loyals[i].getContent;
  end;

  result := discount;
end;

procedure TLoyalDescription.setKey(key: TLoyalsType);
begin
  self.key := key;
end;

procedure TLoyalDescription.setContent(lola: ILoyal);
begin
  self.content := lola;
end;

function TLoyalDescription.getKey(): TLoyalsType;
begin
  result := self.key;
end;

function TLoyalDescription.getContent(): ILoyal;
begin
  result := self.content;
end;

end.
