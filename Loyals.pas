unit Loyals;

interface

uses
    enDeliverer, enLoyalty, XMLIntf, XMLDoc, Variants, SysUtils, Dialogs;

type
  ILoyal = interface
      function getPercent(percent : Double; loyalPercent : Double) : Double; OVERLOAD;
      function getPercent(percent : Double; loyalPercent : Double; days : Integer) : Double; OVERLOAD;
      function getPrice(price : Double; loyalPrice : Double) : Double;
  end;

type
  ReduceReduce = class(TInterfacedObject, ILoyal)
  private
      key: Integer;
      name: String;
  public
      function getPercent(percent : Double; loyalPercent : Double) : Double; OVERLOAD;
      function getPercent(percent : Double; loyalPercent : Double; days : Integer) : Double; OVERLOAD;
      function getPrice( price : Double; loyalPrice : Double) : Double;
  end;

type
  ReduceFixed = class(TInterfacedObject, ILoyal)
  private
      key: Integer;
      name: String;
  public
      function getPercent( percent : Double; loyalPercent : Double) : Double OVERLOAD;
      function getPrice( price : Double; loyalPrice : Double) : Double;
      function getPercent(percent : Double; loyalPercent : Double; days : Integer) : Double OVERLOAD;
  end;

type
  FixedReduce = class(TInterfacedObject, ILoyal)
  private
      key: Integer;
      name: String;
  public
      function getPercent(percent : Double; loyalPercent : Double) : Double OVERLOAD;
      function getPrice(price : Double; loyalPrice : Double) : Double;
      function getPercent(percent : Double; loyalPercent : Double; days : Integer) : Double OVERLOAD;
  end;

type
  FixedFixed = class(TInterfacedObject, ILoyal)
  private
      key: Integer;
      name: String;
  public
      function getPercent(percent : Double; loyalPercent : Double) : Double OVERLOAD;
      function getPrice(price : Double; loyalPrice : Double) : Double;
      function getPercent(percent : Double; loyalPercent : Double; days : Integer) : Double OVERLOAD;
  end;
type
  FreeDays = class(TInterfacedObject, ILoyal)
  private
      key : Integer;
      name : String;
  public
      function getPercent(percent : Double; loyalPercent : Double) : Double OVERLOAD;
      function getPrice(price : Double; loyalPrice : Double) : Double;
      function getPercent(percent : Double; loyalPercent : Double; Days : Integer) : Double OVERLOAD;
  end;


function reducePercent(percent : Double; loyalPercent : Double) : Double;
function reducePrice(price : Double; LoyalPrice : Double) : Double;
function fixedPercent(percent : Double; loyalPercent : Double) : Double;
function fixedPrice(price : Double; loyalPrice : Double) : Double;
function getNameByIdLoyalty(idLoyalty : Integer) : String;

implementation

function reducePercent(percent : Double; loyalPercent : Double) : Double;
begin
  RESULT := (percent - loyalPercent);
end;

function reducePrice(price : Double; LoyalPrice : Double) : Double;
begin
  RESULT := (price + LoyalPrice);
end;

function fixedPercent(percent : Double; loyalPercent : Double) : Double;
begin

  RESULT := loyalPercent;
end;

function fixedPrice(price : Double; loyalPrice : Double) : Double;
begin
  RESULT := loyalPrice;
end;

function getNameByIdLoyalty(idLoyalty : Integer) : String;
var
  name : String;
begin
  case idLoyalty of
    10 : name := 'ReduceReduce';
    11 : name := 'ReduceFixed';
    12 : name := 'FixedReduce';
    13 : name := 'FixedFixed';
    15 : name := 'FreeDays';
  end;
  RESULT := name;
end;


function ReduceReduce.getPercent(percent: Double; loyalPercent : Double): Double;
begin
  RESULT := reducePercent(percent,loyalPercent);
end;

function ReduceReduce.getPercent(percent, loyalPercent: Double;
  days: Integer): Double;
begin
//
  RESULT := reducePercent(percent,loyalPercent);
end;

function ReduceReduce.getPrice(price: Double; loyalPrice : Double): Double;
begin
  RESULT := reducePrice(price,loyalPrice);
end;

function ReduceFixed.getPercent(percent: Double; loyalPercent : Double): Double;
begin
  RESULT := reducePercent(percent,loyalPercent);
end;

function ReduceFixed.getPercent(percent, loyalPercent: Double;
  days: Integer): Double;
begin
//
RESULT := reducePercent(percent,loyalPercent);
end;

function ReduceFixed.getPrice(price: Double; loyalPrice : Double): Double;
begin
 RESULT :=  fixedPrice(price,loyalPrice);
end;

function FixedReduce.getPercent(percent: Double; loyalPercent : Double): Double;
begin
  RESULT := fixedPercent(percent,loyalPercent);
end;

function FixedReduce.getPercent(percent, loyalPercent: Double;
  days: Integer): Double;
begin
//
RESULT := fixedPercent(percent,loyalPercent);
end;

function FixedReduce.getPrice(price: Double; loyalPrice : Double): Double;
begin
RESULT :=  reducePrice(price,loyalPrice);
end;

function FixedFixed.getPercent(percent: Double; loyalPercent : Double): Double;
begin
RESULT := fixedPercent(percent,loyalPercent);
end;

function FixedFixed.getPercent(percent, loyalPercent: Double;
  days: Integer): Double;
begin
//
RESULT := fixedPercent(percent,loyalPercent);
end;

function FixedFixed.getPrice(price: Double; loyalPrice : Double): Double;
begin
RESULT :=  fixedPrice(price,loyalPrice);
end;

{ ReduceDays }

function FreeDays.getPercent(percent, loyalPercent: Double): Double;
var
  res : Double;
begin
  res := loyalPercent;
  RESULT := res;
end;

function FreeDays.getPercent(percent, loyalPercent: Double;
  Days: Integer): Double;
var
  res : Double;
  freepercent,lastDayPercent : Double;
  checkka : String;
begin
{ // НА СЛУЧАЙ ВСЯКИЙ
  if (days > 10) then begin
    res := (((10*loyalPercent) + ((days-10)*percent)) / days);
    ShowMessage('Договор ' +IntToStr(days)  + 'дня(дней) в залоге, процент в день : (10дней по :'+ FloatToStr(loyalPercent)+ ' и '+IntTOStr(days-10)+'дня(дней) по ' + FloatTOStr(percent)+')');
  end else begin
    res := loyalPercent;
    ShowMessage('Договор ' +IntToStr(days)  + 'дня(дней) в залоге, процент в день :' + FloatToStr(res));
  end;
  res := round((res*100))/100;
  }

  loyalPercent := 0.3;
  res := loyalPercent;
  RESULT := res;
end;

function FreeDays.getPrice(price, loyalPrice: Double): Double;
begin
//
end;

end.
