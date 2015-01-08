inherited frmSplitTO: TfrmSplitTO
  Left = 643
  Top = 223
  Width = 235
  Height = 367
  Caption = 'frmSplitTO'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Label14: TLabel
    Left = 27
    Top = 37
    Width = 48
    Height = 13
    Caption = 'CO Status'
  end
  object Label10: TLabel
    Left = 35
    Top = 12
    Width = 40
    Height = 13
    Caption = 'Order ID'
  end
  object Label1: TLabel
    Left = 6
    Top = 63
    Width = 69
    Height = 13
    Caption = 'Trading Status'
  end
  object Label4: TLabel
    Left = 24
    Top = 164
    Width = 37
    Height = 13
    Caption = 'PO Qty.'
  end
  object dbedtOrderStates: TDBEditEh
    Left = 80
    Top = 34
    Width = 120
    Height = 21
    Color = clBtnFace
    DataField = 'CustomerOrderStatesName'
    DataSource = ds_active
    EditButtons = <>
    ReadOnly = True
    TabOrder = 0
    Visible = True
  end
  object dbedtCustomerOrderID: TDBEditEh
    Left = 80
    Top = 9
    Width = 120
    Height = 21
    Color = clBtnFace
    DataField = 'CustomerOrderID'
    DataSource = ds_active
    EditButtons = <>
    ReadOnly = True
    TabOrder = 1
    Visible = True
  end
  object gboxOriginalInfo: TGroupBox
    Left = 11
    Top = 88
    Width = 198
    Height = 141
    Caption = 'Original PO Information'
    TabOrder = 2
    object Label8: TLabel
      Left = 7
      Top = 23
      Width = 46
      Height = 13
      Caption = 'Order No.'
    end
    object Label6: TLabel
      Left = 16
      Top = 108
      Width = 37
      Height = 13
      Caption = 'PO Qty.'
    end
    object Label3: TLabel
      Left = 9
      Top = 50
      Width = 44
      Height = 13
      Caption = 'Customer'
    end
    object Label5: TLabel
      Left = 16
      Top = 79
      Width = 37
      Height = 13
      Caption = 'CO Qty.'
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
    object dbedtPOQty: TDBEditEh
      Left = 68
      Top = 105
      Width = 122
      Height = 21
      Color = clBtnFace
      DataField = 'SellerBuyerPOQuantity'
      DataSource = ds_active
      EditButtons = <>
      ReadOnly = True
      TabOrder = 1
      Visible = True
    end
    object dbedtCustomer: TDBEditEh
      Left = 68
      Top = 47
      Width = 122
      Height = 21
      Color = clBtnFace
      DataField = 'CustomerName'
      DataSource = ds_active
      EditButtons = <>
      ReadOnly = True
      TabOrder = 2
      Visible = True
    end
    object dbedtCOQty: TDBEditEh
      Left = 68
      Top = 75
      Width = 122
      Height = 21
      Color = clBtnFace
      DataField = 'CustomerOrderQuantity'
      DataSource = ds_active
      EditButtons = <>
      ReadOnly = True
      TabOrder = 3
      Visible = True
    end
  end
  object gboxNewInfo: TGroupBox
    Left = 11
    Top = 233
    Width = 198
    Height = 49
    Caption = 'New PO Information'
    TabOrder = 3
    object Label2: TLabel
      Left = 5
      Top = 23
      Width = 62
      Height = 13
      Caption = 'New PO Qty.'
    end
    object edtNewPOQty: TEdit
      Left = 73
      Top = 20
      Width = 118
      Height = 21
      TabOrder = 0
    end
  end
  object btnCancel: TBitBtn
    Left = 125
    Top = 295
    Width = 75
    Height = 25
    TabOrder = 4
    Kind = bkCancel
  end
  object btnOK: TBitBtn
    Left = 21
    Top = 295
    Width = 75
    Height = 25
    TabOrder = 5
    OnClick = btnOKClick
    Kind = bkOK
  end
  object dbedtLogisticStatus: TDBEditEh
    Left = 80
    Top = 60
    Width = 120
    Height = 21
    Color = clBtnFace
    DataField = 'TradingOrderStatusName'
    DataSource = ds_active
    EditButtons = <>
    ReadOnly = True
    TabOrder = 6
    Visible = True
  end
  object ds_active: TDataSource
    Left = 138
    Top = 65535
  end
end
