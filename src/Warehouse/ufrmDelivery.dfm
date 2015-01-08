inherited frmDelivery: TfrmDelivery
  Left = 431
  Top = 153
  Width = 812
  Caption = 'frmDelivery'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBottom: TPanel
    Width = 796
  end
  inherited pnlBody: TPanel
    Width = 796
    inherited Splitter1: TSplitter
      Top = 172
      Width = 796
      Height = 8
    end
    inherited PageControl1: TPageControl
      Width = 796
      Height = 172
      inherited tbsBody1: TTabSheet
        inherited GroupBox1: TGroupBox
          Top = 41
          Width = 385
          Height = 100
          Align = alLeft
          Caption = 'Shipping Order'
          inherited gridData: TDBGridEh
            Width = 381
            Height = 83
            OnCellClick = gridDataCellClick
            Columns = <
              item
                EditButtons = <>
                FieldName = 'InvoiceNumber'
                Footers = <>
                Title.Caption = 'Invoice No.'
              end
              item
                EditButtons = <>
                FieldName = 'ForwarderName'
                Footers = <>
                Title.Caption = 'Forwarder'
              end
              item
                EditButtons = <>
                FieldName = 'FreightCost'
                Footers = <>
                Title.Caption = 'Freight Cost'
              end
              item
                EditButtons = <>
                FieldName = 'ATD'
                Footers = <>
                Width = 105
              end
              item
                EditButtons = <>
                FieldName = 'IsShipped'
                Footers = <>
                ReadOnly = True
                Title.Caption = 'Is Shipped'
                Width = 54
              end>
          end
        end
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 788
          Height = 41
          Align = alTop
          TabOrder = 1
          object btnQuery: TButton
            Left = 256
            Top = 6
            Width = 75
            Height = 25
            Caption = 'Query'
            TabOrder = 0
            OnClick = btnQueryClick
          end
          object chkInvoiceNum: TCheckBox
            Left = 8
            Top = 10
            Width = 77
            Height = 16
            Caption = 'Invoice No.'
            TabOrder = 1
          end
          object edtInvoiceNum: TEdit
            Left = 88
            Top = 8
            Width = 121
            Height = 21
            TabOrder = 2
            OnKeyPress = edtInvoiceNumKeyPress
          end
        end
        object GroupBox3: TGroupBox
          Left = 505
          Top = 41
          Width = 283
          Height = 100
          Align = alClient
          Caption = 'Shipped Order'
          TabOrder = 2
          object gridData3: TDBGridEh
            Left = 2
            Top = 15
            Width = 279
            Height = 83
            Align = alClient
            DataSource = ds_active3
            Flat = True
            FooterColor = clWindow
            FooterFont.Charset = DEFAULT_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -11
            FooterFont.Name = 'MS Sans Serif'
            FooterFont.Style = []
            PopupMenu = PopupMenu1
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnCellClick = gridData3CellClick
            OnEnter = gridData3Enter
            Columns = <
              item
                EditButtons = <>
                FieldName = 'InvoiceNumber'
                Footers = <>
                Title.Caption = 'Invoice No.'
              end
              item
                EditButtons = <>
                FieldName = 'ForwarderName'
                Footers = <>
                Title.Caption = 'Forwarder'
              end
              item
                EditButtons = <>
                FieldName = 'FreightCost'
                Footers = <>
                Title.Caption = 'Freight Cost'
              end
              item
                EditButtons = <>
                FieldName = 'ATD'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'IsShipped'
                Footers = <>
                ReadOnly = True
                Title.Caption = 'Is Shipped'
                Width = 55
              end>
          end
        end
        object Panel2: TPanel
          Left = 385
          Top = 41
          Width = 120
          Height = 100
          Align = alLeft
          TabOrder = 3
          object btnUpload: TButton
            Left = 21
            Top = 16
            Width = 75
            Height = 25
            Caption = 'Upload'
            TabOrder = 0
            OnClick = btnUploadClick
          end
        end
      end
    end
    inherited GroupBox2: TGroupBox
      Top = 180
      Width = 796
      Height = 196
      Caption = 'Order Detail'
      inherited gridData2: TDBGridEh
        Width = 792
        Height = 179
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
            Width = 66
          end
          item
            EditButtons = <>
            FieldName = 'InvoiceNumber'
            Footers = <>
            Title.Caption = 'Invoice No.'
            Width = 62
          end
          item
            EditButtons = <>
            FieldName = 'ATD'
            Footers = <>
            Width = 89
          end
          item
            EditButtons = <>
            FieldName = 'PlantCode'
            Footers = <>
            Title.Caption = 'Plant'
            Width = 41
          end
          item
            EditButtons = <>
            FieldName = 'BusinessApplicationName'
            Footers = <>
            Title.Caption = 'Application'
            Width = 54
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
            Width = 50
          end
          item
            EditButtons = <>
            FieldName = 'CustomerNumber'
            Footers = <>
            Title.Caption = 'Customer Code'
            Width = 39
          end
          item
            EditButtons = <>
            FieldName = 'CustomerName'
            Footers = <>
            Title.Caption = 'Customer Name'
            Width = 92
          end
          item
            EditButtons = <>
            FieldName = 'Model'
            Footers = <>
            Width = 94
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
            FieldName = 'CustomerOrderQuantity'
            Footers = <>
            Title.Caption = 'Order Qty.'
            Width = 33
          end
          item
            EditButtons = <>
            FieldName = 'ContractDate'
            Footers = <>
            Title.Caption = 'Contract Date'
            Width = 89
          end
          item
            EditButtons = <>
            FieldName = 'RTD'
            Footers = <>
            Width = 89
          end
          item
            EditButtons = <>
            FieldName = 'ETD'
            Footers = <>
            Width = 89
          end
          item
            EditButtons = <>
            FieldName = 'Remark'
            Footers = <>
            Width = 75
          end
          item
            EditButtons = <>
            FieldName = 'CustomerPurchaseOrderNumber'
            Footers = <>
            Title.Caption = 'Customer PO No.'
            Width = 62
          end
          item
            EditButtons = <>
            FieldName = 'DisplayName'
            Footers = <>
            Title.Caption = 'Creator'
            Width = 70
          end>
      end
    end
  end
  inherited PnlTop: TPanel
    Width = 796
    inherited CoolBar1: TCoolBar
      Width = 796
      Bands = <
        item
          Control = ToolBar1
          ImageIndex = -1
          Width = 796
        end>
      inherited ToolBar1: TToolBar
        Width = 783
        inherited DBNavigator1: TDBNavigator
          Hints.Strings = ()
        end
      end
    end
  end
  inherited PopupMenu1: TPopupMenu
    object N2: TMenuItem
      Caption = '-'
    end
    object MenuShip: TMenuItem
      Caption = 'Ship'
      OnClick = MenuShipClick
    end
    object MenuBack: TMenuItem
      Caption = 'Back'
      OnClick = MenuBackClick
    end
    object MenuSelectForShip: TMenuItem
      Caption = 'Select For Ship'
      OnClick = MenuSelectForShipClick
    end
  end
  inherited adt_active: TADODataSet
    object adt_activeCustomerOrderInvoiceID: TAutoIncField
      FieldName = 'CustomerOrderInvoiceID'
      ReadOnly = True
    end
    object adt_activeInvoiceNumber: TStringField
      FieldName = 'InvoiceNumber'
      Size = 10
    end
    object adt_activeForwarderName: TStringField
      FieldName = 'ForwarderName'
      Size = 10
    end
    object adt_activeFreightCost: TFloatField
      FieldName = 'FreightCost'
    end
    object adt_activeATD: TDateTimeField
      FieldName = 'ATD'
    end
    object adt_activeIsShipped: TBooleanField
      FieldName = 'IsShipped'
    end
  end
  inherited adt_active2: TADODataSet
    CommandText = 'select * from ViewCustomerOrder'
    object adt_active2CustomerOrderID: TAutoIncField
      FieldName = 'CustomerOrderID'
      ReadOnly = True
    end
    object adt_active2CustomerOrderNumber: TStringField
      FieldName = 'CustomerOrderNumber'
    end
    object adt_active2MNumber: TStringField
      FieldName = 'MNumber'
    end
    object adt_active2InvoiceNumber: TStringField
      FieldName = 'InvoiceNumber'
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
    object adt_active2Price: TBCDField
      FieldName = 'Price'
      Precision = 18
      Size = 2
    end
    object adt_active2CustomerOrderQuantity: TFloatField
      FieldName = 'CustomerOrderQuantity'
    end
    object adt_active2TotalAmount: TBCDField
      FieldName = 'TotalAmount'
      Precision = 18
      Size = 2
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
    object adt_active2Payment: TStringField
      FieldName = 'Payment'
      Size = 50
    end
    object adt_active2ReasonOfDelayID: TIntegerField
      FieldName = 'ReasonOfDelayID'
    end
    object adt_active2CustomerOrderStatesID: TIntegerField
      FieldName = 'CustomerOrderStatesID'
    end
    object adt_active2ReasonOfDelayRemark: TStringField
      FieldName = 'ReasonOfDelayRemark'
      Size = 50
    end
    object adt_active2COGenerateTime: TDateTimeField
      FieldName = 'COGenerateTime'
    end
    object adt_active2COConfirmedTime: TDateTimeField
      FieldName = 'COConfirmedTime'
    end
    object adt_active2LoginID: TIntegerField
      FieldName = 'LoginID'
    end
    object adt_active2OINQCOQuantity: TIntegerField
      FieldName = 'OINQCOQuantity'
    end
    object adt_active2OINQReleaseCOQuantity: TIntegerField
      FieldName = 'OINQReleaseCOQuantity'
    end
    object adt_active2ActualReleaseCOQuantity: TIntegerField
      FieldName = 'ActualReleaseCOQuantity'
    end
    object adt_active2CustomerNumber: TStringField
      FieldName = 'CustomerNumber'
      Size = 10
    end
    object adt_active2CustomerName: TStringField
      FieldName = 'CustomerName'
      Size = 40
    end
    object adt_active2Origin: TStringField
      FieldName = 'Origin'
    end
    object adt_active2Country: TStringField
      FieldName = 'Country'
      Size = 15
    end
    object adt_active2ChineseName: TStringField
      FieldName = 'ChineseName'
      Size = 100
    end
    object adt_active2PlantID: TIntegerField
      FieldName = 'PlantID'
    end
    object adt_active2PlantCode: TStringField
      FieldName = 'PlantCode'
      Size = 15
    end
    object adt_active2BusinessApplicationID: TIntegerField
      FieldName = 'BusinessApplicationID'
    end
    object adt_active2BusinessApplicationName: TStringField
      FieldName = 'BusinessApplicationName'
      Size = 10
    end
    object adt_active2Model: TStringField
      FieldName = 'Model'
      Size = 25
    end
    object adt_active2ModelDescription: TStringField
      FieldName = 'ModelDescription'
      Size = 80
    end
    object adt_active2PlantID2: TIntegerField
      FieldName = 'PlantID2'
    end
    object adt_active2CustomerOrderStatesName: TStringField
      FieldName = 'CustomerOrderStatesName'
      Size = 15
    end
    object adt_active2ReasonOfDelayDesc: TStringField
      FieldName = 'ReasonOfDelayDesc'
      Size = 50
    end
    object adt_active2DisplayName: TStringField
      FieldName = 'DisplayName'
    end
  end
  object adt_forwarder: TADODataSet
    Parameters = <>
    Left = 353
    Top = 8
  end
  object ds_forwarder: TDataSource
    DataSet = adt_forwarder
    Left = 393
    Top = 8
  end
  object adt_active3: TADODataSet
    CommandText = 'select * from CustomerOrderInvoice'
    Parameters = <>
    Left = 256
    Top = 9
    object adt_active3CustomerOrderInvoiceID: TAutoIncField
      FieldName = 'CustomerOrderInvoiceID'
      ReadOnly = True
    end
    object adt_active3InvoiceNumber: TStringField
      FieldName = 'InvoiceNumber'
      Size = 10
    end
    object adt_active3ForwarderName: TStringField
      FieldName = 'ForwarderName'
      Size = 10
    end
    object adt_active3FreightCost: TFloatField
      FieldName = 'FreightCost'
    end
    object adt_active3ATD: TDateTimeField
      FieldName = 'ATD'
    end
    object adt_active3IsShipped: TBooleanField
      FieldName = 'IsShipped'
    end
  end
  object ds_active3: TDataSource
    DataSet = adt_active3
    Left = 296
    Top = 9
  end
end
