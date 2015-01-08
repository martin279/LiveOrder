inherited frmVendorComponent: TfrmVendorComponent
  Left = 277
  Top = 198
  Caption = 'Vendor Component'
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
            OnCellClick = gridDataCellClick
            Columns = <
              item
                EditButtons = <>
                FieldName = 'ComponentID'
                Footers = <>
                Title.Caption = 'ID'
                Width = 45
              end
              item
                EditButtons = <>
                FieldName = 'ComponentItem'
                Footers = <>
                Title.Caption = 'Part No.'
                Width = 101
              end
              item
                EditButtons = <>
                FieldName = 'ComponentDescription'
                Footers = <>
                Title.Caption = 'Component Desc.'
                Width = 129
              end
              item
                EditButtons = <>
                FieldName = 'PhysicalInventoryCount'
                Footers = <>
                Title.Caption = 'Physical Inv. Qty.'
                Width = 58
              end
              item
                EditButtons = <>
                FieldName = 'PhysicalInventoryDate'
                Footers = <>
                Title.Caption = 'Physical Inv. Date'
                Width = 94
              end
              item
                EditButtons = <>
                FieldName = 'CurrentInventoryCount'
                Footers = <>
                Title.Caption = 'Current Inv. Qty.'
                Width = 48
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
                Width = 108
              end
              item
                EditButtons = <>
                FieldName = 'MinimumLevel'
                Footers = <>
                Title.Caption = 'Minimum Level'
                Width = 46
              end
              item
                EditButtons = <>
                FieldName = 'PackageQuantity'
                Footers = <>
                Title.Caption = 'Package Qty.'
                Width = 48
              end
              item
                EditButtons = <>
                FieldName = 'PackageWeightUnit'
                Footers = <>
                Title.Caption = 'Package Weight Unit'
                Width = 64
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
                Width = 48
              end
              item
                EditButtons = <>
                FieldName = 'PackageSize'
                Footers = <>
                Title.Caption = 'Package Size'
                Width = 62
              end
              item
                EditButtons = <>
                FieldName = 'ComponentSeriesName2'
                Footers = <>
                Title.Caption = 'Component Series Name'
                Width = 67
              end>
          end
        end
      end
    end
    inherited GroupBox2: TGroupBox
      inherited gridData2: TDBGridEh
        Columns = <
          item
            EditButtons = <>
            FieldName = 'VendorNumber'
            Footers = <>
            Title.Caption = 'Vendor No.'
          end
          item
            EditButtons = <>
            FieldName = 'VendorName'
            Footers = <>
            Title.Caption = 'Vendor Name'
          end
          item
            EditButtons = <>
            FieldName = 'ComponentItem'
            Footers = <>
            Title.Caption = 'Part No.'
          end
          item
            EditButtons = <>
            FieldName = 'Percentage'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'PurchaseOrderNumber'
            Footers = <>
            Title.Caption = 'PO No.'
          end>
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
    object adt_activeadt_activeComponentSeriesName2: TStringField
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
  inherited adt_active2: TADODataSet
    object adt_active2ComponentID: TIntegerField
      FieldName = 'ComponentID'
    end
    object adt_active2VendorID: TIntegerField
      FieldName = 'VendorID'
    end
    object adt_active2Percentage: TFloatField
      FieldName = 'Percentage'
    end
    object adt_active2PurchaseOrderNumber: TStringField
      FieldName = 'PurchaseOrderNumber'
      Size = 10
    end
    object adt_active2ComponentItem: TStringField
      FieldName = 'ComponentItem'
      Size = 30
    end
    object adt_active2VendorNumber: TStringField
      FieldName = 'VendorNumber'
      Size = 10
    end
    object adt_active2VendorName: TStringField
      FieldName = 'VendorName'
      Size = 30
    end
  end
  object adt_ComponetSeries: TADODataSet
    Parameters = <>
    Left = 257
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
