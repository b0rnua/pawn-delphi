unit ProductADO;

interface

uses
  ADODB, Product, Classes, Dialogs, SysUtils, Contnrs, MyUtils,
  ContractEntity, ContractADO, DanUtils, DanAdo;

function getProductsOnDate(date:TDateTime) : TProductList;
function getCountProductOnDate(date:TDateTime) : Integer;

implementation

function getCountProductOnDate(date:TDateTime) : Integer;
var
q1 : TADOQuery;
sql : string;
res : Integer;
product : TProductEntity;
begin
  product := TProductEntity.Create;
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := danAdo.utils.getConnectionString;
  sql := 'SELECT COUNT(product_info.id) FROM product_info'+
    ' INNER JOIN contract_info'+
    ' ON product_info.id_contract=contract_info.id'+
    ' WHERE (contract_info.date_begin<=:date_begin AND'+
    ' (contract_info.DateClose is null OR contract_info.DateClose>:DateClose))';
  q1.SQL.Add(sql);
  q1.Parameters.ParamByName('DateClose').Value := date;
  q1.Parameters.ParamByName('date_begin').Value := date;
  q1.Open;
    res := q1.Fields[0].AsInteger;
  q1.Close;
  q1.Destroy;
  Result := res;
end;

function getProductsOnDate(date:TDateTime) : TProductList;
var
q1 : TADOQuery;
sql : string;
list : TProductList;
product : TProductEntity;
i : Integer;
listLength : Integer;
begin
  i := 0;
  //product := TProductEntity.Create;


  listLength := getCountProductOnDate(date);
  if (listLength <> 0) then
  begin
    SetLength(list,listLength);
    q1 := TADOQuery.Create(nil);
    q1.ConnectionString := danAdo.utils.getConnectionString;

    sql := 'SELECT product_info.*, contract_info.contract_number FROM product_info'+
      ' INNER JOIN contract_info'+
      ' ON product_info.id_contract=contract_info.id'+
      ' WHERE (contract_info.date_begin<=:date_begin AND'+
      ' (contract_info.DateClose is null OR contract_info.DateClose>:DateClose)) ORDER BY contract_info.contract_number';

    q1.SQL.Add(sql);
    q1.Parameters.ParamByName('DateClose').Value := date;
    q1.Parameters.ParamByName('date_begin').Value := date;
    with q1 do begin
      q1.Open;
      while not eof do begin
        list[i] := TProductEntity.Create;
        list[i].id := q1.FieldByName('id').AsInteger;
        list[i].product := q1.FieldByName('product').AsString;
        list[i].metal := q1.FieldByName('metal').AsString;
        list[i].num := q1.FieldByName('num').AsInteger;
        list[i].test := q1.FieldByName('test').AsString;
        list[i].price := q1.FieldByName('price').AsFloat;
        list[i].weight := q1.FieldByName('weight').AsFloat;
        list[i].weightNet := q1.FieldByName('weight_net').AsFloat;
      if (q1.FieldByName('weight_piece').AsBoolean) then
        begin
        list[i].weightPiece := q1.FieldByName('weight_piece').AsFloat;
        end
        else begin
        list[i].weightPiece := 0.0;
      end;
        list[i].estimatedAmount := q1.FieldByName('estimated_amount').AsFloat;
        list[i].contractId := q1.FieldByName('id_contract').AsInteger;
        list[i].contract := TContract.Create;
        list[i].contract.number := q1.FieldByName('contract_number').AsString;
        list[i].productStatus := q1.FieldByName('product_status').AsBoolean;
        list[i].SerialNumber := q1.FieldByName('SerialNumber').AsString;
        Inc(i);
        Next;
      end;
      q1.Close;
    end;
    q1.Destroy;
    //product.Destroy;

  end;
  Result := list;
end;

end.
