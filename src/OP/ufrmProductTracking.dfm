inherited frmProductTracking: TfrmProductTracking
  Left = 413
  Top = 131
  Width = 781
  Height = 579
  Caption = 'frmProductTracking'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBottom: TPanel
    Top = 500
    Width = 765
  end
  inherited pnlBody: TPanel
    Width = 765
    Height = 475
    inherited Splitter1: TSplitter
      Top = 329
      Width = 765
    end
    object Splitter2: TSplitter [1]
      Left = 0
      Top = 189
      Width = 765
      Height = 3
      Cursor = crVSplit
      Align = alBottom
      Color = clActiveCaption
      ParentColor = False
    end
    inherited PageControl1: TPageControl
      Top = 41
      Width = 765
      Height = 148
      inherited tbsBody1: TTabSheet
        inherited GroupBox1: TGroupBox
          Width = 757
          Height = 117
          inherited gridData: TDBGridEh
            Width = 753
            Height = 100
            Columns = <
              item
                EditButtons = <>
                FieldName = 'ProductTrackingID'
                Footers = <>
                Title.Caption = 'Tracking ID'
                Width = 47
              end
              item
                EditButtons = <>
                FieldName = 'Model'
                Footers = <>
                Width = 135
              end
              item
                EditButtons = <>
                FieldName = 'ProductSerialNumber'
                Footers = <>
                Title.Caption = 'Product SN.'
                Width = 76
              end
              item
                EditButtons = <>
                FieldName = 'WarrentycardCode'
                Footers = <>
                Title.Caption = 'Warrentycard Code'
                Width = 71
              end
              item
                EditButtons = <>
                FieldName = 'ScheduleStartTime'
                Footers = <>
                Title.Caption = 'Schedule Start Time'
                Width = 85
              end
              item
                EditButtons = <>
                FieldName = 'ProductionStartTime'
                Footers = <>
                Title.Caption = 'Production Start Time'
                Width = 81
              end
              item
                EditButtons = <>
                FieldName = 'Country'
                Footers = <>
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
                Width = 109
              end
              item
                EditButtons = <>
                FieldName = 'CustomerOrderNumber'
                Footers = <>
                Title.Caption = 'Customer Order No.'
              end
              item
                EditButtons = <>
                FieldName = 'CustomerOrderID'
                Footers = <>
                Title.Caption = 'Customer Order ID'
              end
              item
                EditButtons = <>
                FieldName = 'CustomerOrderStatesName'
                Footers = <>
                Title.Caption = 'Order States'
                Width = 59
              end
              item
                EditButtons = <>
                FieldName = 'ProductionScheduleID'
                Footers = <>
                Title.Caption = 'Schedule ID'
                Width = 48
              end
              item
                EditButtons = <>
                FieldName = 'ProductTrackingStatesName'
                Footers = <>
                Title.Caption = 'Production States'
                Width = 59
              end>
          end
        end
      end
    end
    inherited GroupBox2: TGroupBox
      Top = 332
      Width = 765
      Height = 143
      inherited gridData2: TDBGridEh
        Width = 761
        Height = 126
        Columns = <
          item
            EditButtons = <>
            FieldName = 'ProductTrackingID'
            Footers = <>
            Title.Caption = 'Tracking ID'
            Width = 51
          end
          item
            EditButtons = <>
            FieldName = 'Model'
            Footers = <>
            Width = 144
          end
          item
            EditButtons = <>
            FieldName = 'ProductSerialNumber'
            Footers = <>
            Title.Caption = 'Product SN.'
            Width = 72
          end
          item
            EditButtons = <>
            FieldName = 'WarrentycardCode'
            Footers = <>
            Title.Caption = 'Warrentycard Code'
            Width = 71
          end
          item
            EditButtons = <>
            FieldName = 'ScheduleStartTime'
            Footers = <>
            Title.Caption = 'Schedule Start Time'
            Width = 84
          end
          item
            EditButtons = <>
            FieldName = 'ProductionStartTime'
            Footers = <>
            Title.Caption = 'Production Start Time'
            Width = 91
          end
          item
            EditButtons = <>
            FieldName = 'Country'
            Footers = <>
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
            Width = 103
          end
          item
            EditButtons = <>
            FieldName = 'CustomerOrderNumber'
            Footers = <>
            Title.Caption = 'Customer Order No.'
          end
          item
            EditButtons = <>
            FieldName = 'CustomerOrderID'
            Footers = <>
            Title.Caption = 'Customer Order ID'
          end
          item
            EditButtons = <>
            FieldName = 'CustomerOrderStatesName'
            Footers = <>
            Title.Caption = 'Order States'
            Width = 55
          end
          item
            EditButtons = <>
            FieldName = 'ProductionScheduleID'
            Footers = <>
            Title.Caption = 'Schedule ID'
            Width = 48
          end
          item
            EditButtons = <>
            FieldName = 'ProductTrackingStatesName'
            Footers = <>
            Title.Caption = 'Production States'
            Width = 61
          end
          item
            EditButtons = <>
            FieldName = 'ProductSeriesDesc'
            Footers = <>
            Title.Caption = 'Product Series Desc'
          end>
      end
    end
    object Panel1: TPanel
      Left = 0
      Top = 192
      Width = 765
      Height = 137
      Align = alBottom
      TabOrder = 2
      object LabelPrompt: TLabel
        Left = 608
        Top = 16
        Width = 3
        Height = 13
      end
      object gboxComponentTrack: TGroupBox
        Left = 383
        Top = 1
        Width = 381
        Height = 135
        Align = alClient
        TabOrder = 1
        object gridComponentTrack: TDBGridEh
          Left = 2
          Top = 15
          Width = 377
          Height = 118
          Align = alClient
          DataSource = ds_component
          Flat = True
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = []
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnGetCellParams = gridComponentTrackGetCellParams
          Columns = <
            item
              EditButtons = <>
              FieldName = 'ComponentItem'
              Footers = <>
              Title.Caption = 'Part No.'
              Width = 103
            end
            item
              EditButtons = <>
              FieldName = 'ComponentSerialNumber'
              Footers = <>
              Title.Caption = 'Component SN.'
              Width = 102
            end
            item
              EditButtons = <>
              FieldName = 'ComponentSeriesName'
              Footers = <>
              Title.Caption = 'Component Series Name'
              Width = 121
            end
            item
              EditButtons = <>
              FieldName = 'ProductTrackingID'
              Footers = <>
              Title.Caption = 'Tracking ID'
              Width = 61
            end
            item
              EditButtons = <>
              FieldName = 'ComponentID'
              Footers = <>
              Title.Caption = 'Component ID'
              Width = 74
            end>
        end
      end
      object GroupBox3: TGroupBox
        Left = 1
        Top = 1
        Width = 215
        Height = 135
        Align = alLeft
        Caption = 'Product Information'
        TabOrder = 2
        object Label1: TLabel
          Left = 103
          Top = 16
          Width = 62
          Height = 13
          Caption = 'Schedule ID:'
        end
        object Label2: TLabel
          Left = 4
          Top = 72
          Width = 39
          Height = 13
          Caption = 'Model:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clFuchsia
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 4
          Top = 92
          Width = 53
          Height = 13
          Caption = 'Unit SN.:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clFuchsia
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 4
          Top = 16
          Width = 59
          Height = 13
          Caption = 'Tracking ID:'
        end
        object dbtxtTrackingID: TDBText
          Left = 64
          Top = 16
          Width = 33
          Height = 17
          DataField = 'ProductTrackingID'
          DataSource = ds_active
        end
        object dbtxtScheduleID: TDBText
          Left = 163
          Top = 16
          Width = 47
          Height = 17
          DataField = 'ProductionScheduleID'
          DataSource = ds_active
        end
        object Label10: TLabel
          Left = 4
          Top = 50
          Width = 47
          Height = 13
          Caption = 'Customer:'
        end
        object dbtxtCustomerName: TDBText
          Left = 54
          Top = 50
          Width = 155
          Height = 17
          DataField = 'CustomerName'
          DataSource = ds_active
          WordWrap = True
        end
        object dbtxtModel: TDBText
          Left = 59
          Top = 72
          Width = 150
          Height = 17
          DataField = 'Model'
          DataSource = ds_active
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clFuchsia
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 4
          Top = 112
          Width = 48
          Height = 13
          Caption = 'Packge:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clFuchsia
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbtxtProductSN: TDBText
          Left = 59
          Top = 92
          Width = 150
          Height = 17
          DataField = 'ProductSerialNumber'
          DataSource = ds_active
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clFuchsia
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbtxtPackgeType: TDBText
          Left = 59
          Top = 112
          Width = 150
          Height = 17
          DataField = 'ProductPackgeType'
          DataSource = ds_active
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clFuchsia
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 4
          Top = 32
          Width = 78
          Height = 13
          Caption = 'Track States ID:'
        end
        object dbtxtTrackingStatesID: TDBText
          Left = 84
          Top = 32
          Width = 21
          Height = 17
          DataField = 'ProductTrackingStatesID'
          DataSource = ds_active
        end
        object Label12: TLabel
          Left = 107
          Top = 32
          Width = 44
          Height = 13
          Caption = 'Cust No.:'
        end
        object dbtxtCustomerNumber: TDBText
          Left = 154
          Top = 32
          Width = 45
          Height = 17
          DataField = 'CustomerNumber'
          DataSource = ds_active
        end
      end
      object gboxScan: TGroupBox
        Left = 216
        Top = 1
        Width = 167
        Height = 135
        Align = alLeft
        Caption = 'Scan Information'
        TabOrder = 0
        object Label4: TLabel
          Left = 8
          Top = 35
          Width = 39
          Height = 13
          Caption = 'Part No.'
        end
        object Label9: TLabel
          Left = 8
          Top = 85
          Width = 69
          Height = 13
          Caption = 'Componet SN.'
        end
        object LabelComponentID: TLabel
          Left = 81
          Top = 18
          Width = 3
          Height = 13
        end
        object Label6: TLabel
          Left = 8
          Top = 17
          Width = 68
          Height = 13
          Caption = 'Component ID'
        end
        object edtComponentItem: TEdit
          Left = 5
          Top = 52
          Width = 155
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnKeyPress = edtComponentItemKeyPress
        end
        object edtComponentSN: TEdit
          Left = 5
          Top = 103
          Width = 155
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnExit = edtComponentSNExit
          OnKeyPress = edtComponentSNKeyPress
        end
      end
    end
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 765
      Height = 41
      Align = alTop
      TabOrder = 3
      object Label5: TLabel
        Left = 8
        Top = 12
        Width = 71
        Height = 13
        Caption = 'Schedule Date'
      end
      object btnQuery: TButton
        Left = 240
        Top = 7
        Width = 75
        Height = 25
        Caption = 'Query'
        TabOrder = 0
        OnClick = btnQueryClick
      end
      object dtpScheduleDate: TDateTimePicker
        Left = 84
        Top = 9
        Width = 140
        Height = 21
        Date = 39875.637419085650000000
        Time = 39875.637419085650000000
        TabOrder = 1
      end
    end
  end
  inherited PnlTop: TPanel
    Width = 765
    inherited CoolBar1: TCoolBar
      Width = 765
      Bands = <
        item
          Control = ToolBar1
          ImageIndex = -1
          Width = 765
        end>
      inherited ToolBar1: TToolBar
        Width = 752
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
    object MenuPrtUnitLabel: TMenuItem
      Caption = 'Print Unit Label'
      OnClick = MenuPrtUnitLabelClick
    end
    object MenuPrtUnitPackge: TMenuItem
      Caption = 'Print Unit Packge'
      OnClick = MenuPrtUnitPackgeClick
    end
    object MenuPrtPackgeList: TMenuItem
      Caption = 'Print Packge List'
      OnClick = MenuPrtPackgeListClick
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object MenuChangeToUM180: TMenuItem
      Caption = 'Change To UM180'
      OnClick = MenuChangeToUM180Click
    end
  end
  object adt_component: TADODataSet
    Parameters = <>
    Left = 257
    Top = 2
    object adt_componentProductComponentTrackingID: TAutoIncField
      FieldName = 'ProductComponentTrackingID'
      ReadOnly = True
    end
    object adt_componentProductTrackingID: TIntegerField
      FieldName = 'ProductTrackingID'
    end
    object adt_componentComponentID: TIntegerField
      FieldName = 'ComponentID'
    end
    object adt_componentComponentSerialNumber: TStringField
      FieldName = 'ComponentSerialNumber'
      Size = 25
    end
    object adt_componentComponentItem: TStringField
      FieldName = 'ComponentItem'
      Size = 30
    end
    object adt_componentComponentSeriesName: TStringField
      FieldName = 'ComponentSeriesName'
      Size = 30
    end
  end
  object ds_component: TDataSource
    DataSet = adt_component
    Left = 297
    Top = 3
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 10000
    OnTimer = Timer1Timer
    Left = 696
    Top = 1
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
    Left = 16
    Top = 500
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
    Left = 48
    Top = 500
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
    Left = 688
    Top = 508
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
    Left = 720
    Top = 508
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
    Left = 96
    Top = 500
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
    FileName = 'D:\LiveOrder\FormTemplate\CUD\RptOverseasOrderCode.apt'
    Left = 128
    Top = 500
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
    Left = 269
    Top = 500
  end
end
