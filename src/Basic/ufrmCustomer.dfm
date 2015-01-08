inherited frmCustomer: TfrmCustomer
  Left = 204
  Top = 58
  Width = 1074
  Height = 711
  Caption = 'frmCustomer'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBottom: TPanel
    Top = 640
    Width = 1058
    Height = 33
  end
  inherited pnlBody: TPanel
    Width = 1058
    Height = 615
    inherited PageControl1: TPageControl
      Width = 1058
      Height = 615
      inherited tbsBody1: TTabSheet
        inherited GroupBox1: TGroupBox
          Width = 1050
          Height = 584
          inherited PreviewSetupPanel: TPanel
            Width = 1046
          end
          inherited PreviewBox1: TPreviewBox
            Top = 493
            Width = 1046
          end
          inherited gridData: TDBGridEh
            Width = 1046
            Height = 283
            Columns = <
              item
                EditButtons = <>
                FieldName = 'CustomerID'
                Footers = <>
                Title.Caption = 'ID'
                Width = 38
              end
              item
                EditButtons = <>
                FieldName = 'PlantCode'
                Footers = <>
                Title.Caption = 'Plant Code'
                Width = 60
              end
              item
                EditButtons = <>
                FieldName = 'CustomerNumber'
                Footers = <>
                Title.Caption = 'Customer Code'
                Width = 77
              end
              item
                EditButtons = <>
                FieldName = 'CustomerName'
                Footers = <>
                Title.Caption = 'Customer Name'
              end
              item
                EditButtons = <>
                FieldName = 'FullName'
                Footers = <>
                Title.Caption = 'Full Name'
                Width = 134
              end
              item
                EditButtons = <>
                FieldName = 'ChineseName'
                Footers = <>
                Title.Caption = 'Chinese Name'
                Width = 159
              end
              item
                EditButtons = <>
                FieldName = 'CountryName'
                Footers = <>
                PickList.Strings = (
                  'AUSTRALIA'
                  'CHN'
                  'DUBAI'
                  'EURO'
                  'EGYPT'
                  'HONGKONG'
                  'INDIA'
                  'INDONESIA'
                  'MALAYSIA'
                  'SRILANKA'
                  'SINGAPO'
                  'THA'
                  'TAIWAN'
                  'VIETNAM'
                  'USA'
                  '')
                Title.Caption = 'Country'
              end
              item
                EditButtons = <>
                FieldName = 'Origin'
                Footers = <>
                PickList.Strings = (
                  'SuZhou'
                  'Plant 72'
                  'SuZhou 8F'
                  'SuZhou ZB'
                  'CUD'
                  'Europe'
                  'India'
                  'ShenYang'
                  'Thailand'
                  'US')
              end
              item
                EditButtons = <>
                FieldName = 'CustomerAddress'
                Footers = <>
                Title.Caption = 'Customer Address'
                Width = 100
              end
              item
                EditButtons = <>
                FieldName = 'ContactPerson'
                Footers = <>
                Title.Caption = 'Contact Person'
              end
              item
                EditButtons = <>
                FieldName = 'Telephone'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'Fax'
                Footers = <>
                Width = 97
              end
              item
                EditButtons = <>
                FieldName = 'CellPhone'
                Footers = <>
                Title.Caption = 'Cell Phone'
                Width = 75
              end
              item
                EditButtons = <>
                FieldName = 'Email'
                Footers = <>
                Width = 178
              end
              item
                EditButtons = <>
                FieldName = 'customer_type_name'
                Footers = <>
                Title.Caption = 'Customer Type'
                Width = 92
              end
              item
                EditButtons = <>
                FieldName = 'SoldTo'
                Footers = <>
                Title.Caption = 'Sold To'
                Width = 100
              end
              item
                EditButtons = <>
                FieldName = 'ShipTo'
                Footers = <>
                Title.Caption = 'Ship To'
                Width = 100
              end
              item
                EditButtons = <>
                FieldName = 'Destination'
                Footers = <>
                Width = 100
              end
              item
                EditButtons = <>
                FieldName = 'CommunicatorName'
                Footers = <>
                Title.Caption = 'Communicator'
                Width = 80
              end
              item
                DisplayFormat = 'YYYY-mm-dd hh:mm'
                EditButtons = <>
                FieldName = 'CreateTime'
                Footers = <>
                Title.Caption = 'Create Time'
                Width = 100
              end
              item
                EditButtons = <>
                FieldName = 'IsValid'
                Footers = <>
                Title.Caption = 'Is Valid'
                Width = 41
              end
              item
                EditButtons = <>
                FieldName = 'Remark'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'IsKeyOrderCustomer'
                Footers = <>
                Title.Caption = 'Is Key Order'
                Width = 55
              end
              item
                EditButtons = <>
                FieldName = 'IsCHN'
                Footers = <>
                Width = 46
              end>
          end
          object Panel1: TPanel
            Left = 2
            Top = 339
            Width = 1046
            Height = 154
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 3
            object gboxEdtCustomer: TGroupBox
              Left = 13
              Top = 0
              Width = 804
              Height = 146
              Caption = 'Edit Customer'
              TabOrder = 0
              object Label2: TLabel
                Left = 52
                Top = 65
                Width = 44
                Height = 26
                Caption = 'Customer Name'
                WordWrap = True
              end
              object Label1: TLabel
                Left = 52
                Top = 38
                Width = 44
                Height = 26
                Caption = 'Customer Code'
                WordWrap = True
              end
              object Label3: TLabel
                Left = 52
                Top = 20
                Width = 24
                Height = 13
                Caption = 'Plant'
              end
              object Label4: TLabel
                Left = 224
                Top = 19
                Width = 27
                Height = 13
                Caption = 'Origin'
              end
              object Label5: TLabel
                Left = 8
                Top = 22
                Width = 11
                Height = 13
                Caption = 'ID'
              end
              object LabelCustomerID: TLabel
                Left = 29
                Top = 21
                Width = 3
                Height = 13
              end
              object Label6: TLabel
                Left = 52
                Top = 96
                Width = 47
                Height = 13
                Caption = 'Full Name'
                WordWrap = True
              end
              object Label7: TLabel
                Left = 56
                Top = 115
                Width = 38
                Height = 26
                Caption = 'Chinese Name'
                WordWrap = True
              end
              object Label9: TLabel
                Left = 224
                Top = 45
                Width = 38
                Height = 13
                Caption = 'Address'
              end
              object Label10: TLabel
                Left = 224
                Top = 70
                Width = 40
                Height = 26
                Caption = 'Contact Person'
                WordWrap = True
              end
              object Label11: TLabel
                Left = 226
                Top = 126
                Width = 17
                Height = 13
                Caption = 'Fax'
              end
              object Label12: TLabel
                Left = 224
                Top = 101
                Width = 51
                Height = 13
                Caption = 'Telephone'
              end
              object Label13: TLabel
                Left = 401
                Top = 19
                Width = 48
                Height = 13
                Caption = 'CellPhone'
              end
              object Label14: TLabel
                Left = 403
                Top = 72
                Width = 37
                Height = 13
                Caption = 'Sold To'
              end
              object Label15: TLabel
                Left = 403
                Top = 96
                Width = 37
                Height = 13
                Caption = 'Ship To'
              end
              object Label16: TLabel
                Left = 401
                Top = 123
                Width = 53
                Height = 13
                Caption = 'Destination'
              end
              object Label17: TLabel
                Left = 403
                Top = 47
                Width = 25
                Height = 13
                Caption = 'Email'
              end
              object Label18: TLabel
                Left = 623
                Top = 48
                Width = 37
                Height = 13
                Caption = 'Remark'
              end
              object Label19: TLabel
                Left = 538
                Top = 19
                Width = 47
                Height = 13
                Caption = 'Key Order'
              end
              object Label8: TLabel
                Left = 621
                Top = 18
                Width = 33
                Height = 13
                Caption = 'County'
              end
              object edtCustomerName: TEdit
                Left = 100
                Top = 66
                Width = 121
                Height = 21
                TabOrder = 0
              end
              object edtCustomerNumber: TEdit
                Left = 100
                Top = 41
                Width = 84
                Height = 21
                TabOrder = 1
              end
              object dbcbbPlant: TDBLookupComboboxEh
                Left = 100
                Top = 16
                Width = 85
                Height = 21
                EditButtons = <>
                KeyField = 'PlantID'
                ListField = 'PlantCode'
                ListSource = ds_plant
                TabOrder = 2
                Visible = True
              end
              object cbbOrigin: TComboBox
                Left = 278
                Top = 15
                Width = 122
                Height = 21
                Style = csDropDownList
                ItemHeight = 13
                TabOrder = 3
                Items.Strings = (
                  'SuZhou'
                  'Plant 72'
                  'SuZhou 8F'
                  'SuZhou 8C'
                  'SuZhou ZB'
                  'CUD'
                  'Europe'
                  'India'
                  'ShenYang'
                  'Thailand'
                  'US')
              end
              object edtFullName: TEdit
                Left = 100
                Top = 92
                Width = 121
                Height = 21
                TabOrder = 4
              end
              object edtChineseName: TEdit
                Left = 100
                Top = 117
                Width = 121
                Height = 21
                TabOrder = 5
              end
              object edtAddress: TEdit
                Left = 278
                Top = 41
                Width = 121
                Height = 21
                TabOrder = 6
              end
              object edtContactPerson: TEdit
                Left = 278
                Top = 72
                Width = 121
                Height = 21
                TabOrder = 7
              end
              object edtTelephone: TEdit
                Left = 278
                Top = 97
                Width = 121
                Height = 21
                TabOrder = 8
              end
              object edtFax: TEdit
                Left = 278
                Top = 122
                Width = 121
                Height = 21
                TabOrder = 9
              end
              object edtCellPhone: TEdit
                Left = 453
                Top = 15
                Width = 84
                Height = 21
                TabOrder = 10
              end
              object edtSoldTo: TEdit
                Left = 453
                Top = 68
                Width = 158
                Height = 21
                TabOrder = 11
              end
              object edtShipTo: TEdit
                Left = 453
                Top = 93
                Width = 158
                Height = 21
                TabOrder = 12
              end
              object edtDestination: TEdit
                Left = 457
                Top = 119
                Width = 158
                Height = 21
                TabOrder = 13
              end
              object edtEmail: TEdit
                Left = 453
                Top = 43
                Width = 158
                Height = 21
                TabOrder = 14
              end
              object edtRemark: TEdit
                Left = 671
                Top = 43
                Width = 120
                Height = 21
                TabOrder = 15
              end
              object dbchkBoxKeyOrder: TDBCheckBoxEh
                Left = 590
                Top = 17
                Width = 20
                Height = 17
                DataField = 'IsKeyOrderCustomer'
                DataSource = ds_active
                TabOrder = 16
                ValueChecked = 'True'
                ValueUnchecked = 'False'
              end
              object dbcbbCountry: TDBLookupComboboxEh
                Left = 672
                Top = 15
                Width = 120
                Height = 21
                EditButtons = <>
                KeyField = 'CountryID'
                ListField = 'CountryName'
                ListSource = ds_country
                TabOrder = 17
                Visible = True
              end
            end
            object btnSave: TButton
              Left = 860
              Top = 60
              Width = 59
              Height = 25
              Caption = 'Save'
              TabOrder = 1
              OnClick = btnSaveClick
            end
          end
        end
      end
      object tbsBody2: TTabSheet
        ImageIndex = 1
        object gridTradingCustomer: TDBGridEh
          Left = 0
          Top = 0
          Width = 1050
          Height = 448
          Align = alClient
          DataSource = ds_trading
          EditActions = [geaCutEh, geaCopyEh, geaPasteEh, geaDeleteEh, geaSelectAllEh]
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
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghTraceColSizing, dghIncSearch, dghPreferIncSearch, dghRowHighlight, dghDblClickOptimizeColWidth, dghDialogFind]
          ParentFont = False
          ParentShowHint = False
          PopupMenu = PopupMenu1
          RowHeight = 2
          RowLines = 1
          ShowHint = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          UseMultiTitle = True
          VertScrollBar.Tracking = True
          OnColWidthsChanged = gridDataColWidthsChanged
          OnGetCellParams = gridDataGetCellParams
          OnGetFooterParams = gridDataGetFooterParams
          OnKeyDown = gridDataKeyDown
          Columns = <
            item
              EditButtons = <>
              FieldName = 'CustomerNumber'
              Footers = <>
              Title.Caption = 'Customer No.'
              Width = 100
            end
            item
              EditButtons = <>
              FieldName = 'CustomerName'
              Footers = <>
              Title.Caption = 'Customer Name'
              Width = 100
            end
            item
              EditButtons = <>
              FieldName = 'CountryName'
              Footers = <>
              Width = 100
            end
            item
              EditButtons = <>
              FieldName = 'FullName'
              Footers = <>
              Title.Caption = 'Full Name'
              Width = 100
            end
            item
              EditButtons = <>
              FieldName = 'ChineseName'
              Footers = <>
              Title.Caption = 'Chinese Name'
              Width = 100
            end
            item
              EditButtons = <>
              FieldName = 'customerfamily'
              Footers = <>
              Title.Caption = 'Customer Family'
              Width = 100
            end
            item
              EditButtons = <>
              FieldName = 'region'
              Footers = <>
              Title.Caption = 'Region'
              Width = 100
            end
            item
              EditButtons = <>
              FieldName = 'asiapor'
              Footers = <>
              Title.Caption = 'Asia POR'
              Width = 100
            end
            item
              EditButtons = <>
              FieldName = 'consolidation'
              Footers = <>
              Title.Caption = 'Consolidation'
              Width = 100
            end
            item
              EditButtons = <>
              FieldName = 'delay'
              Footers = <>
              Title.Caption = 'Delay'
              Width = 100
            end
            item
              EditButtons = <>
              FieldName = 'City'
              Footers = <>
            end
            item
              EditButtons = <>
              FieldName = 'Province'
              Footers = <>
            end
            item
              EditButtons = <>
              FieldName = 'CountryName'
              Footers = <>
              Title.Caption = 'Country'
              Width = 100
            end
            item
              EditButtons = <>
              FieldName = 'customer_type_name'
              Footers = <>
              Title.Caption = 'Customer Type'
              Width = 100
            end
            item
              EditButtons = <>
              FieldName = 'PlantCode'
              Footers = <>
            end
            item
              EditButtons = <>
              FieldName = 'SalesPeople'
              Footers = <>
              Title.Caption = 'Sales People'
            end
            item
              EditButtons = <>
              FieldName = 'SalesManager'
              Footers = <>
              Title.Caption = 'Sales Manager'
            end>
        end
        object Panel2: TPanel
          Left = 0
          Top = 448
          Width = 1050
          Height = 136
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 1
          object gboxLogistic: TGroupBox
            Left = 21
            Top = 16
            Width = 876
            Height = 97
            Caption = 'Logistic'
            TabOrder = 0
            object Label20: TLabel
              Left = 180
              Top = 25
              Width = 34
              Height = 13
              Caption = 'Region'
            end
            object Label21: TLabel
              Left = 387
              Top = 25
              Width = 43
              Height = 13
              Caption = 'AsiaPOR'
            end
            object Label22: TLabel
              Left = 5
              Top = 25
              Width = 71
              Height = 13
              Caption = 'Customer Type'
            end
            object Label23: TLabel
              Left = 480
              Top = 24
              Width = 63
              Height = 13
              Caption = 'Consolidation'
            end
            object Label24: TLabel
              Left = 592
              Top = 24
              Width = 27
              Height = 13
              Caption = 'Delay'
            end
            object Label25: TLabel
              Left = 664
              Top = 24
              Width = 73
              Height = 13
              Caption = 'CustomerFamily'
            end
            object Label27: TLabel
              Left = 176
              Top = 64
              Width = 42
              Height = 13
              Caption = 'Province'
            end
            object Label26: TLabel
              Left = 8
              Top = 64
              Width = 17
              Height = 13
              Caption = 'City'
            end
            object Label28: TLabel
              Left = 384
              Top = 64
              Width = 62
              Height = 13
              Caption = 'Sales People'
            end
            object Label29: TLabel
              Left = 585
              Top = 64
              Width = 71
              Height = 13
              Caption = 'Sales Manager'
            end
            object dbcbbType: TDBLookupComboboxEh
              Left = 84
              Top = 21
              Width = 85
              Height = 21
              DataField = 'customer_type_id'
              DataSource = ds_trading
              DropDownBox.Sizable = True
              EditButtons = <>
              KeyField = 'customer_type_id'
              ListField = 'customer_type_name'
              ListSource = ds_type
              TabOrder = 0
              Visible = True
            end
            object DBEditEh1: TDBEditEh
              Left = 224
              Top = 20
              Width = 150
              Height = 21
              DataField = 'region'
              DataSource = ds_trading
              EditButtons = <>
              TabOrder = 1
              Visible = True
            end
            object DBCheckBoxEh1: TDBCheckBoxEh
              Left = 440
              Top = 24
              Width = 25
              Height = 17
              DataField = 'asiapor'
              DataSource = ds_trading
              TabOrder = 2
              ValueChecked = 'True'
              ValueUnchecked = 'False'
            end
            object DBCheckBoxEh2: TDBCheckBoxEh
              Left = 552
              Top = 24
              Width = 17
              Height = 17
              DataField = 'consolidation'
              DataSource = ds_trading
              TabOrder = 3
              ValueChecked = 'True'
              ValueUnchecked = 'False'
            end
            object DBCheckBoxEh3: TDBCheckBoxEh
              Left = 632
              Top = 24
              Width = 25
              Height = 17
              DataField = 'delay'
              DataSource = ds_trading
              TabOrder = 4
              ValueChecked = 'True'
              ValueUnchecked = 'False'
            end
            object dbedtCustomerFamily: TDBEditEh
              Left = 744
              Top = 19
              Width = 121
              Height = 21
              DataField = 'customerfamily'
              DataSource = ds_trading
              EditButtons = <>
              TabOrder = 5
              Visible = True
            end
            object DBEditEh3: TDBEditEh
              Left = 224
              Top = 60
              Width = 150
              Height = 21
              DataField = 'Province'
              DataSource = ds_trading
              EditButtons = <>
              TabOrder = 6
              Visible = True
            end
            object DBEditEh2: TDBEditEh
              Left = 48
              Top = 61
              Width = 120
              Height = 21
              DataField = 'City'
              DataSource = ds_trading
              EditButtons = <>
              TabOrder = 7
              Visible = True
            end
            object DBEditEh4: TDBEditEh
              Left = 451
              Top = 60
              Width = 121
              Height = 21
              DataField = 'SalesPeople'
              DataSource = ds_trading
              EditButtons = <>
              TabOrder = 8
              Visible = True
            end
            object DBEditEh5: TDBEditEh
              Left = 665
              Top = 60
              Width = 121
              Height = 21
              DataField = 'SalesManager'
              DataSource = ds_trading
              EditButtons = <>
              TabOrder = 9
              Visible = True
            end
          end
          object btnSave2: TButton
            Left = 924
            Top = 52
            Width = 59
            Height = 25
            Caption = 'Save'
            TabOrder = 1
            OnClick = btnSave2Click
          end
        end
      end
    end
  end
  inherited PnlTop: TPanel
    Width = 1058
    inherited CoolBar1: TCoolBar
      Width = 1058
      Bands = <
        item
          Control = ToolBar1
          ImageIndex = -1
          Width = 1058
        end>
      inherited ToolBar1: TToolBar
        Width = 1045
        inherited DBNavigator1: TDBNavigator
          Hints.Strings = ()
        end
      end
    end
  end
  inherited PopupMenu1: TPopupMenu
    object N2: TMenuItem
      Caption = '-'
    end
    object MenuAssignApplication: TMenuItem
      Caption = 'Assign Application'
      OnClick = MenuAssignApplicationClick
    end
  end
  inherited adt_active: TADODataSet
    CursorType = ctStatic
    BeforeInsert = adt_activeBeforeInsert
  end
  inherited PrintDBGridEh1: TPrintDBGridEh
    BeforeGridText_Data = {
      7B5C727466315C616E73695C64656666305C6465666C616E67313033337B5C66
      6F6E7474626C7B5C66305C66737769737320417269616C3B7D7B5C66315C6673
      77697373204D532053616E732053657269663B7D7D0D0A5C766965776B696E64
      345C7563315C706172645C71635C625C66305C66733238205269636820746578
      74206265666F726520677269642E5C6C616E67313034395C62305C6673313620
      0D0A5C706172205C70617264200D0A5C706172205C625C667331382054507269
      6E74444247726964456820636F6D706F6E656E7420616C6C6F777320796F7520
      746F206472617720726963682074657874206265666F726520677269642E0D0A
      5C706172205C62305C66733136200D0A5C706172205C756C5C625C695C667331
      3820557365204265666F726547726964546578742070726F706572747920746F
      207479706520746578742E0D0A5C706172205C756C6E6F6E655C62305C69305C
      66315C66733136200D0A5C706172207D0D0A00}
    AfterGridText_Data = {
      7B5C727466315C616E73695C64656666305C6465666C616E67313033337B5C66
      6F6E7474626C7B5C66305C66737769737320417269616C3B7D7B5C66315C6673
      77697373204D532053616E732053657269663B7D7D0D0A5C766965776B696E64
      345C7563315C706172645C625C66305C66733230200D0A5C7061722052696368
      207465787420616674657220677269640D0A5C706172205C6C616E6731303439
      5C62305C66733136200D0A5C706172205C6220255B546F6461795D5C7461625C
      7461625C7461625C7461625C7461625C7461625C7461625C7461622044617461
      2066726F6D20444244454D4F532064617461626173655C62305C6631200D0A5C
      706172207D0D0A00}
  end
  object adt_plant: TADODataSet
    CursorType = ctStatic
    Parameters = <>
    Left = 176
    Top = 1
  end
  object ds_plant: TDataSource
    DataSet = adt_plant
    Left = 217
    Top = 8
  end
  object ds_country: TDataSource
    DataSet = adt_country
    Left = 361
    Top = 16
  end
  object adt_country: TADODataSet
    Parameters = <>
    Left = 321
    Top = 16
  end
  object adt_type: TADODataSet
    Parameters = <>
    Left = 705
    Top = 16
  end
  object ds_type: TDataSource
    DataSet = adt_type
    Left = 761
    Top = 16
  end
  object adt_trading: TADODataSet
    CursorType = ctStatic
    BeforeInsert = adt_activeBeforeInsert
    AfterPost = adt_activeAfterPost
    AfterDelete = adt_activeAfterDelete
    OnDeleteError = adt_activeDeleteError
    OnEditError = adt_activeEditError
    OnPostError = adt_activePostError
    CommandText = 'select * from ViewTradingCustomer'
    Parameters = <>
    Left = 914
    Top = 42
  end
  object ds_trading: TDataSource
    DataSet = adt_trading
    Left = 954
    Top = 43
  end
end
