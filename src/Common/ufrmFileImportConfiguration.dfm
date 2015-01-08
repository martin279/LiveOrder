inherited frmFileImportConfiguration: TfrmFileImportConfiguration
  Caption = 'frmFileImportConfiguration'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBottom: TPanel
    Top = 364
    Height = 78
  end
  inherited pnlBody: TPanel
    Height = 339
    inherited PageControl1: TPageControl
      Height = 339
      OnChange = PageControl1Change
      inherited tbsBody1: TTabSheet
        Caption = 'File Import'
        inherited GroupBox1: TGroupBox
          Height = 232
          inherited PreviewBox1: TPreviewBox
            Top = 141
          end
          inherited gridData: TDBGridEh
            Height = 85
            Columns = <
              item
                EditButtons = <>
                FieldName = 'FileImportConfigurationID'
                Footers = <>
                Title.Caption = 'ID'
                Width = 46
              end
              item
                EditButtons = <>
                FieldName = 'ImportSequence'
                Footers = <>
                Title.Caption = 'Import Sequence'
                Width = 88
              end
              item
                EditButtons = <>
                FieldName = 'CreationDate'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'LastFileDate'
                Footers = <>
                Title.Caption = 'Last File Date'
              end
              item
                EditButtons = <>
                FieldName = 'LastImportDate'
                Footers = <>
                Title.Caption = 'Last Import Date'
              end
              item
                EditButtons = <>
                FieldName = 'Description'
                Footers = <>
                Width = 140
              end
              item
                EditButtons = <>
                FieldName = 'ImportFilePath'
                Footers = <>
                Title.Caption = 'File Path'
                Width = 89
              end
              item
                EditButtons = <>
                FieldName = 'ImportFileName'
                Footers = <>
                Title.Caption = 'File Name'
                Width = 105
              end
              item
                EditButtons = <>
                FieldName = 'IsTokenSeparated'
                Footers = <>
                Width = 101
              end
              item
                EditButtons = <>
                FieldName = 'TokenSeparator'
                Footers = <>
                Width = 103
              end
              item
                EditButtons = <>
                FieldName = 'HeaderRows'
                Footers = <>
                Width = 78
              end
              item
                EditButtons = <>
                FieldName = 'Active'
                Footers = <>
                Width = 60
              end
              item
                EditButtons = <>
                FieldName = 'StoredProcedureDelete'
                Footers = <>
                Width = 137
              end
              item
                EditButtons = <>
                FieldName = 'StoredProcedureInsert'
                Footers = <>
                Width = 127
              end
              item
                EditButtons = <>
                FieldName = 'StoredProcedureProcess'
                Footers = <>
                Width = 141
              end>
          end
        end
        object Panel1: TPanel
          Left = 0
          Top = 232
          Width = 667
          Height = 76
          Align = alBottom
          TabOrder = 1
          object Label2: TLabel
            Left = 24
            Top = 16
            Width = 30
            Height = 13
            Caption = 'Status'
          end
          object labelStatus: TLabel
            Left = 72
            Top = 16
            Width = 9
            Height = 13
            Caption = '...'
          end
          object buttonImportSelected: TButton
            Left = 272
            Top = 45
            Width = 80
            Height = 25
            Caption = 'Import Select'
            TabOrder = 0
            OnClick = buttonImportSelectedClick
          end
        end
      end
      object TabSheet1: TTabSheet
        Caption = 'CO Import Temp Data'
        ImageIndex = 1
        object GroupBox3: TGroupBox
          Left = 0
          Top = 0
          Width = 667
          Height = 308
          Align = alClient
          TabOrder = 0
          object gridCOImport: TDBGridEh
            Left = 2
            Top = 15
            Width = 663
            Height = 291
            Align = alClient
            DataSource = ds_co
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
                FieldName = 'CustomerPONumber'
                Footers = <>
                Title.Caption = 'Customer PO No.'
                Width = 100
              end
              item
                EditButtons = <>
                FieldName = 'CustomerNumber'
                Footers = <>
                Title.Caption = 'Customer No.'
                Width = 89
              end
              item
                EditButtons = <>
                FieldName = 'Model'
                Footers = <>
                Width = 65
              end
              item
                EditButtons = <>
                FieldName = 'Quantity'
                Footers = <>
                Width = 65
              end
              item
                EditButtons = <>
                FieldName = 'RTD'
                Footers = <>
                Width = 65
              end
              item
                EditButtons = <>
                FieldName = 'LoginID'
                Footers = <>
                Title.Caption = 'Login ID'
                Width = 65
              end
              item
                EditButtons = <>
                FieldName = 'Currency'
                Footers = <>
                Width = 65
              end
              item
                EditButtons = <>
                FieldName = 'Price'
                Footers = <>
                Width = 65
              end
              item
                EditButtons = <>
                FieldName = 'PlantCode'
                Footers = <>
                Title.Caption = 'Plant Code'
                Width = 65
              end
              item
                EditButtons = <>
                FieldName = 'OrderNumber'
                Footers = <>
                Title.Caption = 'Order No.'
                Width = 65
              end
              item
                EditButtons = <>
                FieldName = 'CustomerPartNumber'
                Footers = <>
                Title.Caption = 'Customer Part No.'
                Width = 94
              end
              item
                EditButtons = <>
                FieldName = 'BusinessApplication'
                Footers = <>
                Title.Caption = 'Application'
                Width = 65
              end
              item
                EditButtons = <>
                FieldName = 'ETD'
                Footers = <>
                Width = 65
              end
              item
                EditButtons = <>
                FieldName = 'ETA'
                Footers = <>
                Width = 65
              end
              item
                EditButtons = <>
                FieldName = 'ATD'
                Footers = <>
                Width = 65
              end
              item
                EditButtons = <>
                FieldName = 'ATA'
                Footers = <>
                Width = 65
              end
              item
                EditButtons = <>
                FieldName = 'InvoiceNumber'
                Footers = <>
                Title.Caption = 'Invoice No.'
                Width = 65
              end
              item
                EditButtons = <>
                FieldName = 'Forwarder'
                Footers = <>
                Width = 65
              end
              item
                EditButtons = <>
                FieldName = 'Payment'
                Footers = <>
                Width = 65
              end
              item
                EditButtons = <>
                FieldName = 'CustomerOrderStatesID'
                Footers = <>
                Title.Caption = 'Customer Order States ID'
                Width = 83
              end
              item
                EditButtons = <>
                FieldName = 'ImportBy'
                Footers = <>
                Title.Caption = 'Import By'
                Width = 65
              end
              item
                EditButtons = <>
                FieldName = 'CreateTime'
                Footers = <>
                Title.Caption = 'Create Time'
                Width = 65
              end>
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Price Import Temp Data'
        ImageIndex = 2
        object GroupBox2: TGroupBox
          Left = 0
          Top = 0
          Width = 667
          Height = 308
          Align = alClient
          TabOrder = 0
          object gridPriceImport: TDBGridEh
            Left = 2
            Top = 15
            Width = 663
            Height = 291
            Align = alClient
            DataSource = ds_price
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
                Width = 78
              end
              item
                EditButtons = <>
                FieldName = 'Model'
                Footers = <>
                Width = 119
              end
              item
                EditButtons = <>
                FieldName = 'DemandQuantity'
                Footers = <>
                Title.Caption = 'Demand Qty.'
                Width = 58
              end
              item
                EditButtons = <>
                FieldName = 'Currency'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'Price'
                Footers = <>
                Width = 68
              end
              item
                EditButtons = <>
                FieldName = 'EffectDate'
                Footers = <>
                Title.Caption = 'Effect Date'
              end
              item
                EditButtons = <>
                FieldName = 'PaymentTerms'
                Footers = <>
                Title.Caption = 'Payment Terms'
                Width = 107
              end
              item
                EditButtons = <>
                FieldName = 'PriceTerms'
                Footers = <>
                Title.Caption = 'Price Terms'
                Width = 113
              end
              item
                EditButtons = <>
                FieldName = 'ProductFamilyName'
                Footers = <>
                Title.Caption = 'Product Family Name'
                Width = 134
              end
              item
                EditButtons = <>
                FieldName = 'ProductSeriesName'
                Footers = <>
                Title.Caption = 'Product Series Name'
                Width = 157
              end
              item
                EditButtons = <>
                FieldName = 'PlantCode'
                Footers = <>
                Title.Caption = 'Plant Code'
                Width = 63
              end
              item
                EditButtons = <>
                FieldName = 'ImportBy'
                Footers = <>
                Title.Caption = 'Import By'
                Width = 71
              end
              item
                EditButtons = <>
                FieldName = 'CreateTime'
                Footers = <>
                Title.Caption = 'Create Time'
              end>
          end
        end
      end
    end
  end
  inherited PnlTop: TPanel
    inherited CoolBar1: TCoolBar
      inherited ToolBar1: TToolBar
        inherited DBNavigator1: TDBNavigator
          Hints.Strings = ()
        end
      end
    end
  end
  inherited adt_active: TADODataSet
    CommandText = 'select * from FileImportConfiguration'
    object adt_activeFileImportConfigurationID: TAutoIncField
      FieldName = 'FileImportConfigurationID'
      ReadOnly = True
    end
    object adt_activeImportSequence: TIntegerField
      FieldName = 'ImportSequence'
    end
    object adt_activeCreationDate: TDateTimeField
      FieldName = 'CreationDate'
    end
    object adt_activeLastFileDate: TDateTimeField
      FieldName = 'LastFileDate'
    end
    object adt_activeLastImportDate: TDateTimeField
      FieldName = 'LastImportDate'
    end
    object adt_activeDescription: TStringField
      FieldName = 'Description'
      Size = 50
    end
    object adt_activeImportFilePath: TStringField
      FieldName = 'ImportFilePath'
      Size = 255
    end
    object adt_activeImportFileName: TStringField
      FieldName = 'ImportFileName'
      Size = 255
    end
    object adt_activeIsTokenSeparated: TBooleanField
      FieldName = 'IsTokenSeparated'
    end
    object adt_activeTokenSeparator: TStringField
      FieldName = 'TokenSeparator'
    end
    object adt_activeHeaderRows: TIntegerField
      FieldName = 'HeaderRows'
    end
    object adt_activeActive: TBooleanField
      FieldName = 'Active'
    end
    object adt_activeStoredProcedureDelete: TStringField
      FieldName = 'StoredProcedureDelete'
      Size = 50
    end
    object adt_activeStoredProcedureInsert: TStringField
      FieldName = 'StoredProcedureInsert'
      Size = 50
    end
    object adt_activeStoredProcedureProcess: TStringField
      FieldName = 'StoredProcedureProcess'
      Size = 50
    end
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
  object adt_co: TADODataSet
    CommandText = 'select * from Oversea_COImport'
    Parameters = <>
    Left = 252
    Top = 20
  end
  object adt_price: TADODataSet
    Connection = DM.ADOConnection1
    CommandText = 'select * from PriceImport'
    Parameters = <>
    Left = 384
    Top = 33
    object adt_priceCustomerNumber: TStringField
      FieldName = 'CustomerNumber'
      Size = 10
    end
    object adt_priceModel: TStringField
      FieldName = 'Model'
      Size = 30
    end
    object adt_priceDemandQuantity: TStringField
      FieldName = 'DemandQuantity'
      Size = 10
    end
    object adt_priceCurrency: TStringField
      FieldName = 'Currency'
      Size = 10
    end
    object adt_pricePrice: TStringField
      FieldName = 'Price'
      Size = 15
    end
    object adt_priceEffectDate: TStringField
      FieldName = 'EffectDate'
      Size = 10
    end
    object adt_pricePaymentTerms: TStringField
      FieldName = 'PaymentTerms'
      Size = 50
    end
    object adt_pricePriceTerms: TStringField
      FieldName = 'PriceTerms'
      Size = 50
    end
    object adt_priceProductFamilyName: TStringField
      FieldName = 'ProductFamilyName'
      Size = 50
    end
    object adt_priceProductSeriesName: TStringField
      FieldName = 'ProductSeriesName'
      Size = 50
    end
    object adt_pricePlantCode: TStringField
      FieldName = 'PlantCode'
      Size = 50
    end
    object adt_priceImportBy: TStringField
      FieldName = 'ImportBy'
      Size = 50
    end
    object adt_priceCreateTime: TDateTimeField
      FieldName = 'CreateTime'
    end
  end
  object ds_co: TDataSource
    DataSet = adt_co
    Left = 296
    Top = 25
  end
  object ds_price: TDataSource
    DataSet = adt_price
    Left = 424
    Top = 41
  end
end
