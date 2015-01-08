inherited frmAddPrice: TfrmAddPrice
  Left = 478
  Top = 216
  Width = 429
  Height = 395
  Caption = 'frmAddPrice'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object btnSave: TButton
    Left = 64
    Top = 318
    Width = 97
    Height = 25
    Caption = 'Save'
    TabOrder = 2
    OnClick = btnSaveClick
  end
  object btnClose: TButton
    Left = 256
    Top = 318
    Width = 97
    Height = 25
    Caption = 'Close'
    TabOrder = 3
    OnClick = btnCloseClick
  end
  object gboxBasicInfo: TGroupBox
    Left = 3
    Top = 3
    Width = 390
    Height = 110
    Caption = 'Basic Information'
    TabOrder = 0
    object Label4: TLabel
      Left = 8
      Top = 25
      Width = 72
      Height = 13
      Caption = 'Customer Code'
    end
    object Label7: TLabel
      Left = 8
      Top = 55
      Width = 29
      Height = 13
      Caption = 'Model'
    end
    object Label6: TLabel
      Left = 8
      Top = 83
      Width = 62
      Height = 13
      Caption = 'Demand Qty.'
    end
    object dbcbbModel: TDBLookupComboboxEh
      Left = 96
      Top = 52
      Width = 290
      Height = 21
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
    end
    object edtDemandQty: TEdit
      Left = 96
      Top = 81
      Width = 89
      Height = 21
      TabOrder = 2
    end
    object dbcbbCustomer: TDBLookupComboboxEh
      Left = 96
      Top = 24
      Width = 290
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
    end
  end
  object gboxDetailInfo: TGroupBox
    Left = 4
    Top = 120
    Width = 390
    Height = 193
    Caption = 'Price Detail Information'
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 47
      Width = 73
      Height = 13
      Caption = 'Payment Terms'
    end
    object Label2: TLabel
      Left = 8
      Top = 73
      Width = 56
      Height = 13
      Caption = 'Price Terms'
    end
    object Label16: TLabel
      Left = 8
      Top = 99
      Width = 54
      Height = 13
      Caption = 'Effect Date'
    end
    object Label13: TLabel
      Left = 8
      Top = 120
      Width = 37
      Height = 13
      Caption = 'Remark'
    end
    object Label5: TLabel
      Left = 8
      Top = 20
      Width = 24
      Height = 13
      Caption = 'Price'
    end
    object dtpEffectDate: TDateTimePicker
      Left = 96
      Top = 96
      Width = 290
      Height = 21
      BevelInner = bvNone
      BevelOuter = bvNone
      BevelKind = bkFlat
      Date = 39834.638985462960000000
      Time = 39834.638985462960000000
      TabOrder = 4
    end
    object memoRemark: TMemo
      Left = 96
      Top = 124
      Width = 290
      Height = 61
      ScrollBars = ssBoth
      TabOrder = 5
    end
    object cbbCurrency: TComboBox
      Left = 96
      Top = 17
      Width = 65
      Height = 21
      BevelInner = bvNone
      BevelOuter = bvNone
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      Items.Strings = (
        'RMB'
        'USD')
    end
    object edtPrice: TEdit
      Left = 165
      Top = 17
      Width = 84
      Height = 21
      TabOrder = 1
    end
    object dbcbbPaymentTerms: TDBLookupComboboxEh
      Left = 96
      Top = 45
      Width = 290
      Height = 21
      EditButtons = <>
      KeyField = 'PaymentTermsID'
      ListField = 'PaymentTerms'
      ListSource = ds_paymentterms
      TabOrder = 2
      Visible = True
    end
    object dbcbbPriceTerms: TDBLookupComboboxEh
      Left = 96
      Top = 69
      Width = 290
      Height = 21
      EditButtons = <>
      KeyField = 'PriceTermsID'
      ListField = 'PriceTerms'
      ListSource = ds_priceterms
      TabOrder = 3
      Visible = True
    end
  end
  object adt_customer: TADODataSet
    CursorType = ctStatic
    Parameters = <>
    Left = 28
  end
  object ds_customer: TDataSource
    DataSet = adt_customer
    Left = 60
  end
  object adt_model: TADODataSet
    Parameters = <>
    Left = 102
    Top = 1
  end
  object ds_model: TDataSource
    DataSet = adt_model
    Left = 140
    Top = 2
  end
  object adt_paymentterms: TADODataSet
    Parameters = <>
    Left = 187
    Top = 3
  end
  object adt_priceterms: TADODataSet
    Parameters = <>
    Left = 267
    Top = 3
  end
  object ds_paymentterms: TDataSource
    DataSet = adt_paymentterms
    Left = 219
    Top = 3
  end
  object ds_priceterms: TDataSource
    DataSet = adt_priceterms
    Left = 299
    Top = 3
  end
end
