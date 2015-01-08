inherited frmProductionScheduling: TfrmProductionScheduling
  Left = 407
  Top = 169
  Height = 526
  Caption = 'frmProductionScheduling'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBottom: TPanel
    Top = 436
    Height = 52
    object GroupBox3: TGroupBox
      Left = 220
      Top = 1
      Width = 285
      Height = 48
      Caption = 'Upload To Production Line'
      TabOrder = 0
      object pbarUpload: TProgressBar
        Left = 8
        Top = 20
        Width = 185
        Height = 17
        TabOrder = 0
      end
      object btnUpload: TButton
        Left = 201
        Top = 16
        Width = 75
        Height = 25
        Caption = 'Upload'
        TabOrder = 1
        OnClick = btnUploadClick
      end
    end
    object GroupBox4: TGroupBox
      Left = 8
      Top = 1
      Width = 209
      Height = 48
      Caption = 'Sort Schedule'
      TabOrder = 1
      object btnDown: TButton
        Left = 121
        Top = 17
        Width = 75
        Height = 25
        Caption = 'Down'
        TabOrder = 0
        OnClick = btnDownClick
      end
      object btnUp: TButton
        Left = 12
        Top = 17
        Width = 75
        Height = 25
        Caption = 'Up'
        TabOrder = 1
        OnClick = btnUpClick
      end
    end
  end
  inherited pnlBody: TPanel
    Height = 411
    inherited Splitter1: TSplitter
      Top = 238
    end
    inherited PageControl1: TPageControl
      Height = 238
      inherited tbsBody1: TTabSheet
        inherited GroupBox1: TGroupBox
          Top = 60
          Height = 147
          inherited gridData: TDBGridEh
            Height = 130
            Columns = <
              item
                EditButtons = <>
                FieldName = 'ProductionScheduleID'
                Footers = <>
                Title.Caption = 'Schedule ID'
                Width = 50
              end
              item
                EditButtons = <>
                FieldName = 'IsScheduled'
                Footers = <>
                Title.Caption = 'Is Scheduled'
                Width = 56
              end
              item
                EditButtons = <>
                FieldName = 'SchedulePriority'
                Footers = <>
                Title.Caption = 'Schedule Priority'
                Width = 57
              end
              item
                EditButtons = <>
                FieldName = 'Line'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'Model'
                Footers = <>
                Width = 144
              end
              item
                EditButtons = <>
                FieldName = 'ScheduleQuantity'
                Footers = <>
                Title.Caption = 'Schedule Qty.'
                Width = 56
              end
              item
                EditButtons = <>
                FieldName = 'ScheduleStartTime'
                Footers = <>
                Title.Caption = 'Schedule Start Time'
                Width = 90
                OnEditButtonClick = gridDataColumns7EditButtonClick
              end
              item
                EditButtons = <>
                FieldName = 'ETD'
                Footers = <>
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
                FieldName = 'ContractDate'
                Footers = <>
                Title.Caption = 'Contract Date'
                Width = 89
              end
              item
                EditButtons = <>
                FieldName = 'PlantCode'
                Footers = <>
                Title.Caption = 'Plant'
                Width = 42
              end
              item
                EditButtons = <>
                FieldName = 'CustomerNumber'
                Footers = <>
                Title.Caption = 'Customer No.'
              end
              item
                EditButtons = <>
                FieldName = 'CustomerName'
                Footers = <>
                Title.Caption = 'Customer Name'
                Width = 106
              end
              item
                EditButtons = <>
                FieldName = 'CustomerOrderNumber'
                Footers = <>
                Title.Caption = 'Customer Order No.'
              end
              item
                EditButtons = <>
                FieldName = 'CustomerOrderQuantity'
                Footers = <>
                Title.Caption = 'Order Qty'
              end
              item
                EditButtons = <>
                FieldName = 'Country'
                Footers = <>
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
              end>
          end
        end
        object pnlQuery: TPanel
          Left = 0
          Top = 0
          Width = 672
          Height = 60
          Align = alTop
          TabOrder = 1
          object Label1: TLabel
            Left = 229
            Top = 8
            Width = 23
            Height = 13
            Caption = 'From'
          end
          object Label2: TLabel
            Left = 229
            Top = 38
            Width = 13
            Height = 13
            Caption = 'To'
          end
          object dtpRTDFrom: TDateTimePicker
            Left = 254
            Top = 6
            Width = 114
            Height = 23
            Date = 38777.000000000000000000
            Time = 38777.000000000000000000
            TabOrder = 0
          end
          object dbcbbLine: TDBLookupComboboxEh
            Left = 67
            Top = 7
            Width = 113
            Height = 21
            EditButtons = <>
            KeyField = 'AssemblyLineID'
            ListField = 'Line'
            ListSource = ds_line
            TabOrder = 1
            Visible = True
          end
          object btnQuery: TButton
            Left = 400
            Top = 21
            Width = 75
            Height = 25
            Caption = 'Query'
            TabOrder = 2
            OnClick = btnQueryClick
          end
          object cbbIsScheduled: TComboBox
            Left = 91
            Top = 34
            Width = 89
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            ItemIndex = 0
            TabOrder = 3
            Text = 'UnScheduled'
            Items.Strings = (
              'UnScheduled'
              'Scheduled')
          end
          object chkLine: TCheckBox
            Left = 8
            Top = 8
            Width = 41
            Height = 17
            Caption = 'Line'
            TabOrder = 4
          end
          object chkScheduleDate: TCheckBox
            Left = 185
            Top = 8
            Width = 43
            Height = 17
            Caption = 'RTD'
            TabOrder = 5
          end
          object chkIsScheduled: TCheckBox
            Left = 8
            Top = 36
            Width = 80
            Height = 17
            Caption = 'Is Scheduled'
            TabOrder = 6
          end
          object dtpRTDTo: TDateTimePicker
            Left = 254
            Top = 34
            Width = 114
            Height = 21
            Date = 39882.000000000000000000
            Time = 39882.000000000000000000
            TabOrder = 7
          end
        end
      end
    end
    inherited GroupBox2: TGroupBox
      Top = 241
      Height = 170
      inherited gridData2: TDBGridEh
        Height = 153
        Columns = <
          item
            EditButtons = <>
            FieldName = 'ProductionScheduleID'
            Footers = <>
            Title.Caption = 'Schedule ID'
            Width = 54
          end
          item
            EditButtons = <>
            FieldName = 'IsScheduled'
            Footers = <>
            Title.Caption = 'Is Scheduled'
            Width = 55
          end
          item
            EditButtons = <>
            FieldName = 'SchedulePriority'
            Footers = <>
            Title.Caption = 'Schedule Priority'
          end
          item
            EditButtons = <>
            FieldName = 'Line'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'Model'
            Footers = <>
            Width = 140
          end
          item
            EditButtons = <>
            FieldName = 'ScheduleQuantity'
            Footers = <>
            Title.Caption = 'Schedule Qty.'
            Width = 56
          end
          item
            EditButtons = <>
            FieldName = 'ScheduleStartTime'
            Footers = <>
            Title.Caption = 'Schedule Start Time'
            Width = 90
          end
          item
            EditButtons = <>
            FieldName = 'ETD'
            Footers = <>
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
            FieldName = 'ContractDate'
            Footers = <>
            Title.Caption = 'Contract Date'
            Width = 89
          end
          item
            EditButtons = <>
            FieldName = 'PlantCode'
            Footers = <>
            Title.Caption = 'Plant'
            Width = 43
          end
          item
            EditButtons = <>
            FieldName = 'CustomerNumber'
            Footers = <>
            Title.Caption = 'Customer No.'
          end
          item
            EditButtons = <>
            FieldName = 'CustomerName'
            Footers = <>
            Title.Caption = 'Customer Name'
            Width = 107
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
            Width = 65
          end>
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
  inherited PopupMenu1: TPopupMenu
    object N2: TMenuItem
      Caption = '-'
    end
    object MenuSplitSchedule: TMenuItem
      Caption = 'Split Schedule'
      OnClick = MenuSplitScheduleClick
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object MenuSelectForOperation: TMenuItem
      Caption = 'Select For Operation'
      OnClick = MenuSelectForOperationClick
    end
  end
  inherited adt_active: TADODataSet
    BeforePost = adt_activeBeforePost
    CommandText = 'select * from ViewProductionScheduleCUD'
    object adt_activeProductionScheduleID: TAutoIncField
      FieldName = 'ProductionScheduleID'
      ReadOnly = True
    end
    object adt_activeAssemblyLineID: TIntegerField
      FieldName = 'AssemblyLineID'
    end
    object adt_activeModelID: TIntegerField
      FieldName = 'ModelID'
    end
    object adt_activePlantID: TIntegerField
      FieldName = 'PlantID'
    end
    object adt_activeScheduleQuantity: TIntegerField
      FieldName = 'ScheduleQuantity'
    end
    object adt_activeRTD: TDateTimeField
      FieldName = 'RTD'
    end
    object adt_activeScheduleStartTime: TDateTimeField
      FieldName = 'ScheduleStartTime'
    end
    object adt_activeSchedulePriority: TIntegerField
      FieldName = 'SchedulePriority'
    end
    object adt_activeLine: TStringField
      FieldName = 'Line'
      Size = 6
    end
    object adt_activeModel: TStringField
      FieldName = 'Model'
      Size = 25
    end
    object adt_activePlantCode: TStringField
      FieldName = 'PlantCode'
      Size = 15
    end
    object adt_activeIsScheduled: TBooleanField
      FieldName = 'IsScheduled'
    end
    object adt_activeCustomerNumber: TStringField
      FieldName = 'CustomerNumber'
      Size = 10
    end
    object adt_activeCustomerName: TStringField
      FieldName = 'CustomerName'
      Size = 40
    end
    object adt_activeCustomerOrderNumber: TStringField
      FieldName = 'CustomerOrderNumber'
      Size = 10
    end
    object adt_activeCustomerPurchaseOrderNumber: TStringField
      FieldName = 'CustomerPurchaseOrderNumber'
      Size = 50
    end
    object adt_activeCustomerOrderQuantity: TFloatField
      FieldName = 'CustomerOrderQuantity'
    end
    object adt_activeCustomerOrderID: TAutoIncField
      FieldName = 'CustomerOrderID'
      ReadOnly = True
    end
    object adt_activeContractDate: TDateTimeField
      FieldName = 'ContractDate'
    end
    object adt_activeETD: TDateTimeField
      FieldName = 'ETD'
    end
    object adt_activeCustomerOrderStatesName: TStringField
      FieldName = 'CustomerOrderStatesName'
      Size = 15
    end
    object adt_activeCustomerOrderStatesID: TIntegerField
      FieldName = 'CustomerOrderStatesID'
    end
    object adt_activeCountry: TStringField
      FieldName = 'Country'
      Size = 15
    end
  end
  inherited adt_active2: TADODataSet
    object adt_active2ProductionScheduleID: TAutoIncField
      FieldName = 'ProductionScheduleID'
      ReadOnly = True
    end
    object adt_active2AssemblyLineID: TIntegerField
      FieldName = 'AssemblyLineID'
    end
    object adt_active2ModelID: TIntegerField
      FieldName = 'ModelID'
    end
    object adt_active2PlantID: TIntegerField
      FieldName = 'PlantID'
    end
    object adt_active2ScheduleQuantity: TIntegerField
      FieldName = 'ScheduleQuantity'
    end
    object adt_active2RTD: TDateTimeField
      FieldName = 'RTD'
    end
    object adt_active2ScheduleStartTime: TDateTimeField
      FieldName = 'ScheduleStartTime'
    end
    object adt_active2SchedulePriority: TIntegerField
      FieldName = 'SchedulePriority'
    end
    object adt_active2Line: TStringField
      FieldName = 'Line'
      Size = 6
    end
    object adt_active2Model: TStringField
      FieldName = 'Model'
      Size = 25
    end
    object adt_active2PlantCode: TStringField
      FieldName = 'PlantCode'
      Size = 15
    end
    object adt_active2IsScheduled: TBooleanField
      FieldName = 'IsScheduled'
    end
    object adt_active2CustomerNumber: TStringField
      FieldName = 'CustomerNumber'
      Size = 10
    end
    object adt_active2CustomerName: TStringField
      FieldName = 'CustomerName'
      Size = 40
    end
    object adt_active2CustomerOrderNumber: TStringField
      FieldName = 'CustomerOrderNumber'
      Size = 10
    end
    object adt_active2CustomerPurchaseOrderNumber: TStringField
      FieldName = 'CustomerPurchaseOrderNumber'
      Size = 50
    end
    object adt_active2CustomerOrderQuantity: TFloatField
      FieldName = 'CustomerOrderQuantity'
    end
    object adt_active2CustomerOrderID: TAutoIncField
      FieldName = 'CustomerOrderID'
      ReadOnly = True
    end
    object adt_active2ContractDate: TDateTimeField
      FieldName = 'ContractDate'
    end
    object adt_active2ETD: TDateTimeField
      FieldName = 'ETD'
    end
    object adt_active2CustomerOrderStatesName: TStringField
      FieldName = 'CustomerOrderStatesName'
      Size = 15
    end
  end
  object adt_model: TADODataSet
    Connection = DM.ADOConnection1
    CommandText = 'select * from Model'
    Parameters = <>
    Left = 314
    Top = 3
  end
  object ds_line: TDataSource
    DataSet = adt_line
    Left = 281
    Top = 3
  end
  object adt_line: TADODataSet
    Connection = DM.ADOConnection1
    CommandText = 'select * from AssemblyLine'
    Parameters = <>
    Left = 250
    Top = 3
  end
end
