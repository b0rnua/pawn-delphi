object month: Tmonth
  Left = 341
  Top = 129
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = #1050#1072#1089#1089#1072' '#1079#1072' '#1084#1077#1089#1103#1094
  ClientHeight = 89
  ClientWidth = 172
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
    Width = 81
    Height = 13
    Caption = #1059#1082#1072#1078#1080#1090#1077' '#1084#1077#1089#1103#1094':'
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
    Top = 56
    Width = 75
    Height = 25
    Caption = #1055#1086#1082#1072#1079#1072#1090#1100
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 88
    Top = 56
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    OnClick = Button2Click
  end
  object ComboBox1: TComboBox
    Left = 8
    Top = 24
    Width = 145
    Height = 21
    Color = clWhite
    Ctl3D = False
    ItemHeight = 13
    ParentCtl3D = False
    TabOrder = 0
    Items.Strings = (
      #1071#1085#1074#1072#1088#1100
      #1060#1077#1074#1088#1072#1083#1100
      #1052#1072#1088#1090
      #1040#1087#1088#1077#1083#1100
      #1052#1072#1081
      #1048#1102#1085#1100
      #1048#1102#1083#1100
      #1040#1074#1075#1091#1089#1090
      #1057#1077#1085#1090#1103#1073#1088#1100
      #1054#1082#1090#1103#1073#1088#1100
      #1053#1086#1103#1073#1088#1100
      #1044#1077#1082#1072#1073#1088#1100)
  end
end
