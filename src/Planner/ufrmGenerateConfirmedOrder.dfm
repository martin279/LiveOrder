inherited frmGenerateConfirmedOrder: TfrmGenerateConfirmedOrder
  Caption = 'frmGenerateConfirmedOrder'
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
    inherited GroupBox1: TGroupBox
      inherited gridData: TDBGridEh
        Columns = <
          item
            EditButtons = <>
            FieldName = 'CustomerOrderID'
            Footers = <>
            Title.Caption = 'ID'
            Width = 35
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
            Width = 101
          end
          item
            EditButtons = <>
            FieldName = 'Model'
            Footers = <>
            Width = 109
          end
          item
            EditButtons = <>
            FieldName = 'CustomerOrderNumber'
            Footers = <>
            Title.Caption = 'Order No.'
          end
          item
            EditButtons = <>
            FieldName = 'CustomerOrderQuantity'
            Footers = <>
            Title.Caption = 'Order Qty.'
            Width = 55
          end
          item
            DisplayFormat = 'YYYY-mm-dd'
            EditButtons = <>
            FieldName = 'ContractDate'
            Footers = <>
            Title.Caption = 'Contract Date'
            Width = 96
          end
          item
            DisplayFormat = 'YYYY-mm-dd'
            EditButtons = <>
            FieldName = 'RTD'
            Footers = <>
            Width = 97
          end
          item
            DisplayFormat = 'YYYY-mm-dd'
            EditButtons = <>
            FieldName = 'ETD'
            Footers = <>
            Width = 106
          end
          item
            EditButtons = <>
            FieldName = 'Remark'
            Footers = <>
            Width = 75
          end
          item
            EditButtons = <>
            FieldName = 'CustomerOrderStatesName'
            Footers = <>
            Title.Caption = 'Order States'
          end>
      end
    end
    inherited GroupBox2: TGroupBox
      inherited gridData2: TDBGridEh
        Columns = <
          item
            EditButtons = <>
            FieldName = 'CustomerOrderID'
            Footers = <>
            Title.Caption = 'ID'
            Width = 41
          end
          item
            EditButtons = <>
            FieldName = 'CustomerNumber'
            Footers = <>
            Title.Caption = 'Customer No.'
            Width = 51
          end
          item
            EditButtons = <>
            FieldName = 'CustomerName'
            Footers = <>
            Title.Caption = 'Customer Name'
            Width = 113
          end
          item
            EditButtons = <>
            FieldName = 'Model'
            Footers = <>
            Width = 110
          end
          item
            EditButtons = <>
            FieldName = 'CustomerOrderNumber'
            Footers = <>
            Title.Caption = 'Order No.'
            Width = 60
          end
          item
            EditButtons = <>
            FieldName = 'CustomerOrderQuantity'
            Footers = <>
            Title.Caption = 'Order Qty.'
            Width = 54
          end
          item
            EditButtons = <>
            FieldName = 'ContractDate'
            Footers = <>
            Title.Caption = 'Contract Date'
            Width = 94
          end
          item
            EditButtons = <>
            FieldName = 'RTD'
            Footers = <>
            Width = 98
          end
          item
            EditButtons = <>
            FieldName = 'ETD'
            Footers = <>
            Width = 103
          end
          item
            EditButtons = <>
            FieldName = 'ReasonOfDelayDesc'
            Footers = <>
            Title.Caption = 'Reason Of Delay'
            Width = 122
          end
          item
            EditButtons = <>
            FieldName = 'Remark'
            Footers = <>
            Width = 89
          end
          item
            EditButtons = <>
            FieldName = 'CustomerOrderStatesName'
            Footers = <>
            Title.Caption = 'Order States'
            Width = 73
          end>
      end
    end
  end
  inherited PopupMenu1: TPopupMenu
    object N2: TMenuItem
      Caption = '-'
    end
    object MenuConfirmOrder: TMenuItem
      Caption = 'Confirm Order'
      OnClick = MenuConfirmOrderClick
    end
    object MenuBack: TMenuItem
      Caption = 'Back'
      OnClick = MenuBackClick
    end
  end
  inherited adt_active: TADODataSet
    object adt_activeCustomerOrderID: TAutoIncField
      FieldName = 'CustomerOrderID'
      ReadOnly = True
    end
    object adt_activeCustomerOrderNumber: TStringField
      FieldName = 'CustomerOrderNumber'
      Size = 10
    end
    object adt_activeMNumber: TStringField
      FieldName = 'MNumber'
      Size = 10
    end
    object adt_activeInvoiceNumber: TStringField
      FieldName = 'InvoiceNumber'
      Size = 10
    end
    object adt_activeCustomerID: TIntegerField
      FieldName = 'CustomerID'
    end
    object adt_activeModelID: TIntegerField
      FieldName = 'ModelID'
    end
    object adt_activeCurrency: TStringField
      FieldName = 'Currency'
      Size = 10
    end
    object adt_activePrice: TFloatField
      FieldName = 'Price'
    end
    object adt_activeCustomerOrderQuantity: TFloatField
      FieldName = 'CustomerOrderQuantity'
    end
    object adt_activeTotalAmount: TFloatField
      FieldName = 'TotalAmount'
    end
    object adt_activeContractDate: TDateTimeField
      FieldName = 'ContractDate'
    end
    object adt_activeRTD: TDateTimeField
      FieldName = 'RTD'
    end
    object adt_activeETD: TDateTimeField
      FieldName = 'ETD'
    end
    object adt_activeATD: TDateTimeField
      FieldName = 'ATD'
    end
    object adt_activeETA: TDateTimeField
      FieldName = 'ETA'
    end
    object adt_activeATA: TDateTimeField
      FieldName = 'ATA'
    end
    object adt_activeRemark: TStringField
      FieldName = 'Remark'
      Size = 30
    end
    object adt_activeCustomerPurchaseOrderNumber: TStringField
      FieldName = 'CustomerPurchaseOrderNumber'
      Size = 50
    end
    object adt_activeReasonOfDelayID: TIntegerField
      FieldName = 'ReasonOfDelayID'
    end
    object adt_activeCustomerOrderStatesID: TIntegerField
      FieldName = 'CustomerOrderStatesID'
    end
    object adt_activeCustomerNumber: TStringField
      FieldName = 'CustomerNumber'
      Size = 10
    end
    object adt_activeCustomerName: TStringField
      FieldName = 'CustomerName'
      Size = 40
    end
    object adt_activePlantID: TIntegerField
      FieldName = 'PlantID'
    end
    object adt_activeModel: TStringField
      FieldName = 'Model'
      Size = 25
    end
    object adt_activePlantCode: TStringField
      FieldName = 'PlantCode'
      Size = 2
    end
    object adt_activeCustomerOrderStatesName: TStringField
      FieldName = 'CustomerOrderStatesName'
      Size = 15
    end
    object adt_activeReasonOfDelayDesc: TStringField
      FieldName = 'ReasonOfDelayDesc'
      Size = 50
    end
  end
  inherited adt_active2: TADODataSet
    object adt_active2CustomerOrderID: TAutoIncField
      FieldName = 'CustomerOrderID'
      ReadOnly = True
    end
    object adt_active2CustomerOrderNumber: TStringField
      FieldName = 'CustomerOrderNumber'
      Size = 10
    end
    object adt_active2MNumber: TStringField
      FieldName = 'MNumber'
      Size = 10
    end
    object adt_active2InvoiceNumber: TStringField
      FieldName = 'InvoiceNumber'
      Size = 10
    end
    object adt_active2CustomerID: TIntegerField
      FieldName = 'CustomerID'
    end
    object adt_active2ModelID: TIntegerField
      FieldName = 'ModelID'
    end
    object adt_active2Currency: TStringField
      FieldName = 'Currency'
      Size = 10
    end
    object adt_active2Price: TFloatField
      FieldName = 'Price'
    end
    object adt_active2CustomerOrderQuantity: TFloatField
      FieldName = 'CustomerOrderQuantity'
    end
    object adt_active2TotalAmount: TFloatField
      FieldName = 'TotalAmount'
    end
    object adt_active2ContractDate: TDateTimeField
      FieldName = 'ContractDate'
    end
    object adt_active2RTD: TDateTimeField
      FieldName = 'RTD'
    end
    object adt_active2ETD: TDateTimeField
      FieldName = 'ETD'
    end
    object adt_active2ATD: TDateTimeField
      FieldName = 'ATD'
    end
    object adt_active2ETA: TDateTimeField
      FieldName = 'ETA'
    end
    object adt_active2ATA: TDateTimeField
      FieldName = 'ATA'
    end
    object adt_active2Remark: TStringField
      FieldName = 'Remark'
      Size = 30
    end
    object adt_active2CustomerPurchaseOrderNumber: TStringField
      FieldName = 'CustomerPurchaseOrderNumber'
      Size = 50
    end
    object adt_active2ReasonOfDelayID: TIntegerField
      FieldName = 'ReasonOfDelayID'
    end
    object adt_active2CustomerOrderStatesID: TIntegerField
      FieldName = 'CustomerOrderStatesID'
    end
    object adt_active2CustomerNumber: TStringField
      FieldName = 'CustomerNumber'
      Size = 10
    end
    object adt_active2CustomerName: TStringField
      FieldName = 'CustomerName'
      Size = 40
    end
    object adt_active2PlantID: TIntegerField
      FieldName = 'PlantID'
    end
    object adt_active2Model: TStringField
      FieldName = 'Model'
      Size = 25
    end
    object adt_active2PlantCode: TStringField
      FieldName = 'PlantCode'
      Size = 2
    end
    object adt_active2CustomerOrderStatesName: TStringField
      FieldName = 'CustomerOrderStatesName'
      Size = 15
    end
    object adt_active2ReasonOfDelayDesc: TStringField
      FieldName = 'ReasonOfDelayDesc'
      Size = 50
    end
  end
  object adt_delay: TADODataSet
    Parameters = <>
    Left = 432
    Top = 49
  end
end
