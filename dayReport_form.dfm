object dayReport: TdayReport
  Left = 268
  Top = 94
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = #1050#1072#1089#1089#1086#1074#1099#1081' '#1086#1090#1095#1077#1090' '#1079#1072' '#1076#1077#1085#1100
  ClientHeight = 92
  ClientWidth = 194
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object StaticText1: TLabel
    Left = 8
    Top = 8
    Width = 78
    Height = 13
    Caption = #1054#1090#1095#1077#1090' '#1079#1072' '#1076#1072#1090#1091':'
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
    Width = 97
    Height = 25
    Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 112
    Top = 56
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 1
    OnClick = Button2Click
  end
  object DTP1: TDateTimePicker
    Left = 8
    Top = 24
    Width = 144
    Height = 21
    Date = 41392.612425902780000000
    Time = 41392.612425902780000000
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
end
