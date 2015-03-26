object zperiod: Tzperiod
  Left = 566
  Top = 359
  BorderIcons = [biSystemMenu]
  Caption = 'Z-'#1054#1090#1095#1077#1090' '#1079#1072' '#1087#1077#1088#1080#1086#1076
  ClientHeight = 138
  ClientWidth = 180
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
  object sLabel1: TLabel
    Left = 8
    Top = 8
    Width = 41
    Height = 13
    Caption = #1057' '#1076#1072#1090#1099':'
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
    Top = 56
    Width = 45
    Height = 13
    Caption = #1055#1086' '#1076#1072#1090#1091':'
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
    Top = 104
    Width = 75
    Height = 25
    Caption = #1055#1077#1095#1072#1090#1100
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 96
    Top = 104
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 3
    OnClick = Button2Click
  end
  object sDateEdit1: TDateTimePicker
    Left = 16
    Top = 24
    Width = 153
    Height = 21
    Date = 41392.612428819450000000
    Time = 41392.612428819450000000
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object sDateEdit2: TDateTimePicker
    Left = 16
    Top = 72
    Width = 153
    Height = 21
    Date = 41392.612429027780000000
    Time = 41392.612429027780000000
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
end
