unit enProduct;

interface

uses
  SysUtils,Dialogs;

type
  TENproduct2 = class(TObject)
    private
      id2 : Integer;
      num2 : Integer;
      test2 : Integer;
      idContract2 : Integer;
      product2	: String;
      metal2	: String;
      serialNumber2	: String;
      price2 : Double;
      weight2 : Double;
	    weightNet2 : Double;
      weightPiece2 : Double;
	    estimatedAmount2 : Double;
      productStatus2 : Boolean;
      procedure setId(id1 : Integer);
      procedure setNum(Num1 : Integer);
      procedure setTest(test1 : Integer);
      procedure setIdContract(idContract1 : Integer);
      procedure setProduct(product1 : String);
      procedure setMetal(metal1 : String);
      procedure setPrice(price1 : Double);
      procedure setWeight(weight1 : Double);
      procedure setWeightNet(weightNet1 : Double);
      procedure setWeightPiece(weightPiece1 : Double);
      procedure setEstimatedAmount(estimatedAmount1 : Double);
      procedure setProductStatus(productStatus1 : boolean);
      procedure setSerialNumber(serialNumber1 : String);
      function getId() : Integer;
      function getNum() : Integer;
      function getTest() : Integer;
      function getIdContract() : Integer;
      function getProduct() : String;
      function getMetal() : String;
      function getPrice() : Double;
      function getWeight() : Double;
      function getWeightNet() : Double;
      function getWeightPiece() : Double;
      function getEstimatedAmount() : Double;
      function getProductStatus() : Boolean;
      function getSerialNumber() : String;

    public
      constructor Create() Overload;
      constructor Create(id_contract1 : Integer) Overload;


      property id : Integer read getId write setId;
      property num : Integer read getNum write setNum;
      property test : Integer read getTest write setTest;
      property idContract : Integer read getIdContract write setIdContract;
      property product : String read getProduct write setProduct;
      property metal : String read getMetal write setMetal;
      property price : Double read getPrice write setPrice;
      property weight : Double read getWeight write setWeight;
      property weightNet : Double read getWeightNet write setWeightNet;
      property weightPiece : Double read getWeightPiece write setWeightPiece;
      property estimatedAmount : Double read getEstimatedAmount write setEstimatedAmount;
      property productStatus : Boolean read getProductStatus write setProductStatus;
      property serialNumber : String read getSerialNumber write setSerialNumber;

  end;

  TENproduct = class(TObject)
    public
    p : Array[0..11] of TENproduct2;
    count : integer;
    weightNet : Double;
  end;

implementation
uses
  ADODB, DANADO;


  constructor TENproduct2.Create;
begin
  self.id2 := 0;
  self.num2 := 0;
  self.test2 := 0;
  self.idContract2 := 0;
  self.product2 := ' ';
  self.metal2 := ' ';
  self.price2 := 0.0;
  self.weight2 := 0.0;
  self.weightNet2 := 0.0;
  self.estimatedAmount2 := 0.0;
  self.productStatus2 := false;
end;

constructor TENproduct2.Create(id_contract1: Integer);
var
  q1 : TADOQuery;
  sql1 : String;
begin
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := DANado.utils.getConnectionString;
  sql1 := 'SELECT * FROM product_info WHERE id_contract =:pId_contract';
  q1.SQL.Add(sql1);
  q1.Parameters.ParamByName('pId_contract').Value := id_contract1;
  try
    q1.Open;
    self.id := q1.FieldByName('id').AsInteger;
    self.num := q1.FieldByName('num').AsInteger;
    self.test := q1.FieldByName('test').AsInteger;
    self.idContract := q1.FieldByName('id_contract').AsInteger;
    self.product := q1.FieldByName('product').AsString;
    self.metal := q1.FieldByName('metal').AsString;
    self.price := q1.FieldByName('price').AsFloat;
    self.weight := q1.FieldByName('weight').AsFloat;
    self.weightNet := q1.FieldByName('weight_net').AsFloat;
    self.estimatedAmount := q1.FieldByName('estimated_amount').AsFloat;
    self.productStatus := q1.FieldByName('product_status').AsBoolean;
  except on e: Exception do begin
      self.id := 0;
      self.num := 0;
      self.test := 0;
      self.idContract := 0;
      self.product := ' ';
      self.metal := ' ';
      self.price := 0.0;
      self.weight := 0.0;
      self.weightNet := 0.0;
      self.estimatedAmount := 0.0;
      self.productStatus := false;
  end;
  end;
end;


function TENproduct2.getEstimatedAmount: Double;
begin
  RESULT := self.estimatedAmount2;
end;

function TENproduct2.getId: Integer;
begin
  RESULT := self.id2;
end;

function TENproduct2.getIdContract: Integer;
begin
  RESULT := self.idContract2;
end;


function TENproduct2.getMetal: String;
begin
  RESULT := self.metal2;
end;

function TENproduct2.getNum: Integer;
begin
  RESULT := self.num2;
end;

function TENproduct2.getPrice: Double;
begin
  RESULT := self.price2;
end;

function TENproduct2.getProduct: String;
begin
  RESULT := self.product2;
end;

function TENproduct2.getProductStatus: Boolean;
begin
  RESULT := self.productStatus2;
end;

function TENproduct2.getserialNumber: String;
begin
  RESULT := self.serialNumber2;
end;

function TENproduct2.getTest: Integer;
begin
  RESULT := self.test2;
end;

function TENproduct2.getWeight: Double;
begin
  RESULT := self.weight2;
end;

function TENproduct2.getWeightNet: Double;
begin
  RESULT := self.weightNet2;
end;

function TENproduct2.getWeightPiece: Double;
begin
  RESULT := self.weightPiece2;
end;


procedure TENproduct2.setEstimatedAmount(estimatedAmount1: Double);
begin
  self.estimatedAmount2 := estimatedAmount1;
end;

procedure TENproduct2.setId(id1: Integer);
begin
  self.id2 := id1;
end;

procedure TENproduct2.setIdContract(idContract1: Integer);
begin
  self.idContract2 := idContract1;
end;


procedure TENproduct2.setMetal(metal1: String);
begin
  self.metal2 := metal1;
end;

procedure TENproduct2.setNum(Num1: Integer);
begin
  self.num2 := num1;
end;

procedure TENproduct2.setPrice(price1: Double);
begin
  self.price2 := price1;
end;

procedure TENproduct2.setProduct(product1: String);
begin
  self.product2 := product1;
end;

procedure TENproduct2.setProductStatus(productStatus1: boolean);
begin
  self.productStatus2 := productStatus1;
end;

procedure TENproduct2.setserialNumber(serialNumber1: String);
begin
  self.serialNumber2 := serialNumber1;
end;

procedure TENproduct2.setTest(test1: Integer);
begin
  self.test2 := test1;
end;

procedure TENproduct2.setWeight(weight1: Double);
begin
  self.weight2 := weight1;
end;

procedure TENproduct2.setWeightNet(weightNet1: Double);
begin
  self.weightNet2 := weightNet1;
end;

procedure TENproduct2.setWeightPiece(weightPiece1: Double);
begin
  self.weightPiece2 := weightPiece1;
end;

end.

