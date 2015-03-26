object answer: Tanswer
  Left = 529
  Top = 287
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = #1054#1041#1071#1047#1040#1058#1045#1051#1068#1053#1054' '#1055#1056#1054#1063#1048#1058#1040#1058#1068' '#1048' '#1055#1056#1048#1052#1045#1053#1071#1058#1068' '#1042' '#1056#1040#1041#1054#1058#1045
  ClientHeight = 150
  ClientWidth = 396
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object CheckBox1: TCheckBox
    Left = 18
    Top = 100
    Width = 303
    Height = 17
    Caption = #1054#1079#1085#1072#1082#1086#1084#1083#1077#1085'('#1072') '#1089' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1077#1081' '
    TabOrder = 0
  end
  object Button1: TButton
    Left = 296
    Top = 120
    Width = 75
    Height = 25
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 1
    OnClick = Button1Click
  end
  object GroupBox1: TGroupBox
    Left = 2
    Top = 2
    Width = 391
    Height = 89
    Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1076#1083#1103' '#1086#1079#1085#1072#1082#1086#1084#1083#1077#1085#1080#1103
    TabOrder = 2
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 160
      Height = 13
      Cursor = crHandPoint
      Hint = #1050#1083#1080#1082#1085#1091#1090#1100' '#1076#1083#1103' '#1087#1088#1086#1095#1090#1077#1085#1080#1103
      Caption = '- '#1054#1090#1074#1077#1090#1099' '#1085#1072' '#1086#1089#1085#1086#1074#1085#1099#1077' '#1074#1086#1087#1088#1086#1089#1099
      ParentShowHint = False
      ShowHint = True
      OnClick = Label1Click
      OnMouseMove = Label1MouseMove
      OnMouseLeave = Label1MouseLeave
    end
    object Label2: TLabel
      Left = 16
      Top = 44
      Width = 259
      Height = 13
      Cursor = crHandPoint
      Hint = #1050#1083#1080#1082#1085#1091#1090#1100' '#1076#1083#1103' '#1087#1088#1086#1095#1090#1077#1085#1080#1103
      Caption = '- '#1054#1073#1089#1083#1091#1078#1080#1074#1072#1085#1080#1077' '#1079#1072#1105#1084#1097#1080#1082#1086#1074' '#1080' '#1087#1086#1083#1091#1095#1077#1085#1080#1077' '#1041#1054#1053#1059#1057#1054#1042
      ParentShowHint = False
      ShowHint = True
      OnClick = Label2Click
      OnMouseMove = Label1MouseMove
      OnMouseLeave = Label1MouseLeave
    end
    object Label3: TLabel
      Left = 8
      Top = 70
      Width = 376
      Height = 13
      Caption = #1044#1083#1103' '#1087#1088#1086#1095#1090#1077#1085#1080#1103' '#1082#1083#1080#1082#1085#1091#1090#1100' '#1083#1077#1074#1086#1081' '#1082#1085#1086#1087#1082#1086#1081' '#1084#1099#1096#1080' '#1085#1072' '#1080#1085#1090#1077#1088#1077#1089#1091#1102#1097#1091#1102' '#1089#1090#1072#1090#1100#1102
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsItalic]
      ParentFont = False
    end
  end
end
