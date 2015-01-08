inherited frmModel: TfrmModel
  Left = 428
  Top = 126
  Width = 717
  Height = 568
  Caption = 'frmModel'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBottom: TPanel
    Top = 488
    Width = 701
    Height = 42
  end
  inherited pnlBody: TPanel
    Width = 701
    Height = 463
    inherited PageControl1: TPageControl
      Width = 701
      Height = 463
      ActivePage = TabSheet3
      PopupMenu = PopupMenu1
      inherited tbsBody1: TTabSheet
        Caption = 'Model'
        inherited GroupBox1: TGroupBox
          Width = 693
          Height = 432
          inherited PreviewSetupPanel: TPanel
            Width = 689
          end
          inherited PreviewBox1: TPreviewBox
            Top = 341
            Width = 689
          end
          inherited gridData: TDBGridEh
            Width = 689
            Height = 285
            OnEnter = gridDataEnter
            Columns = <
              item
                EditButtons = <>
                FieldName = 'ModelID'
                Footers = <>
                Title.Caption = 'ID'
                Width = 43
              end
              item
                EditButtons = <>
                FieldName = 'Model'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'ModelDescription'
                Footers = <>
                Title.Caption = 'Model Description'
                Width = 126
              end
              item
                EditButtons = <>
                FieldName = 'ModelChineseDescription'
                Footers = <>
                Title.Caption = 'Model Chinese Desc.'
              end
              item
                EditButtons = <>
                FieldName = 'ProductClassification'
                Footers = <>
                Title.Caption = 'Product Classification'
                Width = 125
              end
              item
                EditButtons = <>
                FieldName = 'CommodityInspection'
                Footers = <>
                Title.Caption = 'Commodity Inspection'
              end
              item
                EditButtons = <>
                FieldName = 'IsValid'
                Footers = <>
                Title.Caption = 'Is Valid'
                Width = 61
              end>
          end
        end
      end
      object TabSheet1: TTabSheet
        Caption = 'Mainframe Model'
        ImageIndex = 1
        object gridMFModel: TDBGridEh
          Left = 0
          Top = 0
          Width = 693
          Height = 432
          Align = alClient
          DataSource = ds_mfModel
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
          ParentFont = False
          ParentShowHint = False
          RowHeight = 2
          RowLines = 1
          ShowHint = False
          STFilter.Local = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          TitleImages = ImageList1
          UseMultiTitle = True
          VertScrollBar.Tracking = True
          OnEnter = gridMFModelEnter
          OnGetCellParams = gridMFModelGetCellParams
          Columns = <
            item
              EditButtons = <>
              FieldName = 'MainframeModel'
              Footers = <>
              Title.Caption = 'Mainframe Model'
            end
            item
              EditButtons = <>
              FieldName = 'Model1'
              Footers = <>
              Title.Caption = 'Model'
            end>
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Series&&Family'
        ImageIndex = 2
        object GroupBox2: TGroupBox
          Left = 8
          Top = 8
          Width = 409
          Height = 401
          Caption = 'Product Series'
          TabOrder = 0
          object gridSeries: TDBGridEh
            Left = 2
            Top = 15
            Width = 405
            Height = 384
            Align = alClient
            DataSource = ds_ProductSeries
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
            OnEnter = gridSeriesEnter
            OnGetCellParams = gridSeriesGetCellParams
            OnGetFooterParams = gridDataGetFooterParams
            OnKeyDown = gridDataKeyDown
            Columns = <
              item
                EditButtons = <>
                FieldName = 'ProductSeriesName'
                Footers = <>
                Title.Caption = 'Product Series'
                Width = 159
              end
              item
                EditButtons = <>
                FieldName = 'ProductSeriesDesc'
                Footers = <>
                Title.Caption = 'Product Series Desc.'
                Width = 84
              end
              item
                EditButtons = <>
                FieldName = 'ProductSeriesChineseDesc'
                Footers = <>
                Title.Caption = 'Chinese Desc.'
                Width = 74
              end
              item
                EditButtons = <>
                FieldName = 'IsValid'
                Footers = <>
                Title.Caption = 'Is Valid'
                Width = 35
              end>
          end
        end
        object GroupBox3: TGroupBox
          Left = 432
          Top = 8
          Width = 225
          Height = 401
          Caption = 'Product Family'
          TabOrder = 1
          object gridFamily: TDBGridEh
            Left = 2
            Top = 15
            Width = 221
            Height = 384
            Align = alClient
            DataSource = ds_ProductFamily
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
            OddRowColor = clWindow
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
            OnEnter = gridFamilyEnter
            OnGetCellParams = gridFamilyGetCellParams
            OnGetFooterParams = gridDataGetFooterParams
            OnKeyDown = gridDataKeyDown
            Columns = <
              item
                EditButtons = <>
                FieldName = 'ProductFamilyName'
                Footers = <>
                Title.Caption = 'Product Family Name'
                Width = 152
              end
              item
                EditButtons = <>
                FieldName = 'IsValid'
                Footers = <>
                Title.Caption = 'Is Valid'
                Width = 34
              end>
          end
        end
      end
      object TabSheet3: TTabSheet
        Caption = 'Model Involved'
        ImageIndex = 3
        object gridModelInvolved: TDBGridEh
          Left = 0
          Top = 0
          Width = 693
          Height = 432
          Align = alClient
          DataSource = ds_modelInvoled
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
          ParentFont = False
          ParentShowHint = False
          RowHeight = 2
          RowLines = 1
          ShowHint = False
          STFilter.Local = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          TitleImages = ImageList1
          UseMultiTitle = True
          VertScrollBar.Tracking = True
          OnEnter = gridModelInvolvedEnter
          Columns = <
            item
              EditButtons = <>
              FieldName = 'ModelID'
              Footers = <>
            end
            item
              EditButtons = <>
              FieldName = 'Model1'
              Footers = <>
              Title.Caption = 'Model'
            end>
        end
      end
    end
  end
  inherited PnlTop: TPanel
    Width = 701
    inherited CoolBar1: TCoolBar
      Width = 701
      Bands = <
        item
          Control = ToolBar1
          ImageIndex = -1
          Width = 701
        end>
      inherited ToolBar1: TToolBar
        Width = 688
        inherited DBNavigator1: TDBNavigator
          Hints.Strings = ()
        end
      end
    end
  end
  inherited ds_active: TDataSource
    Left = 138
  end
  inherited PopupMenu1: TPopupMenu
    object N2: TMenuItem
      Caption = '-'
    end
    object MenuEdtModel: TMenuItem
      Caption = 'Edit Model'
      OnClick = MenuEdtModelClick
    end
  end
  inherited adt_active: TADODataSet
    CursorType = ctStatic
    BeforeInsert = adt_activeBeforeInsert
    CommandText = 'select * from Model'
    Left = 98
    Top = 0
    object adt_activeModelID: TAutoIncField
      FieldName = 'ModelID'
      ReadOnly = True
    end
    object adt_activeModel: TStringField
      FieldName = 'Model'
      Size = 25
    end
    object adt_activeModelDescription: TStringField
      FieldName = 'ModelDescription'
      Size = 80
    end
    object adt_activeProductClassification: TStringField
      FieldName = 'ProductClassification'
      Size = 1
    end
    object adt_activeIsValid: TBooleanField
      FieldName = 'IsValid'
    end
    object adt_activeXRef: TStringField
      FieldName = 'XRef'
      Size = 3
    end
    object adt_activeBaseShortHandCode: TStringField
      FieldName = 'BaseShortHandCode'
      Size = 3
    end
    object adt_activeProductionFactor: TFloatField
      FieldName = 'ProductionFactor'
    end
    object adt_activeSchedulingCode: TStringField
      FieldName = 'SchedulingCode'
    end
    object adt_activeBaseSE: TStringField
      FieldName = 'BaseSE'
      Size = 3
    end
    object adt_activeProductSeriesID: TIntegerField
      FieldName = 'ProductSeriesID'
    end
    object adt_activecatalogue: TStringField
      FieldName = 'catalogue'
    end
    object adt_activeSupplier: TStringField
      FieldName = 'Supplier'
      Size = 50
    end
    object adt_activeCommodityInspection: TStringField
      FieldName = 'CommodityInspection'
      Size = 10
    end
    object adt_activeNote: TStringField
      FieldName = 'Note'
      Size = 300
    end
    object adt_activeModelChineseDescription: TStringField
      FieldName = 'ModelChineseDescription'
      Size = 100
    end
    object adt_activeUpdateTime: TDateTimeField
      FieldName = 'UpdateTime'
    end
    object adt_activeUpdateBy: TIntegerField
      FieldName = 'UpdateBy'
    end
    object adt_activeSyncTime: TDateTimeField
      FieldName = 'SyncTime'
    end
    object adt_activeSyncStatus: TSmallintField
      FieldName = 'SyncStatus'
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
  object ds_mfModel: TDataSource
    DataSet = adt_mfModel
    Left = 242
    Top = 8
  end
  object adt_mfModel: TADODataSet
    Parameters = <>
    Left = 201
    Top = 8
    object adt_mfModelMainframeModelID: TAutoIncField
      FieldName = 'MainframeModelID'
      ReadOnly = True
    end
    object adt_mfModelModelID: TIntegerField
      FieldName = 'ModelID'
    end
    object adt_mfModelMainframeModel: TStringField
      FieldName = 'MainframeModel'
      Size = 30
    end
    object adt_mfModelModel1: TStringField
      FieldKind = fkLookup
      FieldName = 'Model1'
      LookupDataSet = adt_active
      LookupKeyFields = 'ModelID'
      LookupResultField = 'Model'
      KeyFields = 'ModelID'
      Size = 30
      Lookup = True
    end
  end
  object ds_ProductSeries: TDataSource
    DataSet = adt_ProductSeries
    Left = 140
    Top = 172
  end
  object ds_ProductFamily: TDataSource
    DataSet = adt_ProductFamily
    Left = 500
    Top = 172
  end
  object adt_ProductSeries: TADODataSet
    Parameters = <>
    Left = 100
    Top = 172
  end
  object adt_ProductFamily: TADODataSet
    Parameters = <>
    Left = 452
    Top = 172
  end
  object ds_modelInvoled: TDataSource
    DataSet = adt_modelInvoled
    Left = 354
    Top = 8
  end
  object adt_modelInvoled: TADODataSet
    Parameters = <>
    Left = 321
    Top = 8
    object IntegerField1: TIntegerField
      FieldName = 'ModelID'
    end
    object StringField2: TStringField
      FieldKind = fkLookup
      FieldName = 'Model1'
      LookupDataSet = adt_active
      LookupKeyFields = 'ModelID'
      LookupResultField = 'Model'
      KeyFields = 'ModelID'
      Size = 30
      Lookup = True
    end
  end
end
