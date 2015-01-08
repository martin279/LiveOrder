inherited frmProduct2: TfrmProduct2
  Left = 622
  Top = 307
  Caption = 'frmProduct2'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBody: TPanel
    inherited PageControl1: TPageControl
      Top = 57
      Height = 319
      inherited tbsBody1: TTabSheet
        inherited GroupBox1: TGroupBox
          Height = 288
          inherited PreviewBox1: TPreviewBox
            Top = 197
          end
          inherited gridData: TDBGridEh
            Height = 141
            Columns = <
              item
                EditButtons = <>
                FieldName = 'ProductTrackingID'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'ProductSerialNumber'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'WarrentycardCode'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'WarrentycardReturnDate'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'Remarks'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'ProductionStartTime'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'ScheduleStartTime'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'ProductTrackingStatesName'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'CustomerOrderNumber'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'RTD'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'ETD'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'ATD'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'CustomerPurchaseOrderNumber'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'CustomerOrderStatesName'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'CustomerNumber'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'CustomerName'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'Model'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'ModelDescription'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'ProductSeriesName'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'ProductSeriesDesc'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'ProductSeriesChineseDesc'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'IsCHN'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'ProductPackgeType'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'ProductGrossWeight'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'ProductSize'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'CustomerOrderQuantity'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'InvoiceNumber'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'ComponentSerialNumber'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'ComponentItem'
                Footers = <>
              end>
          end
        end
      end
    end
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 675
      Height = 57
      Align = alTop
      TabOrder = 1
      object chkProductSN: TCheckBox
        Left = 16
        Top = 18
        Width = 81
        Height = 17
        Caption = 'Product SN.'
        TabOrder = 0
      end
      object edtProductSN: TEdit
        Left = 112
        Top = 16
        Width = 121
        Height = 21
        TabOrder = 1
      end
      object edtComponentSN: TEdit
        Left = 344
        Top = 18
        Width = 121
        Height = 21
        TabOrder = 2
      end
      object chkComponentSN: TCheckBox
        Left = 248
        Top = 20
        Width = 89
        Height = 17
        Caption = 'Component SN.'
        TabOrder = 3
      end
      object btnQuery: TButton
        Left = 514
        Top = 16
        Width = 73
        Height = 25
        Caption = 'Query'
        TabOrder = 4
        OnClick = btnQueryClick
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
  inherited adt_active: TADODataSet
    CursorType = ctStatic
    CommandText = 
      'select p.ProductTrackingID,p.ProductionScheduleID,p.ProductSeria' +
      'lNumber,p.WarrentycardCode,p.WarrentycardReturnDate'#13#10',p.Remarks,' +
      'p.ProductionStartTime,p.ProductTrackingStatesID'#13#10',ps.ScheduleSta' +
      'rtTime,a.Line'#13#10',s.ProductTrackingStatesName'#13#10',c.CustomerOrderID,' +
      'c.CustomerID,c.ModelID,c.CustomerOrderNumber,c.RTD,c.ETD,c.ATD,c' +
      '.CustomerPurchaseOrderNumber'#13#10',es.CustomerOrderStatesName'#13#10',r.Cu' +
      'stomerNumber,r.CustomerName,r.Country,r.CustomerAddress,r.Contac' +
      'tPerson,r.Telephone,r.Fax'#13#10',m.Model,m.ModelDescription,m.Product' +
      'SeriesID'#13#10',pt.ProductSeriesName,pt.ProductSeriesDesc,pt.ProductS' +
      'eriesChineseDesc'#13#10',pd.IsCHN,pd.ProductPackgeType'#13#10',(Convert(varc' +
      'har(20),pd.ProductGrossWeight)+pd.ProductWeightUnit) as ProductG' +
      'rossWeight'#13#10',pd.ProductSize'#13#10',c.CustomerOrderQuantity,c.InvoiceN' +
      'umber'#13#10',pc.ComponentSerialNumber,ct.ComponentItem'#13#10'    from Prod' +
      'uctTracking p'#13#10'    left outer join ProductTrackingStates s on p.' +
      'ProductTrackingStatesID=s.ProductTrackingStatesID'#13#10'    left oute' +
      'r join ProductionScheduleCUD ps on p.ProductionScheduleID=ps.Pro' +
      'ductionScheduleID'#13#10'     left outer join AssemblyLine a on ps.Ass' +
      'emblyLineID=a.AssemblyLineID'#13#10'    left outer join CustomerOrder ' +
      'c on ps.CustomerOrderID=c.CustomerOrderID'#13#10'     left outer join ' +
      'CustomerOrderStates es on c.CustomerOrderStatesID=es.CustomerOrd' +
      'erStatesID'#13#10'    left outer join Customer r on c.CustomerID=r.Cus' +
      'tomerID'#13#10'    left outer join Model m on c.ModelID=m.ModelID'#13#10'   ' +
      ' left outer join ProductSeries pt on m.ProductSeriesID=pt.Produc' +
      'tSeriesID'#13#10'    left outer join ProductPackgeCUD pd on ( pd.Produ' +
      'ctSeriesID= pt.ProductSeriesID and pd.IsCHN=r.IsCHN)'#13#10'left outer' +
      ' join ProductComponentTracking pc on p.ProductTrackingID=pc.Prod' +
      'uctTrackingID'#13#10'left outer join Component ct on pc.ComponentID=ct' +
      '.ComponentID'#13#10'where ct.ComponentSeriesID=113'
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
