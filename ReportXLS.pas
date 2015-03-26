unit ReportXLS;

interface

uses
Classes, ComObj, Product, Dialogs, SysUtils, Contnrs, MyUtils;

procedure inventoryReport(list: TProductList; date: TDateTime);

implementation

procedure inventoryReport(list: TProductList; date: TDateTime);
var
  xlsx: variant;
  i,b,c: Integer;
  nbRow: Integer;
  nbRowStart: Integer;
  nbRowAsStr, tmpContract: string;
  nbRowStartAsStr: string;
  product: TProductEntity;
  numcount: integer;
  wescount, weccount: Double;
begin
  tmpContract := '0';
  numcount :=0;
  wescount := 0.0;
  weccount := 0.0;
  i := 0;
  c := 0;
  b := 0;
  nbRowStart := 27;
  nbRowStartAsStr := IntToStr(nbRowStart);
  nbRow := nbRowStart;
  product := TProductEntity.Create;

  try
    xlsx := GetActiveOleObject('Excel.Application');
  except
    xlsx := CreateOleObject('Excel.Application');
  end;

  xlsx.WorkBooks.Add('C:\Pawn\report\inventoryReport.xls');
  xlsx.Worksheets[1].Activate;
  if (Length(list) <> 0) then begin

    for i := 0 to Length(list)-1 do begin
      product := list[i];

      //xls.ActiveSheet.Rows['27,27'].Select;
      //xls.Selection.Insert();
      //xls.Range['B27:BB27'].Copy(xls.Range['B28:BB28']);
      nbRowAsStr := IntToStr(nbRow);
      xlsx.range['B'+nbRowAsStr+':C'+nbRowAsStr].merge;
      xlsx.range['D'+nbRowAsStr+':L'+nbRowAsStr].merge;
      xlsx.range['M'+nbRowAsStr+':P'+nbRowAsStr].merge;
      xlsx.range['Q'+nbRowAsStr+':T'+nbRowAsStr].merge;
      xlsx.range['U'+nbRowAsStr+':X'+nbRowAsStr].merge;
      xlsx.range['Y'+nbRowAsStr+':AA'+nbRowAsStr].merge;
      xlsx.range['AB'+nbRowAsStr+':AD'+nbRowAsStr].merge;
      xlsx.range['AE'+nbRowAsStr+':AG'+nbRowAsStr].merge;
      xlsx.range['AH'+nbRowAsStr+':AJ'+nbRowAsStr].merge;
      xlsx.range['AK'+nbRowAsStr+':AM'+nbRowAsStr].merge;
      xlsx.range['AN'+nbRowAsStr+':AP'+nbRowAsStr].merge;
      xlsx.range['AQ'+nbRowAsStr+':AS'+nbRowAsStr].merge;
      xlsx.range['AT'+nbRowAsStr+':AV'+nbRowAsStr].merge;
      xlsx.range['AW'+nbRowAsStr+':AY'+nbRowAsStr].merge;
      xlsx.range['AZ'+nbRowAsStr+':BB'+nbRowAsStr].merge;
      xlsx.Cells.Item[nbRow,2] := i+1;
      xlsx.Cells.Item[nbRow,4] := product.product;
      xlsx.Cells.Item[nbRow,13] := product.contract.number;
      xlsx.Cells.Item[nbRow,21] := product.test;
      xlsx.Cells.Item[nbRow,34] := product.num;
      numCount := numCount + product.num;
      wesCount := wesCount + product.weight;
      wecCount := wecCount + product.weightNet;
      xlsx.Cells.Item[nbRow,37] := product.weight;
      xlsx.Cells.Item[nbRow,40] := product.weightNet;
      if (product.contract.number <> tmpContract) then
      begin
      c := c +1;
      end;
      tmpContract := product.contract.number;
      Inc(nbRow);
    end;
  end;
  b := i + 27;
  product.Destroy;
  xlsx.Cells.Item[11,38] := date;
  xlsx.range['B'+nbRowStartAsStr+':BB'+nbRowAsStr].select;
  xlsx.selection.borders.linestyle := 1;
  //xlsx.range[xlsx.cells[106,2],xlsx.cells[106,20]].select;
  xlsx.range[xlsx.cells[b,13],xlsx.cells[b,16]].select;
  xlsx.Selection.mergeCells:=TRUE;
  xlsx.cells.item[b,13]:= c;
  xlsx.range[xlsx.cells[b,34],xlsx.cells[b,36]].select;
  xlsx.Selection.mergeCells:=TRUE;
  xlsx.cells.item[b,34]:= numcount;
  xlsx.range[xlsx.cells[b,37],xlsx.cells[b,39]].select;
  xlsx.Selection.mergeCells:=TRUE;
  xlsx.cells.item[b,37]:= wesCount;
  xlsx.range[xlsx.cells[b,40],xlsx.cells[b,42]].select;
  xlsx.Selection.mergeCells:=TRUE;
  xlsx.cells.item[b,40]:= wecCount;
  b := b + 2;
  xlsx.range[xlsx.cells[b,2],xlsx.cells[b,11]].select;
  xlsx.Selection.mergeCells:=TRUE;
  xlsx.cells.item[b,2]:= 'Председатель комисии:';
  xlsx.range[xlsx.cells[b,20],xlsx.cells[b,29]].select;
  xlsx.Selection.mergeCells:=TRUE;
  xlsx.cells.item[b,20].font.Underline :=TRUE;
  xlsx.cells.item[b,20]:= 'Директор';
  xlsx.range[xlsx.cells[b,31],xlsx.cells[b,39]].select;
  xlsx.Selection.mergeCells:=TRUE;
  xlsx.cells.item[b,31]:= '_____________';
  xlsx.range[xlsx.cells[b,40],xlsx.cells[b,55]].select;
  xlsx.Selection.mergeCells:=TRUE;
  xlsx.cells.item[b,40].font.Underline :=TRUE;
  xlsx.cells.item[b,40]:= 'Хисматов Руслан Рахимович';
  b := b + 1;
  xlsx.range[xlsx.cells[b,20],xlsx.cells[b,29]].select;
  xlsx.Selection.mergeCells:=TRUE;
  xlsx.cells.item[b,20]:= '(должность)';
  xlsx.range[xlsx.cells[b,31],xlsx.cells[b,39]].select;
  xlsx.Selection.mergeCells:=TRUE;
  xlsx.cells.item[b,31]:= '(подпись)';
  xlsx.range[xlsx.cells[b,40],xlsx.cells[b,55]].select;
  xlsx.Selection.mergeCells:=TRUE;
  xlsx.cells.item[b,40]:= '(фамилия и.о.)';
  b := b + 2;
  xlsx.range[xlsx.cells[b,2],xlsx.cells[b,11]].select;
  xlsx.Selection.mergeCells:=TRUE;
  xlsx.cells.item[b,2]:= 'Члены комисии:';
  xlsx.range[xlsx.cells[b,20],xlsx.cells[b,29]].select;
  xlsx.Selection.mergeCells:=TRUE;
  xlsx.cells.item[b,20].font.Underline :=TRUE;
  xlsx.cells.item[b,20]:= 'Главный Бухгалтер';
  xlsx.range[xlsx.cells[b,31],xlsx.cells[b,39]].select;
  xlsx.Selection.mergeCells:=TRUE;
  xlsx.cells.item[b,31]:= '_____________';
  xlsx.range[xlsx.cells[b,40],xlsx.cells[b,55]].select;
  xlsx.Selection.mergeCells:=TRUE;
  xlsx.cells.item[b,40].font.Underline :=TRUE;
  xlsx.cells.item[b,40]:= 'Филюшина Елена Николаевна';
  b := b + 1;
  xlsx.range[xlsx.cells[b,20],xlsx.cells[b,29]].select;
  xlsx.Selection.mergeCells:=TRUE;
  xlsx.cells.item[b,20]:= '(должность)';
  xlsx.range[xlsx.cells[b,31],xlsx.cells[b,39]].select;
  xlsx.Selection.mergeCells:=TRUE;
  xlsx.cells.item[b,31]:= '(подпись)';
  xlsx.range[xlsx.cells[b,40],xlsx.cells[b,55]].select;
  xlsx.Selection.mergeCells:=TRUE;
  xlsx.cells.item[b,40]:= '(фамилия и.о.)';
  b := b + 2;
  xlsx.range[xlsx.cells[b,20],xlsx.cells[b,30]].select;
  xlsx.Selection.mergeCells:=TRUE;
  xlsx.cells.item[b,20].font.Underline :=TRUE;
  xlsx.cells.item[b,20]:= 'Руководитель отделений';
  xlsx.range[xlsx.cells[b,31],xlsx.cells[b,39]].select;
  xlsx.Selection.mergeCells:=TRUE;
  xlsx.cells.item[b,31]:= '_____________';
  xlsx.range[xlsx.cells[b,40],xlsx.cells[b,55]].select;
  xlsx.Selection.mergeCells:=TRUE;
  xlsx.cells.item[b,40].font.Underline :=TRUE;
  xlsx.cells.item[b,40]:= 'Клименко Роман Анатольевич';
  b := b + 1;
  xlsx.range[xlsx.cells[b,20],xlsx.cells[b,29]].select;
  xlsx.Selection.mergeCells:=TRUE;
  xlsx.cells.item[b,20]:= '(должность)';
  xlsx.range[xlsx.cells[b,31],xlsx.cells[b,39]].select;
  xlsx.Selection.mergeCells:=TRUE;
  xlsx.cells.item[b,31]:= '(подпись)';
  xlsx.range[xlsx.cells[b,40],xlsx.cells[b,55]].select;
  xlsx.Selection.mergeCells:=TRUE;
  xlsx.cells.item[b,40]:= '(фамилия и.о.)';
  b := b + 2;
  xlsx.range[xlsx.cells[b,2],xlsx.cells[b,24]].select;
  xlsx.Selection.mergeCells:=TRUE;
  xlsx.cells.item[b,2]:= 'Все ценности в настоящем Инвентарном акте с № 1 по №';
  xlsx.range[xlsx.cells[b,25],xlsx.cells[b,26]].select;
  xlsx.Selection.HorizontalAlignment:=2;
  xlsx.Selection.mergeCells:=TRUE;
  xlsx.cells.item[b,25]:= i;
  xlsx.range[xlsx.cells[b,27],xlsx.cells[b,55]].select;
  xlsx.Selection.mergeCells:=TRUE;
  xlsx.cells.item[b,27]:= ', комиссией проверены в натуре в моем присутствии и внесены в акт,';
  b := b + 1;
  xlsx.range[xlsx.cells[b,2],xlsx.cells[b,55]].select;
  xlsx.Selection.mergeCells:=TRUE;
  xlsx.cells.item[b,2]:= 'в связи с чем претензий к инвентаризационной комиссии не имею.';
  b := b + 1;
  xlsx.range[xlsx.cells[b,2],xlsx.cells[b,55]].select;
  xlsx.Selection.mergeCells:=TRUE;
  xlsx.cells.item[b,2]:= 'Ценности, перечисленные в Акте, находятся на моем ответственном хранении';
  b := b + 1;
  xlsx.range[xlsx.cells[b,2],xlsx.cells[b,55]].select;
  xlsx.Selection.mergeCells:=TRUE;
  xlsx.cells.item[b,2]:= 'Материально ответственное лицо:';
  b := b + 1;
  xlsx.range[xlsx.cells[b,2],xlsx.cells[b,55]].select;
  xlsx.Selection.mergeCells:=TRUE;
  xlsx.cells.item[b,2]:= '"___"___________201__г.';
   b := b + 1;
  xlsx.range[xlsx.cells[b,2],xlsx.cells[b,25]].select;
  xlsx.Selection.mergeCells:=TRUE;
  xlsx.cells.item[b,2]:= 'Указанные в настоящем Акте данные и подсчеты проверил.';
  xlsx.range[xlsx.cells[b,31],xlsx.cells[b,39]].select;
  xlsx.Selection.mergeCells:=TRUE;
  xlsx.cells.item[b,31].font.Underline :=TRUE;
  xlsx.cells.item[b,31]:= 'Главный Бухгалтер';
  xlsx.range[xlsx.cells[b,40],xlsx.cells[b,50]].select;
  xlsx.Selection.mergeCells:=TRUE;
  xlsx.cells.item[b,40]:= '_____________';
  xlsx.range[xlsx.cells[b,40],xlsx.cells[b,50]].select;
  b := b + 1;
  xlsx.range[xlsx.cells[b,31],xlsx.cells[b,39]].select;
  xlsx.Selection.mergeCells:=TRUE;
  xlsx.cells.item[b,31]:= '(должность)';
  xlsx.range[xlsx.cells[b,40],xlsx.cells[b,50]].select;
  xlsx.Selection.mergeCells:=TRUE;
  xlsx.cells.item[b,40]:= '(подпись)';
  xlsx.range[xlsx.cells[b,2],xlsx.cells[b,20]].select;
  xlsx.Selection.mergeCells:=TRUE;
  xlsx.cells.item[b,2]:= '"___"___________201__г.';
  xlsx.Visible := True;
  end;

end.
