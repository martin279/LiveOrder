object fCustomPreview: TfCustomPreview
  Left = 250
  Top = 159
  Width = 696
  Height = 480
  Caption = 'Custom preview form'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 680
    Height = 41
    Align = alTop
    TabOrder = 0
    object bPrint: TButton
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Print'
      TabOrder = 0
      OnClick = bPrintClick
    end
    object bPrinterSetupDialog: TButton
      Left = 88
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Printer setup'
      TabOrder = 1
      OnClick = bPrinterSetupDialogClick
    end
    object bPrevPage: TButton
      Left = 168
      Top = 8
      Width = 75
      Height = 25
      Caption = '< Previous'
      TabOrder = 2
      OnClick = bPrevPageClick
    end
    object bNextPage: TButton
      Left = 248
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Next >'
      TabOrder = 3
      OnClick = bNextPageClick
    end
    object bStop: TButton
      Left = 328
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Stop'
      TabOrder = 4
    end
    object bClose: TButton
      Left = 408
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Close'
      TabOrder = 5
      OnClick = bCloseClick
    end
  end
  object PreviewBox1: TPreviewBox
    Left = 0
    Top = 41
    Width = 680
    Height = 382
    HorzScrollBar.Tracking = True
    VertScrollBar.Tracking = True
    Align = alClient
    AutoScroll = False
    TabOrder = 1
    OnOpenPreviewer = PreviewBox1OpenPreviewer
    OnPrinterPreviewChanged = PreviewBox1PrinterPreviewChanged
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 423
    Width = 680
    Height = 19
    Panels = <>
    SimplePanel = True
  end
end
