object outgoings: Toutgoings
  Left = 510
  Top = 137
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = #1056#1072#1089#1093#1086#1076
  ClientHeight = 163
  ClientWidth = 193
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
    Width = 35
    Height = 13
    Caption = #1057#1091#1084#1084#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object sLabel1: TLabel
    Left = 8
    Top = 32
    Width = 44
    Height = 13
    Caption = #1054#1090' '#1082#1086#1075#1086':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object sLabel2: TLabel
    Left = 8
    Top = 72
    Width = 29
    Height = 13
    Caption = #1050#1086#1084#1091':'
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
    Top = 135
    Width = 91
    Height = 25
    Caption = #1055#1086#1076#1090#1074#1077#1088#1076#1080#1090#1100
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 112
    Top = 136
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    OnClick = Button2Click
  end
  object chk1: TCheckBox
    Left = 16
    Top = 112
    Width = 129
    Height = 17
    Caption = #1058#1086#1083#1100#1082#1086' '#1087#1077#1095#1072#1090#1100' '#1095#1077#1082#1072
    TabOrder = 5
  end
  object Edit1: TEdit
    Left = 48
    Top = 8
    Width = 137
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
    TabOrder = 0
  end
  object sEdit2: TEdit
    Left = 8
    Top = 88
    Width = 177
    Height = 21
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    Text = #1062#1077#1085#1090#1088#1072#1083#1100#1085#1072' '#1082#1072#1089#1072' '#1055#1058'"'#1051#1054#1052#1041#1040#1056#1044' '#1047' '#1059#1063#1040#1057#1058#1070' '#1058#1054#1042'"'#1059#1050#1056' '#1050#1056#1045#1044#1048#1058' '#1057#1045#1056#1042#1030#1057'" '#1030' '#1050#1054'"'
  end
  object sEdit1: TEdit
    Left = 8
    Top = 48
    Width = 177
    Height = 21
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 100
    ParentFont = False
    TabOrder = 4
    Text = #1057#1083#1091#1078#1077#1073#1085#1086#1077' '#1080#1079#1100#1103#1090#1080#1077
  end
  object ADOQuery1: TADOQuery
    Parameters = <>
    Left = 152
    Top = 8
  end
end
