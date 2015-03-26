object changepsw: Tchangepsw
  Left = 191
  Top = 126
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1087#1072#1088#1086#1083#1100
  ClientHeight = 129
  ClientWidth = 178
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
  object StaticText1: TLabel
    Left = 8
    Top = 8
    Width = 82
    Height = 13
    Caption = #1057#1090#1072#1088#1099#1081' '#1087#1072#1088#1086#1083#1100':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object StaticText2: TLabel
    Left = 8
    Top = 48
    Width = 76
    Height = 13
    Caption = #1053#1086#1074#1099#1081' '#1087#1072#1088#1086#1083#1100':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Button1: TButton
    Left = 8
    Top = 96
    Width = 75
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 96
    Top = 96
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1080#1090#1100
    TabOrder = 1
    OnClick = Button2Click
  end
  object MaskEdit1: TMaskEdit
    Left = 8
    Top = 24
    Width = 121
    Height = 21
    Color = clWhite
    Ctl3D = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 2
  end
  object MaskEdit2: TMaskEdit
    Left = 8
    Top = 64
    Width = 121
    Height = 21
    Color = clWhite
    Ctl3D = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 3
  end
  object ADOQuery1: TADOQuery
    Connection = Form1.mainConnection
    Parameters = <>
    Left = 144
    Top = 56
  end
end
