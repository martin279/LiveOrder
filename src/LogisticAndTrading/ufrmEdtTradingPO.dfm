inherited frmEdtTradingPO: TfrmEdtTradingPO
  Left = 347
  Top = 159
  Width = 888
  Height = 526
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Label58: TLabel
    Left = 432
    Top = 6
    Width = 43
    Height = 13
    Caption = 'Order ID:'
  end
  object Label60: TLabel
    Left = 616
    Top = 6
    Width = 72
    Height = 13
    Caption = 'Logistic Status:'
  end
  object Label11: TLabel
    Left = 258
    Top = 6
    Width = 32
    Height = 13
    Caption = 'PO ID:'
  end
  object DBNavigator1: TDBNavigator
    Left = 8
    Top = 3
    Width = 222
    Height = 18
    DataSource = ds_active
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbPost, nbCancel]
    Flat = True
    TabOrder = 0
  end
  object gboxCOBasicInfor: TGroupBox
    Left = 5
    Top = 24
    Width = 860
    Height = 84
    Caption = 'Trading CO Info.'
    Color = clMoneyGreen
    ParentColor = False
    TabOrder = 1
    object Label4: TLabel
      Left = 8
      Top = 21
      Width = 72
      Height = 13
      Caption = 'Customer Code'
    end
    object LabelPrice: TLabel
      Left = 389
      Top = 42
      Width = 55
      Height = 13
      Caption = 'Invoice No.'
    end
    object Label7: TLabel
      Left = 8
      Top = 63
      Width = 29
      Height = 13
      Caption = 'Model'
    end
    object Label6: TLabel
      Left = 245
      Top = 63
      Width = 46
      Height = 13
      Caption = 'Order No.'
    end
    object Label18: TLabel
      Left = 245
      Top = 42
      Width = 29
      Height = 13
      Caption = 'M No.'
    end
    object Label19: TLabel
      Left = 8
      Top = 42
      Width = 75
      Height = 13
      Caption = 'Customer Name'
    end
    object LabelTotalAmount: TLabel
      Left = 245
      Top = 21
      Width = 48
      Height = 13
      Caption = 'Order Qty.'
    end
    object Label23: TLabel
      Left = 389
      Top = 63
      Width = 24
      Height = 13
      Caption = 'Plant'
    end
    object Label1: TLabel
      Left = 389
      Top = 21
      Width = 66
      Height = 13
      Caption = 'Contract Date'
    end
    object Label2: TLabel
      Left = 528
      Top = 21
      Width = 23
      Height = 13
      Caption = 'RTD'
    end
    object Label3: TLabel
      Left = 528
      Top = 42
      Width = 22
      Height = 13
      Caption = 'ETD'
    end
    object Label5: TLabel
      Left = 528
      Top = 63
      Width = 22
      Height = 13
      Caption = 'ATD'
    end
    object Label8: TLabel
      Left = 671
      Top = 21
      Width = 74
      Height = 13
      Caption = 'Cutomer PO No'
    end
    object Label9: TLabel
      Left = 671
      Top = 42
      Width = 59
      Height = 13
      Caption = 'Order States'
    end
    object Label10: TLabel
      Left = 671
      Top = 63
      Width = 67
      Height = 13
      Caption = 'Communicator'
    end
    object DBText1: TDBText
      Left = 90
      Top = 19
      Width = 150
      Height = 17
      Color = clSilver
      DataField = 'CustomerNumber'
      DataSource = ds_active
      ParentColor = False
    end
    object DBText2: TDBText
      Left = 90
      Top = 40
      Width = 150
      Height = 17
      Color = clSilver
      DataField = 'CustomerName'
      DataSource = ds_active
      ParentColor = False
    end
    object DBText3: TDBText
      Left = 90
      Top = 61
      Width = 150
      Height = 17
      Color = clSilver
      DataField = 'Model'
      DataSource = ds_active
      ParentColor = False
    end
    object DBText5: TDBText
      Left = 299
      Top = 40
      Width = 85
      Height = 17
      Color = clSilver
      DataField = 'MNumber'
      DataSource = ds_active
      ParentColor = False
    end
    object DBText6: TDBText
      Left = 299
      Top = 61
      Width = 85
      Height = 17
      Color = clSilver
      DataField = 'CustomerOrderNumber'
      DataSource = ds_active
      ParentColor = False
    end
    object DBText7: TDBText
      Left = 459
      Top = 19
      Width = 65
      Height = 17
      Color = clSilver
      DataField = 'ContractDate'
      DataSource = ds_active
      ParentColor = False
    end
    object DBText8: TDBText
      Left = 459
      Top = 40
      Width = 65
      Height = 17
      Color = clSilver
      DataField = 'InvoiceNumber'
      DataSource = ds_active
      ParentColor = False
    end
    object DBText9: TDBText
      Left = 459
      Top = 61
      Width = 65
      Height = 17
      Color = clSilver
      DataField = 'PlantCode'
      DataSource = ds_active
      ParentColor = False
    end
    object DBText10: TDBText
      Left = 559
      Top = 19
      Width = 99
      Height = 17
      Color = clSilver
      DataField = 'RTD'
      DataSource = ds_active
      ParentColor = False
    end
    object DBText12: TDBText
      Left = 559
      Top = 61
      Width = 99
      Height = 17
      Color = clSilver
      DataField = 'ATD'
      DataSource = ds_active
      ParentColor = False
    end
    object DBText13: TDBText
      Left = 750
      Top = 19
      Width = 99
      Height = 17
      Color = clSilver
      DataField = 'CustomerPurchaseOrderNumber'
      DataSource = ds_active
      ParentColor = False
    end
    object DBText14: TDBText
      Left = 750
      Top = 40
      Width = 99
      Height = 17
      Color = clSilver
      DataField = 'CustomerOrderStatesName'
      DataSource = ds_active
      ParentColor = False
    end
    object DBText15: TDBText
      Left = 750
      Top = 61
      Width = 99
      Height = 17
      Color = clSilver
      DataField = 'CommunicatorName'
      DataSource = ds_active
      ParentColor = False
    end
    object dbtxtCOQty: TDBText
      Left = 299
      Top = 18
      Width = 85
      Height = 17
      Color = clSilver
      DataField = 'CustomerOrderQuantity'
      DataSource = ds_active
      ParentColor = False
    end
    object DBDateTimeEditEh2: TDBDateTimeEditEh
      Left = 555
      Top = 37
      Width = 105
      Height = 21
      DataField = 'ETD'
      DataSource = ds_active
      EditButtons = <>
      Kind = dtkDateEh
      TabOrder = 0
      Visible = True
    end
  end
  object dbedtCustomerOrderID: TDBEditEh
    Left = 478
    Top = 3
    Width = 121
    Height = 19
    Alignment = taLeftJustify
    Color = clSilver
    DataField = 'CustomerOrderID'
    DataSource = ds_active
    EditButtons = <>
    Flat = True
    TabOrder = 2
    Visible = True
  end
  object dbedtLogisticStatus: TDBEditEh
    Left = 694
    Top = 3
    Width = 121
    Height = 19
    Alignment = taLeftJustify
    Color = clSilver
    DataField = 'TradingOrderStatusName'
    DataSource = ds_active
    EditButtons = <>
    Flat = True
    ReadOnly = True
    TabOrder = 3
    Visible = True
  end
  object gboxSeller: TGroupBox
    Left = 5
    Top = 110
    Width = 860
    Height = 115
    Caption = 'Trading PO Info.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    object Label12: TLabel
      Left = 8
      Top = 19
      Width = 68
      Height = 13
      Caption = 'Seller Part No.'
    end
    object Label13: TLabel
      Left = 8
      Top = 44
      Width = 54
      Height = 13
      Caption = 'Seller Code'
    end
    object Label14: TLabel
      Left = 203
      Top = 93
      Width = 86
      Height = 13
      Caption = 'PO To Seller Date'
    end
    object Label15: TLabel
      Left = 8
      Top = 69
      Width = 67
      Height = 13
      Caption = 'Buyer PO NO.'
    end
    object Label20: TLabel
      Left = 205
      Top = 15
      Width = 76
      Height = 13
      Caption = 'Ex-Factory Date'
    end
    object Label21: TLabel
      Left = 205
      Top = 40
      Width = 82
      Height = 13
      Caption = 'Ex-Factory Date1'
    end
    object Label24: TLabel
      Left = 205
      Top = 68
      Width = 77
      Height = 13
      Caption = 'RCED Seller OA'
    end
    object Label25: TLabel
      Left = 640
      Top = 12
      Width = 67
      Height = 26
      Caption = 'Stock Due To Order Cancel'
      WordWrap = True
    end
    object Label26: TLabel
      Left = 420
      Top = 68
      Width = 67
      Height = 13
      Caption = 'Buyer Remark'
    end
    object Label50: TLabel
      Left = 8
      Top = 91
      Width = 67
      Height = 13
      Caption = 'Buyer PO Qty.'
    end
    object Label16: TLabel
      Left = 419
      Top = 16
      Width = 71
      Height = 13
      Caption = 'Shipping Mode'
    end
    object Label57: TLabel
      Left = 418
      Top = 41
      Width = 86
      Height = 13
      Caption = 'Air Freight Paid By'
    end
    object Label29: TLabel
      Left = 642
      Top = 45
      Width = 64
      Height = 13
      Caption = 'PO Due Date'
    end
    object DBDateTimeEditEh1: TDBDateTimeEditEh
      Left = 293
      Top = 90
      Width = 121
      Height = 21
      Alignment = taLeftJustify
      DataField = 'SellerPOtoSellerdate'
      DataSource = ds_active
      EditButtons = <>
      Kind = dtkDateEh
      TabOrder = 1
      Visible = True
    end
    object dbdtpSellerExFacDate: TDBDateTimeEditEh
      Left = 292
      Top = 11
      Width = 121
      Height = 21
      Alignment = taLeftJustify
      DataField = 'SellerExFactoryDate'
      DataSource = ds_active
      EditButtons = <>
      Kind = dtkDateEh
      TabOrder = 2
      Visible = True
    end
    object dbdtpSellerExFacDate1: TDBDateTimeEditEh
      Left = 292
      Top = 36
      Width = 121
      Height = 21
      Alignment = taLeftJustify
      DataField = 'SellerExFactoryDate1'
      DataSource = ds_active
      EditButtons = <>
      Kind = dtkDateEh
      TabOrder = 3
      Visible = True
    end
    object DBDateTimeEditEh5: TDBDateTimeEditEh
      Left = 293
      Top = 64
      Width = 121
      Height = 21
      Alignment = taLeftJustify
      DataField = 'SellerRCEDSellerOA'
      DataSource = ds_active
      EditButtons = <>
      Kind = dtkDateEh
      TabOrder = 4
      Visible = True
    end
    object DBEditEh1: TDBEditEh
      Left = 78
      Top = 15
      Width = 121
      Height = 21
      Alignment = taLeftJustify
      DataField = 'SellerPartNo'
      DataSource = ds_active
      EditButtons = <>
      TabOrder = 0
      Visible = True
    end
    object dbedtBuyerPONo: TDBEditEh
      Left = 78
      Top = 65
      Width = 121
      Height = 21
      Alignment = taLeftJustify
      DataField = 'SellerBuyerPOnumber'
      DataSource = ds_active
      EditButtons = <>
      TabOrder = 5
      Visible = True
    end
    object DBEditEh5: TDBEditEh
      Left = 507
      Top = 66
      Width = 343
      Height = 21
      Alignment = taLeftJustify
      DataField = 'SellerBuyerRemark'
      DataSource = ds_active
      EditButtons = <>
      TabOrder = 6
      Visible = True
    end
    object dbcbbStockDueToOrderCancel: TDBComboBoxEh
      Left = 732
      Top = 15
      Width = 121
      Height = 21
      DataField = 'SellerStockDueToOrderCancel'
      DataSource = ds_active
      EditButtons = <>
      Items.Strings = (
        ''
        'Yes'
        'No')
      KeyItems.Strings = (
        ''
        'Yes'
        'No')
      TabOrder = 7
      Visible = True
    end
    object dbedtBuyerPOQty: TDBEditEh
      Left = 79
      Top = 89
      Width = 121
      Height = 21
      Alignment = taLeftJustify
      DataField = 'SellerBuyerPOQuantity'
      DataSource = ds_active
      EditButtons = <>
      TabOrder = 8
      Visible = True
    end
    object dbcbbVendor: TDBLookupComboboxEh
      Left = 78
      Top = 40
      Width = 121
      Height = 21
      DataField = 'VendorID'
      DataSource = ds_active
      DropDownBox.Columns = <
        item
          FieldName = 'VendorNumber'
          Title.Caption = 'Vendor Number'
          Width = 100
        end
        item
          FieldName = 'VendorName'
          Title.Caption = 'Vendor Name'
          Width = 200
        end>
      DropDownBox.SortLocal = True
      DropDownBox.UseMultiTitle = True
      DropDownBox.ShowTitles = True
      DropDownBox.Sizable = True
      EditButtons = <>
      KeyField = 'VendorID'
      ListField = 'VendorNumber'
      ListSource = ds_vendor
      TabOrder = 9
      Visible = True
    end
    object dbcbbShippingMode: TDBComboBoxEh
      Left = 507
      Top = 11
      Width = 121
      Height = 21
      DataField = 'SellerShippingMode'
      DataSource = ds_active
      EditButtons = <>
      TabOrder = 10
      Visible = True
      OnChange = dbcbbShippingModeChange
    end
    object dbcbbAirFreightPaidBy: TDBComboBoxEh
      Left = 507
      Top = 39
      Width = 121
      Height = 21
      DataField = 'SellerAirFreightPaidBy'
      DataSource = ds_active
      EditButtons = <>
      Items.Strings = (
        ''
        'Supplier Cost'
        'Customer Cost')
      KeyItems.Strings = (
        ''
        'Supplier Cost'
        'Customer Cost')
      TabOrder = 11
      Visible = True
    end
    object dtpSellerPoDuedate: TDBDateTimeEditEh
      Left = 733
      Top = 42
      Width = 121
      Height = 21
      DataField = 'SellerPoDuedate'
      DataSource = ds_active
      EditButtons = <>
      Kind = dtkDateEh
      TabOrder = 12
      Visible = True
    end
  end
  object GroupBox2: TGroupBox
    Left = 5
    Top = 311
    Width = 569
    Height = 169
    Caption = 'Trading PO Receiving Schedule'
    Color = clMoneyGreen
    ParentColor = False
    TabOrder = 5
    OnClick = actExitExecute
    object DBNavigator2: TDBNavigator
      Left = 10
      Top = 15
      Width = 200
      Height = 18
      DataSource = ds_rs
      Flat = True
      TabOrder = 0
    end
    object Panel1: TPanel
      Left = 2
      Top = 36
      Width = 565
      Height = 131
      Align = alBottom
      TabOrder = 1
      object gridRS: TDBGridEh
        Left = 1
        Top = 1
        Width = 563
        Height = 129
        Align = alClient
        DataSource = ds_rs
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        FooterColor = clYellow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = [fsBold]
        FooterRowCount = 1
        ParentFont = False
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
            FieldName = 'TradingOrderID'
            Footers = <>
            Title.Caption = 'PO ID'
            Width = 27
          end
          item
            EditButtons = <>
            FieldName = 'ReceivingScheduleID'
            Footers = <>
            Title.Caption = 'Receiving ID'
            Width = 59
          end
          item
            EditButtons = <>
            FieldName = 'ReceivingQuantity'
            Footers = <>
            Title.Caption = 'Receiving Qty.'
            Width = 55
          end
          item
            EditButtons = <>
            FieldName = 'ImportSheetNo'
            Footers = <>
            Title.Caption = 'Import Sheet No.'
            Width = 87
          end
          item
            EditButtons = <>
            FieldName = 'OriginPickupDate'
            Footers = <>
            Title.Caption = 'Origin Pickup Date'
            Width = 90
          end
          item
            EditButtons = <>
            FieldName = 'ActArriveWarehouseDate'
            Footers = <>
            Title.Caption = 'Act Arrive Warehouse Date'
            Width = 90
          end
          item
            EditButtons = <>
            FieldName = 'SortingDate'
            Footers = <>
            Title.Caption = 'Sorting Date'
            Width = 90
          end
          item
            EditButtons = <>
            FieldName = 'LogisticInRCED'
            Footers = <>
            Title.Caption = 'Logistic In RCED'
            Width = 90
          end>
      end
    end
  end
  object gboxSellerInvoice: TGroupBox
    Left = 583
    Top = 311
    Width = 283
    Height = 169
    Caption = 'Trading PO Seller Invoice'
    Color = clMoneyGreen
    ParentColor = False
    TabOrder = 6
    object DBNavigator3: TDBNavigator
      Left = 10
      Top = 15
      Width = 138
      Height = 18
      DataSource = ds_invoice
      VisibleButtons = [nbInsert, nbPost, nbCancel]
      Flat = True
      TabOrder = 0
    end
    object Panel2: TPanel
      Left = 2
      Top = 37
      Width = 279
      Height = 130
      Align = alBottom
      TabOrder = 1
      object gridInvoice: TDBGridEh
        Left = 1
        Top = 1
        Width = 277
        Height = 128
        Align = alClient
        DataSource = ds_invoice
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        FooterColor = clYellow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = [fsBold]
        FooterRowCount = 1
        ParentFont = False
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
            FieldName = 'ReceivingScheduleID'
            Footers = <>
            Title.Caption = 'Receiving ID'
          end
          item
            EditButtons = <>
            FieldName = 'SellerInvoiceNumber'
            Footers = <>
            Title.Caption = 'Invoice No.'
          end
          item
            EditButtons = <>
            FieldName = 'SellerInvoiceDate'
            Footers = <>
            Title.Caption = 'Invoice Date'
            Width = 74
          end>
      end
    end
  end
  object dbedtTradingOrderID: TDBEditEh
    Left = 295
    Top = 3
    Width = 121
    Height = 19
    Alignment = taLeftJustify
    Color = clSilver
    DataField = 'TradingOrderID'
    DataSource = ds_active
    EditButtons = <>
    Flat = True
    TabOrder = 7
    Visible = True
    OnChange = dbedtTradingOrderIDChange
  end
  object gboxDM: TGroupBox
    Left = 8
    Top = 232
    Width = 857
    Height = 72
    Caption = 'Demand Managing Info.'
    TabOrder = 8
    object Label17: TLabel
      Left = 221
      Top = 20
      Width = 59
      Height = 13
      Caption = 'Sales Month'
    end
    object Label22: TLabel
      Left = 437
      Top = 20
      Width = 59
      Height = 13
      Caption = 'DMM Month'
    end
    object Label27: TLabel
      Left = 4
      Top = 47
      Width = 66
      Height = 13
      Caption = 'DMM Remark'
    end
    object Label28: TLabel
      Left = 32
      Top = 22
      Width = 30
      Height = 13
      Caption = 'RCED'
    end
    object dbedtSalesMonth: TDBEditEh
      Left = 289
      Top = 16
      Width = 121
      Height = 21
      DataField = 'DemandManagingSalesMonth'
      DataSource = ds_active
      EditButtons = <>
      TabOrder = 0
      Visible = True
    end
    object dbedtDMMMonth: TDBEditEh
      Left = 505
      Top = 16
      Width = 121
      Height = 21
      DataField = 'DemandManagingDMMMonth'
      DataSource = ds_active
      EditButtons = <>
      TabOrder = 1
      Visible = True
    end
    object dbedtDMMRemark: TDBEditEh
      Left = 77
      Top = 43
      Width = 764
      Height = 21
      DataField = 'DemandManagingDMMRemark'
      DataSource = ds_active
      EditButtons = <>
      TabOrder = 2
      Visible = True
    end
    object dbdtpDMRCED: TDBDateTimeEditEh
      Left = 77
      Top = 16
      Width = 121
      Height = 21
      DataField = 'DemandManagingRCED'
      DataSource = ds_active
      EditButtons = <>
      Kind = dtkDateEh
      TabOrder = 3
      Visible = True
    end
  end
  object ds_active: TDataSource
    Left = 682
    Top = 1
  end
  object ds_vendor: TDataSource
    DataSet = adt_vendor
    Left = 808
    Top = 8
  end
  object adt_vendor: TADODataSet
    Parameters = <>
    Left = 768
    Top = 8
  end
  object ds_rs: TDataSource
    DataSet = adt_rs
    Left = 405
    Top = 328
  end
  object ds_invoice: TDataSource
    DataSet = adt_invoice
    Left = 800
    Top = 328
  end
  object adt_rs: TADODataSet
    BeforePost = adt_rsBeforePost
    AfterPost = adt_rsAfterPost
    BeforeDelete = adt_rsBeforeDelete
    Parameters = <>
    Left = 373
    Top = 328
  end
  object adt_invoice: TADODataSet
    BeforePost = adt_invoiceBeforePost
    AfterPost = adt_invoiceAfterPost
    Parameters = <>
    Left = 752
    Top = 328
  end
end
