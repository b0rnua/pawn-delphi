object editTarif: TeditTarif
  Left = 313
  Top = 271
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = #1056#1077#1076#1072#1082#1090#1086#1088' '#1090#1072#1088#1080#1092#1086#1074
  ClientHeight = 231
  ClientWidth = 510
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 424
    Top = 200
    Width = 75
    Height = 25
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 344
    Top = 200
    Width = 75
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 1
  end
  object StringGrid1: TStringGrid
    Left = 3
    Top = 8
    Width = 500
    Height = 185
    ColCount = 32
    Ctl3D = False
    DefaultRowHeight = 16
    FixedCols = 0
    ParentCtl3D = False
    TabOrder = 2
    ColWidths = (
      56
      55
      31
      27
      23
      20
      25
      25
      27
      21
      26
      28
      25
      26
      25
      25
      23
      24
      23
      23
      20
      21
      20
      21
      25
      20
      28
      30
      26
      22
      27
      28)
  end
  object btn1: TButton
    Left = 264
    Top = 200
    Width = 75
    Height = 25
    Caption = 'btn1'
    TabOrder = 3
    OnClick = btn1Click
  end
  object q1: TADOQuery
    Connection = Form1.mainConnection
    Parameters = <>
    Left = 8
    Top = 200
  end
  object q2: TADOQuery
    Connection = Form1.mainConnection
    Parameters = <>
    Left = 40
    Top = 200
  end
end
