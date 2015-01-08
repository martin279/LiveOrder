inherited frmModelParameterCUD: TfrmModelParameterCUD
  Caption = 'frmModelParameterCUD'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBody: TPanel
    inherited PageControl1: TPageControl
      inherited tbsBody1: TTabSheet
        Caption = 'Model Parameter CUD'
        inherited GroupBox1: TGroupBox
          inherited gridData: TDBGridEh
            OnEnter = gridDataEnter
            Columns = <
              item
                EditButtons = <>
                FieldName = 'ModelParameterCUDID'
                Footers = <>
                Title.Caption = 'ID'
                Width = 38
              end
              item
                EditButtons = <>
                FieldName = 'Model2'
                Footers = <>
                Title.Caption = 'Model'
                Width = 177
              end
              item
                EditButtons = <>
                FieldName = 'ProductWeightUnit'
                Footers = <>
                Width = 95
              end
              item
                EditButtons = <>
                FieldName = 'ProductWeight'
                Footers = <>
                Width = 88
              end
              item
                EditButtons = <>
                FieldName = 'ProductGrossWeight'
                Footers = <>
                Width = 114
              end
              item
                EditButtons = <>
                FieldName = 'ProductSizeUnit'
                Footers = <>
                Width = 93
              end
              item
                EditButtons = <>
                FieldName = 'ProductSize'
                Footers = <>
                Width = 81
              end
              item
                EditButtons = <>
                FieldName = 'Voltage'
                Footers = <>
                Width = 68
              end
              item
                EditButtons = <>
                FieldName = 'Capacity'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'Ph'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'Hz'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'COP'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'L_R_A'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'R_L_A'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'high_pressure'
                Footers = <>
                Width = 92
              end
              item
                EditButtons = <>
                FieldName = 'low_pressure'
                Footers = <>
                Width = 86
              end
              item
                EditButtons = <>
                FieldName = 'oil'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'Refrigerant'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'standard'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'Fan'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'EvaporatingTempRange'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'Power'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'RatingCondition'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'MaxWorkingPressure'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'MaxOperatingCurrent'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'Application'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'update_time'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'DisplayName'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'update_ip'
                Footers = <>
              end>
          end
        end
      end
      object tbsParaUSA: TTabSheet
        Caption = 'Model Parameter CUD USA'
        ImageIndex = 1
        object GroupBox2: TGroupBox
          Left = 0
          Top = 0
          Width = 667
          Height = 345
          Align = alClient
          TabOrder = 0
          object gridParaUSA: TDBGridEh
            Left = 2
            Top = 15
            Width = 663
            Height = 328
            Align = alClient
            DataSource = ds_ParaUSA
            EditActions = [geaCutEh, geaCopyEh, geaPasteEh, geaDeleteEh, geaSelectAllEh]
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            FooterColor = clYellow
            FooterFont.Charset = DEFAULT_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -11
            FooterFont.Name = 'MS Sans Serif'
            FooterFont.Style = [fsBold]
            FooterRowCount = 1
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
            OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghTraceColSizing, dghIncSearch, dghPreferIncSearch, dghRowHighlight, dghDblClickOptimizeColWidth, dghDialogFind]
            ParentFont = False
            ParentShowHint = False
            PopupMenu = PopupMenu1
            RowHeight = 2
            RowLines = 1
            ShowHint = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            TitleImages = ImageList1
            UseMultiTitle = True
            VertScrollBar.Tracking = True
            OnColWidthsChanged = gridDataColWidthsChanged
            OnEnter = gridParaUSAEnter
            OnGetCellParams = gridParaUSAGetCellParams
            OnGetFooterParams = gridDataGetFooterParams
            OnKeyDown = gridDataKeyDown
            Columns = <
              item
                EditButtons = <>
                FieldName = 'ModelParameterCUDUSAID'
                Footers = <>
                Title.Caption = 'ID'
                Width = 38
              end
              item
                EditButtons = <>
                FieldName = 'model1'
                Footers = <>
                Title.Caption = 'Model'
              end
              item
                EditButtons = <>
                FieldName = 'ProductWeightUnit'
                Footers = <>
                Width = 97
              end
              item
                EditButtons = <>
                FieldName = 'ProductWeight'
                Footers = <>
                Width = 89
              end
              item
                EditButtons = <>
                FieldName = 'ProductGrossWeight'
                Footers = <>
                Width = 123
              end
              item
                EditButtons = <>
                FieldName = 'ProductSizeUnit'
                Footers = <>
                Width = 93
              end
              item
                EditButtons = <>
                FieldName = 'ProductSize'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'Application'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'Refrigant'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'CrankcaseHeaterPower'
                Footers = <>
                Width = 117
              end
              item
                EditButtons = <>
                FieldName = 'DesignPressureHigh'
                Footers = <>
                Width = 131
              end
              item
                EditButtons = <>
                FieldName = 'DesignPressureLow'
                Footers = <>
                Width = 119
              end
              item
                EditButtons = <>
                FieldName = 'CompressorVoltage'
                Footers = <>
                Width = 117
              end
              item
                EditButtons = <>
                FieldName = 'CompressorMotorPH'
                Footers = <>
                Width = 122
              end
              item
                EditButtons = <>
                FieldName = 'CompressorMotorHZ'
                Footers = <>
                Width = 108
              end
              item
                EditButtons = <>
                FieldName = 'CompressorMotorRLA'
                Footers = <>
                Width = 118
              end
              item
                EditButtons = <>
                FieldName = 'CompressorMotorLRA'
                Footers = <>
                Width = 92
              end
              item
                EditButtons = <>
                FieldName = 'CondenserFanQty'
                Footers = <>
                Width = 116
              end
              item
                EditButtons = <>
                FieldName = 'CondenserFanVoltage'
                Footers = <>
                Width = 122
              end
              item
                EditButtons = <>
                FieldName = 'CondenserFanPH'
                Footers = <>
                Width = 101
              end
              item
                EditButtons = <>
                FieldName = 'CondenserFanHZ'
                Footers = <>
                Width = 107
              end
              item
                EditButtons = <>
                FieldName = 'CondenserFanFLA'
                Footers = <>
                Width = 98
              end
              item
                EditButtons = <>
                FieldName = 'CondenserFanWattb'
                Footers = <>
                Width = 103
              end
              item
                EditButtons = <>
                FieldName = 'UnitPowerSupplyVoltage'
                Footers = <>
                Width = 129
              end
              item
                EditButtons = <>
                FieldName = 'UnitPowerSupplyPH'
                Footers = <>
                Width = 107
              end
              item
                EditButtons = <>
                FieldName = 'UnitPowerSupplyHZ'
                Footers = <>
                Width = 123
              end
              item
                EditButtons = <>
                FieldName = 'MinCircuitAmpacity'
                Footers = <>
                Width = 105
              end
              item
                EditButtons = <>
                FieldName = 'AmpsMaxBranchCircuitFuse'
                Footers = <>
                Width = 93
              end>
          end
        end
      end
      object tbsPackgeParameter: TTabSheet
        Caption = 'Packing Parameter'
        ImageIndex = 2
        object GroupBox3: TGroupBox
          Left = 0
          Top = 0
          Width = 667
          Height = 345
          Align = alClient
          TabOrder = 0
          object gridPackPara: TDBGridEh
            Left = 2
            Top = 15
            Width = 663
            Height = 328
            Align = alClient
            DataSource = ds_PackPara
            EditActions = [geaCutEh, geaCopyEh, geaPasteEh, geaDeleteEh, geaSelectAllEh]
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            FooterColor = clYellow
            FooterFont.Charset = DEFAULT_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -11
            FooterFont.Name = 'MS Sans Serif'
            FooterFont.Style = [fsBold]
            FooterRowCount = 1
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
            OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghTraceColSizing, dghIncSearch, dghPreferIncSearch, dghRowHighlight, dghDblClickOptimizeColWidth, dghDialogFind]
            ParentFont = False
            ParentShowHint = False
            PopupMenu = PopupMenu1
            RowHeight = 2
            RowLines = 1
            ShowHint = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            TitleImages = ImageList1
            UseMultiTitle = True
            VertScrollBar.Tracking = True
            OnColWidthsChanged = gridDataColWidthsChanged
            OnEnter = gridPackParaEnter
            OnGetCellParams = gridPackParaGetCellParams
            OnGetFooterParams = gridDataGetFooterParams
            OnKeyDown = gridDataKeyDown
            Columns = <
              item
                EditButtons = <>
                FieldName = 'model3'
                Footers = <>
                Title.Caption = 'Model'
              end
              item
                EditButtons = <>
                FieldName = 'Quantity'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'NetWeightPerPCS'
                Footers = <>
                Width = 132
              end
              item
                EditButtons = <>
                FieldName = 'GrossWeight'
                Footers = <>
                Width = 123
              end
              item
                EditButtons = <>
                FieldName = 'Dimensions'
                Footers = <>
              end>
          end
        end
      end
      object tbsProductPackge: TTabSheet
        Caption = 'Product Packge'
        ImageIndex = 3
        object GroupBox4: TGroupBox
          Left = 0
          Top = 0
          Width = 667
          Height = 345
          Align = alClient
          TabOrder = 0
          object gridPack: TDBGridEh
            Left = 2
            Top = 15
            Width = 663
            Height = 328
            Align = alClient
            DataSource = ds_pack
            EditActions = [geaCutEh, geaCopyEh, geaPasteEh, geaDeleteEh, geaSelectAllEh]
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            FooterColor = clYellow
            FooterFont.Charset = DEFAULT_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -11
            FooterFont.Name = 'MS Sans Serif'
            FooterFont.Style = [fsBold]
            FooterRowCount = 1
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
            OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghTraceColSizing, dghIncSearch, dghPreferIncSearch, dghRowHighlight, dghDblClickOptimizeColWidth, dghDialogFind]
            ParentFont = False
            ParentShowHint = False
            PopupMenu = PopupMenu1
            RowHeight = 2
            RowLines = 1
            ShowHint = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            TitleImages = ImageList1
            UseMultiTitle = True
            VertScrollBar.Tracking = True
            OnColWidthsChanged = gridDataColWidthsChanged
            OnEnter = gridPackEnter
            OnGetCellParams = gridPackGetCellParams
            OnGetFooterParams = gridDataGetFooterParams
            OnKeyDown = gridDataKeyDown
            Columns = <
              item
                EditButtons = <>
                FieldName = 'ProductPackgeID'
                Footers = <>
                Title.Caption = 'Product Packge ID'
              end
              item
                EditButtons = <>
                FieldName = 'IsCHN'
                Footers = <>
                Title.Caption = 'Is CHN'
                Width = 36
              end
              item
                EditButtons = <>
                FieldName = 'ProductSeriesName1'
                Footers = <>
                Title.Caption = 'Product Series Name'
              end
              item
                EditButtons = <>
                FieldName = 'ProductPackgeType'
                Footers = <>
                Title.Caption = 'Product Packge Type'
                Width = 77
              end
              item
                EditButtons = <>
                FieldName = 'ProductWeightUnit'
                Footers = <>
                Title.Caption = 'Product WeightUnit'
                Width = 68
              end
              item
                EditButtons = <>
                FieldName = 'ProductWeight'
                Footers = <>
                Title.Caption = 'Product Weight'
              end
              item
                EditButtons = <>
                FieldName = 'ProductGrossWeight'
                Footers = <>
                Title.Caption = 'Product Gross Weight'
                Width = 104
              end
              item
                EditButtons = <>
                FieldName = 'ProductSizeUnit'
                Footers = <>
                Title.Caption = 'Product Size Unit'
                Width = 57
              end
              item
                EditButtons = <>
                FieldName = 'ProductSize'
                Footers = <>
                Title.Caption = 'Product Size'
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
  inherited adt_active: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    BeforePost = adt_activeBeforePost
    CommandText = 'select * from ViewModelParameterCUD'
    object adt_activeModelParameterCUDID: TAutoIncField
      FieldName = 'ModelParameterCUDID'
      ReadOnly = True
    end
    object adt_activeModelID: TIntegerField
      FieldName = 'ModelID'
    end
    object adt_activeProductWeightUnit: TStringField
      FieldName = 'ProductWeightUnit'
      Size = 5
    end
    object adt_activeProductWeight: TFloatField
      FieldName = 'ProductWeight'
    end
    object adt_activeProductGrossWeight: TFloatField
      FieldName = 'ProductGrossWeight'
    end
    object adt_activeProductSizeUnit: TStringField
      FieldName = 'ProductSizeUnit'
      Size = 5
    end
    object adt_activeProductSize: TStringField
      FieldName = 'ProductSize'
    end
    object adt_activeVoltage: TStringField
      FieldName = 'Voltage'
      Size = 50
    end
    object adt_activePh: TStringField
      FieldName = 'Ph'
      Size = 10
    end
    object adt_activeHz: TStringField
      FieldName = 'Hz'
      Size = 10
    end
    object adt_activeCapacity: TStringField
      DisplayWidth = 20
      FieldName = 'Capacity'
    end
    object adt_activeCOP: TStringField
      FieldName = 'COP'
      Size = 10
    end
    object adt_activeL_R_A: TStringField
      FieldName = 'L_R_A'
      Size = 10
    end
    object adt_activeR_L_A: TStringField
      FieldName = 'R_L_A'
      Size = 10
    end
    object adt_activehigh_pressure: TStringField
      FieldName = 'high_pressure'
      Size = 10
    end
    object adt_activelow_pressure: TStringField
      FieldName = 'low_pressure'
      Size = 10
    end
    object adt_activeoil: TStringField
      FieldName = 'oil'
      Size = 15
    end
    object adt_activeRefrigerant: TStringField
      FieldName = 'Refrigerant'
      Size = 10
    end
    object adt_activestandard: TStringField
      FieldName = 'standard'
      Size = 30
    end
    object adt_activeModel: TStringField
      FieldName = 'Model'
      Size = 25
    end
    object adt_activeModel2: TStringField
      FieldKind = fkLookup
      FieldName = 'Model2'
      LookupDataSet = adt_model
      LookupKeyFields = 'ModelID'
      LookupResultField = 'Model'
      KeyFields = 'ModelID'
      Size = 30
      Lookup = True
    end
    object adt_activeFan: TStringField
      FieldName = 'Fan'
      Size = 50
    end
    object adt_activeEvaporatingTempRange: TStringField
      FieldName = 'EvaporatingTempRange'
      Size = 50
    end
    object adt_activePower: TStringField
      FieldName = 'Power'
      Size = 50
    end
    object adt_activeRatingCondition: TStringField
      FieldName = 'RatingCondition'
      Size = 50
    end
    object adt_activeMaxWorkingPressure: TStringField
      FieldName = 'MaxWorkingPressure'
      Size = 50
    end
    object adt_activeMaxOperatingCurrent: TStringField
      FieldName = 'MaxOperatingCurrent'
      Size = 50
    end
    object adt_activeApplication: TStringField
      FieldName = 'Application'
      Size = 50
    end
    object adt_activeupdate_time: TDateTimeField
      FieldName = 'update_time'
    end
    object adt_activeupdate_by: TStringField
      FieldName = 'update_by'
      Size = 10
    end
    object adt_activeDisplayName: TStringField
      FieldName = 'DisplayName'
    end
    object adt_activeupdate_ip: TStringField
      FieldName = 'update_ip'
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
  object adt_model: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    CommandText = 
      'select model,modelid from Model'#13#10'where (lower(substring(model,1,' +
      '3))='#39'zx0'#39#13#10'or lower(substring(model,1,3))='#39'zxl'#39#13#10'or lower(substr' +
      'ing(model,1,3))='#39'zxd'#39#13#10'or lower(substring(model,1,2))='#39'gp'#39#13#10'or l' +
      'ower(substring(model,1,4))='#39'xjam'#39#13#10'or lower(substring(model,1,4)' +
      ')='#39'xjal'#39')'#13#10'or lower(substring(model,1,2))='#39'zx'#39
    Parameters = <>
    Left = 161
  end
  object adt_ParaUSA: TADODataSet
    Parameters = <>
    Left = 241
    Top = 8
    object adt_ParaUSAModelParameterCUDUSAID: TAutoIncField
      FieldName = 'ModelParameterCUDUSAID'
      ReadOnly = True
    end
    object adt_ParaUSAModelID: TIntegerField
      FieldName = 'ModelID'
    end
    object adt_ParaUSAProductWeightUnit: TStringField
      FieldName = 'ProductWeightUnit'
      Size = 5
    end
    object adt_ParaUSAProductWeight: TFloatField
      FieldName = 'ProductWeight'
    end
    object adt_ParaUSAProductGrossWeight: TFloatField
      FieldName = 'ProductGrossWeight'
    end
    object adt_ParaUSAProductSizeUnit: TStringField
      FieldName = 'ProductSizeUnit'
      Size = 5
    end
    object adt_ParaUSAProductSize: TStringField
      FieldName = 'ProductSize'
    end
    object adt_ParaUSAApplication: TStringField
      FieldName = 'Application'
    end
    object adt_ParaUSARefrigant: TStringField
      FieldName = 'Refrigant'
      Size = 30
    end
    object adt_ParaUSACrankcaseHeaterPower: TStringField
      FieldName = 'CrankcaseHeaterPower'
      Size = 10
    end
    object adt_ParaUSADesignPressureHigh: TStringField
      FieldName = 'DesignPressureHigh'
      Size = 10
    end
    object adt_ParaUSADesignPressureLow: TStringField
      FieldName = 'DesignPressureLow'
      Size = 10
    end
    object adt_ParaUSACompressorVoltage: TStringField
      FieldName = 'CompressorVoltage'
      Size = 10
    end
    object adt_ParaUSACompressorMotorPH: TStringField
      FieldName = 'CompressorMotorPH'
      Size = 10
    end
    object adt_ParaUSACompressorMotorHZ: TStringField
      FieldName = 'CompressorMotorHZ'
      Size = 10
    end
    object adt_ParaUSACompressorMotorRLA: TStringField
      FieldName = 'CompressorMotorRLA'
      Size = 10
    end
    object adt_ParaUSACompressorMotorLRA: TStringField
      FieldName = 'CompressorMotorLRA'
      Size = 10
    end
    object adt_ParaUSACondenserFanQty: TStringField
      FieldName = 'CondenserFanQty'
      Size = 10
    end
    object adt_ParaUSACondenserFanVoltage: TStringField
      FieldName = 'CondenserFanVoltage'
      Size = 10
    end
    object adt_ParaUSACondenserFanPH: TStringField
      FieldName = 'CondenserFanPH'
      Size = 10
    end
    object adt_ParaUSACondenserFanHZ: TStringField
      FieldName = 'CondenserFanHZ'
      Size = 10
    end
    object adt_ParaUSACondenserFanFLA: TStringField
      FieldName = 'CondenserFanFLA'
      Size = 10
    end
    object adt_ParaUSACondenserFanWattb: TStringField
      FieldName = 'CondenserFanWattb'
      Size = 10
    end
    object adt_ParaUSAUnitPowerSupplyVoltage: TStringField
      FieldName = 'UnitPowerSupplyVoltage'
      Size = 10
    end
    object adt_ParaUSAUnitPowerSupplyPH: TStringField
      FieldName = 'UnitPowerSupplyPH'
      Size = 10
    end
    object adt_ParaUSAUnitPowerSupplyHZ: TStringField
      FieldName = 'UnitPowerSupplyHZ'
      Size = 10
    end
    object adt_ParaUSAMinCircuitAmpacity: TStringField
      FieldName = 'MinCircuitAmpacity'
      Size = 10
    end
    object adt_ParaUSAAmpsMaxBranchCircuitFuse: TStringField
      FieldName = 'AmpsMaxBranchCircuitFuse'
      Size = 10
    end
    object adt_ParaUSAModel: TStringField
      FieldName = 'Model'
      Size = 25
    end
    object adt_ParaUSAmodel1: TStringField
      FieldKind = fkLookup
      FieldName = 'model1'
      LookupDataSet = adt_model
      LookupKeyFields = 'modelid'
      LookupResultField = 'model'
      KeyFields = 'ModelID'
      Size = 30
      Lookup = True
    end
  end
  object ds_ParaUSA: TDataSource
    DataSet = adt_ParaUSA
    Left = 289
    Top = 16
  end
  object adt_series: TADODataSet
    CursorType = ctStatic
    Parameters = <>
    Left = 164
    Top = 44
  end
  object adt_PackPara: TADODataSet
    CommandText = 
      'select p.*,m.Model from ModelPackingParameter p left outer join ' +
      'Model m on p.ModelID=m.ModelID'
    Parameters = <>
    Left = 292
    Top = 60
    object adt_PackParaModelID: TIntegerField
      FieldName = 'ModelID'
    end
    object adt_PackParaQuantity: TIntegerField
      FieldName = 'Quantity'
    end
    object adt_PackParaNetWeightPerPCS: TFloatField
      FieldName = 'NetWeightPerPCS'
    end
    object adt_PackParaGrossWeight: TFloatField
      FieldName = 'GrossWeight'
    end
    object adt_PackParaDimensions: TStringField
      FieldName = 'Dimensions'
      Size = 50
    end
    object adt_PackParaModel: TStringField
      FieldName = 'Model'
      Size = 25
    end
    object adt_PackParamodel3: TStringField
      FieldKind = fkLookup
      FieldName = 'model3'
      LookupDataSet = adt_model
      LookupKeyFields = 'modelid'
      LookupResultField = 'model'
      KeyFields = 'ModelID'
      Size = 30
      Lookup = True
    end
  end
  object adt_pack: TADODataSet
    BeforePost = adt_packBeforePost
    AfterPost = adt_packAfterPost
    Parameters = <>
    Left = 436
    Top = 60
    object adt_packProductPackgeID: TAutoIncField
      FieldName = 'ProductPackgeID'
      ReadOnly = True
    end
    object adt_packProductSeriesID: TIntegerField
      FieldName = 'ProductSeriesID'
    end
    object adt_packProductPackgeType: TStringField
      FieldName = 'ProductPackgeType'
      Size = 10
    end
    object adt_packProductWeightUnit: TStringField
      FieldName = 'ProductWeightUnit'
      Size = 5
    end
    object adt_packProductWeight: TFloatField
      FieldName = 'ProductWeight'
    end
    object adt_packProductGrossWeight: TFloatField
      FieldName = 'ProductGrossWeight'
    end
    object adt_packProductSizeUnit: TStringField
      FieldName = 'ProductSizeUnit'
      Size = 5
    end
    object adt_packProductSize: TStringField
      FieldName = 'ProductSize'
    end
    object adt_packProductSeriesName: TStringField
      FieldName = 'ProductSeriesName'
      Size = 25
    end
    object adt_packProductSeriesName1: TStringField
      FieldKind = fkLookup
      FieldName = 'ProductSeriesName1'
      LookupDataSet = adt_series
      LookupKeyFields = 'ProductSeriesID'
      LookupResultField = 'ProductSeriesName'
      KeyFields = 'ProductSeriesID'
      Size = 30
      Lookup = True
    end
    object adt_packIsCHN: TBooleanField
      FieldName = 'IsCHN'
    end
  end
  object ds_PackPara: TDataSource
    DataSet = adt_PackPara
    Left = 332
    Top = 68
  end
  object ds_pack: TDataSource
    DataSet = adt_pack
    Left = 484
    Top = 68
  end
end
