unit Discounts;

interface

uses
  enDeliverer, XMLIntf, XMLDoc, Variants, SysUtils, Dialogs;

type
 IDiscount = interface
   function getDiscountedPercent(deliverer: TENdeliverer; percent: Double): Double;
   function getDiscountedPrice(deliverer: TENdeliverer; price: Double): Double;
 end;

type
 TFixed =  class(TInterfacedObject, IDiscount)
   private
    key: Integer;
    name: String;
   public
    function getDiscountedPercent(deliverer: TENdeliverer; percent: Double): Double;
    function getDiscountedPrice(deliverer: TENdeliverer; price: Double): Double;
 end;

type
 TReduced =  class(TInterfacedObject, IDiscount)
   private
    key: Integer;
    name: String;
   public
    function getDiscountedPercent(deliverer: TENdeliverer; percent: Double): Double;
    function getDiscountedPrice(deliverer: TENdeliverer; price: Double): Double;
 end;




function getTargetNode(sourceNode: IXMLNode; targetName: String): IXMLNode;
function getTarifNameById(id: Integer): String;
function getTarifFromXMLByDelivererId(id: Integer): Integer;

implementation

uses
  main;

function getTarifFromXMLByDelivererId(id: Integer): Integer;
var
xml: IXMLDocument;
nodes: IXMLNodeList;
node: IXMLNode;
parentNode: IXMLNode;
targetNodeName: String;
index: Integer;
resultTarif: Integer;
codeFilial: String;
begin
  codeFilial := main.sCodeFilial;
  targetNodeName := IntToStr(id);
  resultTarif := 0;
  xml := TXMLDocument.Create(nil);
  xml.LoadFromFile('C:\pawn\conf\loyalty.xml');
  xml.Active := True;
  index := 0;
  parentNode := xml.DocumentElement.ChildNodes['loyalty'];
  node := Discounts.getTargetNode(parentNode, codeFilial);

  if (node <> nil) then begin
    node := Discounts.getTargetNode(node, targetNodeName);

    if (node <> nil) then begin
      resultTarif := 9;
    end;
  end;

  result := resultTarif;
end;

function TFixed.getDiscountedPrice(deliverer: TENdeliverer; price: Double): Double;
var
resultPrice: Double;
begin
  //not yet implemented
  resultPrice := 0;
  result := resultPrice;
end;

function TReduced.getDiscountedPrice(deliverer: TENdeliverer; price: Double): Double;
var
xml: IXMLDocument;
nodes: IXMLNodeList;
node: IXMLNode;
parentNode: IXMLNode;
targetNodeName: String;
index: Integer;
resultPrice: Double;
codeFilial: String;
begin
  codeFilial := main.sCodeFilial;
 // WHY ??? targetNodeName := Discounts.getTarifNameById(deliverer.getId_tarif);
  targetNodeName := IntToStr(deliverer.getId);
  resultPrice := 0;
  xml := TXMLDocument.Create(nil);
  xml.LoadFromFile('C:\pawn\conf\loyalty.xml');
  xml.Active := True;
  index := 0;
  parentNode := xml.DocumentElement.ChildNodes['loyalty'];
  node := Discounts.getTargetNode(parentNode, codeFilial);

  if (node <> nil) then begin
    node := Discounts.getTargetNode(node, targetNodeName);
    if (node <> nil) then begin
      resultPrice := node.Attributes['price'];
    end else begin
    //Нужно реализовать метод возврата общих значений
      node := Discounts.getTargetNode(parentNode, 'common');
      node := Discounts.getTargetNode(node, targetNodeName);
      if (node <> nil) then resultPrice := node.Attributes['price'];
    end;
  end else begin
  //Нужно реализовать метод возврата общих значений
     node := Discounts.getTargetNode(parentNode, 'common');
     node := Discounts.getTargetNode(node, targetNodeName);
     if (node <> nil) then resultPrice := node.Attributes['price'];
  end;
  if (resultPrice = 0) then resultPrice := price;

  result := resultPrice;
end;

function getTarifNameById(id: Integer): String;
var
  name: String;
begin

  case id of
    7: name := 'basic';
    8: name := 'silver';
    9: name := 'gold';
  else name := 'empty';
  end;

  result := name;
end;

function getTargetNode(sourceNode: IXMLNode; targetName: String): IXMLNode;
var
nodes: IXMLNodeList;
node: IXMLNode;
resultNode: IXMLNode;
index: Integer;
begin
  nodes := sourceNode.ChildNodes;
  index := 0;
  resultNode := nil;

  while (index < nodes.Count) do begin
    node := nodes[index];

    if (node.Attributes['name'] = targetName) then begin
      resultNode := node;
    end;

    Inc(index);
  end;

  result := resultNode;
end;

function TFixed.getDiscountedPercent(deliverer: TENdeliverer; percent: Double): Double;
var
xml: IXMLDocument;
nodes: IXMLNodeList;
node: IXMLNode;
parentNode: IXMLNode;
targetNodeName: String;
index: Integer;
resultPercent: Double;
codeFilial: String;
begin
  codeFilial := main.sCodeFilial;
  targetNodeName := IntToStr(deliverer.getId);
  resultPercent := 0;
  xml := TXMLDocument.Create(nil);
  xml.LoadFromFile('C:\pawn\conf\loyalty.xml');
  xml.Active := True;
  index := 0;
  parentNode := xml.DocumentElement.ChildNodes['loyalty'];
  node := Discounts.getTargetNode(parentNode, codeFilial);
  if (node <> nil) then begin
    node := Discounts.getTargetNode(node, targetNodeName);
    if (node <> nil) then begin
      resultPercent := node.Attributes['percent'];
    end else begin
      resultPercent := percent;
    end;
  end else begin
    resultPercent := percent;
  end;
   if (resultPercent = 0) then resultPercent := percent;
  result := resultPercent;
end;

function TReduced.getDiscountedPercent(deliverer: TENdeliverer; percent: Double): Double;
var
xml: IXMLDocument;
nodes: IXMLNodeList;
node: IXMLNode;
parentNode: IXMLNode;
targetNodeName: String;
index: Integer;
resultPercent: Double;
codeFilial: String;
begin
  codeFilial := main.sCodeFilial;
  targetNodeName := Discounts.getTarifNameById(deliverer.getId_tarif);
  resultPercent := 0;
  xml := TXMLDocument.Create(nil);
  xml.LoadFromFile('C:\pawn\conf\loyalty.xml');
  xml.Active := True;
  index := 0;
  parentNode := xml.DocumentElement.ChildNodes['loyalty'];
  node := Discounts.getTargetNode(parentNode, codeFilial);

  if (node <> nil) then begin
    node := Discounts.getTargetNode(node, targetNodeName);
    if (node <> nil) then begin
      resultPercent := percent - node.Attributes['percent'];
    end else begin
      //Нужно реализовать метод возврата общих значений
      node := Discounts.getTargetNode(parentNode, 'common');
      node := Discounts.getTargetNode(node, targetNodeName);
      if (node <> nil) then resultPercent := percent - node.Attributes['percent'];
    end;
  end else begin
      //Нужно реализовать метод возврата общих значений
      node := Discounts.getTargetNode(parentNode, 'common');
      node := Discounts.getTargetNode(node, targetNodeName);
      if (node <> nil) then resultPercent := percent - node.Attributes['percent'];
  end;
  if (resultPercent = 0) then resultPercent := percent;

  result := resultPercent;
end;

end.
