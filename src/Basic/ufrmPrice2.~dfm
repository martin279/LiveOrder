inherited frmPrice2: TfrmPrice2
  Caption = 'frmPrice2'
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
    inherited GroupBox1: TGroupBox
      inherited gridData: TDBGridEh
        OnDblClick = gridDataDblClick
        Columns = <
          item
            EditButtons = <>
            FieldName = 'PriceID'
            Footers = <>
            Title.Caption = 'ID'
            Width = 38
          end
          item
            EditButtons = <>
            FieldName = 'PriceStatesName'
            Footers = <>
            Title.Caption = 'Price States'
            Width = 77
          end
          item
            EditButtons = <>
            FieldName = 'CustomerNumber'
            Footers = <>
            Title.Caption = 'Customer No.'
            Width = 69
          end
          item
            DropDownBox.Options = [dlgColumnResizeEh, dlgColLinesEh]
            DropDownBox.UseMultiTitle = True
            DropDownRows = 14
            DropDownShowTitles = True
            DropDownSizing = True
            DropDownWidth = -1
            EditButtons = <>
            FieldName = 'CustomerName1'
            Footers = <>
            LookupDisplayFields = 'CustomerName;ChineseName;CustomerNumber'
            Title.Caption = 'Customer Name'
            Width = 169
          end
          item
            EditButtons = <>
            FieldName = 'Model1'
            Footers = <>
            Title.Caption = 'Model'
            Width = 143
          end
          item
            EditButtons = <>
            FieldName = 'DemandQuantity'
            Footers = <>
            Title.Caption = 'Demand Qty.'
            Width = 49
          end
          item
            EditButtons = <>
            FieldName = 'Currency'
            Footers = <>
            PickList.Strings = (
              'RMB'
              'USD')
            Width = 51
          end
          item
            EditButtons = <>
            FieldName = 'Price'
            Footers = <>
            Width = 52
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
            FieldName = 'Remark'
            Footers = <>
            Width = 100
          end
          item
            EditButtons = <>
            FieldName = 'DisplayName'
            Footers = <>
            Title.Caption = 'Creator'
            Width = 84
          end
          item
            DisplayFormat = 'YYYY-mm-dd hh:mm'
            EditButtons = <>
            FieldName = 'CreateTime'
            Footers = <>
            Title.Caption = 'Create Time'
            Width = 100
          end>
      end
    end
  end
  inherited PropStorageEh1: TPropStorageEh
    Left = 410
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
    BeforePost = adt_activeBeforePost
    BeforeDelete = adt_activeBeforeDelete
    object adt_activePriceID: TAutoIncField
      FieldName = 'PriceID'
      ReadOnly = True
    end
    object adt_activeCustomerID: TIntegerField
      FieldName = 'CustomerID'
    end
    object adt_activeModelID: TIntegerField
      FieldName = 'ModelID'
    end
    object adt_activeCurrency: TStringField
      FieldName = 'Currency'
      Size = 10
    end
    object adt_activePrice: TBCDField
      FieldName = 'Price'
      Precision = 18
      Size = 2
    end
    object adt_activeDemandQuantity: TIntegerField
      FieldName = 'DemandQuantity'
    end
    object adt_activePaymentTerms: TStringField
      FieldName = 'PaymentTerms'
      Size = 30
    end
    object adt_activePriceterm: TStringField
      FieldName = 'PriceTerms'
      Size = 30
    end
    object adt_activeEffectDate: TDateTimeField
      FieldName = 'EffectDate'
    end
    object adt_activeRemark: TStringField
      FieldName = 'Remark'
      Size = 30
    end
    object adt_activeCustomerNumber: TStringField
      FieldName = 'CustomerNumber'
      Size = 4
    end
    object adt_activeCustomerName: TStringField
      FieldName = 'CustomerName'
      Size = 30
    end
    object adt_activeModel: TStringField
      FieldName = 'Model'
      Size = 25
    end
    object adt_activeCustomerName1: TStringField
      FieldKind = fkLookup
      FieldName = 'CustomerName1'
      LookupDataSet = adt_customer
      LookupKeyFields = 'CustomerID'
      LookupResultField = 'CustomerName'
      KeyFields = 'CustomerID'
      Size = 40
      Lookup = True
    end
    object adt_activeModel1: TStringField
      FieldKind = fkLookup
      FieldName = 'Model1'
      LookupDataSet = adt_model
      LookupKeyFields = 'ModelID'
      LookupResultField = 'Model'
      KeyFields = 'ModelID'
      Size = 25
      Lookup = True
    end
    object adt_activePriceStatesID: TIntegerField
      FieldName = 'PriceStatesID'
    end
    object adt_activePriceStatesName: TStringField
      FieldName = 'PriceStatesName'
      Size = 15
    end
    object adt_activeCreatorLoginID: TIntegerField
      FieldName = 'CreatorLoginID'
    end
    object adt_activeCreateTime: TDateTimeField
      FieldName = 'CreateTime'
    end
    object adt_activeDisplayName: TStringField
      FieldName = 'DisplayName'
    end
  end
  object adt_customer: TADODataSet
    Parameters = <>
    Left = 216
    Top = 8
  end
  object adt_model: TADODataSet
    Parameters = <>
    Left = 266
    Top = 9
  end
end
