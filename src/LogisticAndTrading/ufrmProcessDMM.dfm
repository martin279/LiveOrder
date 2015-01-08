inherited frmProcessDMM: TfrmProcessDMM
  Left = 612
  Top = 301
  Width = 869
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBottom: TPanel
    Width = 853
  end
  inherited pnlBody: TPanel
    Width = 853
    inherited PageControl1: TPageControl
      Width = 853
      inherited tbsBody1: TTabSheet
        inherited GroupBox1: TGroupBox
          Width = 845
          inherited PreviewSetupPanel: TPanel
            Width = 841
          end
          inherited PreviewBox1: TPreviewBox
            Width = 841
          end
          inherited gridData: TDBGridEh
            Width = 841
            Columns = <
              item
                EditButtons = <>
                FieldName = 'CustomerOrderID'
                Footers = <>
                Title.Caption = 'CO ID'
                Width = 100
              end
              item
                EditButtons = <>
                FieldName = 'InvoiceNumber'
                Footers = <>
                Title.Caption = 'Invoice No.'
                Width = 100
              end
              item
                EditButtons = <>
                FieldName = 'CustomerPurchaseOrderNumber'
                Footers = <>
                Title.Caption = 'Customer PO No.'
                Width = 100
              end
              item
                EditButtons = <>
                FieldName = 'PlantCode'
                Footers = <>
                Title.Caption = 'Plant'
                Width = 100
              end
              item
                EditButtons = <>
                FieldName = 'CustomerOrderStatesName'
                Footers = <>
                Title.Caption = 'Customer Order States '
                Width = 100
              end
              item
                EditButtons = <>
                FieldName = 'CommunicatorName'
                Footers = <>
                Title.Caption = 'Communicator'
                Width = 100
              end
              item
                EditButtons = <>
                FieldName = 'Destination'
                Footers = <>
                Width = 100
              end
              item
                EditButtons = <>
                FieldName = 'MNumber'
                Footers = <>
                Width = 100
              end
              item
                EditButtons = <>
                FieldName = 'CustomerOrderNumber'
                Footers = <>
                Title.Caption = 'Customer Order No.'
                Width = 100
              end
              item
                EditButtons = <>
                FieldName = 'CustomerNumber'
                Footers = <>
                Width = 100
              end
              item
                EditButtons = <>
                FieldName = 'CustomerName'
                Footers = <>
                Width = 100
              end
              item
                EditButtons = <>
                FieldName = 'Model'
                Footers = <>
                Width = 100
              end
              item
                EditButtons = <>
                FieldName = 'ModelDescription'
                Footers = <>
                Width = 100
              end
              item
                EditButtons = <>
                FieldName = 'CustomerOrderQuantity'
                Footers = <>
                Width = 100
              end
              item
                EditButtons = <>
                FieldName = 'Currency'
                Footers = <>
                Width = 100
              end
              item
                EditButtons = <>
                FieldName = 'ETD'
                Footers = <>
                Width = 100
              end
              item
                EditButtons = <>
                FieldName = 'Instruction'
                Footers = <>
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
                FieldName = 'Forwarder'
                Footers = <>
                Width = 100
              end
              item
                EditButtons = <>
                FieldName = 'DeliveryETDEst'
                Footers = <>
                Width = 100
              end
              item
                EditButtons = <>
                FieldName = 'DeliveryOnboardAct'
                Footers = <>
                Width = 100
              end
              item
                EditButtons = <>
                FieldName = 'DeliveryETAAct'
                Footers = <>
                Width = 100
              end
              item
                EditButtons = <>
                FieldName = 'PackingList'
                Footers = <>
                Width = 100
              end
              item
                EditButtons = <>
                FieldName = 'PlanCreateTime'
                Footers = <>
                Width = 100
              end
              item
                EditButtons = <>
                FieldName = 'DeliveryPlanToWarehouseDate'
                Footers = <>
                Width = 100
              end
              item
                EditButtons = <>
                FieldName = 'WarehouseRemark'
                Footers = <>
                Width = 100
              end
              item
                EditButtons = <>
                FieldName = 'TradingOrderID'
                Footers = <>
                Width = 100
              end
              item
                EditButtons = <>
                FieldName = 'ReceivingQuantity'
                Footers = <>
                Width = 100
              end
              item
                EditButtons = <>
                FieldName = 'LogisticInRCED'
                Footers = <>
                Width = 100
              end
              item
                EditButtons = <>
                FieldName = 'OriginPickupDate'
                Footers = <>
                Width = 100
              end
              item
                EditButtons = <>
                FieldName = 'ActArriveWarehouseDate'
                Footers = <>
                Width = 100
              end
              item
                EditButtons = <>
                FieldName = 'SortingDate'
                Footers = <>
                Width = 100
              end
              item
                EditButtons = <>
                FieldName = 'ImportSheetNo'
                Footers = <>
                Width = 100
              end>
          end
        end
      end
    end
  end
  inherited PnlTop: TPanel
    Width = 853
    inherited CoolBar1: TCoolBar
      Width = 853
      Bands = <
        item
          Control = ToolBar1
          ImageIndex = -1
          Width = 853
        end>
      inherited ToolBar1: TToolBar
        Width = 840
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
    object N2: TMenuItem
      Caption = '-'
    end
    object MenuBatchEdit: TMenuItem
      Caption = 'Batch Edit'
      OnClick = MenuBatchEditClick
    end
  end
  inherited adt_active: TADODataSet
    Connection = DM.ADOConnection1
    CommandText = 
      'select s.CustomerOrderID,s.InvoiceNumber,s.CustomerPurchaseOrder' +
      'Number,s.PlantCode,'#13#10's.CustomerOrderStatesName,s.CommunicatorNam' +
      'e,s.Destination,s.MNumber,s.CustomerOrderNumber,'#13#10's.CustomerNumb' +
      'er,s.CustomerName,s.Model,s.ModelDescription,s.CustomerOrderQuan' +
      'tity,'#13#10's.Currency,s.ETD,s.Instruction,s.Remark,s.Forwarder,'#13#10's.D' +
      'eliveryETDEst,s.DeliveryOnboardAct,s.DeliveryETAAct,'#13#10's.PackingL' +
      'ist,s.CreateTime as PlanCreateTime,'#13#10's.DeliveryPlanToWarehouseDa' +
      'te,s.WarehouseRemark,'#13#10's.ForwarderID,s.ShippingScheduleStatusID,' +
      #13#10'r.TradingOrderID,'#13#10't.ReceivingQuantity,t.LogisticInRCED,t.Orig' +
      'inPickupDate,t.ActArriveWarehouseDate,'#13#10't.SortingDate,t.ImportSh' +
      'eetNo'#13#10'from ViewShippingSchedule s'#13#10'left outer join TradingOrder' +
      ' r on s.CustomerOrderID=r.CustomerOrderID'#13#10'left outer join Tradi' +
      'ngOrderReceivingSchedule t on r.TradingOrderID=t.TradingOrderID'
    object adt_activeCustomerOrderID: TAutoIncField
      FieldName = 'CustomerOrderID'
      ReadOnly = True
    end
    object adt_activeInvoiceNumber: TStringField
      FieldName = 'InvoiceNumber'
    end
    object adt_activeCustomerPurchaseOrderNumber: TStringField
      FieldName = 'CustomerPurchaseOrderNumber'
      Size = 50
    end
    object adt_activePlantCode: TStringField
      FieldName = 'PlantCode'
      Size = 15
    end
    object adt_activeCustomerOrderStatesName: TStringField
      FieldName = 'CustomerOrderStatesName'
      Size = 15
    end
    object adt_activeCommunicatorName: TStringField
      FieldName = 'CommunicatorName'
      Size = 15
    end
    object adt_activeDestination: TStringField
      FieldName = 'Destination'
      Size = 200
    end
    object adt_activeMNumber: TStringField
      FieldName = 'MNumber'
    end
    object adt_activeCustomerOrderNumber: TStringField
      FieldName = 'CustomerOrderNumber'
    end
    object adt_activeCustomerNumber: TStringField
      FieldName = 'CustomerNumber'
      Size = 10
    end
    object adt_activeCustomerName: TStringField
      FieldName = 'CustomerName'
      Size = 40
    end
    object adt_activeModel: TStringField
      FieldName = 'Model'
      Size = 25
    end
    object adt_activeModelDescription: TStringField
      FieldName = 'ModelDescription'
      Size = 80
    end
    object adt_activeCustomerOrderQuantity: TFloatField
      FieldName = 'CustomerOrderQuantity'
    end
    object adt_activeCurrency: TStringField
      FieldName = 'Currency'
      Size = 10
    end
    object adt_activeETD: TDateTimeField
      FieldName = 'ETD'
    end
    object adt_activeInstruction: TStringField
      FieldName = 'Instruction'
      Size = 200
    end
    object adt_activeRemark: TStringField
      FieldName = 'Remark'
      Size = 400
    end
    object adt_activeForwarder: TStringField
      FieldName = 'Forwarder'
      Size = 64
    end
    object adt_activeDeliveryETDEst: TDateTimeField
      FieldName = 'DeliveryETDEst'
    end
    object adt_activeDeliveryOnboardAct: TDateTimeField
      FieldName = 'DeliveryOnboardAct'
    end
    object adt_activeDeliveryETAAct: TDateTimeField
      FieldName = 'DeliveryETAAct'
    end
    object adt_activePackingList: TStringField
      FieldName = 'PackingList'
      Size = 15
    end
    object adt_activePlanCreateTime: TDateTimeField
      FieldName = 'PlanCreateTime'
    end
    object adt_activeDeliveryPlanToWarehouseDate: TDateTimeField
      FieldName = 'DeliveryPlanToWarehouseDate'
    end
    object adt_activeWarehouseRemark: TStringField
      FieldName = 'WarehouseRemark'
      Size = 50
    end
    object adt_activeForwarderID: TIntegerField
      FieldName = 'ForwarderID'
    end
    object adt_activeShippingScheduleStatusID: TIntegerField
      FieldName = 'ShippingScheduleStatusID'
    end
    object adt_activeTradingOrderID: TAutoIncField
      FieldName = 'TradingOrderID'
      ReadOnly = True
    end
    object adt_activeReceivingQuantity: TIntegerField
      FieldName = 'ReceivingQuantity'
    end
    object adt_activeLogisticInRCED: TDateTimeField
      FieldName = 'LogisticInRCED'
    end
    object adt_activeOriginPickupDate: TDateTimeField
      FieldName = 'OriginPickupDate'
    end
    object adt_activeActArriveWarehouseDate: TDateTimeField
      FieldName = 'ActArriveWarehouseDate'
    end
    object adt_activeSortingDate: TDateTimeField
      FieldName = 'SortingDate'
    end
    object adt_activeImportSheetNo: TStringField
      FieldName = 'ImportSheetNo'
      Size = 50
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
end
