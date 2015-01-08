inherited frmPriceApprove: TfrmPriceApprove
  Caption = 'frmPriceApprove'
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
  inherited pnlBody: TPanel
    inherited GroupBox1: TGroupBox
      inherited gridData: TDBGridEh
        Columns = <
          item
            EditButtons = <>
            FieldName = 'PriceID'
            Footers = <>
            Title.Caption = 'ID'
            Width = 41
          end
          item
            EditButtons = <>
            FieldName = 'PriceStatesName'
            Footers = <>
            Title.Caption = 'Price States'
            Width = 77
          end
          item
            EditButtons = <>
            FieldName = 'CustomerNumber'
            Footers = <>
            Title.Caption = 'Customer No.'
            Width = 56
          end
          item
            EditButtons = <>
            FieldName = 'CustomerName'
            Footers = <>
            Title.Caption = 'Customer Name'
            Width = 128
          end
          item
            EditButtons = <>
            FieldName = 'Model'
            Footers = <>
            Width = 119
          end
          item
            EditButtons = <>
            FieldName = 'DemandQuantity'
            Footers = <>
            Title.Caption = 'Demand Qty.'
            Width = 46
          end
          item
            EditButtons = <>
            FieldName = 'Currency'
            Footers = <>
            Width = 50
          end
          item
            EditButtons = <>
            FieldName = 'Price'
            Footers = <>
            Width = 53
          end
          item
            EditButtons = <>
            FieldName = 'PaymentTerms'
            Footers = <>
            Title.Caption = 'Payment Terms'
            Width = 100
          end
          item
            EditButtons = <>
            FieldName = 'PriceTerms'
            Footers = <>
            Title.Caption = 'Price Term'
            Width = 100
          end
          item
            DisplayFormat = 'YYYY-mm-dd'
            EditButtons = <>
            FieldName = 'EffectDate'
            Footers = <>
            Title.Caption = 'Effect Date'
            Width = 100
          end
          item
            EditButtons = <>
            FieldName = 'Remark'
            Footers = <>
            Width = 103
          end
          item
            EditButtons = <>
            FieldName = 'DisplayName'
            Footers = <>
            Title.Caption = 'Creator'
          end
          item
            DisplayFormat = 'YYYY-mm-dd hh:mm'
            EditButtons = <>
            FieldName = 'CreateTime'
            Footers = <>
            Title.Caption = 'Create Time'
            Width = 100
          end>
      end
    end
    inherited GroupBox2: TGroupBox
      inherited gridData2: TDBGridEh
        Columns = <
          item
            EditButtons = <>
            FieldName = 'PriceID'
            Footers = <>
            Title.Caption = 'ID'
            Width = 43
          end
          item
            EditButtons = <>
            FieldName = 'PriceStatesName'
            Footers = <>
            Title.Caption = 'Price States'
            Width = 79
          end
          item
            EditButtons = <>
            FieldName = 'CustomerNumber'
            Footers = <>
            Title.Caption = 'Customer No.'
            Width = 59
          end
          item
            EditButtons = <>
            FieldName = 'CustomerName'
            Footers = <>
            Title.Caption = 'Customer Name'
            Width = 129
          end
          item
            EditButtons = <>
            FieldName = 'Model'
            Footers = <>
            Width = 117
          end
          item
            EditButtons = <>
            FieldName = 'DemandQuantity'
            Footers = <>
            Title.Caption = 'Demand Qty.'
            Width = 47
          end
          item
            EditButtons = <>
            FieldName = 'Currency'
            Footers = <>
            Width = 53
          end
          item
            EditButtons = <>
            FieldName = 'Price'
            Footers = <>
            Width = 51
          end
          item
            EditButtons = <>
            FieldName = 'PaymentTerms'
            Footers = <>
            Title.Caption = 'Payment Terms'
            Width = 100
          end
          item
            EditButtons = <>
            FieldName = 'PriceTerms'
            Footers = <>
            Title.Caption = 'Price Terms'
            Width = 100
          end
          item
            DisplayFormat = 'YYYY-mm-dd'
            EditButtons = <>
            FieldName = 'EffectDate'
            Footers = <>
            Width = 100
          end
          item
            EditButtons = <>
            FieldName = 'Remark'
            Footers = <>
            Width = 98
          end
          item
            EditButtons = <>
            FieldName = 'DisplayName'
            Footers = <>
            Title.Caption = 'Creator'
          end
          item
            DisplayFormat = 'YYYY-mm-dd hh:mm'
            EditButtons = <>
            FieldName = 'CreateTime'
            Footers = <>
            Title.Caption = 'Create Time'
          end>
      end
    end
  end
  inherited PopupMenu1: TPopupMenu
    object MenuApprove: TMenuItem
      Caption = 'Approve'
      OnClick = MenuApproveClick
    end
    object MenuBack: TMenuItem
      Caption = 'Back'
      OnClick = MenuBackClick
    end
  end
  inherited adt_active: TADODataSet
    object adt_activePriceID: TAutoIncField
      FieldName = 'PriceID'
      ReadOnly = True
    end
    object adt_activeCustomerID: TIntegerField
      FieldName = 'CustomerID'
    end
    object adt_activeModelID: TIntegerField
      FieldName = 'ModelID'
    end
    object adt_activeCurrency: TStringField
      FieldName = 'Currency'
      Size = 10
    end
    object adt_activePrice: TBCDField
      FieldName = 'Price'
      Precision = 18
      Size = 2
    end
    object adt_activeDemandQuantity: TIntegerField
      FieldName = 'DemandQuantity'
    end
    object adt_activePaymentTerms: TStringField
      FieldName = 'PaymentTerms'
      Size = 30
    end
    object adt_activePriceterm: TStringField
      FieldName = 'PriceTerms'
      Size = 30
    end
    object adt_activeEffectDate: TDateTimeField
      FieldName = 'EffectDate'
    end
    object adt_activeRemark: TStringField
      FieldName = 'Remark'
      Size = 30
    end
    object adt_activeCustomerNumber: TStringField
      FieldName = 'CustomerNumber'
      Size = 10
    end
    object adt_activeCustomerName: TStringField
      FieldName = 'CustomerName'
      Size = 40
    end
    object adt_activeModel: TStringField
      FieldName = 'Model'
      Size = 25
    end
    object adt_activePriceStatesID: TIntegerField
      FieldName = 'PriceStatesID'
    end
    object adt_activePriceStatesName: TStringField
      FieldName = 'PriceStatesName'
      Size = 15
    end
    object adt_activeCreatorLoginID: TIntegerField
      FieldName = 'CreatorLoginID'
    end
    object adt_activeDisplayName: TStringField
      FieldName = 'DisplayName'
    end
    object adt_activeCreateTime: TDateTimeField
      FieldName = 'CreateTime'
    end
  end
  inherited adt_active2: TADODataSet
    CommandText = 
      'select p.PriceID,p.CustomerID,p.ModelID,p.Currency'#13#10'     ,p.Pric' +
      'e,p.DemandQuantity,p.PaymentTerms,p.Priceterm,p.Incoterms'#13#10'     ' +
      ',p.EffectDate,p.Remark,c.CustomerNumber,c.CustomerName,m.Model'#13#10 +
      '     ,p.PriceStatesID,s.PriceStatesName,p.CreatorLoginID,l.Displ' +
      'ayName,p.CreateTime'#13#10'     from Price p '#13#10'     left outer join Cu' +
      'stomer c on p.CustomerID=c.CustomerID'#13#10'     left outer join Mode' +
      'l m on p.ModelID=m.ModelID'#13#10'     left outer join PriceStates s o' +
      'n p.PriceStatesID=s.PriceStatesID'#13#10'     left outer join Login l ' +
      'on c.CreatorLoginID=l.LoginID'#13#10
    object adt_active2PriceID: TAutoIncField
      FieldName = 'PriceID'
      ReadOnly = True
    end
    object adt_active2CustomerID: TIntegerField
      FieldName = 'CustomerID'
    end
    object adt_active2ModelID: TIntegerField
      FieldName = 'ModelID'
    end
    object adt_active2Currency: TStringField
      FieldName = 'Currency'
      Size = 10
    end
    object adt_active2Price: TBCDField
      FieldName = 'Price'
      Precision = 18
      Size = 2
    end
    object adt_active2DemandQuantity: TIntegerField
      FieldName = 'DemandQuantity'
    end
    object adt_active2PaymentTerms: TStringField
      FieldName = 'PaymentTerms'
      Size = 30
    end
    object adt_active2Priceterm: TStringField
      FieldName = 'PriceTerms'
      Size = 30
    end
    object adt_active2EffectDate: TDateTimeField
      FieldName = 'EffectDate'
    end
    object adt_active2Remark: TStringField
      FieldName = 'Remark'
      Size = 30
    end
    object adt_active2CustomerNumber: TStringField
      FieldName = 'CustomerNumber'
      Size = 10
    end
    object adt_active2CustomerName: TStringField
      FieldName = 'CustomerName'
      Size = 40
    end
    object adt_active2Model: TStringField
      FieldName = 'Model'
      Size = 25
    end
    object adt_active2PriceStatesID: TIntegerField
      FieldName = 'PriceStatesID'
    end
    object adt_active2PriceStatesName: TStringField
      FieldName = 'PriceStatesName'
      Size = 15
    end
    object adt_active2CreatorLoginID: TIntegerField
      FieldName = 'CreatorLoginID'
    end
    object adt_active2DisplayName: TStringField
      FieldName = 'DisplayName'
    end
    object adt_active2CreateTime: TDateTimeField
      FieldName = 'CreateTime'
    end
  end
end
