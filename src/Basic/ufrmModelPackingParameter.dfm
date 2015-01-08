inherited frmModelPackingParameter: TfrmModelPackingParameter
  Caption = 'frmModelPackingParameter'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlTop: TPanel
    inherited CoolBar1: TCoolBar
      inherited ToolBar1: TToolBar
        inherited DBNavigator1: TDBNavigator
          Hints.Strings = ()
        end
      end
    end
  end
  inherited pnlBody: TPanel
    inherited PageControl1: TPageControl
      inherited tbsBody1: TTabSheet
        inherited GroupBox1: TGroupBox
          inherited gridData: TDBGridEh
            Columns = <
              item
                EditButtons = <>
                FieldName = 'Model1'
                Footers = <>
                Title.Caption = 'Model'
              end
              item
                EditButtons = <>
                FieldName = 'Quantity'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'NetWeightPerPCS'
                Footers = <>
                Width = 132
              end
              item
                EditButtons = <>
                FieldName = 'GrossWeight'
                Footers = <>
                Width = 123
              end
              item
                EditButtons = <>
                FieldName = 'Dimensions'
                Footers = <>
              end>
          end
        end
      end
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
  inherited adt_active: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    CommandText = 
      'select p.*,m.Model from ModelPackingParameter p'#13#10'left outer join' +
      ' Model m on p.ModelID=m.ModelID'
    object adt_activeModelID: TIntegerField
      FieldName = 'ModelID'
    end
    object adt_activeNetWeightPerPCS: TFloatField
      FieldName = 'NetWeightPerPCS'
    end
    object adt_activeGrossWeight: TFloatField
      FieldName = 'GrossWeight'
    end
    object adt_activeDimensions: TStringField
      FieldName = 'Dimensions'
      Size = 50
    end
    object adt_activeModel: TStringField
      FieldName = 'Model'
      Size = 25
    end
    object adt_activeModel1: TStringField
      FieldKind = fkLookup
      FieldName = 'Model1'
      LookupDataSet = adt_model
      LookupKeyFields = 'ModelID'
      LookupResultField = 'Model'
      KeyFields = 'ModelID'
      Size = 30
      Lookup = True
    end
    object adt_activeQuantity: TIntegerField
      FieldName = 'Quantity'
    end
  end
  object adt_model: TADODataSet
    Active = True
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    AfterPost = adt_activeAfterPost
    AfterDelete = adt_activeAfterDelete
    OnDeleteError = adt_activeDeleteError
    OnEditError = adt_activeEditError
    OnPostError = adt_activePostError
    CommandText = 'select * from Model'
    Parameters = <>
    Left = 186
    Top = 10
    object adt_modelModelID: TAutoIncField
      FieldName = 'ModelID'
      ReadOnly = True
    end
    object adt_modelModel: TStringField
      FieldName = 'Model'
      Size = 25
    end
    object adt_modelModelDescription: TStringField
      FieldName = 'ModelDescription'
      Size = 80
    end
    object adt_modelXRef: TStringField
      FieldName = 'XRef'
      Size = 3
    end
    object adt_modelBaseShortHandCode: TStringField
      FieldName = 'BaseShortHandCode'
      Size = 3
    end
    object adt_modelProductionFactor: TFloatField
      FieldName = 'ProductionFactor'
    end
    object adt_modelSchedulingCode: TStringField
      FieldName = 'SchedulingCode'
    end
    object adt_modelBaseSE: TStringField
      FieldName = 'BaseSE'
      Size = 3
    end
    object adt_modelProductSeriesID: TIntegerField
      FieldName = 'ProductSeriesID'
    end
    object adt_modelIsValid: TBooleanField
      FieldName = 'IsValid'
    end
    object adt_modelcatalogue: TStringField
      FieldName = 'catalogue'
    end
  end
  object ds_model: TDataSource
    DataSet = adt_model
    Left = 226
    Top = 8
  end
end
