unit MyUtils;

interface

uses
  XMLDoc, ADODB, Variants, xmldom, XMLIntf, Classes, Dialogs, SysUtils,
  Product, IniFiles, ComObj, FullSum, danAdo, enDeliverer, Discounts, DiscountStore,
  enLoyalty, Loyals, LoyalStore, DateUtils, graphics, windows;

type
  TProductList = array of TProductEntity;
  TRegion = (ALLDONETSK = 10, DONETSK =11, MAKEEVKA = 12, MARIUPOL = 13, ENAKIEVO = 14, LUGANSK = 20, ALLKHARKOV = 30, KHARKOV = 31, MIRGOROD = 32, ALLODESSA = 40, ODESSA = 41, NIKOLAEV = 42, VOZNESENSK = 43);

  procedure getAndUpdateChiefData(filial: string);
  procedure updateSale(filial: string);
  function getPercentPerDay(id : Integer; sum: Double; days: Integer): Double; overload
  function getPercentPerDay(id : Integer; sum: Double; days: Integer;  idDeliverer : Integer): Double; overload
  function getPercentPerDay(id : Integer; sum: Double; days: Integer;  idDeliverer : Integer; idContract : integer ): Double; overload
  function getConditionName(id : Integer): String;
  function getLototronSell(idContract : Integer) : Double;
  procedure printRepawnContract(idContract : Integer);
  procedure printNewContract(idContract : Integer);
  function SimpleReplace(Tag: string; New: string; MsWord: Variant): boolean;
  function getNulliki(codeFilial: Integer) : String;
  function getDiscountTarif(idTarif : Integer; ContractType : Integer; LoyalGroup : Integer) : Integer;
  function getLoyalTarif(idTarif : Integer; ContractType : Integer) : Integer;
  function getOldReducePercent(idTarif : Integer) : Double;
  function getTestPriceByNameFilial(codeFilial1 : String) : String;
  function getTarifStringByCodeFilial(codeFilial1 : Integer) : String;
  function getRegionByNameFilial(nameFilial1 : String) : String;
  function checkTHISfilial(id1 : Integer) : Boolean; OVERLOAD
  function checkTHISfilial(): Boolean; OVERLOAD
  function checkLastDate(date1 : TDAte) : TDate; OVERLOAD
  function checkLastDate(date1 : string) : string; OVERLOAD
  function getLastDate() : TDate;
  function getRegionByCodeFilial(id1 : Integer; detailed : Boolean) : TRegion;
  function checkOdessa(id1 : Integer) : Boolean;
  function getTestPercentString(idDeliverer1 : Integer) : String;

 // procedure mySnapShot(myFileName : String);
  //function LoyalRepawnContract() : Integer;
implementation
  uses
    main;
function getRegionByCodeFilial(id1 : Integer; detailed : Boolean) : TRegion;
begin
 ///
//
end;

function checkOdessa(id1 : Integer) : Boolean;
var
  res : Boolean;
begin
  res := FALSE;
  case id1 of
    17,21,22,23,24,25,26,31,32,33,34,50,51 : res := TRUE;
  else  res := FALSE;
  end;
  RESULT := res;
end;

procedure getAndUpdateChiefData(filial: string);
var
  xml: IXMLDocument;
  q1: TADOQuery;
  chiefName: string;
  chiefData: string;
  sqlString: string;
begin
  filial := 'f'+filial;
  xml := TXMLDocument.Create(nil);
  xml.LoadFromFile('c:\pawn\conf\ChiefData.xml');
  xml.Active := true;
  chiefName :=
    xml.DocumentElement.ChildNodes[filial].ChildNodes['chiefname'].Text;
  chiefData :=
    xml.DocumentElement.ChildNodes[filial].ChildNodes['chiefdata'].Text;
  xml.Active := false;
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := danAdo.utils.getConnectionString;
  sqlString := 'UPDATE pasport SET Chief="'+chiefName+
    '", ChiefData="'+chiefData+'"';
  q1.SQL.Add(sqlString);
  q1.ExecSQL;
  q1.Destroy;
end;
//by Dan
function getConditionName(id: Integer): String;
var
  res: string;
begin
  if id = 0 then res := '(НЕТ)';

  case id of
  1 :  res := 'MAX';
  2 :  res := 'MIN';
  3 :  res := 'TOP';
  4 :  res := 'MP MIN';
  5 :  res := 'MP LOM';
  6 :  res := 'MP ';
  7 :  res := 'MAX II ';
  8 :  res := 'ХАЛЯВА ';
  9 :  res := 'MP MIN OD ';
  11 :  res := 'MP LOM OD ';
  13 :  res := 'MP OD ';
  10 :  res := 'max1500 1';
  12 :  res := 'max1500 2';
  14 :  res := 'max1500 3';
  16 :  res := 'max1500 4';
  18 :  res := 'top NEW 1';
  20 :  res := 'top NEW 2';
  22 :  res := 'top NEW 3';
  24 :  res := 'top NEW 4';
  26 :  res := 'KREDIT-20 1';
  28 :  res := 'KREDIT-20 2';
  30 :  res := 'KREDIT-20 3';
  31 :  res := '+220 1';
  32 :  res := '+220 2';
  33 :  res := '+220 3';
  34 :  res := '+220 4';
  35 :  res := '+280 1';
  36 :  res := '+280 2';
  37 :  res := '+280 3';
  38 :  res := '+280 4';
  39 :  res := 'Открытие MAX 1';
  40 :  res := 'Открытие MAX 2';
  41 :  res := 'Открытие MAX 3';
  42 :  res := 'Открытие MAX 4';
  43 :  res := 'Открытие MIN 1';
  44 :  res := 'Открытие MIN 2';
  45 :  res := 'Открытие MIN 3';
  46 :  res := 'Открытие MIN 4';
  47 :  res := 'Открытие TOP 1';
  48 :  res := 'Открытие TOP 2';
  49 :  res := 'Открытие TOP 3';
  50 :  res := 'Открытие TOP 4';
  51 :  res := 'max Gold 1';
  52 :  res := 'max Gold 2';
  53 :  res := 'max Gold 3';
  54 :  res := 'max Gold 4';
  55 :  res := 'top Gold 1';
  56 :  res := 'top Gold 2';
  57 :  res := 'top Gold 3';
  58 :  res := 'top Gold 4';
  59 :  res := 'min Gold 1';
  60 :  res := 'min Gold 2';
  61 :  res := 'min Gold 3';
  62 :  res := 'min Gold 4';
  70 :  res := 'Харьков НЕТ';
  71 :  res := 'Миргород НЕТ';
  72 :  res := 'Донецк НЕТ';
  73 :  res := '12 ЛО НЕТ';
  74 :  res := '45ло НЕТ';
  75 :  res := 'Одесса НЕТ';
  76 :  res := 'Луганск НЕТ';
  77 :  res := 'Южноукраинск НЕТ';
  100 : res := '(НЕТ)';
  101 : res := 'ABC min SILVER 1';
  102 : res := 'ABC min SILVER 2';
  103 : res := 'ABC min SILVER 3';
  104 : res := 'ABC min SILVER 4';
  105 : res := 'ABC min GOLD 1';
  106 : res := 'ABC min GOLD 2';
  107 : res := 'ABC min GOLD 3';
  108 : res := 'ABC min GOLD 4';
  109 : res := 'ABC min Platinum 1';
  110 : res := 'ABC min Platinum 2';
  111 : res := 'ABC min Platinum 3';
  112 : res := 'ABC min Platinum 4';
  113 : res := 'ABC max SILVER 1';
  114 : res := 'ABC max SILVER 2';
  115 : res := 'ABC max SILVER 3';
  116 : res := 'ABC max SILVER 4';
  117 : res := 'ABC max GOLD 1';
  118 : res := 'ABC max GOLD 2';
  119 : res := 'ABC max GOLD 3';
  120 : res := 'ABC max GOLD 4';
  121 : res := 'ABC max Platinum 1';
  122 : res := 'ABC max Platinum 2';
  123 : res := 'ABC max Platinum 3';
  124 : res := 'ABC max Platinum 4';
  125 : res := 'ABC top SILVER 1';
  126 : res := 'ABC top SILVER 2';
  127 : res := 'ABC top SILVER 3';
  128 : res := 'ABC top SILVER 4';
  129 : res := 'ABC top GOLD 1';
  130 : res := 'ABC top GOLD 2';
  131 : res := 'ABC top GOLD 3';
  132 : res := 'ABC top GOLD 4';
  133 : res := 'ABC top Platinum 1';
  134 : res := 'ABC top Platinum 2';
  135 : res := 'ABC top Platinum 3';
  136 : res := 'ABC top Platinum 4';
  137 : res := 'ABC min Участник 1';
  138 : res := 'ABC min Участник 2';
  139 : res := 'ABC min Участник 3';
  140 : res := 'ABC min Участник 4';
  141 : res := 'ABC max Участник 1';
  142 : res := 'ABC max Участник 2';
  143 : res := 'ABC max Участник 3';
  144 : res := 'ABC max Участник 4';
  145 : res := 'ABC top Участник 1';
  146 : res := 'ABC top Участник 2';
  147 : res := 'ABC top Участник 3';
  148 : res := 'ABC top Участник 4';
  149 : res := 'ABC max Gold I 1';
  150 : res := 'ABC max Gold I 2';
  151 : res := 'ABC max Gold I 3';
  152 : res := 'ABC max Gold I 4';
  153 : res := 'ABC max Platinum I 1';
  154 : res := 'ABC max Platinum I 2';
  155 : res := 'ABC max Platinum I 3';
  156 : res := 'ABC max Platinum I 4';
  157 : res := 'ABC min Gold I 1';
  158 : res := 'ABC min Gold I 2';
  159 : res := 'ABC min Gold I 3';
  160 : res := 'ABC min Gold I 4';
  161 : res := 'ABC min Platinum I 1';
  162 : res := 'ABC min Platinum I 2';
  163 : res := 'ABC min Platinum I 3';
  164 : res := 'ABC min Platinum I 4';
  165 : res := 'ABC top Gold I 1';
  166 : res := 'ABC top Gold I 2';
  167 : res := 'ABC top Gold I 3';
  168 : res := 'ABC top Gold I 4';
  169 : res := 'ABC top Platinum I 1';
  170 : res := 'ABC top Platinum I 2';
  171 : res := 'ABC top Platinum I 3';
  172 : res := 'ABC top Platinum I 4';
  173 : res := 'ABC max Silver Plus 1';
  174 : res := 'ABC max Silver Plus 2';
  175 : res := 'ABC max Silver Plus 3';
  176 : res := 'ABC max Silver Plus 4';
  177 : res := 'ABC max Gold Plus 1';
  178 : res := 'ABC max Gold Plus 2';
  179 : res := 'ABC max Gold Plus 3';
  180 : res := 'ABC max Gold Plus 4';
  181 : res := 'ABC max Platinum Plus 1';
  182 : res := 'ABC max Platinum Plus 2';
  183 : res := 'ABC max Platinum Plus 3';
  184 : res := 'ABC max Platinum Plus 4';
  185 : res := 'ABC min Silver Plus 1';
  186 : res := 'ABC min Silver Plus 2';
  187 : res := 'ABC min Silver Plus 3';
  188 : res := 'ABC min Silver Plus 4';
  189 : res := 'ABC min Gold Plus 1';
  190 : res := 'ABC min Gold Plus 2';
  191 : res := 'ABC min Gold Plus 3';
  192 : res := 'ABC min Gold Plus 4';
  193 : res := 'ABC min Platinum Plus 1';
  194 : res := 'ABC min Platinum Plus 2';
  195 : res := 'ABC min Platinum Plus 3';
  196 : res := 'ABC min Platinum Plus 4';
  197 : res := 'ABC top Silver Plus 1';
  198 : res := 'ABC top Silver Plus 2';
  199 : res := 'ABC top Silver Plus 3';
  200 : res := 'ABC top Silver Plus 4';
  201 : res := 'ABC top Gold Plus 1';
  202 : res := 'ABC top Gold Plus 2';
  203 : res := 'ABC top Gold Plus 3';
  204 : res := 'ABC top Gold Plus 4';
  205 : res := 'ABC top Platinum Plus 1';
  206 : res := 'ABC top Platinum Plus 2';
  207 : res := 'ABC top Platinum Plus 3';
  208 : res := 'ABC top Platinum Plus 4';
  777 : res := 'СЕРЕБРО';
  end;
  Result := res;
end;

procedure updateSale(filial: string);
var
  xml: IXMLDocument;
  increasePercent: string;
  enaLargeCreditBody: string;
  IniFile: TIniFile;
begin
  filial := 'f'+filial;
  xml := TXMLDocument.Create(nil);
  xml.LoadFromFile('c:\pawn\conf\sale.xml');
  xml.Active := true;
  increasePercent :=
    xml.DocumentElement.ChildNodes[filial].ChildNodes['increasePercent'].Text;
  enaLargeCreditBody :=
    xml.DocumentElement.ChildNodes[filial].ChildNodes['enaLargeCreditBody'].Text;
  xml.Active := false;
  IniFile := TIniFile.Create('c:\pawn\sale.ini');
  IniFile.WriteString('Group6','IncreasePercent',increasePercent);
  IniFile.WriteString('Group6','EnaLargeCreditBody',enaLargeCreditBody);
  IniFile.UpdateFile;
  IniFile.Free;
end;


//by Dan
function getPercentPerDay(id: Integer; sum: Double; days: Integer): Double;
var
  count, z, j : Integer;
  numOfDay, sumStart, sumEnd, percentFromXml : string;
  res : Double;
  xml : IXMLDocument;
begin
xml := TXMLDocument.Create(nil);
xml.LoadFromFile('c:\pawn\conf\tarif.xml');
xml.Active := true;
count := xml.DocumentElement.ChildNodes['ROWDATA'].ChildNodes.Count;

z := 0;

if (id < 9) OR ((id < 101) AND (id > 62)) then begin
    while z < count do begin
        if(VarToStr(xml.DocumentElement.ChildNodes['ROWDATA'].ChildNodes[z].Attributes['id']) = IntToStr(id)) then begin
            j := 0;
            while j < xml.DocumentElement.ChildNodes['ROWDATA'].ChildNodes[z].ChildNodes['tarifPercent'].ChildNodes.Count do begin
                numOfDay :=
                  VarToStr(xml.DocumentElement.ChildNodes['ROWDATA'].ChildNodes[z].ChildNodes['tarifPercent'].ChildNodes[j].ChildNodes['numofday'].NodeValue);
                sumStart :=
                  VarToStr(xml.DocumentElement.ChildNodes['ROWDATA'].ChildNodes[z].ChildNodes['tarifPercent'].ChildNodes[j].ChildNodes['sum_begin'].NodeValue);
                sumEnd :=
                  VarToStr(xml.DocumentElement.ChildNodes['ROWDATA'].ChildNodes[z].ChildNodes['tarifPercent'].ChildNodes[j].ChildNodes['sum_end'].NodeValue);
                percentFromXML :=
                  VarToStr(xml.DocumentElement.ChildNodes['ROWDATA'].ChildNodes[z].ChildNodes['tarifPercent'].ChildNodes[j].ChildNodes['percent'].NodeValue);
                if (days = StrToInt(numOfDay)) then begin
                    if (sum > StrToInt(sumStart)) and (sum <= StrToInt(sumEnd)) then begin
                        res := StrToFloat(percentFromXML);
                    end;
                end;
                Inc(j);
            end;
        z := count;
        end else begin
            Inc(z);
        end;
    end;
end else begin
    while z < count do begin
        if(VarToStr(xml.DocumentElement.ChildNodes['ROWDATA'].ChildNodes[z].Attributes['id']) = IntToStr(id)) then begin
            j := 0;
            while j < xml.DocumentElement.ChildNodes['ROWDATA'].ChildNodes[z].ChildNodes['tarifPercent'].ChildNodes.Count do begin
                numOfDay :=
                  VarToStr(xml.DocumentElement.ChildNodes['ROWDATA'].ChildNodes[z].ChildNodes['tarifPercent'].ChildNodes[j].ChildNodes['numofday'].NodeValue);
                percentFromXML :=
                  VarToStr(xml.DocumentElement.ChildNodes['ROWDATA'].ChildNodes[z].ChildNodes['tarifPercent'].ChildNodes[j].ChildNodes['percent'].NodeValue);
                if (days = StrToInt(numOfDay)) then begin
                        res := StrToFloat(percentFromXML);
                end;
                Inc(j);
            end;
        z := count;
        end else begin
            Inc(z);
        end;
    end;
 end;
xml.Active := false;
Result := res;
end;

function getPercentPerDay(id: Integer; sum: Double; days: Integer; idDeliverer : Integer): Double;
var
  count, z, j : Integer;
  numOfDay, sumStart, sumEnd, percentFromXml : string;
  res : Double;
  xml : IXMLDocument;
  loyal : TENLoyalty;
  loyalS : ILoyal;
  myARRloyalty : TARRLoyalty;
  i1 : Integer;
begin
  xml := TXMLDocument.Create(nil);
  //main.sCodeFilial := '2323';


  xml.LoadFromFile(getTestPercentString(idDeliverer));
  xml.Active := true;
  count := xml.DocumentElement.ChildNodes['ROWDATA'].ChildNodes.Count;
  z := 0;
  //ShowMessage('ON THIS METH ' + IntTOStr(id));
  if (id < 9) OR ((id < 101) AND (id > 62)) then begin
    while z < count do begin
      if(VarToStr(xml.DocumentElement.ChildNodes['ROWDATA'].ChildNodes[z].Attributes['id']) = IntToStr(id)) then begin
        j := 0;
        while j < xml.DocumentElement.ChildNodes['ROWDATA'].ChildNodes[z].ChildNodes['tarifPercent'].ChildNodes.Count do begin
          numOfDay := VarToStr(xml.DocumentElement.ChildNodes['ROWDATA'].ChildNodes[z].ChildNodes['tarifPercent'].ChildNodes[j].ChildNodes['numofday'].NodeValue);
          sumStart := VarToStr(xml.DocumentElement.ChildNodes['ROWDATA'].ChildNodes[z].ChildNodes['tarifPercent'].ChildNodes[j].ChildNodes['sum_begin'].NodeValue);
          sumEnd := VarToStr(xml.DocumentElement.ChildNodes['ROWDATA'].ChildNodes[z].ChildNodes['tarifPercent'].ChildNodes[j].ChildNodes['sum_end'].NodeValue);
          percentFromXML := VarToStr(xml.DocumentElement.ChildNodes['ROWDATA'].ChildNodes[z].ChildNodes['tarifPercent'].ChildNodes[j].ChildNodes['percent'].NodeValue);
          if (days = StrToInt(numOfDay)) then begin
            if (sum > StrToInt(sumStart)) and (sum <= StrToInt(sumEnd)) then begin
              res := StrToFloat(percentFromXML);
            end;
          end;
          Inc(j);
        end;
        z := count;
      end else begin
        Inc(z);
      end;
    end;
  end else begin
    while z < count do begin
      if(VarToStr(xml.DocumentElement.ChildNodes['ROWDATA'].ChildNodes[z].Attributes['id']) = IntToStr(id)) then begin
        j := 0;
        while j < xml.DocumentElement.ChildNodes['ROWDATA'].ChildNodes[z].ChildNodes['tarifPercent'].ChildNodes.Count do begin
          numOfDay := VarToStr(xml.DocumentElement.ChildNodes['ROWDATA'].ChildNodes[z].ChildNodes['tarifPercent'].ChildNodes[j].ChildNodes['numofday'].NodeValue);
          percentFromXML := VarToStr(xml.DocumentElement.ChildNodes['ROWDATA'].ChildNodes[z].ChildNodes['tarifPercent'].ChildNodes[j].ChildNodes['percent'].NodeValue);
          if (days = StrToInt(numOfDay)) then begin
            res := StrToFloat(percentFromXML);
          end;
          Inc(j);
        end;
        z := count;
      end else begin
      Inc(z);
      end;
    end;
  end;
  xml.Active := false;

{  ВОт он Массив

myARRloyalty := DANADO.loyal.getArrayLoyalty(LCONTRACT,20832);
  ShowMessage('fillOk');
  for i1 :=0 to length(myARRloyalty)-1 do begin
    myARRloyalty[i1].showLoyalty(myARRloyalty[i1]);
  end;
}
  // need for
  loyal := danado.loyal.getLoyaltyByIdDeliverer(idDeliverer);

  loyalS := store.get(TLoyalsType(loyal.IdLoyalty));
  if (loyalS <> nil) then begin
    res := loyalS.getPercent(res,loyal.option1);
  end;

Result := res;
end;

//
function getPercentPerDay(id : Integer; sum: Double; days: Integer;  idDeliverer : Integer; idContract : integer ): Double; overload;
var
  count, z, j : Integer;
  numOfDay, sumStart, sumEnd, percentFromXml : string;
  res : Double;
  xml : IXMLDocument;
  loyal : TENLoyalty;
  loyalS : ILoyal;
  myARRloyalty : TARRLoyalty;
  i1 : Integer;
begin
  xml := TXMLDocument.Create(nil);
  //main.sCodeFilial := '2323';
  xml.LoadFromFile('c:\pawn\conf\tarif.xml');
  xml.Active := true;
  count := xml.DocumentElement.ChildNodes['ROWDATA'].ChildNodes.Count;
  z := 0;

  if (id < 9) OR ((id < 101) AND (id > 62)) then begin
    while z < count do begin
      if(VarToStr(xml.DocumentElement.ChildNodes['ROWDATA'].ChildNodes[z].Attributes['id']) = IntToStr(id)) then begin
        j := 0;
        while j < xml.DocumentElement.ChildNodes['ROWDATA'].ChildNodes[z].ChildNodes['tarifPercent'].ChildNodes.Count do begin
          numOfDay := VarToStr(xml.DocumentElement.ChildNodes['ROWDATA'].ChildNodes[z].ChildNodes['tarifPercent'].ChildNodes[j].ChildNodes['numofday'].NodeValue);
          sumStart := VarToStr(xml.DocumentElement.ChildNodes['ROWDATA'].ChildNodes[z].ChildNodes['tarifPercent'].ChildNodes[j].ChildNodes['sum_begin'].NodeValue);
          sumEnd := VarToStr(xml.DocumentElement.ChildNodes['ROWDATA'].ChildNodes[z].ChildNodes['tarifPercent'].ChildNodes[j].ChildNodes['sum_end'].NodeValue);
          percentFromXML := VarToStr(xml.DocumentElement.ChildNodes['ROWDATA'].ChildNodes[z].ChildNodes['tarifPercent'].ChildNodes[j].ChildNodes['percent'].NodeValue);
          if (days = StrToInt(numOfDay)) then begin
            if (sum > StrToInt(sumStart)) and (sum <= StrToInt(sumEnd)) then begin
              res := StrToFloat(percentFromXML);
            end;
          end;
          Inc(j);
        end;
        z := count;
      end else begin
        Inc(z);
      end;
    end;
  end else begin
    while z < count do begin
      if(VarToStr(xml.DocumentElement.ChildNodes['ROWDATA'].ChildNodes[z].Attributes['id']) = IntToStr(id)) then begin
        j := 0;
        while j < xml.DocumentElement.ChildNodes['ROWDATA'].ChildNodes[z].ChildNodes['tarifPercent'].ChildNodes.Count do begin
          numOfDay := VarToStr(xml.DocumentElement.ChildNodes['ROWDATA'].ChildNodes[z].ChildNodes['tarifPercent'].ChildNodes[j].ChildNodes['numofday'].NodeValue);
          percentFromXML :=  VarToStr(xml.DocumentElement.ChildNodes['ROWDATA'].ChildNodes[z].ChildNodes['tarifPercent'].ChildNodes[j].ChildNodes['percent'].NodeValue);
          if (days = StrToInt(numOfDay)) then begin
            res := StrToFloat(percentFromXML);
          end;
          Inc(j);
        end;
        z := count;
      end else begin
        Inc(z);
      end;
    end;
  end;

  //ShowMessage('getPercentPerDay1');

  xml.Active := false;







  myARRloyalty := DANADO.loyal.getArrayLoyalty(LDELIVERER,idDeliverer);
  for i1 :=0 to length(myARRloyalty)-1 do begin
    loyalS := store.get(TLoyalsType(myARRloyalty[i1].idLoyalty));
    if (loyalS <> nil) then begin
      res := loyalS.getPercent(res,myARRloyalty[i1].option1,days);
    end;
  end;
   loyalS := nil;

     myARRloyalty := DANADO.loyal.getArrayLoyalty(LCONTRACT,idContract);
  for i1 :=0 to length(myARRloyalty)-1 do begin
    loyalS := store.get(TLoyalsType(myARRloyalty[i1].idLoyalty));
    if (loyalS <> nil) then begin
      res := loyalS.getPercent(res,myARRloyalty[i1].option1,days);
    end;
  end;


  RESULT  := res;
end;
//by Dan
function getLototronSell(idContract : Integer) : Double;
var
  Q2 : TADOQuery;
  res : Double;
  sql2 : String;
begin
  Q2 := TADOQuery.Create(nil);
  Q2.ConnectionString := DANADO.utils.getConnectionString;
  sql2 := 'SELECT * FROM lototron WHERE idContract = :idContract';
  Q2.SQL.Add(sql2);
  Q2.Parameters.ParamByName('idContract').Value := idContract;
  Q2.Open;
  try
    res := Q2.FieldByName('Sell').AsFloat;
  Except on
    e : Exception do
    res := 0;
  end;

  RESULT := res;
end;
//by Dan

procedure printNewContract(idContract : Integer);


begin
   //
end;

procedure printRepawnContract(idContract : Integer);
var
  q1,q2 : TADOQuery;
  sql1,sql2 : String;
  City, date, fiosotryd, num, dtewar, fioklient, adressklient, paspseria, papsnomer,
  papsvidan, papsdate, inn, telephon, Creditdays, creditvozvrat,
  Total1, Total2 , pt , percente , credit , delay , backcredit, contractNumber, parentContract, Total1str  : STRING;
  dan : string;
  AQ, AW, AE, AR, AT, AY, AU, AI, AO : Array [0..11] of String;
  i : Integer;
  repawn : OLEVariant;
  underLine : String;
  idParent : Integer;
begin
  i := 0;
  q1 := TADOQuery.Create(nil);
  q2 := TADOQuery.Create(nil);
  q1.ConnectionString := DANADO.utils.getConnectionString;
  q2.ConnectionString := DANADO.utils.getConnectionString;
  sql1 := 'SELECT * FROM contract_info WHERE id =:idContract';
  q1.SQL.Add(sql1);
  q1.Parameters.ParamByName('idContract').Value := idContract;
  q1.Open;
    Creditdays := q1.FieldByName('num_of_day').AsString;
    creditvozvrat := q1.FieldByName('date_end').AsString;
    pt := q1.FieldByName('EstimatedPercent').AsString;
    total1 := q1.FieldByName('loan_amount').AsString;
    percente := q1.FieldByName('con_percent').AsString;
    total2 := q1.FieldByName('estimated_amount').AsString;
    credit := q1.FieldByName('sum_percent').AsString;
    delay := '1';
    backcredit := q1.FieldByName('Amount_ref').AsString;

    contractNumber := q1.FieldByName('contract_number').AsString;
    idParent := q1.FieldByName('idParentContract').AsInteger;

  //next table
  sql2 := 'SELECT * FROM employee WHERE id =:dan';
  q2.SQL.Add(sql2);
  dan := q1.FieldByName('id_employee').AsString;
  q2.Parameters.ParamByName('dan').Value := dan;
  q2.Open;
    fiosotryd := q2.FieldByName('name').AsString;
    num :=  q2.FieldByName('warrant_num').AsString;
    dtewar := q2.FieldByName('warrant_date').AsString;
  q2.Close;


  //next table
  q2.SQL.Clear;
  sql2 := 'SELECT * FROM deliverer WHERE id =:dan';
  q2.SQL.Add(sql2);
  dan := q1.FieldByName('id_deliverer').AsString;
  q2.Parameters.ParamByName('dan').Value := dan;
  q2.Open;
    fioklient := q2.FieldByName('name').AsString;
    adressklient  := q2.FieldByName('adress').AsString;
    paspseria := q2.FieldByName('pasport_ser').AsString;
    papsnomer := q2.FieldByName('pasport_num').AsString;
    papsvidan := q2.FieldByName('pasport_vydan').AsString;
    papsdate := q2.FieldByName('pasport_date').AsString;
    inn := q2.FieldByName('inn').AsString;
    telephon := q2.FieldByName('telephon').AsString;
  q2.Close;
  q2.SQL.Clear;
  //next table
  sql2 := 'SELECT * FROM product_info WHERE id_contract =:idContract';
  q2.SQL.Add(sql2);
  q2.Parameters.ParamByName('idContract').Value := idContract;
  q2.Open;
  with q2 do begin
    while not eof do begin
      AQ[i] := q2.FieldByName('product').AsString;
      AW[i] := q2.FieldByName('num').AsString;
      AE[i] := q2.FieldByName('metal').AsString;
      AR[i] := q2.FieldByName('test').AsString;
      AT[i] := q2.FieldByName('weight').AsString;
      AY[i] := q2.FieldByName('weight_piece').AsString;
      AU[i] := q2.FieldByName('weight_net').AsString;
      AI[i] := q2.FieldByName('price').AsString;
      AO[i] := q2.FieldByName('estimated_amount').AsString;
      inc(i);
      next;
    end;
  end;
  q2.Close;
   q2.SQL.Clear;
  //next table
  sql2 := 'SELECT * FROM pasport';
  q2.SQL.Add(sql2);
  q2.Open;
    city := q2.FieldByName('city').AsString;
    date := q2.FieldByName('OpenDay').AsString;
  q2.Close;
  q2.SQL.Clear;

  sql2 := 'SELECT contract_number FROM contract_info WHERE id =:idParent';
  q2.SQL.Add(sql2);
  q2.Parameters.ParamByName('idParent').Value := idParent;
  q2.Open;
  parentContract := q2.FieldByName('contract_number').AsString;
  q1.Close;
  q2.Destroy;
  q1.Destroy;
  repawn := CreateOleObject('Word.Application');
  repawn.Documents.Add('C://Pawn//report//repawnContract.doc');
  SimpleReplace('$contractNumber', contractNumber, repawn);
  SimpleReplace('$Creditdays', Creditdays , repawn);
  SimpleReplace('$creditvozvrat', creditvozvrat , repawn);
  SimpleReplace('$fiosotryd', fiosotryd , repawn);
  SimpleReplace('$num', num, repawn);
  SimpleReplace('$dtewar', dtewar, repawn);
  SimpleReplace('$fioklient', fioklient , repawn);
  SimpleReplace('$total2', total2   , repawn);
  SimpleReplace('$credit', credit   , repawn);
  SimpleReplace('$percente', percente, repawn);
  SimpleReplace('$backcredit', backcredit  , repawn);
  SimpleReplace('$date', date , repawn);
  for i :=1 to 12 do begin
    if i>=10 then begin underLine := '_' end
      else begin underLine := ''; end;
  SimpleReplace('$AQ'+underLine+intTostr(i), AQ[i-1], repawn);
  SimpleReplace('$AW'+underLine+intTostr(i), AW[i-1], repawn);
  SimpleReplace('$AE'+underLine+intTostr(i), AE[i-1], repawn);
  SimpleReplace('$AR'+underLine+intTostr(i), AR[i-1], repawn);
  SimpleReplace('$AT'+underLine+intTostr(i), AT[i-1], repawn);
  SimpleReplace('$AY'+underLine+intTostr(i), AY[i-1], repawn);
  SimpleReplace('$AU'+underLine+intTostr(i), AU[i-1], repawn);
  SimpleReplace('$AI'+underLine+intTostr(i), AI[i-1], repawn);
  SimpleReplace('$AO'+underLine+intTostr(i), AO[i-1], repawn);
  end;
  SimpleReplace('$TOTAL1', total1 , repawn);
  SimpleReplace('$parentContract', parentContract , repawn);
  SimpleReplace('$citys', city , repawn);
  SimpleReplace('$phone', telephon , repawn);
  Total1str := FullSum.SumNumToFullUA(strToFloat(total1));
  repawn.DisplayAlerts := False;
  repawn.Visible := True;
  repawn.Activate;
  end;

  function SimpleReplace(Tag: string; New: string; MsWord: Variant):
  boolean;
begin
  SimpleReplace := true;
  try
    MsWord.Selection.End := 0;
    MsWord.Selection.Start := 0;
    MsWord.Selection.Find.Forward := true;
    MsWord.Selection.Find.Text := Tag;
    if MsWord.Selection.Find.Execute then
    begin
      MsWord.Selection.Delete;
      MsWord.Selection.InsertAfter(New);
      SimpleReplace(Tag, New, MsWord);
    end
    else
      SimpleReplace := false; //if
  except
    SimpleReplace := false;
  end; //try
end;

function getNulliki(codeFilial: Integer) : String;
var
  q1 : TADOQuery;
  sql1 : string;
  res : string;
begin
  if (codeFilial < 10) then
  begin
    res := '00' end else
    begin
      if (codeFilial < 100) then
      begin
        res := '0';
      end else
      begin res := '';
      end;
  end;
 RESULT := res;
end;

function getDiscountTarif(idTarif : Integer; ContractType : Integer; LoyalGroup : Integer) : Integer;
var
  res : Integer;
begin
    res := ContractType;
    if(LoyalGroup = 1) then begin
      if ((ContractType >=137) AND (ContractType <= 140)) then begin
        case idTarif of
          7 : res := 101;
          8 : res := 105;
          9 : res := 109;
          else res := ContractType;
        end;
      end;
      if ((ContractType >=141) AND (ContractType <= 144)) then begin
        case idTarif of
          7 : res := 113;
          8 : res := 117;
          9 : res := 121;
          else res := ContractType;
        end;
      end;
      if ((ContractType >=145) AND (ContractType <= 148)) then begin
        case idTarif of
          7 : res := 125;
          8 : res := 129;
          9 : res := 133;
          else res := ContractType;
        end;
      end;
    end;
    if(LoyalGroup = 2) then begin
      if ((ContractType >=137) AND (ContractType <= 148)) then begin
        case idTarif of
          7 : res := 113;
          8 : res := 117;
          9 : res := 121;
          else res := 1;
        end;
      end;
    end;
  RESULT := res;
end;


function getLoyalTarif(idTarif : Integer; ContractType : Integer) : Integer;
var
  res : Integer;
begin
  res := 0;
  if (idTarif = 7) then begin
    case ContractType of
      137 : res := 101;
      141 : res := 113;
      145 : res := 125;
    end;
  end;
    if (idTarif = 8) then begin
    case ContractType of
      137 : res := 105;
      141 : res := 117;
      145 : res := 129;
    end;
  end;
    if (idTarif = 9) then begin
    case ContractType of
      137 : res := 109;
      141 : res := 121;
      145 : res := 133;
    end;
  end;
  RESULT := res;
end;

function getOldReducePercent (idTarif : Integer) : Double;
var
  saleIni : TIniFile;
  res : Double;
  saleGroup : String;
begin
  res := 0;
  if ((idTarif = 2) OR (idTarif = 3) OR (idTarif = 4))  then begin
    saleGroup := 'Group'+intToStr(idTarif);
    saleIni := TIniFile.Create('c:\pawn\sale.ini');
    res := saleIni.ReadFloat(saleGroup,'ReducePercent', 0);
    saleIni.Free;
  end;
  RESULT := res;
end;

function getTestPriceByNameFilial(codeFilial1 : String) : String;
var
res : String;
begin
  res := 'c:\pawn\conf\testPrice'+(codeFilial1)+'.xml';
  if (NOT FileExists(res)) then begin
    res := 'c:\pawn\conf\tarif'+getRegionByNameFilial(codeFilial1)+'.xml';
    if (NOT FileExists(res)) then begin
      res := 'c:\pawn\conf\tarif.xml';
    end;
  end;
  //ShowMessage(res);
  RESULT := res;
end;

function getTarifStringByCodeFilial(codeFilial1 : Integer) : String;
var
res : String;
begin
  case codeFilial1 of
    // Донецкая Обл, НЕ Мариуполь
    983,978,979,12,982,38,992,45,6,2,47,981,11,8,3,9   : res := 'c:\pawn\conf\tarifDN.xml';
    // Харьков+Миргород
    53,52,977,7,989,19,984,13,1,4,15,16,999,987   : res := 'c:\pawn\conf\tarifKH.xml';
    // Николаевск+Котовск
    985,990,28,43,29 : res := 'c:\pawn\conf\tarifNK.xml';
    //Мариуполь
    980 : res := 'c:\pawn\conf\tarifMR.xml';
    // 14 ло
    14  : res := 'c:\pawn\conf\tarif14.xml';
    // Луганск
    //11,8, 3, 9 : res := 'c:\pawn\conf\tarifLG.xml';
    // Одесса1
    50,996,17,33,26,25,24,22,21,51 : res := 'c:\pawn\conf\tarifOD.xml';
    // Одесса2

    else res := 'c:\pawn\conf\tarif.xml';
  end;
  //Showmessage(res);
  RESULT := res;
end;

function checkTHISfilial(id1 : Integer) : Boolean;
var
  res : Boolean;
begin
    res := true;

    case id1 of
      4,14,3,17,22,990,13,982,24,26,19,992,12,45,47 : res := false;
      else res := true;
    end;

  RESULT := res;
end;

function checkTHISfilial() : Boolean;
var
  res : Boolean;
  id1 : Integer;
begin
    res := true;
    id1 := DANADO.utils.getCode_filial;
    case id1 of
      4,14,3,17,22,990,13,982,24,26,19, 992, 12,45,47 : res := false;
      else res := true;
    end;

  RESULT := res;
end;

function checkLastDate(date1 : TDAte) : TDate;
var
  res : TDate;
  date2 : TDate;
begin




//ShowMessage(IntToStr(daysBetween(date1,getLastDate)));
 if (not checkTHISfilial()) then  begin
  res := getLastDate();
  if (res > date1)  then begin
    res := res +1 ;
  end else begin
    res := date1;
  end;
   end else begin
    res := date1;
   end;
  RESULT := res;
end;

function checkLastDate(date1 : string) : string;
var
  res : String;

begin

//ShowMessage(IntToStr(daysBetween(StrToDate(date1),getLastDate)));
 if (not checkTHISfilial()) then  begin

    //if (daysBetween(getLastDate,date1) > 0) then begin
      res := DateToStr(now());
   // end;

   end else begin
    res := date1;
   end;
  RESULT := res;
end;

function getLastDate() : TDate;
var
  q1 : TADOQuery;
  sql1 : String;
  res : TDAte;
begin
  q1 := TADOQuery.create(nil);
  q1.ConnectionString := DANADO.utils.getConnectionString;
  sql1 := 'SELECT lastDate FROM pasport';
  q1.SQL.Add(sql1);
  q1.Open;
  res := q1.FieldByName('lastDate').AsDateTime;
  q1.Destroy;
  RESULT := res;
end;

function getRegionByNameFilial(nameFilial1 : String) : String;
var
  res : String;
begin
  case (StrToInt(nameFilial1)) of
    // Донецk
    32, 45, 38, 30, 14, 47, 20, 12, 27   : res := 'DN';
    // Лугансk
    2, 7, 8, 11 : res := 'LG';
    // Харьков
    3, 4, 6, 9, 10, 13, 15, 16, 18, 19, 39, 44, 46, 49, 52, 53  : res := 'KH';
    // Одесса
    17, 26, 50, 51, 21, 22, 24, 25, 33, 34, 28, 29, 31, 35, 40, 43 : res := 'OD';
  end;
  RESULT := res;
end;

 function getTestPercentString(idDeliverer1 : Integer) : String;
 var
  deliverer : TENdeliverer;
  res : String;
 begin
  res := 'c:/pawn/conf/tarif.xml';
  deliverer := DANADO.deliverer.getDelivererById(idDeliverer1);
  //ShowMessage(DateToStr(deliverer.getDateAdd));
  RESULT := res;

 end;


end.

