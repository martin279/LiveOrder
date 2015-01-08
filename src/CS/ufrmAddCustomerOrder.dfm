inherited frmAddCustomerOrder: TfrmAddCustomerOrder
  Left = 333
  Top = 86
  Width = 834
  Height = 456
  Caption = 'frmAddCustomerOrder'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 3
    Width = 801
    Height = 230
    Caption = 'Basic Information'
    TabOrder = 0
    object pnlModel: TPanel
      Left = 2
      Top = 77
      Width = 797
      Height = 151
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object Label7: TLabel
        Left = 56
        Top = 11
        Width = 29
        Height = 13
        Caption = 'Model'
      end
      object sbtnAddModel: TSpeedButton
        Left = 768
        Top = 6
        Width = 23
        Height = 22
        Caption = '+'
        OnClick = sbtnAddModelClick
      end
      object Label13: TLabel
        Left = 409
        Top = 48
        Width = 37
        Height = 13
        Caption = 'Remark'
      end
      object sbtnAddApplication: TSpeedButton
        Left = 264
        Top = 36
        Width = 23
        Height = 22
        Caption = '+'
        OnClick = sbtnAddApplicationClick
      end
      object LabelBusinessApplication: TLabel
        Left = 33
        Top = 38
        Width = 52
        Height = 13
        Caption = 'Application'
      end
      object Label6: TLabel
        Left = 37
        Top = 71
        Width = 48
        Height = 13
        Caption = 'Order Qty.'
      end
      object Label5: TLabel
        Left = 203
        Top = 71
        Width = 24
        Height = 13
        Caption = 'Price'
      end
      object Label16: TLabel
        Left = 62
        Top = 98
        Width = 23
        Height = 13
        Caption = 'RTD'
      end
      object Label11: TLabel
        Left = 3
        Top = 128
        Width = 82
        Height = 13
        Caption = 'Customer PO No.'
      end
      object dbcbbModel: TDBLookupComboboxEh
        Left = 96
        Top = 7
        Width = 657
        Height = 21
        DropDownBox.Columns = <
          item
            FieldName = 'Model'
            Width = 300
          end
          item
            FieldName = 'ModelDescription'
            Title.Caption = 'Desc.'
            Width = 150
          end
          item
            FieldName = 'ProductSeriesName'
            Title.Caption = 'Product Series'
            Width = 200
          end
          item
            FieldName = 'ProductFamilyName'
            Title.Caption = 'Product Family'
            Width = 200
          end
          item
            FieldName = 'PlantCode'
            Title.Caption = 'Plant'
            Width = 80
          end
          item
            FieldName = 'ProductClassification'
            Title.Caption = 'Class.'
            Width = 100
          end>
        DropDownBox.Options = [dlgColumnResizeEh, dlgColLinesEh, dlgRowLinesEh, dlgAutoSortMarkingEh, dlgMultiSortMarkingEh]
        DropDownBox.UseMultiTitle = True
        DropDownBox.ShowTitles = True
        DropDownBox.Sizable = True
        EditButtons = <>
        KeyField = 'ModelID'
        ListField = 'Model'
        ListSource = ds_model
        TabOrder = 0
        Visible = True
        OnChange = dbcbbModelChange
        OnExit = dbcbbModelExit
      end
      object memoRemark: TMemo
        Left = 456
        Top = 41
        Width = 336
        Height = 95
        ScrollBars = ssBoth
        TabOrder = 7
      end
      object chkBoxKeyOrder: TCheckBox
        Left = 309
        Top = 41
        Width = 80
        Height = 17
        Caption = 'Is Key Order'
        Enabled = False
        TabOrder = 8
      end
      object edtOrderQty: TEdit
        Left = 96
        Top = 67
        Width = 79
        Height = 21
        TabOrder = 2
        OnExit = edtOrderQtyExit
        OnKeyPress = edtOrderQtyKeyPress
      end
      object cbbCurrency: TComboBox
        Left = 243
        Top = 67
        Width = 65
        Height = 21
        BevelInner = bvNone
        BevelOuter = bvNone
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 3
        Items.Strings = (
          'RMB'
          'USD'
          'EUR')
      end
      object edtPrice: TEdit
        Left = 312
        Top = 67
        Width = 84
        Height = 21
        TabOrder = 4
      end
      object dtpRTD: TDateTimePicker
        Left = 96
        Top = 94
        Width = 300
        Height = 21
        Date = 39871.553811967590000000
        Time = 39871.553811967590000000
        ShowCheckbox = True
        TabOrder = 5
      end
      object edtCustomerPONo: TEdit
        Left = 96
        Top = 124
        Width = 300
        Height = 21
        TabOrder = 6
      end
      object dbcbbBusinessApplication: TDBLookupComboboxEh
        Left = 96
        Top = 37
        Width = 154
        Height = 21
        DropDownBox.Columns = <
          item
            FieldName = 'BusinessApplicationName'
            Title.Caption = 'Application'
          end>
        DropDownBox.ListSource = ds_business
        DropDownBox.Options = [dlgColumnResizeEh, dlgColLinesEh, dlgRowLinesEh, dlgAutoSortMarkingEh, dlgMultiSortMarkingEh]
        DropDownBox.ShowTitles = True
        DropDownBox.Sizable = True
        EditButtons = <>
        KeyField = 'BusinessApplicationID'
        ListField = 'BusinessApplicationName'
        ListSource = ds_business
        TabOrder = 1
        Visible = True
        OnChange = dbcbbBusinessApplicationChange
      end
    end
    object Panel1: TPanel
      Left = 2
      Top = 15
      Width = 797
      Height = 62
      Align = alTop
      TabOrder = 0
      object Label4: TLabel
        Left = 14
        Top = 12
        Width = 72
        Height = 13
        Caption = 'Customer Code'
      end
      object Label19: TLabel
        Left = 11
        Top = 39
        Width = 75
        Height = 13
        Caption = 'Customer Name'
      end
      object sbtnAddCustomer: TSpeedButton
        Left = 768
        Top = 7
        Width = 23
        Height = 22
        Caption = '+'
        OnClick = sbtnAddCustomerClick
      end
      object dbcbbCustomer: TDBLookupComboboxEh
        Left = 96
        Top = 8
        Width = 657
        Height = 21
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
        DropDownBox.ListSource = ds_customer
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
        OnChange = dbcbbCustomerChange
      end
      object dbedtCustomerName: TDBEditEh
        Left = 96
        Top = 36
        Width = 700
        Height = 19
        DataField = 'CustomerName'
        DataSource = ds_customer
        EditButtons = <>
        Enabled = False
        Flat = True
        TabOrder = 1
        Visible = True
      end
    end
  end
  object btnSave: TButton
    Left = 512
    Top = 379
    Width = 97
    Height = 25
    Caption = 'Save'
    TabOrder = 2
    OnClick = btnSaveClick
  end
  object btnClose: TButton
    Left = 704
    Top = 379
    Width = 97
    Height = 25
    Caption = 'Close'
    TabOrder = 3
    OnClick = btnCloseClick
  end
  object GroupBox3: TGroupBox
    Left = 7
    Top = 238
    Width = 802
    Height = 123
    Caption = 'Ship Information'
    TabOrder = 1
    object pnlShip: TPanel
      Left = 2
      Top = 15
      Width = 798
      Height = 106
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object Label8: TLabel
        Left = 231
        Top = 82
        Width = 29
        Height = 13
        Caption = 'M No.'
      end
      object Label3: TLabel
        Left = 55
        Top = 82
        Width = 32
        Height = 13
        Caption = 'Freight'
      end
      object Label2: TLabel
        Left = 399
        Top = 16
        Width = 53
        Height = 13
        Caption = 'Destination'
      end
      object Label17: TLabel
        Left = 38
        Top = 49
        Width = 49
        Height = 13
        Caption = 'Instruction'
      end
      object Label15: TLabel
        Left = 40
        Top = 15
        Width = 47
        Height = 13
        Caption = 'Forwarder'
      end
      object memoDestination: TMemo
        Left = 456
        Top = 4
        Width = 336
        Height = 95
        ScrollBars = ssBoth
        TabOrder = 4
      end
      object edtMNo: TEdit
        Left = 269
        Top = 78
        Width = 126
        Height = 21
        TabOrder = 3
      end
      object edtInstruction: TEdit
        Left = 95
        Top = 45
        Width = 300
        Height = 21
        TabOrder = 1
      end
      object edtFreight: TEdit
        Left = 95
        Top = 78
        Width = 97
        Height = 21
        TabOrder = 2
      end
      object dbcbbForwarder: TDBLookupComboboxEh
        Left = 95
        Top = 11
        Width = 300
        Height = 21
        DropDownBox.Options = [dlgColumnResizeEh, dlgColLinesEh, dlgRowLinesEh, dlgAutoSortMarkingEh, dlgMultiSortMarkingEh]
        DropDownBox.UseMultiTitle = True
        DropDownBox.ShowTitles = True
        DropDownBox.Sizable = True
        EditButtons = <>
        KeyField = 'ForwarderID'
        ListField = 'ForwarderName'
        ListSource = ds_forwarder
        TabOrder = 0
        Visible = True
      end
    end
  end
  object adt_customer: TADODataSet
    CursorType = ctStatic
    Parameters = <>
    Left = 40
  end
  object adt_model: TADODataSet
    Connection = DM.ADOConnection1
    CommandText = 'select * from ViewPlantModel'
    Parameters = <>
    Left = 114
    Top = 1
    object adt_modelPlantID: TIntegerField
      FieldName = 'PlantID'
    end
    object adt_modelModelID: TIntegerField
      FieldName = 'ModelID'
    end
    object adt_modelProductSeriesID: TIntegerField
      FieldName = 'ProductSeriesID'
    end
    object adt_modelProductFamilyID: TIntegerField
      FieldName = 'ProductFamilyID'
    end
    object adt_modelModel: TStringField
      FieldName = 'Model'
      Size = 25
    end
    object adt_modelModelDescription: TStringField
      FieldName = 'ModelDescription'
      Size = 80
    end
    object adt_modelProductClassification: TStringField
      FieldName = 'ProductClassification'
      Size = 1
    end
    object adt_modelIsValid: TBooleanField
      FieldName = 'IsValid'
    end
    object adt_modelPlantCode: TStringField
      FieldName = 'PlantCode'
      Size = 15
    end
    object adt_modelProductSeriesName: TStringField
      FieldName = 'ProductSeriesName'
      Size = 25
    end
    object adt_modelProductFamilyName: TStringField
      FieldName = 'ProductFamilyName'
      Size = 50
    end
  end
  object ds_customer: TDataSource
    DataSet = adt_customer
    Left = 72
  end
  object ds_model: TDataSource
    DataSet = adt_model
    Left = 152
    Top = 2
  end
  object adt_forwarder: TADODataSet
    CursorType = ctStatic
    Parameters = <>
    Left = 194
    Top = 1
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
    Left = 234
    Top = 1
  end
  object adt_business: TADODataSet
    Parameters = <>
    Left = 320
    Top = 11
  end
  object ds_business: TDataSource
    DataSet = adt_business
    Left = 368
    Top = 11
  end
end
