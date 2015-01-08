inherited frmEdtModel: TfrmEdtModel
  Left = 469
  Top = 115
  Width = 464
  Height = 519
  Caption = 'frmEdtModel'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBottom: TPanel
    Top = 248
    Width = 448
    Height = 233
    object Label4: TLabel
      Left = 16
      Top = 162
      Width = 51
      Height = 26
      Caption = 'Commodity Inspection'
      WordWrap = True
    end
    object Label3: TLabel
      Left = 6
      Top = 51
      Width = 60
      Height = 13
      Caption = 'Model Desc.'
    end
    object Label2: TLabel
      Left = 37
      Top = 20
      Width = 29
      Height = 13
      Caption = 'Model'
    end
    object Label1: TLabel
      Left = 5
      Top = 117
      Width = 61
      Height = 13
      Caption = 'Classification'
    end
    object Label5: TLabel
      Left = 3
      Top = 83
      Width = 69
      Height = 13
      Caption = 'Chinese Desc.'
    end
    object btnSave1: TButton
      Left = 104
      Top = 201
      Width = 75
      Height = 25
      Caption = 'Save'
      TabOrder = 0
      OnClick = btnSave1Click
    end
    object btnCancel: TButton
      Left = 278
      Top = 201
      Width = 75
      Height = 25
      Caption = 'Close'
      TabOrder = 1
      OnClick = btnCancelClick
    end
    object edtModelDesc: TEdit
      Left = 74
      Top = 47
      Width = 330
      Height = 21
      TabOrder = 2
    end
    object edtModel: TEdit
      Left = 74
      Top = 16
      Width = 330
      Height = 21
      TabOrder = 3
    end
    object chkIsValid: TCheckBox
      Left = 74
      Top = 140
      Width = 57
      Height = 17
      Caption = 'Is Valid'
      TabOrder = 4
      OnClick = chkIsValidClick
    end
    object cbbClass: TComboBox
      Left = 74
      Top = 113
      Width = 330
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 5
      Items.Strings = (
        ''
        'A'
        'B'
        'C'
        'D')
    end
    object cbbCI: TComboBox
      Left = 75
      Top = 168
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 6
      Items.Strings = (
        ''
        'Yes'
        'No')
    end
    object edtModelChineseDesc: TEdit
      Left = 74
      Top = 79
      Width = 330
      Height = 21
      TabOrder = 7
    end
  end
  inherited pnlBody: TPanel
    Width = 448
    Height = 223
    inherited PageControl1: TPageControl
      Width = 448
      Height = 223
      inherited tbsBody1: TTabSheet
        inherited GroupBox1: TGroupBox
          Width = 440
          Height = 192
          inherited gridData: TDBGridEh
            Width = 436
            Height = 175
            Columns = <
              item
                EditButtons = <>
                FieldName = 'PlantCode1'
                Footers = <>
                Title.Caption = 'Plant Code'
                Width = 84
              end
              item
                EditButtons = <>
                FieldName = 'ProductFamilyName1'
                Footers = <>
                Title.Caption = 'Product Family Name'
                Width = 142
              end
              item
                EditButtons = <>
                FieldName = 'ProductSeriesName1'
                Footers = <>
                Title.Caption = 'Product Series Name'
                Width = 148
              end>
          end
        end
      end
    end
  end
  inherited PnlTop: TPanel
    Width = 448
    inherited CoolBar1: TCoolBar
      Width = 448
      Bands = <
        item
          Control = ToolBar1
          ImageIndex = -1
          Width = 448
        end>
      inherited ToolBar1: TToolBar
        Width = 435
        inherited DBNavigator1: TDBNavigator
          Hints.Strings = ()
        end
      end
    end
  end
  inherited ds_active: TDataSource
    Left = 146
    Top = 83
  end
  inherited adt_active: TADODataSet
    BeforePost = adt_activeBeforePost
    CommandText = 'select * from ViewPlantModel'
    Left = 106
    Top = 82
    object adt_activePlantModelID: TAutoIncField
      FieldName = 'PlantModelID'
      ReadOnly = True
    end
    object adt_activePlantID: TIntegerField
      FieldName = 'PlantID'
    end
    object adt_activeModelID: TIntegerField
      FieldName = 'ModelID'
    end
    object adt_activeProductSeriesID: TIntegerField
      FieldName = 'ProductSeriesID'
    end
    object adt_activeProductFamilyID: TIntegerField
      FieldName = 'ProductFamilyID'
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
    object adt_activePlantCode1: TStringField
      FieldKind = fkLookup
      FieldName = 'PlantCode1'
      LookupDataSet = adt_plant
      LookupKeyFields = 'PlantID'
      LookupResultField = 'PlantCode'
      KeyFields = 'PlantID'
      Size = 10
      Lookup = True
    end
    object adt_activeProductFamilyName1: TStringField
      FieldKind = fkLookup
      FieldName = 'ProductFamilyName1'
      LookupDataSet = adt_family
      LookupKeyFields = 'ProductFamilyID'
      LookupResultField = 'ProductFamilyName'
      KeyFields = 'ProductFamilyID'
      Lookup = True
    end
    object adt_activeProductSeriesName1: TStringField
      FieldKind = fkLookup
      FieldName = 'ProductSeriesName1'
      LookupDataSet = adt_series
      LookupKeyFields = 'ProductSeriesID'
      LookupResultField = 'ProductSeriesName'
      KeyFields = 'ProductSeriesID'
      Lookup = True
    end
  end
  object ds_family: TDataSource
    DataSet = adt_family
    Left = 384
    Top = 17
  end
  object adt_family: TADODataSet
    CommandText = 'select * from ProductFamily'
    Parameters = <>
    Left = 346
    Top = 17
  end
  object ds_series: TDataSource
    DataSet = adt_series
    Left = 304
    Top = 17
  end
  object adt_series: TADODataSet
    CommandText = 'select * from ProductSeries'
    Parameters = <>
    Left = 266
    Top = 17
  end
  object ds_plant: TDataSource
    DataSet = adt_plant
    Left = 208
    Top = 17
  end
  object adt_plant: TADODataSet
    CommandText = 'select * from Plant'
    Parameters = <>
    Left = 170
    Top = 17
  end
end
