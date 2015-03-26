object cashBookForm: TcashBookForm
  Left = 423
  Top = 221
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1050#1072#1089#1089#1086#1074#1072#1103' '#1082#1085#1080#1075#1072
  ClientHeight = 324
  ClientWidth = 452
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
  object DateTimePicker1: TDateTimePicker
    Left = 8
    Top = 8
    Width = 169
    Height = 21
    Date = 41388.752134826390000000
    Time = 41388.752134826390000000
    TabOrder = 0
    OnChange = DateTimePicker1Change
  end
  object StringGrid1: TStringGrid
    Left = 8
    Top = 40
    Width = 441
    Height = 251
    ColCount = 6
    Ctl3D = False
    DefaultRowHeight = 16
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
    ParentCtl3D = False
    PopupMenu = PopupMenu1
    TabOrder = 1
    OnContextPopup = StringGrid1ContextPopup
    ColWidths = (
      28
      45
      62
      49
      232
      64)
  end
  object Button1: TButton
    Left = 280
    Top = 297
    Width = 169
    Height = 25
    Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1083#1080#1089#1090' '#1082#1072#1089#1089#1086#1074#1086#1081' '#1082#1085#1080#1075#1080
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 8
    Top = 297
    Width = 75
    Height = 25
    Caption = #1048#1089#1087#1088#1072#1074#1080#1090#1100
    TabOrder = 3
    OnClick = Button2Click
  end
  object PopupMenu1: TPopupMenu
    Left = 336
    Top = 208
    object printOrder: TMenuItem
      Caption = #1055#1077#1095#1072#1090#1072#1090#1100' '#1086#1088#1076#1077#1088
      OnClick = printOrderClick
    end
  end
end
