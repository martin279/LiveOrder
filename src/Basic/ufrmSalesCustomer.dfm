object frmSalesCustomer: TfrmSalesCustomer
  Left = 558
  Top = 239
  Width = 529
  Height = 617
  BorderIcons = []
  Caption = 'frmSalesCustomer'
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
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 513
    Height = 579
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    OnChanging = PageControl1Changing
    object TabSheet1: TTabSheet
      Caption = 'Edit Sales Information'
      object pnlEdtSales: TPanel
        Left = 0
        Top = 0
        Width = 505
        Height = 551
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object Label4: TLabel
          Left = 61
          Top = 140
          Width = 19
          Height = 13
          Caption = 'Mail'
        end
        object Label3: TLabel
          Left = 65
          Top = 108
          Width = 17
          Height = 13
          Caption = 'Fax'
        end
        object Label1: TLabel
          Left = 49
          Top = 76
          Width = 31
          Height = 13
          Caption = 'Phone'
        end
        object Label2: TLabel
          Left = 25
          Top = 36
          Width = 57
          Height = 13
          Caption = 'Sales Name'
        end
        object btnSaveSales: TButton
          Left = 160
          Top = 213
          Width = 113
          Height = 25
          Caption = 'Save && Next Setp'
          TabOrder = 5
          OnClick = btnSaveSalesClick
        end
        object chkIsValid: TCheckBox
          Left = 96
          Top = 178
          Width = 59
          Height = 17
          Caption = 'Is Valid'
          TabOrder = 4
          OnClick = chkIsValidClick
        end
        object dbcbbDisplayName: TDBLookupComboboxEh
          Left = 96
          Top = 32
          Width = 300
          Height = 21
          EditButtons = <>
          KeyField = 'LoginID'
          ListField = 'DisplayName'
          ListSource = ds_login
          TabOrder = 0
          Visible = True
        end
        object edtPhone: TEdit
          Left = 96
          Top = 72
          Width = 300
          Height = 21
          TabOrder = 1
        end
        object edtFax: TEdit
          Left = 96
          Top = 104
          Width = 300
          Height = 21
          TabOrder = 2
        end
        object edtMail: TEdit
          Left = 96
          Top = 136
          Width = 300
          Height = 21
          TabOrder = 3
        end
        object BitBtn1: TBitBtn
          Left = 306
          Top = 213
          Width = 75
          Height = 25
          Caption = 'Cancel Edit'
          TabOrder = 6
          OnClick = bitBtnCloseClick
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Assign Customer'
      ImageIndex = 1
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 505
        Height = 510
        Align = alClient
        Caption = 'Panel2'
        TabOrder = 0
        object ListView1: TListView
          Left = 1
          Top = 1
          Width = 503
          Height = 508
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
        Top = 510
        Width = 505
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
  object ds_active: TDataSource
    Left = 235
    Top = 11
  end
end
