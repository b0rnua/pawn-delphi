unit FullSum;

interface

uses SysUtils;

{
‘ункци€ перевода суммы, записанной цифрами в сумму прописью :
например, 23.12 -> двадцать три рубл€ 12 копеек.
переводит до 999999999 руб. 99 коп.
‘ункци€ не отслеживает, правильное ли значение получено в параметре Number
(т.е. положительное и округленное с точностью до сотых) - эту проверку
необходимо провести до вызова функции.
}

//----------------- Copyright (c) 1999 by  онстантин ≈горов
//----------------- mailto: egor@vladi.elektra.ru

function SumNumToFull(Number: real): string;
function SumNumToFullUA(Number: real): string;

implementation

function SumNumToFull(Number:real):string;
var
  PartNum, TruncNum, NumTMP, D: integer;
  NumStr : string;
  i, R : byte;
  Flag11 : boolean;
begin
  D:=1000000;
  R:=4;
  //выдел€ем рубли
  TruncNum:=Trunc(Number);
  if TruncNum<>0 then
    repeat
      PartNum:=TruncNum div D;
      Dec(R);
      D:=D div 1000;
    until
      PartNum<>0
  else
    R:=0;

  // перевод рублей
  for i:=R downto 1 do
  begin
    Flag11:=False;
    // выделение цифры сотен
    NumTMP:=PartNum div 100;
    case NumTMP of
      1: NumStr:=NumStr+'сто ';
      2: NumStr:=NumStr+'двести ';
      3: NumStr:=NumStr+'триста ';
      4: NumStr:=NumStr+'четыреста ';
      5: NumStr:=NumStr+'п€тьсот ';
      6: NumStr:=NumStr+'шестьсот ';
      7: NumStr:=NumStr+'семьсот ';
      8: NumStr:=NumStr+'восемьсот ';
      9: NumStr:=NumStr+'дев€тьсот ';
    end;
    // выделение цифры дес€тков
    NumTMP:=(PartNum mod 100) div 10;
    case NumTMP of
      1:
      begin
        NumTMP:=PartNum mod 100;
        case NumTMP of
          10: NumStr:=NumStr+'дес€ть ';
          11: NumStr:=NumStr+'одиннадцать ';
          12: NumStr:=NumStr+'двенадцать ';
          13: NumStr:=NumStr+'тринадцать ';
          14: NumStr:=NumStr+'четырнадцать ';
          15: NumStr:=NumStr+'п€тнадцать ';
          16: NumStr:=NumStr+'шестнадцать ';
          17: NumStr:=NumStr+'семнадцать ';
          18: NumStr:=NumStr+'восемнадцать ';
          19: NumStr:=NumStr+'дев€тнадцать ';
        end;
        case i of
          3: NumStr:=NumStr+'миллионов ';
          2: NumStr:=NumStr+'тыс€ч ';
          1: NumStr:=NumStr+' ';
        end;
        Flag11:=True;
      end;
      2: NumStr:=NumStr+'двадцать ';
      3: NumStr:=NumStr+'тридцать ';
      4: NumStr:=NumStr+'сорок ';
      5: NumStr:=NumStr+'п€тьдес€т ';
      6: NumStr:=NumStr+'шестьдес€т ';
      7: NumStr:=NumStr+'семьдес€т ';
      8: NumStr:=NumStr+'восемьдес€т ';
      9: NumStr:=NumStr+'дев€носто ';
    end;
    // выделение цифры единиц
    NumTMP:=PartNum mod 10;
    if not Flag11 then
    begin
      case NumTMP of
        1:
          if i=2 then
            NumStr:=NumStr+'одна '
          else
            NumStr:=NumStr+'одна ';
        2:
          if i=2 then
            NumStr:=NumStr+'две '
          else
            NumStr:=NumStr+'две ';
        3: NumStr:=NumStr+'три ';
        4: NumStr:=NumStr+'четыре ';
        5: NumStr:=NumStr+'п€ть ';
        6: NumStr:=NumStr+'шесть ';
        7: NumStr:=NumStr+'семь ';
        8: NumStr:=NumStr+'восемь ';
        9: NumStr:=NumStr+'дев€ть ';
      end;
      case i of
        3:
          case NumTMP of
            1: NumStr:=NumStr+'миллион ';
            2,3,4: NumStr:=NumStr+'миллиона ';
            else
              NumStr:=NumStr+'миллионов ';
          end;
        2:
          case NumTMP of
            1 : NumStr:=NumStr+'тыс€ча ';
            2,3,4: NumStr:=NumStr+'тыс€чи ';
            else
              if PartNum<>0 then
                NumStr:=NumStr+'тыс€ч ';
          end;
        1:
          case NumTMP of
            1 : NumStr:=NumStr+'';
            2,3,4: NumStr:=NumStr+'';
            else
              NumStr:=NumStr+'';
          end;
      end;
    end;
    if i>1 then
    begin
      PartNum:=(TruncNum mod (D*1000)) div D;
      D:=D div 1000;
    end;
  end;

  SumNumToFull:=NumStr;
end;
function SumNumToFullUA(Number:real):string;
var
  PartNum, TruncNum, NumTMP, D: integer;
  NumStr : string;
  i, R : byte;
  Flag11 : boolean;
begin
  D:=1000000;
  R:=4;
  //выдел€ем рубли
  TruncNum:=Trunc(Number);
  if TruncNum<>0 then
    repeat
      PartNum:=TruncNum div D;
      Dec(R);
      D:=D div 1000;
    until
      PartNum<>0
  else
    R:=0;

  // перевод рублей
  for i:=R downto 1 do
  begin
    Flag11:=False;
    // выделение цифры сотен
    NumTMP:=PartNum div 100;
    case NumTMP of
      1: NumStr:=NumStr+'сто ';
      2: NumStr:=NumStr+'двiстi ';
      3: NumStr:=NumStr+'триста ';
      4: NumStr:=NumStr+'чотириста ';
      5: NumStr:=NumStr+'п`€тсот ';
      6: NumStr:=NumStr+'шiстсот ';
      7: NumStr:=NumStr+'сiмсот ';
      8: NumStr:=NumStr+'вiciмсот ';
      9: NumStr:=NumStr+'дев`€тсот ';
    end;
    // выделение цифры дес€тков
    NumTMP:=(PartNum mod 100) div 10;
    case NumTMP of
      1:
      begin
        NumTMP:=PartNum mod 100;
        case NumTMP of
          10: NumStr:=NumStr+'дес€ть ';
          11: NumStr:=NumStr+'одинадцать ';
          12: NumStr:=NumStr+'двaнадцать ';
          13: NumStr:=NumStr+'тринадцать ';
          14: NumStr:=NumStr+'чoтирнадцать ';
          15: NumStr:=NumStr+'п`€тнадцать ';
          16: NumStr:=NumStr+'шiстнадцать ';
          17: NumStr:=NumStr+'сiмнадцать ';
          18: NumStr:=NumStr+'вiсiмнадцать ';
          19: NumStr:=NumStr+'дев`€тнадцать ';
        end;
        case i of
          3: NumStr:=NumStr+'мiльйонiв ';
          2: NumStr:=NumStr+'тис€ч ';
          1: NumStr:=NumStr+' ';
        end;
        Flag11:=True;
      end;
      2: NumStr:=NumStr+'двадцать ';
      3: NumStr:=NumStr+'тридцать ';
      4: NumStr:=NumStr+'сорок ';
      5: NumStr:=NumStr+'п`€тдес€т ';
      6: NumStr:=NumStr+'шiстдес€т ';
      7: NumStr:=NumStr+'сiмдес€т ';
      8: NumStr:=NumStr+'вiсiмьдес€т ';
      9: NumStr:=NumStr+'дев`€носто ';
    end;
    // выделение цифры единиц
    NumTMP:=PartNum mod 10;
    if not Flag11 then
    begin
      case NumTMP of
        1:
          if i=2 then
            NumStr:=NumStr+'одна '
          else
            NumStr:=NumStr+'одна ';
        2:
          if i=2 then
            NumStr:=NumStr+'двi '
          else
            NumStr:=NumStr+'двi ';
        3: NumStr:=NumStr+'три ';
        4: NumStr:=NumStr+'чотири ';
        5: NumStr:=NumStr+'п`€ть ';
        6: NumStr:=NumStr+'шiсть ';
        7: NumStr:=NumStr+'сiмь ';
        8: NumStr:=NumStr+'вiсiмь ';
        9: NumStr:=NumStr+'дев`€ть ';
      end;
      case i of
        3:
          case NumTMP of
            1: NumStr:=NumStr+'мiльйон ';
            2,3,4: NumStr:=NumStr+'мiльйона ';
            else
              NumStr:=NumStr+'мiльйонiв ';
          end;
        2:
          case NumTMP of
            1 : NumStr:=NumStr+'тис€ча ';
            2,3,4: NumStr:=NumStr+'тис€чi ';
            else
              if PartNum<>0 then
                NumStr:=NumStr+'тис€ч ';
          end;
        1:
          case NumTMP of
            1 : NumStr:=NumStr+'';
            2,3,4: NumStr:=NumStr+'';
            else
              NumStr:=NumStr+'';
          end;
      end;
    end;
    if i>1 then
    begin
      PartNum:=(TruncNum mod (D*1000)) div D;
      D:=D div 1000;
    end;
  end;

  SumNumToFullUA:=NumStr;
end;


end.