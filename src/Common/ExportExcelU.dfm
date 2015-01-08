object ExportExcelF: TExportExcelF
  Left = 459
  Top = 308
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = 'ExportExcelF'
  ClientHeight = 101
  ClientWidth = 210
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Times New Roman'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object BitBtn2: TBitBtn
    Left = 48
    Top = 64
    Width = 121
    Height = 25
    Caption = #24320#22987#23548#20837'EXCEL'
    TabOrder = 0
    OnClick = BitBtn2Click
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 193
    Height = 49
    Caption = #26159#21542#25171#21360
    TabOrder = 1
    object CheckBox1: TCheckBox
      Left = 32
      Top = 16
      Width = 137
      Height = 17
      Caption = #23548#20837#21040'EXCEL'#24182#25171#21360
      TabOrder = 0
    end
  end
  object ExcelApplication1: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
  end
  object ExcelWorksheet1: TExcelWorksheet
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 184
    Top = 64
  end
  object ExcelWorkbook1: TExcelWorkbook
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Top = 64
  end
  object SaveDialog1: TSaveDialog
    Left = 184
  end
end
