unit ufrmProcessTradingOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, PropFilerEh, DB, ADODB, Menus, PropStorageEh, ActnList,
  ImgList, StdCtrls, Buttons, ComCtrls, GridsEh, DBGridEh, DBCtrls, ToolWin, ExtCtrls,
  uMJ, uDMManager, uDMEntity, ufrmDBBasicTreeDT;

type
  TfrmProcessTradingOrder = class(TfrmDBBasicTreeDT)
    MenuNewDemand: TMenuItem;
    MenuToSeller: TMenuItem;
    MenuSellerConfirm: TMenuItem;
    MenuGoodsInTransit: TMenuItem;
    MenuGoodsOnHand: TMenuItem;
    MenuDelivery: TMenuItem;
    MenuCancelDemanding: TMenuItem;
    N3: TMenuItem;
    MenuEdtTO: TMenuItem;
    MenuBatchEdtTO: TMenuItem;
    MenuDeliveryPre: TMenuItem;
    N4: TMenuItem;
    MenuSplitOrder: TMenuItem;
    N5: TMenuItem;
    MenuCSStatusToNewOrder: TMenuItem;
    MenuCSStatusToOpenOrder: TMenuItem;
    MenuCSStatusToConfirmOrder: TMenuItem;
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure MenuEdtTOClick(Sender: TObject);
    procedure MenuBatchEdtTOClick(Sender: TObject);
    procedure MenuNewDemandClick(Sender: TObject);
    procedure MenuToSellerClick(Sender: TObject);
    procedure MenuSellerConfirmClick(Sender: TObject);
    procedure MenuGoodsInTransitClick(Sender: TObject);
    procedure MenuGoodsOnHandClick(Sender: TObject);
    procedure MenuDeliveryClick(Sender: TObject);
    procedure MenuCancelDemandingClick(Sender: TObject);
    procedure MenuDeliveryPreClick(Sender: TObject);
    procedure MenuSplitOrderClick(Sender: TObject);
    procedure gridDataGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure MenuCSStatusToNewOrderClick(Sender: TObject);
    procedure MenuCSStatusToOpenOrderClick(Sender: TObject);
    procedure MenuCSStatusToConfirmOrderClick(Sender: TObject);
  private
    { Private declarations }
    slCO: TStringList;
    objTO: TTradingOrder;
    objMgrBasic: TMgrBasicData;
    objMgrTO: TMgrTradingOrder;
    objMgrCO: TMgrCustomerOrder;
    procedure ChangeTradingOrderStatus(warMsg: string; OrderStatesID: integer);
  protected
    procedure InitializeForm; override;
    procedure DestoryForm; override;
    procedure SetData; override;
    procedure SetUI; override;
    procedure SetAccess; override;
    procedure LoadTreeView(nodeName: string); override;
  end;

implementation

uses DataModule, ufrmBatchEdtTO, ufrmSplitTO, ufrmEdtTradingPO;

{$R *.dfm}

procedure TfrmProcessTradingOrder.InitializeForm;
begin
  objTO := TTradingOrder.Create;
  objMgrBasic := TMgrBasicData.Create;
  objMgrTO := TMgrTradingOrder.Create;
  objMgrCO := TMgrCustomerOrder.Create;
  slCO := TStringList.Create;
  inherited;
end;

procedure TfrmProcessTradingOrder.DestoryForm;
var
  i: integer;
begin
  inherited;
  for i := slCO.Count - 1 downto 0 do
    if Assigned(slCO.Objects[i]) then
      slCO.Objects[i].Free;
  slCO.Free;
  objTO.Free;
  objMgrBasic.Free;
  objMgrTO.Free;
  objMgrCO.Free;
end;

procedure TfrmProcessTradingOrder.SetData;
var
  i: integer;
  adt_log: TADODataSet;
  objCOLog: TCustomerOrderLog;
  objMgrCO: TMgrCustomerOrder;
begin
  objTO.CustomerOrderID := 0;
  objMgrTO.QueryTradingOrder(adt_active, objTO);

  objMgrCO := TMgrCustomerOrder.Create;
  adt_log := TADODataSet.Create(nil);
  try
    objMgrCO.QueryCustomerOrderLog(adt_log);
    if adt_log.RecordCount > 0 then
    begin
      for i := 0 to adt_log.RecordCount - 1 do
      begin
        objCOLog := TCustomerOrderLog.Create;
        objCOLog.CustomerOrderID := adt_log.fieldbyname('CustomerOrderID').AsInteger;
        objCOLog.LogChangeField := adt_log.fieldbyname('ChangeField').AsString;
        slCO.AddObject(IntToStr(i), objCOLog);
        adt_log.Next;
      end;
    end;
  finally
    adt_log.Free;
    objMgrCO.Free;
  end;
end;

procedure TfrmProcessTradingOrder.SetUI;
begin
  gridData2.DataSource := nil;
  inherited;
  cbbTreeType.Items.Add('Trading Order Logistic Status');
  cbbTreeType.ItemIndex := 0;
  TreeView1.ReadOnly := true;
  tbtnOperation.Visible := false;
  pnlBodyRight.Visible := false;
  pnlBodyBottom.Visible := false;
  if gridData.FieldColumns['TradingOrderID'].Visible then
    gridData.FieldColumns['TradingOrderID'].Footer.ValueType := fvtCount
  else
    gridData.FieldColumns['CustomerOrderID'].Footer.ValueType := fvtCount;
  gridData.FieldColumns['CustomerOrderQuantity'].Footer.ValueType := fvtSum;
  gridData.FieldColumns['SellerBuyerPOQuantity'].Footer.ValueType := fvtSum;
end;

procedure TfrmProcessTradingOrder.SetAccess;
begin
  inherited;
  if gVars.TfrmProcessTradingOrderFrozenCols <> '' then
    gridData.FrozenCols := StrToInt(gVars.TfrmProcessTradingOrderFrozenCols);
  gridData.FieldColumns['TradingOrderID'].Visible := false;
  if objCurUser.AccessLevel in [1, 15, 25] then
  begin
    gridData.FieldColumns['Price'].Visible := true;
    gridData.FieldColumns['TotalAmount'].Visible := true;
    gridData.FieldColumns['TradingOrderID'].Visible := true;
  end;
end;

procedure TfrmProcessTradingOrder.gridDataGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
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

procedure TfrmProcessTradingOrder.LoadTreeView(nodeName: string);
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

procedure TfrmProcessTradingOrder.TreeView1Change(Sender: TObject;
  Node: TTreeNode);

  procedure SetAccessForUI;
  begin
    SetPopupMenu;
    if TreeView1.Selected.Level = 1 then
    begin
      MenuEdtTO.Visible := TreeView1.Selected.Index < 6;
      MenuBatchEdtTO.Visible := TreeView1.Selected.Index < 6;
      if objCurUser.AccessLevel in [15, 16, 17, 18] then
      begin
        MenuNewDemand.Visible := TreeView1.Selected.Index in [1, 2];
        MenuToSeller.Visible := TreeView1.Selected.Index in [0, 2];
        MenuSellerConfirm.Visible := TreeView1.Selected.Index in [1, 3];
        MenuGoodsInTransit.Visible := TreeView1.Selected.Index in [2, 4];
        MenuGoodsOnHand.Visible := TreeView1.Selected.Index in [3, 5];
        MenuDeliveryPre.Visible := TreeView1.Selected.Index in [4];
        MenuDelivery.Visible := TreeView1.Selected.Index in [4];
        MenuCancelDemanding.Visible := TreeView1.Selected.Index < 7;
        MenuSplitOrder.Visible := TreeView1.Selected.Index < 7;
        MenuCSStatusToNewOrder.Visible := TreeView1.Selected.Index < 7;
        MenuCSStatusToOpenOrder.Visible := TreeView1.Selected.Index < 7;
        MenuCSStatusToConfirmOrder.Visible := TreeView1.Selected.Index < 7;
        gridData.OnDblClick := MenuEdtTOClick;
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
  objMgrTO.QueryTradingOrderByTreeView(adt_active, TreeView1.Selected, nil);
end;

procedure TfrmProcessTradingOrder.MenuEdtTOClick(Sender: TObject);
begin
  inherited;
  TfrmEdtTradingPO.EdtFromList(adt_active);
end;

procedure TfrmProcessTradingOrder.MenuBatchEdtTOClick(Sender: TObject);
var
  TOID: string;
begin
  if not CheckIfSelectRows(gridData) then exit;
  TOID := GetBatchFieldValueFromGrid(gridData, 'TradingOrderID');
  if TfrmBatchEdtTO.EdtFromList(TOID) then
    RefreshGrid(gridData, ds_active);
end;

procedure TfrmProcessTradingOrder.MenuSplitOrderClick(Sender: TObject);
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

procedure TfrmProcessTradingOrder.MenuNewDemandClick(Sender: TObject);
begin
  inherited;
  ChangeTradingOrderStatus(TMenuItem(sender).Caption, 1);
end;

procedure TfrmProcessTradingOrder.MenuToSellerClick(Sender: TObject);
begin
  inherited;
  ChangeTradingOrderStatus(TMenuItem(sender).Caption, 2);
end;

procedure TfrmProcessTradingOrder.MenuSellerConfirmClick(Sender: TObject);
begin
  inherited;
  ChangeTradingOrderStatus(TMenuItem(sender).Caption, 3);
end;

procedure TfrmProcessTradingOrder.MenuGoodsInTransitClick(Sender: TObject);
begin
  inherited;
  ChangeTradingOrderStatus(TMenuItem(sender).Caption, 4);
end;

procedure TfrmProcessTradingOrder.MenuGoodsOnHandClick(Sender: TObject);
begin
  inherited;
  ChangeTradingOrderStatus(TMenuItem(sender).Caption, 5);
end;

procedure TfrmProcessTradingOrder.MenuDeliveryPreClick(Sender: TObject);
begin
  inherited;
  ChangeTradingOrderStatus(TMenuItem(sender).Caption, 6);
end;

procedure TfrmProcessTradingOrder.MenuDeliveryClick(Sender: TObject);
begin
  inherited;
  ChangeTradingOrderStatus(TMenuItem(sender).Caption, 7);
end;

procedure TfrmProcessTradingOrder.MenuCancelDemandingClick(Sender: TObject);
begin
  inherited;
  ChangeTradingOrderStatus(TMenuItem(sender).Caption, 8);
end;

procedure TfrmProcessTradingOrder.ChangeTradingOrderStatus(warMsg: string;
  OrderStatesID: integer);
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

procedure TfrmProcessTradingOrder.MenuCSStatusToNewOrderClick(
  Sender: TObject);
begin
  inherited;
  if not CheckIfSelectRows(gridData) then exit;
  objMgrCO.ChangeCustomerOrderStatus(gridData, 1);
  RefreshGrid(gridData, ds_active);
end;

procedure TfrmProcessTradingOrder.MenuCSStatusToOpenOrderClick(
  Sender: TObject);
begin
  inherited;
  if not CheckIfSelectRows(gridData) then exit;
  objMgrCO.ChangeCustomerOrderStatus(gridData, 2);
  RefreshGrid(gridData, ds_active);
end;

procedure TfrmProcessTradingOrder.MenuCSStatusToConfirmOrderClick(
  Sender: TObject);
begin
  inherited;
  if not CheckIfSelectRows(gridData) then exit;
  objMgrCO.ChangeCustomerOrderStatus(gridData, 3);
  RefreshGrid(gridData, ds_active);
end;

end.

