object edtEmp: TedtEmp
  Left = 542
  Top = 272
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
  ClientHeight = 134
  ClientWidth = 289
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
  object lbltxt1: TLabel
    Left = 8
    Top = 0
    Width = 27
    Height = 13
    Caption = #1060#1048#1054':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object lbltxt3: TLabel
    Left = 152
    Top = 40
    Width = 93
    Height = 13
    Caption = #8470' '#1044#1086#1074#1077#1088#1077#1085#1085#1086#1089#1090#1080':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object lbltxt2: TLabel
    Left = 152
    Top = 0
    Width = 105
    Height = 13
    Caption = #1044#1072#1090#1072' '#1076#1086#1074#1077#1088#1077#1085#1085#1086#1089#1090#1080':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object lbltxt4: TLabel
    Left = 8
    Top = 40
    Width = 37
    Height = 13
    Caption = #1055#1072#1088#1086#1083#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object chk1: TCheckBox
    Left = 160
    Top = 80
    Width = 121
    Height = 17
    Caption = #1057#1082#1088#1099#1090#1100' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
    TabOrder = 3
  end
  object edt1: TEdit
    Left = 16
    Top = 16
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object edt3: TEdit
    Left = 160
    Top = 56
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object edt4: TEdit
    Left = 16
    Top = 56
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 2
  end
  object dtp1: TDateTimePicker
    Left = 160
    Top = 16
    Width = 121
    Height = 21
    Date = 40959.540863506940000000
    Time = 40959.540863506940000000
    TabOrder = 4
  end
  object btn1: TButton
    Left = 144
    Top = 104
    Width = 75
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 5
    OnClick = btn1Click
  end
  object btn2: TButton
    Left = 224
    Top = 104
    Width = 59
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 6
    OnClick = btn2Click
  end
  object chk2: TCheckBox
    Left = 16
    Top = 80
    Width = 113
    Height = 17
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1087#1072#1088#1086#1083#1100
    TabOrder = 7
    OnClick = chk2Click
  end
  object q1: TADOQuery
    Parameters = <>
    Left = 8
    Top = 104
  end
end
