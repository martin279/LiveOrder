unit ufrmEdtTO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmBasic, ActnList, ImgList, ComCtrls, ToolWin, ExtCtrls,
  ADODB, DBCtrls, DB, DBGridEh, DBCtrlsEh, StdCtrls, Mask, DBLookupEh, GridsEh,
  uDMManager, uDMEntity;

type
  TfrmEdtTO = class(TfrmBasic)
    ds_active: TDataSource;
    gboxCOBasicInfor: TGroupBox;
    Label4: TLabel;
    LabelPrice: TLabel;
    Label7: TLabel;
    Label6: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    LabelTotalAmount: TLabel;
    Label23: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    DBNavigator1: TDBNavigator;
    gboxSeller: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    gboxLogisticIn: TGroupBox;
    Label27: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    gboxDemandManaging: TGroupBox;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    gboxLogisticOut: TGroupBox;
    Label43: TLabel;
    Label48: TLabel;
    Label44: TLabel;
    Label47: TLabel;
    Label42: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    gboxSales: TGroupBox;
    Label51: TLabel;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    dbdtpSellerOAReplyDate: TDBDateTimeEditEh;
    dbdtpSellerExFacDate: TDBDateTimeEditEh;
    dbdtpSellerExFacDate1: TDBDateTimeEditEh;
    DBDateTimeEditEh5: TDBDateTimeEditEh;
    dbdtpDemandManagingRCED: TDBDateTimeEditEh;
    DBDateTimeEditEh10: TDBDateTimeEditEh;
    DBDateTimeEditEh11: TDBDateTimeEditEh;
    DBDateTimeEditEh12: TDBDateTimeEditEh;
    DBDateTimeEditEh13: TDBDateTimeEditEh;
    DBDateTimeEditEh14: TDBDateTimeEditEh;
    DBEditEh1: TDBEditEh;
    DBEditEh2: TDBEditEh;
    dbedtBuyerPONo: TDBEditEh;
    DBEditEh5: TDBEditEh;
    DBEditEh6: TDBEditEh;
    DBEditEh9: TDBEditEh;
    DBEditEh12: TDBEditEh;
    DBEditEh17: TDBEditEh;
    DBEditEh18: TDBEditEh;
    DBEditEh20: TDBEditEh;
    DBDateTimeEditEh17: TDBDateTimeEditEh;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText5: TDBText;
    DBText6: TDBText;
    DBText7: TDBText;
    DBText8: TDBText;
    DBText9: TDBText;
    DBText10: TDBText;
    DBText12: TDBText;
    DBText13: TDBText;
    DBText14: TDBText;
    DBText15: TDBText;
    Label11: TLabel;
    Label55: TLabel;
    DBDateTimeEditEh18: TDBDateTimeEditEh;
    DBEditEh23: TDBEditEh;
    gboxWH: TGroupBox;
    Label41: TLabel;
    DBDateTimeEditEh8: TDBDateTimeEditEh;
    Label49: TLabel;
    dbdtpGoodsExWHdate: TDBDateTimeEditEh;
    Label28: TLabel;
    Label29: TLabel;
    Label56: TLabel;
    DBEditEh24: TDBEditEh;
    DBDateTimeEditEh9: TDBDateTimeEditEh;
    DBDateTimeEditEh16: TDBDateTimeEditEh;
    DBDateTimeEditEh19: TDBDateTimeEditEh;
    DBDateTimeEditEh20: TDBDateTimeEditEh;
    DBDateTimeEditEh21: TDBDateTimeEditEh;
    dbcbbPackingList: TDBComboBoxEh;
    dbcbbStockDueToOrderCancel: TDBComboBoxEh;
    dbcbbShippingMode: TDBComboBoxEh;
    dbcbbIncoterms: TDBComboBoxEh;
    dbcbbCargoStatus: TDBComboBoxEh;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    ds_cargo: TDataSource;
    adt_cargo: TADODataSet;
    DBDateTimeEditEh2: TDBDateTimeEditEh;
    dbedtBuyerPOQty: TDBEditEh;
    Label50: TLabel;
    Label57: TLabel;
    dbcbbAirFreightPaidBy: TDBComboBoxEh;
    gboxCOChangeLog: TGroupBox;
    gridLog: TDBGridEh;
    ds_Log: TDataSource;
    adt_Log: TADODataSet;
    adt_LogCustomerOrderChangeLogID: TAutoIncField;
    adt_LogCustomerOrderID: TIntegerField;
    adt_LogCustomerOrderQuantity: TFloatField;
    adt_LogRTD: TDateTimeField;
    adt_LogETD: TDateTimeField;
    adt_LogChangeField: TStringField;
    adt_LogChangeTime: TDateTimeField;
    adt_LogChangeBy: TIntegerField;
    Label58: TLabel;
    dbedtCustomerOrderID: TDBEditEh;
    dbtxtCOQty: TDBText;
    dbedtSalesMonth: TDBEditEh;
    Label59: TLabel;
    DBEditEh3: TDBEditEh;
    dbedtLogisticStatus: TDBEditEh;
    Label60: TLabel;
    Label52: TLabel;
    dbedtDMMMonth: TDBEditEh;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbcbbShippingModeChange(Sender: TObject);
    procedure dbedtCustomerOrderIDChange(Sender: TObject);
  private
    { Private declarations }
    objTO: TTradingOrder;
    objMgrBasic: TMgrBasicData;
    objMgrTO: TMgrTradingOrder;
    objMgrCO: TMgrCustomerOrder;
    procedure adt_fromBeforePost(DataSet: TDataSet);
    procedure adt_fromAfterPost(DataSet: TDataSet);
    procedure CheckTOInputDataByRule();
    //procedure UpdateTODataBeforePOST();
  protected
    procedure InitializeForm; override;
    procedure DestoryForm; override;
    procedure SetData; override;
    procedure SetUI; override;
    procedure SetAccess; override;
  public
    { Public declarations }
    class procedure EdtFromList(adt_from: TADODataSet);
  end;

implementation

uses DataModule, uMJ;

{$R *.dfm}

{ TfrmEdtTO }

procedure TfrmEdtTO.InitializeForm;
begin
  objTO := TTradingOrder.Create;
  objMgrTO := TMgrTradingOrder.Create;
  objMgrCO := TMgrCustomerOrder.Create;
  objMgrBasic := TMgrBasicData.Create;
  inherited;
end;

procedure TfrmEdtTO.DestoryForm;
begin
  inherited;
  objTO.Free;
  objMgrTO.Free;
  objMgrCO.Free;
  objMgrBasic.Free;
end;

procedure TfrmEdtTO.SetData;
begin
  objMgrBasic.QueryBasicData(adt_cargo, 'CustomerOrderCargoStatusType', 'CargoStatusTypeID');
end;

procedure TfrmEdtTO.SetUI;
begin
  inherited;
  Position := poOwnerFormCenter;
  dbcbbShippingMode.Items.Add('');
  dbcbbShippingMode.Items.Add('AIR');
  dbcbbShippingMode.Items.Add('OCEAN');
  dbcbbShippingMode.Items.Add('ROAD');
  dbcbbShippingMode.KeyItems.Add('');
  dbcbbShippingMode.KeyItems.Add('AIR');
  dbcbbShippingMode.KeyItems.Add('OCEAN');
  dbcbbShippingMode.KeyItems.Add('ROAD');
end;

procedure TfrmEdtTO.SetAccess;
begin
  inherited;
  dbedtCustomerOrderID.Enabled := false;
  dbedtLogisticStatus.Enabled := false;
  dbcbbAirFreightPaidBy.Enabled := false;
  gboxCOChangeLog.Enabled := true;

  DBNavigator1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast]
    + [nbPost, nbCancel];

  gboxCOBasicInfor.Enabled := (gVars.CurUserLevel = 1) or (gVars.CurUserLevel = 15) or (gVars.CurUserLevel = 16);
  gboxSeller.Enabled := (gVars.CurUserLevel = 1) or (gVars.CurUserLevel = 15) or (gVars.CurUserLevel = 16);
  gboxLogisticIn.Enabled := (gVars.CurUserLevel = 1) or (gVars.CurUserLevel = 17);
  gboxWH.Enabled := ((gVars.CurUserLevel = 1) or (gVars.CurUserLevel = 17) or (gVars.CurUserLevel = 23));
  gboxLogisticOut.Enabled := (gVars.CurUserLevel = 1) or (gVars.CurUserLevel = 18);
  gboxDemandManaging.Enabled := (gVars.CurUserLevel = 1) or (gVars.CurUserLevel = 15);
  gboxSales.Enabled := (gVars.CurUserLevel = 1) or (gVars.CurUserLevel = 15);
end;

class procedure TfrmEdtTO.EdtFromList(adt_from: TADODataSet);
begin
  with TfrmEdtTO.Create(Application) do
  try
    ds_active.DataSet := adt_from;
    adt_from.BeforePost := adt_fromBeforePost;
    adt_from.AfterPost := adt_fromAfterPost;
    if (adt_from.State in [dsEdit]) then
      adt_from.Cancel;

    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmEdtTO.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if (dbdtpSellerOAReplyDate.DataSource.DataSet.State in [dsEdit]) then
  begin
    if MessageDlg('Is update Order?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      ds_active.DataSet.Post
    else
      ds_active.DataSet.Cancel;
  end;
end;

procedure TfrmEdtTO.adt_fromBeforePost(DataSet: TDataSet);
begin
  CheckTOInputDataByRule;
  objTO.SellerBuyerPONumber := UpperCase(Trim(VarToStr(dbedtBuyerPONo.Value)));
  objTO.SellerExFactoryDate := VarToStr(dbdtpSellerExFacDate.Value);
  objTO.SellerExFactoryDate1 := VarToStr(dbdtpSellerExFacDate1.Value);
  objTO.TradingOrderStatusID := ds_active.DataSet.fieldbyname('TradingOrderStatusID').AsInteger;
  objMgrTO.UpdateTradingOrderBeforePOST(ds_active, objTO);
  inherited;
end;

procedure TfrmEdtTO.adt_fromAfterPost(DataSet: TDataSet);
begin
  TADODataSet(DataSet).UpdateBatch();  
  objMgrTO.UpdateTradingInfoToCustomerOrder(DataSet.FieldByName('TradingOrderID').AsString);
end;

procedure TfrmEdtTO.CheckTOInputDataByRule;
begin
  if (VarToStr(dbedtBuyerPOQty.Value) = '') or (Trim(dbtxtCOQty.Caption) = '') then
  begin
    ShowMessage('PO qty. and order qty. can''t be empty.');
    if (ds_active.DataSet.State in [dsEdit]) then
      ds_active.DataSet.Cancel;
  end;
  if StrToInt(Trim(VarToStr(dbedtBuyerPOQty.Value))) > StrToInt(Trim(dbtxtCOQty.Caption)) then
  begin
    ShowMessage('PO Qty. can''t bigger than order qty.');
    if (ds_active.DataSet.State in [dsEdit]) then
      ds_active.DataSet.Cancel;
  end;
end;

procedure TfrmEdtTO.dbcbbShippingModeChange(Sender: TObject);
begin
  inherited;
  if LowerCase(VarToStr(dbcbbShippingMode.Value)) = 'air' then
  begin
    dbcbbAirFreightPaidBy.Enabled := true;
    dbcbbAirFreightPaidBy.ItemIndex := 1;
  end
  else
  begin
    dbcbbAirFreightPaidBy.Enabled := false;
    dbcbbAirFreightPaidBy.ItemIndex := 0;
  end;
end;

procedure TfrmEdtTO.dbedtCustomerOrderIDChange(Sender: TObject);
var
  slParam: TStringList;
begin
  inherited;
  slParam := TStringList.Create;
  try
    slParam.Clear;
    slParam.Append('CustomerOrderID=' + VarToStr(dbedtCustomerOrderID.Value));
    objMgrCO.QueryCustomerOrderLog(adt_Log, slParam);
  finally
    slParam.Free;
  end;
end;

end.

