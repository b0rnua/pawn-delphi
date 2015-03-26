object chekInOut: TchekInOut
  Left = 792
  Top = 346
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1063#1077#1082' '#1047#1072#1083#1086#1075#1072'/'#1042#1099#1082#1091#1087#1072
  ClientHeight = 103
  ClientWidth = 295
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
  object sLabel1: TLabel
    Left = 8
    Top = 8
    Width = 62
    Height = 13
    Caption = #1057#1091#1084#1084#1072' '#1095#1077#1082#1072':'
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
    Width = 113
    Height = 35
    Hint = #1059#1084#1077#1085#1100#1096#1080#1090#1100' '#1089#1091#1084#1084#1091' '#13#10#1074' '#1082#1072#1089#1089#1086#1074#1086#1084' '#1072#1087#1087#1072#1088#1072#1090#1077
    Caption = #1056#1072#1089#1093#1086#1076'('#1079#1072#1083#1086#1075')'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 128
    Top = 56
    Width = 153
    Height = 35
    Hint = #1059#1074#1077#1083#1080#1095#1080#1090#1100' '#1089#1091#1084#1084#1091' '#13#10#1074' '#1082#1072#1089#1089#1086#1074#1086#1084' '#1072#1087#1087#1072#1088#1072#1090#1077
    Caption = #1055#1088#1080#1093#1086#1076#13#10'('#1074#1099#1082#1091#1087'/'#1087#1077#1088#1077#1079#1072#1083#1086#1075')'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Edit1: TEdit
    Left = 8
    Top = 24
    Width = 273
    Height = 21
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object ADOQuery1: TADOQuery
    Parameters = <>
    Left = 288
    Top = 65532
  end
end
