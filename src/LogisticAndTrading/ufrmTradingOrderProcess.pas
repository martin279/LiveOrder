unit ufrmTradingOrderProcess;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmDBBasicTreeDT, PropFilerEh, ActnList, ImgList, DB, ADODB,
  Menus, PropStorageEh, StdCtrls, Buttons, ComCtrls, DBCtrls, ToolWin,
  GridsEh, DBGridEh, ExtCtrls, uMJ, uDMManager, uDMEntity, DataModule,
  ufrmEdtTradingPO, ufrmSplitTO;

type
  TfrmTradingOrderProcess = class(TfrmDBBasicTreeDT)
    MenuEdtTO: TMenuItem;
    MenuBatchEdtTO: TMenuItem;
    MenuSplitOrder: TMenuItem;
    N3: TMenuItem;
    MenuNewDemand: TMenuItem;
    MenuToSeller: TMenuItem;
    MenuSellerConfirm: TMenuItem;
    MenuGoodsInTransit: TMenuItem;
    MenuGoodsOnHand: TMenuItem;
    MenuDeliveryPre: TMenuItem;
    MenuDelivery: TMenuItem;
    MenuCancelDemanding: TMenuItem;
    MenuCSStatusToNewOrder: TMenuItem;
    MenuCSStatusToOpenOrder: TMenuItem;
    MenuCSStatusToConfirmOrder: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    Splitter3: TSplitter;
    ds_seller: TDataSource;
    adt_seller: TADODataSet;
    ds_POLog: TDataSource;
    adt_POLog: TADODataSet;
    pnlSeller: TPanel;
    GroupBox3: TGroupBox;
    gridSeller: TDBGridEh;
    Splitter4: TSplitter;
    pnlLog: TPanel;
    GroupBox4: TGroupBox;
    gridPOLog: TDBGridEh;
    GroupBox5: TGroupBox;
    gridCOLog: TDBGridEh;
    pnlCOLog: TPanel;
    Splitter5: TSplitter;
    ds_COLog: TDataSource;
    adt_COLog: TADODataSet;
    MenuBatchEditETD: TMenuItem;
    procedure MenuNewDemandClick(Sender: TObject);
    procedure MenuToSellerClick(Sender: TObject);
    procedure MenuSellerConfirmClick(Sender: TObject);
    procedure MenuGoodsInTransitClick(Sender: TObject);
    procedure MenuGoodsOnHandClick(Sender: TObject);
    procedure MenuDeliveryPreClick(Sender: TObject);
    procedure MenuDeliveryClick(Sender: TObject);
    procedure MenuCancelDemandingClick(Sender: TObject);
    procedure gridDataGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure MenuEdtTOClick(Sender: TObject);
    procedure MenuBatchEdtTOClick(Sender: TObject);
    procedure MenuSplitOrderClick(Sender: TObject);
    procedure MenuCSStatusToNewOrderClick(Sender: TObject);
    procedure MenuCSStatusToOpenOrderClick(Sender: TObject);
    procedure MenuCSStatusToConfirmOrderClick(Sender: TObject);
    procedure gridDataCellClick(Column: TColumnEh);
    procedure FormResize(Sender: TObject);
    procedure actGridSTFilterExecute(Sender: TObject);
    procedure MenuBatchEditETDClick(Sender: TObject);
    procedure gridData2CellClick(Column: TColumnEh);
  private
    { Private declarations }
    slCO: TStringList;
    slParam: TStringList;
    objTO: TTradingOrder;
    objMgrBasic: TMgrBasicData;
    objMgrTO: TMgrTradingOrder;
    objMgrCO: TMgrCustomerOrder;
    procedure ChangeTradingOrderStatus(warMsg: string; OrderStatesID: integer);
    procedure ChangeCustomerOrderStatus(OrderStatesID: integer);
  protected
    procedure InitializeForm; override;
    procedure DestoryForm; override;
    procedure SetData; override;
    procedure SetUI; override;
    procedure SetAccess; override;
    procedure LoadTreeView(nodeName: string); override;
  public
    { Public declarations }
  end;

implementation

uses ufrmBatchEdtTO, ufrmBatchEdtCustomerOrder;


{$R *.dfm}

{ TfrmTradingOrderProcess }

procedure TfrmTradingOrderProcess.InitializeForm;
begin
  objTO := TTradingOrder.Create;
  objMgrBasic := TMgrBasicData.Create;
  objMgrTO := TMgrTradingOrder.Create;
  objMgrCO := TMgrCustomerOrder.Create;
  slCO := TStringList.Create;
  slParam := TStringList.Create;
  inherited;
end;

procedure TfrmTradingOrderProcess.DestoryForm;
var
  i: integer;
begin
  inherited;
  for i := slCO.Count - 1 downto 0 do
    if Assigned(slCO.Objects[i]) then
      slCO.Objects[i].Free;
  slCO.Free;
  slParam.Free;
  objTO.Free;
  objMgrBasic.Free;
  objMgrTO.Free;
  objMgrCO.Free;
end;

procedure TfrmTradingOrderProcess.SetData;
var
  i: integer;
  adt_Log: TADODataSet;
  objCOLog: TCustomerOrderLog;
  objMgrCO: TMgrCustomerOrder;
begin
  inherited;
  slParam.Clear;
  slParam.Append('TradingOrderID=0');
  objMgrTO.QueryTradingPO(adt_active, slParam);
  objMgrBasic.QueryBasicDataByParam(adt_active2, 'TradingOrderReceivingSchedule', 'ReceivingScheduleID', slParam);
  objMgrBasic.QueryBasicDataByParam(adt_seller, 'TradingOrderSellerInvoice', 'SellerInvoiceID', slParam);
  objMgrBasic.QueryBasicDataByParam(adt_POLog, 'ViewTradingOrderLog', 'TradingOrderLogID', slParam);
  slParam.Clear;
  slParam.Append('CustomerOrderID=0');
  objMgrBasic.QueryBasicDataByParam(adt_COLog, 'ViewCustomerOrderChangeLog', 'CustomerOrderChangeLogID', slParam);

  objMgrCO := TMgrCustomerOrder.Create;
  adt_Log := TADODataSet.Create(nil);
  try
    objMgrCO.QueryCustomerOrderLog(adt_Log);
    if adt_Log.RecordCount > 0 then
    begin
      for i := 0 to adt_Log.RecordCount - 1 do
      begin
        objCOLog := TCustomerOrderLog.Create;
        objCOLog.CustomerOrderID := adt_Log.fieldbyname('CustomerOrderID').AsInteger;
        objCOLog.LogChangeField := adt_Log.fieldbyname('ChangeField').AsString;
        slCO.AddObject(IntToStr(i), objCOLog);
        adt_Log.Next;
      end;
    end;
  finally
    adt_Log.Free;
    objMgrCO.Free;
  end;
end;

procedure TfrmTradingOrderProcess.SetUI;
begin
  gridData2.DataSource := nil;
  gridSeller.DataSource := nil;
  inherited;
  GroupBox2.Caption := 'Receiving Schedule';
  GroupBox3.Caption := 'Seller Invoice';
  GroupBox4.Caption := 'PO Change Log';
  GroupBox5.Caption := 'CO Change Log';
  cbbTreeType.Items.Add('Trading PO');
  cbbTreeType.ItemIndex := 0;
  TreeView1.ReadOnly := true;
  tbtnOperation.Visible := false;
  pnlBodyRight.Visible := true;
  Splitter2.Align := alTop;
  Splitter2.Align := alBottom;
  pnlBodyBottom.Visible := false;
  gridData.FieldColumns['TradingOrderID'].Footer.ValueType := fvtCount;
  gridData.FieldColumns['CustomerOrderQuantity'].Footer.ValueType := fvtSum;
  gridData.FieldColumns['SellerBuyerPOQuantity'].Footer.ValueType := fvtSum;
  gridData2.PopupMenu := nil;
  gridSeller.Align := alClient;
  gridSeller.UseMultiTitle := true;
  gridSeller.Flat := true;
  gridSeller.ParentFont := false;
  gridSeller.ParentShowHint := false;
  gridSeller.ShowHint := true;
  gridPOLog.Align := alClient;
  gridPOLog.UseMultiTitle := true;
  gridPOLog.Flat := true;
  gridPOLog.ParentFont := false;
  gridPOLog.ParentShowHint := false;
  gridPOLog.ShowHint := true;
  gridCOLog.Align := alClient;
  gridCOLog.UseMultiTitle := true;
  gridCOLog.Flat := true;
  gridCOLog.ParentFont := false;
  gridCOLog.ParentShowHint := false;
  gridCOLog.ShowHint := true;
end;

procedure TfrmTradingOrderProcess.SetAccess;
begin
  inherited;
  if gVars.TfrmProcessTradingOrderFrozenCols <> '' then
    gridData.FrozenCols := StrToInt(gVars.TfrmProcessTradingOrderFrozenCols);
  //gridData.FieldColumns['TradingOrderID'].Visible := false;
  if objCurUser.AccessLevel in [1, 15, 25] then
  begin
    gridData.FieldColumns['Price'].Visible := true;
    gridData.FieldColumns['TotalAmount'].Visible := true;
    //gridData.FieldColumns['TradingOrderID'].Visible := true;
  end;
end;

procedure TfrmTradingOrderProcess.FormResize(Sender: TObject);
begin
  inherited;
  pnlSeller.Width := pnlBodyRight.Width div 2;
  GroupBox4.Width := pnlSeller.Width div 2;
  pnlLog.Width := pnlSeller.Width * 2 div 3 - 15;
end;

procedure TfrmTradingOrderProcess.gridDataGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
var
  i: integer;
begin
  //inherited;
  if (slCO.Count > 0) then
  begin
    for i := 0 to slCO.Count - 1 do
    begin
      if TCustomerOrderLog(slCO.Objects[i]).CustomerOrderID = adt_active.FieldByName('CustomerOrderID').AsInteger then
      begin
        if TCustomerOrderLog(slCO.Objects[i]).LogChangeField = 'CustomerOrderQuantity' then
          Background := clAqua;
      end;
    end;
  end;
end;

procedure TfrmTradingOrderProcess.LoadTreeView(nodeName: string);
var
  ftn_type: TTreeNode;
  adt_select: TADODataSet;
  aNodeName: string;
begin
  inherited;
  ftn_type := TreeView1.Items.AddChild(nil, nodeName);
  adt_select := TADODataSet.Create(nil);
  objMgrBasic.QueryBasicData(adt_select, 'TradingOrderStatus');
  while not adt_select.Eof do
  begin
    aNodeName := adt_select.FieldByName('TradingOrderStatusName').AsString;
    TreeView1.Items.AddChild(ftn_type, aNodeName);
    adt_select.Next;
  end;
  adt_select.Free;
  ftn_type.Expanded := true;
end;

procedure TfrmTradingOrderProcess.TreeView1Change(Sender: TObject;
  Node: TTreeNode);

  procedure SetAccessForUI;
  begin
    SetPopupMenu;
    if TreeView1.Selected.Level = 1 then
    begin
      if objCurUser.AccessLevel = 16 then
        MenuBatchEditETD.Visible := TreeView1.Selected.Index < 6;
      if objCurUser.AccessLevel in [15, 16] then
      begin
        MenuEdtTO.Visible := TreeView1.Selected.Index < 6;
        MenuBatchEdtTO.Visible := TreeView1.Selected.Index < 6;
        MenuNewDemand.Visible := TreeView1.Selected.Index in [1, 2, 3, 4];
        MenuToSeller.Visible := TreeView1.Selected.Index in [0, 2];
        MenuSellerConfirm.Visible := TreeView1.Selected.Index in [1, 3];
        MenuGoodsInTransit.Visible := TreeView1.Selected.Index in [2, 4];
        MenuGoodsOnHand.Visible := TreeView1.Selected.Index in [3, 5];
        MenuDeliveryPre.Visible := TreeView1.Selected.Index in [4];
        MenuCancelDemanding.Visible := TreeView1.Selected.Index < 7;
        MenuSplitOrder.Visible := TreeView1.Selected.Index < 7;
        MenuCSStatusToNewOrder.Visible := TreeView1.Selected.Index < 7;
        MenuCSStatusToOpenOrder.Visible := TreeView1.Selected.Index < 7;
        MenuCSStatusToConfirmOrder.Visible := TreeView1.Selected.Index < 7;
        if objCurUser.AccessLevel = 15 then
          MenuDelivery.Visible := TreeView1.Selected.Index < 7;
        gridData.OnDblClick := MenuEdtTOClick;
      end
      else if objCurUser.AccessLevel = 17 then
      begin
        MenuEdtTO.Visible := TreeView1.Selected.Index < 6;
      end
      else if objCurUser.AccessLevel = 23 then
      begin
        MenuNewDemand.Visible := TreeView1.Selected.Index in [5];
        MenuToSeller.Visible := TreeView1.Selected.Index in [5];
        MenuSellerConfirm.Visible := TreeView1.Selected.Index in [5];
        MenuGoodsInTransit.Visible := TreeView1.Selected.Index in [4, 5];
        MenuGoodsOnHand.Visible := TreeView1.Selected.Index in [1, 3, 5];
        MenuDeliveryPre.Visible := TreeView1.Selected.Index in [4, 6];
        MenuDelivery.Visible := TreeView1.Selected.Index in [5];
      end;
    end;
  end;
begin
  inherited;
  if objCurUser.AccessLevel <> 1 then
    SetAccessForUI;
  objMgrTO.QueryTradingPOByTreeView(adt_active, TreeView1.Selected, nil);
  slParam.Clear;
  slParam.Append('TradingOrderID=0');
  objMgrBasic.QueryBasicDataByParam(adt_active2, 'TradingOrderReceivingSchedule', 'ReceivingScheduleID', slParam);
  objMgrBasic.QueryBasicDataByParam(adt_seller, 'TradingOrderSellerInvoice', 'SellerInvoiceID', slParam);
  objMgrBasic.QueryBasicDataByParam(adt_POLog, 'TradingOrderLog', 'TradingOrderLogID', slParam);
  slParam.Clear;
  slParam.Append('CustomerOrderID=0');
  objMgrBasic.QueryBasicDataByParam(adt_COLog, 'ViewCustomerOrderChangeLog', 'CustomerOrderChangeLogID', slParam);
end;

procedure TfrmTradingOrderProcess.MenuEdtTOClick(Sender: TObject);
begin
  inherited;
  TfrmEdtTradingPO.EdtFromList(adt_active);
end;

procedure TfrmTradingOrderProcess.MenuBatchEdtTOClick(Sender: TObject);
var
  TOID: string;
begin
  if not CheckIfSelectRows(gridData) then exit;
  TOID := GetBatchFieldValueFromGrid(gridData, 'TradingOrderID');
  if TfrmBatchEdtTO.EdtFromList(TOID) then
    RefreshGrid(gridData, ds_active);
end;

procedure TfrmTradingOrderProcess.MenuSplitOrderClick(Sender: TObject);
var
  bk: TBookmark;
begin
  if not CheckIfSelectRows(gridData, False) then exit;
  bk := gridData.DataSource.DataSet.GetBookmark;
  if TfrmSplitTO.EdtFromList(adt_active) then
    RefreshGrid(gridData, ds_active);
  if gridData.DataSource.DataSet.BookmarkValid(bk) then
    gridData.DataSource.DataSet.GotoBookmark(bk);
  gridData.DataSource.DataSet.FreeBookmark(bk);
end;

procedure TfrmTradingOrderProcess.ChangeTradingOrderStatus(warMsg: string; OrderStatesID: integer);
var
  bk: TBookmark;
begin
  bk := gridData.DataSource.DataSet.GetBookmark;
  try
    if not CheckIfSelectRows(gridData) then exit;
    objMgrTO.ChangeTradingOrderStatus(gridData, OrderStatesID);
    RefreshGrid(gridData, ds_active);
  finally
    if gridData.DataSource.DataSet.BookmarkValid(bk) then
      gridData.DataSource.DataSet.GotoBookmark(bk);
    gridData.DataSource.DataSet.FreeBookmark(bk);
  end;
end;

procedure TfrmTradingOrderProcess.MenuNewDemandClick(Sender: TObject);
begin
  inherited;
  ChangeTradingOrderStatus(TMenuItem(sender).Caption, 1);
end;

procedure TfrmTradingOrderProcess.MenuToSellerClick(Sender: TObject);
begin
  inherited;
  ChangeTradingOrderStatus(TMenuItem(sender).Caption, 2);
end;

procedure TfrmTradingOrderProcess.MenuSellerConfirmClick(Sender: TObject);
begin
  inherited;
  ChangeTradingOrderStatus(TMenuItem(sender).Caption, 3);
end;

procedure TfrmTradingOrderProcess.MenuGoodsInTransitClick(Sender: TObject);
begin
  inherited;
  ChangeTradingOrderStatus(TMenuItem(sender).Caption, 4);
end;

procedure TfrmTradingOrderProcess.MenuGoodsOnHandClick(Sender: TObject);
begin
  inherited;
  ChangeTradingOrderStatus(TMenuItem(sender).Caption, 5);
end;

procedure TfrmTradingOrderProcess.MenuDeliveryPreClick(Sender: TObject);
begin
  inherited;
  ChangeTradingOrderStatus(TMenuItem(sender).Caption, 6);
end;

procedure TfrmTradingOrderProcess.MenuDeliveryClick(Sender: TObject);
begin
  inherited;
  ChangeTradingOrderStatus(TMenuItem(sender).Caption, 7);
end;

procedure TfrmTradingOrderProcess.MenuCancelDemandingClick(
  Sender: TObject);
begin
  inherited;
  ChangeTradingOrderStatus(TMenuItem(sender).Caption, 8);
end;

procedure TfrmTradingOrderProcess.ChangeCustomerOrderStatus(OrderStatesID: integer);
begin
  if not CheckIfSelectRows(gridData) then exit;
  objMgrCO.ChangeCustomerOrderStatus(gridData, OrderStatesID);
  RefreshGrid(gridData, ds_active);
end;

procedure TfrmTradingOrderProcess.MenuCSStatusToNewOrderClick(
  Sender: TObject);
begin
  inherited;
  ChangeCustomerOrderStatus(1);
end;

procedure TfrmTradingOrderProcess.MenuCSStatusToOpenOrderClick(
  Sender: TObject);
begin
  inherited;
  ChangeCustomerOrderStatus(2);
end;

procedure TfrmTradingOrderProcess.MenuCSStatusToConfirmOrderClick(
  Sender: TObject);
begin
  inherited;
  ChangeCustomerOrderStatus(3);
end;

procedure TfrmTradingOrderProcess.gridDataCellClick(Column: TColumnEh);
var
  slParam2: TStringList;
begin
  inherited;
  if gridData.DataSource.DataSet.RecordCount = 0 then exit;
  slParam.Clear;
  slParam.Append('TradingOrderID=' + gridData.DataSource.DataSet.FieldByName('TradingOrderID').AsString);
  objMgrBasic.QueryBasicDataByParam(adt_active2, 'TradingOrderReceivingSchedule', 'ReceivingScheduleID', slParam);
  objMgrBasic.QueryBasicDataByParam(adt_POLog, 'TradingOrderLog', 'TradingOrderLogID', slParam);
  slParam.Clear;
  slParam.Append('CustomerOrderID=' + gridData.DataSource.DataSet.FieldByName('CustomerOrderID').AsString);
  objMgrBasic.QueryBasicDataByParam(adt_COLog, 'ViewCustomerOrderChangeLog', 'CustomerOrderChangeLogID', slParam);
  RefreshGrid(gridData2, ds_active2);
  RefreshGrid(gridPOLog, ds_POLog);
  RefreshGrid(gridCOLog, ds_COLog);
  if gridData2.DataSource.DataSet.RecordCount = 0 then exit;
  slParam2 := TStringList.Create;
  slParam2.Append('ReceivingScheduleID=' + gridData2.DataSource.DataSet.FieldByName('ReceivingScheduleID').AsString);
  objMgrBasic.QueryBasicDataByParam(adt_seller, 'TradingOrderSellerInvoice', 'SellerInvoiceID', slParam2);
  slParam2.Free;
  RefreshGrid(gridSeller, ds_seller);
end;

procedure TfrmTradingOrderProcess.actGridSTFilterExecute(Sender: TObject);
begin
//  inherited;
  if gridData.STFilter.Visible then
  begin
    gridData.ClearFilter;
    gridData.ApplyFilter;
  end;
  gridData.STFilter.Visible := not gridData.STFilter.Visible;
end;

procedure TfrmTradingOrderProcess.MenuBatchEditETDClick(Sender: TObject);
var
  COID: string;
begin
  if not CheckIfSelectRows(gridData) then exit;
  COID := GetBatchFieldValueFromGrid(gridData, 'CustomerOrderID');
  TfrmBatchEdtCustomerOrder.EdtFromList(COID);
end;

procedure TfrmTradingOrderProcess.gridData2CellClick(Column: TColumnEh);
begin
  inherited;
  if gridData2.DataSource.DataSet.RecordCount = 0 then exit;
  slParam.Clear;
  slParam.Append('ReceivingScheduleID=' + gridData2.DataSource.DataSet.FieldByName('ReceivingScheduleID').AsString);
  objMgrBasic.QueryBasicDataByParam(adt_seller, 'TradingOrderSellerInvoice', 'SellerInvoiceID', slParam);
  RefreshGrid(gridSeller, ds_seller);
end;

end.

