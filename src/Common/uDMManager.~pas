unit uDMManager;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, PropFilerEh, Menus, PropStorageEh, DB, ADODB, StrUtils,
  ActnList, ImgList, StdCtrls, Buttons, ComCtrls, GridsEh, DBGridEh, uMJ,
  DBCtrls, ToolWin, ExtCtrls, uDMEntity;


type

  TMgrCurUser = class
  private
    slMgrUser: TStringList;
  public
    constructor Create();
    destructor Destroy; override;
    function LoginByDBAuth(LoginName, LoginPassword: string): Boolean;
    procedure SaveLoginInfo(adt1: TADODataSet);
    procedure LoginByDomainAuth();
  end;

  TMgrBasicData = class
  private
    slBasicParam: TStringList;
  public
    constructor Create();
    destructor Destroy; override;
    procedure QueryBasicData(adtFrom: TADODataset; DatatableName: string; ColName: string = 'ID');
    procedure QueryBasicDataByParam(adtFrom: TADODataset; DatatableName: string;
      ColName: string = 'ID'; slCon: TStringList = nil);
    procedure QueryBasicDataBySP(adtFrom: TADODataset; spName: string = ''; slParent: TStringList = nil);
  end;

  TMgrCustomerOrder = class
  private
    slCOParam: TStringList;
    function ChangeCustomerOrderStatusBeforePost(gridFrom: TDBGridEh; CustomerOrderStatusID: integer): string;
  public
    constructor Create();
    destructor Destroy; override;
    procedure AddCustomerOrder(slParent: TStringList = nil);
    procedure QueryCustomerOrder(adtFrom: TADODataset; objCO: TCustomerOrder = nil; slParent: TStringList = nil);
    procedure QueryCustomerOrderByTree(adtFrom: TADODataset; node: TTreeNode; slParent: TStringList = nil; TreeTypeID: integer = 0);
    procedure QueryCustomerOrderLog(adtFrom: TADODataset; slParent: TStringList = nil);
    procedure SplitCustomerOrder(objCO: TCustomerOrder; NewCustomerOrderQuantity: integer);
    procedure ChangeCustomerOrderStatus(gridFrom: TDBGridEh; CustomerOrderStatusID: integer);
    procedure UpdateCustomerOrder(slParent: TStringList = nil; objCO: TCustomerOrder = nil);
  end;

  TMgrShippingSchedule = class
  private
    slParam: TStringList;
  public
    constructor Create();
    destructor Destroy; override;
    procedure QueryShippingSchedule(adtFrom: TADODataset);
    procedure UpdateShippingSchedule(slParent: TStringList = nil);
    procedure CreateShippingSchedule(objSS: TShippingSchedule);
    procedure UpdateShippingScheduleLotNumber(coID: string);
    procedure ShipGoods(adtFrom: TADODataset; objCO: TCustomerOrder);
  end;

  TMgrTradingOrder = class(TObject)
  private
    slTOParam: TStringList;
    function ChangeTradingOrderStatusBeforePost(gridFrom: TDBGridEh; TradingOrderStatusID: integer): string;
  protected
  public
    constructor Create();
    destructor Destroy; override;
    procedure QueryTradingOrder(adtFrom: TADODataset; objTO: TTradingOrder = nil; slParent: TStringList = nil);
    procedure QueryTradingPO(adtFrom: TADODataset; slParent: TStringList = nil);
    procedure QueryTradingOrderReceivingSchedule(adtFrom: TADODataset; slParent: TStringList = nil);
    procedure QueryTradingOrderSellerInvoice(adtFrom: TADODataset; slParent: TStringList = nil);
    procedure QueryTradingOrderByTreeView(adtFrom: TADODataset; node: TTreeNode; slParent: TStringList = nil);
    procedure QueryTradingPOByTreeView(adtFrom: TADODataset; node: TTreeNode; slParent: TStringList = nil);
    procedure QueryTradingOrderLog(adtFrom: TADODataset);
    procedure SplitTradingOrder(slParent: TStringList);
    procedure ChangeTradingOrderStatus(gridFrom: TDBGridEh; TradingOrderStatusID: integer);
    procedure UpdateTradingOrder(slParent: TStringList = nil; objTO: TTradingOrder = nil);
    procedure UpdateTradingOrderReceivingSchedule(slParam: TStringList);
    procedure UpdateTradingOrderBeforePOST(ds_active: TDataSource; objTO: TTradingOrder);
    procedure UpdateTradingInfoToCustomerOrder(BatchTradingOrderID: string);
    procedure CreateReceivingSchedule(slParam: TStringList);
    procedure QueryTradingOrderForSales1(adtFrom: TADODataset;
      objTO: TTradingOrder; slParent: TStringList);    
    procedure QueryTradingOrderForCS1(adtFrom: TADODataset;
      objTO: TTradingOrder; slParent: TStringList);
  end;

  TMgrProductionSchedule = class
  private
    slPSParam: TStringList;
    function AddProductionScheduleBeforeInsert(adtFrom: TADODataset): string;
  public
    constructor Create();
    destructor Destroy; override;
    procedure AddProductionSchedule(gridFrom: TDBGridEh);
    procedure QueryProductionSchedule(adtFrom: TADODataset;
      objPS: TTradingOrder; slParent: TStringList);
  end;

var
  objCurUser: TCurUserInfo;

implementation

uses DataModule;

{ TMgrCurUser }

constructor TMgrCurUser.Create;
begin
  slMgrUser := TStringList.Create;
end;

destructor TMgrCurUser.Destroy;
begin
  slMgrUser.Free;
  inherited;
end;

function TMgrCurUser.LoginByDBAuth(LoginName, LoginPassword: string): Boolean;
var
  adt1: TADODataSet;
  warmsg: string;
begin
  if (LoginName = '') or (LoginPassword = '') then
  begin
    ShowMessage('please input username and password.');
    Result := false;
    Exit;
  end;
  warmsg := '';
  adt1 := TADODataSet.Create(nil);
  try
    slMgrUser.Clear;
    slMgrUser.Append('LoginName=' + LoginName);
    slMgrUser.Append('LoginPassword=' + LoginPassword);
    DM.DataSetSPQuery(adt1, 'usp_GetLogin', slMgrUser);
    if adt1.RecordCount = 0 then
      warmsg := 'Login error, please check username and password.'
    else if not adt1.FieldByName('IsValid').AsBoolean then
      warmsg := 'User is locked by administrator.';
    if warmsg <> '' then
    begin
      ShowMessage(warmsg);
      Result := false;
    end
    else
    begin
      SaveLoginInfo(adt1);
      Result := true;
    end;
  finally
    adt1.Free;
  end;
end;

procedure TMgrCurUser.SaveLoginInfo(adt1: TADODataSet);
var
  strPlantID, strPlantCode, strBusinessApplicationID, strBusinessApplicationName: string;
  objMgrBasic: TMgrBasicData;
begin
  gVars.CurUserLevel := adt1.fieldbyname('AccessLevel').AsInteger;
  objCurUser.LoginID := adt1.fieldbyname('LoginID').AsInteger;
  objCurUser.LoginName := adt1.fieldbyname('LoginName').AsString;
  objCurUser.LoginPassword := adt1.fieldbyname('LoginPassword').AsString;
  objCurUser.DisplayName := adt1.fieldbyname('DisplayName').AsString;
  objCurUser.AccessLevel := adt1.fieldbyname('AccessLevel').AsInteger;
  objCurUser.CurUserLonginTime := now;
  slMgrUser.Clear;
  slMgrUser.Values['LoginID'] := IntToStr(objCurUser.LoginID);
  objMgrBasic := TMgrBasicData.Create;
  try
    objMgrBasic.QueryBasicDataByParam(adt1, 'ViewLoginPlant', 'PlantID', slMgrUser);
    while not adt1.Eof do
    begin
      strPlantID := strPlantID + ',' + adt1.FieldByName('PlantID').AsString;
      strPlantCode := strPlantCode + ',' + adt1.FieldByName('PlantCode').AsString;
      adt1.Next;
    end;
    objCurUser.PlantID := copy(strPlantID, 2, length(strPlantID));
    objCurUser.PlantCode := copy(strPlantCode, 2, length(strPlantCode));
    slMgrUser.Clear;
    slMgrUser.Values['LoginID'] := IntToStr(objCurUser.LoginID);
    objMgrBasic.QueryBasicDataByParam(adt1, 'ViewLoginBusinessApplication', 'BusinessApplicationID', slMgrUser);
    adt1.First;
    while not adt1.Eof do
    begin
      strBusinessApplicationID := strBusinessApplicationID + ',' + adt1.FieldByName('BusinessApplicationID').AsString;
      strBusinessApplicationName := strBusinessApplicationName + ',' + adt1.FieldByName('BusinessApplicationName').AsString;
      adt1.Next;
    end;
    objCurUser.BusinessApplicationID := copy(strBusinessApplicationID, 2, length(strBusinessApplicationID));
    objCurUser.BusinessApplicationName := copy(strBusinessApplicationName, 2, length(strBusinessApplicationName));
  finally
    objMgrBasic.Free;
  end;
end;

procedure TMgrCurUser.LoginByDomainAuth;
begin

end;

{ TMgrBasicData }

constructor TMgrBasicData.Create;
begin
  slBasicParam := TStringList.Create;
end;

destructor TMgrBasicData.Destroy;
begin
  slBasicParam.Free;
  inherited;
end;

procedure TMgrBasicData.QueryBasicData(adtFrom: TADODataset; DatatableName,
  ColName: string);
begin
  slBasicParam.Clear;
  slBasicParam.Values['Table'] := DatatableName;
  if ColName = 'ID' then
    slBasicParam.Values['Col'] := DatatableName + 'ID'
  else
    slBasicParam.Values['Col'] := ColName;
  DM.DataSetSPQuery(adtFrom, 'usp_GetBasicData', slBasicParam);
end;

procedure TMgrBasicData.QueryBasicDataByParam(adtFrom: TADODataset;
  DatatableName, ColName: string; slCon: TStringList);
var
  i: integer;
  strCon: string;
begin
  slBasicParam.Clear;
  slBasicParam.Values['Table'] := DatatableName;
  if (ColName = '') or (ColName = 'ID') then
    slBasicParam.Values['Col'] := DatatableName + 'ID'
  else
    slBasicParam.Values['Col'] := ColName;
  if slCon <> nil then
  begin
    strCon := '';
    for i := 0 to slCon.Count - 1 do
    begin
     // if UpperCase(Copy(slCon.ValueFromIndex[i], length(slCon.ValueFromIndex[i]) - 2, len(slCon.ValueFromIndex[i]))) = 'ID' then
      if UpperCase(RightStr(slCon.Names[i], 2)) = 'ID' then
        strCon := strCon + ' And ' + slCon.Names[i] + ' in (' + slCon.ValueFromIndex[i] + ')'
      else
        strCon := strCon + ' And ' + slCon.Names[i] + '=''''' + slCon.ValueFromIndex[i] + '''''';
    end;
    slBasicParam.Values['Conditon'] := strCon;
  end;
  DM.DataSetSPQuery(adtFrom, 'usp_GetBasicDataByCondition', slBasicParam);
end;

procedure TMgrBasicData.QueryBasicDataBySP(adtFrom: TADODataset; spName: string = ''; slParent: TStringList = nil);
begin
  slBasicParam.Clear;
  if slParent <> nil then
    slBasicParam.Text := slParent.Text;
  if spName <> '' then
    DM.DataSetSPQuery(adtFrom, spName, slBasicParam);
end;

{ TMgrCustomerOrder }

constructor TMgrCustomerOrder.Create;
begin
  slCOParam := TStringList.Create;
end;

destructor TMgrCustomerOrder.Destroy;
begin
  slCOParam.Free;
  inherited;
end;

procedure TMgrCustomerOrder.AddCustomerOrder(slParent: TStringList);
begin

end;

procedure TMgrCustomerOrder.QueryCustomerOrder(adtFrom: TADODataset; objCO: TCustomerOrder = nil;
  slParent: TStringList = nil);
begin
  if objCO <> nil then
  begin
    slCOParam.Values['CustomerOrderID'] := IntToStr(objCO.CustomerOrderID);
    slCOParam.Values['Col'] := 'CustomerOrderID';
  end
  else if slParent <> nil then
    slCOParam.Text := slParent.Text;
  DM.DataSetSPQuery(adtFrom, 'usp_GetCustomerOrder', slCOParam);
end;

procedure TMgrCustomerOrder.QueryCustomerOrderByTree(adtFrom: TADODataset;
  node: TTreeNode; slParent: TStringList; TreeTypeID: integer);
var
  PlantID: string;
begin
  slCOParam.Clear;
  if slParent <> nil then
    slCOParam.Text := slParent.Text;
  PlantID := '0';
  case TreeTypeID of
    0:
      PlantID := '1';
    1:
      PlantID := '2';
    2:
      PlantID := '3,4,5';
    3:
      PlantID := '7,9,10,11,12';
  end;
  slCOParam.Append('PlantID=' + PlantID);

  if node.Level = 1 then
  begin
    if TreeTypeID = 3 then
    begin
      case node.Index of
        0:
          begin
            slCOParam.Append('CustomerOrderStatesID=1,2')
          end;
        1:
          begin
            slCOParam.Append('CustomerOrderStatesID=3,4')
          end;
        2:
          begin
            slCOParam.Append('CustomerOrderStatesID=5')
          end;
        3:
          begin
            slCOParam.Append('CustomerOrderStatesID=6')
          end;
        4:
          begin
            slCOParam.Append('CustomerOrderStatesID=7')
          end;
      end;
    end
    else
      slCOParam.Append('CustomerOrderStatesID=' + IntToStr(node.Index + 1));
  end
  else
    slCOParam.Append('CustomerOrderStatesID=1,2,3,4,5,6');

  if objCurUser.AccessLevel = 2 then
    slCOParam.Append('Roles=communicator');
  slCOParam.Append('LoginID=' + IntToStr(objCurUser.LoginID));
  slCOParam.Append('ATDNone=1');
  slCOParam.Append('Col=CustomerOrderID Desc');
  DM.DataSetSPQuery(adtFrom, 'usp_GetCustomerOrder', slCOParam);
end;

procedure TMgrCustomerOrder.QueryCustomerOrderLog(adtFrom: TADODataset; slParent: TStringList = nil);
begin
  slCOParam.Clear;
  if slParent <> nil then
    slCOParam.Text := slParent.Text;
  slCOParam.Append('ChangeField=RTD'''',''''CustomerOrderQuantity'''', ''''ETD'''', ''''IsSplitOrder'''', ''''Model');
  slCOParam.Append('ChangeTime=' + FormatDateTime(' YYYY - mm - dd ', (now - 30)));
//  slCOParam.Values['ChangeField'] := 'RTD'''',''''CustomerOrderQuantity'''', ''''ETD'''', ''''IsSplitOrder'''', ''''Model';
//  slCOParam.Values['ChangeTime'] := FormatDateTime(' YYYY - mm - dd ', (now - 30));
  DM.DataSetSPQuery(adtFrom, 'usp_GetCustomerOrderChangeLog', slCOParam);
end;

procedure TMgrCustomerOrder.SplitCustomerOrder(objCO: TCustomerOrder; NewCustomerOrderQuantity: integer);
var
  adt1: TADODataSet;
  NewCustomerOrderID: integer;
  objMgrTO: TMgrTradingOrder;
begin
  adt1 := TADODataSet.Create(nil);
  objMgrTO := TMgrTradingOrder.Create;
  try
    //DM.DataSetSPQuery(adt1, 'usp_GetCustomerOrderSplitNewID', slCOParam);
    DM.DataSetQuery(adt1, 'declare @NewCustomerOrderID INT EXEC usp_InsertCustomerOrderSplit '
      + IntToStr(objCO.CustomerOrderID) + ',' + IntToStr(objCO.CustomerOrderQuantity) + ','
      + IntToStr(NewCustomerOrderQuantity) + ',' + FloatToStr(objCO.Price) + ','''
      + objCO.RTD + ''',' + IntToStr(objCurUser.LoginID)
      + ',@NewCustomerOrderID output select @NewCustomerOrderID as NewCustomerOrderID');
    NewCustomerOrderID := adt1.fieldbyname('NewCustomerOrderID').AsInteger;
    //NewCustomerOrderID := adt1.Parameters.ParamByName('@NewCustomerOrderID').Value;
    if NewCustomerOrderID <> 0 then
    begin
      slCOParam.Clear;
      slCOParam.Append('CustomerOrderID=' + IntToStr(objCO.CustomerOrderID));
      DM.DataSetSPQuery(adt1, 'usp_GetTradingPO', slCOParam);
      slCOParam.Clear;
      slCOParam.Append('CustomerOrderID=' + IntToStr(NewCustomerOrderID));
      slCOParam.Append('NewBuyerPOQuantity=' + IntToStr(NewCustomerOrderQuantity));
      if adt1.RecordCount = 1 then
      begin
        slCOParam.Append('SellerBuyerPOQuantity=' + adt1.fieldbyname('SellerBuyerPOQuantity').AsString);
        slCOParam.Append('TradingOrderID=' + adt1.fieldbyname('TradingOrderID').AsString);
        slCOParam.Append('IsOneToOneBetweenCOAndTO=1');
      end
      else
        slCOParam.Append('IsOneToOneBetweenCOAndTO=0');
      objMgrTO.SplitTradingOrder(slCOParam);
    end;
  finally
    objMgrTO.Free;
    adt1.Free;
  end;
end;

function TMgrCustomerOrder.ChangeCustomerOrderStatusBeforePost(
  gridFrom: TDBGridEh; CustomerOrderStatusID: integer): string;
var
  warmsg: string;
begin
  warmsg := '';
  case CustomerOrderStatusID of
    2:
      if gridFrom.DataSource.DataSet.FieldByName('ETD').AsString = '' then
        warmsg := 'ETD can''t be empty.';
    3:
      if (gridFrom.DataSource.DataSet.FieldByName('ETD').IsNull or gridFrom.DataSource.DataSet.FieldByName('CustomerOrderNumber').IsNull) then
        warmsg := 'OrderNo. or ETD can''t be empty.';
    4:
      if ((Trim(gridFrom.DataSource.DataSet.FieldByName('OINQReleaseCOQuantity').AsString) = '')
        and (Trim(gridFrom.DataSource.DataSet.FieldByName('ActualReleaseCOQuantity').AsString) = ''))
        {and (cbbTreeType.ItemIndex <> 2)}then
        warmsg := 'OINQ Release qty. can''t be empty.';
    5:
      if gridFrom.DataSource.DataSet.FieldByName('InvoiceNumber').IsNull then
        warmsg := 'InvoiceNumber can''t be empty.';
    6:
      if gridFrom.DataSource.DataSet.FieldByName('ATD').IsNull then
        warmsg := 'ATD can''t be empty.';
  end;
  Result := warmsg;
end;

procedure TMgrCustomerOrder.ChangeCustomerOrderStatus(gridFrom: TDBGridEh;
  CustomerOrderStatusID: integer);
var
  i: integer;
  strWarMsg: string;
begin
  gridFrom.DataSource.DataSet.DisableControls;
  try
    for i := 0 to gridFrom.SelectedRows.Count - 1 do
    begin
      gridFrom.DataSource.DataSet.Bookmark := gridFrom.SelectedRows.items[I];
      strWarMsg := ChangeCustomerOrderStatusBeforePost(gridFrom, CustomerOrderStatusID);
      if strWarMsg <> '' then
      begin
        ShowMessage(strWarMsg);
        Break;
      end;
      slCOParam.Clear;
      slCOParam.Values['CustomerOrderStatesID'] := IntToStr(CustomerOrderStatusID);
      slCOParam.Values['CustomerOrderID'] := gridFrom.DataSource.DataSet.FieldByName('CustomerOrderID').AsString;
      slCOParam.Values['Col'] := 'CustomerOrderID';
      DM.DataSetSPModify('usp_UpdateCustomerOrder', slCOParam);
    end;
  finally
    gridFrom.DataSource.DataSet.EnableControls;
  end;
end;

procedure TMgrCustomerOrder.UpdateCustomerOrder(slParent: TStringList = nil; objCO: TCustomerOrder = nil);
begin
  slCOParam.Clear;
  if slParent <> nil then
    slCOParam.Text := slParent.Text
  else if objCO <> nil then
  begin
    slCOParam.Values['RTD'] := objCO.RTD;
    slCOParam.Values['ETD'] := objCO.ETD;
    slCOParam.Values['ATD'] := objCO.ATD;
    slCOParam.Values['ETA'] := objCO.ETA;
    slCOParam.Values['CustomerPurchaseOrderNumber'] := objCO.CustomerPurchaseOrderNumber;
    slCOParam.Values['MNumber'] := objCO.MNumber;
    slCOParam.Values['InvoiceNumber'] := objCO.InvoiceNumber;
    slCOParam.Values['CustomerOrderNumber'] := objCO.CustomerOrderNumber;
    slCOParam.Values['Payment'] := objCO.Payment;
    slCOParam.Values['Remark'] := objCO.Remark;
    slCOParam.Values['Instruction'] := objCO.Instruction;
    slCOParam.Values['ForwarderID'] := IntToStr(objCO.ForwarderID);
    slCOParam.Values['Destination'] := objCO.Destination;
    slCOParam.Values['Freight'] := objCO.Freight;
    slCOParam.Values['COConfirmedTime'] := objCO.COConfirmedTime;
    slCOParam.Values['CustomerOrderID'] := objCO.BatchCustomerOrderID;   
    slCOParam.Values['ReasonOfDelayID'] := objCO.ReasonOfDelayID;
    slCOParam.Values['Col'] := 'CustomerOrderID';
  end;
  if slCOParam <> nil then
    DM.DataSetSPModify('usp_UpdateCustomerOrder', slCOParam);
end;

{ TMgrTradingOrder }

constructor TMgrTradingOrder.Create;
begin
  slTOParam := TStringList.Create;
end;

destructor TMgrTradingOrder.Destroy;
begin
  slTOParam.Free;
  inherited;
end;

procedure TMgrTradingOrder.QueryTradingOrder(adtFrom: TADODataset;
  objTO: TTradingOrder; slParent: TStringList);
begin
  if objTO <> nil then
  begin
    slTOParam.Clear;
    slTOParam.Values['CustomerOrderID'] := IntToStr(objTO.CustomerOrderID);
    slTOParam.Values['Col'] := 'CustomerOrderID';
  end
  else if slParent <> nil then
    slTOParam.Text := slParent.Text;
  DM.DataSetSPQuery(adtFrom, 'usp_GetTradingPO', slTOParam);
end;

procedure TMgrTradingOrder.QueryTradingPO(adtFrom: TADODataset;
  slParent: TStringList);
begin
  if slParent <> nil then
    slTOParam.Text := slParent.Text;
  DM.DataSetSPQuery(adtFrom, 'usp_GetTradingPO', slTOParam);
end;

procedure TMgrTradingOrder.QueryTradingOrderReceivingSchedule(
  adtFrom: TADODataset; slParent: TStringList);
begin
//
end;

procedure TMgrTradingOrder.QueryTradingOrderSellerInvoice(
  adtFrom: TADODataset; slParent: TStringList);
begin
//
end;

procedure TMgrTradingOrder.QueryTradingOrderByTreeView(adtFrom: TADODataset;
  node: TTreeNode; slParent: TStringList);
begin
  slTOParam.Clear;
  if slParent <> nil then
  begin
    slTOParam.Text := slParent.Text;
  end;
  if node.Level = 1 then
    slTOParam.Values['TradingOrderStatusID'] := IntToStr(node.Index + 1);
  slTOParam.Values['Col'] := 'TradingOrderID Desc';
  DM.DataSetSPQuery(adtFrom, 'usp_GetTradingPO', slTOParam);
end;

procedure TMgrTradingOrder.QueryTradingPOByTreeView(adtFrom: TADODataset;
  node: TTreeNode; slParent: TStringList);
begin
  slTOParam.Clear;
  if slParent <> nil then
  begin
    slTOParam.Text := slParent.Text;
  end;
  if node.Level = 1 then
    slTOParam.Values['TradingOrderStatusID'] := IntToStr(node.Index + 1);
  slTOParam.Values['Col'] := 'TradingOrderID Desc';
  DM.DataSetSPQuery(adtFrom, 'usp_GetTradingPO', slTOParam);
end;

procedure TMgrTradingOrder.QueryTradingOrderLog(adtFrom: TADODataset);
begin

end;

procedure TMgrTradingOrder.SplitTradingOrder(slParent: TStringList);
begin
  if slParent <> nil then
  begin
    slTOParam.Clear;
    slTOParam.Text := slParent.Text;
    DM.DataSetSPModify('usp_InsertTradingOrderSplit', slTOParam);
  end;
end;

function TMgrTradingOrder.ChangeTradingOrderStatusBeforePost(gridFrom: TDBGridEh;
  TradingOrderStatusID: integer): string;
var
  warmsg: string;
begin
  warmsg := '';
  case TradingOrderStatusID of
    2:
      if gridFrom.DataSource.DataSet.FieldByName('SellerBuyerPONumber').AsString = '' then
        warmsg := 'Seller Buyer PO Number can''t be empty.';
    3:
      if gridFrom.DataSource.DataSet.FieldByName('SellerExFactoryDate').AsString = '' then
        warmsg := 'Seller Ex Factory Date can''t be empty.';
    4:
      if gridFrom.DataSource.DataSet.FieldByName('LogisticInOriginPickupDate').AsString = '' then
        warmsg := 'Origin Pickup Date can''t be empty.';
    5:
      if gridFrom.DataSource.DataSet.FieldByName('ThirdPartyWarehouseReceivingDate').IsNull then
        warmsg := 'Third Party Warehouse Receiving Date can''t be empty.';
 {   6:
      if gridFrom.DataSource.DataSet.FieldByName('GoodsEXThirdPartyWarehouseDate').IsNull then
        warmsg := 'Third party warehouse Goods EX-Warehouse Date can''t be empty.';
    7:
      if gridFrom.DataSource.DataSet.FieldByName('GoodsEXThirdPartyWarehouseDate').IsNull then
        warmsg := 'Third party warehouse Goods EX-Warehouse Date can''t be empty.';       }
  end;
  Result := warmsg;
end;

procedure TMgrTradingOrder.ChangeTradingOrderStatus(gridFrom: TDBGridEh; TradingOrderStatusID: integer);
var
  i: integer;
  strWarMsg: string;
begin
  gridFrom.DataSource.DataSet.DisableControls;
  try
    for i := 0 to gridFrom.SelectedRows.Count - 1 do
    begin
      gridFrom.DataSource.DataSet.Bookmark := gridFrom.SelectedRows.items[I];
      strWarMsg := ChangeTradingOrderStatusBeforePost(gridFrom, TradingOrderStatusID);
      if strWarMsg <> '' then
      begin
        ShowMessage(strWarMsg);
        Break;
      end;
      slTOParam.Clear;
      slTOParam.Values['TradingOrderStatusID'] := IntToStr(TradingOrderStatusID);
      slTOParam.Values['TradingOrderID'] := gridFrom.DataSource.DataSet.FieldByName('TradingOrderID').AsString;
      slTOParam.Values['Col'] := 'TradingOrderID';
      DM.DataSetSPModify('usp_UpdateTradingOrder', slTOParam);
    end;
  finally
    gridFrom.DataSource.DataSet.EnableControls;
  end;
end;

procedure TMgrTradingOrder.UpdateTradingOrderBeforePOST(ds_active: TDataSource; objTO: TTradingOrder);
var
  leadtime: integer;
  adt1: TADODataSet;
begin
  if not (ds_active.DataSet.State in [dsEdit]) then
    ds_active.DataSet.Edit;
  ds_active.DataSet.FieldByName('UpdateTime').Value := now();
  //------check gboxCOBasicInfor change------
  if (ds_active.DataSet.FieldByName('ETD').Value <> null) or (VarToStr(ds_active.DataSet.FieldByName('ETD').Value) <> '') then
  begin
    if (ds_active.DataSet.FieldByName('CustomerOrderStatesID').Value = 1) then
      ds_active.DataSet.FieldByName('CustomerOrderStatesID').Value := 2;
  end;
  //------check gboxSeller change------
  if (((ds_active.DataSet.FieldByName('SellerExFactoryDate').OldValue <> ds_active.DataSet.FieldByName('SellerExFactoryDate').Value)
    or (ds_active.DataSet.FieldByName('SellerExFactoryDate1').OldValue <> ds_active.DataSet.FieldByName('SellerExFactoryDate1').Value))
    and (ds_active.DataSet.FieldByName('VendorID').Value <> Null)) then
  begin
    adt1 := TADODataSet.Create(nil);
    try
      DM.DataSetQuery(adt1, 'select * from TradingSellerLeadTime where VendorID=' + VarToStr(ds_active.DataSet.FieldByName('VendorID').Value)
        + ' and lower(SellerShippingMode)='''
        + LowerCase(VarToStr(ds_active.DataSet.FieldByName('SellerShippingMode').Value)) + '''');
      if adt1.RecordCount > 0 then
      begin
        leadtime := adt1.fieldbyname('leadtime').AsInteger;
        if objTO.SellerExFactoryDate1 <> '' then
          ds_active.DataSet.FieldByName('SellerRCEDSellerOA').Value := ds_active.DataSet.FieldByName('SellerExFactoryDate1').Value + leadtime
        else if objTO.SellerExFactoryDate <> '' then
          ds_active.DataSet.FieldByName('SellerRCEDSellerOA').Value := ds_active.DataSet.FieldByName('SellerExFactoryDate').Value + leadtime;
      end;
    finally
      adt1.Free;
    end;
  end;
  if ((objTO.SellerBuyerPONumber = 'OH') or (Copy(objTO.SellerBuyerPONumber, 1, 7) = 'ON HAND'))
    and (objTO.TradingOrderStatusID < 5) then
  begin
    ds_active.DataSet.FieldByName('SellerBuyerPONumber').Value := 'OH';
    ds_active.DataSet.FieldByName('TradingOrderStatusID').Value := 5;
    if (ds_active.DataSet.FieldByName('SellerExFactoryDate').Value = null)
      or (ds_active.DataSet.FieldByName('SellerRCEDSellerOA').Value = null) then
    begin
      ds_active.DataSet.FieldByName('SellerExFactoryDate').Value := now();
      ds_active.DataSet.FieldByName('SellerRCEDSellerOA').Value := now();
    end;
  end;
  //------check gboxDemanding change------
  if ((ds_active.DataSet.FieldByName('ETD').OldValue = null)
    and (ds_active.DataSet.FieldByName('DemandManagingRCED').OldValue <> ds_active.DataSet.FieldByName('DemandManagingRCED').Value)) then
  begin
    objTO.DemandManagingRCED := ds_active.DataSet.FieldByName('DemandManagingRCED').Value;
    ds_active.DataSet.FieldByName('ETD').Value := ds_active.DataSet.FieldByName('DemandManagingRCED').Value;
    if (ds_active.DataSet.FieldByName('CustomerOrderStatesID').Value = 1) then
      ds_active.DataSet.FieldByName('CustomerOrderStatesID').Value := 2;
  end;
  if ((objTO.SellerBuyerPONumber = 'OH') or (Copy(objTO.SellerBuyerPONumber, 1, 7) = 'ON HAND'))
    and (ds_active.DataSet.FieldByName('CustomerOrderQuantity').Value = ds_active.DataSet.FieldByName('SellerBuyerPOQuantity').Value) then
    if ds_active.DataSet.FieldByName('CustomerOrderStatesID').Value = 1 then
      ds_active.DataSet.FieldByName('CustomerOrderStatesID').Value := 3;
  DM.DataSetModify('EXEC usp_UpdateTradingOrderDemandManagingRCED');
end;

procedure TMgrTradingOrder.UpdateTradingOrder(slParent: TStringList; objTO: TTradingOrder);

  procedure UpdateTradingOrderByRules(BatchTOID: string);
  var
    sl: TStringList;
    i: integer;
    adt1: TADODataSet;
  begin
    sl := TStringList.Create;
    adt1 := TADODataSet.Create(nil);
    try
      sl.CommaText := BatchTOID;
      for i := 0 to sl.Count - 1 do
      begin
        DM.DataSetQuery(adt1, 'select DemandManagingRCED from TradingOrder where TradingOrderID=' + sl[i]);
        if adt1.FieldByName('DemandManagingRCED').AsInteger > 0 then
          DM.DataSetModify('');
      end;
    finally
      sl.Free;
      adt1.Free;
    end;
  end;
begin
  slTOParam.Clear;
  if slParent <> nil then
    slTOParam.Text := slParent.Text
  else if objTO <> nil then
  begin
  end;
  if slTOParam <> nil then
  begin
    DM.DataSetSPModify('usp_UpdateTradingOrder', slTOParam);
    UpdateTradingInfoToCustomerOrder(slTOParam.Values['BatchTradingOrderID']);
    //UpdateTradingOrderByRules(slTOParam.Values['BatchTradingOrderID']);
  end;
end;

procedure TMgrTradingOrder.UpdateTradingInfoToCustomerOrder(BatchTradingOrderID: string);
var
  adtCO, adt1: TADODataSet;
  objMgrCO: TMgrCustomerOrder;
  strSql, CustomerOrderID, DemandManagingRCED, DemandManagingSalesMonth: string;
  DemandManagingDMMMonth: string;
begin
  adtCO := TADODataSet.Create(nil);
  adt1 := TADODataSet.Create(nil);
  objMgrCO := TMgrCustomerOrder.Create;
  try
    DM.DataSetQuery(adtCO, 'select distinct CustomerOrderID as CustomerOrderID from TradingOrder where TradingOrderID in (' + BatchTradingOrderID + ') order by CustomerOrderID');
    while not adtCO.Eof do
    begin
      CustomerOrderID := adtCO.fieldbyname('CustomerOrderID').AsString;
      strSql := 'select max(DemandManagingRCED) as DemandManagingRCED'
        + ',max(DemandManagingSalesMonth) as DemandManagingSalesMonth'
        + ',max(DemandManagingDMMMonth) as DemandManagingDMMMonth'
        //+ ',max(LogisticInActArriveWarehouseDate) as LogisticInActArriveWarehouseDate'
      + ' from TradingOrder where CustomerOrderID=' + CustomerOrderID;
      DM.DataSetQuery(adt1, strSql);
      DemandManagingRCED := adt1.fieldbyname('DemandManagingRCED').AsString;
      DemandManagingSalesMonth := adt1.fieldbyname('DemandManagingSalesMonth').AsString;
      DemandManagingDMMMonth := adt1.fieldbyname('DemandManagingDMMMonth').AsString;
//      LogisticInActArriveWarehouseDate := adt1.fieldbyname('LogisticInActArriveWarehouseDate').AsString;
      slTOParam.Clear;
      if DemandManagingRCED <> '' then
        slTOParam.Append('DemandManagingRCED=' + DemandManagingRCED);
      if DemandManagingSalesMonth <> '' then
        slTOParam.Append('DemandManagingSalesMonth=' + DemandManagingSalesMonth);
      if DemandManagingDMMMonth <> '' then
        slTOParam.Append('DemandManagingDMMMonth=' + DemandManagingDMMMonth);
      //if LogisticInActArriveWarehouseDate <> '' then
      //  slTOParam.Append('LogisticInActArriveWarehouseDate=' + LogisticInActArriveWarehouseDate);
      slTOParam.Append('CustomerOrderID=' + CustomerOrderID);
      slTOParam.Append('Col=CustomerOrderID');
      objMgrCO.UpdateCustomerOrder(slTOParam);
      adtCO.Next;
    end;
  finally
    adt1.Free;
    adtCO.Free;
    objMgrCO.Free;
  end;
end;

procedure TMgrTradingOrder.CreateReceivingSchedule(slParam: TStringList);
begin
  DM.DataSetSPModify('usp_InsertReceivingSchedule', slParam);
end;

procedure TMgrTradingOrder.UpdateTradingOrderReceivingSchedule(
  slParam: TStringList);
var
  strSqlSortingDate: string;
begin
  if slParam.Values['SortingDate'] = '' then
  begin
    strSqlSortingDate := ',SortingDate=NULL';
    DM.DataSetModify('UPDATE TradingOrderReceivingSchedule SET UpdateTime=getdate()'
      + strSqlSortingDate
      + ' WHERE ReceivingScheduleID in ('
      + slParam.Values['BatchReceivingScheduleID'] + ')');
    DM.DataSetModify('Update TradingOrder set TradingOrderStatusID=4 '
      + ' where TradingOrderStatusID in (5,6) and TradingOrderID in ('
      + slParam.Values['BatchTradingOrderID'] + ')');
  end
  else
  begin
    strSqlSortingDate := ',SortingDate=''' + slParam.Values['SortingDate'] + '''';
    DM.DataSetModify('UPDATE TradingOrderReceivingSchedule SET UpdateTime=getdate()'
      + strSqlSortingDate
      + ' WHERE ReceivingScheduleID in ('
      + slParam.Values['BatchReceivingScheduleID'] + ')');
    DM.DataSetModify('Update TradingOrder set TradingOrderStatusID=5 '
      + ' where TradingOrderStatusID<5 and TradingOrderID in ('
      + slParam.Values['BatchTradingOrderID'] + ')');
  end;
end;

procedure TMgrTradingOrder.QueryTradingOrderForSales1(adtFrom: TADODataset;
  objTO: TTradingOrder; slParent: TStringList);
begin
  if objTO <> nil then
  begin
    slTOParam.Clear;
    slTOParam.Values['CustomerOrderID'] := IntToStr(objTO.CustomerOrderID);
    slTOParam.Values['Col'] := 'CustomerOrderID';
  end
  else if slParent <> nil then
    slTOParam.Text := slParent.Text;
  DM.DataSetSPQuery(adtFrom, 'usp_GetTradingOrderForSales', slTOParam);
end;

procedure TMgrTradingOrder.QueryTradingOrderForCS1(adtFrom: TADODataset;
  objTO: TTradingOrder; slParent: TStringList);
begin
  if objTO <> nil then
  begin
    slTOParam.Clear;
    slTOParam.Values['CustomerOrderID'] := IntToStr(objTO.CustomerOrderID);
    slTOParam.Values['Col'] := 'CustomerOrderID';
  end
  else if slParent <> nil then
    slTOParam.Text := slParent.Text;
  DM.DataSetSPQuery(adtFrom, 'usp_GetTradingOrderForCS', slTOParam);
end;

{ TMgrProductionSchedule }

constructor TMgrProductionSchedule.Create;
begin
  slPSParam := TStringList.Create;
end;

destructor TMgrProductionSchedule.Destroy;
begin
  inherited;
  slPSParam.Free;
end;

function TMgrProductionSchedule.AddProductionScheduleBeforeInsert(adtFrom: TADODataset): string;
var
  warmsg: string;
  adt1: TADODataset;
begin
  warmsg := '';
  if trim(adtFrom.fieldbyname('RTD').AsString) = '' then
    warmsg := 'RTD can''t be null.'
  else
  begin
    adt1 := TADODataset.Create(nil);
    try
      slPSParam.Clear;
      slPSParam.Values['CustomerOrderID'] := adtFrom.FieldByName('CustomerOrderID').AsString;
      DM.DataSetSPQuery(adt1, 'usp_GetProductionScheduleCUD', slPSParam);
      if adt1.RecordCount > 0 then
        warmsg := 'Customer Order ID:' + adtFrom.FieldByName('CustomerOrderID').AsString + ' is exsited in schedule.';
    finally
      adt1.Free;
    end;
  end;
  Result := warmsg;
end;

procedure TMgrProductionSchedule.AddProductionSchedule(gridFrom: TDBGridEh);
var
  i: integer;
  strWarMsg: string;
begin
  gridFrom.DataSource.DataSet.DisableControls;
  try
    for i := 0 to gridFrom.SelectedRows.Count - 1 do
    begin
      gridFrom.DataSource.DataSet.Bookmark := gridFrom.SelectedRows.items[I];
      strWarMsg := AddProductionScheduleBeforeInsert(TADODataset(gridFrom.DataSource.DataSet));
      if strWarMsg <> '' then
      begin
        ShowMessage(strWarMsg);
        Break;
      end;
      slPSParam.Clear;
      slPSParam.Values['CustomerOrderID'] := gridFrom.DataSource.DataSet.FieldByName('CustomerOrderID').AsString;
      slPSParam.Values['CustomerOrderQuantity'] := gridFrom.DataSource.DataSet.FieldByName('CustomerOrderQuantity').AsString;
      DM.DataSetSPModify('usp_InsertProductionScheduleCUD', slPSParam);
    end;
  finally
    gridFrom.DataSource.DataSet.EnableControls;
  end;
end;

procedure TMgrProductionSchedule.QueryProductionSchedule(adtFrom: TADODataset;
  objPS: TTradingOrder; slParent: TStringList);
begin
  if objPS <> nil then
  begin
    slPSParam.Clear;
    slPSParam.Values['CustomerOrderID'] := IntToStr(objPS.CustomerOrderID);
    slPSParam.Values['Col'] := 'CustomerOrderID';
  end
  else if slParent <> nil then
    slPSParam.Text := slParent.Text;
  DM.DataSetSPQuery(adtFrom, 'usp_GetProductionScheduleCUD', slPSParam);
end;


{ TMgrShippingSchedule }

constructor TMgrShippingSchedule.Create;
begin
  slParam := TStringList.Create;
end;

destructor TMgrShippingSchedule.Destroy;
begin
  inherited;
  slParam.Free;
end;

procedure TMgrShippingSchedule.QueryShippingSchedule(adtFrom: TADODataset);
begin

end;

procedure TMgrShippingSchedule.ShipGoods(adtFrom: TADODataset; objCO: TCustomerOrder);
begin
  //------check gboxWH change------
  if ((adtFrom.FieldByName('GoodsEXThirdPartyWarehouseDate').OldValue = null)
    and (adtFrom.FieldByName('GoodsEXThirdPartyWarehouseDate').OldValue <> adtFrom.FieldByName('GoodsEXThirdPartyWarehouseDate').Value)) then
  begin
    slParam.Values['TradingOrderStatusID'] := '7';
    slParam.Values['CustomerOrderID'] := objCO.BatchCustomerOrderID;
    slParam.Values['Col'] := 'CustomerOrderID';
    DM.DataSetSPModify('usp_UpdateCustomerOrder', slParam);
    {
    if (adtFrom.FieldByName('TradingOrderStatusID').Value = 6) then
      adtFrom.FieldByName('TradingOrderStatusID').Value := 7;
      }
  end;
end;

procedure TMgrShippingSchedule.UpdateShippingSchedule(slParent: TStringList);
begin
  if slParent <> nil then
    DM.DataSetSPModify('usp_UpdateShippingSchedule', slParent);
end;

procedure TMgrShippingSchedule.UpdateShippingScheduleLotNumber(coID: string);
var
  strSql: string;
  adt2: TADODataSet;
begin
  adt2 := TADODataSet.Create(nil);
  try
    DM.DataSetQuery(adt2, 'select (IsNull(max(LotNumber),0) + 1) as maxLotNumber from ShippingSchedule');
    slParam.Clear;
    slParam.Append('LotNumber=' + adt2.FieldByName('maxLotNumber').AsString);
    slParam.Append('BatchCustomerOrderID=' + coID);
    slParam.Append('Col=BatchCustomerOrderID');
    DM.DataSetSPModify('usp_UpdateShippingSchedule', slParam);
    strSql := 'UPDATE TradingOrder SET	UpdateTime = getdate(),TradingOrderStatusID=6'
      + ' WHERE TradingOrderStatusID <> 8 AND CustomerOrderID in (' + coID + ')';
    DM.DataSetModify(strSql);
  finally
    adt2.Free;
  end;
end;

procedure TMgrShippingSchedule.CreateShippingSchedule(objSS: TShippingSchedule);
begin
  slParam.Clear;
  slParam.Append('CustomerOrderID=' + IntToStr(objSS.CustomerOrderID));
//  slParam.Append('ShippingScheduleStatusID=' + IntToStr(objSS.ShippingScheduleStatusID));
  slParam.Append('LotNumber=0');
  DM.DataSetSPModify('usp_InsertShippingSchedule', slParam);
end;

end.

