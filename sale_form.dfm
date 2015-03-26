object sale: Tsale
  Left = 595
  Top = 275
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = #1055#1088#1080#1089#1074#1086#1080#1090#1100' '#1089#1082#1080#1076#1082#1091
  ClientHeight = 91
  ClientWidth = 146
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object txt1: TLabel
    Left = 8
    Top = 8
    Width = 86
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1082#1072#1088#1090#1086#1095#1082#1080':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object btn1: TButton
    Left = 8
    Top = 56
    Width = 75
    Height = 25
    Caption = #1055#1088#1080#1089#1074#1086#1080#1090#1100
    TabOrder = 1
    OnClick = btn1Click
  end
  object edt1: TEdit
    Left = 8
    Top = 24
    Width = 129
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
  object q1: TADOQuery
    Connection = Form1.mainConnection
    Parameters = <>
    Left = 104
    Top = 48
  end
end
