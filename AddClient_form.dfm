object AddClient: TAddClient
  Left = 547
  Top = 249
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1082#1083#1080#1077#1085#1090#1072
  ClientHeight = 373
  ClientWidth = 401
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
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 401
    Height = 373
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    OnChange = PageControl1Change
    ExplicitWidth = 373
    ExplicitHeight = 337
    object TabSheet1: TTabSheet
      Caption = #1044#1072#1085#1085#1099#1077
      ExplicitLeft = 8
      ExplicitTop = 28
      ExplicitWidth = 0
      ExplicitHeight = 0
      object txt1: TLabel
        Left = 8
        Top = 6
        Width = 27
        Height = 13
        Caption = #1060#1048#1054':'
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
        Top = 34
        Width = 84
        Height = 13
        Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object txt3: TLabel
        Left = 8
        Top = 63
        Width = 35
        Height = 13
        Caption = #1040#1076#1088#1077#1089':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object txt4: TLabel
        Left = 8
        Top = 93
        Width = 85
        Height = 13
        Caption = #1057#1077#1088#1080#1103' '#1087#1072#1089#1087#1086#1088#1090#1072':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object txt5: TLabel
        Left = 176
        Top = 93
        Width = 67
        Height = 13
        Caption = #8470' '#1087#1072#1089#1087#1086#1088#1090#1072':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object txt6: TLabel
        Left = 8
        Top = 123
        Width = 59
        Height = 13
        Caption = #1050#1077#1084' '#1074#1099#1076#1072#1085':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object txt7: TLabel
        Left = 8
        Top = 153
        Width = 72
        Height = 13
        Caption = #1044#1072#1090#1072' '#1074#1099#1076#1072#1095#1080':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object txt8: TLabel
        Left = 29
        Top = 187
        Width = 25
        Height = 13
        Caption = #1048#1053#1053':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object txt9: TLabel
        Left = -1
        Top = 223
        Width = 80
        Height = 19
        Caption = #1058#1077#1083#1077#1092#1086#1085':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label1: TLabel
        Left = 19
        Top = 262
        Width = 60
        Height = 13
        Caption = #1051#1086#1103#1083#1100#1085#1086#1089#1090#1100
      end
      object txt11: TLabel
        Left = 218
        Top = 263
        Width = 53
        Height = 13
        Caption = #8470' '#1050#1072#1088#1090#1099':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object edt1: TEdit
        AlignWithMargins = True
        Left = 36
        Top = 3
        Width = 353
        Height = 19
        BevelInner = bvNone
        BevelOuter = bvNone
        Color = clWhite
        Ctl3D = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        OnKeyPress = edt1KeyPress
      end
      object dtp1: TDateTimePicker
        AlignWithMargins = True
        Left = 100
        Top = 30
        Width = 125
        Height = 27
        BevelInner = bvNone
        BevelOuter = bvNone
        Date = 41392.612427789360000000
        Time = 41392.612427789360000000
        Color = clWhite
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object edt2: TEdit
        AlignWithMargins = True
        Left = 49
        Top = 59
        Width = 340
        Height = 19
        BevelInner = bvNone
        BevelOuter = bvNone
        Color = clWhite
        Ctl3D = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        MaxLength = 200
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 2
      end
      object edt3: TEdit
        AlignWithMargins = True
        Left = 96
        Top = 90
        Width = 73
        Height = 19
        BevelInner = bvNone
        BevelOuter = bvNone
        Color = clWhite
        Ctl3D = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        MaxLength = 4
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 3
      end
      object edt4: TEdit
        AlignWithMargins = True
        Left = 248
        Top = 90
        Width = 73
        Height = 19
        BevelInner = bvNone
        BevelOuter = bvNone
        Color = clWhite
        Ctl3D = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 4
        OnKeyPress = edt4KeyPress
      end
      object edt5: TEdit
        AlignWithMargins = True
        Left = 72
        Top = 120
        Width = 317
        Height = 19
        BevelInner = bvNone
        BevelOuter = bvNone
        Color = clWhite
        Ctl3D = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        MaxLength = 50
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 5
      end
      object dtp2: TDateTimePicker
        AlignWithMargins = True
        Left = 200
        Top = 149
        Width = 115
        Height = 27
        BevelInner = bvNone
        BevelOuter = bvNone
        Date = 41392.612427997690000000
        Time = 41392.612427997690000000
        Color = clWhite
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
      end
      object edt6: TEdit
        AlignWithMargins = True
        Left = 85
        Top = 185
        Width = 137
        Height = 19
        BevelInner = bvNone
        BevelOuter = bvNone
        Color = clWhite
        Ctl3D = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 7
        OnKeyPress = edt6KeyPress
      end
      object edt7: TEdit
        Left = 85
        Top = 220
        Width = 137
        Height = 19
        Color = clWhite
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        MaxLength = 10
        NumbersOnly = True
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 8
      end
      object ComboBox1: TComboBox
        Left = 85
        Top = 258
        Width = 145
        Height = 21
        TabOrder = 9
        OnChange = ComboBox1Change
        Items.Strings = (
          #1053#1077' '#1091#1089#1090#1072#1085#1086#1074#1083#1077#1085#1086
          '('#1090#1077#1089#1090#1086#1074#1099#1081')')
      end
      object Edit1: TEdit
        AlignWithMargins = True
        Left = 85
        Top = 256
        Width = 144
        Height = 19
        BevelInner = bvNone
        BevelOuter = bvNone
        Ctl3D = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 10
      end
      object edt9: TEdit
        AlignWithMargins = True
        Left = 277
        Top = 256
        Width = 57
        Height = 19
        BevelInner = bvNone
        BevelOuter = bvNone
        Color = clWhite
        Ctl3D = False
        Enabled = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        MaxLength = 10
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 11
      end
      object Button1: TButton
        Left = 158
        Top = 317
        Width = 75
        Height = 25
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        TabOrder = 12
        OnClick = Button1Click
      end
      object btn1: TButton
        Left = 239
        Top = 317
        Width = 75
        Height = 25
        Caption = #1048#1079#1084#1077#1085#1080#1090#1100
        TabOrder = 13
        OnClick = btn1Click
      end
      object btn2: TButton
        Left = 320
        Top = 317
        Width = 75
        Height = 25
        Caption = #1054#1090#1084#1077#1085#1072
        TabOrder = 14
        OnClick = btn2Click
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1058#1072#1088#1080#1092'/'#1057#1082#1080#1076#1082#1080
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 365
      ExplicitHeight = 309
      object Panel1: TPanel
        Left = 0
        Top = 37
        Width = 359
        Height = 124
        TabOrder = 0
        object RadioButton1: TRadioButton
          Left = 2
          Top = 1
          Width = 113
          Height = 17
          Caption = #1048#1085#1076#1080#1074#1080#1076#1091#1072#1083#1100#1085#1099#1081
          TabOrder = 0
          OnClick = RadioButton1Click
        end
        object Panel3: TPanel
          Left = 18
          Top = 23
          Width = 159
          Height = 86
          Color = clGradientActiveCaption
          ParentBackground = False
          TabOrder = 1
          object Label2: TLabel
            Left = 19
            Top = 8
            Width = 120
            Height = 16
            Caption = '- '#1055#1056#1054#1062#1045#1053#1058' '#1042' '#1044#1045#1053#1068
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Edit2: TEdit
            Left = 19
            Top = 27
            Width = 121
            Height = 26
            Alignment = taCenter
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            OnExit = Edit2Exit
          end
          object CheckBox2: TCheckBox
            Left = 19
            Top = 59
            Width = 121
            Height = 17
            Caption = #1060#1080#1082#1089#1080#1088#1086#1074#1072#1085#1085#1099#1081
            TabOrder = 1
            OnClick = CheckBox2Click
          end
        end
        object Panel4: TPanel
          Left = 183
          Top = 23
          Width = 159
          Height = 86
          Color = clGradientActiveCaption
          ParentBackground = False
          TabOrder = 2
          object Label3: TLabel
            Left = 19
            Top = 8
            Width = 124
            Height = 16
            Caption = '+ '#1062#1045#1053#1040' '#1047#1040' '#1043#1056#1040#1052#1052
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object CheckBox3: TCheckBox
            Left = 19
            Top = 59
            Width = 121
            Height = 17
            Caption = #1060#1080#1082#1089#1080#1088#1086#1074#1072#1085#1085#1099#1081
            TabOrder = 0
            OnClick = CheckBox3Click
          end
          object Edit3: TEdit
            Left = 19
            Top = 27
            Width = 121
            Height = 26
            Alignment = taCenter
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            OnExit = Edit3Exit
          end
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 8
        Width = 359
        Height = 19
        TabOrder = 1
        object RadioButton2: TRadioButton
          Left = 2
          Top = 1
          Width = 345
          Height = 17
          Caption = #1041#1072#1079#1086#1074#1099#1081'. '
          TabOrder = 0
          OnClick = RadioButton2Click
        end
      end
      object Panel5: TPanel
        Left = 0
        Top = 167
        Width = 359
        Height = 114
        TabOrder = 2
      end
      object Button2: TButton
        Left = 202
        Top = 284
        Width = 75
        Height = 25
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        TabOrder = 3
        OnClick = Button2Click
      end
      object Button3: TButton
        Left = 284
        Top = 284
        Width = 75
        Height = 25
        Caption = #1054#1090#1084#1077#1085#1072
        TabOrder = 4
        OnClick = Button3Click
      end
    end
    object TabSheet3: TTabSheet
      Caption = #1057#1090#1072#1090#1080#1089#1090#1080#1082#1072
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 365
      ExplicitHeight = 309
    end
  end
  object q1: TADOQuery
    Parameters = <>
    Top = 305
  end
end
