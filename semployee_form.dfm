object semployee: Tsemployee
  Left = 393
  Top = 218
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1057#1087#1080#1089#1086#1082' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074' '#1086#1090#1076#1077#1083#1077#1085#1080#1103
  ClientHeight = 286
  ClientWidth = 469
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object strngrd1: TStringGrid
    Left = 8
    Top = 8
    Width = 453
    Height = 239
    Ctl3D = False
    DefaultRowHeight = 16
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
    ParentCtl3D = False
    TabOrder = 0
    ColWidths = (
      229
      69
      63
      31
      34)
  end
  object btn1: TButton
    Left = 8
    Top = 253
    Width = 75
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 1
    OnClick = btn1Click
  end
  object btn2: TButton
    Left = 89
    Top = 253
    Width = 97
    Height = 25
    Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
    TabOrder = 2
    OnClick = btn2Click
  end
  object Button1: TButton
    Left = 256
    Top = 253
    Width = 25
    Height = 25
    Caption = 'Button1'
    TabOrder = 3
    OnClick = Button1Click
  end
  object q1: TADOQuery
    Parameters = <>
    Left = 304
    Top = 248
  end
end
