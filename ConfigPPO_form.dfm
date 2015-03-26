object ConfigPPO: TConfigPPO
  Left = 540
  Top = 126
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1056#1056#1054
  ClientHeight = 97
  ClientWidth = 217
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
    Left = 91
    Top = 8
    Width = 3
    Height = 13
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object txt1: TLabel
    Left = 8
    Top = 32
    Width = 76
    Height = 13
    Caption = #8470' COM '#1087#1086#1088#1090#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object txt2: TLabel
    Left = 8
    Top = 8
    Width = 63
    Height = 13
    Caption = #1057#1090#1072#1090#1091#1089' '#1056#1056#1054':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object btn1: TButton
    Left = 48
    Top = 64
    Width = 75
    Height = 25
    Caption = #1055#1086#1076#1082#1083#1102#1095#1080#1090#1100
    TabOrder = 1
    OnClick = btn1Click
  end
  object btn2: TButton
    Left = 136
    Top = 64
    Width = 75
    Height = 25
    Caption = #1054#1090#1082#1083#1102#1095#1080#1090#1100
    TabOrder = 2
    OnClick = btn2Click
  end
  object edt1: TEdit
    Left = 88
    Top = 32
    Width = 121
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
end
