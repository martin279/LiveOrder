inherited frmDBBasicDT: TfrmDBBasicDT
  Caption = 'frmDBBasicDT'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBody: TPanel
    object Splitter1: TSplitter [0]
      Left = 0
      Top = 211
      Width = 680
      Height = 3
      Cursor = crVSplit
      Align = alBottom
      Color = clActiveCaption
      ParentColor = False
    end
    inherited PageControl1: TPageControl
      Height = 211
      inherited tbsBody1: TTabSheet
        inherited GroupBox1: TGroupBox
          Height = 180
          inherited gridData: TDBGridEh
            Height = 163
            OnEnter = gridDataEnter
          end
        end
      end
    end
    object GroupBox2: TGroupBox
      Left = 0
      Top = 214
      Width = 680
      Height = 162
      Align = alBottom
      TabOrder = 1
      object gridData2: TDBGridEh
        Left = 2
        Top = 15
        Width = 676
        Height = 145
        Align = alClient
        DataSource = ds_active2
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
        IndicatorTitle.ShowDropDownSign = True
        IndicatorTitle.TitleButton = True
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghTraceColSizing, dghIncSearch, dghPreferIncSearch, dghRowHighlight, dghDblClickOptimizeColWidth, dghDialogFind]
        ParentFont = False
        ParentShowHint = False
        PopupMenu = PopupMenu1
        RowHeight = 2
        RowLines = 1
        RowSizingAllowed = True
        ShowHint = True
        SortLocal = True
        STFilter.Local = True
        SumList.Active = True
        SumList.VirtualRecords = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        UseMultiTitle = True
        VertScrollBar.Tracking = True
        OnColWidthsChanged = gridDataColWidthsChanged
        OnEnter = gridData2Enter
        OnGetCellParams = gridData2GetCellParams
        OnGetFooterParams = gridData2GetFooterParams
      end
    end
  end
  inherited PnlTop: TPanel
    inherited CoolBar1: TCoolBar
      inherited ToolBar1: TToolBar
        ButtonWidth = 73
        inherited ToolButton2: TToolButton
          Left = 73
        end
        inherited DBNavigator1: TDBNavigator
          Left = 81
          Hints.Strings = ()
        end
        inherited ToolButton3: TToolButton
          Left = 311
        end
        inherited tbtnFilter: TToolButton
          Left = 319
        end
        object tbtnOperation: TToolButton
          Left = 392
          Top = 0
          Caption = 'Operation'
          ImageIndex = 13
          OnClick = tbtnOperationClick
        end
      end
    end
  end
  inherited ds_active: TDataSource
    Left = 122
    Top = 1
  end
  inherited PropStorageEh1: TPropStorageEh
    StoredProps.Strings = (
      '<P>.ActiveControl'
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width'
      'pnlBody.GroupBox2.gridData2.<P>.Columns.ColumnsIndex'
      'pnlBody.GroupBox2.gridData2.<P>.Columns.<ForAllItems>.Width')
  end
  inherited adt_active: TADODataSet
    Left = 82
    Top = 3
  end
  object adt_active2: TADODataSet [8]
    AfterPost = adt_active2AfterPost
    OnDeleteError = adt_active2DeleteError
    OnEditError = adt_active2EditError
    OnPostError = adt_active2PostError
    Parameters = <>
    Left = 162
    Top = 3
  end
  object ds_active2: TDataSource [9]
    DataSet = adt_active2
    Left = 206
    Top = 3
  end
end
