unit FullSum;

interface

uses SysUtils;

{
������� �������� �����, ���������� ������� � ����� �������� :
��������, 23.12 -> �������� ��� ����� 12 ������.
��������� �� 999999999 ���. 99 ���.
������� �� �����������, ���������� �� �������� �������� � ��������� Number
(�.�. ������������� � ����������� � ��������� �� �����) - ��� ��������
���������� �������� �� ������ �������.
}

//----------------- Copyright (c) 1999 by ���������� ������
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
  //�������� �����
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

  // ������� ������
  for i:=R downto 1 do
  begin
    Flag11:=False;
    // ��������� ����� �����
    NumTMP:=PartNum div 100;
    case NumTMP of
      1: NumStr:=NumStr+'��� ';
      2: NumStr:=NumStr+'������ ';
      3: NumStr:=NumStr+'������ ';
      4: NumStr:=NumStr+'��������� ';
      5: NumStr:=NumStr+'������� ';
      6: NumStr:=NumStr+'�������� ';
      7: NumStr:=NumStr+'������� ';
      8: NumStr:=NumStr+'��������� ';
      9: NumStr:=NumStr+'��������� ';
    end;
    // ��������� ����� ��������
    NumTMP:=(PartNum mod 100) div 10;
    case NumTMP of
      1:
      begin
        NumTMP:=PartNum mod 100;
        case NumTMP of
          10: NumStr:=NumStr+'������ ';
          11: NumStr:=NumStr+'����������� ';
          12: NumStr:=NumStr+'���������� ';
          13: NumStr:=NumStr+'���������� ';
          14: NumStr:=NumStr+'������������ ';
          15: NumStr:=NumStr+'���������� ';
          16: NumStr:=NumStr+'����������� ';
          17: NumStr:=NumStr+'���������� ';
          18: NumStr:=NumStr+'������������ ';
          19: NumStr:=NumStr+'������������ ';
        end;
        case i of
          3: NumStr:=NumStr+'��������� ';
          2: NumStr:=NumStr+'����� ';
          1: NumStr:=NumStr+' ';
        end;
        Flag11:=True;
      end;
      2: NumStr:=NumStr+'�������� ';
      3: NumStr:=NumStr+'�������� ';
      4: NumStr:=NumStr+'����� ';
      5: NumStr:=NumStr+'��������� ';
      6: NumStr:=NumStr+'���������� ';
      7: NumStr:=NumStr+'��������� ';
      8: NumStr:=NumStr+'����������� ';
      9: NumStr:=NumStr+'��������� ';
    end;
    // ��������� ����� ������
    NumTMP:=PartNum mod 10;
    if not Flag11 then
    begin
      case NumTMP of
        1:
          if i=2 then
            NumStr:=NumStr+'���� '
          else
            NumStr:=NumStr+'���� ';
        2:
          if i=2 then
            NumStr:=NumStr+'��� '
          else
            NumStr:=NumStr+'��� ';
        3: NumStr:=NumStr+'��� ';
        4: NumStr:=NumStr+'������ ';
        5: NumStr:=NumStr+'���� ';
        6: NumStr:=NumStr+'����� ';
        7: NumStr:=NumStr+'���� ';
        8: NumStr:=NumStr+'������ ';
        9: NumStr:=NumStr+'������ ';
      end;
      case i of
        3:
          case NumTMP of
            1: NumStr:=NumStr+'������� ';
            2,3,4: NumStr:=NumStr+'�������� ';
            else
              NumStr:=NumStr+'��������� ';
          end;
        2:
          case NumTMP of
            1 : NumStr:=NumStr+'������ ';
            2,3,4: NumStr:=NumStr+'������ ';
            else
              if PartNum<>0 then
                NumStr:=NumStr+'����� ';
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
  //�������� �����
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

  // ������� ������
  for i:=R downto 1 do
  begin
    Flag11:=False;
    // ��������� ����� �����
    NumTMP:=PartNum div 100;
    case NumTMP of
      1: NumStr:=NumStr+'��� ';
      2: NumStr:=NumStr+'��i��i ';
      3: NumStr:=NumStr+'������ ';
      4: NumStr:=NumStr+'��������� ';
      5: NumStr:=NumStr+'�`����� ';
      6: NumStr:=NumStr+'�i����� ';
      7: NumStr:=NumStr+'�i���� ';
      8: NumStr:=NumStr+'�ici���� ';
      9: NumStr:=NumStr+'���`����� ';
    end;
    // ��������� ����� ��������
    NumTMP:=(PartNum mod 100) div 10;
    case NumTMP of
      1:
      begin
        NumTMP:=PartNum mod 100;
        case NumTMP of
          10: NumStr:=NumStr+'������ ';
          11: NumStr:=NumStr+'���������� ';
          12: NumStr:=NumStr+'��a������� ';
          13: NumStr:=NumStr+'���������� ';
          14: NumStr:=NumStr+'�o���������� ';
          15: NumStr:=NumStr+'�`��������� ';
          16: NumStr:=NumStr+'�i��������� ';
          17: NumStr:=NumStr+'�i�������� ';
          18: NumStr:=NumStr+'�i�i�������� ';
          19: NumStr:=NumStr+'���`��������� ';
        end;
        case i of
          3: NumStr:=NumStr+'�i�����i� ';
          2: NumStr:=NumStr+'����� ';
          1: NumStr:=NumStr+' ';
        end;
        Flag11:=True;
      end;
      2: NumStr:=NumStr+'�������� ';
      3: NumStr:=NumStr+'�������� ';
      4: NumStr:=NumStr+'����� ';
      5: NumStr:=NumStr+'�`������� ';
      6: NumStr:=NumStr+'�i������� ';
      7: NumStr:=NumStr+'�i������ ';
      8: NumStr:=NumStr+'�i�i������� ';
      9: NumStr:=NumStr+'���`������ ';
    end;
    // ��������� ����� ������
    NumTMP:=PartNum mod 10;
    if not Flag11 then
    begin
      case NumTMP of
        1:
          if i=2 then
            NumStr:=NumStr+'���� '
          else
            NumStr:=NumStr+'���� ';
        2:
          if i=2 then
            NumStr:=NumStr+'��i '
          else
            NumStr:=NumStr+'��i ';
        3: NumStr:=NumStr+'��� ';
        4: NumStr:=NumStr+'������ ';
        5: NumStr:=NumStr+'�`��� ';
        6: NumStr:=NumStr+'�i��� ';
        7: NumStr:=NumStr+'�i�� ';
        8: NumStr:=NumStr+'�i�i�� ';
        9: NumStr:=NumStr+'���`��� ';
      end;
      case i of
        3:
          case NumTMP of
            1: NumStr:=NumStr+'�i����� ';
            2,3,4: NumStr:=NumStr+'�i������ ';
            else
              NumStr:=NumStr+'�i�����i� ';
          end;
        2:
          case NumTMP of
            1 : NumStr:=NumStr+'������ ';
            2,3,4: NumStr:=NumStr+'�����i ';
            else
              if PartNum<>0 then
                NumStr:=NumStr+'����� ';
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