inherited frmUser: TfrmUser
  Left = 562
  Top = 153
  Caption = 'frmUser'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBody: TPanel
    inherited PageControl1: TPageControl
      inherited tbsBody1: TTabSheet
        inherited GroupBox1: TGroupBox
          inherited gridData: TDBGridEh
            OnCellClick = gridDataCellClick
            Columns = <
              item
                EditButtons = <>
                FieldName = 'LoginID'
                Footers = <>
                Title.Caption = 'Login ID'
              end
              item
                EditButtons = <>
                FieldName = 'LoginName'
                Footers = <>
                Title.Caption = 'Login Name'
              end
              item
                EditButtons = <>
                FieldName = 'LoginPassword'
                Footers = <>
                Title.Caption = 'Login Password'
              end
              item
                EditButtons = <>
                FieldName = 'DisplayName'
                Footers = <>
                Title.Caption = 'Display Name'
              end
              item
                EditButtons = <>
                FieldName = 'UserCode'
                Footers = <>
                Title.Caption = 'User Code'
              end
              item
                EditButtons = <>
                FieldName = 'AccessLevel'
                Footers = <>
                Title.Caption = 'Access Level'
              end
              item
                EditButtons = <>
                FieldName = 'AccessLevelDesc'
                Footers = <>
                Title.Caption = 'Access Level Desc'
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
    inherited GroupBox2: TGroupBox
      inherited gridData2: TDBGridEh
        Columns = <
          item
            EditButtons = <>
            FieldName = 'LoginID'
            Footers = <>
            Title.Caption = 'Login ID'
          end
          item
            EditButtons = <>
            FieldName = 'MainframeLogin'
            Footers = <>
            Title.Caption = 'Mainframe Login'
            Width = 115
          end
          item
            EditButtons = <>
            FieldName = 'MainframePassword'
            Footers = <>
            Title.Caption = 'Mainframe Password'
          end
          item
            EditButtons = <>
            FieldName = 'MainframeInitial'
            Footers = <>
            Title.Caption = 'Mainframe Initial'
          end
          item
            EditButtons = <>
            FieldName = 'MainframeScreen'
            Footers = <>
            Title.Caption = 'Mainframe Screen'
            Width = 69
          end
          item
            EditButtons = <>
            FieldName = 'PlantCode1'
            Footers = <>
            Title.Caption = 'Plant Code'
            Width = 109
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
    object MenuAssignMenu: TMenuItem
      Caption = 'Assign Menu'
      OnClick = MenuAssignMenuClick
    end
    object MenuAssignPlant: TMenuItem
      Caption = 'Assign Plant && Application'
      OnClick = MenuAssignPlantClick
    end
  end
  inherited adt_active2: TADODataSet
    object adt_active2MainframeAccessID: TAutoIncField
      FieldName = 'MainframeAccessID'
      ReadOnly = True
    end
    object adt_active2LoginID: TIntegerField
      FieldName = 'LoginID'
    end
    object adt_active2MainframeLogin: TStringField
      FieldName = 'MainframeLogin'
      Size = 30
    end
    object adt_active2MainframePassword: TStringField
      FieldName = 'MainframePassword'
      Size = 16
    end
    object adt_active2MainframeInitial: TStringField
      FieldName = 'MainframeInitial'
      Size = 10
    end
    object adt_active2MainframeScreen: TStringField
      FieldName = 'MainframeScreen'
      Size = 4
    end
    object adt_active2PlantID: TIntegerField
      FieldName = 'PlantID'
    end
    object adt_active2PlantCode: TStringField
      FieldName = 'PlantCode'
      Size = 2
    end
    object adt_active2PlantCode1: TStringField
      FieldKind = fkLookup
      FieldName = 'PlantCode1'
      LookupDataSet = adt_plant
      LookupKeyFields = 'PlantID'
      LookupResultField = 'PlantCode'
      KeyFields = 'PlantID'
      Size = 15
      Lookup = True
    end
  end
  object adt_plant: TADODataSet
    Parameters = <>
    Left = 448
    Top = 49
  end
end
