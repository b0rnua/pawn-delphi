object Form1: TForm1
  Left = 199
  Top = 121
  Width = 328
  Height = 521
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 8
    Top = 200
    Width = 3
    Height = 13
  end
  object btn1: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
    TabOrder = 0
    OnClick = btn1Click
  end
  object mmo1: TMemo
    Left = 8
    Top = 40
    Width = 305
    Height = 425
    Ctl3D = False
    ParentCtl3D = False
    ReadOnly = True
    TabOrder = 1
  end
  object pb1: TProgressBar
    Left = 8
    Top = 472
    Width = 305
    Height = 16
    TabOrder = 2
  end
  object idftp2: TIdFTP
    MaxLineAction = maException
    OnWork = idftp2Work
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    Left = 96
    Top = 8
  end
end
