object uslv: Tuslv
  Left = 204
  Top = 81
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = #1055#1088#1086#1089#1088#1086#1095#1077#1085#1085#1099#1077' '#1076#1086#1075#1086#1074#1086#1088#1072
  ClientHeight = 526
  ClientWidth = 481
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 208
    Top = 440
    Width = 3
    Height = 13
  end
  object Label2: TLabel
    Left = 296
    Top = 440
    Width = 3
    Height = 13
  end
  object Label3: TLabel
    Left = 384
    Top = 440
    Width = 3
    Height = 13
  end
  object Label4: TLabel
    Left = 112
    Top = 448
    Width = 3
    Height = 13
  end
  object Label5: TLabel
    Left = 88
    Top = 472
    Width = 3
    Height = 13
  end
  object StaticText1: TLabel
    Left = 8
    Top = 8
    Width = 160
    Height = 13
    Caption = #1048#1089#1090#1105#1082#1096#1080#1081' '#1089#1088#1086#1082' '#1079#1072#1083#1086#1075#1072' '#1085#1072' '#1076#1072#1090#1091':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object StaticText2: TLabel
    Left = 184
    Top = 8
    Width = 123
    Height = 13
    Caption = #1050#1086#1083'-'#1074#1086' '#1076#1085#1077#1081' '#1087#1088#1086#1089#1088#1086#1095#1082#1080':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object StaticText3: TLabel
    Left = 8
    Top = 448
    Width = 96
    Height = 13
    Caption = #1050#1086#1083'-'#1074#1086' '#1076#1086#1075#1086#1074#1086#1088#1086#1074':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object StaticText4: TLabel
    Left = 8
    Top = 472
    Width = 71
    Height = 13
    Caption = #1054#1073#1097#1072#1103' '#1089#1091#1084#1084#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Button1: TButton
    Left = 309
    Top = 8
    Width = 75
    Height = 37
    Caption = #1054#1090#1086#1073#1088#1072#1079#1080#1090#1100
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 239
    Top = 463
    Width = 75
    Height = 55
    Caption = #1055#1086#1076#1090#1074#1077#1088#1076#1080#1090#1100
    TabOrder = 3
    Visible = False
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 400
    Top = 464
    Width = 75
    Height = 55
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 4
    OnClick = Button3Click
  end
  object StringGrid1: TStringGrid
    Left = 8
    Top = 56
    Width = 465
    Height = 377
    ColCount = 9
    Ctl3D = False
    DefaultColWidth = 87
    DefaultRowHeight = 16
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
    ParentCtl3D = False
    PopupMenu = PopupMenu1
    ScrollBars = ssVertical
    TabOrder = 5
    OnContextPopup = StringGrid1ContextPopup
    ColWidths = (
      23
      87
      87
      87
      48
      57
      87
      87
      87)
  end
  object BitBtn1: TBitBtn
    Left = 320
    Top = 464
    Width = 75
    Height = 55
    Caption = #1074' Excel'
    TabOrder = 6
    OnClick = BitBtn1Click
  end
  object CheckBox1: TCheckBox
    Left = 48
    Top = 501
    Width = 217
    Height = 17
    Caption = #1055#1045#1063#1040#1058#1040#1058#1068' '#1056#1040#1057#1061#1054#1044
    TabOrder = 8
    Visible = False
  end
  object Edit1: TEdit
    Left = 8
    Top = 24
    Width = 121
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
    TabOrder = 0
    Visible = False
  end
  object Edit2: TEdit
    Left = 184
    Top = 24
    Width = 121
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
    TabOrder = 1
  end
  object DateTimePicker1: TDateTimePicker
    Left = 8
    Top = 25
    Width = 161
    Height = 21
    BevelInner = bvNone
    BevelOuter = bvNone
    Date = 41330.521779571760000000
    Time = 41330.521779571760000000
    TabOrder = 7
  end
  object Button4: TButton
    Left = 387
    Top = 8
    Width = 92
    Height = 37
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1086' '#8470
    TabOrder = 9
    OnClick = Button4Click
  end
  object ADOQuery1: TADOQuery
    Parameters = <>
    Left = 152
    Top = 444
  end
  object PopupMenu1: TPopupMenu
    Left = 192
    Top = 444
    object N1: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnClick = N1Click
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object N2: TMenuItem
      Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1082#1083#1080#1077#1085#1090#1077
      OnClick = N2Click
    end
    object N4: TMenuItem
      Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1076#1086#1075#1086#1074#1086#1088#1077
      OnClick = N4Click
    end
  end
end
