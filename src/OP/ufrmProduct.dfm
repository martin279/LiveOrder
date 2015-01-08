inherited frmProduct: TfrmProduct
  Left = 448
  Top = 163
  Width = 812
  Height = 514
  Caption = 'frmProduct'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBottom: TPanel
    Top = 435
    Width = 796
  end
  inherited pnlBody: TPanel
    Width = 796
    Height = 410
    inherited Splitter1: TSplitter
      Top = 245
      Width = 796
    end
    inherited PageControl1: TPageControl
      Top = 89
      Width = 796
      Height = 156
      inherited tbsBody1: TTabSheet
        inherited GroupBox1: TGroupBox
          Width = 788
          Height = 125
          inherited gridData: TDBGridEh
            Width = 784
            Height = 108
            OnCellClick = gridDataCellClick
            OnDblClick = gridDataDblClick
            Columns = <
              item
                EditButtons = <>
                FieldName = 'ProductTrackingID'
                Footers = <>
                Title.Caption = 'Tracking ID'
                Width = 52
              end
              item
                EditButtons = <>
                FieldName = 'ProductSerialNumber'
                Footers = <>
                Title.Caption = 'Product SN.'
              end
              item
                EditButtons = <>
                FieldName = 'WarrentycardCode'
                Footers = <>
                Title.Caption = 'Warrentycard Code'
                Width = 69
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
                Width = 109
              end
              item
                EditButtons = <>
                FieldName = 'CustomerOrderNumber'
                Footers = <>
                Title.Caption = 'Customer Order No.'
                Width = 58
              end
              item
                EditButtons = <>
                FieldName = 'Country'
                Footers = <>
                Width = 43
              end
              item
                EditButtons = <>
                FieldName = 'Model'
                Footers = <>
                Width = 129
              end
              item
                EditButtons = <>
                FieldName = 'ScheduleStartTime'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'ProductionStartTime'
                Footers = <>
                Title.Caption = 'Production Start Time'
                Width = 70
              end
              item
                EditButtons = <>
                FieldName = 'ProductPackgeType'
                Footers = <>
                Title.Caption = 'Product Packge Type'
                Width = 70
              end
              item
                EditButtons = <>
                FieldName = 'ProductGrossWeight'
                Footers = <>
                Title.Caption = 'Product Gross Weight'
                Width = 103
              end
              item
                EditButtons = <>
                FieldName = 'ProductSize'
                Footers = <>
                Title.Caption = 'Product Size'
                Width = 96
              end
              item
                EditButtons = <>
                FieldName = 'ProductTrackingStatesName'
                Footers = <>
                Title.Caption = 'ProductTracking States'
                Width = 90
              end
              item
                EditButtons = <>
                FieldName = 'WarrentycardReturnDate'
                Footers = <>
                Title.Caption = 'Warrentycard Return Date'
                Width = 82
              end
              item
                EditButtons = <>
                FieldName = 'Remarks'
                Footers = <>
                Width = 86
              end
              item
                EditButtons = <>
                FieldName = 'ProductSeriesName'
                Footers = <>
                Title.Caption = 'Product Series Name'
              end
              item
                EditButtons = <>
                FieldName = 'ProductionScheduleID'
                Footers = <>
                Title.Caption = 'Schedule ID'
                Width = 53
              end
              item
                EditButtons = <>
                FieldName = 'CustomerOrderID'
                Footers = <>
                Title.Caption = 'Customer Order ID'
              end>
          end
        end
      end
    end
    inherited GroupBox2: TGroupBox
      Top = 248
      Width = 796
      inherited gridData2: TDBGridEh
        Width = 792
        Columns = <
          item
            EditButtons = <>
            FieldName = 'ProductTrackingID'
            Footers = <>
            Title.Caption = 'Tracking ID'
          end
          item
            EditButtons = <>
            FieldName = 'ComponentItem'
            Footers = <>
            Title.Caption = 'Component Item'
          end
          item
            EditButtons = <>
            FieldName = 'ComponentSeriesName'
            Footers = <>
            Title.Caption = 'Component Series Name'
          end
          item
            EditButtons = <>
            FieldName = 'ComponentSerialNumber'
            Footers = <>
            Title.Caption = 'Component SN.'
          end
          item
            EditButtons = <>
            FieldName = 'ComponentID'
            Footers = <>
          end>
      end
    end
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 796
      Height = 89
      Align = alTop
      TabOrder = 2
      object Label1: TLabel
        Left = 547
        Top = 12
        Width = 23
        Height = 13
        Caption = 'From'
      end
      object Label2: TLabel
        Left = 547
        Top = 38
        Width = 13
        Height = 13
        Caption = 'To'
      end
      object btnQuery: TButton
        Left = 720
        Top = 40
        Width = 73
        Height = 25
        Caption = 'Query'
        TabOrder = 0
        OnClick = btnQueryClick
      end
      object edtProductSN: TEdit
        Left = 104
        Top = 8
        Width = 121
        Height = 21
        TabOrder = 1
      end
      object chkProductSN: TCheckBox
        Left = 8
        Top = 10
        Width = 81
        Height = 17
        Caption = 'Product SN.'
        TabOrder = 2
      end
      object chkComponentSN: TCheckBox
        Left = 8
        Top = 36
        Width = 89
        Height = 17
        Caption = 'Component SN.'
        TabOrder = 3
      end
      object edtComponentSN: TEdit
        Left = 104
        Top = 34
        Width = 121
        Height = 21
        TabOrder = 4
      end
      object chkCustomer: TCheckBox
        Left = 232
        Top = 36
        Width = 65
        Height = 17
        Caption = 'Customer'
        TabOrder = 5
      end
      object chkOrderNumber: TCheckBox
        Left = 232
        Top = 63
        Width = 66
        Height = 17
        Caption = 'Order No.'
        TabOrder = 6
      end
      object edtCONumber: TEdit
        Left = 304
        Top = 61
        Width = 137
        Height = 21
        TabOrder = 7
      end
      object dbcbbCustomer: TDBLookupComboboxEh
        Left = 304
        Top = 34
        Width = 137
        Height = 21
        DropDownBox.Columns = <
          item
            FieldName = 'CustomerNumber'
            Title.Caption = 'Customer No.'
            Width = 60
          end
          item
            FieldName = 'CustomerName'
            Title.Caption = 'Customer Name'
            Width = 100
          end>
        DropDownBox.Options = [dlgColumnResizeEh, dlgColLinesEh, dlgRowLinesEh, dlgAutoSortMarkingEh, dlgMultiSortMarkingEh]
        DropDownBox.UseMultiTitle = True
        DropDownBox.ShowTitles = True
        DropDownBox.Sizable = True
        EditButtons = <>
        KeyField = 'CustomerID'
        ListField = 'CustomerNumber'
        ListSource = ds_customer
        TabOrder = 8
        Visible = True
      end
      object dbcbbModel: TDBLookupComboboxEh
        Left = 288
        Top = 8
        Width = 153
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
        TabOrder = 9
        Visible = True
      end
      object chkModel: TCheckBox
        Left = 232
        Top = 10
        Width = 49
        Height = 17
        Caption = 'Model'
        TabOrder = 10
      end
      object chkWaCode: TCheckBox
        Left = 8
        Top = 59
        Width = 89
        Height = 25
        Caption = 'Warranty Card Code'
        TabOrder = 11
        WordWrap = True
      end
      object edtWaCode: TEdit
        Left = 104
        Top = 61
        Width = 121
        Height = 21
        TabOrder = 12
      end
      object chkProductionTime: TCheckBox
        Left = 448
        Top = 10
        Width = 97
        Height = 17
        Caption = 'Production Time'
        TabOrder = 13
      end
      object dtpProductionTimeFrom: TDateTimePicker
        Left = 573
        Top = 8
        Width = 138
        Height = 21
        Date = 39885.602726284720000000
        Time = 39885.602726284720000000
        TabOrder = 14
      end
      object dtpProductionTimeTo: TDateTimePicker
        Left = 573
        Top = 34
        Width = 138
        Height = 21
        Date = 39885.604053148150000000
        Time = 39885.604053148150000000
        TabOrder = 15
      end
      object chkTrackingStates: TCheckBox
        Left = 451
        Top = 62
        Width = 105
        Height = 17
        Caption = 'Production States'
        TabOrder = 16
      end
      object dbcbbTrackingStates: TDBLookupComboboxEh
        Left = 556
        Top = 61
        Width = 125
        Height = 21
        EditButtons = <>
        KeyField = 'ProductTrackingStatesID'
        ListField = 'ProductTrackingStatesName'
        ListSource = ds_trackingStates
        TabOrder = 17
        Visible = True
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
  inherited ds_active: TDataSource
    Left = 90
  end
  inherited PopupMenu1: TPopupMenu
    object N2: TMenuItem
      Caption = '-'
    end
    object MenuEdtProduct: TMenuItem
      Caption = 'Edit Product Information'
      OnClick = MenuEdtProductClick
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object MenuPrtUnitLabel: TMenuItem
      Caption = 'Print Unit Label'
      OnClick = MenuPrtUnitLabelClick
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object MenuPrtUnitPackge: TMenuItem
      Caption = 'Print Unit Packge'
      OnClick = MenuPrtUnitPackgeClick
    end
    object MenuPrtPackgeList: TMenuItem
      Caption = 'Print Packge List'
      OnClick = MenuPrtPackgeListClick
    end
    object MenuPrtOrderInfo: TMenuItem
      Caption = 'Print Order Information'
      Visible = False
      OnClick = MenuPrtOrderInfoClick
    end
  end
  inherited adt_active: TADODataSet
    CommandText = 'select * from ViewProductTracking'
    Left = 50
  end
  inherited adt_active2: TADODataSet
    Left = 130
    object adt_active2ProductComponentTrackingID: TAutoIncField
      FieldName = 'ProductComponentTrackingID'
      ReadOnly = True
    end
    object adt_active2ProductTrackingID: TIntegerField
      FieldName = 'ProductTrackingID'
    end
    object adt_active2ComponentID: TIntegerField
      FieldName = 'ComponentID'
    end
    object adt_active2ComponentSerialNumber: TStringField
      FieldName = 'ComponentSerialNumber'
      Size = 25
    end
    object adt_active2ComponentItem: TStringField
      FieldName = 'ComponentItem'
      Size = 30
    end
    object adt_active2ComponentSeriesID: TIntegerField
      FieldName = 'ComponentSeriesID'
    end
    object adt_active2ComponentSeriesName: TStringField
      FieldName = 'ComponentSeriesName'
      Size = 30
    end
  end
  inherited ds_active2: TDataSource
    Left = 174
  end
  object adt_customer: TADODataSet
    CursorType = ctStatic
    Parameters = <>
    Left = 208
    Top = 4
  end
  object ds_customer: TDataSource
    DataSet = adt_customer
    Left = 240
    Top = 4
  end
  object ds_model: TDataSource
    DataSet = adt_model
    Left = 308
    Top = 4
  end
  object adt_model: TADODataSet
    Parameters = <>
    Left = 270
    Top = 3
  end
  object AcrptUnitBox: TAcReport
    DataSets = <
      item
        DataSet = adt_active
        DispName = 'adt_active'
      end>
    Variants = <
      item
        Value = 'CompressorSN'
        Name = 'CompressorSN'
      end
      item
        Value = 'CompressorItem'
        Name = 'CompressorItem'
      end
      item
        Value = 'CustomerOrderNumber'
        Name = 'CustomerOrderNumber'
      end
      item
        Value = 'CustomerName'
        Name = 'CustomerName'
      end>
    PreviewOptions.Buttons = [apsOpen, apsSave, apsPagesetup, apsApplyEdit, apsExportXls, apsPrint, apsPrintCur, apsCancel, apsPageSize, apsZoomIn, apsZoomOut, apsFirst, apsPrior, apsNext, apsLast]
    PreviewOptions.PreviewFormTitle = 'Anycell Report ????'
    PreviewOptions.ShowProgress = False
    PreviewOptions.Modal = True
    PreviewOptions.ZoomType = aztDefault
    PreviewOptions.ZoomScale = 100
    PrintOptions.ShowProgress = False
    DesignOptions.DesignFormTitle = 'Anycell Report ?????'
    FileName = 'D:\LiveOrder\FormTemplate\CUD\RptProductBox.apt'
    Left = 8
    Top = 444
  end
  object AcrptUnitBoxEN: TAcReport
    DataSets = <
      item
        DataSet = adt_active
        DispName = 'adt_active'
      end>
    Variants = <
      item
        Value = 'CompressorSN'
        Name = 'CompressorSN'
      end
      item
        Value = 'CompressorItem'
        Name = 'CompressorItem'
      end
      item
        Value = 'CustomerOrderNumber'
        Name = 'CustomerOrderNumber'
      end
      item
        Value = 'CustomerName'
        Name = 'CustomerName'
      end>
    PreviewOptions.Buttons = [apsOpen, apsSave, apsPagesetup, apsApplyEdit, apsExportXls, apsPrint, apsPrintCur, apsCancel, apsPageSize, apsZoomIn, apsZoomOut, apsFirst, apsPrior, apsNext, apsLast]
    PreviewOptions.PreviewFormTitle = 'Anycell Report ????'
    PreviewOptions.ShowProgress = False
    PreviewOptions.Modal = True
    PreviewOptions.ZoomType = aztDefault
    PreviewOptions.ZoomScale = 100
    PrintOptions.ShowProgress = False
    DesignOptions.DesignFormTitle = 'Anycell Report ?????'
    Left = 40
    Top = 444
  end
  object AcrptWcCN: TAcReport
    DataSets = <
      item
        DataSet = adt_active
        DispName = 'adt_active'
      end>
    Variants = <
      item
        Value = 'ProductDate'
        Name = 'ProductDate'
      end
      item
        Value = 'ATD'
        Name = 'ATD'
      end
      item
        Value = 'CompressorSN'
        Name = 'CompressorSN'
      end
      item
        Value = 'CompressorItem'
        Name = 'CompressorItem'
      end>
    PreviewOptions.Buttons = [apsOpen, apsSave, apsPagesetup, apsApplyEdit, apsExportXls, apsPrint, apsPrintCur, apsCancel, apsPageSize, apsZoomIn, apsZoomOut, apsFirst, apsPrior, apsNext, apsLast]
    PreviewOptions.PreviewFormTitle = 'Anycell Report ????'
    PreviewOptions.ShowProgress = False
    PreviewOptions.Modal = True
    PreviewOptions.ZoomType = aztDefault
    PreviewOptions.ZoomScale = 100
    PrintOptions.ShowProgress = False
    DesignOptions.DesignFormTitle = 'Anycell Report ?????'
    Left = 88
    Top = 444
  end
  object AcrptWcEN: TAcReport
    DataSets = <
      item
        DataSet = adt_active
        DispName = 'adt_active'
      end>
    Variants = <
      item
        Value = 'ProductDate'
        Name = 'ProductDate'
      end
      item
        Value = 'ATD'
        Name = 'ATD'
      end
      item
        Value = 'CompressorSN'
        Name = 'CompressorSN'
      end
      item
        Value = 'CompressorItem'
        Name = 'CompressorItem'
      end>
    PreviewOptions.Buttons = [apsOpen, apsSave, apsPagesetup, apsApplyEdit, apsExportXls, apsPrint, apsPrintCur, apsCancel, apsPageSize, apsZoomIn, apsZoomOut, apsFirst, apsPrior, apsNext, apsLast]
    PreviewOptions.PreviewFormTitle = 'Anycell Report ????'
    PreviewOptions.ShowProgress = False
    PreviewOptions.Modal = True
    PreviewOptions.ZoomType = aztDefault
    PreviewOptions.ZoomScale = 100
    PrintOptions.ShowProgress = False
    DesignOptions.DesignFormTitle = 'Anycell Report ?????'
    Left = 120
    Top = 444
  end
  object AcrptBoxOrderCN: TAcReport
    DataSets = <
      item
        DataSet = adt_active
        DispName = 'adt_active'
      end>
    Variants = <>
    PreviewOptions.Buttons = [apsOpen, apsSave, apsPagesetup, apsApplyEdit, apsExportXls, apsPrint, apsPrintCur, apsCancel, apsPageSize, apsZoomIn, apsZoomOut, apsFirst, apsPrior, apsNext, apsLast]
    PreviewOptions.PreviewFormTitle = 'Anycell Report ????'
    PreviewOptions.ShowProgress = False
    PreviewOptions.Modal = True
    PreviewOptions.ZoomType = aztDefault
    PreviewOptions.ZoomScale = 100
    PrintOptions.ShowProgress = False
    DesignOptions.DesignFormTitle = 'Anycell Report ?????'
    Left = 176
    Top = 444
  end
  object AcrptBoxOrderEN: TAcReport
    DataSets = <
      item
        DataSet = adt_active
        DispName = 'adt_active'
      end>
    Variants = <>
    PreviewOptions.Buttons = [apsOpen, apsSave, apsPagesetup, apsApplyEdit, apsExportXls, apsPrint, apsPrintCur, apsCancel, apsPageSize, apsZoomIn, apsZoomOut, apsFirst, apsPrior, apsNext, apsLast]
    PreviewOptions.PreviewFormTitle = 'Anycell Report ????'
    PreviewOptions.ShowProgress = False
    PreviewOptions.Modal = True
    PreviewOptions.ZoomType = aztDefault
    PreviewOptions.ZoomScale = 100
    PrintOptions.ShowProgress = False
    DesignOptions.DesignFormTitle = 'Anycell Report ?????'
    Left = 208
    Top = 444
  end
  object AcrptOrderCode: TAcReport
    DataSets = <
      item
        DataSet = adt_active
        DispName = 'adt_active'
      end>
    Variants = <
      item
        Value = 'Model2'
        Name = 'Model2'
      end>
    PreviewOptions.Buttons = [apsOpen, apsSave, apsPagesetup, apsApplyEdit, apsExportXls, apsPrint, apsPrintCur, apsCancel, apsPageSize, apsZoomIn, apsZoomOut, apsFirst, apsPrior, apsNext, apsLast]
    PreviewOptions.PreviewFormTitle = 'Anycell Report ????'
    PreviewOptions.ShowProgress = False
    PreviewOptions.Modal = True
    PreviewOptions.ZoomType = aztDefault
    PreviewOptions.ZoomScale = 100
    PrintOptions.ShowProgress = False
    DesignOptions.DesignFormTitle = 'Anycell Report ?????'
    FileName = 'D:\LiveOrder\trunk\FormTemplate\CUD\RptDomesticOrderCode.apt'
    Left = 709
    Top = 444
  end
  object AcrptOrderCodeEN: TAcReport
    DataSets = <
      item
        DataSet = adt_active
        DispName = 'adt_active'
      end>
    Variants = <
      item
        Value = 'Model2'
        Name = 'Model2'
      end>
    PreviewOptions.Buttons = [apsOpen, apsSave, apsPagesetup, apsApplyEdit, apsExportXls, apsPrint, apsPrintCur, apsCancel, apsPageSize, apsZoomIn, apsZoomOut, apsFirst, apsPrior, apsNext, apsLast]
    PreviewOptions.PreviewFormTitle = 'Anycell Report ????'
    PreviewOptions.ShowProgress = False
    PreviewOptions.Modal = True
    PreviewOptions.ZoomType = aztDefault
    PreviewOptions.ZoomScale = 100
    PrintOptions.ShowProgress = False
    DesignOptions.DesignFormTitle = 'Anycell Report ?????'
    Left = 749
    Top = 444
  end
  object AcReport1: TAcReport
    DataSets = <
      item
        DispName = 'qr_order'
      end>
    Variants = <
      item
        Value = 'CustName'
        Name = 'CustName'
      end
      item
        Value = 'OrderCode'
        Name = 'OrderCode'
      end
      item
        Value = 'model2'
        Name = 'model2'
      end>
    PreviewOptions.Buttons = [apsOpen, apsSave, apsPagesetup, apsApplyEdit, apsExportXls, apsPrint, apsPrintCur, apsCancel, apsPageSize, apsZoomIn, apsZoomOut, apsFirst, apsPrior, apsNext, apsLast]
    PreviewOptions.PreviewFormTitle = 'Anycell Report ????'
    PreviewOptions.ShowProgress = False
    PreviewOptions.Modal = True
    PreviewOptions.ZoomType = aztDefault
    PreviewOptions.ZoomScale = 100
    PrintOptions.ShowProgress = False
    DesignOptions.DesignFormTitle = 'Anycell Report ?????'
    Left = 261
    Top = 444
  end
  object adt_trackingStates: TADODataSet
    Parameters = <>
    Left = 353
    Top = 5
  end
  object ds_trackingStates: TDataSource
    DataSet = adt_trackingStates
    Left = 393
    Top = 5
  end
end
