inherited frmMFModel: TfrmMFModel
  Caption = 'frmMFModel'
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
  inherited pnlBottom: TPanel
    Top = 404
    Height = 38
    object Label1: TLabel
      Left = 18
      Top = 11
      Width = 29
      Height = 13
      Caption = 'Model'
    end
    object Label2: TLabel
      Left = 235
      Top = 12
      Width = 81
      Height = 13
      Caption = 'Mainframe Model'
    end
    object dbcbbModel: TDBLookupComboboxEh
      Left = 55
      Top = 7
      Width = 165
      Height = 21
      EditButtons = <>
      KeyField = 'ModelID'
      ListField = 'Model'
      ListSource = ds_model
      TabOrder = 0
      Visible = True
    end
    object edtMFModel: TEdit
      Left = 322
      Top = 7
      Width = 159
      Height = 21
      TabOrder = 1
    end
    object btnSave: TButton
      Left = 512
      Top = 4
      Width = 57
      Height = 25
      Caption = 'Save'
      TabOrder = 2
      OnClick = btnSaveClick
    end
  end
  inherited pnlBody: TPanel
    Height = 379
    inherited PageControl1: TPageControl
      Height = 379
      inherited tbsBody1: TTabSheet
        inherited GroupBox1: TGroupBox
          Height = 348
          inherited PreviewBox1: TPreviewBox
            Top = 257
          end
          inherited gridData: TDBGridEh
            Height = 201
            Columns = <
              item
                EditButtons = <>
                FieldName = 'MainframeModelID'
                Footers = <>
                Title.Caption = 'ID'
                Width = 40
              end
              item
                EditButtons = <>
                FieldName = 'ModelID'
                Footers = <>
                Visible = False
              end
              item
                EditButtons = <>
                FieldName = 'Model2'
                Footers = <>
                Title.Caption = 'Model'
              end
              item
                EditButtons = <>
                FieldName = 'MainframeModel'
                Footers = <>
                Title.Caption = 'Mainframe Model'
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
    CommandText = 
      'select l.*,m.Model from MainframeModel l '#13#10'left outer join model' +
      ' m on l.modelid=m.modelid'
    object adt_activeMainframeModelID: TAutoIncField
      FieldName = 'MainframeModelID'
      ReadOnly = True
    end
    object adt_activeModelID: TIntegerField
      FieldName = 'ModelID'
    end
    object adt_activeMainframeModel: TStringField
      FieldName = 'MainframeModel'
      Size = 30
    end
    object adt_activeModel: TStringField
      FieldName = 'Model'
      Size = 25
    end
    object adt_activeModel2: TStringField
      FieldKind = fkLookup
      FieldName = 'Model2'
      LookupDataSet = adt_model
      LookupKeyFields = 'ModelID'
      LookupResultField = 'Model'
      KeyFields = 'ModelID'
      Size = 30
      Lookup = True
    end
  end
  object adt_model: TADODataSet
    Connection = DM.ADOConnection1
    CommandText = 'select * from Model'
    Parameters = <>
    Left = 185
    Top = 8
  end
  object ds_model: TDataSource
    DataSet = adt_model
    Left = 217
    Top = 8
  end
end
