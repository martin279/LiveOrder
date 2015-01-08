inherited frmBillOfMaterials: TfrmBillOfMaterials
  Left = 473
  Top = 136
  Caption = 'frmBillOfMaterials'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBottom: TPanel
    Top = 404
    Height = 38
    object Label1: TLabel
      Left = 26
      Top = 11
      Width = 29
      Height = 13
      Caption = 'Model'
    end
    object Label2: TLabel
      Left = 250
      Top = 11
      Width = 54
      Height = 13
      Caption = 'Component'
    end
    object dbcbbModel: TDBLookupComboboxEh
      Left = 66
      Top = 7
      Width = 141
      Height = 21
      EditButtons = <>
      KeyField = 'ModelID'
      ListField = 'Model'
      ListSource = ds_model
      TabOrder = 0
      Visible = True
    end
    object btnSave: TButton
      Left = 512
      Top = 6
      Width = 57
      Height = 25
      Caption = 'Save'
      TabOrder = 1
      OnClick = btnSaveClick
    end
    object dbcbbComponent: TDBLookupComboboxEh
      Left = 314
      Top = 7
      Width = 141
      Height = 21
      EditButtons = <>
      KeyField = 'ComponentID'
      ListField = 'ComponentItem'
      ListSource = ds_component
      TabOrder = 2
      Visible = True
    end
  end
  inherited pnlBody: TPanel
    Height = 379
    inherited Splitter1: TSplitter
      Top = 214
    end
    inherited PageControl1: TPageControl
      Height = 214
      inherited tbsBody1: TTabSheet
        inherited GroupBox1: TGroupBox
          Height = 183
          inherited gridData: TDBGridEh
            Height = 166
            OnCellClick = gridDataCellClick
            Columns = <
              item
                EditButtons = <>
                FieldName = 'ModelID'
                Footers = <>
                Width = 49
              end
              item
                EditButtons = <>
                FieldName = 'Model'
                Footers = <>
                Width = 134
              end
              item
                EditButtons = <>
                FieldName = 'XRef'
                Footers = <>
                Width = 46
              end
              item
                EditButtons = <>
                FieldName = 'BaseShortHandCode'
                Footers = <>
                Width = 114
              end
              item
                EditButtons = <>
                FieldName = 'ProductionFactor'
                Footers = <>
                Width = 93
              end
              item
                EditButtons = <>
                FieldName = 'SchedulingCode'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'BaseSE'
                Footers = <>
                Width = 47
              end>
          end
        end
      end
    end
    inherited GroupBox2: TGroupBox
      Top = 217
      inherited gridData2: TDBGridEh
        Columns = <
          item
            EditButtons = <>
            FieldName = 'BillOfMaterialsID'
            Footers = <>
            Title.Caption = 'BOMID'
            Width = 54
          end
          item
            EditButtons = <>
            FieldName = 'Model'
            Footers = <>
            ReadOnly = True
            Width = 110
          end
          item
            EditButtons = <>
            FieldName = 'ComponentItem'
            Footers = <>
            Title.Caption = 'Part No.'
            Width = 80
          end
          item
            EditButtons = <>
            FieldName = 'ComponentQuantity'
            Footers = <>
            Title.Caption = 'Component Qty.'
            Width = 81
          end
          item
            EditButtons = <>
            FieldName = 'ValidFrom'
            Footers = <>
            ReadOnly = True
            Title.Caption = 'Valid From'
            Width = 90
          end
          item
            EditButtons = <>
            FieldName = 'ValidUntil'
            Footers = <>
            ReadOnly = True
            Title.Caption = 'Valid Until'
            Width = 103
          end
          item
            EditButtons = <>
            FieldName = 'ComponentID'
            Footers = <>
            ReadOnly = True
          end>
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
    object adt_activeModelID: TAutoIncField
      FieldName = 'ModelID'
      ReadOnly = True
    end
    object adt_activeModel: TStringField
      FieldName = 'Model'
      Size = 25
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
  end
  inherited adt_active2: TADODataSet
    BeforeDelete = adt_active2BeforeDelete
    object adt_active2BillOfMaterialsID: TAutoIncField
      FieldName = 'BillOfMaterialsID'
      ReadOnly = True
    end
    object adt_active2ModelID: TIntegerField
      FieldName = 'ModelID'
    end
    object adt_active2ComponentID: TIntegerField
      FieldName = 'ComponentID'
    end
    object adt_active2ComponentQuantity: TFloatField
      FieldName = 'ComponentQuantity'
    end
    object adt_active2ValidFrom: TDateTimeField
      FieldName = 'ValidFrom'
    end
    object adt_active2ValidUntil: TDateTimeField
      FieldName = 'ValidUntil'
    end
    object adt_active2Model: TStringField
      FieldName = 'Model'
      Size = 25
    end
    object adt_active2BaseShortHandCode: TStringField
      FieldName = 'BaseShortHandCode'
      Size = 3
    end
    object adt_active2ComponentItem: TStringField
      FieldName = 'ComponentItem'
      Size = 30
    end
    object adt_active2ComponentDescription: TStringField
      FieldName = 'ComponentDescription'
      Size = 30
    end
    object adt_active2ComponentSeriesID: TIntegerField
      FieldName = 'ComponentSeriesID'
    end
    object adt_active2ComponentSeriesName: TStringField
      FieldName = 'ComponentSeriesName'
      Size = 30
    end
  end
  inherited ds_active2: TDataSource
    Left = 198
  end
  object adt_model: TADODataSet
    Parameters = <>
    Left = 273
    Top = 16
  end
  object adt_component: TADODataSet
    Parameters = <>
    Left = 321
    Top = 16
  end
  object ds_component: TDataSource
    DataSet = adt_component
    Left = 320
    Top = 49
  end
  object ds_model: TDataSource
    DataSet = adt_model
    Left = 272
    Top = 49
  end
end
