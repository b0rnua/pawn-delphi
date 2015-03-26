object editContractOperation: TeditContractOperation
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1089#1091#1084#1084#1099
  ClientHeight = 203
  ClientWidth = 356
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 29
    Width = 74
    Height = 13
    Caption = #1058#1077#1083#1086' '#1082#1088#1077#1076#1080#1090#1072':'
  end
  object Label2: TLabel
    Left = 94
    Top = 29
    Width = 49
    Height = 13
    Caption = #1057#1091#1084#1084#1072' %:'
  end
  object Label3: TLabel
    Left = 180
    Top = 29
    Width = 62
    Height = 13
    Caption = #1057#1091#1084#1084#1072' '#1087#1077#1085#1080':'
  end
  object Label4: TLabel
    Left = 8
    Top = 10
    Width = 193
    Height = 13
    Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1089#1091#1084#1084' '#1087#1086' '#1076#1086#1075#1086#1074#1086#1088#1091' '#8470
  end
  object Label5: TLabel
    Left = 207
    Top = 10
    Width = 37
    Height = 13
    Caption = 'Label5'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 8
    Top = 85
    Width = 147
    Height = 13
    Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081' ('#1086#1073#1103#1079#1072#1090#1077#1083#1100#1085#1086'):'
  end
  object Label7: TLabel
    Left = 266
    Top = 29
    Width = 91
    Height = 13
    Caption = #1057#1091#1084#1084#1072' '#1086#1090' '#1082#1083#1080#1077#1085#1090#1072
  end
  object Edit1: TEdit
    Left = 8
    Top = 48
    Width = 80
    Height = 19
    Ctl3D = False
    ParentCtl3D = False
    ReadOnly = True
    TabOrder = 0
    Text = '0'
  end
  object Edit2: TEdit
    Left = 94
    Top = 48
    Width = 80
    Height = 19
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 1
    Text = '0'
    OnChange = Edit2Change
  end
  object Edit3: TEdit
    Left = 180
    Top = 48
    Width = 80
    Height = 19
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 2
    Text = '0'
    OnChange = Edit3Change
  end
  object Memo1: TMemo
    Left = 8
    Top = 104
    Width = 252
    Height = 89
    Ctl3D = False
    MaxLength = 250
    ParentCtl3D = False
    TabOrder = 3
  end
  object Button1: TButton
    Left = 273
    Top = 102
    Width = 75
    Height = 43
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 4
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 272
    Top = 151
    Width = 75
    Height = 42
    Caption = #1054#1090#1084#1077#1085#1080#1090#1100
    TabOrder = 5
    OnClick = Button2Click
  end
  object Edit4: TEdit
    Left = 266
    Top = 48
    Width = 82
    Height = 19
    Ctl3D = False
    ParentCtl3D = False
    ReadOnly = True
    TabOrder = 6
    Text = '0'
  end
end
