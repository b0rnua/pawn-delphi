object contractChanges: TcontractChanges
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1103' '#1074' '#1076#1086#1075#1086#1074#1086#1088#1072#1093
  ClientHeight = 144
  ClientWidth = 209
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
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 87
    Height = 13
    Caption = #1053#1072#1095#1072#1083#1086' '#1087#1077#1088#1080#1086#1076#1072':'
  end
  object Label2: TLabel
    Left = 8
    Top = 54
    Width = 81
    Height = 13
    Caption = #1050#1086#1085#1077#1094' '#1087#1077#1088#1080#1086#1076#1072':'
  end
  object DateTimePicker1: TDateTimePicker
    Left = 16
    Top = 27
    Width = 186
    Height = 21
    Date = 41443.878180775460000000
    Time = 41443.878180775460000000
    TabOrder = 0
  end
  object DateTimePicker2: TDateTimePicker
    Left = 16
    Top = 73
    Width = 186
    Height = 21
    Date = 41443.878234641200000000
    Time = 41443.878234641200000000
    TabOrder = 1
  end
  object Button1: TButton
    Left = 127
    Top = 111
    Width = 75
    Height = 25
    Caption = #1055#1086#1082#1072#1079#1072#1090#1100
    TabOrder = 2
    OnClick = Button1Click
  end
end
