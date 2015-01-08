inherited frmComponent: TfrmComponent
  Left = 636
  Top = 166
  Caption = 'frmComponent'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBottom: TPanel
    object btnUpdate: TButton
      Left = 48
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Update Inv.'
      TabOrder = 0
      OnClick = btnUpdateClick
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
                FieldName = 'ComponentID'
                Footers = <>
                Title.Caption = 'ID'
                Width = 44
              end
              item
                EditButtons = <>
                FieldName = 'ComponentItem'
                Footers = <>
                Title.Caption = 'Part No.'
              end
              item
                EditButtons = <>
                FieldName = 'ComponentSeriesName2'
                Footers = <>
                Title.Caption = 'Component Series Name'
                Width = 100
              end
              item
                EditButtons = <>
                FieldName = 'ComponentDescription'
                Footers = <>
                Title.Caption = 'Component Desc.'
                Width = 138
              end
              item
                EditButtons = <>
                FieldName = 'PhysicalInventoryCount'
                Footers = <>
                Title.Caption = 'Physical Inv. Qty.'
              end
              item
                EditButtons = <>
                FieldName = 'PhysicalInventoryDate'
                Footers = <>
                Title.Caption = 'Physical Inv. Date'
              end
              item
                EditButtons = <>
                FieldName = 'CurrentInventoryCount'
                Footers = <>
                Title.Caption = 'Current Inv. Qty.'
              end
              item
                EditButtons = <>
                FieldName = 'CurrentInventoryDate'
                Footers = <>
                Title.Caption = 'Current Inv. Date'
              end
              item
                EditButtons = <>
                FieldName = 'StartPointConsumption'
                Footers = <>
                Title.Caption = 'Actual Consumption Qty.'
              end
              item
                EditButtons = <>
                FieldName = 'StartPointConsumptionDate'
                Footers = <>
                Title.Caption = 'Actual Consumption Date'
              end
              item
                EditButtons = <>
                FieldName = 'StartPointPurchaseOrders'
                Footers = <>
                Title.Caption = 'Actual Receipt Qty.'
              end
              item
                EditButtons = <>
                FieldName = 'StartPointPurchaseOrdersDate'
                Footers = <>
                Title.Caption = 'Actual Receipt Date'
              end
              item
                EditButtons = <>
                FieldName = 'MinimumLevel'
                Footers = <>
                Title.Caption = 'Minimum Level'
              end
              item
                EditButtons = <>
                FieldName = 'PackageQuantity'
                Footers = <>
                Title.Caption = 'Package Qty.'
              end
              item
                EditButtons = <>
                FieldName = 'PackageWeightUnit'
                Footers = <>
                Title.Caption = 'Package Weight Unit'
                Width = 50
              end
              item
                EditButtons = <>
                FieldName = 'PackageWeight'
                Footers = <>
                Title.Caption = 'Package Weight'
              end
              item
                EditButtons = <>
                FieldName = 'PackageSizeUnit'
                Footers = <>
                Title.Caption = 'Package Size Unit'
                Width = 49
              end
              item
                EditButtons = <>
                FieldName = 'PackageSize'
                Footers = <>
                Title.Caption = 'Package Size'
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
  inherited PopupMenu1: TPopupMenu
    object N2: TMenuItem
      Caption = '-'
    end
    object MenuReset: TMenuItem
      Caption = 'Reset Consumption && Receipt'
      OnClick = MenuResetClick
    end
  end
  inherited adt_active: TADODataSet
    BeforePost = adt_activeBeforePost
    object adt_activeComponentID: TAutoIncField
      FieldName = 'ComponentID'
      ReadOnly = True
    end
    object adt_activeComponentItem: TStringField
      DisplayWidth = 30
      FieldName = 'ComponentItem'
      Size = 30
    end
    object adt_activeComponentDescription: TStringField
      FieldName = 'ComponentDescription'
      Size = 30
    end
    object adt_activeCalculatedPhysicalInventory: TFloatField
      FieldName = 'CalculatedPhysicalInventory'
    end
    object adt_activePhysicalInventoryCount: TFloatField
      FieldName = 'PhysicalInventoryCount'
    end
    object adt_activePhysicalInventoryDate: TDateTimeField
      FieldName = 'PhysicalInventoryDate'
    end
    object adt_activeStartPointConsumption: TFloatField
      FieldName = 'StartPointConsumption'
    end
    object adt_activeStartPointConsumptionDate: TDateTimeField
      FieldName = 'StartPointConsumptionDate'
    end
    object adt_activeStartPointPurchaseOrders: TFloatField
      FieldName = 'StartPointPurchaseOrders'
    end
    object adt_activeStartPointPurchaseOrdersDate: TDateTimeField
      FieldName = 'StartPointPurchaseOrdersDate'
    end
    object adt_activeCurrentInventoryCount: TFloatField
      FieldName = 'CurrentInventoryCount'
    end
    object adt_activeCurrentInventoryDate: TDateTimeField
      FieldName = 'CurrentInventoryDate'
    end
    object adt_activeLoginID: TIntegerField
      FieldName = 'LoginID'
    end
    object adt_activeMinimumLevel: TFloatField
      FieldName = 'MinimumLevel'
    end
    object adt_activeMaximumLevel: TFloatField
      FieldName = 'MaximumLevel'
    end
    object adt_activePackageQuantity: TIntegerField
      FieldName = 'PackageQuantity'
    end
    object adt_activeManufacturingItemID: TIntegerField
      FieldName = 'ManufacturingItemID'
    end
    object adt_activeManufacturingItemDays: TIntegerField
      FieldName = 'ManufacturingItemDays'
    end
    object adt_activeRequiredItemID: TIntegerField
      FieldName = 'RequiredItemID'
    end
    object adt_activeRequiredItemDays: TIntegerField
      FieldName = 'RequiredItemDays'
    end
    object adt_activeLedgerID: TIntegerField
      FieldName = 'LedgerID'
    end
    object adt_activeWarehouseScheduledComponent: TBooleanField
      FieldName = 'WarehouseScheduledComponent'
    end
    object adt_activeLeadTime: TIntegerField
      FieldName = 'LeadTime'
    end
    object adt_activeConsignment: TBooleanField
      FieldName = 'Consignment'
    end
    object adt_activeStandardCost: TFloatField
      FieldName = 'StandardCost'
    end
    object adt_activeStandardCostDate: TDateTimeField
      FieldName = 'StandardCostDate'
    end
    object adt_activeFinanceInventoryCount: TFloatField
      FieldName = 'FinanceInventoryCount'
    end
    object adt_activePackageWeightUnit: TStringField
      FieldName = 'PackageWeightUnit'
      Size = 5
    end
    object adt_activePackageWeight: TFloatField
      FieldName = 'PackageWeight'
    end
    object adt_activePackageSizeUnit: TStringField
      FieldName = 'PackageSizeUnit'
      Size = 5
    end
    object adt_activePackageSize: TFloatField
      FieldName = 'PackageSize'
    end
    object adt_activeComponentSeriesName: TStringField
      FieldName = 'ComponentSeriesName'
      Size = 30
    end
    object adt_activeComponentSeriesID: TIntegerField
      FieldName = 'ComponentSeriesID'
    end
    object adt_activeRemark: TStringField
      FieldName = 'Remark'
      Size = 50
    end
    object adt_activeCreateTime: TDateTimeField
      FieldName = 'CreateTime'
    end
    object adt_activePlantID: TAutoIncField
      FieldName = 'PlantID'
      ReadOnly = True
    end
    object adt_activePlantCode: TStringField
      FieldName = 'PlantCode'
      Size = 15
    end
    object adt_activeComponentSeriesName2: TStringField
      FieldKind = fkLookup
      FieldName = 'ComponentSeriesName2'
      LookupDataSet = adt_ComponetSeries
      LookupKeyFields = 'ComponentSeriesID'
      LookupResultField = 'ComponentSeriesName'
      KeyFields = 'ComponentSeriesID'
      Size = 30
      Lookup = True
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
  object adt_ComponetSeries: TADODataSet
    Parameters = <>
    Left = 209
    Top = 8
    object adt_ComponetSeriesComponentSeriesID: TAutoIncField
      FieldName = 'ComponentSeriesID'
      ReadOnly = True
    end
    object adt_ComponetSeriesComponentSeriesName: TStringField
      FieldName = 'ComponentSeriesName'
      Size = 30
    end
    object adt_ComponetSeriesPlantID: TIntegerField
      FieldName = 'PlantID'
    end
    object adt_ComponetSeriesPlantCode: TStringField
      FieldName = 'PlantCode'
      Size = 15
    end
  end
end
