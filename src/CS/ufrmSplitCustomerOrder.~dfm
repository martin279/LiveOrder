inherited frmSplitCustomerOrder: TfrmSplitCustomerOrder
  Left = 436
  Top = 190
  Width = 224
  Height = 316
  Caption = 'frmSplitCustomerOrder'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Label14: TLabel
    Left = 8
    Top = 36
    Width = 59
    Height = 13
    Caption = 'Order States'
  end
  object Label10: TLabel
    Left = 8
    Top = 12
    Width = 40
    Height = 13
    Caption = 'Order ID'
  end
  object dbedtOrderStates: TDBEditEh
    Left = 71
    Top = 33
    Width = 122
    Height = 21
    Color = clBtnFace
    DataField = 'CustomerOrderStatesName'
    DataSource = ds_active
    EditButtons = <>
    ReadOnly = True
    TabOrder = 1
    Visible = True
  end
  object dbedtCustomerOrderID: TDBEditEh
    Left = 71
    Top = 9
    Width = 122
    Height = 21
    Color = clBtnFace
    DataField = 'CustomerOrderID'
    DataSource = ds_active
    EditButtons = <>
    ReadOnly = True
    TabOrder = 0
    Visible = True
  end
  object gboxOriginalInfo: TGroupBox
    Left = 3
    Top = 56
    Width = 198
    Height = 97
    Caption = 'Original Order Information'
    TabOrder = 2
    object Label8: TLabel
      Left = 5
      Top = 23
      Width = 46
      Height = 13
      Caption = 'Order No.'
    end
    object Label6: TLabel
      Left = 5
      Top = 48
      Width = 48
      Height = 13
      Caption = 'Order Qty.'
    end
    object Label16: TLabel
      Left = 25
      Top = 73
      Width = 23
      Height = 13
      Caption = 'RTD'
    end
    object dbedtOrderNumber: TDBEditEh
      Left = 68
      Top = 20
      Width = 122
      Height = 21
      Color = clBtnFace
      DataField = 'CustomerOrderNumber'
      DataSource = ds_active
      EditButtons = <>
      ReadOnly = True
      TabOrder = 0
      Visible = True
    end
    object dbedtOrderQty: TDBEditEh
      Left = 68
      Top = 45
      Width = 122
      Height = 21
      Color = clBtnFace
      DataField = 'CustomerOrderQuantity'
      DataSource = ds_active
      EditButtons = <>
      ReadOnly = True
      TabOrder = 1
      Visible = True
    end
    object dbdtpRTD: TDBDateTimeEditEh
      Left = 68
      Top = 69
      Width = 121
      Height = 21
      DataField = 'RTD'
      DataSource = ds_active
      EditButtons = <>
      Kind = dtkDateEh
      TabOrder = 2
      Visible = True
    end
    object chkRTD: TCheckBox
      Left = 6
      Top = 71
      Width = 17
      Height = 17
      TabOrder = 3
      OnClick = chkRTDClick
    end
  end
  object gboxNewInfo: TGroupBox
    Left = 3
    Top = 159
    Width = 198
    Height = 80
    Caption = 'New Order Information'
    TabOrder = 3
    object Label2: TLabel
      Left = 7
      Top = 23
      Width = 48
      Height = 13
      Caption = 'Order Qty.'
    end
    object Label3: TLabel
      Left = 25
      Top = 51
      Width = 23
      Height = 13
      Caption = 'RTD'
    end
    object edtOrderQty: TEdit
      Left = 68
      Top = 20
      Width = 122
      Height = 21
      TabOrder = 0
    end
    object chkNewRTD: TCheckBox
      Left = 6
      Top = 50
      Width = 17
      Height = 17
      TabOrder = 2
      Visible = False
      OnClick = chkNewRTDClick
    end
    object dtpRTD: TDateTimePicker
      Left = 68
      Top = 48
      Width = 121
      Height = 21
      Date = 39861.907681574080000000
      Time = 39861.907681574080000000
      TabOrder = 1
    end
  end
  object btnCancel: TBitBtn
    Left = 117
    Top = 245
    Width = 75
    Height = 25
    TabOrder = 5
    Kind = bkCancel
  end
  object btnOK: TBitBtn
    Left = 13
    Top = 245
    Width = 75
    Height = 25
    TabOrder = 4
    OnClick = btnOKClick
    Kind = bkOK
  end
  object ds_active: TDataSource
    Left = 114
    Top = 65535
  end
end
