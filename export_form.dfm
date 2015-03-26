object exportbd: Texportbd
  Left = 387
  Top = 181
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093
  ClientHeight = 102
  ClientWidth = 177
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
  object StaticText1: TLabel
    Left = 24
    Top = 8
    Width = 121
    Height = 19
    Caption = #1044#1072#1090#1072' '#1101#1082#1089#1087#1086#1088#1090#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Button1: TButton
    Left = 8
    Top = 73
    Width = 75
    Height = 25
    Caption = #1069#1082#1089#1087#1086#1088#1090
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 94
    Top = 73
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    OnClick = Button2Click
  end
  object DateTimePicker1: TDateTimePicker
    Left = 24
    Top = 37
    Width = 128
    Height = 27
    Date = 41392.612426898150000000
    Time = 41392.612426898150000000
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
end
