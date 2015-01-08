inherited frmDeliveryTracking: TfrmDeliveryTracking
  Width = 747
  Height = 595
  Caption = 'frmDeliveryTracking'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBottom: TPanel
    Top = 352
    Width = 731
    Height = 205
    object GroupBox2: TGroupBox
      Left = 0
      Top = 0
      Width = 731
      Height = 152
      Align = alClient
      TabOrder = 0
      object Label22: TLabel
        Left = 5
        Top = 20
        Width = 55
        Height = 13
        Caption = 'Invoice No.'
      end
      object dbcbbInvoice: TDBLookupComboboxEh
        Left = 64
        Top = 16
        Width = 121
        Height = 21
        DropDownBox.Sizable = True
        EditButtons = <>
        KeyField = 'InvoiceNumber'
        ListField = 'InvoiceNumber'
        ListSource = ds_Invoice
        TabOrder = 0
        Visible = True
      end
      object Button1: TButton
        Left = 200
        Top = 16
        Width = 75
        Height = 25
        Caption = 'Query'
        TabOrder = 1
        OnClick = Button1Click
      end
      object Panel1: TPanel
        Left = 2
        Top = 48
        Width = 727
        Height = 102
        Align = alBottom
        TabOrder = 2
        object gridCO: TDBGridEh
          Left = 1
          Top = 1
          Width = 725
          Height = 100
          Align = alClient
          DataSource = ds_co
          Flat = True
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = []
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
        end
      end
    end
    object Panel2: TPanel
      Left = 0
      Top = 152
      Width = 731
      Height = 53
      Align = alBottom
      TabOrder = 1
      object gboxLogistic: TGroupBox
        Left = 16
        Top = 4
        Width = 601
        Height = 44
        TabOrder = 0
        object Label20: TLabel
          Left = 172
          Top = 19
          Width = 71
          Height = 13
          Caption = 'On Board Date'
        end
        object Label27: TLabel
          Left = 390
          Top = 19
          Width = 68
          Height = 13
          Caption = 'Bill Of Landing'
        end
        object Label26: TLabel
          Left = 8
          Top = 19
          Width = 21
          Height = 13
          Caption = 'ATA'
        end
        object dtpOnBoardDate: TDBDateTimeEditEh
          Left = 256
          Top = 15
          Width = 121
          Height = 21
          EditButtons = <>
          Kind = dtkDateEh
          TabOrder = 0
          Visible = True
        end
        object dtpATA: TDBDateTimeEditEh
          Left = 40
          Top = 15
          Width = 121
          Height = 21
          EditButtons = <>
          Kind = dtkDateEh
          TabOrder = 1
          Visible = True
        end
        object edtLanding: TEdit
          Left = 462
          Top = 15
          Width = 121
          Height = 21
          TabOrder = 2
        end
      end
      object btnSave: TButton
        Left = 645
        Top = 16
        Width = 59
        Height = 25
        Caption = 'Save'
        TabOrder = 1
        OnClick = btnSaveClick
      end
    end
  end
  inherited pnlBody: TPanel
    Width = 731
    Height = 327
    inherited PageControl1: TPageControl
      Width = 731
      Height = 327
      inherited tbsBody1: TTabSheet
        inherited GroupBox1: TGroupBox
          Width = 723
          Height = 296
          inherited PreviewSetupPanel: TPanel
            Width = 719
          end
          inherited PreviewBox1: TPreviewBox
            Top = 205
            Width = 719
          end
          inherited gridData: TDBGridEh
            Width = 719
            Height = 149
            Columns = <
              item
                EditButtons = <>
                FieldName = 'InvoiceNumber'
                Footers = <>
                Title.Caption = 'Invoice No.'
              end
              item
                EditButtons = <>
                FieldName = 'CustomerNumber'
                Footers = <>
                Title.Caption = 'Customer Number'
                Width = 95
              end
              item
                EditButtons = <>
                FieldName = 'CustomerName'
                Footers = <>
                Title.Caption = 'Customer Name'
                Width = 94
              end
              item
                EditButtons = <>
                FieldName = 'Currency'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'ATD'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'Forwarder'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'CustomerOnBoardDate'
                Footers = <>
                Title.Caption = 'Customer OnBoard Date'
                Width = 135
              end
              item
                EditButtons = <>
                FieldName = 'ATA'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'BillOfLanding'
                Footers = <>
                Title.Caption = 'Bill Of Landing'
                Width = 80
              end>
          end
        end
      end
    end
  end
  inherited PnlTop: TPanel
    Width = 731
    inherited CoolBar1: TCoolBar
      Width = 731
      Bands = <
        item
          Control = ToolBar1
          ImageIndex = -1
          Width = 731
        end>
      inherited ToolBar1: TToolBar
        Width = 718
        inherited DBNavigator1: TDBNavigator
          Hints.Strings = ()
        end
      end
    end
  end
  inherited PopupMenu1: TPopupMenu
    Left = 628
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
  object ds_Invoice: TDataSource
    DataSet = adt_Invoice
    Left = 150
    Top = 373
  end
  object adt_Invoice: TADODataSet
    Parameters = <>
    Left = 102
    Top = 373
  end
  object ds_co: TDataSource
    DataSet = adt_co
    Left = 382
    Top = 397
  end
  object adt_co: TADODataSet
    Parameters = <>
    Left = 334
    Top = 397
  end
end
