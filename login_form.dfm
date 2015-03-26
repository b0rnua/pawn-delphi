object login: Tlogin
  Left = 531
  Top = 318
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = #1042#1086#1081#1090#1080
  ClientHeight = 119
  ClientWidth = 319
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    319
    119)
  PixelsPerInch = 96
  TextHeight = 13
  object StaticText2: TLabel
    Left = 8
    Top = 59
    Width = 74
    Height = 13
    Caption = #1056#1072#1073#1086#1095#1072#1103' '#1076#1072#1090#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object StaticText1: TLabel
    Left = 8
    Top = 11
    Width = 60
    Height = 13
    Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object sLabel1: TLabel
    Left = 8
    Top = 35
    Width = 41
    Height = 13
    Caption = #1055#1072#1088#1086#1083#1100':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Button1: TButton
    Left = 230
    Top = 86
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 135
    Top = 86
    Width = 75
    Height = 25
    Caption = #1055#1088#1080#1085#1103#1090#1100
    TabOrder = 1
    OnClick = Button2Click
  end
  object Edit2: TEdit
    Left = 88
    Top = 58
    Width = 217
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
    ReadOnly = True
    TabOrder = 3
  end
  object sEdit1: TEdit
    Left = 88
    Top = 35
    Width = 217
    Height = 21
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 50
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 0
    OnKeyUp = sEdit1KeyUp
  end
  object ComboBox1: TComboBox
    AlignWithMargins = True
    Left = 88
    Top = 5
    Width = 217
    Height = 22
    AutoDropDown = True
    Style = csOwnerDrawFixed
    Anchors = [akLeft, akTop, akRight, akBottom]
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 4
    OnChange = ComboBox1Change
    OnCloseUp = ComboBox1CloseUp
  end
  object ADODataSet1: TADODataSet
    CursorType = ctStatic
    CommandText = 'SELECT * FROM employee WHERE hideEmployee=0'
    Parameters = <>
    Left = 8
    Top = 72
  end
  object DataSource1: TDataSource
    DataSet = ADODataSet1
    Left = 40
    Top = 72
  end
end
