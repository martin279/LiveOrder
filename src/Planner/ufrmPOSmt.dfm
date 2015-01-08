inherited frmPOSmt: TfrmPOSmt
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
                FieldName = 'PurchaseOrderID'
                Footers = <>
                Title.Caption = 'ID'
                Width = 41
              end
              item
                EditButtons = <>
                FieldName = 'PurchaseOrderNumber'
                Footers = <>
                Title.Caption = 'PO No.'
                Width = 53
              end
              item
                EditButtons = <>
                FieldName = 'ComponentItem2'
                Footers = <>
                Title.Caption = 'Part No.'
                Width = 92
              end
              item
                EditButtons = <>
                FieldName = 'PurchaseOrderQuantity'
                Footers = <>
                Title.Caption = 'PO Qty.'
              end
              item
                DisplayFormat = 'YYYY-mm-dd hh:00:00'
                EditButtons = <>
                FieldName = 'RTA'
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
    BeforePost = adt_activeBeforePost
    object adt_activePurchaseOrderID: TAutoIncField
      FieldName = 'PurchaseOrderID'
      ReadOnly = True
    end
    object adt_activePurchaseOrderNumber: TStringField
      FieldName = 'PurchaseOrderNumber'
      Size = 7
    end
    object adt_activeVendorID: TIntegerField
      FieldName = 'VendorID'
    end
    object adt_activeComponentID: TIntegerField
      FieldName = 'ComponentID'
    end
    object adt_activePurchaseOrderQuantity: TIntegerField
      FieldName = 'PurchaseOrderQuantity'
    end
    object adt_activeRTA: TDateTimeField
      FieldName = 'RTA'
    end
    object adt_activeConfirmedPurchaseOrderQuantity: TIntegerField
      FieldName = 'ConfirmedPurchaseOrderQuantity'
    end
    object adt_activeETA: TDateTimeField
      FieldName = 'ETA'
    end
    object adt_activeConfirmedPurchaseOrderComments: TStringField
      FieldName = 'ConfirmedPurchaseOrderComments'
      Size = 40
    end
    object adt_activeActualReceiptsQuantity: TIntegerField
      FieldName = 'ActualReceiptsQuantity'
    end
    object adt_activeATA: TDateTimeField
      FieldName = 'ATA'
    end
    object adt_activePurchaseOrderStatesID: TIntegerField
      FieldName = 'PurchaseOrderStatesID'
    end
    object adt_activeComponentItem: TStringField
      FieldName = 'ComponentItem'
      Size = 11
    end
    object adt_activePurchaseOrderStatesName: TStringField
      FieldName = 'PurchaseOrderStatesName'
      Size = 15
    end
    object adt_activeVendorNumber: TStringField
      FieldName = 'VendorNumber'
      Size = 10
    end
    object adt_activeVendorName: TStringField
      FieldName = 'VendorName'
      Size = 30
    end
    object adt_activeComponentItem2: TStringField
      FieldKind = fkLookup
      FieldName = 'ComponentItem2'
      LookupDataSet = adt_component
      LookupKeyFields = 'ComponentID'
      LookupResultField = 'ComponentItem'
      KeyFields = 'ComponentID'
      Size = 11
      Lookup = True
    end
    object adt_activeRTD: TDateTimeField
      FieldName = 'RTD'
    end
    object adt_activeETD: TDateTimeField
      FieldName = 'ETD'
    end
    object adt_activePOGenerateTime: TDateTimeField
      FieldName = 'POGenerateTime'
    end
  end
  object adt_component: TADODataSet
    Parameters = <>
    Left = 194
    Top = 17
    object adt_componentComponentID: TAutoIncField
      FieldName = 'ComponentID'
      ReadOnly = True
    end
    object adt_componentComponentItem: TStringField
      FieldName = 'ComponentItem'
      Size = 11
    end
    object adt_componentComponentDescription: TStringField
      FieldName = 'ComponentDescription'
      Size = 30
    end
    object adt_componentCalculatedPhysicalInventory: TFloatField
      FieldName = 'CalculatedPhysicalInventory'
    end
    object adt_componentPhysicalInventoryCount: TFloatField
      FieldName = 'PhysicalInventoryCount'
    end
    object adt_componentPhysicalInventoryDate: TDateTimeField
      FieldName = 'PhysicalInventoryDate'
    end
    object adt_componentStartPointConsumption: TFloatField
      FieldName = 'StartPointConsumption'
    end
    object adt_componentStartPointConsumptionDate: TDateTimeField
      FieldName = 'StartPointConsumptionDate'
    end
    object adt_componentStartPointPurchaseOrders: TFloatField
      FieldName = 'StartPointPurchaseOrders'
    end
    object adt_componentStartPointPurchaseOrdersDate: TDateTimeField
      FieldName = 'StartPointPurchaseOrdersDate'
    end
    object adt_componentCurrentInventoryCount: TFloatField
      FieldName = 'CurrentInventoryCount'
    end
    object adt_componentCurrentInventoryDate: TDateTimeField
      FieldName = 'CurrentInventoryDate'
    end
    object adt_componentLoginID: TIntegerField
      FieldName = 'LoginID'
    end
    object adt_componentMinimumLevel: TFloatField
      FieldName = 'MinimumLevel'
    end
    object adt_componentMaximumLevel: TFloatField
      FieldName = 'MaximumLevel'
    end
    object adt_componentPackageQuantity: TIntegerField
      FieldName = 'PackageQuantity'
    end
    object adt_componentManufacturingItemID: TIntegerField
      FieldName = 'ManufacturingItemID'
    end
    object adt_componentManufacturingItemDays: TIntegerField
      FieldName = 'ManufacturingItemDays'
    end
    object adt_componentRequiredItemID: TIntegerField
      FieldName = 'RequiredItemID'
    end
    object adt_componentRequiredItemDays: TIntegerField
      FieldName = 'RequiredItemDays'
    end
    object adt_componentLedgerID: TIntegerField
      FieldName = 'LedgerID'
    end
    object adt_componentWarehouseScheduledComponent: TBooleanField
      FieldName = 'WarehouseScheduledComponent'
    end
    object adt_componentLeadTime: TIntegerField
      FieldName = 'LeadTime'
    end
    object adt_componentConsignment: TBooleanField
      FieldName = 'Consignment'
    end
    object adt_componentStandardCost: TFloatField
      FieldName = 'StandardCost'
    end
    object adt_componentStandardCostDate: TDateTimeField
      FieldName = 'StandardCostDate'
    end
    object adt_componentFinanceInventoryCount: TFloatField
      FieldName = 'FinanceInventoryCount'
    end
  end
end
