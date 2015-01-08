inherited frmPrtCUDParameterLog: TfrmPrtCUDParameterLog
  Left = 567
  Top = 279
  Width = 1022
  Height = 585
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlTop: TPanel
    Width = 1006
    inherited CoolBar1: TCoolBar
      Width = 1006
      Bands = <
        item
          Control = ToolBar1
          ImageIndex = -1
          Width = 1006
        end>
      inherited ToolBar1: TToolBar
        Width = 993
        inherited DBNavigator1: TDBNavigator
          Hints.Strings = ()
        end
      end
    end
  end
  inherited pnlBottom: TPanel
    Top = 506
    Width = 1006
  end
  inherited pnlBody: TPanel
    Width = 1006
    Height = 481
    inherited PageControl1: TPageControl
      Width = 1006
      Height = 481
      inherited tbsBody1: TTabSheet
        inherited GroupBox1: TGroupBox
          Width = 998
          Height = 450
          inherited PreviewSetupPanel: TPanel
            Width = 994
          end
          inherited PreviewBox1: TPreviewBox
            Top = 359
            Width = 994
          end
          inherited gridData: TDBGridEh
            Width = 994
            Height = 303
            Columns = <
              item
                EditButtons = <>
                FieldName = 'LogID'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'ProductSerialNumber'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'Model'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'ProductDate'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'Voltage'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'Ph'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'Hz'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'Fan'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'EvaporatingTempRange'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'L_R_A'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'R_L_A'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'Capacity'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'Power'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'COP'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'RatingCondition'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'low_pressure'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'high_pressure'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'oil'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'Refrigerant'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'ProductWeight'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'update_time'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'update_by'
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
    CommandText = 'select * from PrintCUDParameterLog'
    object adt_activeLogID: TAutoIncField
      FieldName = 'LogID'
      ReadOnly = True
    end
    object adt_activeProductSerialNumber: TStringField
      FieldName = 'ProductSerialNumber'
      Size = 15
    end
    object adt_activeModel: TStringField
      FieldName = 'Model'
    end
    object adt_activeProductDate: TDateTimeField
      FieldName = 'ProductDate'
    end
    object adt_activeVoltage: TStringField
      FieldName = 'Voltage'
      Size = 10
    end
    object adt_activePh: TStringField
      FieldName = 'Ph'
      Size = 10
    end
    object adt_activeHz: TStringField
      FieldName = 'Hz'
      Size = 10
    end
    object adt_activeFan: TStringField
      FieldName = 'Fan'
      Size = 50
    end
    object adt_activeEvaporatingTempRange: TStringField
      FieldName = 'EvaporatingTempRange'
      Size = 50
    end
    object adt_activeL_R_A: TStringField
      FieldName = 'L_R_A'
      Size = 10
    end
    object adt_activeR_L_A: TStringField
      FieldName = 'R_L_A'
      Size = 10
    end
    object adt_activeCapacity: TStringField
      FieldName = 'Capacity'
    end
    object adt_activePower: TStringField
      FieldName = 'Power'
      Size = 50
    end
    object adt_activeCOP: TStringField
      FieldName = 'COP'
      Size = 10
    end
    object adt_activeRatingCondition: TStringField
      FieldName = 'RatingCondition'
      Size = 50
    end
    object adt_activelow_pressure: TStringField
      FieldName = 'low_pressure'
      Size = 10
    end
    object adt_activehigh_pressure: TStringField
      FieldName = 'high_pressure'
      Size = 10
    end
    object adt_activeoil: TStringField
      FieldName = 'oil'
      Size = 15
    end
    object adt_activeRefrigerant: TStringField
      FieldName = 'Refrigerant'
      Size = 10
    end
    object adt_activeProductWeight: TFloatField
      FieldName = 'ProductWeight'
    end
    object adt_activeupdate_time: TDateTimeField
      FieldName = 'update_time'
    end
    object adt_activeupdate_by: TStringField
      FieldName = 'update_by'
      Size = 10
    end
  end
end
