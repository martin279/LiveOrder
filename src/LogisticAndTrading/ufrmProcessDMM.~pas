unit ufrmProcessDMM;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmDBBasicPrn, PropFilerEh, ActnList, PrnDbgeh, ImgList, DB,
  ADODB, Menus, PropStorageEh, DBCtrls, ComCtrls, ToolWin, GridsEh,
  DBGridEh, PrViewEh, StdCtrls, ExtCtrls, uDMEntity, uDMManager;

type
  TfrmProcessDMM = class(TfrmDBBasicPrn)
    tbtnRefresh: TToolButton;
    adt_activeCustomerOrderID: TAutoIncField;
    adt_activeInvoiceNumber: TStringField;
    adt_activeCustomerPurchaseOrderNumber: TStringField;
    adt_activePlantCode: TStringField;
    adt_activeCustomerOrderStatesName: TStringField;
    adt_activeCommunicatorName: TStringField;
    adt_activeDestination: TStringField;
    adt_activeMNumber: TStringField;
    adt_activeCustomerOrderNumber: TStringField;
    adt_activeCustomerNumber: TStringField;
    adt_activeCustomerName: TStringField;
    adt_activeModel: TStringField;
    adt_activeModelDescription: TStringField;
    adt_activeCustomerOrderQuantity: TFloatField;
    adt_activeCurrency: TStringField;
    adt_activeETD: TDateTimeField;
    adt_activeInstruction: TStringField;
    adt_activeRemark: TStringField;
    adt_activeForwarder: TStringField;
    adt_activeDeliveryETDEst: TDateTimeField;
    adt_activeDeliveryOnboardAct: TDateTimeField;
    adt_activeDeliveryETAAct: TDateTimeField;
    adt_activePackingList: TStringField;
    adt_activePlanCreateTime: TDateTimeField;
    adt_activeDeliveryPlanToWarehouseDate: TDateTimeField;
    adt_activeWarehouseRemark: TStringField;
    adt_activeForwarderID: TIntegerField;
    adt_activeShippingScheduleStatusID: TIntegerField;
    adt_activeTradingOrderID: TAutoIncField;
    adt_activeReceivingQuantity: TIntegerField;
    adt_activeLogisticInRCED: TDateTimeField;
    adt_activeOriginPickupDate: TDateTimeField;
    adt_activeActArriveWarehouseDate: TDateTimeField;
    adt_activeSortingDate: TDateTimeField;
    adt_activeImportSheetNo: TStringField;
    N2: TMenuItem;
    MenuBatchEdit: TMenuItem;
    procedure tbtnRefreshClick(Sender: TObject);
    procedure MenuBatchEditClick(Sender: TObject);
  private
    { Private declarations } 
    objBasicData: TMgrBasicData;
    slParam: TStringList;
  protected
    procedure InitializeForm; override;
    procedure DestoryForm; override;
    procedure SetData; override;
    procedure SetUI; override;
    procedure SetAccess; override;
  public
    { Public declarations }
  end;


implementation

uses DataModule, ufrmBatchEdtTO;

{$R *.dfm}

{ TfrmProcessDMM }

procedure TfrmProcessDMM.InitializeForm;
begin    
  objBasicData := TMgrBasicData.Create;
  slParam := TStringList.Create;
  inherited;
end;
   
procedure TfrmProcessDMM.DestoryForm;
begin
  inherited;
  objBasicData.Free;
  slParam.Free;
end;

procedure TfrmProcessDMM.SetData;
begin
  inherited;
  slParam.Clear;
  slParam.Append('LoginID=' + IntToStr(objCurUser.LoginID));
  objBasicData.QueryBasicDataBySP(adt_active, 'usp_GetTradingReceivingSchedule', slParam);
end;

procedure TfrmProcessDMM.SetUI;
begin
  inherited;
  gridData.FieldColumns['CustomerOrderQuantity'].Footer.ValueType := fvtSum;
end;
   
procedure TfrmProcessDMM.SetAccess;
begin
  inherited;
end;

procedure TfrmProcessDMM.tbtnRefreshClick(Sender: TObject);
begin
  inherited;
  adt_active.Active := false;
  adt_active.Active := true;
end;

procedure TfrmProcessDMM.MenuBatchEditClick(Sender: TObject);
var
  TOID: string;
begin
  if not CheckIfSelectRows(gridData) then exit;
  TOID := GetBatchFieldValueFromGrid(gridData, 'TradingOrderID');
  if TfrmBatchEdtTO.EdtFromList(TOID) then
    RefreshGrid(gridData, ds_active);
end;

end.
