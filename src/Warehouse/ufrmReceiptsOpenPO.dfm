inherited frmReceiptOpenPO: TfrmReceiptOpenPO
  Left = 290
  Top = 173
  Caption = 'frmReceiptOpenPO'
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
                Width = 44
              end
              item
                EditButtons = <>
                FieldName = 'PurchaseOrderNumber'
                Footers = <>
                Title.Caption = 'PO No.'
                Width = 81
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
                Width = 120
              end
              item
                EditButtons = <>
                FieldName = 'PurchaseOrderQuantity'
                Footers = <>
                Title.Caption = 'PO Qty.'
                Width = 42
              end
              item
                EditButtons = <>
                FieldName = 'RTA'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'ConfirmedPurchaseOrderQuantity'
                Footers = <>
                Title.Caption = 'Confirmed Qty.'
                Width = 54
              end
              item
                EditButtons = <>
                FieldName = 'ETA'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'ConfirmedPurchaseOrderComments'
                Footers = <>
                Title.Caption = 'Confirmed Comments'
                Width = 65
              end
              item
                EditButtons = <>
                FieldName = 'ActualReceiptsQuantity'
                Footers = <>
                Title.Caption = 'Actual Receipts Qty.'
                Width = 78
              end
              item
                EditButtons = <>
                FieldName = 'ATA'
                Footers = <>
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
            FieldName = 'PurchaseOrderID'
            Footers = <>
            Title.Caption = 'ID'
            Width = 46
          end
          item
            EditButtons = <>
            FieldName = 'PurchaseOrderNumber'
            Footers = <>
            Title.Caption = 'PO No.'
            Width = 82
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
            Width = 128
          end
          item
            EditButtons = <>
            FieldName = 'PurchaseOrderQuantity'
            Footers = <>
            Title.Caption = 'PO Qty.'
            Width = 48
          end
          item
            EditButtons = <>
            FieldName = 'RTA'
            Footers = <>
            Width = 101
          end
          item
            EditButtons = <>
            FieldName = 'ConfirmedPurchaseOrderQuantity'
            Footers = <>
            Title.Caption = 'Confirmed PO Qty.'
          end
          item
            EditButtons = <>
            FieldName = 'ETA'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'ConfirmedPurchaseOrderComments'
            Footers = <>
            Title.Caption = 'Confirmed Comments'
            Width = 78
          end
          item
            EditButtons = <>
            FieldName = 'ActualReceiptsQuantity'
            Footers = <>
            Title.Caption = 'Actual Receipts Qty.'
            Width = 76
          end
          item
            EditButtons = <>
            FieldName = 'ATA'
            Footers = <>
          end>
      end
    end
  end
  inherited PopupMenu1: TPopupMenu
    object N2: TMenuItem
      Caption = '-'
    end
    object MenuReceipt: TMenuItem
      Caption = 'Receipt'
      OnClick = MenuReceiptClick
    end
    object MenuBack: TMenuItem
      Caption = 'Back'
      OnClick = MenuBackClick
    end
  end
  inherited adt_active: TADODataSet
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
    object adt_activeConfirmedPurchaseOrderQuantity: TIntegerField
      FieldName = 'ConfirmedPurchaseOrderQuantity'
    end
    object adt_activeConfirmedPurchaseOrderComments: TStringField
      FieldName = 'ConfirmedPurchaseOrderComments'
      Size = 40
    end
    object adt_activeActualReceiptsQuantity: TIntegerField
      FieldName = 'ActualReceiptsQuantity'
    end
    object adt_activePurchaseOrderStatesID: TIntegerField
      FieldName = 'PurchaseOrderStatesID'
    end
    object adt_activeIsChanged: TBooleanField
      FieldName = 'IsChanged'
    end
    object adt_activeRTA: TDateTimeField
      FieldName = 'RTA'
    end
    object adt_activeRTD: TDateTimeField
      FieldName = 'RTD'
    end
    object adt_activeETD: TDateTimeField
      FieldName = 'ETD'
    end
    object adt_activeETA: TDateTimeField
      FieldName = 'ETA'
    end
    object adt_activeATA: TDateTimeField
      FieldName = 'ATA'
    end
    object adt_activePOGenerateTime: TDateTimeField
      FieldName = 'POGenerateTime'
    end
    object adt_activePOConfirmedTime: TDateTimeField
      FieldName = 'POConfirmedTime'
    end
    object adt_activeRTAB: TStringField
      FieldName = 'RTAB'
      ReadOnly = True
      Size = 10
    end
    object adt_activeRTDB: TStringField
      FieldName = 'RTDB'
      ReadOnly = True
      Size = 10
    end
    object adt_activeETDB: TStringField
      FieldName = 'ETDB'
      ReadOnly = True
      Size = 10
    end
    object adt_activeETAB: TStringField
      FieldName = 'ETAB'
      ReadOnly = True
      Size = 10
    end
    object adt_activeATAB: TStringField
      FieldName = 'ATAB'
      ReadOnly = True
      Size = 10
    end
    object adt_activePOGenerateTimeB: TStringField
      FieldName = 'POGenerateTimeB'
      ReadOnly = True
      Size = 16
    end
    object adt_activePOConfirmedTimeB: TStringField
      FieldName = 'POConfirmedTimeB'
      ReadOnly = True
      Size = 16
    end
    object adt_activeComponentItem: TStringField
      FieldName = 'ComponentItem'
      Size = 30
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
    object adt_activePackage: TIntegerField
      FieldName = 'Package'
      ReadOnly = True
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
  end
  inherited adt_active2: TADODataSet
    object adt_active2PurchaseOrderID: TAutoIncField
      FieldName = 'PurchaseOrderID'
      ReadOnly = True
    end
    object adt_active2PurchaseOrderNumber: TStringField
      FieldName = 'PurchaseOrderNumber'
      Size = 7
    end
    object adt_active2VendorID: TIntegerField
      FieldName = 'VendorID'
    end
    object adt_active2ComponentID: TIntegerField
      FieldName = 'ComponentID'
    end
    object adt_active2PurchaseOrderQuantity: TIntegerField
      FieldName = 'PurchaseOrderQuantity'
    end
    object adt_active2ConfirmedPurchaseOrderQuantity: TIntegerField
      FieldName = 'ConfirmedPurchaseOrderQuantity'
    end
    object adt_active2ConfirmedPurchaseOrderComments: TStringField
      FieldName = 'ConfirmedPurchaseOrderComments'
      Size = 40
    end
    object adt_active2ActualReceiptsQuantity: TIntegerField
      FieldName = 'ActualReceiptsQuantity'
    end
    object adt_active2PurchaseOrderStatesID: TIntegerField
      FieldName = 'PurchaseOrderStatesID'
    end
    object adt_active2IsChanged: TBooleanField
      FieldName = 'IsChanged'
    end
    object adt_active2RTA: TDateTimeField
      FieldName = 'RTA'
    end
    object adt_active2RTD: TDateTimeField
      FieldName = 'RTD'
    end
    object adt_active2ETD: TDateTimeField
      FieldName = 'ETD'
    end
    object adt_active2ETA: TDateTimeField
      FieldName = 'ETA'
    end
    object adt_active2ATA: TDateTimeField
      FieldName = 'ATA'
    end
    object adt_active2POGenerateTime: TDateTimeField
      FieldName = 'POGenerateTime'
    end
    object adt_active2POConfirmedTime: TDateTimeField
      FieldName = 'POConfirmedTime'
    end
    object adt_active2RTAB: TStringField
      FieldName = 'RTAB'
      ReadOnly = True
      Size = 10
    end
    object adt_active2RTDB: TStringField
      FieldName = 'RTDB'
      ReadOnly = True
      Size = 10
    end
    object adt_active2ETDB: TStringField
      FieldName = 'ETDB'
      ReadOnly = True
      Size = 10
    end
    object adt_active2ETAB: TStringField
      FieldName = 'ETAB'
      ReadOnly = True
      Size = 10
    end
    object adt_active2ATAB: TStringField
      FieldName = 'ATAB'
      ReadOnly = True
      Size = 10
    end
    object adt_active2POGenerateTimeB: TStringField
      FieldName = 'POGenerateTimeB'
      ReadOnly = True
      Size = 16
    end
    object adt_active2POConfirmedTimeB: TStringField
      FieldName = 'POConfirmedTimeB'
      ReadOnly = True
      Size = 16
    end
    object adt_active2ComponentItem: TStringField
      FieldName = 'ComponentItem'
      Size = 30
    end
    object adt_active2PackageWeightUnit: TStringField
      FieldName = 'PackageWeightUnit'
      Size = 5
    end
    object adt_active2PackageWeight: TFloatField
      FieldName = 'PackageWeight'
    end
    object adt_active2PackageSizeUnit: TStringField
      FieldName = 'PackageSizeUnit'
      Size = 5
    end
    object adt_active2PackageSize: TFloatField
      FieldName = 'PackageSize'
    end
    object adt_active2Package: TIntegerField
      FieldName = 'Package'
      ReadOnly = True
    end
    object adt_active2PurchaseOrderStatesName: TStringField
      FieldName = 'PurchaseOrderStatesName'
      Size = 15
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
end
