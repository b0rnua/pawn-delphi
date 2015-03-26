object inventar: Tinventar
  Left = 385
  Top = 220
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = #1048#1085#1074#1077#1085#1090#1072#1088#1080#1079#1072#1094#1080#1086#1085#1085#1072#1103' '#1074#1077#1076#1086#1084#1086#1089#1090#1100
  ClientHeight = 85
  ClientWidth = 204
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
  object txt1: TLabel
    Left = 8
    Top = 8
    Width = 101
    Height = 13
    Caption = #1042#1077#1076#1086#1084#1086#1089#1090#1100' '#1085#1072' '#1076#1072#1090#1091':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object btn1: TButton
    Left = 9
    Top = 54
    Width = 62
    Height = 25
    Caption = #1053#1086#1074#1072#1103'(XLS)'
    TabOrder = 1
    OnClick = btn1Click
  end
  object btn2: TButton
    Left = 132
    Top = 54
    Width = 62
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    OnClick = btn2Click
  end
  object dtp1: TDateTimePicker
    Left = 9
    Top = 27
    Width = 185
    Height = 21
    Date = 41392.612427418980000000
    Time = 41392.612427418980000000
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object Button1: TButton
    Left = 71
    Top = 54
    Width = 62
    Height = 25
    Caption = #1057#1090#1072#1088#1072#1103
    TabOrder = 3
    OnClick = Button1Click
  end
end
