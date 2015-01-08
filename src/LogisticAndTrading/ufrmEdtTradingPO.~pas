unit ufrmEdtTradingPO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmBasic, DBCtrlsEh, DBCtrls, StdCtrls, Mask, ExtCtrls, DB, ADODB,
  uDMManager, uDMEntity, DBGridEh, DBLookupEh, GridsEh, DataModule;

type
  TfrmEdtTradingPO = class(TfrmBasic)
    DBNavigator1: TDBNavigator;
    Label58: TLabel;
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
    dbtxtCOQty: TDBText;
    DBDateTimeEditEh2: TDBDateTimeEditEh;
    dbedtCustomerOrderID: TDBEditEh;
    Label60: TLabel;
    dbedtLogisticStatus: TDBEditEh;
    gboxSeller: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label50: TLabel;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    dbdtpSellerExFacDate: TDBDateTimeEditEh;
    dbdtpSellerExFacDate1: TDBDateTimeEditEh;
    DBDateTimeEditEh5: TDBDateTimeEditEh;
    DBEditEh1: TDBEditEh;
    dbedtBuyerPONo: TDBEditEh;
    DBEditEh5: TDBEditEh;
    dbcbbStockDueToOrderCancel: TDBComboBoxEh;
    dbedtBuyerPOQty: TDBEditEh;
    ds_active: TDataSource;
    dbcbbVendor: TDBLookupComboboxEh;
    ds_vendor: TDataSource;
    adt_vendor: TADODataSet;
    dbcbbShippingMode: TDBComboBoxEh;
    Label16: TLabel;
    Label57: TLabel;
    dbcbbAirFreightPaidBy: TDBComboBoxEh;
    GroupBox2: TGroupBox;
    gboxSellerInvoice: TGroupBox;
    DBNavigator2: TDBNavigator;
    DBNavigator3: TDBNavigator;
    Label11: TLabel;
    dbedtTradingOrderID: TDBEditEh;
    Panel1: TPanel;
    gridRS: TDBGridEh;
    Panel2: TPanel;
    ds_rs: TDataSource;
    ds_invoice: TDataSource;
    adt_rs: TADODataSet;
    adt_invoice: TADODataSet;
    gridInvoice: TDBGridEh;
    gboxDM: TGroupBox;
    Label17: TLabel;
    Label22: TLabel;
    Label27: TLabel;
    dbedtSalesMonth: TDBEditEh;
    dbedtDMMMonth: TDBEditEh;
    dbedtDMMRemark: TDBEditEh;
    Label28: TLabel;
    dbdtpDMRCED: TDBDateTimeEditEh;
    Label29: TLabel;
    dtpSellerPoDuedate: TDBDateTimeEditEh;
    procedure dbedtTradingOrderIDChange(Sender: TObject);
    procedure adt_invoiceBeforePost(DataSet: TDataSet);
    procedure adt_rsBeforePost(DataSet: TDataSet);
    procedure adt_invoiceAfterPost(DataSet: TDataSet);
    procedure adt_rsAfterPost(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbcbbShippingModeChange(Sender: TObject);
    procedure adt_rsBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
    slParam: TStringList;
    objTO: TTradingOrder;
    objMgrBasic: TMgrBasicData;
    objMgrTO: TMgrTradingOrder;
    objMgrCO: TMgrCustomerOrder;
    procedure adt_fromBeforePost(DataSet: TDataSet);
    procedure adt_fromAfterPost(DataSet: TDataSet);
    procedure CheckTOInputDataByRule();
    procedure QueryPOBodyInfo();
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

{$R *.dfm}

{ TfrmBasic1 }

procedure TfrmEdtTradingPO.InitializeForm;
begin
  objTO := TTradingOrder.Create;
  objMgrTO := TMgrTradingOrder.Create;
  objMgrCO := TMgrCustomerOrder.Create;
  objMgrBasic := TMgrBasicData.Create;
  slParam := TStringList.Create;
  inherited;
end;

procedure TfrmEdtTradingPO.DestoryForm;
begin
  inherited;
  slParam.Free;
  objTO.Free;
  objMgrTO.Free;
  objMgrCO.Free;
  objMgrBasic.Free;
end;

procedure TfrmEdtTradingPO.SetData;
begin
  inherited;
  objMgrBasic.QueryBasicData(adt_vendor, 'ViewVendorPlant', 'VendorID');
end;

procedure TfrmEdtTradingPO.SetUI;
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

procedure TfrmEdtTradingPO.SetAccess;
begin
  inherited;
  DBNavigator1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast,
    nbPost, nbCancel, nbRefresh];
  if objCurUser.AccessLevel = 15 then
    DBNavigator1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast,
      nbDelete, nbPost, nbCancel, nbRefresh];
  if objCurUser.AccessLevel = 17 then
  begin
    gboxCOBasicInfor.Enabled := false;
    gboxSeller.Enabled := false;
    gboxDM.Enabled := false;
    gboxSellerInvoice.Enabled := false;
  end;
end;

class procedure TfrmEdtTradingPO.EdtFromList(adt_from: TADODataSet);
begin
  with TfrmEdtTradingPO.Create(Application) do
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

procedure TfrmEdtTradingPO.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if (ds_active.DataSet.State in [dsEdit]) then
  begin
    if MessageDlg('Is update Order?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      ds_active.DataSet.Post
    else
      ds_active.DataSet.Cancel;
  end;
end;

procedure TfrmEdtTradingPO.CheckTOInputDataByRule;
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

procedure TfrmEdtTradingPO.adt_fromBeforePost(DataSet: TDataSet);
begin
  CheckTOInputDataByRule;
  objTO.SellerBuyerPONumber := UpperCase(Trim(VarToStr(dbedtBuyerPONo.Value)));
  objTO.SellerExFactoryDate := VarToStr(dbdtpSellerExFacDate.Value);
  objTO.SellerExFactoryDate1 := VarToStr(dbdtpSellerExFacDate1.Value);
  objTO.TradingOrderStatusID := ds_active.DataSet.fieldbyname('TradingOrderStatusID').AsInteger;
  objMgrTO.UpdateTradingOrderBeforePOST(ds_active, objTO);
end;

procedure TfrmEdtTradingPO.adt_fromAfterPost(DataSet: TDataSet);
begin
  TADODataSet(DataSet).UpdateBatch();
  objMgrTO.UpdateTradingInfoToCustomerOrder(DataSet.FieldByName('TradingOrderID').AsString);
end;

procedure TfrmEdtTradingPO.QueryPOBodyInfo;
begin
  slParam.Clear;
  slParam.Append('TradingOrderID=' + VarToStr(dbedtTradingOrderID.Value));
  objMgrBasic.QueryBasicDataByParam(adt_rs, 'TradingOrderReceivingSchedule', 'ReceivingScheduleID', slParam);
  objMgrBasic.QueryBasicDataByParam(adt_invoice, 'TradingOrderSellerInvoice', 'SellerInvoiceID', slParam);
end;

procedure TfrmEdtTradingPO.dbedtTradingOrderIDChange(Sender: TObject);
begin
  inherited;
  if VarToStr(dbedtTradingOrderID.Value) = '' then exit;
  if (adt_rs.State in [dsInsert, dsEdit]) then
  begin
    if (adt_rs.FieldByName('ReceivingQuantity').AsString <> '') then
    begin
      adt_rs.FieldByName('UpdateTime').Value := Now();
      adt_rs.Post;
    end
    else
      adt_rs.Cancel;
  end;
  if (adt_invoice.State in [dsInsert, dsEdit]) then
  begin
    if (adt_invoice.FieldByName('SellerInvoiceNumber').AsString <> '')
      or (adt_invoice.FieldByName('SellerInvoiceDate').AsString <> '') then
    begin
      adt_invoice.FieldByName('UpdateTime').Value := Now();
      adt_invoice.Post;
    end
    else
      adt_invoice.Cancel;
  end;
  QueryPOBodyInfo;
end;

procedure TfrmEdtTradingPO.adt_rsBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (DataSet.FieldByName('ReceivingQuantity').AsString <> '') then
  begin
    if (DataSet.State in [dsInsert]) then
    begin
      DataSet.FieldByName('TradingOrderID').Value := VarToStr(dbedtTradingOrderID.value);
      DataSet.FieldByName('UpdateTime').Value := Now();
    end
    else if (DataSet.State in [dsEdit]) then
      DataSet.FieldByName('UpdateTime').Value := Now();
  end
  else
  begin
    ShowMessage('Please input Receiving Quantity.');
    DataSet.Cancel;
    Abort;
  end;
end;

procedure TfrmEdtTradingPO.adt_invoiceBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (DataSet.FieldByName('SellerInvoiceNumber').AsString <> '')
    and (DataSet.FieldByName('SellerInvoiceDate').AsString <> '') then
  begin
    if (DataSet.State in [dsInsert]) then
    begin
      if gridRS.DataSource.DataSet.FieldByName('ReceivingScheduleID').AsString <> '' then
      begin
        //DataSet.FieldByName('TradingOrderID').Value := VarToStr(dbedtTradingOrderID.value);
        DataSet.FieldByName('ReceivingScheduleID').Value := gridRS.DataSource.DataSet.FieldByName('ReceivingScheduleID').Value;
        DataSet.FieldByName('UpdateTime').Value := Now();
      end;
    end
    else if (DataSet.State in [dsEdit]) then
      DataSet.FieldByName('UpdateTime').Value := Now();
  end
  else
  begin
    ShowMessage('Please input invoice no. and date.');
    DataSet.Cancel;
    Abort;
  end;
end;

procedure TfrmEdtTradingPO.dbcbbShippingModeChange(Sender: TObject);
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

procedure TfrmEdtTradingPO.adt_invoiceAfterPost(DataSet: TDataSet);
begin
  inherited;
  TADODataSet(DataSet).UpdateBatch();
end;

procedure TfrmEdtTradingPO.adt_rsAfterPost(DataSet: TDataSet);
begin
  inherited;
  TADODataSet(DataSet).UpdateBatch();
end;

procedure TfrmEdtTradingPO.adt_rsBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  //
//  a
  Abort;
end;

end.

