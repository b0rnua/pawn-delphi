object deliverer: Tdeliverer
  Left = 294
  Top = 170
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1057#1055#1056#1040#1042#1054#1063#1053#1048#1050' '#1050#1051#1048#1045#1053#1058#1054#1042
  ClientHeight = 405
  ClientWidth = 516
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StringGrid1: TStringGrid
    Left = 0
    Top = 87
    Width = 1017
    Height = 281
    ColCount = 13
    Ctl3D = False
    DefaultRowHeight = 16
    FixedCols = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
    ParentCtl3D = False
    PopupMenu = pm1
    TabOrder = 1
    OnContextPopup = StringGrid1ContextPopup
    OnDrawCell = StringGrid1DrawCell
  end
  object btn1: TButton
    Left = 8
    Top = 374
    Width = 75
    Height = 25
    BiDiMode = bdRightToLeftNoAlign
    Caption = #1042#1099#1073#1088#1072#1090#1100
    Enabled = False
    ParentBiDiMode = False
    TabOrder = 2
    OnClick = btn1Click
  end
  object btn2: TButton
    Left = 96
    Top = 374
    Width = 75
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 3
    OnClick = btn2Click
  end
  object btn3: TButton
    Left = 207
    Top = 374
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 4
    OnClick = btn3Click
  end
  object grp1: TGroupBox
    Left = 6
    Top = 1
    Width = 1009
    Height = 83
    Caption = #1055#1086#1080#1089#1082' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    object lbltxt1: TLabel
      Left = 8
      Top = 24
      Width = 42
      Height = 13
      Caption = #1087#1086' '#1060#1048#1054':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object lbl1: TLabel
      Left = 8
      Top = 51
      Width = 80
      Height = 13
      Caption = #1087#1086' # '#1090#1077#1083#1077#1092#1086#1085#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label2: TLabel
      Left = 882
      Top = 9
      Width = 118
      Height = 13
      Caption = #1055#1072#1088#1086#1083#1100' '#1052#1077#1085#1077#1076#1078#1077#1088#1072
    end
    object Edit1: TEdit
      Left = 882
      Top = 27
      Width = 118
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      PasswordChar = #7
      TabOrder = 0
      OnKeyPress = Edit1KeyPress
    end
    object Button1: TButton
      Left = 882
      Top = 52
      Width = 118
      Height = 25
      Caption = #1042#1074#1077#1089#1090#1080
      TabOrder = 1
      OnClick = Button1Click
    end
    object Edit2: TEdit
      Left = 107
      Top = 21
      Width = 201
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 2
      OnChange = Edit2Change
    end
    object Edit3: TEdit
      Left = 107
      Top = 48
      Width = 201
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 3
      OnChange = Edit3Change
    end
  end
  object DiscountGrid: TStringGrid
    Left = 0
    Top = 85
    Width = 977
    Height = 283
    BevelInner = bvSpace
    ColCount = 12
    Ctl3D = False
    DefaultColWidth = 70
    DefaultRowHeight = 16
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
    ParentCtl3D = False
    PopupMenu = pm2
    TabOrder = 6
    OnContextPopup = DiscountGridContextPopup
    OnDrawCell = DiscountGridDrawCell
  end
  object Button4: TButton
    Left = 121
    Top = 416
    Width = 216
    Height = 25
    Caption = #1053#1086#1074#1099#1081' '#1089#1087#1080#1089#1086#1082' ('#1087#1086#1082#1072#1079#1072#1090#1100'/'#1089#1082#1088#1099#1090#1100')'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    OnClick = Button4Click
  end
  object DelivererGrid: TStringGrid
    Left = 0
    Top = 84
    Width = 513
    Height = 278
    ColCount = 4
    FixedCols = 0
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
    ParentFont = False
    PopupMenu = pm3
    ScrollBars = ssVertical
    TabOrder = 0
    OnContextPopup = DelivererGridContextPopup
    OnDrawCell = DelivererGridDrawCell
    ColWidths = (
      281
      158
      2
      64)
  end
  object Button2: TButton
    Left = 343
    Top = 416
    Width = 75
    Height = 25
    Caption = 'DelivGrid'
    TabOrder = 8
    OnClick = Button2Click
  end
  object q1: TADOQuery
    Parameters = <>
    Left = 16
    Top = 408
  end
  object pm1: TPopupMenu
    OwnerDraw = True
    Left = 52
    Top = 408
    object N28: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      OnClick = N28Click
    end
    object N1: TMenuItem
      Caption = #1055#1077#1095#1072#1090#1072#1090#1100' '#1072#1085#1082#1077#1090#1091
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1042#1089#1077' '#1076#1086#1075#1086#1074#1086#1088#1072' '#1082#1083#1080#1077#1085#1090#1072
      OnClick = N2Click
    end
    object EST1: TMenuItem
      Caption = #1050#1054#1044' '#1076#1083#1103' +240'
    end
  end
  object pm2: TPopupMenu
    OnPopup = pm2Popup
    Left = 88
    Top = 408
    object SILVER1: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' SILVER'
      OnClick = SILVER1Click
    end
    object GOLD1: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' GOLD'
      OnClick = GOLD1Click
    end
    object VIP1: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' VIP'
      OnClick = VIP1Click
    end
    object N3: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1040#1085#1082#1077#1090#1091
      OnClick = N3Click
    end
    object N5: TMenuItem
      Caption = #1055#1077#1095#1072#1090#1072#1090#1100' '#1040#1085#1082#1077#1090#1091
      OnClick = N5Click
    end
    object N4: TMenuItem
      Caption = #1042#1089#1077' '#1076#1086#1075#1086#1074#1086#1088#1072' '#1082#1083#1080#1077#1085#1090#1072
      OnClick = N4Click
    end
    object N2401: TMenuItem
      Caption = #1050#1086#1076' '#1076#1083#1103' +240'
      OnClick = N2401Click
    end
    object ChekIT1: TMenuItem
      Caption = #1055#1088#1086#1074#1077#1088#1080#1090#1100
      OnClick = ChekIT1Click
    end
  end
  object pm3: TPopupMenu
    Left = 344
    Top = 376
    object N6: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      OnClick = N6Click
    end
    object N7: TMenuItem
      Caption = #1056#1072#1089#1087#1077#1095#1072#1090#1072#1090#1100' '#1040#1085#1082#1077#1090#1091
      OnClick = N7Click
    end
    object N9: TMenuItem
      Caption = #1057#1087#1080#1089#1086#1082' '#1044#1086#1075#1086#1074#1086#1088#1086#1074
      OnClick = N9Click
    end
  end
end
