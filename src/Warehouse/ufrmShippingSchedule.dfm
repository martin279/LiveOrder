inherited frmShippingSchedule: TfrmShippingSchedule
  Left = 196
  Top = 58
  Width = 1036
  Height = 665
  Caption = 'frmShippingSchedule'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBottom: TPanel
    Top = 586
    Width = 1020
  end
  inherited pnlBody: TPanel
    Width = 1020
    Height = 561
    inherited PageControl1: TPageControl
      Width = 1020
      Height = 561
      inherited tbsBody1: TTabSheet
        inherited GroupBox1: TGroupBox
          Width = 1012
          Height = 530
          inherited PreviewSetupPanel: TPanel
            Width = 1008
          end
          inherited PreviewBox1: TPreviewBox
            Top = 439
            Width = 1008
          end
          inherited gridData: TDBGridEh
            Width = 1008
            Height = 383
            Columns = <
              item
                EditButtons = <>
                FieldName = 'CustomerOrderID'
                Footers = <>
                Title.Caption = 'Order ID'
                Width = 48
              end
              item
                EditButtons = <>
                FieldName = 'InvoiceNumber'
                Footers = <>
                Title.Caption = 'Invoice Number'
                Width = 62
              end
              item
                EditButtons = <>
                FieldName = 'CustomerPurchaseOrderNumber'
                Footers = <>
                Title.Caption = 'Customer PO No.'
                Width = 50
              end
              item
                EditButtons = <>
                FieldName = 'MNumber'
                Footers = <>
                Title.Caption = 'M No.'
                Width = 50
              end
              item
                EditButtons = <>
                FieldName = 'CustomerOrderNumber'
                Footers = <>
                Title.Caption = 'Order No.'
                Width = 50
              end
              item
                EditButtons = <>
                FieldName = 'CustomerNumber'
                Footers = <>
                Title.Caption = 'Customer No.'
                Width = 47
              end
              item
                EditButtons = <>
                FieldName = 'CustomerName'
                Footers = <>
                Title.Caption = 'Customer Name'
                Width = 111
              end
              item
                EditButtons = <>
                FieldName = 'Model'
                Footers = <>
                Width = 112
              end
              item
                EditButtons = <>
                FieldName = 'ModelDescription'
                Footers = <>
                Title.Caption = 'Model Desc.'
                Width = 74
              end
              item
                EditButtons = <>
                FieldName = 'ModelInvolved'
                Footers = <>
                Title.Caption = 'Model Involved'
                Width = 70
              end
              item
                EditButtons = <>
                FieldName = 'CustomerOrderQuantity'
                Footers = <>
                Title.Caption = 'Order Qty.'
                Width = 34
              end
              item
                EditButtons = <>
                FieldName = 'ETD'
                Footers = <>
                Width = 65
              end
              item
                EditButtons = <>
                FieldName = 'Currency'
                Footers = <>
                Width = 49
              end
              item
                EditButtons = <>
                FieldName = 'Price'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'TotalAmount'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'Destination'
                Footers = <>
                Width = 145
              end
              item
                EditButtons = <>
                FieldName = 'Forwarder'
                Footers = <>
                Width = 59
              end
              item
                EditButtons = <>
                FieldName = 'Instruction'
                Footers = <>
                Width = 86
              end
              item
                EditButtons = <>
                FieldName = 'CommunicatorName'
                Footers = <>
                Title.Caption = 'Communicator'
                Width = 75
              end
              item
                EditButtons = <>
                FieldName = 'PlantCode'
                Footers = <>
                Title.Caption = 'Plant'
                Width = 39
              end
              item
                EditButtons = <>
                FieldName = 'BusinessApplicationName'
                Footers = <>
                Title.Caption = 'Application'
                Width = 56
              end
              item
                EditButtons = <>
                FieldName = 'CustomerOrderStatesName'
                Footers = <>
                Title.Caption = 'Order States'
                Width = 80
              end
              item
                EditButtons = <>
                FieldName = 'Remark'
                Footers = <>
                Width = 76
              end
              item
                EditButtons = <>
                FieldName = 'LotNumber'
                Footers = <>
                Title.Caption = 'Lot No.'
                Width = 50
              end
              item
                EditButtons = <>
                FieldName = 'IsStockDone'
                Footers = <>
                Title.Caption = 'Is Stock Done'
              end
              item
                EditButtons = <>
                FieldName = 'DeliveryPlanToWarehouseDate'
                Footers = <>
                Title.Caption = 'Delivery Plan To Warehouse Date'
                Width = 75
              end
              item
                EditButtons = <>
                FieldName = 'ForwarderPickupDateAct'
                Footers = <>
                Title.Caption = 'Forwarder Pickup Date Act.'
                Width = 65
              end
              item
                EditButtons = <>
                FieldName = 'DeliveryETDEst'
                Footers = <>
                Title.Caption = 'Delivery ETD Est.'
                Width = 65
              end
              item
                EditButtons = <>
                FieldName = 'DeliveryOnboardAct'
                Footers = <>
                Title.Caption = 'Delivery Onboard Act.'
                Width = 65
              end
              item
                EditButtons = <>
                FieldName = 'DeliveryETAAct'
                Footers = <>
                Title.Caption = 'Delivery ETA Act.'
                Width = 65
              end
              item
                EditButtons = <>
                FieldName = 'Incoterms'
                Footers = <>
                Width = 83
              end
              item
                EditButtons = <>
                FieldName = 'LogisticExportSheetNo'
                Footers = <>
                Title.Caption = 'Logistic Export Sheet No.'
                Width = 75
              end
              item
                EditButtons = <>
                FieldName = 'LogisticRemark'
                Footers = <>
                Title.Caption = 'Logistic Remark'
                Width = 81
              end
              item
                EditButtons = <>
                FieldName = 'WarehouseRemark'
                Footers = <>
                Title.Caption = 'Warehouse Remark'
                Width = 101
              end
              item
                EditButtons = <>
                FieldName = 'PackingList'
                Footers = <>
                Title.Caption = 'Packing List'
                Width = 47
              end
              item
                EditButtons = <>
                FieldName = 'ShippingScheduleStatusName'
                Footers = <>
                Title.Caption = 'Shipping Schedule Status'
                Width = 89
              end
              item
                EditButtons = <>
                FieldName = 'CreateTime'
                Footers = <>
                Title.Caption = 'Create Time'
                Width = 100
              end
              item
                EditButtons = <>
                FieldName = 'UpdateTime'
                Footers = <>
                Title.Caption = 'Update Time'
                Width = 100
              end>
          end
        end
      end
    end
  end
  inherited PnlTop: TPanel
    Width = 1020
    inherited CoolBar1: TCoolBar
      Width = 1020
      Bands = <
        item
          Control = ToolBar1
          ImageIndex = -1
          Width = 1020
        end>
      inherited ToolBar1: TToolBar
        Width = 1007
        ButtonWidth = 64
        inherited ToolButton2: TToolButton
          Left = 64
        end
        inherited DBNavigator1: TDBNavigator
          Left = 72
          Hints.Strings = ()
        end
        inherited ToolButton3: TToolButton
          Left = 302
        end
        inherited tbtnFilter: TToolButton
          Left = 310
        end
        object tbtnRefresh: TToolButton
          Left = 374
          Top = 0
          Caption = 'Refresh'
          ImageIndex = 19
          OnClick = tbtnRefreshClick
        end
      end
    end
  end
  inherited PopupMenu1: TPopupMenu
    object N2: TMenuItem [5]
      Caption = '-'
    end
    inherited ppmPreview: TMenuItem [6]
    end
    inherited ppmInplacepreview: TMenuItem [7]
    end
    inherited ppmSaveSelection: TMenuItem [8]
    end
    object N3: TMenuItem [9]
      Caption = '-'
    end
    object MenuDone: TMenuItem [10]
      Caption = 'Stock Done'
      OnClick = MenuDoneClick
    end
    object MenuNotStockDone: TMenuItem [11]
      Caption = 'Not Stock Done'
      OnClick = MenuNotStockDoneClick
    end
    object MenuUndo: TMenuItem [12]
      Caption = 'Undo Schedule'
      OnClick = MenuUndoClick
    end
    inherited N1: TMenuItem [13]
    end
    object MenuEdtShippingSchedule: TMenuItem
      Caption = 'Edit Shipping Schedule'
      OnClick = MenuEdtShippingScheduleClick
    end
    object MenuBatchEdtShippingSchedule: TMenuItem
      Caption = 'Batch Edit Shipping Schedule'
      OnClick = MenuBatchEdtShippingScheduleClick
    end
  end
  inherited adt_active: TADODataSet
    CommandText = 'select * from ViewShippingSchedule'
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
  object Timer1: TTimer
    Enabled = False
    Interval = 120000
    OnTimer = tbtnRefreshClick
    Left = 376
    Top = 33
  end
end
