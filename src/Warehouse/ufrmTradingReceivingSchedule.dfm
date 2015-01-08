inherited frmTradingReceivingSchedule: TfrmTradingReceivingSchedule
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBody: TPanel
    inherited PageControl1: TPageControl
      inherited tbsBody1: TTabSheet
        inherited GroupBox1: TGroupBox
          inherited gridData: TDBGridEh
            Columns = <
              item
                EditButtons = <>
                FieldName = 'CustomerOrderID'
                Footers = <>
                Title.Caption = 'Customer Order ID'
              end
              item
                EditButtons = <>
                FieldName = 'TradingOrderID'
                Footers = <>
                Title.Caption = 'PO ID'
              end
              item
                EditButtons = <>
                FieldName = 'InvoiceNumber'
                Footers = <>
                Title.Caption = 'Invoice No.'
                Width = 79
              end
              item
                EditButtons = <>
                FieldName = 'CustomerPurchaseOrderNumber'
                Footers = <>
                Title.Caption = 'Customer PO No.'
                Width = 59
              end
              item
                EditButtons = <>
                FieldName = 'PlantCode'
                Footers = <>
                Title.Caption = 'Plant'
                Width = 44
              end
              item
                EditButtons = <>
                FieldName = 'CustomerOrderStatesName'
                Footers = <>
                Title.Caption = 'Customer Order States'
                Width = 79
              end
              item
                EditButtons = <>
                FieldName = 'CommunicatorName'
                Footers = <>
                Title.Caption = 'Communicator'
                Width = 74
              end
              item
                EditButtons = <>
                FieldName = 'Destination'
                Footers = <>
                Width = 84
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
                Title.Caption = 'Customer Order No.'
                Width = 50
              end
              item
                EditButtons = <>
                FieldName = 'CustomerNumber'
                Footers = <>
                Title.Caption = 'Customer No.'
                Width = 50
              end
              item
                EditButtons = <>
                FieldName = 'CustomerName'
                Footers = <>
                Title.Caption = 'Customer Name'
                Width = 50
              end
              item
                EditButtons = <>
                FieldName = 'Model'
                Footers = <>
                Width = 50
              end
              item
                EditButtons = <>
                FieldName = 'ModelDescription'
                Footers = <>
                Title.Caption = 'Model Desc.'
                Width = 50
              end
              item
                EditButtons = <>
                FieldName = 'CustomerOrderQuantity'
                Footers = <>
                Title.Caption = 'Order Qty.'
                Width = 50
              end
              item
                EditButtons = <>
                FieldName = 'Currency'
                Footers = <>
                Width = 50
              end
              item
                EditButtons = <>
                FieldName = 'ETD'
                Footers = <>
                Width = 50
              end
              item
                EditButtons = <>
                FieldName = 'Instruction'
                Footers = <>
                Width = 76
              end
              item
                EditButtons = <>
                FieldName = 'Remark'
                Footers = <>
                Width = 50
              end
              item
                EditButtons = <>
                FieldName = 'Forwarder'
                Footers = <>
                Width = 50
              end
              item
                EditButtons = <>
                FieldName = 'DeliveryETDEst'
                Footers = <>
                Title.Caption = 'Delivery ETD Est'
                Width = 50
              end
              item
                EditButtons = <>
                FieldName = 'DeliveryOnboardAct'
                Footers = <>
                Title.Caption = 'Delivery Onboard Act'
                Width = 72
              end
              item
                EditButtons = <>
                FieldName = 'DeliveryETAAct'
                Footers = <>
                Title.Caption = 'Delivery ETA Act'
                Width = 50
              end
              item
                EditButtons = <>
                FieldName = 'PackingList'
                Footers = <>
                Title.Caption = 'Packing List'
                Width = 50
              end
              item
                EditButtons = <>
                FieldName = 'PlanCreateTime'
                Footers = <>
                Title.Caption = 'Plan Create Time'
              end
              item
                EditButtons = <>
                FieldName = 'DeliveryPlanToWarehouseDate'
                Footers = <>
                Title.Caption = 'Delivery Plan To Warehouse Date'
                Width = 99
              end
              item
                EditButtons = <>
                FieldName = 'WarehouseRemark'
                Footers = <>
                Title.Caption = 'Warehouse Remark'
                Width = 70
              end
              item
                EditButtons = <>
                FieldName = 'ReceivingQuantity'
                Footers = <>
                Title.Caption = 'Receiving Qty.'
                Width = 66
              end
              item
                EditButtons = <>
                FieldName = 'LogisticInRCED'
                Footers = <>
                Title.Caption = 'Logistic In RCED'
                Width = 50
              end
              item
                EditButtons = <>
                FieldName = 'OriginPickupDate'
                Footers = <>
                Title.Caption = 'Origin Pickup Date'
                Width = 83
              end
              item
                EditButtons = <>
                FieldName = 'ActArriveWarehouseDate'
                Footers = <>
                Title.Caption = 'Act Arrive Warehouse Date'
                Width = 89
              end
              item
                EditButtons = <>
                FieldName = 'SortingDate'
                Footers = <>
                Title.Caption = 'Sorting Date'
                Width = 58
              end
              item
                EditButtons = <>
                FieldName = 'ImportSheetNo'
                Footers = <>
                Title.Caption = 'Import Sheet No'
                Width = 69
              end>
          end
        end
      end
    end
  end
  inherited PnlTop: TPanel
    inherited CoolBar1: TCoolBar
      inherited ToolBar1: TToolBar
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
          ImageIndex = 18
          OnClick = tbtnRefreshClick
        end
      end
    end
  end
  inherited PopupMenu1: TPopupMenu
    Left = 636
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
end
