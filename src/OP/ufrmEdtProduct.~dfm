inherited frmEdtProduct: TfrmEdtProduct
  Left = 533
  Top = 229
  Width = 748
  Height = 352
  Caption = 'frmEdtProduct'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Label14: TLabel
    Left = 271
    Top = 31
    Width = 75
    Height = 13
    Caption = 'Tracking States'
  end
  object Label21: TLabel
    Left = 116
    Top = 32
    Width = 77
    Height = 13
    Caption = 'Production Time'
  end
  object Label10: TLabel
    Left = 5
    Top = 31
    Width = 56
    Height = 13
    Caption = 'Tracking ID'
  end
  object dbdtpProductionTime: TDBDateTimeEditEh
    Left = 196
    Top = 28
    Width = 70
    Height = 21
    Color = clBtnFace
    DataField = 'ProductionStartTime'
    DataSource = ds_active
    EditButton.Visible = False
    EditButtons = <>
    Kind = dtkDateEh
    ReadOnly = True
    TabOrder = 1
    Visible = True
  end
  object dbedtTrackingID: TDBEditEh
    Left = 63
    Top = 28
    Width = 49
    Height = 21
    Color = clBtnFace
    DataField = 'ProductTrackingID'
    DataSource = ds_active
    EditButtons = <>
    ReadOnly = True
    TabOrder = 0
    Visible = True
    OnChange = dbedtTrackingIDChange
  end
  object gboxCOInfor: TGroupBox
    Left = 5
    Top = 50
    Width = 395
    Height = 135
    Caption = 'Order Information'
    TabOrder = 2
    object Label4: TLabel
      Left = 8
      Top = 21
      Width = 64
      Height = 13
      Caption = 'Customer No.'
    end
    object Label7: TLabel
      Left = 8
      Top = 62
      Width = 29
      Height = 13
      Caption = 'Model'
    end
    object dbtxtCustomerNumber: TDBText
      Left = 88
      Top = 21
      Width = 121
      Height = 17
      DataField = 'CustomerNumber'
      DataSource = ds_active
    end
    object dbtxtModel: TDBText
      Left = 88
      Top = 62
      Width = 290
      Height = 17
      DataField = 'Model'
      DataSource = ds_active
    end
    object dbtxtCustomerName: TDBText
      Left = 88
      Top = 42
      Width = 290
      Height = 17
      DataField = 'CustomerName'
      DataSource = ds_active
    end
    object Label9: TLabel
      Left = 8
      Top = 40
      Width = 75
      Height = 13
      Caption = 'Customer Name'
    end
    object Label16: TLabel
      Left = 9
      Top = 85
      Width = 23
      Height = 13
      Caption = 'RTD'
    end
    object Label1: TLabel
      Left = 10
      Top = 111
      Width = 22
      Height = 13
      Caption = 'ETD'
    end
    object dbdtpRTD: TDBDateTimeEditEh
      Left = 88
      Top = 81
      Width = 290
      Height = 21
      DataField = 'RTD'
      DataSource = ds_active
      EditButtons = <>
      TabOrder = 0
      Visible = True
      EditFormat = 'YYYY-MM-DD'
    end
    object dbdtpETD: TDBDateTimeEditEh
      Left = 88
      Top = 107
      Width = 290
      Height = 21
      DataField = 'ETD'
      DataSource = ds_active
      EditButtons = <>
      TabOrder = 1
      Visible = True
      EditFormat = 'YYYY-MM-DD'
    end
  end
  object gboxProductionInfo: TGroupBox
    Left = 6
    Top = 231
    Width = 395
    Height = 73
    Caption = 'Production Information'
    TabOrder = 4
    object Label2: TLabel
      Left = 8
      Top = 20
      Width = 58
      Height = 13
      Caption = 'Product SN.'
    end
    object Label3: TLabel
      Left = 8
      Top = 48
      Width = 71
      Height = 13
      Caption = 'Warranty Code'
    end
    object dbedtProductSN: TDBEditEh
      Left = 96
      Top = 17
      Width = 290
      Height = 21
      DataField = 'ProductSerialNumber'
      DataSource = ds_active
      EditButtons = <>
      TabOrder = 0
      Visible = True
    end
    object dbedtWaCode: TDBEditEh
      Left = 96
      Top = 44
      Width = 290
      Height = 21
      DataField = 'WarrentycardCode'
      DataSource = ds_active
      EditButtons = <>
      TabOrder = 1
      Visible = True
    end
  end
  object gboxScheduleInfo: TGroupBox
    Left = 5
    Top = 188
    Width = 395
    Height = 40
    Caption = 'Schedule Information'
    TabOrder = 3
    object Label5: TLabel
      Left = 8
      Top = 16
      Width = 59
      Height = 13
      Caption = 'Schedule ID'
    end
    object dbtxtScheduleID: TDBText
      Left = 80
      Top = 16
      Width = 65
      Height = 17
      DataField = 'ProductionScheduleID'
      DataSource = ds_active
    end
    object Label6: TLabel
      Left = 153
      Top = 16
      Width = 20
      Height = 13
      Caption = 'Line'
    end
    object dbtxtLine: TDBText
      Left = 180
      Top = 16
      Width = 56
      Height = 17
      DataField = 'Line'
      DataSource = ds_active
    end
    object Label8: TLabel
      Left = 240
      Top = 16
      Width = 71
      Height = 13
      Caption = 'Schedule Time'
    end
    object dbdtpScheduleStartTime: TDBDateTimeEditEh
      Left = 317
      Top = 13
      Width = 70
      Height = 21
      Color = clBtnFace
      DataField = 'ScheduleStartTime'
      DataSource = ds_active
      EditButton.Visible = False
      EditButtons = <>
      Kind = dtkDateEh
      ReadOnly = True
      TabOrder = 0
      Visible = True
    end
  end
  object gboxTrackComponent: TGroupBox
    Left = 403
    Top = 50
    Width = 318
    Height = 254
    Caption = 'Component Information'
    TabOrder = 5
    object gridComponent: TDBGrid
      Left = 2
      Top = 40
      Width = 314
      Height = 212
      Align = alClient
      DataSource = ds_component
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'ComponentSerialNumber'
          Title.Caption = 'Component SN.'
          Width = 96
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ComponentItem'
          ReadOnly = True
          Title.Caption = 'Component Item'
          Width = 97
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ComponentSeriesName'
          ReadOnly = True
          Title.Caption = 'Component Series Name'
          Width = 122
          Visible = True
        end>
    end
    object DBNavigator2: TDBNavigator
      Left = 2
      Top = 15
      Width = 314
      Height = 25
      DataSource = ds_component
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
      Align = alTop
      TabOrder = 1
    end
  end
  object dbcbbProductTrackingStates: TDBLookupComboboxEh
    Left = 444
    Top = 27
    Width = 121
    Height = 21
    Color = clBtnFace
    DataField = 'ProductTrackingStatesID'
    DataSource = ds_active
    EditButtons = <>
    KeyField = 'ProductTrackingStatesID'
    ListField = 'ProductTrackingStatesName'
    ListSource = ds_trackingStates
    TabOrder = 6
    Visible = True
  end
  object dbedtTrackingStates: TDBEditEh
    Left = 350
    Top = 27
    Width = 93
    Height = 21
    Color = clBtnFace
    DataField = 'ProductTrackingStatesName'
    DataSource = ds_active
    EditButtons = <>
    ReadOnly = True
    TabOrder = 7
    Visible = True
  end
  object DBNavigator1: TDBNavigator
    Left = 7
    Top = 4
    Width = 232
    Height = 22
    DataSource = ds_active
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
    TabOrder = 8
  end
  object ds_active: TDataSource
    Left = 66
    Top = 1
  end
  object ds_component: TDataSource
    DataSet = adt_component
    Left = 482
    Top = 1
  end
  object adt_component: TADODataSet
    Connection = DM.ADOConnection1
    CommandText = 'select * from ViewProductComponentTracking'
    Parameters = <>
    Left = 450
    Top = 1
    object adt_componentProductComponentTrackingID: TAutoIncField
      FieldName = 'ProductComponentTrackingID'
      ReadOnly = True
    end
    object adt_componentProductTrackingID: TIntegerField
      FieldName = 'ProductTrackingID'
    end
    object adt_componentComponentID: TIntegerField
      FieldName = 'ComponentID'
    end
    object adt_componentComponentSerialNumber: TStringField
      FieldName = 'ComponentSerialNumber'
      Size = 25
    end
    object adt_componentComponentItem: TStringField
      FieldName = 'ComponentItem'
      Size = 30
    end
    object adt_componentComponentSeriesID: TIntegerField
      FieldName = 'ComponentSeriesID'
    end
    object adt_componentComponentSeriesName: TStringField
      FieldName = 'ComponentSeriesName'
      Size = 30
    end
  end
  object adt_trackingStates: TADODataSet
    Parameters = <>
    Left = 274
    Top = 1
  end
  object ds_trackingStates: TDataSource
    DataSet = adt_trackingStates
    Left = 314
    Top = 1
  end
end
