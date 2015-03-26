object logo: Tlogo
  Left = 873
  Top = 530
  BorderStyle = bsNone
  Caption = 'logo'
  ClientHeight = 157
  ClientWidth = 197
  Color = clRed
  TransparentColor = True
  TransparentColorValue = clRed
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 8
    Top = 10
    Width = 185
    Height = 141
    Align = alCustom
  end
  object Panel1: TPanel
    Left = 8
    Top = 170
    Width = 225
    Height = 31
    TabOrder = 0
    object Label2: TLabel
      Left = 24
      Top = 8
      Width = 115
      Height = 13
      Caption = #1089#1077#1082'. '#1076#1086' '#1079#1072#1082#1088#1099#1090#1080#1103' '#1086#1082#1085#1072
    end
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 12
      Height = 13
      Caption = '60'
    end
    object Button1: TButton
      Left = 150
      Top = 0
      Width = 75
      Height = 31
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object Timer1: TTimer
    Interval = 2000
    OnTimer = Timer1Timer
    Left = 16
    Top = 16
  end
  object Timer2: TTimer
    Enabled = False
    OnTimer = Timer2Timer
    Left = 208
    Top = 140
  end
end
