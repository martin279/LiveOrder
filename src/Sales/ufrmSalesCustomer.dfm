inherited frmSalesCustomer: TfrmSalesCustomer
  Caption = 'frmSalesCustomer'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlTop: TPanel
    inherited CoolBar1: TCoolBar
      inherited ToolBar1: TToolBar
        inherited DBNavigator1: TDBNavigator
          Hints.Strings = ()
        end
      end
    end
  end
  inherited pnlBottom: TPanel
    Top = 368
    Height = 74
    object Label1: TLabel
      Left = 40
      Top = 24
      Width = 26
      Height = 13
      Caption = 'Sales'
    end
    object Label2: TLabel
      Left = 288
      Top = 24
      Width = 44
      Height = 13
      Caption = 'Customer'
    end
    object dbcbbSales: TDBLookupComboboxEh
      Left = 80
      Top = 24
      Width = 169
      Height = 21
      DropDownBox.Columns = <
        item
          FieldName = 'DisplayName'
          Title.Caption = 'SalesName'
        end>
      DropDownBox.Options = [dlgColumnResizeEh, dlgColLinesEh, dlgRowLinesEh, dlgAutoSortMarkingEh, dlgMultiSortMarkingEh]
      DropDownBox.SortLocal = True
      DropDownBox.ShowTitles = True
      DropDownBox.Sizable = True
      EditButtons = <>
      KeyField = 'LoginID'
      ListField = 'DisplayName'
      ListSource = ds_sales
      TabOrder = 0
      Visible = True
    end
    object dbcbbCustomer: TDBLookupComboboxEh
      Left = 352
      Top = 24
      Width = 233
      Height = 21
      DropDownBox.Columns = <
        item
          FieldName = 'CustomerNumber'
          Title.Caption = 'Customer Number'
        end
        item
          FieldName = 'CustomerName'
          Title.Caption = 'Customer Name'
        end>
      DropDownBox.Options = [dlgColumnResizeEh, dlgColLinesEh, dlgRowLinesEh, dlgAutoSortMarkingEh, dlgMultiSortMarkingEh]
      DropDownBox.SortLocal = True
      DropDownBox.ShowTitles = True
      DropDownBox.Sizable = True
      EditButtons = <>
      KeyField = 'CustomerID'
      ListField = 'CustomerNumber'
      ListSource = ds_customer
      TabOrder = 1
      Visible = True
    end
    object btnSave: TButton
      Left = 600
      Top = 24
      Width = 75
      Height = 25
      Caption = 'Save'
      TabOrder = 2
      OnClick = btnSaveClick
    end
  end
  inherited pnlBody: TPanel
    Height = 343
    inherited Splitter1: TSplitter
      Top = 340
    end
    inherited PageControl1: TPageControl
      Align = alTop
      inherited tbsBody1: TTabSheet
        inherited GroupBox1: TGroupBox
          inherited gridData: TDBGridEh
            Columns = <
              item
                EditButtons = <>
                FieldName = 'SalesID'
                Footers = <>
                Title.Caption = 'ID'
                Width = 41
              end
              item
                EditButtons = <>
                FieldName = 'BusinessApplicationName1'
                Footers = <>
                Title.Caption = 'Business Application'
              end
              item
                EditButtons = <>
                FieldName = 'DisplayName1'
                Footers = <>
                Title.Caption = 'Sales Name'
                Width = 99
              end
              item
                EditButtons = <>
                FieldName = 'SalesPhone'
                Footers = <>
                Title.Caption = 'Sales Phone'
              end
              item
                EditButtons = <>
                FieldName = 'SalesFax'
                Footers = <>
                Title.Caption = 'Sales Fax'
              end
              item
                EditButtons = <>
                FieldName = 'SalesMail'
                Footers = <>
                Title.Caption = 'Sales Mail'
              end>
          end
        end
      end
    end
    inherited GroupBox2: TGroupBox
      Top = 211
      Height = 129
      Align = alClient
      inherited gridData2: TDBGridEh
        Height = 112
        Columns = <
          item
            DropDownBox.Options = [dlgColumnResizeEh, dlgColLinesEh]
            DropDownBox.UseMultiTitle = True
            DropDownRows = 14
            DropDownShowTitles = True
            DropDownSizing = True
            DropDownWidth = -1
            EditButtons = <>
            FieldName = 'CustomerName1'
            Footers = <>
            LookupDisplayFields = 'CustomerNumber;CustomerName'
            Title.Caption = 'Customer Name'
          end
          item
            EditButtons = <>
            FieldName = 'CustomerNumber'
            Footers = <>
            Title.Caption = 'Customer Number'
            Width = 133
          end>
      end
    end
  end
  inherited adt_active: TADODataSet
    BeforeDelete = adt_activeBeforeDelete
    AfterScroll = adt_activeAfterScroll
    CommandText = 
      'select s.*,l.DisplayName from Sales s'#13#10'     left outer join Logi' +
      'n l on s.LoginID=l.LoginID'
    object adt_activeSalesID: TAutoIncField
      FieldName = 'SalesID'
      ReadOnly = True
    end
    object adt_activeSalesPhone: TStringField
      FieldName = 'SalesPhone'
    end
    object adt_activeSalesFax: TStringField
      FieldName = 'SalesFax'
    end
    object adt_activeSalesMail: TStringField
      FieldName = 'SalesMail'
      Size = 50
    end
    object adt_activeBusinessApplicationID: TIntegerField
      FieldName = 'BusinessApplicationID'
    end
    object adt_activeLoginID: TIntegerField
      FieldName = 'LoginID'
    end
    object adt_activeDisplayName: TStringField
      FieldName = 'DisplayName'
    end
    object adt_activeBusinessApplicationName1: TStringField
      FieldKind = fkLookup
      FieldName = 'BusinessApplicationName1'
      LookupDataSet = adt_business
      LookupKeyFields = 'BusinessApplicationID'
      LookupResultField = 'BusinessApplicationName'
      KeyFields = 'BusinessApplicationID'
      Size = 10
      Lookup = True
    end
    object adt_activeDisplayName1: TStringField
      FieldKind = fkLookup
      FieldName = 'DisplayName1'
      LookupDataSet = adt_login
      LookupKeyFields = 'LoginID'
      LookupResultField = 'DisplayName'
      KeyFields = 'LoginID'
      Lookup = True
    end
  end
  inherited adt_active2: TADODataSet
    BeforePost = adt_active2BeforePost
    BeforeDelete = adt_active2BeforeDelete
    CommandText = 
      'SELECT sc.*'#13#10'     ,c.CustomerNumber,c.CustomerName'#13#10'     FROM Sa' +
      'lesCustomer sc'#13#10'     LEFT OUTER JOIN Customer c ON sc.CustomerID' +
      ' = c.CustomerID'
    Left = 242
    object adt_active2SalesCustomerID: TAutoIncField
      FieldName = 'SalesCustomerID'
      ReadOnly = True
    end
    object adt_active2SalesID: TIntegerField
      FieldName = 'SalesID'
    end
    object adt_active2CustomerID: TIntegerField
      FieldName = 'CustomerID'
    end
    object adt_active2CustomerNumber: TStringField
      FieldName = 'CustomerNumber'
      Size = 10
    end
    object adt_active2CustomerName: TStringField
      FieldName = 'CustomerName'
      Size = 40
    end
    object adt_active2CustomerName1: TStringField
      FieldKind = fkLookup
      FieldName = 'CustomerName1'
      LookupDataSet = adt_customer
      LookupKeyFields = 'CustomerID'
      LookupResultField = 'CustomerName'
      KeyFields = 'CustomerID'
      Size = 40
      Lookup = True
    end
  end
  inherited ds_active2: TDataSource
    Left = 286
  end
  object adt_business: TADODataSet
    Connection = DM.ADOConnection1
    CommandText = 'select * from BusinessApplication'
    Parameters = <>
    Left = 384
    Top = 49
  end
  object adt_login: TADODataSet
    Connection = DM.ADOConnection1
    CommandText = 'select * from Login'
    Parameters = <>
    Left = 440
    Top = 49
  end
  object adt_customer: TADODataSet
    Connection = DM.ADOConnection1
    CommandText = 
      'select c.CustomerID,c.CustomerNumber,c.CustomerName'#13#10'    ,c.Full' +
      'Name,c.ChineseName,c.Country,c.ContactPerson,c.Telephone'#13#10'    ,c' +
      '.Fax,c.CellPhone,c.Email,c.PlantID,p.PlantCode'#13#10'     from Custom' +
      'er c'#13#10'     left outer join Plant p on c.PlantID=p.PlantID'
    Parameters = <>
    Left = 496
    Top = 49
  end
  object ds_customer: TDataSource
    DataSet = adt_customer
    Left = 492
    Top = 84
  end
  object adt_sales: TADODataSet
    Connection = DM.ADOConnection1
    CommandText = 'select * from ViewSales'
    Parameters = <>
    Left = 552
    Top = 49
  end
  object ds_sales: TDataSource
    DataSet = adt_sales
    Left = 556
    Top = 92
  end
end
