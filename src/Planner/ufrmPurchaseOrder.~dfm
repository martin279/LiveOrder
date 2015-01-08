inherited frmPurchaseOrder: TfrmPurchaseOrder
  Caption = 'frmPurchaseOrder'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Splitter1: TSplitter
    Left = 183
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
  inherited pnlBody: TPanel
    Left = 186
    Width = 502
    inherited PageControl1: TPageControl
      Width = 502
      inherited tbsBody1: TTabSheet
        inherited GroupBox1: TGroupBox
          Width = 494
          inherited gridData: TDBGridEh
            Width = 490
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
                FieldName = 'PurchaseOrderStatesName'
                Footers = <>
                Title.Caption = 'PO States'
                Width = 72
              end
              item
                EditButtons = <>
                FieldName = 'PurchaseOrderNumber'
                Footers = <>
                Title.Caption = 'PO No.'
                Width = 45
              end
              item
                EditButtons = <>
                FieldName = 'VendorNumber'
                Footers = <>
                Title.Caption = 'Vendor No.'
                Width = 44
              end
              item
                EditButtons = <>
                FieldName = 'VendorName'
                Footers = <>
                Title.Caption = 'Vendor Name'
                Visible = False
                Width = 115
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
                FieldName = 'Package'
                Footers = <>
                Width = 50
              end
              item
                ButtonStyle = cbsNone
                DisplayFormat = 'YYYY-mm-dd hh:00'
                EditButtons = <>
                FieldName = 'RTA'
                Footers = <>
                Width = 100
              end
              item
                EditButtons = <>
                FieldName = 'RTD'
                Footers = <>
                Width = 100
              end
              item
                EditButtons = <>
                FieldName = 'ConfirmedPurchaseOrderQuantity'
                Footers = <>
                Title.Caption = 'Confirmed PO Qty.'
                Width = 54
              end
              item
                DisplayFormat = 'YYYY-mm-dd hh:00'
                EditButtons = <>
                FieldName = 'ETD'
                Footers = <>
                Width = 100
              end
              item
                DisplayFormat = 'YYYY-mm-dd hh:00'
                EditButtons = <>
                FieldName = 'ETA'
                Footers = <>
                Width = 100
              end
              item
                EditButtons = <>
                FieldName = 'ConfirmedPurchaseOrderComments'
                Footers = <>
                Title.Caption = 'Confirmed Comments'
                Width = 53
              end
              item
                EditButtons = <>
                FieldName = 'ActualReceiptsQuantity'
                Footers = <>
                Title.Caption = 'Actual Receipts Qty.'
                Width = 45
              end
              item
                DisplayFormat = 'YYYY-mm-dd hh:mm'
                EditButtons = <>
                FieldName = 'ATA'
                Footers = <>
                Width = 100
              end
              item
                DisplayFormat = 'YYYY-mm-dd hh:mm'
                EditButtons = <>
                FieldName = 'POGenerateTime'
                Footers = <>
                Title.Caption = 'PO Generate Time'
                Width = 100
              end
              item
                EditButtons = <>
                FieldName = 'POConfirmedTime'
                Footers = <>
                Title.Caption = 'PO Confirmed Time'
                Width = 100
              end
              item
                EditButtons = <>
                FieldName = 'PackageSize'
                Footers = <>
                Title.Caption = 'Package Size'
              end
              item
                EditButtons = <>
                FieldName = 'PackageWeight'
                Footers = <>
                Title.Caption = 'Package Weight'
              end
              item
                DisplayFormat = 'YYYY-mm-dd'
                EditButtons = <>
                FieldName = 'RTA'
                Footers = <>
                Title.Caption = 'RTADate'
              end
              item
                DisplayFormat = 'hh:mm'
                EditButtons = <>
                FieldName = 'RTA'
                Footers = <>
                Title.Caption = 'RTATime'
              end
              item
                EditButtons = <>
                FieldName = 'IsChanged'
                Footers = <>
                Title.Caption = 'Is Changed'
              end>
          end
        end
      end
    end
  end
  inherited pnlBodyLeft: TPanel
    Width = 183
    inherited TreeView1: TTreeView
      Width = 183
    end
    inherited pnlBodyLeftTop: TPanel
      Width = 183
      inherited sbtnRefresh: TSpeedButton
        Left = 153
      end
      inherited cbbTreeType: TComboBox
        Left = 5
        Width = 143
      end
    end
  end
  inherited PopupMenu1: TPopupMenu
    object MenuGeneratePickUpForm: TMenuItem
      Caption = 'Generate PickUp Form'
      OnClick = MenuGeneratePickUpFormClick
    end
  end
  inherited adt_active: TADODataSet
    BeforePost = adt_activeBeforePost
    CommandText = 'select * from ViewPurchaseOrder'
    Top = 0
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
    object adt_activeRTD: TDateTimeField
      FieldName = 'RTD'
    end
    object adt_activeConfirmedPurchaseOrderQuantity: TIntegerField
      FieldName = 'ConfirmedPurchaseOrderQuantity'
    end
    object adt_activeETD: TDateTimeField
      FieldName = 'ETD'
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
    object adt_activePOGenerateTime: TDateTimeField
      FieldName = 'POGenerateTime'
    end
    object adt_activePOConfirmedTime: TDateTimeField
      FieldName = 'POConfirmedTime'
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
    object adt_activeIsChanged: TBooleanField
      FieldName = 'IsChanged'
    end
  end
  object WordDocument1: TWordDocument
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 410
    Top = 33
  end
  object WordApplication1: TWordApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 450
    Top = 33
  end
  object WordFont1: TWordFont
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 482
    Top = 33
  end
end
