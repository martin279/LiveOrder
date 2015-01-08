unit ufrmBatchEdtTO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmBasic, Buttons, StdCtrls, DBCtrlsEh, Mask, DBGridEh,
  DBLookupEh, DB, ADODB, uDMEntity, uDMManager;

type
  TfrmBatchEdtTO = class(TfrmBasic)
    btnSave: TButton;
    gboxSeller: TGroupBox;
    dbdtpPOToSellerDate: TDBDateTimeEditEh;
    dbdtpEXFacDate: TDBDateTimeEditEh;
    dbdtpEXFacDate1: TDBDateTimeEditEh;
    dbdtpRCEDSellerOA: TDBDateTimeEditEh;
    dbedtPartNo: TDBEditEh;
    dbedtBuyerPONo: TDBEditEh;
    dbedtBuyerRemark: TDBEditEh;
    dbcbbStockDueToOrderCancel: TDBComboBoxEh;
    dbcbbShippingMode: TDBComboBoxEh;
    chkPartNo: TCheckBox;
    chkSellerCode: TCheckBox;
    chkPOToSellerDate: TCheckBox;
    chkBuyerPONo: TCheckBox;
    chkShippingMode: TCheckBox;
    chkRCEDSellerOA: TCheckBox;
    chkBuyerRemark: TCheckBox;
    chkEXFacDate: TCheckBox;
    chkEXFacDate1: TCheckBox;
    chkStockDueToOrderCancel: TCheckBox;
    chkBuyerPOQty: TCheckBox;
    dbedtBuyerPOQty: TDBEditEh;
    chkAirFreightPaidBy: TCheckBox;
    dbcbbAirFreightPaidBy: TDBComboBoxEh;
    gboxDemandManaging: TGroupBox;
    dbdtpDemandRCED: TDBDateTimeEditEh;
    dbedtDMMRemark: TDBEditEh;
    chkDemandRCED: TCheckBox;
    chkSalesMonth: TCheckBox;
    chkDMMRemark: TCheckBox;
    dbedtSalesMonth: TDBEditEh;
    chkDMMMonth: TCheckBox;
    dbedtDMMMonth: TDBEditEh;
    dbcbbVendor: TDBLookupComboboxEh;
    adt_vendor: TADODataSet;
    ds_vendor: TDataSource;
    dtpPODueDate: TDBDateTimeEditEh;
    chkPODueDate: TCheckBox;
    procedure btnSaveClick(Sender: TObject);
    procedure dbcbbShippingModeChange(Sender: TObject);
  private
    { Private declarations }
    TOID: string;
    objTO: TTradingOrder;
    objMgrBasic: TMgrBasicData;
    objMgrTO: TMgrTradingOrder;
  protected
    procedure InitializeForm; override;
    procedure DestoryForm; override;
    procedure SetData; override;
    procedure SetUI; override;
    procedure SetAccess; override;
  public
    { Public declarations }
    class function EdtFromList(selectRowID: string): Boolean;
  end;

implementation

uses DataModule, uMJ;

{$R *.dfm}

{ TfrmBatchEdtTO }

procedure TfrmBatchEdtTO.InitializeForm;
begin
  objTO := TTradingOrder.Create;
  objMgrBasic := TMgrBasicData.Create;
  objMgrTO := TMgrTradingOrder.Create;
  inherited;
end;

procedure TfrmBatchEdtTO.DestoryForm;
begin
  inherited;
  objTO.Free;
  objMgrBasic.Free;
  objMgrTO.Free;
end;

procedure TfrmBatchEdtTO.SetData;
begin        
  objMgrBasic.QueryBasicData(adt_vendor, 'ViewVendorPlant', 'VendorID');
end;

procedure TfrmBatchEdtTO.SetUI;
begin
  inherited;
  chkAirFreightPaidBy.Enabled := false;
  dbcbbAirFreightPaidBy.Enabled := false;
  dbdtpPOToSellerDate.Value := now;
  dbdtpEXFacDate.Value := now;
  dbdtpEXFacDate1.Value := now;
  dbdtpRCEDSellerOA.Value := now;
  dbdtpDemandRCED.Value := now;
end;

procedure TfrmBatchEdtTO.SetAccess;
begin
  inherited;
  gboxSeller.Enabled := (gVars.CurUserLevel = 1) or (gVars.CurUserLevel = 15) or (gVars.CurUserLevel = 16);
  gboxDemandManaging.Enabled := (gVars.CurUserLevel = 1) or (gVars.CurUserLevel = 15);
end;

class function TfrmBatchEdtTO.EdtFromList(selectRowID: string): Boolean;
begin
  with TfrmBatchEdtTO.Create(Application) do
  try
    TOID := selectRowID;
    result := ShowModal = mrOk;
  finally
    Free;
  end;
end;

procedure TfrmBatchEdtTO.btnSaveClick(Sender: TObject);
var
  slParam: TStringList;
begin
  inherited;
  slParam := TStringList.Create;
  try
    if chkPartNo.Checked then
      slParam.Values['SellerPartNo'] := Trim(dbedtPartNo.Text);
    if chkSellerCode.Checked then
      slParam.Values['VendorID'] := VarToStr(dbcbbVendor.Value);
    if chkPOToSellerDate.Checked then
      slParam.Values['SellerPOToSellerDate'] := FormatDateTime('YYYY-mm-dd', dbdtpPOToSellerDate.Value);
    if chkBuyerPONo.Checked then
      slParam.Values['SellerBuyerPONumber'] := Trim(dbedtBuyerPONo.Text);
    if chkBuyerPOQty.Checked then
      slParam.Values['SellerBuyerPOQuantity'] := trim(dbedtBuyerPOQty.Text);
    if chkShippingMode.Checked then
      slParam.Values['SellerShippingMode'] := VarToStr(dbcbbShippingMode.Value);
    if chkAirFreightPaidBy.Checked then
      slParam.Values['SellerAirFreightPaidBy'] := VarToStr(dbcbbAirFreightPaidBy.Value);
    if chkRCEDSellerOA.Checked then
      slParam.Values['SellerRCEDSellerOA'] := FormatDateTime('YYYY-mm-dd', dbdtpRCEDSellerOA.Value);
    if chkEXFacDate.Checked then
      slParam.Values['SellerExFactoryDate'] := FormatDateTime('YYYY-mm-dd', dbdtpEXFacDate.Value);
    if chkEXFacDate1.Checked then
      slParam.Values['SellerExFactoryDate1'] := FormatDateTime('YYYY-mm-dd', dbdtpEXFacDate1.Value);
    if chkStockDueToOrderCancel.Checked then
      slParam.Values['SellerStockDueToOrderCancel'] := VarToStr(dbcbbStockDueToOrderCancel.Value);
    if chkBuyerRemark.Checked then
      slParam.Values['SellerBuyerRemark'] := VarToStr(dbedtBuyerRemark.Value);         
    if chkPODueDate.Checked then
      slParam.Values['SellerPoDuedate'] := FormatDateTime('YYYY-mm-dd', dtpPODueDate.Value);

    if chkDemandRCED.Checked then
      slParam.Values['DemandManagingRCED'] := FormatDateTime('YYYY-mm-dd', dbdtpDemandRCED.Value);
    if chkSalesMonth.Checked then
      slParam.Values['DemandManagingSalesMonth'] := VarToStr(dbedtSalesMonth.Value);
    if chkDMMMonth.Checked then
      slParam.Values['DemandManagingDMMMonth'] := VarToStr(dbedtDMMMonth.Value);
    if chkDMMRemark.Checked then
      slParam.Values['DemandManagingDMMRemark'] := VarToStr(dbedtDMMRemark.Value);

    slParam.Values['BatchTradingOrderID'] := TOID;
    slParam.Values['Col'] := 'BatchTradingOrderID';
    objMgrTO.UpdateTradingOrder(slParam);
  finally
    ModalResult := mrOk;
    slParam.Free;
  end;
end;

procedure TfrmBatchEdtTO.dbcbbShippingModeChange(Sender: TObject);
begin
  inherited;
  if LowerCase(VarToStr(dbcbbShippingMode.Value)) = 'air' then
  begin
    chkAirFreightPaidBy.Enabled := true;
    dbcbbAirFreightPaidBy.Enabled := true;
    chkAirFreightPaidBy.Checked := true;
    dbcbbAirFreightPaidBy.ItemIndex := 1;
  end
  else
  begin
    chkAirFreightPaidBy.Enabled := false;
    dbcbbAirFreightPaidBy.Enabled := false;
    chkAirFreightPaidBy.Checked := false;
    dbcbbAirFreightPaidBy.ItemIndex := 0;
  end;
end;

end.

