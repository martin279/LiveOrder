inherited frmQueryDMMForCS: TfrmQueryDMMForCS
  Left = 654
  Top = 193
  Width = 976
  Height = 687
  Caption = 'Query DMM For CS'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBottom: TPanel
    Top = 608
    Width = 960
  end
  inherited pnlBody: TPanel
    Width = 960
    Height = 583
    inherited PageControl1: TPageControl
      Top = 126
      Width = 960
      Height = 457
      inherited tbsBody1: TTabSheet
        inherited GroupBox1: TGroupBox
          Width = 952
          Height = 426
          inherited PreviewSetupPanel: TPanel
            Width = 948
          end
          inherited PreviewBox1: TPreviewBox
            Top = 335
            Width = 948
          end
          inherited gridData: TDBGridEh
            Width = 948
            Height = 279
            Columns = <
              item
                EditButtons = <>
                FieldName = 'CustomerOrderID'
                Footers = <>
                Title.Caption = 'CO ID'
              end
              item
                EditButtons = <>
                FieldName = 'TradingOrderID'
                Footers = <>
                Title.Caption = 'PO ID'
              end
              item
                EditButtons = <>
                FieldName = 'CustomerNumber'
                Footers = <>
                Title.Caption = 'Customer Number'
              end
              item
                EditButtons = <>
                FieldName = 'CustomerName'
                Footers = <>
                Title.Caption = 'Customer Name'
              end
              item
                EditButtons = <>
                FieldName = 'Model'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'ModelDescription'
                Footers = <>
                Title.Caption = 'Model Description'
                Width = 60
              end
              item
                EditButtons = <>
                FieldName = 'CustomerOrderQuantity'
                Footers = <>
                Title.Caption = 'Customer Order Qty.'
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
                FieldName = 'ContractDate'
                Footers = <>
                Title.Caption = 'Contract Date'
              end
              item
                EditButtons = <>
                FieldName = 'CustomerOrderStatesName'
                Footers = <>
                Title.Caption = 'CO Status'
              end
              item
                EditButtons = <>
                FieldName = 'RTD'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'ETD'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'DemandManagingRCED'
                Footers = <>
                Title.Caption = 'Demand Managing RCED'
                Width = 93
              end
              item
                EditButtons = <>
                FieldName = 'SellerRCEDSellerOA'
                Footers = <>
                Title.Caption = 'RCED Seller OA'
              end
              item
                EditButtons = <>
                FieldName = 'ImportSheetNo'
                Footers = <>
                Title.Caption = 'Import Sheet No'
              end
              item
                EditButtons = <>
                FieldName = 'ReceivingQuantity'
                Footers = <>
                Title.Caption = 'Receiving Quantity'
              end
              item
                EditButtons = <>
                FieldName = 'LogisticInRCED'
                Footers = <>
                Title.Caption = 'Logistic In RCED'
              end
              item
                EditButtons = <>
                FieldName = 'ActArriveWarehouseDate'
                Footers = <>
                Title.Caption = 'Act Arrive Warehouse Date'
                Width = 90
              end
              item
                EditButtons = <>
                FieldName = 'CommunicatorName'
                Footers = <>
                Title.Caption = 'Communicator'
                Width = 82
              end>
          end
        end
      end
    end
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 960
      Height = 126
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object Label7: TLabel
        Left = 79
        Top = 18
        Width = 23
        Height = 13
        Caption = 'From'
      end
      object Label8: TLabel
        Left = 81
        Top = 42
        Width = 13
        Height = 13
        Caption = 'To'
      end
      object btnQuery: TButton
        Left = 856
        Top = 80
        Width = 75
        Height = 25
        Caption = 'Query'
        TabOrder = 0
        OnClick = btnQueryClick
      end
      object chkOrderStatus: TCheckBox
        Left = 477
        Top = 43
        Width = 82
        Height = 17
        Caption = 'Order Status'
        TabOrder = 1
      end
      object chkPlant: TCheckBox
        Left = 253
        Top = 73
        Width = 46
        Height = 17
        Caption = 'Plant'
        TabOrder = 2
      end
      object dbcbbPlant: TDBLookupComboboxEh
        Left = 328
        Top = 71
        Width = 137
        Height = 21
        EditButtons = <>
        KeyField = 'PlantID'
        ListField = 'PlantCode'
        ListSource = ds_plant
        TabOrder = 3
        Visible = True
      end
      object chkCustomerCode: TCheckBox
        Left = 8
        Top = 72
        Width = 93
        Height = 17
        Caption = 'Customer Code'
        TabOrder = 4
      end
      object chkCustomerName: TCheckBox
        Left = 8
        Top = 100
        Width = 96
        Height = 17
        Caption = 'Customer Name'
        TabOrder = 5
      end
      object chkModel: TCheckBox
        Left = 253
        Top = 100
        Width = 57
        Height = 17
        Caption = 'Model'
        TabOrder = 6
      end
      object chkCurrency: TCheckBox
        Left = 253
        Top = 41
        Width = 70
        Height = 17
        Caption = 'Currency'
        TabOrder = 7
      end
      object chkCountry: TCheckBox
        Left = 253
        Top = 12
        Width = 59
        Height = 17
        Caption = 'Country'
        TabOrder = 8
      end
      object chkImportSheetNum: TCheckBox
        Left = 477
        Top = 100
        Width = 101
        Height = 17
        Caption = 'Import Sheet No.'
        TabOrder = 9
      end
      object chkDMMStatus: TCheckBox
        Left = 477
        Top = 13
        Width = 79
        Height = 17
        Caption = 'DMM Status'
        TabOrder = 10
      end
      object dbcbbModel: TDBLookupComboboxEh
        Left = 328
        Top = 98
        Width = 137
        Height = 21
        DropDownBox.Columns = <
          item
            FieldName = 'Model'
            Width = 290
          end
          item
            FieldName = 'ModelDescription'
          end>
        DropDownBox.Options = [dlgColumnResizeEh, dlgColLinesEh, dlgRowLinesEh, dlgAutoSortMarkingEh, dlgMultiSortMarkingEh]
        DropDownBox.UseMultiTitle = True
        DropDownBox.ShowTitles = True
        DropDownBox.Sizable = True
        EditButtons = <>
        KeyField = 'ModelID'
        ListField = 'Model'
        ListSource = ds_model
        TabOrder = 11
        Visible = True
      end
      object dbcbbCounty: TDBLookupComboboxEh
        Left = 328
        Top = 11
        Width = 137
        Height = 21
        DropDownBox.Options = [dlgColumnResizeEh, dlgColLinesEh, dlgRowLinesEh, dlgAutoSortMarkingEh, dlgMultiSortMarkingEh]
        DropDownBox.UseMultiTitle = True
        DropDownBox.ShowTitles = True
        DropDownBox.Sizable = True
        EditButtons = <>
        KeyField = 'CountryID'
        ListField = 'CountryName'
        ListSource = ds_country
        TabOrder = 12
        Visible = True
      end
      object dbcbbCustomerCode: TDBLookupComboboxEh
        Left = 106
        Top = 71
        Width = 136
        Height = 21
        EditButtons = <>
        KeyField = 'CustomerID'
        ListField = 'CustomerNumber'
        ListSource = ds_customer
        TabOrder = 13
        Visible = True
      end
      object edtCustomer: TEdit
        Left = 106
        Top = 99
        Width = 135
        Height = 21
        TabOrder = 14
      end
      object chkCommunicator: TCheckBox
        Left = 477
        Top = 73
        Width = 90
        Height = 17
        Caption = 'Communicator'
        TabOrder = 15
      end
      object dbcbbCommunicator: TDBLookupComboboxEh
        Left = 579
        Top = 71
        Width = 120
        Height = 21
        DropDownBox.Options = [dlgColumnResizeEh, dlgColLinesEh]
        DropDownBox.UseMultiTitle = True
        DropDownBox.ShowTitles = True
        DropDownBox.Sizable = True
        DropDownBox.Width = -1
        EditButtons = <>
        KeyField = 'LoginID'
        ListField = 'CommunicatorCode'
        ListSource = ds_communicator
        TabOrder = 16
        Visible = True
      end
      object chkContractDate: TCheckBox
        Left = 9
        Top = 16
        Width = 63
        Height = 25
        Caption = 'Contract Date'
        TabOrder = 17
        WordWrap = True
      end
      object dtpContractDateFrom: TDateTimePicker
        Left = 106
        Top = 15
        Width = 136
        Height = 21
        Date = 39891.833922314820000000
        Time = 39891.833922314820000000
        TabOrder = 18
      end
      object dtpContractDateTo: TDateTimePicker
        Left = 106
        Top = 38
        Width = 136
        Height = 21
        Date = 39891.833928472220000000
        Time = 39891.833928472220000000
        TabOrder = 19
      end
      object edtImportSheetNum: TEdit
        Left = 579
        Top = 97
        Width = 118
        Height = 21
        TabOrder = 20
      end
      object cbbDMMStatus: TComboBox
        Left = 577
        Top = 11
        Width = 122
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 21
        Items.Strings = (
          'NO RCED'
          'RECD Not Arrived'
          'RCED Arrived')
      end
      object cbbCurrency: TComboBox
        Left = 328
        Top = 41
        Width = 135
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 22
        Items.Strings = (
          'RMB'
          'USD'
          'EUR')
      end
      object cbbOrderStates: TComboBox
        Left = 578
        Top = 39
        Width = 121
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 23
        Items.Strings = (
          'Shipped Order'
          'UnShipped Order'
          'Cancelled'
          'New Order'
          'Open Order'
          'Confirm Order'
          'Release Order'
          'Shipping Order')
      end
      object chkCustomerPONum: TCheckBox
        Left = 708
        Top = 16
        Width = 97
        Height = 17
        Caption = 'Customer PO No.'
        TabOrder = 24
      end
      object edtCustomerPONum: TEdit
        Left = 813
        Top = 12
        Width = 121
        Height = 21
        TabOrder = 25
      end
    end
  end
  inherited PnlTop: TPanel
    Width = 960
    inherited CoolBar1: TCoolBar
      Width = 960
      Bands = <
        item
          Control = ToolBar1
          ImageIndex = -1
          Width = 960
        end>
      inherited ToolBar1: TToolBar
        Width = 947
        inherited DBNavigator1: TDBNavigator
          Hints.Strings = ()
        end
      end
    end
  end
  inherited adt_active: TADODataSet
    CommandText = 'select * from ViewTradingOrderForCS1'
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
  object adt_customer: TADODataSet
    Parameters = <>
    Left = 153
    Top = 96
  end
  object ds_customer: TDataSource
    DataSet = adt_customer
    Left = 193
    Top = 96
  end
  object ds_country: TDataSource
    DataSet = adt_country
    Left = 417
    Top = 32
  end
  object adt_country: TADODataSet
    Parameters = <>
    Left = 385
    Top = 32
  end
  object ds_model: TDataSource
    DataSet = adt_model
    Left = 417
    Top = 120
  end
  object adt_model: TADODataSet
    Parameters = <>
    Left = 385
    Top = 120
  end
  object adt_plant: TADODataSet
    Parameters = <>
    Left = 386
    Top = 91
  end
  object ds_plant: TDataSource
    DataSet = adt_plant
    Left = 418
    Top = 91
  end
  object adt_communicator: TADODataSet
    Connection = DM.ADOConnection1
    CommandText = 
      'select c.*,l.DisplayName from Communicator c'#13#10' left outer join L' +
      'ogin l on c.LoginID=l.LoginID'
    Parameters = <>
    Left = 616
    Top = 89
    object adt_communicatorCommunicatorID: TAutoIncField
      FieldName = 'CommunicatorID'
      ReadOnly = True
    end
    object adt_communicatorCommunicatorCode: TStringField
      FieldName = 'CommunicatorCode'
      Size = 3
    end
    object adt_communicatorCommunicatorPhone: TStringField
      FieldName = 'CommunicatorPhone'
      Size = 30
    end
    object adt_communicatorCommunicatorFax: TStringField
      FieldName = 'CommunicatorFax'
      Size = 30
    end
    object adt_communicatorCommunicatorMail: TStringField
      FieldName = 'CommunicatorMail'
      Size = 50
    end
    object adt_communicatorLoginID: TIntegerField
      FieldName = 'LoginID'
    end
    object adt_communicatorDisplayName: TStringField
      FieldName = 'DisplayName'
    end
  end
  object ds_communicator: TDataSource
    DataSet = adt_communicator
    Left = 664
    Top = 89
  end
end
