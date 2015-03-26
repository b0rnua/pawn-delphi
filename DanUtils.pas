unit DanUtils;

interface

uses
  SysUtils, DateUtils,  Variants, Classes, ComObj, IniFiles, ADODB, DS2XML,
  DANADO, Dialogs, MyUtils, Windows, XMLDoc, XMLDom, XMLIntf ;

type
  ext = class(TObject)
    private
      //
    public
      procedure createArhiv(op1 : TDateTime);
      procedure createXmlOperation(op1 : TDateTime);
      procedure createXmlContractAndProductInfo(op1 : TDateTime);
      procedure createXmlDeliverer(op1 : TDateTime);
      procedure createXmlEvent(op1 : TDateTime);
      procedure createXmlLoyalty(op1 : TDateTime);
      procedure createXmlEmployee(op1 : TDateTime);
      procedure createXmlArrears(op1 : TDateTime);
      // для сборки всех активных
      procedure createXmlLoyalty2(op1 : Boolean);
      procedure createDaily(op1 : TDateTime);
  end;

  prin = class(TObject)
    public
      procedure repawn(id1 : Integer; previousNumber: String);
      procedure newContract(id1 : Integer);
      function checkDNR() : Boolean;
  end;

  danxml1 = class(TObject)
    public
      function getGoldTestPrice585(contractTypeGroup1 : Integer) : String;

  end;
 var
  print : prin;
  ex : ext;
  danXML : danXml1;
implementation

uses
  main, enContract, enProduct, enDeliverer;
{ ex }

procedure ext.createArhiv(op1: TDateTime);
var
  q1 : TADOQuery;
  sql1 : String;
  ops1 : String;
  sFileName : String;
  fn : String;
begin
  ops1 := DateToStr(op1);
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := danado.utils.getConnectionString;
  sql1 := 'SELECT name_filial FROM pasport';
  q1.SQL.Add(sql1);
  q1.Open;
  ops1 := FormatDateTime('ddmmyyyy', op1);
  sFileName := 'daily_'+q1.FieldByName('name_filial').AsString+'_'+ops1+'.rar';
  fn := MyUtils.getNulliki(q1.FieldByName('name_filial').AsInteger)+q1.FieldByName('name_filial').AsString;
  q1.Destroy;
  main.ExecAndWait('C:\Pawn\Rar.exe', 'a C:\Pawn\archives\' + sFileName +
    ' C:\Pawn\xml\*.xml -ep', 0);
  CopyFile(PWideChar('C:\Pawn\archives\' + sFileName),
  PWideChar('C:\Dropbox\' + fn + '\data\' + sFileName), false);
end;

procedure ext.createDaily(op1: TDateTime);
begin
 createXmlContractAndProductInfo(op1);
 createXmlDeliverer(op1);
 createXmlOperation(op1);
 createXmlEvent(op1);
 createXmlLoyalty(op1);
 createXmlEmployee(op1);
// createXmlArrears(op1);
 createArhiv(op1);
end;

procedure ext.createXmlArrears(op1: TDateTime);
var
  q1 : TADOQuery;
  sql1 : String;
begin
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := DANADO.utils.getConnectionString;
  sql1 := 'SELECT * FROM arrears WHERE dateAdd = :op1';
  q1.SQL.Add(sql1);
  q1.Parameters.ParamByName('op1').Value := DateToStr(op1);
  q1.Open;
  DatasetToXML(q1, 'C:/Pawn/xml/arrears.xml');
  q1.Close;
  q1.SQL.Clear;
  q1.Destroy;
end;

procedure ext.createXmlLoyalty2(op1: Boolean);
var
  q1 : TADOQuery;
  sql1 : String;
begin
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := DANADO.utils.getConnectionString;
  sql1 := 'SELECT * FROM loyalty WHERE status =-1';
  q1.SQL.Add(sql1);
  q1.Open;
  DatasetToXML(q1, 'C:/Pawn/xml/loyaltyAll.xml');
  q1.Close;
  q1.SQL.Clear;
  q1.Destroy;
end;

procedure ext.createXmlContractAndProductInfo(op1: TDateTime);
var
  q1 : TADOQuery;
  sql1 : String;
  ops1 : String;
begin
  ops1 := DateToStr(op1);
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := DANADO.utils.getConnectionString;
  sql1 := 'SELECT * FROM contract_info WHERE date_begin =:op1';
  q1.SQL.Add(sql1);
  q1.Parameters.ParamByName('op1').Value := ops1;
  q1.Open;
  DatasetToXML(q1, 'C:/Pawn/xml/contract_info.xml');
  q1.Close;
  q1.SQL.Clear;
  sql1 := 'SELECT product_info.* FROM product_info INNER JOIN contract_info ' +
  ' ON contract_info.id = product_info.id_contract ' +
  ' WHERE contract_info.date_begin =:op1';
  q1.SQL.Add(sql1);
  q1.Parameters.ParamByName('op1').Value := ops1;
  q1.Open;
  DatasetToXML(q1, 'C:/Pawn/xml/product_info.xml');
  q1.Destroy;
end;

procedure ext.createXmlDeliverer(op1: TDateTime);
var
  q1 : TADOQuery;
  sql1 : String;
  ops1 : String;
begin
  ops1 := DateToStr(op1);
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := DANADO.utils.getConnectionString;
  sql1 := 'SELECT DISTINCT deliverer.* FROM deliverer INNER JOIN contract_info ON deliverer.id = contract_info.id_deliverer WHERE (deliverer.DateAdd=:op1) OR (contract_info.date_begin=:op2)  ;';
  q1.SQL.Add(sql1);
  q1.Parameters.ParamByName('op1').Value := ops1;
  q1.Parameters.ParamByName('op2').Value := ops1;
  q1.Open;
  q1.RecordCount;
  DatasetToXML(q1, 'C:/Pawn/xml/deliverer.xml');
  q1.Close;
  q1.SQL.Clear;
  q1.Destroy;
end;

procedure ext.createXmlEmployee(op1: TDateTime);
var
  q1 : TADOQuery;
  sql1 : String;
  ops1 : String;
begin
  ops1 := DateToStr(op1);
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := DANADO.utils.getConnectionString;
  sql1 := 'SELECT * FROM employee;';
  q1.SQL.Add(sql1);
 // q1.Parameters.ParamByName('op1').Value := ops1;
 // q1.Parameters.ParamByName('op2').Value := ops1;
  q1.Open;
  q1.RecordCount;
  DatasetToXML(q1, 'C:/Pawn/xml/employee.xml');
  q1.Close;
  q1.SQL.Clear;
  q1.Destroy;
end;

procedure ext.createXmlEvent(op1: TDateTime);
var
  q1 : TADOQuery;
  sql1 : String;
  ops1 : String;
  ops2 : String;
begin
//parametr 2
  ops2 := DateToStr(op1 +1);
  ops1 := DateToStr(op1);
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := DANADO.utils.getConnectionString;
  sql1 := 'SELECT * FROM event WHERE (eventDate = :op1 OR eventDate = :op2)';
  q1.SQL.Add(sql1);
  q1.Parameters.ParamByName('op1').Value := ops1;
  q1.Parameters.ParamByName('op2').Value := ops2;
  q1.Open;
  DatasetToXML(q1, 'C:/Pawn/xml/event.xml');
  q1.Close;
  q1.SQL.Clear;
  q1.Destroy;
end;

procedure ext.createXmlLoyalty(op1: TDateTime);
var
  q1 : TADOQuery;
  sql1 : String;
  ops1 : String;
begin
  ops1 := DateToStr(op1);
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := DANADO.utils.getConnectionString;
  //sql1 := 'SELECT * FROM loyalty WHERE status=-1';
  sql1 := 'SELECT * FROM loyalty WHERE editDate = :op1';
  q1.SQL.Add(sql1);
  q1.Parameters.ParamByName('op1').Value := ops1;
  q1.Open;
  DatasetToXML(q1, 'C:/Pawn/xml/loyalty.xml');
  q1.Close;
  q1.SQL.Clear;
  q1.Destroy;
end;

procedure ext.createXmlOperation(op1: TDateTime);
var
  q1 : TADOQuery;
  sql1 : String;
  ops1 : String;
begin
  ops1 := DateToStr(op1);
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := DANADO.utils.getConnectionString;
  sql1 := 'SELECT * FROM operation WHERE date_op = :op1';
  q1.SQL.Add(sql1);
  q1.Parameters.ParamByName('op1').Value := ops1;
  q1.Open;
  DatasetToXML(q1, 'C:/Pawn/xml/operation.xml');
  q1.Close;
  q1.SQL.Clear;
  q1.Destroy;
end;

{ print }

function prin.checkDNR: Boolean;
var
  res : Boolean;
  myCodeFilial : Integer;
  q1 : TADOQuery;
  sql1 : String;
begin
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := DANADO.utils.getConnectionString;
  sql1 := 'SELECT num_filial FROM pasport';
  q1.SQL.Add(sql1);
  q1.Open;
  myCodeFilial := q1.FieldByName('num_filial').AsInteger;
  res := false;
  case (myCodeFilial) of
  12,14,982,992,978,38,45,47 : res := true;
  end;
  q1.Destroy;
 // ShowMessage(intTOStr(myCodeFilial));
  RESULT := res;
end;

procedure prin.newContract(id1: Integer);
var
  q1: TADOQuery;
  sql1: String;
  X : Variant;
  dog : TenContract2;
  i : Integer;
begin
  dog := DANADO.contract.getContractById(id1);
  dog.product := DANADO.product.getProductByIdContract(id1);
  dog.deliverer := DANADO.deliverer.getDelivererById(dog.idDeliverer);

  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := DANADO.utils.getConnectionString;
  sql1 := 'SELECT city, phone FROM pasport';
  q1.SQL.Add(sql1);
  q1.Open;

  X := CreateOleObject('Excel.Application');
  if(checkDNR())then begin
  X.WorkBooks.Add('C:\Pawn\report\newContract3DNR.xls');
  end else begin
    X.WorkBooks.Add('C:\Pawn\report\newContract3.xls');
  end;
  X.DisplayAlerts := false;

  X.cells[3,20] := dog.contractNumber;   // Договор
  X.cells[4,4]  := q1.FieldByName('city').AsString; // Город
  X.cells[4,30]  := dog.dateBegin;  //Дата Дог
  X.cells[9,4]  := currentEmployee.name;   // ФИО Сотрудника
  X.cells[9,22]  := IntToStr(currentEmployee.warrant_num);  // Доверенность
  X.cells[9,24]  := currentEmployee.warrant_date;  // Дата Доверенности
  X.cells[9,31]  := q1.FieldByName('phone').AsString;;  // Телефон Ло
  X.cells[11,13]  := dog.deliverer.getName; // ФИО Клиент
  X.cells[12,10]  := dog.deliverer.getAdress; // Адрес Клиент
  X.cells[13,6]  := dog.deliverer.getPasport_ser;  //Паспорт Серия
  X.cells[13,8]  := dog.deliverer.getPasport_num;  //Паспорт Номер
  X.cells[13,14]  := dog.deliverer.getPasport_vydan; //Паспорт Выдан
  X.cells[14,4]  := DateToStr(dog.deliverer.getPasport_date);  //Дата Выдачи
  X.cells[14,15]  := dog.deliverer.getInn;  // Инн
  X.cells[14,22]  := dog.deliverer.getTelephon;   // Телефон Клиента
  X.cells[16,14]  := IntToStr(dog.numOfDay);   // Кольво дней
  X.cells[18,11]  := dog.dateEnd;   // Дата Возврата кредита
  for i := 0 to dog.product.count-1 do begin
    X.cells[25+i,4]  := dog.product.p[i].product;  // Наименование
    X.cells[25+i,17]  := IntToStr(dog.product.p[i].num);  // Килькисть частин
    X.cells[25+i,19]  := dog.product.p[i].metal+ '/' +IntToStr(dog.product.p[i].test);   //Тип золото/проба
    X.cells[25+i,23]  := FloatToStr(dog.product.p[i].weight);   // Вес грязный
    X.cells[25+i,26]  := FloatToStr(dog.product.p[i].weightPiece);   // Вес вставки
    X.cells[25+i,28]  := FloatToStr(dog.product.p[i].weightNet);   // Чистый Вес
    X.cells[25+i,30]  := FloatToStr(dog.product.p[i].price);   // Цена за грам
    X.cells[25+i,33]  := FloatToStr(dog.product.p[i].estimatedAmount);   // Оценочная стоимость
  end;
  X.cells[37,33]  := FloatToStr(dog.loanAmount); // Сумма выданных
  X.cells[39,18]  := FloatToStr(round((dog.estimatedAmount/dog.loanAmount)*100));   // Процент выданных ден средств
  X.cells[39,25]  := FloatToStr(dog.estimatedAmount);   // Тело кредита
  X.cells[42,23]  := FloatToStr(dog.conPercent);    // Процент в День
  X.cells[43,2]  := FloatToStr(dog.sumPercent);   // Сумма процентов
  X.cells[47,16]  := FloatToStr(dog.amountRef);   // Сумма к Возврату
  X.cells[57,4]  := currentEmployee.name;    // ФИО Сотрудника
  X.cells[57,23]  := dog.deliverer.getName;   // ФИО Клиента

  q1.Destroy;
  X.Visible := True;
end;

procedure prin.repawn(id1: Integer; previousNumber: String);
var
  q1: TADOQuery;
  sql1: String;
  X : Variant;
  dog : TenContract2;
  oldDog : TENcontract2;
  prod : TenProduct;
  deliv : TenDeliverer;
  Adog : ADOcontract;
  Aprod : ADOproductInfo;
  Adeliv : ADOdeliverer;
  i,b : Integer;
  cela : String;
  cell1 , cell2 : OLEVariant;
  preRep : String;
  cells11 : String;
  arrearsCell : String;
begin
  dog := TENcontract2.Create;
  prod := TENproduct.Create;
  deliv := TENdeliverer.Create;
  Adog := ADOcontract.Create;
  Aprod := ADOProductInfo.Create;
  Adeliv := ADOdeliverer.Create;

  dog := Adog.getContractById(id1);
  oldDog := Adog.getContractById(dog.idParentContract);
  prod := Aprod.getProductByIdContract(id1);
  deliv := Adeliv.getDelivererById(dog.idDeliverer);

  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := DANADO.utils.getConnectionString;
  sql1 := 'SELECT city, phone FROM pasport';
  q1.SQL.Add(sql1);
  q1.Open;

  X := CreateOleObject('Excel.Application');
  if(checkDNR())then begin
    X.WorkBooks.Add('C:\Pawn\report\repawnContract2DNR.xls');
  end else begin
    X.WorkBooks.Add('C:\Pawn\report\repawnContract2.xls');
  end;
  X.DisplayAlerts := false;
  b := 0;
  while b < 36 do begin

    X.cells[1+b,21] := dog.contractNumber;
    X.cells[2+b,3] := q1.FieldByName('city').AsString;
    X.cells[2+b,28] := dog.dateBegin;
    X.cells[4+b,22] := oldDog.contractNumber;
    X.cells[4+b,29] := previousNumber;
    X.cells[5+b,8] := IntToStr(dog.numOfDay);
    X.cells[5+b,30] := dog.dateEnd;
    X.cells[8+b,24] := currentEmployee.name;
    X.cells[9+b,12] := intToStr(currentEmployee.warrant_num);
    X.cells[9+b,14] := currentEmployee.warrant_date;
    X.cells[9+b,24] :=  q1.FieldByName('phone').AsString;
    X.cells[10+b,11] := deliv.getName;
    X.cells[10+b,25] := deliv.getTelephon;

    // Если был реструктурирован...
    arrearsCell := '';
    if (dog.arrears) then begin
      if(checkDNR())then begin
      dog.amountRef := dog.amountRef + (danado.arrear.getSumArrearsByIdContract(dog.id));
      arrearsCell := 'Долг : ' + FloatToStr(danado.arrear.getSumArrearsByIdContract(dog.id)) + ' грн.';

      end else begin

      dog.amountRef := dog.amountRef + (danado.arrear.getSumArrearsByIdContract(dog.id));
      arrearsCell := 'Борг : ' + FloatToStr(danado.arrear.getSumArrearsByIdContract(dog.id)) + ' грн.';

      end;
    end;

    cells11 := FloatToStr(dog.amountRef) + ' грн. В т.ч.: Ссуда: ' +FloatToStr(dog.estimatedAmount)+
     ' грн., %: ' + FloatToStr(dog.sumPercent) + 'грн. (% ставка: '+  FloatToStr(dog.conPercent)+'). ';

    X.cells[11+b,9] := cells11+arrearsCell;

    //
    for I := 0 to prod.count-1 do begin
      X.cells[15+i+b,2] := IntToStr(i+1);
      X.cells[15+i+b,3] := prod.p[i].product;
      X.cells[15+i+b,9] := IntToStr(prod.p[i].num);
      X.cells[15+i+b,12] := prod.p[i].metal;
      X.cells[15+i+b,15] := FloatToStr(prod.p[i].test);
      X.cells[15+i+b,17] := FloatToStr(prod.p[i].weight);
      X.cells[15+i+b,20] := FloatToStr(prod.p[i].weightPiece);
      X.cells[15+i+b,23] := FloatToStr(prod.p[i].weightNet);
      X.cells[15+i+b,26] := FloatToStr(prod.p[i].price);
      X.cells[15+i+b,29] := FloatToStr(prod.p[i].estimatedAmount);
    end;
    cell1 := X.cells[15+b,2];
    cell2 := X.Cells[14+i+b,32];
    X.Range[cell1,cell2].Select;
    X.Selection.Borders.LineStyle:=2;
    if i < 12 then begin
    // Убираем обьединение ячеек под таблицу  с изделиями.
      cell1 := X.cells[15+i+b,2];
      cell2 := X.Cells[16+11+b,32];
      X.Range[cell1,cell2].Select;
      X.Selection.MergeCells:=False;
    end;
    X.Range['A1:B1'].Select;
    X.cells[16+i+b,7] := 'М.П.';
    if (checkDNR) then begin
    X.cells[16+i+b,23] := 'Кредитор __________ подпись';
    X.cells[18+i+b,23] := 'Заёмщик _____________подпись';
    end else begin
    X.cells[16+i+b,23] := 'Кредитодавець __________ підпис';
    X.cells[18+i+b,23] := 'Позичальник _____________підпис';
    end;
    b := b  + 31;
   end;
   X.Range['A1:B1'].Select;
   X.Visible := True;
  end;

{ danxml1 }

function danxml1.getGoldTestPrice585(contractTypeGroup1: Integer): String;

var
  count,countA, z, j, x : Integer;
  res : string;
  i1  : Integer;
  keyStr1,keyStr2 : String;
  myXmlNode  : iXMLNode;
  xmldcmntXMLD1: iXMLDocument;
begin
  xmldcmntXMLD1 := TXMLDocument.Create(nil);
  try
    xmldcmntXMLD1.LoadFromFile('c:\pawn\conf\goldTestPrice.xml');
    except on e: exception do begin
      Showmessage('Файл с Тарифами не найден! Оформлять ЗАПРЕЩЕНО! Перезайдите в программу, затем звоните в Техподдержку!');
    end;
  end;
  keyStr1 := 'lo'+DANADO.utils.getLombardName;
  keyStr2 := 'ctg'+intTostr(contractTypeGroup1);
  xmldcmntXMLD1.Active := true;


  if(xmldcmntXMLD1.DocumentElement.ChildNodes['ROWDATA'].ChildNodes[keyStr1].ChildNodes[keyStr2].ChildNodes.Count = 1) then begin
    res :=xmldcmntXMLD1.DocumentElement.ChildNodes['ROWDATA'].ChildNodes[keyStr1].ChildNodes[keyStr2].ChildNodes['price'].NodeValue;
  end else begin
  //  keyStr1 :=
  end;
  z := 0;
  x := 0;
 // res := intToStr(COUNT);
   {

  while (res <> '') do begin
    while (x < count) do begin


      while z < countA do begin
        if(VarToStr(xmldcmntXMLD.DocumentElement.ChildNodes['ROWDATA'].ChildNodes[z].Attributes['id']) = IntToStr(contractTypeGroup1)) then begin
          j := 0;
          // ShowMEssage('777 FOUND '+ IntToStr(contractTypeGroup));
          while j < xmldcmntXMLD.DocumentElement.ChildNodes['ROWDATA'].ChildNodes[z].ChildNodes['testPrice'].ChildNodes.Count do begin
            if VarToStr(xmldcmntXMLD.DocumentElement.ChildNodes['ROWDATA'].ChildNodes[z].ChildNodes['testPrice'].ChildNodes[j].ChildNodes['test'].NodeValue) = '585' then begin
              res := VarToStr(xmldcmntXMLD.DocumentElement.ChildNodes['ROWDATA'].ChildNodes[z].ChildNodes['testPrice'].ChildNodes[j].ChildNodes['price'].NodeValue)
            end;
          Inc(j);
        end;
      z := count;
      end else begin
      Inc(z);
      end;
      end;
    end;
  end;

  {
  while z < count do begin
    if(VarToStr(xmldcmntXMLD.DocumentElement.ChildNodes['ROWDATA'].ChildNodes[z].Attributes['id']) = IntToStr(contractTypeGroup)) then begin
      j := 0;
     // ShowMEssage('777 FOUND '+ IntToStr(contractTypeGroup));
      while j < xmldcmntXMLD.DocumentElement.ChildNodes['ROWDATA'].ChildNodes[z].ChildNodes['testPrice'].ChildNodes.Count do begin
        if VarToStr(xmldcmntXMLD.DocumentElement.ChildNodes['ROWDATA'].ChildNodes[z].ChildNodes['testPrice'].ChildNodes[j].ChildNodes['test'].NodeValue) = '585' then begin
          res := VarToStr(xmldcmntXMLD.DocumentElement.ChildNodes['ROWDATA'].ChildNodes[z].ChildNodes['testPrice'].ChildNodes[j].ChildNodes['price'].NodeValue)
        end;
      Inc(j);
      end;

    z := count;
    end else begin
      Inc(z);
    end;
  end;

  if (idDeliverer <> 0) then begin
    loyal := danado.loyal.getArrayLoyalty(LDELIVERER, idDeliverer);
    for i1 := 0 to length(loyal)-1 do begin
      loyalS := store.get(TLoyalsType(loyal[i1].IdLoyalty));
      if (loyalS <> nil) then begin
        res := FloatToStr(loyalS.getPrice(StrToFloat(res),loyal[i1].option2));
      end;
    end;
  end;
  //ShowMessage(res);

  if(flaer) then begin
    res := FloatToStr(getFlaerPriceByRegion(getRegionByNameFilial(main.sNameFilial)));
  end;

  res := FloatToStr(contractUtils.price.getPriceOfTestFrom585(strToInt(test),strToFloat(res)));
  xmldcmntXMLD.Active := false;
                \\}
  RESULT := res;
end;

end.
