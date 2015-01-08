inherited frmPrtLabel: TfrmPrtLabel
  Left = 565
  Top = 51
  Width = 525
  Height = 664
  Caption = 'frmPrtLabel'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object lblName: TLabel
    Left = 16
    Top = 8
    Width = 5
    Height = 16
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 62
    Width = 509
    Height = 564
    ActivePage = tbsPrtCUDLabel
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object tbsPrtCUDLabel: TTabSheet
      Caption = 'Print China or (Europe&&Asia)  Label'
      object gboxVol: TGroupBox
        Left = 6
        Top = 113
        Width = 169
        Height = 97
        TabOrder = 0
        object StaticText3: TStaticText
          Left = 7
          Top = 17
          Width = 66
          Height = 21
          AutoSize = False
          BevelInner = bvLowered
          BevelKind = bkFlat
          BevelOuter = bvRaised
          Caption = 'Voltage(V)'
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 0
        end
        object StaticText4: TStaticText
          Left = 7
          Top = 44
          Width = 66
          Height = 21
          AutoSize = False
          BevelInner = bvLowered
          BevelKind = bkFlat
          BevelOuter = bvRaised
          Caption = 'Phase'
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 1
        end
        object StaticText5: TStaticText
          Left = 7
          Top = 70
          Width = 66
          Height = 21
          AutoSize = False
          BevelInner = bvLowered
          BevelKind = bkFlat
          BevelOuter = bvRaised
          Caption = 'Frequency'
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 2
        end
        object dbedtVoltage: TDBEditEh
          Left = 77
          Top = 16
          Width = 87
          Height = 24
          DataField = 'Voltage'
          DataSource = ds_paramCUD
          EditButtons = <>
          TabOrder = 3
          Visible = True
        end
        object dbedtPhase: TDBEditEh
          Left = 77
          Top = 43
          Width = 87
          Height = 24
          DataField = 'Ph'
          DataSource = ds_paramCUD
          EditButtons = <>
          TabOrder = 4
          Visible = True
        end
        object dbedtFrequency: TDBEditEh
          Left = 77
          Top = 69
          Width = 87
          Height = 24
          DataField = 'Hz'
          DataSource = ds_paramCUD
          EditButtons = <>
          TabOrder = 5
          Visible = True
        end
      end
      object gboxPower: TGroupBox
        Left = 188
        Top = 113
        Width = 217
        Height = 97
        TabOrder = 1
        object StaticText6: TStaticText
          Left = 9
          Top = 69
          Width = 115
          Height = 21
          AutoSize = False
          BevelInner = bvLowered
          BevelKind = bkFlat
          BevelOuter = bvRaised
          Caption = 'Compressor R.L.A'
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 0
        end
        object StaticText7: TStaticText
          Left = 9
          Top = 42
          Width = 115
          Height = 21
          AutoSize = False
          BevelInner = bvLowered
          BevelKind = bkFlat
          BevelOuter = bvRaised
          Caption = 'Compressor L.R.A'
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 1
        end
        object StaticText8: TStaticText
          Left = 9
          Top = 15
          Width = 115
          Height = 21
          AutoSize = False
          BevelInner = bvLowered
          BevelKind = bkFlat
          BevelOuter = bvRaised
          Caption = 'Max Input Power'
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 2
        end
        object dbedtMaxInputPower: TDBEditEh
          Left = 126
          Top = 14
          Width = 89
          Height = 24
          EditButtons = <>
          TabOrder = 3
          Visible = True
        end
        object dbedtCompLRA: TDBEditEh
          Left = 126
          Top = 41
          Width = 89
          Height = 24
          DataField = 'L_R_A'
          DataSource = ds_paramCUD
          EditButtons = <>
          TabOrder = 4
          Visible = True
        end
        object dbedtCompRLA: TDBEditEh
          Left = 126
          Top = 68
          Width = 89
          Height = 24
          DataField = 'R_L_A'
          DataSource = ds_paramCUD
          EditButtons = <>
          TabOrder = 5
          Visible = True
        end
      end
      object gboxOthers: TGroupBox
        Left = 7
        Top = 270
        Width = 491
        Height = 227
        Caption = 'Others'
        TabOrder = 2
        object StaticText9: TStaticText
          Left = 7
          Top = 23
          Width = 132
          Height = 21
          AutoSize = False
          BevelInner = bvLowered
          BevelKind = bkFlat
          BevelOuter = bvRaised
          Caption = 'Compressor Lubricant'
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 0
        end
        object StaticText10: TStaticText
          Left = 151
          Top = 51
          Width = 105
          Height = 21
          AutoSize = False
          BevelInner = bvLowered
          BevelKind = bkFlat
          BevelOuter = bvRaised
          Caption = 'Standard Applied'
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 1
        end
        object StaticText11: TStaticText
          Left = 256
          Top = 23
          Width = 45
          Height = 21
          AutoSize = False
          BevelInner = bvLowered
          BevelKind = bkFlat
          BevelOuter = bvRaised
          Caption = 'Weight'
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 2
        end
        object StaticText13: TStaticText
          Left = 6
          Top = 51
          Width = 65
          Height = 21
          AutoSize = False
          BevelInner = bvLowered
          BevelKind = bkFlat
          BevelOuter = bvRaised
          Caption = 'Refrigerant'
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 3
        end
        object dbedtCompLubricant: TDBEditEh
          Left = 143
          Top = 21
          Width = 105
          Height = 24
          DataField = 'oil'
          DataSource = ds_paramCUD
          EditButtons = <>
          TabOrder = 4
          Visible = True
        end
        object dbedtWeight: TDBEditEh
          Left = 304
          Top = 21
          Width = 81
          Height = 24
          DataField = 'ProductWeight'
          DataSource = ds_paramCUD
          EditButtons = <>
          TabOrder = 5
          Visible = True
        end
        object dbedtStandApply: TDBEditEh
          Left = 264
          Top = 49
          Width = 121
          Height = 24
          DataField = 'standard'
          DataSource = ds_paramCUD
          EditButtons = <>
          TabOrder = 6
          Visible = True
        end
        object dbedtRefrigerant: TDBEditEh
          Left = 80
          Top = 49
          Width = 65
          Height = 24
          DataField = 'Refrigerant'
          DataSource = ds_paramCUD
          EditButtons = <>
          TabOrder = 7
          Visible = True
        end
        object dbedtMaxOperatingCurrent: TDBEditEh
          Left = 144
          Top = 196
          Width = 96
          Height = 24
          DataField = 'MaxOperatingCurrent'
          DataSource = ds_paramCUD
          EditButtons = <>
          TabOrder = 8
          Visible = True
        end
        object StaticText23: TStaticText
          Left = 7
          Top = 197
          Width = 130
          Height = 21
          AutoSize = False
          BevelInner = bvLowered
          BevelKind = bkFlat
          BevelOuter = bvRaised
          Caption = 'MaxOperatingCurrent'
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 9
        end
        object StaticText22: TStaticText
          Left = 7
          Top = 166
          Width = 130
          Height = 21
          AutoSize = False
          BevelInner = bvLowered
          BevelKind = bkFlat
          BevelOuter = bvRaised
          Caption = 'MaxWorkingPressure'
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 10
        end
        object dbedtMaxWorkingPressure: TDBEditEh
          Left = 144
          Top = 166
          Width = 96
          Height = 24
          DataField = 'MaxWorkingPressure'
          DataSource = ds_paramCUD
          EditButtons = <>
          TabOrder = 11
          Visible = True
        end
        object StaticText24: TStaticText
          Left = 246
          Top = 138
          Width = 74
          Height = 21
          AutoSize = False
          BevelInner = bvLowered
          BevelKind = bkFlat
          BevelOuter = bvRaised
          Caption = 'Application'
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 12
        end
        object dbedtApplication: TDBEditEh
          Left = 327
          Top = 135
          Width = 100
          Height = 24
          DataField = 'Application'
          DataSource = ds_paramCUD
          EditButtons = <>
          TabOrder = 13
          Visible = True
        end
        object dbedtPower: TDBEditEh
          Left = 298
          Top = 107
          Width = 100
          Height = 24
          DataField = 'Power'
          DataSource = ds_paramCUD
          EditButtons = <>
          TabOrder = 14
          Visible = True
        end
        object StaticText20: TStaticText
          Left = 246
          Top = 108
          Width = 48
          Height = 21
          AutoSize = False
          BevelInner = bvLowered
          BevelKind = bkFlat
          BevelOuter = bvRaised
          Caption = 'Power'
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 15
        end
        object dbedtRatingCondition: TDBEditEh
          Left = 144
          Top = 135
          Width = 96
          Height = 24
          DataField = 'RatingCondition'
          DataSource = ds_paramCUD
          EditButtons = <>
          TabOrder = 16
          Visible = True
        end
        object StaticText21: TStaticText
          Left = 7
          Top = 138
          Width = 130
          Height = 21
          AutoSize = False
          BevelInner = bvLowered
          BevelKind = bkFlat
          BevelOuter = bvRaised
          Caption = 'RatingCondition'
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 17
        end
        object StaticText19: TStaticText
          Left = 7
          Top = 108
          Width = 146
          Height = 21
          AutoSize = False
          BevelInner = bvLowered
          BevelKind = bkFlat
          BevelOuter = bvRaised
          Caption = 'EvaporatingTempRange'
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 18
        end
        object dbedtEvaporatingTempRange: TDBEditEh
          Left = 159
          Top = 107
          Width = 84
          Height = 24
          DataField = 'EvaporatingTempRange'
          DataSource = ds_paramCUD
          EditButtons = <>
          TabOrder = 19
          Visible = True
        end
        object StaticText2: TStaticText
          Left = 7
          Top = 79
          Width = 39
          Height = 21
          AutoSize = False
          BevelInner = bvLowered
          BevelKind = bkFlat
          BevelOuter = bvRaised
          Caption = 'FAN'
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 20
        end
        object dbedtFan: TDBEditEh
          Left = 49
          Top = 77
          Width = 217
          Height = 24
          DataField = 'Fan'
          DataSource = ds_paramCUD
          EditButtons = <>
          TabOrder = 21
          Visible = True
        end
        object StaticText25: TStaticText
          Left = 270
          Top = 79
          Width = 82
          Height = 21
          AutoSize = False
          BevelInner = bvLowered
          BevelKind = bkFlat
          BevelOuter = bvRaised
          Caption = 'Product Date'
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 22
        end
        object dtpProDate: TDBDateTimeEditEh
          Left = 356
          Top = 77
          Width = 126
          Height = 24
          DataField = 'ProductionStartTime'
          DataSource = ds_active
          EditButtons = <>
          Kind = dtkDateEh
          TabOrder = 23
          Visible = True
        end
      end
      object BtnPrtCUDLabel: TButton
        Left = 16
        Top = 503
        Width = 98
        Height = 25
        Caption = 'Print China Label'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = BtnPrtCUDLabelClick
      end
      object gboxPressure: TGroupBox
        Left = 6
        Top = 211
        Width = 401
        Height = 57
        Caption = 'Safety Working Pressure'
        TabOrder = 4
        object StaticText14: TStaticText
          Left = 7
          Top = 24
          Width = 70
          Height = 21
          AutoSize = False
          BevelInner = bvLowered
          BevelKind = bkFlat
          BevelOuter = bvRaised
          Caption = 'High Side'
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 0
        end
        object StaticText16: TStaticText
          Left = 214
          Top = 24
          Width = 70
          Height = 21
          AutoSize = False
          BevelInner = bvLowered
          BevelKind = bkFlat
          BevelOuter = bvRaised
          Caption = 'Low Side'
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 1
        end
        object dbedtHighSide: TDBEditEh
          Left = 81
          Top = 22
          Width = 113
          Height = 24
          DataField = 'high_pressure'
          DataSource = ds_paramCUD
          EditButtons = <>
          TabOrder = 2
          Visible = True
        end
        object dbedtLowSide: TDBEditEh
          Left = 288
          Top = 22
          Width = 102
          Height = 24
          DataField = 'low_pressure'
          DataSource = ds_paramCUD
          EditButtons = <>
          TabOrder = 3
          Visible = True
        end
      end
      object gboxCapacity: TGroupBox
        Left = 6
        Top = 73
        Width = 401
        Height = 40
        TabOrder = 5
        object StaticText17: TStaticText
          Left = 7
          Top = 13
          Width = 70
          Height = 21
          AutoSize = False
          BevelInner = bvLowered
          BevelKind = bkFlat
          BevelOuter = bvRaised
          Caption = 'CAPACITY'
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 0
        end
        object StaticText18: TStaticText
          Left = 214
          Top = 13
          Width = 70
          Height = 21
          AutoSize = False
          BevelInner = bvLowered
          BevelKind = bkFlat
          BevelOuter = bvRaised
          Caption = 'COP.'
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 1
        end
        object dbedtCapacity: TDBEditEh
          Left = 88
          Top = 11
          Width = 121
          Height = 24
          DataField = 'Capacity'
          DataSource = ds_paramCUD
          EditButtons = <>
          TabOrder = 2
          Visible = True
        end
        object dbedtCop: TDBEditEh
          Left = 288
          Top = 11
          Width = 105
          Height = 24
          DataField = 'COP'
          DataSource = ds_paramCUD
          EditButtons = <>
          TabOrder = 3
          Visible = True
        end
      end
      object gboxModel: TGroupBox
        Left = 6
        Top = 0
        Width = 257
        Height = 73
        Caption = 'Model'
        TabOrder = 6
        object dbedtModel: TDBEditEh
          Left = 102
          Top = 17
          Width = 151
          Height = 24
          DataField = 'Model'
          DataSource = ds_active
          EditButtons = <>
          ReadOnly = True
          TabOrder = 0
          Visible = True
        end
        object dbedtProductSn: TDBEditEh
          Left = 102
          Top = 45
          Width = 151
          Height = 24
          DataField = 'ProductSerialNumber'
          DataSource = ds_active
          EditButtons = <>
          TabOrder = 1
          Visible = True
        end
        object StaticText12: TStaticText
          Left = 6
          Top = 18
          Width = 91
          Height = 21
          AutoSize = False
          BevelInner = bvLowered
          BevelKind = bkFlat
          BevelOuter = bvRaised
          Caption = 'Model'
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 2
        end
        object StaticText1: TStaticText
          Left = 6
          Top = 46
          Width = 91
          Height = 21
          AutoSize = False
          BevelInner = bvLowered
          BevelKind = bkFlat
          BevelOuter = bvRaised
          Caption = 'Serial Number'
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 3
        end
      end
      object Button2: TButton
        Left = 400
        Top = 503
        Width = 75
        Height = 25
        Caption = 'Exit'
        TabOrder = 7
        OnClick = Button1Click
      end
      object Memo2: TMemo
        Left = 408
        Top = 24
        Width = 169
        Height = 129
        Lines.Strings = (
          '^XA~TA000~JSN^LT0^MN'
          'W^MTT^PON^PMN^LH0,0^'
          'JMA^PR4,4^MD0^JUS^LR'
          'N^CI0^XZ'
          '~DG000.GRF,02048,016,'
          ',::::::::::::K07FgF0,K06AE'
          'AEAEAEAEAEHEAEAEA'
          'EE0,K060Y030,K020Y020,'
          'K060Y030,K020M02AA80'
          'M020,K060L01FIFC0L030,'
          'K020L0LA80K020,K060K0'
          '7FLFL030,K060K0AELE80'
          'J020,K060J07FNFK030,K0'
          '20J0PA80I020,K060I03FO'
          'FE0I030,K020I06EEAEHE'
          'AEAEE0I020,K060H01FIF'
          'C001FIFC0H030,K020H02'
          'AHA80I02AIAI020,K060H0'
          '7FHF40H0407FFE0H030,'
          'K060H06EE8002E802E0A'
          '0H020,K06001FHFH01FH'
          'FC001FC0030,K020H0IAH'
          '02AIAI0B80020,K06003FF'
          'C007FIF801FC0030,K0200'
          '2EE8006AEHEA00EA002'
          '0,K06007FF0H07FJF01FF'
          '0030,K0200AHAI02AJAH0'
          'HA8020,K0601FFE0H07FJ'
          'F01FFC030,K0600EEC0H'
          '02EJE80EEC020,K0601FF'
          'C0H07FJFC1FFC030,K020'
          '2AA80H02AJA80AA8020,'
          'K0607FFC0H01FJFE1FFE'
          '030,K0202EAC0I0HEAEH'
          'E0EHE020,K0607FFC0I0L'
          'F1FHF030,K020AHA80I02'
          'AJA0AHA020,K060FHFC0I'
          '01FNFC30,K060EHEC0J0'
          '2EME820,K060FHFC0J01'
          'FMF830,K020AHA80K0NA'
          '820,K061FHFE0K01FLF83'
          '0,K020AEHEM0EAEHEA'
          'E820,K061FIFM07FKFC30'
          ',K020AIA80L0LA820,K061'
          'FIFC0L07FJFC30,K060EJ'
          'EN0KE820,K061FJF80L0K'
          'FC30,K020AKAM02AIA82'
          '0,K061FKFM01FIFC30,K0'
          '20EEAEAE80L0AEHE820,'
          'K061FLFM07FHFC30,K02'
          '0ALA80K02AHA820,K061'
          'FMFL07FHFC30,K060EM'
          'E80J02EHE820,K060FNF'
          'K01FHF830,K020AMAB80'
          'J0IA820,K060FNFC0I01FH'
          'F830,K020EIE2EHEAE80I'
          '0EAE020,K0607FFE1FJF'
          'C0H01FHF030,K0202AHA'
          '0AJA80I0IA020,K0607FFE'
          '1FKFI01FFE030,K0602EH'
          'E0EKEJ0IE020,K0601FFE'
          '0FKF8001FFC030,K0200A'
          'HA0AKA80H0HA8020,K06'
          '01FFE07FJF8001FFC030,'
          'K0200EAE06AEHEA8002'
          'EE8020,K06007FE03FJF8'
          '003FF0030,K02002AA00A'
          'JAI02AA0020,K06003FE00'
          'FJFI0HFC0030,K060H0HE'
          'H06EIEI0HEC0020,K06001'
          'FE101FHFC001FFC0030,'
          'K020H0HA180AHA8002A'
          'A80020,K060H07F7F0014'
          '001FHFI030,K020H02EAE'
          'A0J02EHEI020,K060H01FI'
          'FJ07FHFC0H030,K020I02'
          'APAJ020,K060I03FOFE0I0'
          '30,K060J0PEC0I020,K060'
          'J07FNFK030,K020J03ALA'
          'B80J020,K060J07FMFL03'
          '0,K020I02EEAEAEAEE0K'
          '020,K060I0NFD0L030,K02'
          '0I0NA80L020,K060H07FM'
          'FE0L030,K060H06AEME8'
          '0K020,K060K01FLFL030,'
          'K020L0MA80J020,K060L0'
          '7FLFI04030,K020M0EAEH'
          'EAEHEA0020,K060M03F'
          'MFC0030,K020N0NA8002'
          '0,K060N07FKFE0H030,K0'
          '60O0LEJ020,K060O01FHF'
          'D0J030,K020Y020,K060Y0'
          '30,K020Y020,K060I01C04'
          '18010H070I030,K020I0A80'
          'H080080020I020,K060H04'
          '310418155C0680H030,K06'
          '0H0622860820080880H02'
          '0,K060H043004123190187'
          '0H030,K020I020K020I0A8'
          '0020,K060H05860CDC177'
          '4430I030,K020H04A20C88'
          '0220020I020,K060H05B60'
          'CDC04600320H030,K020I0'
          'A208H80280020I020,K060'
          'H05B604CC05F0030I030,'
          'K060H082600800228020I0'
          '20,K060I04700C60C18575'
          '80030,K020Y020,K060Y03'
          '0,K020Y020,K060Y030,K0'
          '20Y020,K075Y570,K06Eg'
          'E0,,~DG001.GRF,00512,0'
          '16,'
          ',::M0C0H0C00C30J0C300'
          '60H0C,L0HCI06006300FH'
          'FE1BFF07FE,L0HC01FHF'
          '8631800301830060C,L0IC'
          '0318007FC0030H030060C'
          ',K01FFE0198006C03F30H'
          '03007FC,K018C001B01EC'
          'C03H3079B0,K030C00FH'
          'F860C03H3019BE3FHF80'
          'K060C00C0H06FFC3H301'
          '9B003,L0HFC0C0H060C03'
          'H3019B003FC,M0C00C0H'
          '060C03F3019B0070C,M0C'
          '00C0H078C03H301FB0I0C'
          ',M0C0180H070C0H0301D'
          'B0I0C,M0C6180H060C0H0'
          'F01DB600D8,K07FHF30K'
          '0C0H06007FF0070,,:::::::::'
          ':::::~DG002.GRF,01024,01'
          '6,'
          ',::::::::::::::::::::K018D99C7'
          '00C71E071C71CF80,L0D9'
          'B36D81CD980DB6DB6180'
          ',L0D9B36C03C1B00DB61'
          '861,L071E36F02C1BC0DB'
          '61863,L071F36D80C3260'
          'DB638C3,L071B36D80C18'
          '60DB67066,L0D99B6DBC'
          'C186FDB66066,L0D99B6D'
          '80CDB60DB6E366,K018D'
          '99C700C71C071CF9C6,,:::'
          '::::::::::::::::::::::::::::::^XA'
          '^MMT'
          '^LL0600'
          '^PW900'
          '^LS0'
          '^FT576,160^XG000.GRF,1,'
          '1^FS'
          '^FT576,192^XG001.GRF,1,'
          '1^FS'
          '^FT576,224^XG002.GRF,1,'
          '1^FS')
        TabOrder = 8
        Visible = False
      end
      object btnPrnEuroLabel: TButton
        Left = 184
        Top = 503
        Width = 129
        Height = 25
        Caption = 'Print Europe&&Aisa Label'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
        OnClick = btnPrnEuroLabelClick
      end
    end
    object tbsPrtCUDLabelUSA: TTabSheet
      Caption = 'Prt USA Label'
      ImageIndex = 1
      object BtnPrtCUDUSALabel: TButton
        Left = 289
        Top = 400
        Width = 113
        Height = 25
        Caption = 'Print USA Label 1&&2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = BtnPrtCUDUSALabelClick
      end
      object Button1: TButton
        Left = 424
        Top = 400
        Width = 75
        Height = 25
        Caption = 'Exit'
        TabOrder = 1
        OnClick = Button1Click
      end
      object gboxModel2: TGroupBox
        Left = 0
        Top = 0
        Width = 240
        Height = 69
        Caption = 'Model Information'
        TabOrder = 2
        object Label7: TLabel
          Left = 8
          Top = 18
          Width = 35
          Height = 16
          Caption = 'Model'
        end
        object Label6: TLabel
          Left = 8
          Top = 44
          Width = 82
          Height = 16
          Caption = 'Serial Number'
        end
        object dbedtProductSN2: TDBEditEh
          Left = 96
          Top = 42
          Width = 137
          Height = 24
          DataField = 'ProductSerialNumber'
          DataSource = ds_active
          EditButtons = <>
          TabOrder = 0
          Visible = True
        end
        object dbcbbModel2: TDBLookupComboboxEh
          Left = 48
          Top = 15
          Width = 185
          Height = 24
          DataField = 'ModelID'
          DataSource = ds_active
          EditButtons = <>
          KeyField = 'ModelID'
          ListField = 'Model'
          ListSource = ds_model
          TabOrder = 1
          Visible = True
        end
      end
      object gboxApp2: TGroupBox
        Left = 0
        Top = 72
        Width = 240
        Height = 105
        Caption = 'Application Information'
        TabOrder = 3
        object Label2: TLabel
          Left = 8
          Top = 18
          Width = 64
          Height = 16
          Caption = 'Application'
        end
        object Label3: TLabel
          Left = 8
          Top = 42
          Width = 51
          Height = 16
          Caption = 'Refrigant'
        end
        object Label11: TLabel
          Left = 8
          Top = 65
          Width = 104
          Height = 32
          Caption = 'Crankcase Heater Power(Watt)'
          WordWrap = True
        end
        object dbedtApplication2: TDBEditEh
          Left = 114
          Top = 16
          Width = 121
          Height = 24
          DataField = 'Application'
          DataSource = ds_paramUSA
          EditButtons = <>
          TabOrder = 0
          Visible = True
        end
        object dbedtRefigant2: TDBEditEh
          Left = 114
          Top = 43
          Width = 121
          Height = 24
          DataField = 'Refrigant'
          DataSource = ds_paramUSA
          EditButtons = <>
          TabOrder = 1
          Visible = True
        end
        object dbedtPower2: TDBEditEh
          Left = 114
          Top = 72
          Width = 121
          Height = 24
          DataField = 'CrankcaseHeaterPower'
          DataSource = ds_paramUSA
          EditButtons = <>
          TabOrder = 2
          Visible = True
        end
      end
      object gboxDesPressure2: TGroupBox
        Left = 0
        Top = 183
        Width = 240
        Height = 75
        Caption = 'Design Pressure'
        TabOrder = 4
        object Label12: TLabel
          Left = 8
          Top = 25
          Width = 65
          Height = 16
          Caption = 'High(PSIG)'
        end
        object Label13: TLabel
          Left = 8
          Top = 51
          Width = 62
          Height = 16
          Caption = 'Low(PSIG)'
        end
        object dbedtHigh2: TDBEditEh
          Left = 112
          Top = 24
          Width = 121
          Height = 24
          DataField = 'DesignPressureHigh'
          DataSource = ds_paramUSA
          EditButtons = <>
          TabOrder = 0
          Visible = True
        end
        object dbedtLow2: TDBEditEh
          Left = 112
          Top = 48
          Width = 121
          Height = 24
          DataField = 'DesignPressureLow'
          DataSource = ds_paramUSA
          EditButtons = <>
          TabOrder = 1
          Visible = True
        end
      end
      object gboxComp2: TGroupBox
        Left = 244
        Top = 0
        Width = 121
        Height = 153
        Caption = 'Compressor Motor'
        TabOrder = 5
        object Label14: TLabel
          Left = 8
          Top = 23
          Width = 43
          Height = 16
          Caption = 'Voltage'
        end
        object Label15: TLabel
          Left = 8
          Top = 49
          Width = 18
          Height = 16
          Caption = 'PH'
        end
        object Label8: TLabel
          Left = 8
          Top = 74
          Width = 16
          Height = 16
          Caption = 'HZ'
        end
        object Label9: TLabel
          Left = 8
          Top = 101
          Width = 25
          Height = 16
          Caption = 'RLA'
        end
        object Label10: TLabel
          Left = 8
          Top = 129
          Width = 25
          Height = 16
          Caption = 'LRA'
        end
        object dbedtComVol2: TDBEditEh
          Left = 55
          Top = 24
          Width = 60
          Height = 24
          DataField = 'CompressorVoltage'
          DataSource = ds_paramUSA
          EditButtons = <>
          TabOrder = 0
          Visible = True
        end
        object dbedtCOmPH2: TDBEditEh
          Left = 55
          Top = 50
          Width = 60
          Height = 24
          DataField = 'CompressorMotorPH'
          DataSource = ds_paramUSA
          EditButtons = <>
          TabOrder = 1
          Visible = True
        end
        object dbedtComHZ2: TDBEditEh
          Left = 55
          Top = 72
          Width = 60
          Height = 24
          DataField = 'CompressorMotorHZ'
          DataSource = ds_paramUSA
          EditButtons = <>
          TabOrder = 2
          Visible = True
        end
        object dbedtComRLA2: TDBEditEh
          Left = 55
          Top = 96
          Width = 60
          Height = 24
          DataField = 'CompressorMotorRLA'
          DataSource = ds_paramUSA
          EditButtons = <>
          TabOrder = 3
          Visible = True
        end
        object dbedtComLRA2: TDBEditEh
          Left = 55
          Top = 124
          Width = 60
          Height = 24
          DataField = 'CompressorMotorLRA'
          DataSource = ds_paramUSA
          EditButtons = <>
          TabOrder = 4
          Visible = True
        end
      end
      object gboxCondenser2: TGroupBox
        Left = 368
        Top = 0
        Width = 137
        Height = 177
        Caption = 'Condenser Fan(s)'
        TabOrder = 6
        object Label16: TLabel
          Left = 8
          Top = 25
          Width = 26
          Height = 16
          Caption = 'QTY'
        end
        object Label17: TLabel
          Left = 8
          Top = 49
          Width = 43
          Height = 16
          Caption = 'Voltage'
        end
        object Label18: TLabel
          Left = 8
          Top = 74
          Width = 18
          Height = 16
          Caption = 'PH'
        end
        object Label19: TLabel
          Left = 8
          Top = 102
          Width = 16
          Height = 16
          Caption = 'HZ'
        end
        object Label1: TLabel
          Left = 8
          Top = 127
          Width = 50
          Height = 16
          Caption = 'FLA(EA)'
        end
        object Label20: TLabel
          Left = 8
          Top = 152
          Width = 61
          Height = 16
          Caption = 'Wattb(EA)'
        end
        object dbedtConQty2: TDBEditEh
          Left = 72
          Top = 24
          Width = 60
          Height = 24
          DataField = 'CondenserFanQty'
          DataSource = ds_paramUSA
          EditButtons = <>
          TabOrder = 0
          Visible = True
        end
        object dbedtConVol2: TDBEditEh
          Left = 72
          Top = 49
          Width = 60
          Height = 24
          DataField = 'CondenserFanVoltage'
          DataSource = ds_paramUSA
          EditButtons = <>
          TabOrder = 1
          Visible = True
        end
        object dbedtConPH2: TDBEditEh
          Left = 72
          Top = 74
          Width = 60
          Height = 24
          DataField = 'CondenserFanPH'
          DataSource = ds_paramUSA
          EditButtons = <>
          TabOrder = 2
          Visible = True
        end
        object dbedtConHZ2: TDBEditEh
          Left = 72
          Top = 98
          Width = 60
          Height = 24
          DataField = 'CondenserFanHZ'
          DataSource = ds_paramUSA
          EditButtons = <>
          TabOrder = 3
          Visible = True
        end
        object dbedtConFLA2: TDBEditEh
          Left = 72
          Top = 123
          Width = 60
          Height = 24
          DataField = 'CondenserFanFLA'
          DataSource = ds_paramUSA
          EditButtons = <>
          TabOrder = 4
          Visible = True
        end
        object dbedtConWattb2: TDBEditEh
          Left = 72
          Top = 149
          Width = 60
          Height = 24
          DataField = 'CondenserFanWattb'
          DataSource = ds_paramUSA
          EditButtons = <>
          TabOrder = 5
          Visible = True
        end
      end
      object gboxPower2: TGroupBox
        Left = 240
        Top = 160
        Width = 121
        Height = 100
        Caption = 'Unit Power Supply'
        TabOrder = 7
        object Label32: TLabel
          Left = 7
          Top = 25
          Width = 43
          Height = 16
          Caption = 'Voltage'
        end
        object Label30: TLabel
          Left = 7
          Top = 73
          Width = 16
          Height = 16
          Caption = 'HZ'
        end
        object Label29: TLabel
          Left = 7
          Top = 49
          Width = 18
          Height = 16
          Caption = 'PH'
        end
        object dbedtPowerVol2: TDBEditEh
          Left = 57
          Top = 24
          Width = 60
          Height = 24
          DataField = 'UnitPowerSupplyVoltage'
          DataSource = ds_paramUSA
          EditButtons = <>
          TabOrder = 0
          Visible = True
        end
        object dbedtPowerPH2: TDBEditEh
          Left = 57
          Top = 48
          Width = 60
          Height = 24
          DataField = 'UnitPowerSupplyPH'
          DataSource = ds_paramUSA
          EditButtons = <>
          TabOrder = 1
          Visible = True
        end
        object dbedtPowerHZ2: TDBEditEh
          Left = 57
          Top = 72
          Width = 60
          Height = 24
          DataField = 'UnitPowerSupplyHZ'
          DataSource = ds_paramUSA
          EditButtons = <>
          TabOrder = 2
          Visible = True
        end
      end
      object gboxAmpa2: TGroupBox
        Left = 0
        Top = 259
        Width = 409
        Height = 55
        TabOrder = 8
        object Label21: TLabel
          Left = 8
          Top = 16
          Width = 94
          Height = 32
          Caption = 'Minimum Circuit Ampacity'
          WordWrap = True
        end
        object Label22: TLabel
          Left = 184
          Top = 16
          Width = 143
          Height = 32
          Caption = 'Amps.Max.Branch Circuit.Fuse(Time Delay)'
          WordWrap = True
        end
        object dbedtAmpacity2: TDBEditEh
          Left = 107
          Top = 20
          Width = 70
          Height = 24
          DataField = 'MinCircuitAmpacity'
          DataSource = ds_paramUSA
          EditButtons = <>
          TabOrder = 0
          Visible = True
        end
        object dbedtFuse2: TDBEditEh
          Left = 331
          Top = 20
          Width = 70
          Height = 24
          DataField = 'AmpsMaxBranchCircuitFuse'
          DataSource = ds_paramUSA
          EditButtons = <>
          TabOrder = 1
          Visible = True
        end
      end
      object gboxOrder2: TGroupBox
        Left = 0
        Top = 313
        Width = 497
        Height = 73
        TabOrder = 9
        object Label23: TLabel
          Left = 8
          Top = 16
          Width = 24
          Height = 16
          Caption = 'Qty.'
        end
        object Label24: TLabel
          Left = 8
          Top = 48
          Width = 103
          Height = 16
          Caption = 'Customer PO No.'
        end
        object Label25: TLabel
          Left = 216
          Top = 21
          Width = 81
          Height = 16
          Caption = 'Supplier Code'
        end
        object Label27: TLabel
          Left = 261
          Top = 48
          Width = 45
          Height = 16
          Caption = 'Country'
        end
        object edtProductQty2: TEdit
          Left = 67
          Top = 17
          Width = 135
          Height = 22
          BevelInner = bvLowered
          BevelKind = bkFlat
          BevelOuter = bvRaised
          BorderStyle = bsNone
          Color = clWhite
          Ctl3D = True
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = '??'
          Font.Style = []
          MaxLength = 60
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
          Text = '1'
        end
        object edtSupplierCode2: TEdit
          Left = 307
          Top = 17
          Width = 135
          Height = 22
          BevelInner = bvLowered
          BevelKind = bkFlat
          BevelOuter = bvRaised
          BorderStyle = bsNone
          Color = clWhite
          Ctl3D = True
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = '??'
          Font.Style = []
          MaxLength = 60
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 1
          Text = '79103'
        end
        object edtCountry2: TEdit
          Left = 307
          Top = 44
          Width = 135
          Height = 22
          BevelInner = bvLowered
          BevelKind = bkFlat
          BevelOuter = bvRaised
          BorderStyle = bsNone
          Color = clWhite
          Ctl3D = True
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = '??'
          Font.Style = []
          MaxLength = 60
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 2
          Text = 'USA'
        end
        object dbedtCustomerPONum2: TDBEditEh
          Left = 117
          Top = 45
          Width = 121
          Height = 24
          DataField = 'CustomerPurchaseOrderNumber'
          DataSource = ds_active
          EditButtons = <>
          TabOrder = 3
          Visible = True
        end
      end
      object Button3: TButton
        Left = 16
        Top = 400
        Width = 111
        Height = 26
        Caption = 'Print USA Label 1'
        TabOrder = 10
        OnClick = Button3Click
      end
      object Button4: TButton
        Left = 152
        Top = 400
        Width = 121
        Height = 25
        Caption = 'Print USA Label 2'
        TabOrder = 11
        OnClick = Button4Click
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 28
    Width = 509
    Height = 34
    Align = alTop
    TabOrder = 1
    object Label26: TLabel
      Left = 192
      Top = 11
      Width = 14
      Height = 13
      Caption = 'left'
    end
    object Label31: TLabel
      Left = 336
      Top = 11
      Width = 15
      Height = 13
      Caption = 'top'
    end
    object StaticText15: TStaticText
      Left = 7
      Top = 7
      Width = 74
      Height = 21
      AutoSize = False
      BevelInner = bvLowered
      BevelKind = bkFlat
      BevelOuter = bvRaised
      Caption = 'Printer Port'
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 0
    end
    object EdtPrtPort: TEdit
      Left = 85
      Top = 6
      Width = 86
      Height = 22
      BevelInner = bvLowered
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      Color = clWhite
      Ctl3D = True
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = '??'
      Font.Style = []
      MaxLength = 60
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
      Text = 'LPT1'
    end
    object edtOriginalLeft: TEdit
      Left = 264
      Top = 7
      Width = 49
      Height = 21
      TabOrder = 2
      Text = '10'
    end
    object edtOriginalTop: TEdit
      Left = 408
      Top = 7
      Width = 65
      Height = 21
      TabOrder = 3
      Text = '10'
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 509
    Height = 28
    Align = alTop
    TabOrder = 2
    object DBNavigator1: TDBNavigator
      Left = 13
      Top = 2
      Width = 225
      Height = 22
      DataSource = ds_active
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
      TabOrder = 0
    end
  end
  object ds_active: TDataSource
    Left = 90
    Top = 1
  end
  object adt_model: TADODataSet
    Parameters = <>
    Left = 346
    Top = 1
  end
  object ds_model: TDataSource
    DataSet = adt_model
    Left = 384
    Top = 2
  end
  object adt_paramUSA: TADODataSet
    Parameters = <>
    Left = 242
    Top = 1
  end
  object ds_paramUSA: TDataSource
    DataSet = adt_paramUSA
    Left = 282
    Top = 1
  end
  object adt_paramCUD: TADODataSet
    Parameters = <>
    Left = 146
    Top = 1
  end
  object ds_paramCUD: TDataSource
    DataSet = adt_paramCUD
    Left = 186
    Top = 1
  end
end
