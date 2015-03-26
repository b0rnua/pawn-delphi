object closeOp: TcloseOp
  Left = 407
  Top = 271
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = #1047#1072#1082#1088#1099#1090#1099#1077' '#1086#1087#1077#1088#1072#1094#1080#1080
  ClientHeight = 80
  ClientWidth = 169
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
  object StaticText1: TLabel
    Left = 8
    Top = 8
    Width = 101
    Height = 13
    Caption = #1055#1072#1088#1086#1083#1100' '#1084#1077#1085#1077#1076#1078#1077#1088#1072':'
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
    Top = 48
    Width = 75
    Height = 25
    Caption = #1055#1088#1080#1085#1103#1090#1100
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 88
    Top = 48
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    OnClick = Button2Click
  end
  object MaskEdit1: TMaskEdit
    Left = 8
    Top = 24
    Width = 153
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
    PasswordChar = '*'
    TabOrder = 0
    OnKeyUp = MaskEdit1KeyUp
  end
  object ADOQuery1: TADOQuery
    Parameters = <>
    Left = 88
    Top = 8
  end
end
