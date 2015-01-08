inherited frmCheckProductSN: TfrmCheckProductSN
  Left = 772
  Top = 422
  Width = 389
  Height = 211
  BorderIcons = []
  Caption = 'frmCheckProductSN'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 88
    Top = 16
    Width = 148
    Height = 29
    Caption = 'Scan Unit SN:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 24
    Top = 64
    Width = 329
    Height = 45
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnKeyPress = Edit1KeyPress
  end
end
