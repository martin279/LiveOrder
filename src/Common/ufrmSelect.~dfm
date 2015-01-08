object frmSelect: TfrmSelect
  Left = 352
  Top = 153
  Width = 501
  Height = 434
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 493
    Height = 41
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    object DBNavigator1: TDBNavigator
      Left = 8
      Top = 8
      Width = 224
      Height = 25
      DataSource = ds_select
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Flat = True
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 493
    Height = 318
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 1
    object gridSelect: TDBGridEh
      Left = 1
      Top = 1
      Width = 491
      Height = 316
      Align = alClient
      DataSource = ds_select
      Flat = True
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      SortLocal = True
      STFilter.Local = True
      STFilter.Visible = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = gridSelectDblClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 359
    Width = 493
    Height = 41
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 2
    object btnClose: TButton
      Left = 120
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Close'
      ModalResult = 2
      TabOrder = 0
    end
    object btnSelect: TButton
      Left = 16
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Select'
      ModalResult = 1
      TabOrder = 1
    end
  end
  object ds_select: TDataSource
    Left = 280
    Top = 8
  end
end
