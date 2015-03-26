object Form7: TForm7
  Left = 0
  Top = 0
  Caption = 'Form7'
  ClientHeight = 565
  ClientWidth = 1354
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ContractGrid: TStringGrid
    Left = 0
    Top = 0
    Width = 1337
    Height = 81
    ColCount = 23
    FixedCols = 0
    RowCount = 2
    TabOrder = 0
    ColWidths = (
      42
      42
      37
      64
      64
      64
      64
      64
      64
      64
      64
      64
      64
      64
      64
      64
      64
      64
      64
      64
      64
      64
      64)
  end
  object ProductGrid: TStringGrid
    Left = 0
    Top = 213
    Width = 1337
    Height = 92
    ColCount = 13
    FixedCols = 0
    RowCount = 2
    TabOrder = 1
  end
  object DelivererGrid: TStringGrid
    Left = 0
    Top = 311
    Width = 1009
    Height = 120
    ColCount = 15
    FixedCols = 0
    RowCount = 2
    TabOrder = 2
  end
  object OperationGrid: TStringGrid
    Left = 0
    Top = 87
    Width = 1009
    Height = 120
    ColCount = 8
    FixedCols = 0
    RowCount = 2
    TabOrder = 3
    ColWidths = (
      46
      54
      116
      80
      80
      97
      86
      193)
  end
end
