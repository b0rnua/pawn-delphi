object openday: Topenday
  Left = 310
  Top = 250
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1088#1072#1073#1086#1095#1091#1102' '#1076#1072#1090#1091
  ClientHeight = 98
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
    Left = 8
    Top = 8
    Width = 130
    Height = 13
    Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1088#1072#1073#1086#1095#1091#1102' '#1076#1072#1090#1091':'
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
    Top = 64
    Width = 75
    Height = 25
    Caption = #1055#1088#1080#1085#1103#1090#1100
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 96
    Top = 64
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    OnClick = Button2Click
  end
  object DateTimePicker1: TDateTimePicker
    Left = 8
    Top = 32
    Width = 128
    Height = 21
    Date = 41392.612426678240000000
    Time = 41392.612426678240000000
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
end
