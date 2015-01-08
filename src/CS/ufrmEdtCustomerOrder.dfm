inherited frmEdtCustomerOrder: TfrmEdtCustomerOrder
  Left = 443
  Top = 4
  Height = 742
  Caption = 'frmEdtCustomerOrder'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 26
    Width = 680
    Height = 678
    Align = alClient
    TabOrder = 0
    object Label14: TLabel
      Left = 108
      Top = 7
      Width = 59
      Height = 13
      Caption = 'Order States'
    end
    object Label10: TLabel
      Left = 13
      Top = 7
      Width = 40
      Height = 13
      Caption = 'Order ID'
    end
    object Label21: TLabel
      Left = 258
      Top = 8
      Width = 66
      Height = 13
      Caption = 'Contract Date'
    end
    object Label24: TLabel
      Left = 401
      Top = 7
      Width = 34
      Height = 13
      Caption = 'Creator'
    end
    object dbedtCustomerOrderID: TDBEditEh
      Left = 55
      Top = 4
      Width = 49
      Height = 21
      Color = clBtnFace
      DataField = 'CustomerOrderID'
      DataSource = ds_active
      EditButtons = <>
      ReadOnly = True
      TabOrder = 11
      Visible = True
      OnChange = dbedtCustomerOrderIDChange
    end
    object gboxCOBasicInfor: TGroupBox
      Left = 5
      Top = 26
      Width = 395
      Height = 225
      Caption = 'Basic Information'
      TabOrder = 0
      object Label4: TLabel
        Left = 8
        Top = 21
        Width = 72
        Height = 13
        Caption = 'Customer Code'
      end
      object LabelPrice: TLabel
        Left = 8
        Top = 148
        Width = 24
        Height = 13
        Caption = 'Price'
      end
      object Label7: TLabel
        Left = 8
        Top = 70
        Width = 29
        Height = 13
        Caption = 'Model'
      end
      object Label6: TLabel
        Left = 8
        Top = 124
        Width = 48
        Height = 13
        Caption = 'Order Qty.'
      end
      object Label18: TLabel
        Left = 8
        Top = 95
        Width = 85
        Height = 13
        Caption = 'Model Description'
      end
      object Label19: TLabel
        Left = 8
        Top = 46
        Width = 75
        Height = 13
        Caption = 'Customer Name'
      end
      object LabelTotalAmount: TLabel
        Left = 237
        Top = 151
        Width = 63
        Height = 13
        Caption = 'Total Amount'
      end
      object Label23: TLabel
        Left = 8
        Top = 176
        Width = 24
        Height = 13
        Caption = 'Plant'
      end
      object LabelBusinessApplication: TLabel
        Left = 183
        Top = 179
        Width = 97
        Height = 13
        Caption = 'Business Application'
      end
      object Label29: TLabel
        Left = 8
        Top = 203
        Width = 73
        Height = 13
        Caption = 'Model Involved'
      end
      object dbcbbModel: TDBLookupComboboxEh
        Left = 96
        Top = 69
        Width = 290
        Height = 21
        DataField = 'ModelID'
        DataSource = ds_active
        DropDownBox.Columns = <
          item
            FieldName = 'Model'
            Width = 290
          end
          item
            FieldName = 'ModelDescription'
          end>
        DropDownBox.Options = [dlgColumnResizeEh, dlgColLinesEh, dlgRowLinesEh, dlgAutoSortMarkingEh, dlgMultiSortMarkingEh]
        DropDownBox.UseMultiTitle = True
        DropDownBox.ShowTitles = True
        DropDownBox.Sizable = True
        EditButtons = <>
        KeyField = 'ModelID'
        ListField = 'Model'
        ListSource = ds_model
        TabOrder = 1
        Visible = True
        OnExit = dbcbbModelExit
      end
      object dbcbbCustomer: TDBLookupComboboxEh
        Left = 96
        Top = 18
        Width = 290
        Height = 21
        DataField = 'CustomerID'
        DataSource = ds_active
        DropDownBox.Columns = <
          item
            FieldName = 'CustomerNumber'
            Title.Caption = 'Customer No.'
            Width = 60
          end
          item
            FieldName = 'CustomerName'
            Title.Caption = 'Customer Name'
            Width = 100
          end>
        DropDownBox.Options = [dlgColumnResizeEh, dlgColLinesEh, dlgRowLinesEh, dlgAutoSortMarkingEh, dlgMultiSortMarkingEh]
        DropDownBox.UseMultiTitle = True
        DropDownBox.ShowTitles = True
        DropDownBox.Sizable = True
        EditButtons = <>
        KeyField = 'CustomerID'
        ListField = 'CustomerNumber'
        ListSource = ds_customer
        TabOrder = 0
        Visible = True
      end
      object dbedtOrderQty: TDBEditEh
        Left = 96
        Top = 121
        Width = 121
        Height = 21
        DataField = 'CustomerOrderQuantity'
        DataSource = ds_active
        EditButtons = <>
        TabOrder = 2
        Visible = True
        OnExit = dbedtOrderQtyExit
        OnKeyPress = dbedtOrderQtyKeyPress
      end
      object dbedtPrice: TDBEditEh
        Left = 164
        Top = 147
        Width = 69
        Height = 21
        DataField = 'Price'
        DataSource = ds_active
        EditButtons = <>
        TabOrder = 3
        Visible = True
        OnExit = dbedtPriceExit
      end
      object edtModelDesc: TEdit
        Left = 96
        Top = 94
        Width = 290
        Height = 21
        ReadOnly = True
        TabOrder = 4
      end
      object edtCustomerName: TEdit
        Left = 96
        Top = 42
        Width = 290
        Height = 21
        TabOrder = 5
      end
      object dbcbbCurrency: TDBComboBoxEh
        Left = 95
        Top = 147
        Width = 65
        Height = 21
        DataField = 'Currency'
        DataSource = ds_active
        EditButtons = <>
        Items.Strings = (
          'RMB'
          'USD')
        KeyItems.Strings = (
          'RMB'
          'USD')
        TabOrder = 6
        Visible = True
      end
      object dbedtTotalAmount: TDBEditEh
        Left = 303
        Top = 147
        Width = 81
        Height = 21
        DataField = 'TotalAmount'
        DataSource = ds_active
        EditButtons = <>
        TabOrder = 7
        Visible = True
      end
      object dbcbbPlant: TDBLookupComboboxEh
        Left = 95
        Top = 174
        Width = 82
        Height = 21
        DataField = 'PlantID'
        DataSource = ds_active
        EditButtons = <>
        KeyField = 'PlantID'
        ListField = 'PlantCode'
        ListSource = ds_plant
        TabOrder = 8
        Visible = True
      end
      object dbcbbBusinessApplication: TDBLookupComboboxEh
        Left = 285
        Top = 175
        Width = 98
        Height = 21
        DataField = 'BusinessApplicationID'
        DataSource = ds_active
        EditButtons = <>
        KeyField = 'BusinessApplicationID'
        ListField = 'BusinessApplicationName'
        ListSource = ds_business
        TabOrder = 9
        Visible = True
      end
      object DBEditEh1: TDBEditEh
        Left = 96
        Top = 199
        Width = 284
        Height = 21
        DataField = 'ModelInvolved'
        DataSource = ds_active
        EditButtons = <>
        TabOrder = 10
        Visible = True
      end
    end
    object gboxCOInfor: TGroupBox
      Left = 5
      Top = 258
      Width = 395
      Height = 97
      Caption = 'Order Information'
      TabOrder = 2
      object Label13: TLabel
        Left = 8
        Top = 70
        Width = 37
        Height = 13
        Caption = 'Remark'
      end
      object Label11: TLabel
        Left = 8
        Top = 46
        Width = 82
        Height = 13
        Caption = 'Customer PO No.'
      end
      object Label16: TLabel
        Left = 9
        Top = 21
        Width = 23
        Height = 13
        Caption = 'RTD'
      end
      object dbdtpRTD: TDBDateTimeEditEh
        Left = 96
        Top = 17
        Width = 288
        Height = 21
        DataField = 'RTD'
        DataSource = ds_active
        EditButtons = <>
        TabOrder = 0
        Visible = True
        OnExit = dbdtpRTDExit
        EditFormat = 'YYYY-MM-DD'
      end
      object dbedtCustomerPONo: TDBEditEh
        Left = 96
        Top = 45
        Width = 290
        Height = 21
        DataField = 'CustomerPurchaseOrderNumber'
        DataSource = ds_active
        EditButtons = <>
        TabOrder = 1
        Visible = True
      end
      object dbedtRemark: TDBEditEh
        Left = 96
        Top = 70
        Width = 290
        Height = 21
        DataField = 'Remark'
        DataSource = ds_active
        EditButtons = <>
        TabOrder = 2
        Visible = True
      end
    end
    object gboxCOConfirm: TGroupBox
      Left = 5
      Top = 359
      Width = 395
      Height = 128
      Caption = 'Confirm Information'
      TabOrder = 3
      object Label1: TLabel
        Left = 10
        Top = 21
        Width = 22
        Height = 13
        Caption = 'ETD'
      end
      object Label9: TLabel
        Left = 25
        Top = 47
        Width = 54
        Height = 13
        Caption = 'Delay Type'
      end
      object Label22: TLabel
        Left = 25
        Top = 71
        Width = 67
        Height = 13
        Caption = 'Dealy Remark'
      end
      object sbtnAddDelay: TSpeedButton
        Left = 367
        Top = 42
        Width = 23
        Height = 22
        Caption = '+'
        OnClick = sbtnAddDelayClick
      end
      object dbcbbDelay: TDBLookupComboboxEh
        Left = 96
        Top = 43
        Width = 260
        Height = 21
        DataField = 'ReasonOfDelayID'
        DataSource = ds_active
        EditButtons = <>
        KeyField = 'ReasonOfDelayID'
        ListField = 'ReasonOfDelayDesc'
        ListSource = ds_delay
        TabOrder = 1
        Visible = True
        OnChange = dbcbbDelayChange
      end
      object dbdtpETD: TDBDateTimeEditEh
        Left = 96
        Top = 17
        Width = 288
        Height = 21
        DataField = 'ETD'
        DataSource = ds_active
        EditButtons = <>
        TabOrder = 0
        Visible = True
        OnChange = dbdtpETDChange
        EditFormat = 'YYYY-MM-DD'
      end
      object chkDelay: TCheckBox
        Left = 8
        Top = 45
        Width = 17
        Height = 17
        TabOrder = 2
        OnClick = chkDelayClick
      end
      object dbedtDelayRemark: TDBEditEh
        Left = 96
        Top = 69
        Width = 289
        Height = 21
        DataField = 'ReasonOfDelayRemark'
        DataSource = ds_active
        EditButtons = <>
        TabOrder = 3
        Visible = True
      end
      object dbchkBonded: TDBCheckBoxEh
        Left = 8
        Top = 99
        Width = 72
        Height = 17
        Caption = 'Is Bonded'
        DataField = 'IsBonded'
        DataSource = ds_active
        TabOrder = 4
        ValueChecked = 'True'
        ValueUnchecked = 'False'
      end
      object Button1: TButton
        Left = 258
        Top = 97
        Width = 105
        Height = 23
        Caption = 'Mail: DelayReson'
        TabOrder = 5
        OnClick = Button1Click
      end
    end
    object gboxCONumber: TGroupBox
      Left = 5
      Top = 496
      Width = 395
      Height = 70
      Caption = 'Order Number Assign By Mainframe'
      TabOrder = 4
      object Label2: TLabel
        Left = 210
        Top = 47
        Width = 55
        Height = 13
        Caption = 'Invoice No.'
      end
      object Label3: TLabel
        Left = 11
        Top = 22
        Width = 29
        Height = 13
        Caption = 'M No.'
      end
      object Label8: TLabel
        Left = 10
        Top = 49
        Width = 46
        Height = 13
        Caption = 'Order No.'
      end
      object dbedtInvoiceNumber: TDBEditEh
        Left = 272
        Top = 43
        Width = 105
        Height = 21
        DataField = 'InvoiceNumber'
        DataSource = ds_active
        EditButtons = <>
        TabOrder = 2
        Visible = True
      end
      object dbedtMNumber: TDBEditEh
        Left = 96
        Top = 19
        Width = 105
        Height = 21
        DataField = 'MNumber'
        DataSource = ds_active
        EditButtons = <>
        TabOrder = 0
        Visible = True
      end
      object dbedtOrderNumber: TDBEditEh
        Left = 96
        Top = 46
        Width = 105
        Height = 21
        DataField = 'CustomerOrderNumber'
        DataSource = ds_active
        EditButtons = <>
        TabOrder = 1
        Visible = True
      end
    end
    object gboxCORelease: TGroupBox
      Left = 403
      Top = 115
      Width = 270
      Height = 65
      Caption = 'Order Release'
      TabOrder = 7
      object Label12: TLabel
        Left = 5
        Top = 18
        Width = 52
        Height = 13
        Caption = 'OINQ Qty.:'
      end
      object Label15: TLabel
        Left = 120
        Top = 16
        Width = 94
        Height = 13
        Caption = 'OINQ Release Qty.:'
      end
      object Label17: TLabel
        Left = 6
        Top = 42
        Width = 112
        Height = 13
        Caption = 'Actual Release CO Qty.'
      end
      object dbtxtOINQQty: TDBText
        Left = 64
        Top = 18
        Width = 49
        Height = 17
        DataField = 'OINQCOQuantity'
        DataSource = ds_active
      end
      object dbtxtOINQReleaseQty: TDBText
        Left = 216
        Top = 16
        Width = 41
        Height = 17
        DataField = 'OINQReleaseCOQuantity'
        DataSource = ds_active
      end
      object dbedtActualReleaseCOQty: TDBEditEh
        Left = 122
        Top = 38
        Width = 65
        Height = 21
        DataField = 'ActualReleaseCOQuantity'
        DataSource = ds_active
        EditButtons = <>
        TabOrder = 0
        Visible = True
      end
    end
    object gboxBOM: TGroupBox
      Left = 404
      Top = 181
      Width = 269
      Height = 128
      Caption = 'BOM'
      TabOrder = 8
      object gridBOM: TDBGridEh
        Left = 2
        Top = 15
        Width = 265
        Height = 111
        Align = alClient
        DataSource = ds_bom
        Flat = True
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        UseMultiTitle = True
        Columns = <
          item
            EditButtons = <>
            FieldName = 'ComponentItem'
            Footers = <>
            Title.Caption = 'Component No.'
            Width = 125
          end
          item
            EditButtons = <>
            FieldName = 'ComponentDescription'
            Footers = <>
            Title.Caption = 'Component Desc.'
            Width = 58
          end
          item
            EditButtons = <>
            FieldName = 'ComponentQuantity'
            Footers = <>
            Title.Caption = 'Component Qty.'
            Width = 59
          end
          item
            EditButtons = <>
            FieldName = 'ComponentSeriesName'
            Footers = <>
            Title.Caption = 'Component Series'
            Width = 74
          end>
      end
    end
    object gboxPayment: TGroupBox
      Left = 403
      Top = 26
      Width = 270
      Height = 41
      Caption = 'Payment'
      TabOrder = 1
      object Label5: TLabel
        Left = 6
        Top = 18
        Width = 41
        Height = 13
        Caption = 'Payment'
      end
      object dbedtPayment: TDBEditEh
        Left = 54
        Top = 15
        Width = 209
        Height = 21
        DataField = 'Payment'
        DataSource = ds_active
        EditButtons = <>
        TabOrder = 0
        Visible = True
      end
    end
    object gboxShip: TGroupBox
      Left = 403
      Top = 68
      Width = 270
      Height = 44
      Caption = 'Ship'
      TabOrder = 6
      object Label20: TLabel
        Left = 8
        Top = 20
        Width = 22
        Height = 13
        Caption = 'ATD'
      end
      object dbdtpATD: TDBDateTimeEditEh
        Left = 56
        Top = 17
        Width = 209
        Height = 21
        DataField = 'ATD'
        DataSource = ds_active
        EditButtons = <>
        TabOrder = 0
        Visible = True
        EditFormat = 'YYYY-MM-DD'
      end
    end
    object dbdtpContractDate: TDBDateTimeEditEh
      Left = 327
      Top = 4
      Width = 70
      Height = 21
      Color = clBtnFace
      DataField = 'ContractDate'
      DataSource = ds_active
      EditButton.Visible = False
      EditButtons = <>
      Kind = dtkDateEh
      ReadOnly = True
      TabOrder = 12
      Visible = True
    end
    object gboxCOChangeLog: TGroupBox
      Left = 405
      Top = 313
      Width = 269
      Height = 126
      Caption = 'Customer Order Change Log'
      TabOrder = 9
      object gridLog: TDBGridEh
        Left = 2
        Top = 15
        Width = 265
        Height = 109
        Align = alClient
        DataSource = ds_Log
        Flat = True
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            EditButtons = <>
            FieldName = 'ChangeField'
            Footers = <>
            Title.Caption = 'Change Field'
            Width = 65
          end
          item
            EditButtons = <>
            FieldName = 'CustomerOrderQuantity'
            Footers = <>
            Title.Caption = 'Qty.'
            Width = 25
          end
          item
            EditButtons = <>
            FieldName = 'RTD'
            Footers = <>
            Width = 58
          end
          item
            EditButtons = <>
            FieldName = 'ETD'
            Footers = <>
            Width = 58
          end
          item
            EditButtons = <>
            FieldName = 'ChangeTime'
            Footers = <>
            Title.Caption = 'Change Time'
            Width = 71
          end
          item
            EditButtons = <>
            FieldName = 'displayname'
            Footers = <>
            Title.Caption = 'Change By'
            Width = 69
          end>
      end
    end
    object dbedtCreator: TDBEditEh
      Left = 525
      Top = 4
      Width = 67
      Height = 21
      Color = clBtnFace
      DataField = 'DisplayName'
      DataSource = ds_active
      EditButtons = <>
      TabOrder = 13
      Visible = False
    end
    object gboxFreight: TGroupBox
      Left = 5
      Top = 570
      Width = 396
      Height = 105
      Caption = 'Destination && Freight'
      TabOrder = 5
      object Label25: TLabel
        Left = 16
        Top = 16
        Width = 32
        Height = 13
        Caption = 'Freight'
      end
      object Label26: TLabel
        Left = 16
        Top = 42
        Width = 53
        Height = 13
        Caption = 'Destination'
      end
      object Label30: TLabel
        Left = 16
        Top = 78
        Width = 47
        Height = 13
        Caption = 'Forwarder'
      end
      object dbedtFreight: TDBEditEh
        Left = 96
        Top = 16
        Width = 121
        Height = 21
        DataField = 'Freight'
        DataSource = ds_active
        EditButtons = <>
        TabOrder = 0
        Visible = True
      end
      object dbedtDestination: TDBEditEh
        Left = 96
        Top = 44
        Width = 289
        Height = 21
        DataField = 'Destination'
        DataSource = ds_active
        EditButtons = <>
        TabOrder = 1
        Visible = True
      end
      object dbcbbForwarder: TDBLookupComboboxEh
        Left = 96
        Top = 74
        Width = 290
        Height = 21
        DataField = 'ForwarderID'
        DataSource = ds_active
        DropDownBox.Options = [dlgColumnResizeEh, dlgColLinesEh, dlgRowLinesEh, dlgAutoSortMarkingEh, dlgMultiSortMarkingEh]
        DropDownBox.UseMultiTitle = True
        DropDownBox.ShowTitles = True
        DropDownBox.Sizable = True
        EditButtons = <>
        KeyField = 'ForwarderID'
        ListField = 'ForwarderName'
        ListSource = ds_forwarder
        TabOrder = 2
        Visible = True
      end
    end
    object gboxATA: TGroupBox
      Left = 405
      Top = 438
      Width = 268
      Height = 64
      TabOrder = 10
      object Label27: TLabel
        Left = 16
        Top = 15
        Width = 21
        Height = 13
        Caption = 'ETA'
      end
      object Label28: TLabel
        Left = 16
        Top = 42
        Width = 21
        Height = 13
        Caption = 'ATA'
      end
      object dbdtpETA: TDBDateTimeEditEh
        Left = 48
        Top = 11
        Width = 204
        Height = 21
        DataField = 'ETA'
        DataSource = ds_active
        EditButtons = <>
        TabOrder = 0
        Visible = True
        EditFormat = 'YYYY-MM-DD'
      end
      object dbdtpATA: TDBDateTimeEditEh
        Left = 48
        Top = 38
        Width = 204
        Height = 21
        DataField = 'ATA'
        DataSource = ds_active
        EditButtons = <>
        TabOrder = 1
        Visible = True
        EditFormat = 'YYYY-MM-DD'
      end
    end
    object dbcbbLoginID: TDBLookupComboboxEh
      Left = 439
      Top = 3
      Width = 82
      Height = 21
      DataField = 'LoginID'
      DataSource = ds_active
      EditButtons = <>
      KeyField = 'LoginID'
      ListField = 'DisplayName'
      ListSource = ds_login
      TabOrder = 16
      Visible = True
    end
    object GroupBox3: TGroupBox
      Left = 405
      Top = 504
      Width = 267
      Height = 45
      Caption = 'Instruction'
      TabOrder = 14
      object dbedtInstruction: TDBEditEh
        Left = 5
        Top = 19
        Width = 256
        Height = 21
        DataField = 'Instruction'
        DataSource = ds_active
        EditButtons = <>
        TabOrder = 0
        Visible = True
      end
    end
    object dbcbbOrderStates: TDBLookupComboboxEh
      Left = 169
      Top = 5
      Width = 88
      Height = 21
      DataField = 'CustomerOrderStatesID'
      DataSource = ds_active
      EditButtons = <>
      KeyField = 'CustomerOrderStatesID'
      ListField = 'CustomerOrderStatesName'
      ListSource = ds_states
      TabOrder = 15
      Visible = True
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 680
    Height = 26
    Align = alTop
    TabOrder = 1
    object DBNavigator1: TDBNavigator
      Left = 0
      Top = 0
      Width = 240
      Height = 22
      DataSource = ds_active
      TabOrder = 0
    end
  end
  object adt_model: TADODataSet
    AfterScroll = adt_modelAfterScroll
    Parameters = <>
    Left = 242
    Top = 1
  end
  object ds_model: TDataSource
    DataSet = adt_model
    Left = 280
    Top = 2
  end
  object ds_customer: TDataSource
    DataSet = adt_customer
    Left = 208
  end
  object adt_customer: TADODataSet
    CursorType = ctStatic
    AfterScroll = adt_customerAfterScroll
    Parameters = <>
    Left = 176
  end
  object ds_delay: TDataSource
    DataSet = adt_delay
    Left = 344
    Top = 2
  end
  object adt_delay: TADODataSet
    Parameters = <>
    Left = 314
    Top = 1
  end
  object ds_active: TDataSource
    Left = 66
    Top = 1
  end
  object ds_bom: TDataSource
    DataSet = adt_bom
    Left = 410
    Top = 1
  end
  object adt_bom: TADODataSet
    Parameters = <>
    Left = 378
    Top = 1
    object adt_bomModelID: TIntegerField
      FieldName = 'ModelID'
    end
    object adt_bomComponentID: TIntegerField
      FieldName = 'ComponentID'
    end
    object adt_bomModel: TStringField
      FieldName = 'Model'
      Size = 25
    end
    object adt_bomComponentItem: TStringField
      FieldName = 'ComponentItem'
      Size = 11
    end
    object adt_bomComponentDescription: TStringField
      FieldName = 'ComponentDescription'
      Size = 30
    end
    object adt_bomComponentQuantity: TFloatField
      FieldName = 'ComponentQuantity'
    end
    object adt_bomValidFrom: TDateTimeField
      FieldName = 'ValidFrom'
    end
    object adt_bomValidUntil: TDateTimeField
      FieldName = 'ValidUntil'
    end
    object adt_bomComponentSeriesName: TStringField
      FieldName = 'ComponentSeriesName'
      Size = 30
    end
  end
  object PropStorageEh1: TPropStorageEh
    StoredProps.Strings = (
      '<P>.ActiveControl'
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width'
      '<P>.WindowState'
      'Panel1.gboxBOM.gridBOM.<P>.Columns.ColumnsIndex'
      'Panel1.gboxBOM.gridBOM.<P>.Columns.<ForAllItems>.Width')
    Left = 538
    Top = 6
  end
  object adt_Log: TADODataSet
    Parameters = <>
    Left = 450
    Top = 1
    object adt_LogCustomerOrderChangeLogID: TAutoIncField
      FieldName = 'CustomerOrderChangeLogID'
      ReadOnly = True
    end
    object adt_LogCustomerOrderID: TIntegerField
      FieldName = 'CustomerOrderID'
    end
    object adt_LogCustomerOrderQuantity: TFloatField
      FieldName = 'CustomerOrderQuantity'
    end
    object adt_LogRTD: TDateTimeField
      FieldName = 'RTD'
    end
    object adt_LogETD: TDateTimeField
      FieldName = 'ETD'
    end
    object adt_LogChangeField: TStringField
      FieldName = 'ChangeField'
      Size = 30
    end
    object adt_LogChangeTime: TDateTimeField
      FieldName = 'ChangeTime'
    end
    object adt_LogChangeBy: TIntegerField
      FieldName = 'ChangeBy'
    end
  end
  object ds_Log: TDataSource
    DataSet = adt_Log
    Left = 482
    Top = 1
  end
  object ds_business: TDataSource
    DataSet = adt_business
    Left = 608
    Top = 75
  end
  object adt_business: TADODataSet
    Parameters = <>
    Left = 570
    Top = 76
  end
  object ds_plant: TDataSource
    DataSet = adt_plant
    Left = 506
    Top = 73
  end
  object adt_plant: TADODataSet
    Parameters = <>
    Left = 472
    Top = 75
  end
  object ds_login: TDataSource
    DataSet = adt_login
    Left = 616
    Top = 26
  end
  object adt_login: TADODataSet
    CursorType = ctStatic
    Parameters = <>
    Left = 586
    Top = 25
  end
  object adt_forwarder: TADODataSet
    CursorType = ctStatic
    Parameters = <>
    Left = 274
    Top = 601
    object adt_forwarderForwarderID: TAutoIncField
      FieldName = 'ForwarderID'
      ReadOnly = True
    end
    object adt_forwarderForwarderName: TStringField
      FieldName = 'ForwarderName'
      Size = 10
    end
  end
  object ds_forwarder: TDataSource
    DataSet = adt_forwarder
    Left = 306
    Top = 601
  end
  object ds_states: TDataSource
    DataSet = adt_states
    Left = 130
    Top = 1
  end
  object adt_states: TADODataSet
    CursorType = ctStatic
    CommandText = 'select * from CustomerOrderStates'
    Parameters = <>
    Left = 98
    Top = 1
    object adt_statesCustomerOrderStatesID: TAutoIncField
      FieldName = 'CustomerOrderStatesID'
      ReadOnly = True
    end
    object adt_statesCustomerOrderStatesName: TStringField
      FieldName = 'CustomerOrderStatesName'
      Size = 15
    end
    object adt_statesCustomerOrderStatesDesc: TStringField
      FieldName = 'CustomerOrderStatesDesc'
      Size = 50
    end
    object adt_statesOverseaCustomerOrderStatesName: TStringField
      FieldName = 'OverseaCustomerOrderStatesName'
      Size = 15
    end
  end
  object IdHTTP1: TIdHTTP
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 520
    Top = 610
  end
end
