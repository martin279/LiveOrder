inherited frmDBBasicTreeDT: TfrmDBBasicTreeDT
  Caption = 'frmDBBasicTreeDT'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBody: TPanel
    object Splitter2: TSplitter [0]
      Left = 0
      Top = 123
      Width = 542
      Height = 3
      Cursor = crVSplit
      Align = alBottom
      Color = clActiveCaption
      ParentColor = False
    end
    inherited PageControl1: TPageControl
      Height = 123
      inherited tbsBody1: TTabSheet
        inherited GroupBox1: TGroupBox
          Height = 92
          inherited gridData: TDBGridEh
            Height = 75
            OnEnter = gridDataEnter
          end
        end
      end
    end
    object pnlBodyRight: TPanel
      Left = 0
      Top = 126
      Width = 542
      Height = 250
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object GroupBox2: TGroupBox
        Left = 0
        Top = 0
        Width = 542
        Height = 209
        Align = alClient
        TabOrder = 0
        object gridData2: TDBGridEh
          Left = 2
          Top = 15
          Width = 538
          Height = 192
          Align = alClient
          DataSource = ds_active2
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
          ParentFont = False
          PopupMenu = PopupMenu1
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          UseMultiTitle = True
          OnEnter = gridData2Enter
          OnExit = gridData2Exit
          OnGetCellParams = gridData2GetCellParams
          OnGetFooterParams = gridData2GetFooterParams
        end
      end
      object pnlBodyBottom: TPanel
        Left = 0
        Top = 209
        Width = 542
        Height = 41
        Align = alBottom
        BevelInner = bvLowered
        BevelOuter = bvLowered
        TabOrder = 1
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
  end
  inherited SaveDialog1: TSaveDialog
    Top = 8
  end
  inherited adt_active: TADODataSet
    Left = 82
  end
  object ds_active2: TDataSource
    DataSet = adt_active2
    Left = 190
    Top = 3
  end
  object adt_active2: TADODataSet
    CursorType = ctStatic
    Parameters = <>
    Left = 154
    Top = 3
  end
end
