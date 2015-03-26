object config: Tconfig
  Left = 416
  Top = 187
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
  ClientHeight = 492
  ClientWidth = 424
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
  object pgc1: TPageControl
    Left = 24
    Top = 8
    Width = 409
    Height = 409
    ActivePage = TabSheet1
    MultiLine = True
    TabOrder = 0
    object ts1: TTabSheet
      Caption = #1055#1072#1089#1087#1086#1088#1090' '#1086#1090#1076#1077#1083#1077#1085#1080#1103
      OnShow = ts1Show
      object grp1: TGroupBox
        Left = 0
        Top = 79
        Width = 401
        Height = 139
        Caption = #1053#1091#1084#1077#1088#1072#1094#1080#1103' '#1076#1086#1075#1086#1074#1086#1088#1086#1074'/'#1086#1088#1076#1077#1088#1086#1074' '
        TabOrder = 0
        object txt8: TLabel
          Left = 8
          Top = 52
          Width = 119
          Height = 13
          Caption = #8470' '#1088#1072#1089#1093#1086#1076#1085#1086#1075#1086' '#1086#1088#1076#1077#1088#1072':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object txt2: TLabel
          Left = 8
          Top = 12
          Width = 77
          Height = 13
          Caption = #1053#1072#1095#1072#1083#1100#1085#1099#1081' '#8470':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object txt1: TLabel
          Left = 136
          Top = 12
          Width = 71
          Height = 13
          Caption = #1050#1086#1085#1077#1095#1085#1099#1081' '#8470':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object txt4: TLabel
          Left = 264
          Top = 12
          Width = 118
          Height = 13
          Caption = #1055#1077#1088#1074#1099#1081' '#1089#1074#1086#1073#1086#1076#1085#1099#1081' '#8470':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object sLabel5: TLabel
          Left = 264
          Top = 52
          Width = 81
          Height = 13
          Caption = #8470' '#1076#1086#1087#1086#1083#1085#1077#1085#1080#1103':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label2: TLabel
          Left = 135
          Top = 52
          Width = 120
          Height = 13
          Caption = #8470' '#1087#1088#1080#1093#1086#1076#1085#1086#1075#1086' '#1086#1088#1076#1077#1088#1072':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label3: TLabel
          Left = 262
          Top = 93
          Width = 85
          Height = 13
          Caption = #1053#1086#1084#1077#1088' '#1057#1090#1088#1072#1085#1080#1094#1099
        end
        object Label4: TLabel
          Left = 135
          Top = 88
          Width = 59
          Height = 13
          Caption = #1044#1072#1090#1072' '#1050#1085#1080#1075#1080
        end
        object Label5: TLabel
          Left = 3
          Top = 123
          Width = 191
          Height = 13
          Caption = #1044#1072#1090#1091' '#1085#1072#1076#1086' '#1089#1090#1072#1074#1080#1090#1100' '#1085#1072' 1 '#1076#1077#1085#1100' '#1084#1077#1085#1100#1096#1077
        end
        object Edt19: TEdit
          Left = 262
          Top = 111
          Width = 119
          Height = 21
          TabOrder = 0
          Text = 'Edt19'
        end
        object Edt20: TEdit
          Left = 135
          Top = 103
          Width = 121
          Height = 21
          TabOrder = 1
          Text = 'Edt20'
        end
      end
      object btn1: TButton
        Left = 0
        Top = 336
        Width = 75
        Height = 25
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        TabOrder = 1
        OnClick = btn1Click
      end
      object grp2: TGroupBox
        Left = 0
        Top = 0
        Width = 401
        Height = 73
        Caption = #1054#1073#1097#1080#1077
        TabOrder = 7
        object txt3: TLabel
          Left = 8
          Top = 24
          Width = 77
          Height = 13
          Caption = #8470' '#1054#1090#1076#1077#1083#1077#1085#1080#1103':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object txt5: TLabel
          Left = 136
          Top = 24
          Width = 35
          Height = 13
          Caption = #1043#1086#1088#1086#1076':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label1: TLabel
          Left = 263
          Top = 24
          Width = 44
          Height = 13
          Caption = #1058#1077#1083#1077#1092#1086#1085
        end
        object Edite1: TEdit
          Left = 263
          Top = 40
          Width = 121
          Height = 21
          TabOrder = 0
        end
      end
      object grp3: TGroupBox
        Left = 0
        Top = 219
        Width = 401
        Height = 113
        Caption = #1053#1072#1089#1090#1088#1086#1082#1080' '#1087#1088#1086#1094#1077#1085#1090#1086#1074
        TabOrder = 9
        object txt6: TLabel
          Left = 8
          Top = 12
          Width = 42
          Height = 13
          Caption = '% '#1087#1077#1085#1080':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object txt7: TLabel
          Left = 136
          Top = 12
          Width = 142
          Height = 13
          Caption = '% '#1086#1090' '#1086#1094#1077#1085#1086#1095#1085#1086#1081' '#1089#1090#1086#1080#1084#1086#1089#1090#1080':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object lbl2: TLabel
          Left = 144
          Top = 28
          Width = 49
          Height = 13
          Caption = #1085#1072' 1 '#1076#1077#1085#1100
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object lbl3: TLabel
          Left = 144
          Top = 52
          Width = 50
          Height = 13
          Caption = '2-30 '#1076#1085#1077#1081
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object btn6: TButton
          Left = 8
          Top = 78
          Width = 113
          Height = 25
          Caption = #1053#1072#1089#1090#1088#1086#1082#1072' % '#1089#1089#1091#1076#1099
          Enabled = False
          TabOrder = 2
        end
        object btn4: TButton
          Left = 136
          Top = 78
          Width = 105
          Height = 25
          Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1089#1082#1080#1076#1086#1082
          Enabled = False
          TabOrder = 3
        end
        object edt6: TEdit
          Left = 8
          Top = 28
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
        end
        object edt7: TEdit
          Left = 200
          Top = 28
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
        object edt10: TEdit
          Left = 200
          Top = 52
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
          TabOrder = 4
        end
      end
      object edt2: TEdit
        Left = 8
        Top = 107
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
        TabOrder = 3
      end
      object edt3: TEdit
        Left = 136
        Top = 107
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
        TabOrder = 4
      end
      object edt4: TEdit
        Left = 264
        Top = 107
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
        TabOrder = 5
      end
      object edt1: TEdit
        Left = 8
        Top = 40
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
        TabOrder = 2
      end
      object edt5: TEdit
        Left = 136
        Top = 40
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
        TabOrder = 6
      end
      object edt8: TEdit
        Left = 8
        Top = 147
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
        TabOrder = 8
      end
      object sEdit3: TEdit
        Left = 263
        Top = 147
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
        TabOrder = 10
      end
      object Edt18: TEdit
        Left = 135
        Top = 147
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
        TabOrder = 11
      end
    end
    object ts2: TTabSheet
      Caption = #1060#1080#1089#1082#1072#1083#1100#1085#1099#1081' '#1088#1077#1075#1080#1089#1090#1088#1072#1090#1086#1088
      ImageIndex = 1
      OnShow = ts2Show
      object lbl1: TLabel
        Left = 91
        Top = 8
        Width = 3
        Height = 13
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object txt9: TLabel
        Left = 8
        Top = 32
        Width = 76
        Height = 13
        Caption = #8470' COM '#1087#1086#1088#1090#1072':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object txt10: TLabel
        Left = 8
        Top = 8
        Width = 63
        Height = 13
        Caption = #1057#1090#1072#1090#1091#1089' '#1056#1056#1054':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object btn5: TButton
        Left = 0
        Top = 336
        Width = 75
        Height = 25
        Caption = #1055#1086#1076#1082#1083#1102#1095#1080#1090#1100
        TabOrder = 1
        OnClick = btn5Click
      end
      object btn2: TButton
        Left = 88
        Top = 336
        Width = 75
        Height = 25
        Caption = #1054#1090#1082#1083#1102#1095#1080#1090#1100
        TabOrder = 2
        OnClick = btn2Click
      end
      object edt9: TEdit
        Left = 88
        Top = 32
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
      end
    end
    object ts3: TTabSheet
      Caption = #1054#1073#1084#1077#1085' '#1076#1072#1085#1085#1099#1084#1080
      ImageIndex = 2
      object sGroupBox2: TGroupBox
        Left = 8
        Top = 8
        Width = 385
        Height = 81
        Caption = #1055#1086#1076#1082#1083#1102#1095#1077#1085#1080#1077
        TabOrder = 0
        object sLabel1: TLabel
          Left = 8
          Top = 48
          Width = 96
          Height = 13
          Caption = #1048#1084#1103' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1103':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object sComboBox1: TComboBox
          Left = 112
          Top = 48
          Width = 145
          Height = 21
          Color = clWhite
          DropDownCount = 16
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object sCheckBox1: TCheckBox
          Left = 8
          Top = 24
          Width = 272
          Height = 20
          Caption = #1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1077' '#1091#1076#1072#1083#1105#1085#1085#1086#1075#1086' '#1076#1086#1089#1090#1091#1087#1072
          TabOrder = 0
          OnClick = sCheckBox1Click
        end
      end
      object sGroupBox3: TGroupBox
        Left = 8
        Top = 96
        Width = 385
        Height = 121
        Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' FTP'
        TabOrder = 1
        object sLabel2: TLabel
          Left = 8
          Top = 24
          Width = 79
          Height = 13
          Caption = #1040#1076#1088#1077#1089' '#1089#1077#1088#1074#1077#1088#1072':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object sLabel3: TLabel
          Left = 8
          Top = 64
          Width = 76
          Height = 13
          Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object sLabel4: TLabel
          Left = 8
          Top = 88
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
        object sEdit1: TEdit
          Left = 8
          Top = 40
          Width = 369
          Height = 21
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object sEdit2: TEdit
          Left = 88
          Top = 64
          Width = 121
          Height = 21
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object sMaskEdit1: TMaskEdit
          Left = 88
          Top = 88
          Width = 121
          Height = 21
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          PasswordChar = '*'
          TabOrder = 2
        end
      end
    end
    object ts4: TTabSheet
      Caption = #1053#1072#1089#1090#1088#1086#1082#1080' '#1076#1086#1089#1090#1091#1087#1072
      ImageIndex = 3
      object Button1: TButton
        Left = 0
        Top = 336
        Width = 75
        Height = 25
        Caption = #1048#1079#1084#1077#1085#1080#1090#1100
        TabOrder = 0
        OnClick = Button1Click
      end
      object sGroupBox1: TGroupBox
        Left = 0
        Top = 8
        Width = 401
        Height = 81
        Caption = #1055#1072#1088#1086#1083#1100' '#1084#1077#1085#1077#1076#1078#1077#1088#1072
        TabOrder = 1
        object StaticText1: TLabel
          Left = 8
          Top = 24
          Width = 82
          Height = 13
          Caption = #1057#1090#1072#1088#1099#1081' '#1087#1072#1088#1086#1083#1100':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object StaticText2: TLabel
          Left = 8
          Top = 48
          Width = 76
          Height = 13
          Caption = #1053#1086#1074#1099#1081' '#1087#1072#1088#1086#1083#1100':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object MaskEdit1: TMaskEdit
          Left = 96
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
          PasswordChar = '*'
          TabOrder = 0
        end
        object MaskEdit2: TMaskEdit
          Left = 96
          Top = 48
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
          PasswordChar = '*'
          TabOrder = 1
        end
      end
    end
    object TabSheet1: TTabSheet
      Caption = '-'
      ImageIndex = 4
      ExplicitLeft = 0
      object Panel1: TPanel
        Left = 8
        Top = 8
        Width = 384
        Height = 41
        Caption = 'Panel1'
        TabOrder = 0
        object Edit7: TEdit
          Left = 16
          Top = 11
          Width = 121
          Height = 19
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 0
          Text = #1055#1072#1088#1086#1083#1100
          OnClick = Edit7Click
          OnKeyPress = Edit7KeyPress
          OnKeyUp = Edit7KeyUp
        end
        object Button4: TButton
          Left = 143
          Top = 9
          Width = 75
          Height = 25
          Caption = #1055#1088#1080#1081#1090#1080
          TabOrder = 1
          OnClick = Button4Click
        end
        object Button5: TButton
          Left = 224
          Top = 9
          Width = 75
          Height = 25
          Caption = #1091#1081#1090#1080
          TabOrder = 2
          OnClick = Button5Click
        end
      end
      object Panel2: TPanel
        Left = 14
        Top = 64
        Width = 384
        Height = 296
        TabOrder = 1
        object Label6: TLabel
          Left = 152
          Top = 39
          Width = 4
          Height = 13
          Caption = '-'
        end
        object Button2: TButton
          Left = 9
          Top = 8
          Width = 132
          Height = 25
          HelpType = htKeyword
          Caption = #1053#1086#1074#1099#1077' '#1044#1086#1075#1086#1074#1086#1088#1072
          TabOrder = 0
          OnClick = Button2Click
        end
        object Button3: TButton
          Left = 9
          Top = 39
          Width = 132
          Height = 25
          Caption = #1058#1072#1088#1080#1092' '#1054#1090#1082#1088#1099#1090#1080#1077
          TabOrder = 1
          OnClick = Button3Click
        end
        object Button6: TButton
          Left = 9
          Top = 70
          Width = 132
          Height = 25
          Caption = #1058#1072#1088#1080#1092' GOLD'
          TabOrder = 2
          OnClick = Button6Click
        end
        object Button7: TButton
          Left = 152
          Top = 8
          Width = 132
          Height = 25
          Caption = #1043#1088#1091#1087#1087#1072' '#1051#1086#1103#1083#1100#1085#1086#1089#1090#1080': 0'
          TabOrder = 3
          OnClick = Button7Click
        end
        object Button8: TButton
          Left = 152
          Top = 39
          Width = 132
          Height = 25
          Caption = #1055#1088#1080#1082#1072#1079' '#8470'22'
          TabOrder = 4
          OnClick = Button8Click
        end
        object DateTimePicker1: TDateTimePicker
          Left = 152
          Top = 70
          Width = 132
          Height = 21
          Date = 41814.425326817130000000
          Time = 41814.425326817130000000
          TabOrder = 5
          OnChange = DateTimePicker1Change
        end
        object Edit1: TEdit
          Left = 9
          Top = 144
          Width = 256
          Height = 21
          TabOrder = 6
          Text = 'Edit1'
        end
        object Button9: TButton
          Left = 280
          Top = 144
          Width = 75
          Height = 25
          Caption = #1041#1072#1079#1079#1072
          TabOrder = 7
          OnClick = Button9Click
        end
        object Panel3: TPanel
          Left = 10
          Top = 208
          Width = 25
          Height = 23
          Alignment = taLeftJustify
          BevelInner = bvLowered
          Caption = '16'
          TabOrder = 8
          object Panel4: TPanel
            Left = 14
            Top = 2
            Width = 10
            Height = 10
            BevelEdges = []
            Color = clRed
            ParentBackground = False
            TabOrder = 0
          end
          object Panel5: TPanel
            Left = 14
            Top = 12
            Width = 10
            Height = 10
            Color = clLime
            ParentBackground = False
            TabOrder = 1
          end
        end
        object Panel6: TPanel
          Left = 120
          Top = 216
          Width = 185
          Height = 41
          BevelInner = bvLowered
          Caption = 'Panel6'
          TabOrder = 9
        end
      end
    end
  end
  object btn3: TButton
    Left = 338
    Top = 459
    Width = 75
    Height = 25
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 1
    OnClick = btn3Click
  end
  object QPasport: TADOQuery
    Parameters = <>
    Left = 16
    Top = 424
  end
  object ADOQuery1: TADOQuery
    Parameters = <>
    Left = 48
    Top = 424
  end
  object OpenDialog1: TOpenDialog
    Left = 272
    Top = 216
  end
end
