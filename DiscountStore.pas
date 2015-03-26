unit DiscountStore;

interface

uses
 Discounts;

type
  TDiscountType = (BASIC = 7, SILVER = 8, GOLD = 9);

type
  TDiscountDescription = class(TObject)
    private
      key: TDiscountType;
      content: IDiscount;
    public
      procedure setKey(key: TDiscountType);
      procedure setContent(discount: IDiscount);
      function getKey(): TDiscountType;
      function getContent(): IDiscount;
  end;

type
  TDiscountList = array of TDiscountDescription;

type
  TDiscountStore = class(TObject)
    private
    discounts: TDiscountList;
    public
    procedure initialize(size: Integer);
    function put(discount: IDiscount; key: TDiscountType): Integer;
    function get(key: TDiscountType): IDiscount;
  end;

var
  store: TDiscountStore;

function getInstance(): TDiscountStore;

implementation

function getInstance(): TDiscountStore;
begin
  if (store = nil) then store := TDiscountStore.Create;
  result := store;
end;

procedure TDiscountStore.initialize(size: Integer);
begin
  SetLength(self.discounts, size);
end;

function TDiscountStore.put(discount: IDiscount; key: TDiscountType): Integer;
var
i: Integer;
res: Integer;
disountDescription: TDiscountDescription;
begin
  res := -1;
  disountDescription := TDiscountDescription.Create;
  disountDescription.setContent(discount);
  disountDescription.setKey(key);

  for i := 0 to Length(self.discounts)-1 do begin

    if (self.discounts[i] = nil) then begin
      self.discounts[i] := disountDescription;

      if (i = Length(self.discounts)-1) then res := 0
      else res := 1;

    end;
  end;

  result := res;
end;

function TDiscountStore.get(key: TDiscountType): IDiscount;
var
i: Integer;
discount: IDiscount;
begin
  discount := nil;

  for i := 0 to Length(self.discounts)-1 do begin
    if (self.discounts[i].getKey = key) then discount := self.discounts[i].getContent;
  end;

  result := discount;
end;

procedure TDiscountDescription.setKey(key: TDiscountType);
begin
  self.key := key;
end;

procedure TDiscountDescription.setContent(discount: IDiscount);
begin
  self.content := discount;
end;

function TDiscountDescription.getKey(): TDiscountType;
begin
  result := self.key;
end;

function TDiscountDescription.getContent(): IDiscount;
begin
  result := self.content;
end;

end.
