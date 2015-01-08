inherited frmPrice: TfrmPrice
  Left = 580
  Top = 232
  Width = 842
  Height = 595
  Caption = 'frmPrice'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBottom: TPanel
    Top = 516
    Width = 826
  end
  inherited pnlBody: TPanel
    Width = 826
    Height = 491
    inherited Splitter1: TSplitter
      Top = 341
      Width = 826
    end
    inherited PageControl1: TPageControl
      Width = 826
      Height = 341
      OnChanging = PageControl1Changing
      inherited tbsBody1: TTabSheet
        Caption = 'Price'
        inherited GroupBox1: TGroupBox
          Width = 818
          Height = 310
          inherited gridData: TDBGridEh
            Width = 814
            Height = 293
            OnCellClick = gridDataCellClick
            OnDblClick = gridDataDblClick
            Columns = <
              item
                EditButtons = <>
                FieldName = 'PriceID'
                Footers = <>
                Title.Caption = 'ID'
                Width = 41
              end
              item
                EditButtons = <>
                FieldName = 'CustomerNumber'
                Footers = <>
                Title.Caption = 'Customer No.'
              end
              item
                EditButtons = <>
                FieldName = 'CustomerName'
                Footers = <>
                Title.Caption = 'Customer Name'
                Width = 147
              end
              item
                EditButtons = <>
                FieldName = 'Model'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'DemandQuantity'
                Footers = <>
                Title.Caption = 'Demand Qty.'
              end
              item
                EditButtons = <>
                FieldName = 'Currency'
                Footers = <>
                Width = 47
              end
              item
                EditButtons = <>
                FieldName = 'Price'
                Footers = <>
                Width = 63
              end
              item
                EditButtons = <>
                FieldName = 'PaymentTerms'
                Footers = <>
                Title.Caption = 'Payment Terms'
                Width = 100
              end
              item
                EditButtons = <>
                FieldName = 'PriceTerms'
                Footers = <>
                Title.Caption = 'Price Terms'
                Width = 100
              end
              item
                DisplayFormat = 'YYYY-mm-dd'
                EditButtons = <>
                FieldName = 'EffectDate'
                Footers = <>
                Title.Caption = 'Effect Date'
                Width = 100
              end
              item
                EditButtons = <>
                FieldName = 'BusinessApplicationName'
                Footers = <>
                Title.Caption = 'Application'
              end
              item
                EditButtons = <>
                FieldName = 'Remark'
                Footers = <>
                Width = 122
              end
              item
                EditButtons = <>
                FieldName = 'DisplayName'
                Footers = <>
                Title.Caption = 'Creator'
                Width = 69
              end
              item
                EditButtons = <>
                FieldName = 'CreateTime'
                Footers = <>
                Title.Caption = 'Create Time'
                Width = 110
              end
              item
                EditButtons = <>
                FieldName = 'UpdateTime'
                Footers = <>
                Title.Caption = 'Update Time'
                Width = 92
              end>
          end
        end
      end
      object TabSheet1: TTabSheet
        Caption = 'Terms'
        ImageIndex = 1
        object GroupBox3: TGroupBox
          Left = 16
          Top = 9
          Width = 240
          Height = 300
          Caption = 'Payment Terms'
          TabOrder = 0
          object gridPaymentTerms: TDBGridEh
            Left = 2
            Top = 15
            Width = 236
            Height = 283
            Align = alClient
            DataSource = ds_PaymentTerms
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
            TitleImages = ImageList1
            UseMultiTitle = True
            VertScrollBar.Tracking = True
            OnColWidthsChanged = gridDataColWidthsChanged
            OnEnter = gridPaymentTermsEnter
            OnGetCellParams = gridPaymentTermsGetCellParams
            OnGetFooterParams = gridDataGetFooterParams
            OnKeyDown = gridDataKeyDown
            Columns = <
              item
                EditButtons = <>
                FieldName = 'PaymentTerms'
                Footers = <>
                Title.Caption = 'Payment Terms'
                Width = 198
              end>
          end
        end
        object GroupBox4: TGroupBox
          Left = 328
          Top = 9
          Width = 240
          Height = 300
          Caption = 'Price Terms'
          TabOrder = 1
          object gridPriceTerms: TDBGridEh
            Left = 2
            Top = 15
            Width = 236
            Height = 283
            Align = alClient
            DataSource = ds_PriceTerms
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
            TitleImages = ImageList1
            UseMultiTitle = True
            VertScrollBar.Tracking = True
            OnColWidthsChanged = gridDataColWidthsChanged
            OnEnter = gridPriceTermsEnter
            OnGetCellParams = gridPriceTermsGetCellParams
            OnGetFooterParams = gridDataGetFooterParams
            OnKeyDown = gridDataKeyDown
            Columns = <
              item
                EditButtons = <>
                FieldName = 'PriceTerms'
                Footers = <>
                Title.Caption = 'Price Terms'
                Width = 203
              end>
          end
        end
      end
    end
    inherited GroupBox2: TGroupBox
      Top = 344
      Width = 826
      Height = 147
      inherited gridData2: TDBGridEh
        Width = 822
        Height = 130
        Columns = <
          item
            EditButtons = <>
            FieldName = 'PriceID'
            Footers = <>
            Title.Caption = 'ID'
            Width = 43
          end
          item
            EditButtons = <>
            FieldName = 'DemandQuantity'
            Footers = <>
            Title.Caption = 'Demand Qty.'
            Width = 45
          end
          item
            EditButtons = <>
            FieldName = 'Currency'
            Footers = <>
            Width = 47
          end
          item
            EditButtons = <>
            FieldName = 'Price'
            Footers = <>
            Width = 49
          end
          item
            EditButtons = <>
            FieldName = 'PaymentTerms'
            Footers = <>
            Title.Caption = 'Payment Terms'
            Width = 100
          end
          item
            EditButtons = <>
            FieldName = 'PriceTerms'
            Footers = <>
            Title.Caption = 'Price Terms'
            Width = 100
          end
          item
            EditButtons = <>
            FieldName = 'EffectDate'
            Footers = <>
            Title.Caption = 'Effect Date'
            Width = 90
          end
          item
            EditButtons = <>
            FieldName = 'Remark'
            Footers = <>
            Width = 78
          end
          item
            EditButtons = <>
            FieldName = 'ChangeTime'
            Footers = <>
            Title.Caption = 'Change Time'
            Width = 104
          end
          item
            EditButtons = <>
            FieldName = 'DisplayName'
            Footers = <>
            Title.Caption = 'Change By'
          end>
      end
    end
  end
  inherited PnlTop: TPanel
    Width = 826
    inherited CoolBar1: TCoolBar
      Width = 826
      Bands = <
        item
          Control = ToolBar1
          ImageIndex = -1
          Width = 826
        end>
      inherited ToolBar1: TToolBar
        Width = 813
        ButtonWidth = 49
        inherited ToolButton2: TToolButton
          Left = 49
        end
        inherited DBNavigator1: TDBNavigator
          Left = 57
          Hints.Strings = ()
        end
        inherited ToolButton3: TToolButton
          Left = 287
        end
        inherited tbtnFilter: TToolButton
          Left = 295
        end
        inherited tbtnOperation: TToolButton
          Left = 344
          Caption = 'Log'
        end
      end
    end
  end
  inherited adt_active: TADODataSet
    BeforeInsert = adt_activeBeforeInsert
  end
  object adt_PaymentTerms: TADODataSet
    Parameters = <>
    Left = 84
    Top = 100
  end
  object ds_PaymentTerms: TDataSource
    DataSet = adt_PaymentTerms
    Left = 132
    Top = 108
  end
  object ds_PriceTerms: TDataSource
    DataSet = adt_PriceTerms
    Left = 404
    Top = 100
  end
  object adt_PriceTerms: TADODataSet
    Parameters = <>
    Left = 356
    Top = 96
  end
end
