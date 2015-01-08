object frmCommunicatorCustomer: TfrmCommunicatorCustomer
  Left = 483
  Top = 326
  Width = 527
  Height = 528
  BorderIcons = []
  Caption = 'frmCommunicatorCustomer'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 511
    Height = 490
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    OnChanging = PageControl1Changing
    object TabSheet1: TTabSheet
      Caption = 'Edit Communicator Information'
      object pnlEdtSales: TPanel
        Left = 0
        Top = 0
        Width = 503
        Height = 462
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object Label4: TLabel
          Left = 88
          Top = 140
          Width = 19
          Height = 13
          Caption = 'Mail'
        end
        object Label3: TLabel
          Left = 90
          Top = 108
          Width = 17
          Height = 13
          Caption = 'Fax'
        end
        object Label1: TLabel
          Left = 76
          Top = 76
          Width = 31
          Height = 13
          Caption = 'Phone'
        end
        object Label2: TLabel
          Left = 9
          Top = 36
          Width = 98
          Height = 13
          Caption = 'Communicator Name'
        end
        object Label5: TLabel
          Left = 16
          Top = 176
          Width = 95
          Height = 13
          Caption = 'Communicator Code'
        end
        object btnSaveCommunicator: TButton
          Left = 216
          Top = 253
          Width = 113
          Height = 25
          Caption = 'Save && Next Setp'
          TabOrder = 0
          OnClick = btnSaveCommunicatorClick
        end
        object chkIsValid: TCheckBox
          Left = 136
          Top = 210
          Width = 59
          Height = 17
          Caption = 'Is Valid'
          TabOrder = 1
          OnClick = chkIsValidClick
        end
        object dbcbbDisplayName: TDBLookupComboboxEh
          Left = 136
          Top = 32
          Width = 300
          Height = 21
          EditButtons = <>
          KeyField = 'LoginID'
          ListField = 'DisplayName'
          ListSource = ds_login
          TabOrder = 2
          Visible = True
        end
        object edtPhone: TEdit
          Left = 136
          Top = 72
          Width = 300
          Height = 21
          TabOrder = 3
        end
        object edtFax: TEdit
          Left = 136
          Top = 104
          Width = 300
          Height = 21
          TabOrder = 4
        end
        object edtMail: TEdit
          Left = 136
          Top = 136
          Width = 300
          Height = 21
          TabOrder = 5
        end
        object BitBtn1: TBitBtn
          Left = 362
          Top = 253
          Width = 75
          Height = 25
          Caption = 'Cancel Edit'
          TabOrder = 6
          OnClick = bitBtnCloseClick
        end
        object edtCommunicatorCode: TEdit
          Left = 136
          Top = 172
          Width = 300
          Height = 21
          TabOrder = 7
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Assign Customer'
      ImageIndex = 1
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 503
        Height = 421
        Align = alClient
        Caption = 'Panel2'
        TabOrder = 0
        object ListView1: TListView
          Left = 1
          Top = 1
          Width = 501
          Height = 419
          Align = alClient
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
              Caption = 'Customer No.'
              Width = 100
            end
            item
              Caption = 'Customer Name'
              Width = 320
            end
            item
              Caption = 'Plant'
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
      object Panel1: TPanel
        Left = 0
        Top = 421
        Width = 503
        Height = 41
        Align = alBottom
        TabOrder = 1
        object CheckBox1: TCheckBox
          Left = 9
          Top = 8
          Width = 73
          Height = 17
          Caption = 'Select All'
          TabOrder = 0
          OnClick = CheckBox1Click
        end
        object bitBtnSave: TBitBtn
          Left = 283
          Top = 8
          Width = 86
          Height = 25
          Caption = 'Save'
          TabOrder = 1
          OnClick = bitBtnSaveClick
        end
        object bitBtnClose: TBitBtn
          Left = 410
          Top = 8
          Width = 75
          Height = 25
          Caption = 'Close'
          TabOrder = 2
          OnClick = bitBtnCloseClick
        end
      end
    end
  end
  object ds_active: TDataSource
    Left = 235
    Top = 11
  end
  object adt_login: TADODataSet
    Parameters = <>
    Left = 280
    Top = 9
  end
  object ds_login: TDataSource
    DataSet = adt_login
    Left = 320
    Top = 8
  end
end
