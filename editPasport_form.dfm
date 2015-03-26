object editPasport: TeditPasport
  Left = 532
  Top = 302
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = #1055#1072#1089#1087#1086#1088#1090' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1103
  ClientHeight = 201
  ClientWidth = 322
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object StaticText4: TLabel
    Left = 144
    Top = 72
    Width = 71
    Height = 13
    Caption = #1050#1086#1085#1077#1095#1085#1099#1081' '#8470':'
    Transparent = True
  end
  object StaticText3: TLabel
    Left = 16
    Top = 72
    Width = 77
    Height = 13
    Caption = #1053#1072#1095#1072#1083#1100#1085#1099#1081' '#8470':'
    Transparent = True
  end
  object StaticText1: TLabel
    Left = 16
    Top = 8
    Width = 43
    Height = 13
    Caption = #1051'.'#1054'. '#8470':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object StaticText2: TLabel
    Left = 16
    Top = 112
    Width = 118
    Height = 13
    Caption = #1055#1077#1088#1074#1099#1081' '#1089#1074#1086#1073#1086#1076#1085#1099#1081' '#8470':'
    Transparent = True
  end
  object StaticText5: TLabel
    Left = 144
    Top = 8
    Width = 35
    Height = 13
    Caption = #1043#1086#1088#1086#1076':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 56
    Width = 305
    Height = 105
    Caption = ' '#1044#1086#1075#1086#1074#1086#1088#1072' '
    TabOrder = 6
  end
  object Button1: TButton
    Left = 152
    Top = 168
    Width = 75
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 240
    Top = 168
    Width = 75
    Height = 25
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 1
    OnClick = Button2Click
  end
  object Edit1: TEdit
    Left = 16
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
    TabOrder = 2
  end
  object Edit2: TEdit
    Left = 16
    Top = 88
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
    TabOrder = 3
  end
  object Edit3: TEdit
    Left = 144
    Top = 88
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
    TabOrder = 4
  end
  object Edit4: TEdit
    Left = 16
    Top = 128
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
    TabOrder = 5
  end
  object Edit5: TEdit
    Left = 144
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
    TabOrder = 7
  end
  object QPasport: TADOQuery
    Connection = Form1.mainConnection
    Parameters = <>
    Left = 104
    Top = 48
  end
end
