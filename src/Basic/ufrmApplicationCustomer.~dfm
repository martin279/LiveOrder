object frmApplicationCustomer: TfrmApplicationCustomer
  Left = 789
  Top = 305
  Width = 456
  Height = 480
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 10
    Top = 40
    Width = 78
    Height = 13
    Caption = 'Customer Name:'
  end
  object Label2: TLabel
    Left = 10
    Top = 12
    Width = 64
    Height = 13
    Caption = 'Customer No.'
  end
  object GroupBox4: TGroupBox
    Left = 8
    Top = 64
    Width = 425
    Height = 330
    Caption = 'Application List    (Select application for this customer)'
    TabOrder = 0
    object ListView1: TListView
      Left = 8
      Top = 17
      Width = 405
      Height = 304
      BevelInner = bvLowered
      BevelOuter = bvRaised
      BevelKind = bkFlat
      BorderStyle = bsNone
      Checkboxes = True
      Columns = <
        item
          Width = 20
        end
        item
          Caption = 'Operation Select'
          Width = 300
        end>
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      GridLines = True
      MultiSelect = True
      RowSelect = True
      ParentFont = False
      TabOrder = 0
      ViewStyle = vsReport
    end
  end
  object bitBtnFinish: TBitBtn
    Left = 211
    Top = 407
    Width = 89
    Height = 25
    Caption = 'Finish'
    TabOrder = 1
    OnClick = bitBtnFinishClick
  end
  object bitBtnClose: TBitBtn
    Left = 349
    Top = 407
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 2
    OnClick = bitBtnCloseClick
  end
  object chkSelectAll: TCheckBox
    Left = 16
    Top = 399
    Width = 73
    Height = 17
    Caption = 'Select All'
    TabOrder = 3
    OnClick = chkSelectAllClick
  end
  object dbEdtCustomerName: TDBEditEh
    Left = 95
    Top = 36
    Width = 330
    Height = 21
    Color = clMenu
    DataField = 'CustomerName'
    DataSource = ds_active
    EditButtons = <>
    Enabled = False
    TabOrder = 4
    Visible = True
  end
  object dbEdtCustomerNumber: TDBEditEh
    Left = 95
    Top = 8
    Width = 330
    Height = 21
    Color = clMenu
    DataField = 'CustomerNumber'
    DataSource = ds_active
    EditButtons = <>
    Enabled = False
    TabOrder = 5
    Visible = True
  end
  object ds_active: TDataSource
    Left = 299
    Top = 35
  end
end
