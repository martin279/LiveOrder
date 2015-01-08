inherited frmProcessTradingOrder: TfrmProcessTradingOrder
  Left = 281
  Top = 123
  Width = 1017
  Height = 564
  Caption = ''
  PixelsPerInch = 96
  TextHeight = 13
  inherited Splitter1: TSplitter
    Height = 460
  end
  inherited pnlBottom: TPanel
    Top = 485
    Width = 1001
  end
  inherited pnlBody: TPanel
    Width = 863
    Height = 460
    inherited Splitter2: TSplitter
      Top = 207
      Width = 863
    end
    inherited PageControl1: TPageControl
      Width = 863
      Height = 207
      inherited tbsBody1: TTabSheet
        inherited GroupBox1: TGroupBox
          Width = 855
          Height = 176
          inherited gridData: TDBGridEh
            Width = 851
            Height = 159
            OnDblClick = MenuEdtTOClick
            Columns = <
              item
                EditButtons = <>
                FieldName = 'TradingOrderID'
                Footers = <>
                Title.Caption = 'Trading Order ID'
                Width = 49
              end
              item
                EditButtons = <>
                FieldName = 'CustomerOrderID'
                Footers = <>
                Title.Caption = 'Customer Order ID'
                Width = 53
              end
              item
                EditButtons = <>
                FieldName = 'PlantCode'
                Footers = <>
                Title.Caption = 'Plant'
                Width = 28
              end
              item
                EditButtons = <>
                FieldName = 'CustomerNumber'
                Footers = <>
                Title.Caption = 'Customer No.'
                Width = 49
              end
              item
                EditButtons = <>
                FieldName = 'CustomerName'
                Footers = <>
                Title.Caption = 'Customer Name'
                Width = 96
              end
              item
                EditButtons = <>
                FieldName = 'Model'
                Footers = <>
                Width = 101
              end
              item
                EditButtons = <>
                FieldName = 'ModelDescription'
                Footers = <>
                Title.Caption = 'Model Desc.'
                Width = 120
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
                FieldName = 'CustomerPurchaseOrderNumber'
                Footers = <>
                Title.Caption = 'Customer PO No.'
                Width = 77
              end
              item
                EditButtons = <>
                FieldName = 'CustomerOrderNumber'
                Footers = <>
                Title.Caption = 'Order No.'
                Width = 51
              end
              item
                EditButtons = <>
                FieldName = 'ContractDate'
                Footers = <>
                Title.Caption = 'Contract Date'
                Width = 58
              end
              item
                EditButtons = <>
                FieldName = 'CustomerOrderStatesName'
                Footers = <>
                Title.Caption = 'Order States'
                Width = 52
              end
              item
                EditButtons = <>
                FieldName = 'IsSplitOrder'
                Footers = <>
                Title.Caption = 'Is Split Order'
                Width = 29
              end
              item
                EditButtons = <>
                FieldName = 'MNumber'
                Footers = <>
                Title.Caption = 'M No.'
                Width = 92
              end
              item
                EditButtons = <>
                FieldName = 'InvoiceNumber'
                Footers = <>
                Title.Caption = 'Invoice No.'
                Width = 78
              end
              item
                EditButtons = <>
                FieldName = 'Currency'
                Footers = <>
                Width = 50
              end
              item
                EditButtons = <>
                FieldName = 'Price'
                Footers = <>
                Width = 46
              end
              item
                EditButtons = <>
                FieldName = 'TotalAmount'
                Footers = <>
                Title.Caption = 'Total Amount'
                Width = 62
              end
              item
                EditButtons = <>
                FieldName = 'RTD'
                Footers = <>
                Width = 76
              end
              item
                EditButtons = <>
                FieldName = 'ETD'
                Footers = <>
                Width = 79
              end
              item
                EditButtons = <>
                FieldName = 'ATD'
                Footers = <>
                Width = 69
              end
              item
                EditButtons = <>
                FieldName = 'Forwarder'
                Footers = <>
                Width = 68
              end
              item
                EditButtons = <>
                FieldName = 'Destination'
                Footers = <>
                Width = 212
              end
              item
                EditButtons = <>
                FieldName = 'CommunicatorName'
                Footers = <>
                Title.Caption = 'Communicator'
                Width = 81
              end
              item
                EditButtons = <>
                FieldName = 'IsSplitPO'
                Footers = <>
                Title.Caption = 'Is Split PO'
              end
              item
                EditButtons = <>
                FieldName = 'SellerPartNo'
                Footers = <>
                Title.Caption = 'Seller|Part No.'
              end
              item
                EditButtons = <>
                FieldName = 'SellerCode'
                Footers = <>
                Title.Caption = 'Seller|Code'
              end
              item
                EditButtons = <>
                FieldName = 'SellerPOToSellerDate'
                Footers = <>
                Title.Caption = 'Seller|PO To Seller Date'
                Width = 92
              end
              item
                EditButtons = <>
                FieldName = 'SellerBuyerPONumber'
                Footers = <>
                Title.Caption = 'Seller|Buyer PO No.'
                Width = 76
              end
              item
                EditButtons = <>
                FieldName = 'SellerBuyerPOQuantity'
                Footers = <>
                Title.Caption = 'Seller|Buyer PO Qty.'
                Width = 82
              end
              item
                EditButtons = <>
                FieldName = 'SellerShippingMode'
                Footers = <>
                Title.Caption = 'Seller|Shipping Mode'
                Width = 75
              end
              item
                EditButtons = <>
                FieldName = 'SellerAirFreightPaidby'
                Footers = <>
                Title.Caption = 'Seller|Air Freight Paid By'
                Width = 95
              end
              item
                EditButtons = <>
                FieldName = 'SellerOAReplyDate'
                Footers = <>
                Title.Caption = 'Seller|OA Reply Date'
                Width = 85
              end
              item
                EditButtons = <>
                FieldName = 'SellerExFactoryDate'
                Footers = <>
                Title.Caption = 'Seller|Ex Factory Date'
                Width = 91
              end
              item
                EditButtons = <>
                FieldName = 'SellerExFactoryDate1'
                Footers = <>
                Title.Caption = 'Seller|Ex Factory Date1'
                Width = 91
              end
              item
                EditButtons = <>
                FieldName = 'SellerLogisticDTDTime'
                Footers = <>
                Title.Caption = 'Seller|Logistic DTD Time'
                Width = 100
              end
              item
                EditButtons = <>
                FieldName = 'SellerRCEDSellerOA'
                Footers = <>
                Title.Caption = 'Seller|RCED Seller OA'
                Width = 88
              end
              item
                EditButtons = <>
                FieldName = 'SellerStockDueToOrderCancel'
                Footers = <>
                Title.Caption = 'Seller|Stock Due To Order Cancel'
                Width = 141
              end
              item
                EditButtons = <>
                FieldName = 'SellerInvoiceNumber'
                Footers = <>
                Title.Caption = 'Seller|Invoice No.'
                Width = 89
              end
              item
                EditButtons = <>
                FieldName = 'SellerInvoiceDate'
                Footers = <>
                Title.Caption = 'Seller|Invoice Date'
                Width = 99
              end
              item
                EditButtons = <>
                FieldName = 'SellerBuyerRemark'
                Footers = <>
                Title.Caption = 'Seller|Buyer Remark'
                Width = 106
              end
              item
                EditButtons = <>
                FieldName = 'LogisticInImportSheetNo'
                Footers = <>
                Title.Caption = 'Logistic In|Import Sheet No'
                Width = 83
              end
              item
                EditButtons = <>
                FieldName = 'LogisticInOriginPickupDate'
                Footers = <>
                Title.Caption = 'Logistic In|Origin Pickup Date'
                Width = 94
              end
              item
                EditButtons = <>
                FieldName = 'LogisticInSellerETDDate'
                Footers = <>
                Title.Caption = 'Logistic In|Seller ETD Date'
                Width = 87
              end
              item
                EditButtons = <>
                FieldName = 'LogisticInSellerETADate'
                Footers = <>
                Title.Caption = 'Logistic In|Seller ETA Date'
                Width = 90
              end
              item
                EditButtons = <>
                FieldName = 'LogisticInActArriveWarehouseDate'
                Footers = <>
                Title.Caption = 'Logistic In|Act Arrive Warehouse Date'
                Width = 141
              end
              item
                EditButtons = <>
                FieldName = 'LogisticInRCED'
                Footers = <>
                Title.Caption = 'Logistic In|Logistic In RCED'
                Width = 87
              end
              item
                EditButtons = <>
                FieldName = 'ThirdPartyWarehouseReference'
                Footers = <>
                Title.Caption = 'Third Party Warehouse|Reference'
              end
              item
                EditButtons = <>
                FieldName = 'DeliveryPlanToWarehouseDate'
                Footers = <>
                Title.Caption = 'Third Party Warehouse|Delivery Plan To Warehouse Date'
                Width = 176
              end
              item
                EditButtons = <>
                FieldName = 'GoodsEXThirdPartyWarehouseDate'
                Footers = <>
                Title.Caption = 'Third Party Warehouse|Goods EX Warehouse Date'
                Width = 138
              end
              item
                EditButtons = <>
                FieldName = 'ThirdPartyWarehousePackingList'
                Footers = <>
                Title.Caption = 'Third Party Warehouse|Packing List'
              end
              item
                EditButtons = <>
                FieldName = 'ThirdPartyWarehouseReceivingDate'
                Footers = <>
                Title.Caption = 'Third Party Warehouse|Receiving Date'
              end
              item
                EditButtons = <>
                FieldName = 'ThirdPartyWarehouseRemark'
                Footers = <>
                Title.Caption = 'Third Party Warehouse|Remark'
                Width = 122
              end
              item
                EditButtons = <>
                FieldName = 'ThirdPartyWarehouseDeliveryOrder'
                Footers = <>
                Title.Caption = 'Third Party Warehouse|Delivery Order'
                Width = 42
              end
              item
                EditButtons = <>
                FieldName = 'LogisticOutLogisticExportSheetNo'
                Footers = <>
                Title.Caption = 'Logistic Out|Logistic Export Sheet No.'
                Width = 132
              end
              item
                EditButtons = <>
                FieldName = 'LogisticOutIncoterms'
                Footers = <>
                Title.Caption = 'Logistic Out|Incoterms'
                Width = 66
              end
              item
                EditButtons = <>
                FieldName = 'LogisticOutForwarderPickupDateEst'
                Footers = <>
                Title.Caption = 'Logistic Out|Forwarder Pickup Date Est'
                Width = 160
              end
              item
                EditButtons = <>
                FieldName = 'LogisticOutDeliveryETDEst'
                Footers = <>
                Title.Caption = 'Logistic Out|Delivery ETD Est'
              end
              item
                EditButtons = <>
                FieldName = 'LogisticOutDeliveryOnboardAct'
                Footers = <>
                Title.Caption = 'Logistic Out|Delivery Onboard Act'
              end
              item
                EditButtons = <>
                FieldName = 'LogisticOutDeliveryETAEst'
                Footers = <>
                Title.Caption = 'Logistic Out|Delivery ETA Est'
                Width = 88
              end
              item
                EditButtons = <>
                FieldName = 'LogisticOutLogisticRemark'
                Footers = <>
                Title.Caption = 'Logistic Out|Logistic Remark'
              end
              item
                EditButtons = <>
                FieldName = 'DemandManagingRCED'
                Footers = <>
                Title.Caption = 'Demand Managing|RCED'
                Width = 80
              end
              item
                EditButtons = <>
                FieldName = 'DemandManagingSalesMonth'
                Footers = <>
                Title.Caption = 'Demand Managing|Sales Month'
              end
              item
                EditButtons = <>
                FieldName = 'DemandManagingDMMMonth'
                Footers = <>
                Title.Caption = 'Demand Managing|DMM Month'
              end
              item
                EditButtons = <>
                FieldName = 'DemandManagingDMMRemark'
                Footers = <>
                Title.Caption = 'Demand Managing|DMM Remark'
                Width = 82
              end
              item
                EditButtons = <>
                FieldName = 'DemandManagingCargoStatus'
                Footers = <>
                Title.Caption = 'Demand Managing|Cargo Status'
                Width = 72
              end
              item
                EditButtons = <>
                FieldName = 'CargoStatusType'
                Footers = <>
                Title.Caption = 'Demand Managing|Cargo Status Type'
                Width = 185
              end
              item
                EditButtons = <>
                FieldName = 'DemandManagingCargoStatusRemark'
                Footers = <>
                Title.Caption = 'Demand Managing|Cargo Status Remark'
                Width = 106
              end
              item
                EditButtons = <>
                FieldName = 'SalesAnalysisProductFamily'
                Footers = <>
                Title.Caption = 'Sales Analysis|Product Family'
                Width = 83
              end
              item
                EditButtons = <>
                FieldName = 'Country'
                Footers = <>
                Title.Caption = 'Sales Analysis|Country'
                Width = 66
              end
              item
                EditButtons = <>
                FieldName = 'Region'
                Footers = <>
                Title.Caption = 'Sales Analysis|Region'
                Width = 67
              end
              item
                EditButtons = <>
                FieldName = 'AsiaPOR'
                Footers = <>
                Title.Caption = 'Sales Analysis|Asia POR'
                Width = 70
              end
              item
                EditButtons = <>
                FieldName = 'TradingOrderStatusName'
                Footers = <>
                Title.Caption = 'Trading Order Status Name'
                Width = 71
              end
              item
                EditButtons = <>
                FieldName = 'PlanCreateTime'
                Footers = <>
                Title.Caption = 'Plan Create Time'
              end
              item
                EditButtons = <>
                FieldName = 'UpdateTime'
                Footers = <>
                Title.Caption = 'Update Time'
                Width = 65
              end>
          end
        end
      end
    end
    inherited pnlBodyRight: TPanel
      Top = 210
      Width = 863
      inherited GroupBox2: TGroupBox
        Width = 863
        inherited gridData2: TDBGridEh
          Width = 859
        end
      end
      inherited pnlBodyBottom: TPanel
        Width = 863
      end
    end
  end
  inherited PnlTop: TPanel
    Width = 1001
    inherited CoolBar1: TCoolBar
      Width = 1001
      Bands = <
        item
          Control = ToolBar1
          ImageIndex = -1
          Width = 1001
        end>
      inherited ToolBar1: TToolBar
        Width = 988
        inherited DBNavigator1: TDBNavigator
          Hints.Strings = ()
        end
      end
    end
  end
  inherited pnlBodyLeft: TPanel
    Height = 460
    inherited TreeView1: TTreeView
      Height = 428
    end
  end
  inherited ds_active: TDataSource
    Left = 114
    Top = 9
  end
  inherited PopupMenu1: TPopupMenu
    object N3: TMenuItem [7]
      Caption = '-'
    end
    object MenuEdtTO: TMenuItem [8]
      Caption = 'Edit Trading Order'
      OnClick = MenuEdtTOClick
    end
    object MenuBatchEdtTO: TMenuItem [9]
      Caption = 'Batch Edit Trading Order'
      OnClick = MenuBatchEdtTOClick
    end
    object MenuSplitOrder: TMenuItem [10]
      Caption = 'Split Order'
      OnClick = MenuSplitOrderClick
    end
    object MenuNewDemand: TMenuItem
      Caption = 'Change To New Demand'
      OnClick = MenuNewDemandClick
    end
    object MenuToSeller: TMenuItem
      Caption = 'Change To Seller'
      OnClick = MenuToSellerClick
    end
    object MenuSellerConfirm: TMenuItem
      Caption = 'Change To Seller Confirm'
      OnClick = MenuSellerConfirmClick
    end
    object MenuGoodsInTransit: TMenuItem
      Caption = 'Change To Goods In Transit'
      OnClick = MenuGoodsInTransitClick
    end
    object MenuGoodsOnHand: TMenuItem
      Caption = 'Change To Goods On Hand'
      OnClick = MenuGoodsOnHandClick
    end
    object MenuDeliveryPre: TMenuItem
      Caption = 'Change To Delivery Preparation'
      OnClick = MenuDeliveryPreClick
    end
    object MenuDelivery: TMenuItem
      Caption = 'Change To Delivery'
      OnClick = MenuDeliveryClick
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object MenuCancelDemanding: TMenuItem
      Caption = 'Cancel Demanding'
      OnClick = MenuCancelDemandingClick
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object MenuCSStatusToNewOrder: TMenuItem
      Caption = 'CS Status To  New Order'
      OnClick = MenuCSStatusToNewOrderClick
    end
    object MenuCSStatusToOpenOrder: TMenuItem
      Caption = 'CS Status To  Open Order'
      OnClick = MenuCSStatusToOpenOrderClick
    end
    object MenuCSStatusToConfirmOrder: TMenuItem
      Caption = 'CS Status To  Confirm Order'
      OnClick = MenuCSStatusToConfirmOrderClick
    end
  end
  inherited adt_active: TADODataSet
    CommandText = 'select * from ViewTradingOrder'
    Top = 8
  end
end
