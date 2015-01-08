inherited frmQueryDMMReport: TfrmQueryDMMReport
  Left = 437
  Top = 206
  Width = 1006
  Height = 663
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBottom: TPanel
    Top = 584
    Width = 990
  end
  inherited pnlBody: TPanel
    Width = 990
    Height = 559
    inherited PageControl1: TPageControl
      Top = 165
      Width = 990
      Height = 394
      inherited tbsBody1: TTabSheet
        inherited GroupBox1: TGroupBox
          Width = 982
          Height = 363
          inherited PreviewSetupPanel: TPanel
            Width = 978
          end
          inherited PreviewBox1: TPreviewBox
            Top = 272
            Width = 978
          end
          inherited gridData: TDBGridEh
            Width = 978
            Height = 216
            Columns = <
              item
                EditButtons = <>
                FieldName = 'CustomerOrderID'
                Footers = <>
                Title.Caption = 'CO ID'
              end
              item
                EditButtons = <>
                FieldName = 'CustomerNumber'
                Footers = <>
                Title.Caption = 'Customer Code'
                Width = 79
              end
              item
                EditButtons = <>
                FieldName = 'CustomerName'
                Footers = <>
                Title.Caption = 'Customer Name'
                Width = 143
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
                Title.Caption = 'Model Desc.'
                Width = 165
              end
              item
                EditButtons = <>
                FieldName = 'InvoiceNumber'
                Footers = <>
                Title.Caption = 'Invoice No.'
                Width = 80
              end
              item
                EditButtons = <>
                FieldName = 'CustomerOrderNumber'
                Footers = <>
                Title.Caption = 'Customer Order No.'
                Width = 93
              end
              item
                EditButtons = <>
                FieldName = 'CustomerOrderQuantity'
                Footers = <>
                Title.Caption = 'Customer Order Qty.'
                Width = 58
              end
              item
                EditButtons = <>
                FieldName = 'Currency'
                Footers = <>
                Width = 48
              end
              item
                EditButtons = <>
                FieldName = 'Price'
                Footers = <>
                Width = 67
              end
              item
                EditButtons = <>
                FieldName = 'TotalAmount'
                Footers = <>
                Title.Caption = 'Total Amount'
                Width = 67
              end
              item
                EditButtons = <>
                FieldName = 'ContractDate'
                Footers = <>
                Title.Caption = 'Contract Date'
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
                FieldName = 'ATD'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'CustomerPurchaseOrderNumber'
                Footers = <>
                Title.Caption = 'Customer PO No.'
                Width = 138
              end
              item
                EditButtons = <>
                FieldName = 'PlantCode'
                Footers = <>
                Title.Caption = 'Plant'
                Width = 59
              end
              item
                EditButtons = <>
                FieldName = 'CustomerOrderStatesName'
                Footers = <>
                Title.Caption = 'Customer Order Status'
                Width = 79
              end
              item
                EditButtons = <>
                FieldName = 'CommunicatorName'
                Footers = <>
                Title.Caption = 'Communicator'
                Width = 77
              end
              item
                EditButtons = <>
                FieldName = 'ProductFamilyName'
                Footers = <>
                Title.Caption = 'Product Family'
                Width = 120
              end
              item
                EditButtons = <>
                FieldName = 'CustomerFamily'
                Footers = <>
                Title.Caption = 'Customer Family'
              end
              item
                EditButtons = <>
                FieldName = 'customer_type_name'
                Footers = <>
                Title.Caption = 'Customer Type'
                Width = 50
              end
              item
                EditButtons = <>
                FieldName = 'Country'
                Footers = <>
                Width = 69
              end
              item
                EditButtons = <>
                FieldName = 'Region'
                Footers = <>
                Width = 77
              end
              item
                EditButtons = <>
                FieldName = 'AsiaPOR'
                Footers = <>
                Title.Caption = 'Asia POR'
                Width = 58
              end
              item
                EditButtons = <>
                FieldName = 'DemandManagingSalesMonth'
                Footers = <>
                Title.Caption = 'Sales Month'
                Width = 75
              end
              item
                EditButtons = <>
                FieldName = 'DemandManagingDMMMonth'
                Footers = <>
                Title.Caption = 'DMM Month'
                Width = 78
              end
              item
                EditButtons = <>
                FieldName = 'DemandManagingDMMRemark'
                Footers = <>
                Title.Caption = 'DMM Remark'
                Width = 100
              end
              item
                EditButtons = <>
                FieldName = 'SalesPeople'
                Footers = <>
                Title.Caption = 'Sales People'
              end
              item
                EditButtons = <>
                FieldName = 'SalesManager'
                Footers = <>
                Title.Caption = 'Sales Manager'
              end>
          end
        end
      end
    end
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 990
      Height = 165
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object Label14: TLabel
        Left = 51
        Top = 65
        Width = 23
        Height = 13
        Caption = 'From'
      end
      object Label19: TLabel
        Left = 51
        Top = 89
        Width = 13
        Height = 13
        Caption = 'To'
      end
      object Label20: TLabel
        Left = 48
        Top = 14
        Width = 23
        Height = 13
        Caption = 'From'
      end
      object Label21: TLabel
        Left = 48
        Top = 38
        Width = 13
        Height = 13
        Caption = 'To'
      end
      object Label22: TLabel
        Left = 49
        Top = 115
        Width = 23
        Height = 13
        Caption = 'From'
      end
      object Label23: TLabel
        Left = 49
        Top = 139
        Width = 13
        Height = 13
        Caption = 'To'
      end
      object btnQuery: TButton
        Left = 888
        Top = 64
        Width = 75
        Height = 25
        Caption = 'Query'
        TabOrder = 0
        OnClick = btnQueryClick
      end
      object dtpETDFrom: TDateTimePicker
        Left = 75
        Top = 60
        Width = 124
        Height = 21
        Date = 39891.833047928240000000
        Time = 39891.833047928240000000
        TabOrder = 1
      end
      object dtpETDTo: TDateTimePicker
        Left = 75
        Top = 84
        Width = 124
        Height = 21
        Date = 39891.833067650460000000
        Time = 39891.833067650460000000
        TabOrder = 2
      end
      object chkRTD: TCheckBox
        Left = 6
        Top = 14
        Width = 40
        Height = 17
        Caption = 'RTD'
        TabOrder = 3
      end
      object chkETD: TCheckBox
        Left = 6
        Top = 65
        Width = 40
        Height = 17
        Caption = 'ETD'
        TabOrder = 4
      end
      object dtpRTDTo: TDateTimePicker
        Left = 75
        Top = 36
        Width = 124
        Height = 21
        Date = 39891.833010312500000000
        Time = 39891.833010312500000000
        TabOrder = 5
      end
      object dtpRTDFrom: TDateTimePicker
        Left = 75
        Top = 12
        Width = 124
        Height = 21
        Date = 39891.832985000000000000
        Time = 39891.832985000000000000
        TabOrder = 6
      end
      object chkATD: TCheckBox
        Left = 6
        Top = 115
        Width = 41
        Height = 17
        Caption = 'ATD'
        TabOrder = 7
      end
      object dtpATDFrom: TDateTimePicker
        Left = 75
        Top = 111
        Width = 124
        Height = 21
        Date = 39918.936954305560000000
        Time = 39918.936954305560000000
        TabOrder = 8
      end
      object dtpATDTo: TDateTimePicker
        Left = 75
        Top = 137
        Width = 124
        Height = 21
        Date = 39891.833917256950000000
        Time = 39891.833917256950000000
        TabOrder = 9
      end
      object chkOrderStatus: TCheckBox
        Left = 670
        Top = 103
        Width = 81
        Height = 17
        Caption = 'Order Status'
        TabOrder = 10
      end
      object chkPlant: TCheckBox
        Left = 452
        Top = 48
        Width = 46
        Height = 17
        Caption = 'Plant'
        TabOrder = 11
      end
      object dbcbbPlant: TDBLookupComboboxEh
        Left = 542
        Top = 46
        Width = 121
        Height = 21
        EditButtons = <>
        KeyField = 'PlantID'
        ListField = 'PlantCode'
        ListSource = ds_plant
        TabOrder = 12
        Visible = True
      end
      object chkCustomerCode: TCheckBox
        Left = 208
        Top = 16
        Width = 93
        Height = 17
        Caption = 'Customer Code'
        TabOrder = 13
      end
      object chkCustomerName: TCheckBox
        Left = 208
        Top = 44
        Width = 96
        Height = 17
        Caption = 'Customer Name'
        TabOrder = 14
      end
      object chkModel: TCheckBox
        Left = 452
        Top = 73
        Width = 57
        Height = 17
        Caption = 'Model'
        TabOrder = 15
      end
      object chkModelDesc: TCheckBox
        Left = 452
        Top = 101
        Width = 81
        Height = 17
        Caption = 'Model Desc'
        TabOrder = 16
      end
      object chkAsiaPOR: TCheckBox
        Left = 208
        Top = 130
        Width = 70
        Height = 17
        Caption = 'Asia POR'
        TabOrder = 17
      end
      object chkProductFamily: TCheckBox
        Left = 452
        Top = 132
        Width = 90
        Height = 17
        Caption = 'Product Family'
        TabOrder = 18
      end
      object chkCurrency: TCheckBox
        Left = 452
        Top = 16
        Width = 70
        Height = 17
        Caption = 'Currency'
        TabOrder = 19
      end
      object chkCountry: TCheckBox
        Left = 208
        Top = 72
        Width = 59
        Height = 17
        Caption = 'Country'
        TabOrder = 20
      end
      object chkRegion: TCheckBox
        Left = 208
        Top = 98
        Width = 70
        Height = 17
        Caption = 'Region'
        TabOrder = 21
      end
      object chkSalesMonth: TCheckBox
        Left = 669
        Top = 16
        Width = 81
        Height = 17
        Caption = 'Sales Month'
        TabOrder = 22
      end
      object chkDMMMonth: TCheckBox
        Left = 669
        Top = 44
        Width = 79
        Height = 17
        Caption = 'DMM Month'
        TabOrder = 23
      end
      object chkDMMRemark: TCheckBox
        Left = 669
        Top = 72
        Width = 86
        Height = 17
        Caption = 'DMM Remark'
        TabOrder = 24
      end
      object dbcbbModel: TDBLookupComboboxEh
        Left = 542
        Top = 74
        Width = 121
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
        TabOrder = 25
        Visible = True
      end
      object dbcbbCounty: TDBLookupComboboxEh
        Left = 306
        Top = 71
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
        TabOrder = 26
        Visible = True
      end
      object dbcbbCustomerCode: TDBLookupComboboxEh
        Left = 306
        Top = 15
        Width = 136
        Height = 21
        EditButtons = <>
        KeyField = 'CustomerID'
        ListField = 'CustomerNumber'
        ListSource = ds_customer
        TabOrder = 27
        Visible = True
      end
      object dbcbbProductFamily: TDBLookupComboboxEh
        Left = 542
        Top = 130
        Width = 121
        Height = 21
        EditButtons = <>
        KeyField = 'ProductFamilyID'
        ListField = 'ProductFamilyName'
        ListSource = ds_pf
        TabOrder = 28
        Visible = True
      end
      object dbedtDMMMonth: TwwDBSpinEdit
        Left = 756
        Top = 44
        Width = 100
        Height = 21
        Increment = 1.000000000000000000
        MaxValue = 2101.000000000000000000
        MinValue = 1301.000000000000000000
        LimitEditRect = True
        TabOrder = 29
        UnboundDataType = wwDefault
      end
      object dbedtDMMRemark: TDBEditEh
        Left = 756
        Top = 70
        Width = 100
        Height = 21
        EditButtons = <>
        TabOrder = 30
        Visible = True
      end
      object edtRegion: TEdit
        Left = 305
        Top = 96
        Width = 138
        Height = 21
        TabOrder = 31
      end
      object edtModelDesc: TEdit
        Left = 542
        Top = 102
        Width = 119
        Height = 21
        TabOrder = 32
      end
      object dbedtSalesMonth: TwwDBSpinEdit
        Left = 756
        Top = 16
        Width = 100
        Height = 21
        Increment = 1.000000000000000000
        MaxValue = 2101.000000000000000000
        MinValue = 1301.000000000000000000
        LimitEditRect = True
        TabOrder = 33
        UnboundDataType = wwDefault
      end
      object edtCustomer: TEdit
        Left = 306
        Top = 43
        Width = 135
        Height = 21
        TabOrder = 34
      end
      object cbbCurrency: TComboBox
        Left = 542
        Top = 15
        Width = 121
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 35
        Items.Strings = (
          'RMB'
          'USD'
          'EUR')
      end
      object edtAsiaPOR: TEdit
        Left = 305
        Top = 129
        Width = 136
        Height = 21
        TabOrder = 36
      end
      object chkSalesStatus: TCheckBox
        Left = 671
        Top = 132
        Width = 80
        Height = 17
        Caption = 'Sales Status'
        TabOrder = 37
      end
      object cbbSalesStatus: TComboBox
        Left = 756
        Top = 130
        Width = 100
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 38
        Items.Strings = (
          'REAL SALES'
          'NOT SALES')
      end
      object cbbOrderStates: TComboBox
        Left = 756
        Top = 102
        Width = 100
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 39
        Items.Strings = (
          'Shipped Order'
          'UnShipped Order'
          'Cancelled')
      end
    end
  end
  inherited PnlTop: TPanel
    Width = 990
    inherited CoolBar1: TCoolBar
      Width = 990
      Bands = <
        item
          Control = ToolBar1
          ImageIndex = -1
          Width = 990
        end>
      inherited ToolBar1: TToolBar
        Width = 977
        inherited DBNavigator1: TDBNavigator
          Hints.Strings = ()
        end
      end
    end
  end
  inherited adt_active: TADODataSet
    CommandText = 'select * from ViewTradingOrderForSales1'
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
  object adt_plant: TADODataSet
    Parameters = <>
    Left = 594
    Top = 67
  end
  object ds_plant: TDataSource
    DataSet = adt_plant
    Left = 626
    Top = 67
  end
  object adt_customer: TADODataSet
    Parameters = <>
    Left = 369
    Top = 40
  end
  object ds_customer: TDataSource
    DataSet = adt_customer
    Left = 409
    Top = 40
  end
  object ds_country: TDataSource
    DataSet = adt_country
    Left = 401
    Top = 96
  end
  object adt_country: TADODataSet
    Parameters = <>
    Left = 369
    Top = 96
  end
  object adt_model: TADODataSet
    Parameters = <>
    Left = 609
    Top = 96
  end
  object ds_model: TDataSource
    DataSet = adt_model
    Left = 641
    Top = 96
  end
  object adt_pf: TADODataSet
    Parameters = <>
    Left = 609
    Top = 152
  end
  object ds_pf: TDataSource
    DataSet = adt_pf
    Left = 641
    Top = 152
  end
end
