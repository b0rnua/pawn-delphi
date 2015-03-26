object sbjct: Tsbjct
  Left = 306
  Top = 200
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1055#1088#1077#1076#1084#1077#1090#1099' '#1079#1072#1083#1086#1075#1072
  ClientHeight = 167
  ClientWidth = 296
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
  object strngrd1: TStringGrid
    Left = 1
    Top = 1
    Width = 201
    Height = 161
    ColCount = 1
    Ctl3D = False
    DefaultRowHeight = 16
    FixedCols = 0
    RowCount = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine]
    ParentCtl3D = False
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 0
    ColWidths = (
      197)
  end
  object btn1: TButton
    Left = 208
    Top = 8
    Width = 81
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 1
  end
  object btn2: TButton
    Left = 208
    Top = 40
    Width = 81
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100
    TabOrder = 2
  end
  object q1: TADOQuery
    Connection = Form1.mainConnection
    Parameters = <>
    Left = 248
    Top = 104
  end
end
