object RemovedFromStorage: TRemovedFromStorage
  Left = 454
  Top = 257
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1057#1085#1103#1090#1100' '#1089' '#1093#1088#1072#1085#1077#1085#1080#1103
  ClientHeight = 243
  ClientWidth = 379
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
  object lbl1: TLabel
    Left = 173
    Top = 42
    Width = 114
    Height = 13
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#8470' '#1076#1086#1075#1086#1074#1086#1088#1072':'
  end
  object Label1: TLabel
    Left = 161
    Top = 1
    Width = 33
    Height = 13
    Caption = #1044#1072#1090#1072' :'
  end
  object edt1: TEdit
    Left = 161
    Top = 58
    Width = 137
    Height = 21
    TabOrder = 0
  end
  object btn1: TButton
    Left = 152
    Top = 108
    Width = 137
    Height = 25
    Caption = #1048#1079#1098#1103#1090#1100' '#1080#1079#1076#1077#1083#1080#1103
    TabOrder = 1
    OnClick = btn1Click
  end
  object edt2: TEdit
    Left = 161
    Top = 18
    Width = 137
    Height = 21
    Enabled = False
    TabOrder = 3
  end
  object chk1: TCheckBox
    Left = 161
    Top = 82
    Width = 141
    Height = 20
    Caption = #1055#1077#1088#1077#1074#1077#1089#1090#1080' '#1085#1072' '#1089#1082#1083#1072#1076' '#1062#1054
    Checked = True
    State = cbChecked
    TabOrder = 2
  end
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 138
    Height = 123
    Color = clSkyBlue
    ParentBackground = False
    TabOrder = 4
    object Label2: TLabel
      Left = 24
      Top = 6
      Width = 89
      Height = 19
      Caption = #1055#1040#1056#1054#1051#1068' '#1052
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Button1: TButton
      Left = 24
      Top = 60
      Width = 89
      Height = 30
      Caption = #1042#1054#1049#1058#1048
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object Edit1: TEdit
      Left = 24
      Top = 29
      Width = 89
      Height = 27
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      PasswordChar = #8
      TabOrder = 1
    end
  end
  object q1: TADOQuery
    Parameters = <>
    Left = 318
    Top = 178
  end
end
