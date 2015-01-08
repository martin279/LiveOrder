inherited frmCustomerOrderProcess: TfrmCustomerOrderProcess
  Left = 438
  Caption = 'frmCustomerOrderProcess'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBody: TPanel
    inherited Splitter2: TSplitter
      Top = 126
      Height = 8
    end
    inherited pnlBodyRight: TPanel [1]
      Top = 134
      Height = 242
      inherited GroupBox2: TGroupBox
        Height = 177
        inherited gridData2: TDBGridEh
          Height = 160
          OnDblClick = MenuEdtCOClick
          Columns = <
            item
              EditButtons = <>
              FieldName = 'CustomerOrderID'
              Footers = <>
              Title.Caption = 'ID'
              Width = 34
            end
            item
              EditButtons = <>
              FieldName = 'CustomerOrderStatesName'
              Footers = <>
              Title.Caption = 'Order States'
              Width = 48
            end
            item
              EditButtons = <>
              FieldName = 'CustomerNumber'
              Footers = <>
              Title.Caption = 'Customer Code'
              Width = 44
            end
            item
              EditButtons = <>
              FieldName = 'CustomerName'
              Footers = <>
              Title.Caption = 'Customer Name'
              Width = 66
            end
            item
              EditButtons = <>
              FieldName = 'Model'
              Footers = <>
              Width = 108
            end
            item
              EditButtons = <>
              FieldName = 'ModelDescription'
              Footers = <>
              Title.Caption = 'Model Desc.'
              Width = 38
            end
            item
              EditButtons = <>
              FieldName = 'InvoiceNumber'
              Footers = <>
              Title.Caption = 'Invoice No.'
              Width = 51
            end
            item
              EditButtons = <>
              FieldName = 'MNumber'
              Footers = <>
              Title.Caption = 'M No.'
              Width = 44
            end
            item
              EditButtons = <>
              FieldName = 'CustomerOrderNumber'
              Footers = <>
              Title.Caption = 'Order No.'
              Width = 48
            end
            item
              EditButtons = <>
              FieldName = 'CustomerOrderQuantity'
              Footers = <>
              Title.Caption = 'Order Qty.'
              Width = 32
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
              Title.Caption = 'Total Amount'
            end
            item
              EditButtons = <>
              FieldName = 'Payment'
              Footers = <>
            end
            item
              EditButtons = <>
              FieldName = 'Currency'
              Footers = <>
              Width = 35
            end
            item
              DisplayFormat = 'YYYY-mm-dd'
              EditButtons = <>
              FieldName = 'ContractDate'
              Footers = <>
              Title.Caption = 'Contract Date'
              Width = 58
            end
            item
              DisplayFormat = 'YYYY-mm-dd'
              EditButtons = <>
              FieldName = 'RTD'
              Footers = <>
              Width = 58
            end
            item
              DisplayFormat = 'YYYY-mm-dd'
              EditButtons = <>
              FieldName = 'ETD'
              Footers = <>
              Width = 58
            end
            item
              DisplayFormat = 'YYYY-mm-dd'
              EditButtons = <>
              FieldName = 'ATD'
              Footers = <>
              Width = 58
            end
            item
              EditButtons = <>
              FieldName = 'ModelInvolved'
              Footers = <>
              Title.Caption = 'Model Involved'
            end
            item
              EditButtons = <>
              FieldName = 'Remark'
              Footers = <>
              Width = 62
            end
            item
              EditButtons = <>
              FieldName = 'CustomerPurchaseOrderNumber'
              Footers = <>
              Title.Caption = 'Customer PO No.'
              Width = 87
            end
            item
              EditButtons = <>
              FieldName = 'PlantCode'
              Footers = <>
              Title.Caption = 'Plant Code'
              Width = 32
            end
            item
              EditButtons = <>
              FieldName = 'BusinessApplicationName'
              Footers = <>
              Title.Caption = 'Business Application'
            end
            item
              EditButtons = <>
              FieldName = 'ReasonOfDelayDesc'
              Footers = <>
              Title.Caption = 'Reason Of Delay'
              Width = 82
            end
            item
              EditButtons = <>
              FieldName = 'ReasonOfDelayRemark'
              Footers = <>
              Title.Caption = 'Delay Remark'
              Width = 50
            end
            item
              DisplayFormat = 'YYYY-mm-dd hh:mm'
              EditButtons = <>
              FieldName = 'COGenerateTime'
              Footers = <>
              Title.Caption = 'Order Generate Time'
              Width = 100
            end
            item
              DisplayFormat = 'YYYY-mm-dd hh:mm'
              EditButtons = <>
              FieldName = 'COConfirmedTime'
              Footers = <>
              Title.Caption = 'Order Confirmed Time'
              Width = 100
            end
            item
              EditButtons = <>
              FieldName = 'OINQCOQuantity'
              Footers = <>
              Title.Caption = 'OINQ Order Quantity'
            end
            item
              EditButtons = <>
              FieldName = 'OINQReleaseCOQuantity'
              Footers = <>
              Title.Caption = 'OINQ Release Quantity'
              Width = 79
            end
            item
              EditButtons = <>
              FieldName = 'ActualReleaseCOQuantity'
              Footers = <>
              Title.Caption = 'Actual Release CO Qty.'
              Width = 87
            end
            item
              EditButtons = <>
              FieldName = 'DisplayName'
              Footers = <>
              Title.Caption = 'Creator'
              Width = 80
            end
            item
              DisplayFormat = 'YYYY-mm-dd'
              EditButtons = <>
              FieldName = 'ETA'
              Footers = <>
              Width = 70
            end
            item
              DisplayFormat = 'YYYY-mm-dd'
              EditButtons = <>
              FieldName = 'ATA'
              Footers = <>
              Width = 70
            end
            item
              EditButtons = <>
              FieldName = 'CustomerID'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'ModelID'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'CustomerOrderStatesID'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'ReasonOfDelayID'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'PlantID'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'LoginID'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'Origin'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'Country'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'ChineseName'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'PlantID2'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'BusinessApplicationID'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'Freight'
              Footers = <>
              Width = 60
            end
            item
              EditButtons = <>
              FieldName = 'Destination'
              Footers = <>
              Width = 200
            end
            item
              EditButtons = <>
              FieldName = 'ProductSeriesID'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'ProductSeriesName'
              Footers = <>
              Title.Caption = 'Product Series'
            end
            item
              EditButtons = <>
              FieldName = 'ProductFamilyName'
              Footers = <>
              Title.Caption = 'Product Family'
              Width = 98
            end
            item
              EditButtons = <>
              FieldName = 'ProductClassification'
              Footers = <>
              Title.Caption = 'Product Classification'
              Width = 69
            end>
        end
      end
      inherited pnlBodyBottom: TPanel
        Top = 177
        Height = 65
        object pageCtrlOP: TPageControl
          Left = 2
          Top = 2
          Width = 538
          Height = 61
          ActivePage = tbsMF
          Align = alClient
          TabOrder = 0
          object tbsMF: TTabSheet
            Caption = 'Mainframe'
            object gboxMF: TGroupBox
              Left = 1
              Top = -5
              Width = 376
              Height = 36
              TabOrder = 0
              object btnUpload: TButton
                Left = 312
                Top = 7
                Width = 57
                Height = 25
                Caption = 'Upload'
                TabOrder = 0
                OnClick = btnUploadClick
              end
              object cbbMFType: TComboBox
                Left = 3
                Top = 10
                Width = 90
                Height = 21
                BevelInner = bvLowered
                BevelKind = bkFlat
                Style = csDropDownList
                ItemHeight = 13
                TabOrder = 1
                OnChange = cbbMFTypeChange
              end
              object cbbMFTypeDetail: TComboBox
                Left = 97
                Top = 10
                Width = 209
                Height = 21
                BevelInner = bvLowered
                BevelKind = bkFlat
                Style = csDropDownList
                ItemHeight = 13
                TabOrder = 2
                OnChange = cbbMFTypeDetailChange
              end
            end
            object gboxMF2: TGroupBox
              Left = 379
              Top = -5
              Width = 110
              Height = 35
              TabOrder = 1
              object LabelMFAttach: TLabel
                Left = 3
                Top = 6
                Width = 35
                Height = 26
                Caption = 'Freight Cost'
                WordWrap = True
              end
              object edtMFAttach: TEdit
                Left = 40
                Top = 8
                Width = 65
                Height = 21
                TabOrder = 0
              end
            end
          end
          object tbsForm: TTabSheet
            Caption = 'Form'
            ImageIndex = 1
            object gboxForm: TGroupBox
              Left = 1
              Top = -5
              Width = 160
              Height = 36
              TabOrder = 0
              object btnGenerateForm: TButton
                Left = 98
                Top = 8
                Width = 57
                Height = 25
                Caption = 'Generate'
                TabOrder = 0
                OnClick = btnGenerateFormClick
              end
              object cbbFormType: TComboBox
                Left = 3
                Top = 10
                Width = 90
                Height = 21
                BevelInner = bvLowered
                BevelKind = bkFlat
                Style = csDropDownList
                ItemHeight = 13
                TabOrder = 1
                OnChange = cbbFormTypeChange
              end
            end
            object gboxForm2: TGroupBox
              Left = 163
              Top = -5
              Width = 145
              Height = 36
              TabOrder = 1
              object LabelForm: TLabel
                Left = 6
                Top = 8
                Width = 32
                Height = 26
                Caption = 'Freight Cost'
                WordWrap = True
              end
              object edtForm: TEdit
                Left = 44
                Top = 9
                Width = 95
                Height = 21
                TabOrder = 0
              end
            end
            object btnPreview: TButton
              Left = 322
              Top = 4
              Width = 57
              Height = 25
              Caption = 'Preview'
              TabOrder = 2
              OnClick = btnPreviewClick
            end
          end
        end
      end
    end
    inherited PageControl1: TPageControl [2]
      Height = 126
      inherited tbsBody1: TTabSheet
        Caption = 'CO'
        inherited GroupBox1: TGroupBox
          Height = 95
          inherited gridData: TDBGridEh
            Height = 78
            OnDblClick = MenuEdtCOClick
            Columns = <
              item
                EditButtons = <>
                FieldName = 'CustomerOrderID'
                Footers = <>
                Title.Caption = 'ID'
                Width = 36
              end
              item
                EditButtons = <>
                FieldName = 'CustomerOrderStatesName'
                Footers = <>
                Title.Caption = 'Order States'
                Width = 46
              end
              item
                EditButtons = <>
                FieldName = 'CustomerNumber'
                Footers = <>
                Title.Caption = 'Customer Code'
                Width = 44
              end
              item
                EditButtons = <>
                FieldName = 'CustomerName'
                Footers = <>
                Title.Caption = 'Customer Name'
                Width = 80
              end
              item
                EditButtons = <>
                FieldName = 'Model'
                Footers = <>
                Width = 106
              end
              item
                EditButtons = <>
                FieldName = 'ModelDescription'
                Footers = <>
                Title.Caption = 'Model Desc.'
                Width = 34
              end
              item
                EditButtons = <>
                FieldName = 'ModelChineseDescription'
                Footers = <>
                Title.Caption = 'Model Chinese Desc.'
                Width = 73
              end
              item
                EditButtons = <>
                FieldName = 'InvoiceNumber'
                Footers = <>
                Title.Caption = 'Invoice No.'
                Width = 53
              end
              item
                EditButtons = <>
                FieldName = 'MNumber'
                Footers = <>
                Title.Caption = 'M No.'
                Width = 45
              end
              item
                EditButtons = <>
                FieldName = 'CustomerOrderNumber'
                Footers = <>
                Title.Caption = 'Order No.'
                Width = 47
              end
              item
                EditButtons = <>
                FieldName = 'CustomerOrderQuantity'
                Footers = <>
                Title.Caption = 'Order Qty.'
                Width = 33
              end
              item
                EditButtons = <>
                FieldName = 'Currency'
                Footers = <>
                Width = 35
              end
              item
                EditButtons = <>
                FieldName = 'Price'
                Footers = <>
                Width = 31
              end
              item
                EditButtons = <>
                FieldName = 'TotalAmount'
                Footers = <>
                Title.Caption = 'Total Amount'
                Width = 41
              end
              item
                DisplayFormat = 'YYYY-mm-dd'
                EditButtons = <>
                FieldName = 'ContractDate'
                Footers = <>
                Title.Caption = 'Contract Date'
                Width = 58
              end
              item
                DisplayFormat = 'YYYY-mm-dd'
                EditButtons = <>
                FieldName = 'RTD'
                Footers = <>
                Width = 58
              end
              item
                DisplayFormat = 'YYYY-mm-dd'
                EditButtons = <>
                FieldName = 'ETD'
                Footers = <>
                Width = 58
              end
              item
                DisplayFormat = 'YYYY-mm-dd'
                EditButtons = <>
                FieldName = 'ATD'
                Footers = <>
                Width = 58
              end
              item
                EditButtons = <>
                FieldName = 'PlantCode'
                Footers = <>
                Title.Caption = 'Plant Code'
                Width = 29
              end
              item
                EditButtons = <>
                FieldName = 'BusinessApplicationName'
                Footers = <>
                Title.Caption = 'Business Application'
                Width = 54
              end
              item
                EditButtons = <>
                FieldName = 'IsSplitOrder'
                Footers = <>
                Title.Caption = 'Is Split Order'
                Width = 37
              end
              item
                EditButtons = <>
                FieldName = 'Payment'
                Footers = <>
                Width = 100
              end
              item
                EditButtons = <>
                FieldName = 'Remark'
                Footers = <>
                Width = 108
              end
              item
                EditButtons = <>
                FieldName = 'CustomerPurchaseOrderNumber'
                Footers = <>
                Title.Caption = 'Customer PO No.'
                Width = 68
              end
              item
                EditButtons = <>
                FieldName = 'ReasonOfDelayDesc'
                Footers = <>
                Title.Caption = 'Reason Of Delay'
                Width = 65
              end
              item
                EditButtons = <>
                FieldName = 'ReasonOfDelayRemark'
                Footers = <>
                Title.Caption = 'Delay Remark'
                Width = 53
              end
              item
                DisplayFormat = 'YYYY-mm-dd hh:mm'
                EditButtons = <>
                FieldName = 'COGenerateTime'
                Footers = <>
                Title.Caption = 'Order Generate Time'
                Width = 96
              end
              item
                DisplayFormat = 'YYYY-mm-dd hh:mm'
                EditButtons = <>
                FieldName = 'COConfirmedTime'
                Footers = <>
                Title.Caption = 'Order Confirmed Time'
                Width = 91
              end
              item
                EditButtons = <>
                FieldName = 'OINQCOQuantity'
                Footers = <>
                Title.Caption = 'OINQ Order Quantity'
              end
              item
                EditButtons = <>
                FieldName = 'OINQReleaseCOQuantity'
                Footers = <>
                Title.Caption = 'OINQ Release Quantity'
                Width = 74
              end
              item
                EditButtons = <>
                FieldName = 'ActualReleaseCOQuantity'
                Footers = <>
                Title.Caption = 'Actual Release CO Qty.'
                Width = 89
              end
              item
                EditButtons = <>
                FieldName = 'DisplayName'
                Footers = <>
                Title.Caption = 'Creator'
                Width = 80
              end
              item
                DisplayFormat = 'YYYY-mm-dd'
                EditButtons = <>
                FieldName = 'ETA'
                Footers = <>
                Width = 70
              end
              item
                DisplayFormat = 'YYYY-mm-dd'
                EditButtons = <>
                FieldName = 'ATA'
                Footers = <>
                Width = 70
              end
              item
                EditButtons = <>
                FieldName = 'Origin'
                Footers = <>
                Visible = False
              end
              item
                EditButtons = <>
                FieldName = 'Country'
                Footers = <>
                Visible = False
              end
              item
                EditButtons = <>
                FieldName = 'ChineseName'
                Footers = <>
                Visible = False
              end
              item
                EditButtons = <>
                FieldName = 'Freight'
                Footers = <>
                Width = 66
              end
              item
                EditButtons = <>
                FieldName = 'Forwarder'
                Footers = <>
                Width = 50
              end
              item
                EditButtons = <>
                FieldName = 'Destination'
                Footers = <>
                Width = 63
              end
              item
                EditButtons = <>
                FieldName = 'ModelInvolved'
                Footers = <>
                Title.Caption = 'Model Involved'
                Width = 117
              end
              item
                EditButtons = <>
                FieldName = 'IsPrintInvoice'
                Footers = <>
                Title.Caption = 'Is Print Invoice'
                Width = 48
              end
              item
                EditButtons = <>
                FieldName = 'ProductSeriesName'
                Footers = <>
                Title.Caption = 'Product Series'
                Width = 45
              end
              item
                EditButtons = <>
                FieldName = 'ProductFamilyName'
                Footers = <>
                Title.Caption = 'Product Family'
                Width = 63
              end
              item
                EditButtons = <>
                FieldName = 'ProductClassification'
                Footers = <>
                Title.Caption = 'Product Classification'
                Width = 25
              end
              item
                EditButtons = <>
                FieldName = 'IsKeyOrder'
                Footers = <>
                Title.Caption = 'Is Key Order'
              end
              item
                EditButtons = <>
                FieldName = 'Instruction'
                Footers = <>
                Width = 84
              end
              item
                EditButtons = <>
                FieldName = 'supplier'
                Footers = <>
                Title.Caption = 'Supplier'
                Width = 68
              end
              item
                EditButtons = <>
                FieldName = 'commodityinspection'
                Footers = <>
                Title.Caption = 'Commodity Inspection'
                Width = 54
              end
              item
                EditButtons = <>
                FieldName = 'note'
                Footers = <>
                Title.Caption = 'Note'
                Width = 97
              end
              item
                EditButtons = <>
                FieldName = 'UploadMainframeTime'
                Footers = <>
                Title.Caption = 'Upload Mainframe Time'
                Width = 84
              end
              item
                EditButtons = <>
                FieldName = 'CancelOrderTime'
                Footers = <>
                Title.Caption = 'Cancel Order Time'
                Width = 59
              end
              item
                EditButtons = <>
                FieldName = 'CommunicatorName'
                Footers = <>
                Title.Caption = 'Communicator'
              end
              item
                EditButtons = <>
                FieldName = 'DemandManagingRCED'
                Footers = <>
                Title.Caption = 'Demand Managing RCED'
                Width = 85
              end
              item
                EditButtons = <>
                FieldName = 'DemandManagingSalesMonth'
                Footers = <>
                Title.Caption = 'Sales Month'
                Width = 46
              end
              item
                EditButtons = <>
                FieldName = 'DemandManagingDMMMonth'
                Footers = <>
                Title.Caption = 'DMM Month'
                Width = 49
              end
              item
                EditButtons = <>
                FieldName = 'LogisticInActArriveWarehouseDate'
                Footers = <>
                Title.Caption = 'Act. Arrive Warehouse Date'
                Width = 88
              end
              item
                EditButtons = <>
                FieldName = 'IsStockDone'
                Footers = <>
                Title.Caption = 'Is Stock Done'
                Width = 44
              end
              item
                EditButtons = <>
                FieldName = 'PlanCreateTime'
                Footers = <>
                Title.Caption = 'Plan Create Time'
                Width = 63
              end
              item
                EditButtons = <>
                FieldName = 'ForwarderPickupDateAct'
                Footers = <>
                Title.Caption = 'Forwarder Pickup Date Act.'
                Width = 85
              end
              item
                EditButtons = <>
                FieldName = 'DeliveryETDEst'
                Footers = <>
                Title.Caption = 'Delivery ETD Est.'
                Width = 52
              end
              item
                EditButtons = <>
                FieldName = 'DeliveryOnboardAct'
                Footers = <>
                Title.Caption = 'Delivery Onboard Act.'
                Width = 69
              end
              item
                EditButtons = <>
                FieldName = 'DeliveryETAAct'
                Footers = <>
                Title.Caption = 'Delivery ETA Act.'
                Width = 61
              end
              item
                EditButtons = <>
                FieldName = 'Incoterms'
                Footers = <>
                Width = 73
              end
              item
                EditButtons = <>
                FieldName = 'LogisticRemark'
                Footers = <>
                Title.Caption = 'Logistic Remark'
                Width = 57
              end
              item
                EditButtons = <>
                FieldName = 'ShippingScheduleStatusName'
                Footers = <>
                Title.Caption = 'Shipping Schedule Status'
                Width = 87
              end
              item
                EditButtons = <>
                FieldName = 'StatusToOpenOrderTime'
                Footers = <>
                Title.Caption = 'Status To Open Order Time'
              end
              item
                EditButtons = <>
                FieldName = 'IsLogbook'
                Footers = <>
                Title.Caption = 'Is Logbook'
              end
              item
                EditButtons = <>
                FieldName = 'IsBonded'
                Footers = <>
                Title.Caption = 'Is Bonded'
              end>
          end
        end
      end
    end
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
  inherited PropStorageEh1: TPropStorageEh
    StoredProps.Strings = (
      '<P>.ActiveControl'
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width'
      
        'pnlBody.PageControl1.tbsBody1.GroupBox1.gridData.<P>.Columns.Col' +
        'umnsIndex'
      
        'pnlBody.PageControl1.tbsBody1.GroupBox1.gridData.<P>.Columns.<Fo' +
        'rAllItems>.Width'
      
        'pnlBody.pnlBodyRight.GroupBox2.gridData2.<P>.Columns.ColumnsInde' +
        'x'
      
        'pnlBody.pnlBodyRight.GroupBox2.gridData2.<P>.Columns.<ForAllItem' +
        's>.Width')
  end
  inherited PopupMenu1: TPopupMenu
    Left = 640
    Top = 4
    object MenuAddCOComments: TMenuItem
      Caption = 'Add CO Comments'
      OnClick = MenuAddCOCommentsClick
    end
    object MenuCancelCO: TMenuItem
      Caption = 'Cancel Select Order'
      OnClick = MenuCancelCOClick
    end
    object N6: TMenuItem
      Caption = '-'
    end
    object MenuEdtCO: TMenuItem
      Caption = 'Edit Customer Order'
      OnClick = MenuEdtCOClick
    end
    object MenuBatchEdtCO: TMenuItem
      Caption = 'Batch Edit Customer Order'
      OnClick = MenuBatchEdtCOClick
    end
    object MenuSplitOrder: TMenuItem
      Caption = 'Split Order'
      OnClick = MenuSplitOrderClick
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object MenuNewOrder: TMenuItem
      Caption = 'Change To New Order'
      OnClick = MenuNewOrderClick
    end
    object MenuOpenOrder: TMenuItem
      Caption = 'Change To Open Order'
      OnClick = MenuOpenOrderClick
    end
    object MenuConfirmOrder: TMenuItem
      Caption = 'Change To Confirm Order'
      OnClick = MenuConfirmOrderClick
    end
    object MenuReleaseOrder: TMenuItem
      Caption = 'Change To Release Order'
      OnClick = MenuReleaseOrderClick
    end
    object MenuShippingOrder: TMenuItem
      Caption = 'Change To Shipping Order'
      OnClick = MenuShippingOrderClick
    end
    object MenuShippedOrder: TMenuItem
      Caption = 'Change To Shipped Order'
      OnClick = MenuShippedOrderClick
    end
    object MenuPaidOrder: TMenuItem
      Caption = 'Change To Paid Order'
      OnClick = MenuPaidOrderClick
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object MenuWaitingShipment: TMenuItem
      Caption = 'Waiting Shipment'
      OnClick = MenuWaitingShipmentClick
    end
    object MenuConfirmedShipment: TMenuItem
      Caption = 'Confirmed Shipment'
      OnClick = MenuConfirmedShipmentClick
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object MenuSelectForScheduling: TMenuItem
      Caption = 'Select For Scheduling'
      OnClick = MenuSelectForSchedulingClick
    end
    object MenuSelectForOperation: TMenuItem
      Caption = 'Select For Operation'
      OnClick = MenuSelectForOperationClick
    end
  end
  inherited adt_active: TADODataSet
    CursorType = ctStatic
    BeforeDelete = adt_activeBeforeDelete
    CommandText = 'select * from ViewCustomerOrder'
    Top = 0
  end
  inherited adt_active2: TADODataSet
    CommandText = 'select * from ViewCustomerOrder'
    Left = 162
  end
  object WordDocument1: TWordDocument
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 402
    Top = 36
  end
  object WordApplication1: TWordApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 450
    Top = 41
  end
  object WordFont1: TWordFont
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 482
    Top = 41
  end
end
