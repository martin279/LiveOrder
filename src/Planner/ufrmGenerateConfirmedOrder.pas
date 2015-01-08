unit ufrmGenerateConfirmedOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmDBBasicDT, PropFilerEh, MemTableDataEh, Db, ADODB,
  DataDriverEh, MemTableEh, Menus, PropStorageEh, ActnList, ImgList,
  GridsEh, DBGridEh, StdCtrls, ExtCtrls, DBCtrls, ComCtrls, ToolWin;

//const
 // IndicatorWidth = 22;

type
  TfrmGenerateConfirmedOrder = class(TfrmDBBasicDT)
    adt_activeCustomerOrderID: TAutoIncField;
    adt_activeCustomerOrderNumber: TStringField;
    adt_activeMNumber: TStringField;
    adt_activeInvoiceNumber: TStringField;
    adt_activeCustomerID: TIntegerField;
    adt_activeModelID: TIntegerField;
    adt_activeCurrency: TStringField;
    adt_activePrice: TFloatField;
    adt_activeCustomerOrderQuantity: TFloatField;
    adt_activeTotalAmount: TFloatField;
    adt_activeContractDate: TDateTimeField;
    adt_activeRTD: TDateTimeField;
    adt_activeETD: TDateTimeField;
    adt_activeATD: TDateTimeField;
    adt_activeETA: TDateTimeField;
    adt_activeATA: TDateTimeField;
    adt_activeRemark: TStringField;
    adt_activeCustomerPurchaseOrderNumber: TStringField;
    adt_activeReasonOfDelayID: TIntegerField;
    adt_activeCustomerOrderStatesID: TIntegerField;
    adt_activeCustomerNumber: TStringField;
    adt_activeCustomerName: TStringField;
    adt_activePlantID: TIntegerField;
    adt_activeModel: TStringField;
    adt_activePlantCode: TStringField;
    adt_activeCustomerOrderStatesName: TStringField;
    adt_activeReasonOfDelayDesc: TStringField;
    adt_active2CustomerOrderID: TAutoIncField;
    adt_active2CustomerOrderNumber: TStringField;
    adt_active2MNumber: TStringField;
    adt_active2InvoiceNumber: TStringField;
    adt_active2CustomerID: TIntegerField;
    adt_active2ModelID: TIntegerField;
    adt_active2Currency: TStringField;
    adt_active2Price: TFloatField;
    adt_active2CustomerOrderQuantity: TFloatField;
    adt_active2TotalAmount: TFloatField;
    adt_active2ContractDate: TDateTimeField;
    adt_active2RTD: TDateTimeField;
    adt_active2ETD: TDateTimeField;
    adt_active2ATD: TDateTimeField;
    adt_active2ETA: TDateTimeField;
    adt_active2ATA: TDateTimeField;
    adt_active2Remark: TStringField;
    adt_active2CustomerPurchaseOrderNumber: TStringField;
    adt_active2ReasonOfDelayID: TIntegerField;
    adt_active2CustomerOrderStatesID: TIntegerField;
    adt_active2CustomerNumber: TStringField;
    adt_active2CustomerName: TStringField;
    adt_active2PlantID: TIntegerField;
    adt_active2Model: TStringField;
    adt_active2PlantCode: TStringField;
    adt_active2CustomerOrderStatesName: TStringField;
    adt_active2ReasonOfDelayDesc: TStringField;
    adt_delay: TADODataSet;
    N2: TMenuItem;
    MenuConfirmOrder: TMenuItem;
    MenuBack: TMenuItem;
    procedure MenuConfirmOrderClick(Sender: TObject);
    procedure MenuBackClick(Sender: TObject);
    procedure gridDataEnter(Sender: TObject);
    procedure gridData2Enter(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure SetData; override;
    procedure SetUI; override;
    procedure SetAccess; override;
  public
    { Public declarations }
  end;


implementation

uses DataModule, uSQLConsts, uMJ, ufrmDBBasic;
{$R *.dfm}

{ TfrmGenerateConfirmedOrder }

procedure TfrmGenerateConfirmedOrder.SetData;
begin
  DM.DataSetQuery(adt_delay, format(sQueryReasonOfDelaySQL, ['']));
  DM.DataSetQuery(adt_active, format(sQueryCustomerOrderSQL, [' and c.CustomerOrderStatesID=2']));
  DM.DataSetQuery(adt_active2, format(sQueryCustomerOrderSQL, [' and c.CustomerOrderStatesID=3']));
end;

procedure TfrmGenerateConfirmedOrder.SetUI;
begin
  inherited;
  gridData.FrozenCols := 4;
  gridData2.FrozenCols := 4;
  pnlBottom.Visible := true;
  GroupBox1.Caption := 'Open Order--order waitting confirmed by scheduler';
  GroupBox2.Caption := 'Confirmed Order--order have been confirmed by scheduler';
end;

procedure TfrmGenerateConfirmedOrder.SetAccess;
var
  i: integer;
begin
  inherited;
  case StrToInt(CurUserLevel) of
    3:
      begin
        MenuBack.Visible := false;
        MenuConfirmOrder.Visible := true;
        DBNavigator1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbPost, nbCancel, nbRefresh];
        gridData.ReadOnly := false;
        for i := 0 to gridData.Columns.Count - 1 do
        begin
          if (gridData.Columns[i].FieldName = 'ETD')
            or (gridData.Columns[i].FieldName = 'ReasonOfDelayDesc2') then
            gridData.Columns[i].ReadOnly := false
          else
            gridData.Columns[i].ReadOnly := true;
        end;
      end;
  end;
end;

procedure TfrmGenerateConfirmedOrder.gridDataEnter(Sender: TObject);
begin
  inherited;
  case StrToInt(CurUserLevel) of
    3:
      begin
        MenuBack.Visible := false;
        MenuConfirmOrder.Visible := true;
      end;
  end;
end;

procedure TfrmGenerateConfirmedOrder.gridData2Enter(Sender: TObject);
begin
  inherited;
  case StrToInt(CurUserLevel) of
    3:
      begin
        MenuBack.Visible := true;
        MenuConfirmOrder.Visible := false;
      end;
  end;
end;

procedure TfrmGenerateConfirmedOrder.MenuConfirmOrderClick(
  Sender: TObject);
var
  i: integer;
begin
  gridData.DataSource.DataSet.DisableControls;
  for i := 0 to gridData.SelectedRows.Count - 1 do
  begin
    gridData.DataSource.DataSet.Bookmark := gridData.SelectedRows.items[I];
    if gridData.DataSource.DataSet.FieldByName('ETD').IsNull then
    begin
      ShowMessage('Order:'
        + gridData.DataSource.DataSet.FieldByName('CustomerOrderNumber').AsString
        + ' haven''t ETD.');
    end
    else
    begin
      if not (gridData.DataSource.DataSet.State in [dsEdit]) then
        gridData.DataSource.DataSet.Edit;
      gridData.DataSource.DataSet.FieldByName('CustomerOrderStatesID').Value := 3;
      gridData.DataSource.DataSet.Post;
    end;
  end;
  gridData.DataSource.DataSet.EnableControls;
  adt_active.Active := false;
  adt_active.Active := true;
  adt_active2.Active := false;
  adt_active2.Active := true;
end;

procedure TfrmGenerateConfirmedOrder.MenuBackClick(Sender: TObject);
var
  i: integer;
begin
  if MessageDlg('Is Back?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    gridData2.DataSource.DataSet.DisableControls;
    for i := 0 to gridData2.SelectedRows.Count - 1 do
    begin
      if not (gridData2.DataSource.DataSet.State in [dsEdit]) then
        gridData2.DataSource.DataSet.Edit;
      gridData2.DataSource.DataSet.FieldByName('CustomerOrderStatesID').Value := 2;
      gridData2.DataSource.DataSet.FieldByName('ETD').Value := null;
      gridData2.DataSource.DataSet.Post;
    end;
    gridData2.DataSource.DataSet.EnableControls;
    adt_active.Active := false;
    adt_active.Active := true;
    adt_active2.Active := false;
    adt_active2.Active := true;
  end;
end;


end.

