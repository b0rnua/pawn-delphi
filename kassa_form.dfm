object kassa: Tkassa
  Left = 534
  Top = 154
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1050#1072#1089#1089#1086#1074#1072#1103' '#1082#1085#1080#1075#1072
  ClientHeight = 218
  ClientWidth = 314
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
    Width = 30
    Height = 13
    Caption = #1044#1072#1090#1072':'
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
    Top = 40
    Width = 53
    Height = 13
    Caption = #1057#1090#1088#1072#1085#1080#1094#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object StringGrid1: TStringGrid
    Left = 0
    Top = 72
    Width = 313
    Height = 145
    ColCount = 3
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
      168
      92
      16)
  end
  object Button1: TButton
    Left = 184
    Top = 40
    Width = 129
    Height = 25
    Caption = #1055#1077#1095#1072#1090#1072#1090#1100' '#1082#1072#1089#1089#1091' '
    TabOrder = 2
    OnClick = Button1Click
  end
  object sEdit1: TEdit
    Left = 64
    Top = 40
    Width = 113
    Height = 21
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object sDateEdit1: TDateTimePicker
    Left = 48
    Top = 8
    Width = 129
    Height = 21
    Date = 41392.612428530090000000
    Time = 41392.612428530090000000
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnChange = sDateEdit1Change
  end
  object q1: TADOQuery
    Parameters = <>
    Left = 200
    Top = 8
  end
  object PopupMenu1: TPopupMenu
    Left = 240
    Top = 8
    object N1: TMenuItem
      Caption = #1055#1077#1095#1072#1090#1100' '#1086#1088#1076#1077#1088#1086#1074
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1089#1091#1084#1084#1091
      Enabled = False
    end
    object N3: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1086#1087#1077#1088#1072#1094#1080#1102
      Enabled = False
    end
    object N4: TMenuItem
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1086#1088#1076#1077#1088#1072' '#1087#1086' '#1074#1089#1077#1084' '#1086#1087'.'
      OnClick = N4Click
    end
  end
  object q2: TADOQuery
    Parameters = <>
    Left = 280
    Top = 8
  end
end
