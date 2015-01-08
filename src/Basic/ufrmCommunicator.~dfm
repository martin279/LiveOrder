inherited frmCommunicator: TfrmCommunicator
  Left = 355
  Top = 161
  Width = 782
  Caption = 'frmCommunicator'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBottom: TPanel
    Width = 766
  end
  inherited pnlBody: TPanel
    Width = 766
    inherited PageControl1: TPageControl
      Width = 766
      inherited tbsBody1: TTabSheet
        inherited GroupBox1: TGroupBox
          Width = 758
          inherited PreviewSetupPanel: TPanel
            Width = 754
          end
          inherited PreviewBox1: TPreviewBox
            Width = 754
          end
          inherited gridData: TDBGridEh
            Width = 754
            OnDblClick = MenuEdtCommunicatorClick
            Columns = <
              item
                EditButtons = <>
                FieldName = 'CommunicatorID'
                Footers = <>
                Title.Caption = 'ID'
                Width = 45
              end
              item
                EditButtons = <>
                FieldName = 'DisplayName'
                Footers = <>
                Title.Caption = 'Display Name'
              end
              item
                EditButtons = <>
                FieldName = 'CommunicatorCode'
                Footers = <>
                Title.Caption = 'Communicator Code'
                Width = 81
              end
              item
                EditButtons = <>
                FieldName = 'CommunicatorPhone'
                Footers = <>
                Title.Caption = 'Phone'
              end
              item
                EditButtons = <>
                FieldName = 'CommunicatorFax'
                Footers = <>
                Title.Caption = 'Fax'
              end
              item
                EditButtons = <>
                FieldName = 'CommunicatorMail'
                Footers = <>
                Title.Caption = 'Mail'
              end
              item
                EditButtons = <>
                FieldName = 'IsValid'
                Footers = <>
                Title.Caption = 'Is Valid'
              end>
          end
        end
      end
    end
  end
  inherited PnlTop: TPanel
    Width = 766
    inherited CoolBar1: TCoolBar
      Width = 766
      Bands = <
        item
          Control = ToolBar1
          ImageIndex = -1
          Width = 766
        end>
      inherited ToolBar1: TToolBar
        Width = 753
        ButtonWidth = 64
        inherited ToolButton2: TToolButton
          Left = 64
        end
        inherited DBNavigator1: TDBNavigator
          Left = 72
          Hints.Strings = ()
        end
        inherited ToolButton3: TToolButton
          Left = 302
        end
        inherited tbtnFilter: TToolButton
          Left = 310
        end
        object tbtnRefresh: TToolButton
          Left = 374
          Top = 0
          Caption = 'Refresh'
          ImageIndex = 19
          OnClick = tbtnRefreshClick
        end
      end
    end
  end
  inherited PopupMenu1: TPopupMenu
    object N2: TMenuItem
      Caption = '-'
    end
    object MenuEdtCommunicator: TMenuItem
      Caption = 'Edit && Assign Customer'
      OnClick = MenuEdtCommunicatorClick
    end
  end
  inherited adt_active: TADODataSet
    Connection = DM.ADOConnection1
    BeforeInsert = adt_activeBeforeInsert
    CommandText = 'select * from ViewCommunicator'
    object adt_activeCommunicatorID: TAutoIncField
      FieldName = 'CommunicatorID'
      ReadOnly = True
    end
    object adt_activeCommunicatorCode: TStringField
      FieldName = 'CommunicatorCode'
      Size = 3
    end
    object adt_activeCommunicatorPhone: TStringField
      FieldName = 'CommunicatorPhone'
      Size = 30
    end
    object adt_activeCommunicatorFax: TStringField
      FieldName = 'CommunicatorFax'
      Size = 30
    end
    object adt_activeCommunicatorMail: TStringField
      FieldName = 'CommunicatorMail'
      Size = 50
    end
    object adt_activeLoginID: TIntegerField
      FieldName = 'LoginID'
    end
    object adt_activeIsValid: TBooleanField
      FieldName = 'IsValid'
    end
    object adt_activeDisplayName: TStringField
      FieldName = 'DisplayName'
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
end
