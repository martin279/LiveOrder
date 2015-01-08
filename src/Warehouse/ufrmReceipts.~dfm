inherited frmReceipts: TfrmReceipts
  Left = 257
  Top = 107
  Height = 528
  Caption = 'frmReceipts'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlTop: TPanel
    inherited CoolBar1: TCoolBar
      inherited ToolBar1: TToolBar
        inherited DBNavigator1: TDBNavigator
          Width = 224
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbPost, nbCancel, nbRefresh]
          Hints.Strings = ()
        end
        inherited ToolButton3: TToolButton
          Left = 305
        end
        inherited ToolButton4: TToolButton
          Left = 313
        end
        inherited ToolButton5: TToolButton
          Left = 386
        end
        inherited tbtnOperation: TToolButton
          Left = 459
        end
      end
    end
  end
  inherited pnlBottom: TPanel
    Top = 449
  end
  inherited pnlBody: TPanel
    Height = 424
    inherited Splitter1: TSplitter
      Top = 179
    end
    inherited PageControl1: TPageControl
      Height = 179
      inherited tbsBody1: TTabSheet
        inherited GroupBox1: TGroupBox
          Height = 148
          inherited gridData: TDBGridEh
            Height = 131
            AllowedOperations = [alopUpdateEh]
            Columns = <
              item
                EditButtons = <>
                FieldName = 'PurchaseOrderID'
                Footers = <>
                Title.Caption = 'ID'
                Width = 39
              end
              item
                EditButtons = <>
                FieldName = 'PurchaseOrderNumber'
                Footers = <>
                Title.Caption = 'PO No.'
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
                FieldName = 'PurchaseOrderQuantity'
                Footers = <>
                Title.Caption = 'PO Qty.'
                Width = 43
              end
              item
                EditButtons = <>
                FieldName = 'RTA'
                Footers = <>
                Width = 97
              end
              item
                EditButtons = <>
                FieldName = 'ConfirmedPurchaseOrderQuantity'
                Footers = <>
                Title.Caption = 'Confirmed Qty.'
                Width = 51
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
                Width = 73
              end
              item
                EditButtons = <>
                FieldName = 'ActualReceiptsQuantity'
                Footers = <>
                Title.Caption = 'Actual Receipts Qty.'
                Width = 49
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
      Top = 182
      Height = 242
      inherited gridData2: TDBGridEh
        Height = 225
        Columns = <
          item
            EditButtons = <>
            FieldName = 'PurchaseOrderID'
            Footers = <>
            Title.Caption = 'ID'
            Width = 40
          end
          item
            EditButtons = <>
            FieldName = 'PurchaseOrderNumber'
            Footers = <>
            Title.Caption = 'PO No.'
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
            FieldName = 'PurchaseOrderQuantity'
            Footers = <>
            Title.Caption = 'PO Qty.'
            Width = 44
          end
          item
            EditButtons = <>
            FieldName = 'RTA'
            Footers = <>
            Width = 97
          end
          item
            EditButtons = <>
            FieldName = 'ConfirmedPurchaseOrderQuantity'
            Footers = <>
            Title.Caption = 'Confirmed Qty.'
            Width = 51
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
            Width = 72
          end
          item
            EditButtons = <>
            FieldName = 'ActualReceiptsQuantity'
            Footers = <>
            Title.Caption = 'Actual Receipts Qty.'
            Width = 49
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
    object adt_active2RTA: TDateTimeField
      FieldName = 'RTA'
    end
    object adt_active2ConfirmedPurchaseOrderQuantity: TIntegerField
      FieldName = 'ConfirmedPurchaseOrderQuantity'
    end
    object adt_active2ETA: TDateTimeField
      FieldName = 'ETA'
    end
    object adt_active2ConfirmedPurchaseOrderComments: TStringField
      FieldName = 'ConfirmedPurchaseOrderComments'
      Size = 40
    end
    object adt_active2ActualReceiptsQuantity: TIntegerField
      FieldName = 'ActualReceiptsQuantity'
    end
    object adt_active2ATA: TDateTimeField
      FieldName = 'ATA'
    end
    object adt_active2PurchaseOrderStatesID: TIntegerField
      FieldName = 'PurchaseOrderStatesID'
    end
    object adt_active2ComponentItem: TStringField
      FieldName = 'ComponentItem'
      Size = 11
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
