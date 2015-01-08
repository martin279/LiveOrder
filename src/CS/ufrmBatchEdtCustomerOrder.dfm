inherited frmBatchEdtCustomerOrder: TfrmBatchEdtCustomerOrder
  Left = 476
  Top = 165
  Width = 579
  Height = 420
  Caption = 'frmBatchEdtCustomerOrder'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object gboxOrder: TGroupBox
    Left = 8
    Top = 7
    Width = 545
    Height = 242
    Caption = 'Order Information'
    TabOrder = 0
    object chkCustomerPONum: TCheckBox
      Left = 274
      Top = 13
      Width = 67
      Height = 24
      Caption = 'Customer PO No.'
      TabOrder = 0
      WordWrap = True
    end
    object chkRTD: TCheckBox
      Left = 5
      Top = 20
      Width = 49
      Height = 17
      Caption = 'RTD'
      TabOrder = 1
    end
    object edtCustomerPONum: TEdit
      Left = 353
      Top = 18
      Width = 180
      Height = 21
      TabOrder = 2
    end
    object dtpRTD: TDateTimePicker
      Left = 86
      Top = 18
      Width = 180
      Height = 21
      Date = 0.606503900460666000
      Time = 0.606503900460666000
      TabOrder = 3
      OnChange = dtpRTDChange
    end
    object chkRemark: TCheckBox
      Left = 5
      Top = 49
      Width = 57
      Height = 17
      Caption = 'Remark'
      TabOrder = 4
    end
    object chkInvoiceNum: TCheckBox
      Left = 5
      Top = 78
      Width = 77
      Height = 17
      Caption = 'Invoice No.'
      TabOrder = 5
    end
    object edtInvoiceNum: TEdit
      Left = 86
      Top = 76
      Width = 180
      Height = 21
      TabOrder = 6
    end
    object edtMNum: TEdit
      Left = 353
      Top = 76
      Width = 180
      Height = 21
      TabOrder = 7
    end
    object chkMNum: TCheckBox
      Left = 273
      Top = 78
      Width = 49
      Height = 17
      Caption = 'M No.'
      TabOrder = 8
    end
    object chkCustomerOrderNum: TCheckBox
      Left = 5
      Top = 101
      Width = 68
      Height = 25
      Caption = 'Order No.'
      TabOrder = 9
    end
    object edtCustomerOrderNum: TEdit
      Left = 86
      Top = 103
      Width = 180
      Height = 21
      TabOrder = 10
    end
    object chkPayment: TCheckBox
      Left = 5
      Top = 132
      Width = 62
      Height = 17
      Caption = 'Payment'
      TabOrder = 11
    end
    object edtPayment: TEdit
      Left = 86
      Top = 130
      Width = 180
      Height = 21
      TabOrder = 12
    end
    object chkForwarder: TCheckBox
      Left = 273
      Top = 160
      Width = 73
      Height = 17
      Caption = 'Forwarder'
      TabOrder = 13
    end
    object dbcbbForwarder: TDBLookupComboboxEh
      Left = 354
      Top = 158
      Width = 180
      Height = 21
      EditButtons = <>
      KeyField = 'ForwarderID'
      ListField = 'ForwarderName'
      ListSource = ds_forwarder
      TabOrder = 14
      Visible = True
    end
    object dtpATD: TDateTimePicker
      Left = 355
      Top = 106
      Width = 180
      Height = 21
      Date = 39919.472617222220000000
      Time = 39919.472617222220000000
      TabOrder = 15
    end
    object chkATD: TCheckBox
      Left = 273
      Top = 108
      Width = 41
      Height = 17
      Caption = 'ATD'
      TabOrder = 16
    end
    object chkFreight: TCheckBox
      Left = 5
      Top = 160
      Width = 57
      Height = 17
      Caption = 'Freight'
      TabOrder = 17
    end
    object edtFreight: TEdit
      Left = 86
      Top = 158
      Width = 180
      Height = 21
      TabOrder = 18
    end
    object chkDestination: TCheckBox
      Left = 5
      Top = 186
      Width = 72
      Height = 17
      Caption = 'Destination'
      TabOrder = 19
    end
    object edtDestination: TEdit
      Left = 86
      Top = 186
      Width = 450
      Height = 21
      TabOrder = 20
    end
    object edtRemark: TEdit
      Left = 86
      Top = 48
      Width = 450
      Height = 21
      TabOrder = 21
    end
    object chkInstruction: TCheckBox
      Left = 5
      Top = 213
      Width = 69
      Height = 17
      Caption = 'Instruction'
      TabOrder = 22
    end
    object edtInstruction: TEdit
      Left = 86
      Top = 213
      Width = 450
      Height = 21
      TabOrder = 23
    end
    object chkETA: TCheckBox
      Left = 274
      Top = 136
      Width = 41
      Height = 17
      Caption = 'ETA'
      TabOrder = 24
    end
    object dtpETA: TDateTimePicker
      Left = 353
      Top = 134
      Width = 180
      Height = 21
      Date = 39919.472617222220000000
      Time = 39919.472617222220000000
      TabOrder = 25
    end
  end
  object gboxConfirm: TGroupBox
    Left = 8
    Top = 255
    Width = 265
    Height = 73
    Caption = 'Confirm Information'
    TabOrder = 1
    object dtpETD: TDateTimePicker
      Left = 70
      Top = 20
      Width = 180
      Height = 21
      Date = 39890.606525960650000000
      Time = 39890.606525960650000000
      TabOrder = 0
      OnChange = dtpETDChange
    end
    object chkETDChange: TCheckBox
      Left = 70
      Top = 50
      Width = 89
      Height = 15
      Caption = 'ETD Change'
      TabOrder = 1
    end
    object chkETD: TCheckBox
      Left = 9
      Top = 24
      Width = 49
      Height = 17
      Caption = 'ETD'
      TabOrder = 2
    end
  end
  object btnCancel: TBitBtn
    Left = 309
    Top = 343
    Width = 75
    Height = 25
    TabOrder = 2
    Kind = bkCancel
  end
  object btnSave: TButton
    Left = 168
    Top = 343
    Width = 75
    Height = 25
    Caption = 'Save'
    TabOrder = 3
    OnClick = btnSaveClick
  end
  object GroupBox1: TGroupBox
    Left = 280
    Top = 255
    Width = 275
    Height = 73
    TabOrder = 4
    object Label9: TLabel
      Left = 11
      Top = 17
      Width = 54
      Height = 13
      Caption = 'Delay Type'
    end
    object dbcbbDelay: TDBLookupComboBox
      Left = 16
      Top = 40
      Width = 249
      Height = 21
      KeyField = 'ReasonOfDelayID'
      ListField = 'ReasonOfDelayDesc'
      ListSource = ds_delay
      TabOrder = 0
      OnClick = dbcbbDelayClick
    end
  end
  object adt_plant: TADODataSet
    Parameters = <>
    Left = 346
    Top = 65535
  end
  object ds_plant: TDataSource
    DataSet = adt_plant
    Left = 378
    Top = 65535
  end
  object adt_forwarder: TADODataSet
    CursorType = ctStatic
    Parameters = <>
    Left = 266
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
    Left = 298
    Top = 1
  end
  object adt_delay: TADODataSet
    Parameters = <>
    Left = 426
    Top = 265
  end
  object ds_delay: TDataSource
    DataSet = adt_delay
    Left = 456
    Top = 266
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
    Left = 432
  end
end
