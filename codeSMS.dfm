object Form4: TForm4
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1044#1072#1085#1085#1099#1077' '#1089#1084#1089
  ClientHeight = 92
  ClientWidth = 157
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object SMSLabel1: TLabel
    Left = 8
    Top = 8
    Width = 74
    Height = 16
    Caption = #1050#1086#1076' '#1080#1079' '#1057#1052#1057
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object SMSButton1: TButton
    Left = 8
    Top = 59
    Width = 139
    Height = 25
    Caption = #1054#1082
    TabOrder = 0
    OnClick = SMSButton1Click
  end
  object SMSEdit1: TEdit
    Left = 8
    Top = 30
    Width = 139
    Height = 19
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 1
  end
end
