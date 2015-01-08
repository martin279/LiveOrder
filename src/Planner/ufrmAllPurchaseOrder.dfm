inherited frmAllPurchaseOrder: TfrmAllPurchaseOrder
  Width = 760
  Caption = ''
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlTop: TPanel
    Width = 752
    inherited CoolBar1: TCoolBar
      Width = 752
      Bands = <
        item
          Control = ToolBar1
          ImageIndex = -1
          Width = 752
        end>
      inherited ToolBar1: TToolBar
        Width = 739
        inherited DBNavigator1: TDBNavigator
          Hints.Strings = ()
        end
      end
    end
  end
  inherited pnlBottom: TPanel
    Width = 752
  end
  inherited pnlBody: TPanel
    Width = 614
    inherited PageControl1: TPageControl
      Width = 614
      inherited tbsBody1: TTabSheet
        inherited GroupBox1: TGroupBox
          Width = 606
          inherited gridData: TDBGridEh
            Width = 602
            Columns = <
              item
                EditButtons = <>
                FieldName = 'PurchaseOrderID'
                Footers = <>
                Title.Caption = 'ID'
                Width = 47
              end
              item
                EditButtons = <>
                FieldName = 'VendorNumber'
                Footers = <>
                Title.Caption = 'Vendor No.'
              end
              item
                EditButtons = <>
                FieldName = 'ComponentItem'
                Footers = <>
                Title.Caption = 'Part No.'
              end
              item
                EditButtons = <>
                FieldName = 'SR01'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'PurchaseOrderNumber'
                Footers = <>
                Title.Caption = 'PO No.'
              end
              item
                EditButtons = <>
                FieldName = 'DueDate'
                Footers = <>
                Title.Caption = 'RTA'
              end
              item
                EditButtons = <>
                FieldName = 'ComponentQuantity'
                Footers = <>
                Title.Caption = 'Order Qty.'
              end
              item
                EditButtons = <>
                FieldName = 'ConfirmedPurchaseOrderQuantity'
                Footers = <>
                Title.Caption = 'Confirmed PO Qty.'
              end
              item
                EditButtons = <>
                FieldName = 'ETD'
                Footers = <>
                Title.Caption = 'ETA'
              end
              item
                EditButtons = <>
                FieldName = 'ConfirmedPurchaseOrderComment'
                Footers = <>
                Title.Caption = 'Confirmed PO Comment'
              end
              item
                EditButtons = <>
                FieldName = 'SKSF_SupplierInventory'
                Footers = <>
                Title.Caption = 'Supplier Inventory'
              end
              item
                EditButtons = <>
                FieldName = 'SKSF_UpdateDate'
                Footers = <>
                Title.Caption = 'Confirmed Time'
              end>
          end
        end
      end
    end
  end
  inherited adt_active: TADODataSet
    object adt_activeComponentID: TAutoIncField
      FieldName = 'ComponentID'
      ReadOnly = True
    end
    object adt_activeComponentItem: TStringField
      FieldName = 'ComponentItem'
      Size = 11
    end
    object adt_activeSR01: TFloatField
      FieldName = 'SR01'
    end
    object adt_activePurchaseOrderID: TAutoIncField
      FieldName = 'PurchaseOrderID'
      ReadOnly = True
    end
    object adt_activePurchaseOrderNumber: TStringField
      FieldName = 'PurchaseOrderNumber'
      Size = 7
    end
    object adt_activeDueDate: TStringField
      FieldName = 'DueDate'
      ReadOnly = True
      Size = 10
    end
    object adt_activeComponentQuantity: TFloatField
      FieldName = 'ComponentQuantity'
    end
    object adt_activeConfirmedPurchaseOrderQuantity: TFloatField
      FieldName = 'ConfirmedPurchaseOrderQuantity'
    end
    object adt_activeETD: TStringField
      FieldName = 'ETD'
      ReadOnly = True
      Size = 10
    end
    object adt_activeConfirmedPurchaseOrderComment: TStringField
      FieldName = 'ConfirmedPurchaseOrderComment'
      Size = 64
    end
    object adt_activeSKSF_SupplierInventory: TFloatField
      FieldName = 'SKSF_SupplierInventory'
    end
    object adt_activeSKSF_UpdateDate: TDateTimeField
      FieldName = 'SKSF_UpdateDate'
    end
    object adt_activeVendorNumber: TStringField
      FieldName = 'VendorNumber'
      Size = 10
    end
  end
end
