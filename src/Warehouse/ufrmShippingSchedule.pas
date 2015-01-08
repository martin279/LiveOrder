unit ufrmShippingSchedule;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmDBBasicPrn, PropFilerEh, DB, ADODB, PrnDbgeh, Menus,
  PropStorageEh, ActnList, ImgList, GridsEh, DBGridEh, PrViewEh, StdCtrls,
  ComCtrls, DBCtrls, ToolWin, ExtCtrls, uDMEntity, uDMManager;

type
  TfrmShippingSchedule = class(TfrmDBBasicPrn)
    N2: TMenuItem;
    MenuDone: TMenuItem;
    tbtnRefresh: TToolButton;
    Timer1: TTimer;
    MenuNotStockDone: TMenuItem;
    N3: TMenuItem;
    MenuEdtShippingSchedule: TMenuItem;
    MenuUndo: TMenuItem;
    MenuBatchEdtShippingSchedule: TMenuItem;
    procedure MenuDoneClick(Sender: TObject);
    procedure tbtnRefreshClick(Sender: TObject);
    procedure MenuNotStockDoneClick(Sender: TObject);
    procedure MenuEdtShippingScheduleClick(Sender: TObject);
    procedure MenuUndoClick(Sender: TObject);
    procedure MenuBatchEdtShippingScheduleClick(Sender: TObject);
  private
    { Private declarations }
    objBasicData: TMgrBasicData;
    objMgrSS: TMgrShippingSchedule;
    slBasicParam: TStringList;
    procedure UpdateStockDone(IsStockDone: Boolean = true);
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

uses DataModule, ufrmEdtShippingSchedule,
  ufrmBatchEdtShippingSchedule;

{$R *.dfm}

{ TfrmDBBasicPrn1 }

procedure TfrmShippingSchedule.InitializeForm;
begin
  objMgrSS := TMgrShippingSchedule.Create;
  objBasicData := TMgrBasicData.Create;
  slBasicParam := TStringList.Create;
  inherited;
end;

procedure TfrmShippingSchedule.DestoryForm;
begin
  inherited;
  objBasicData.Free;
  objMgrSS.Free;
  slBasicParam.Free;
end;

procedure TfrmShippingSchedule.SetData;
begin
  slBasicParam.Clear;
  slBasicParam.Append('LoginID=' + IntToStr(objCurUser.LoginID));
  objBasicData.QueryBasicDataBySP(adt_active, 'usp_GetShippingSchedule', slBasicParam);
end;

procedure TfrmShippingSchedule.SetUI;
begin
  inherited;
  gridData.FieldColumns['CustomerOrderQuantity'].Footer.ValueType := fvtSum;
end;

procedure TfrmShippingSchedule.SetAccess;
begin
  inherited;
  MenuUndo.Visible := false;
  MenuNotStockDone.Visible := false;
  MenuDone.Visible := false;
  gridData.FieldColumns['Price'].Visible := false;
  gridData.FieldColumns['TotalAmount'].Visible := false;
  if objCurUser.AccessLevel in [5, 6] then
  begin
    MenuDone.Visible := true;
    MenuNotStockDone.Visible := true;
    MenuUndo.Visible := true;
    Timer1.Enabled := true;
    gridData.FieldColumns['DeliveryPlanToWarehouseDate'].Visible := false;
    gridData.FieldColumns['ForwarderPickupDateAct'].Visible := false;
    gridData.FieldColumns['DeliveryETDEst'].Visible := false;
    gridData.FieldColumns['DeliveryOnboardAct'].Visible := false;
    gridData.FieldColumns['DeliveryETAAct'].Visible := false;
    gridData.FieldColumns['Incoterms'].Visible := false;
    gridData.FieldColumns['LogisticExportSheetNo'].Visible := false;
    gridData.FieldColumns['LogisticRemark'].Visible := false;
    gridData.FieldColumns['WarehouseRemark'].Visible := false;
    gridData.FieldColumns['PackingList'].Visible := false;
  end;
  if objCurUser.AccessLevel in [1, 23] then
  begin
    Timer1.Enabled := true;
    MenuDone.Visible := true;
    MenuNotStockDone.Visible := true;
    MenuUndo.Visible := true;
    MenuEdtShippingSchedule.Visible := true;
    MenuBatchEdtShippingSchedule.Visible := true;
    gridData.OnDblClick := MenuEdtShippingSchedule.OnClick;
  end;
  if objCurUser.AccessLevel in [1, 25] then
  begin
    gridData.FieldColumns['Price'].Visible := true;
    gridData.FieldColumns['TotalAmount'].Visible := true;
  end;
end;

procedure TfrmShippingSchedule.tbtnRefreshClick(Sender: TObject);
begin
  inherited;
  adt_active.Active := false;
  adt_active.Active := true;
end;

procedure TfrmShippingSchedule.MenuEdtShippingScheduleClick(
  Sender: TObject);
begin
  inherited;
  TfrmEdtShippingSchedule.EdtFromList(adt_active);
end;

procedure TfrmShippingSchedule.MenuDoneClick(Sender: TObject);
begin
  UpdateStockDone();
end;

procedure TfrmShippingSchedule.MenuNotStockDoneClick(Sender: TObject);
begin
  UpdateStockDone(false);
end;

procedure TfrmShippingSchedule.UpdateStockDone(IsStockDone: Boolean);
var
  COID, warmsg, SD: string;
begin
  if IsStockDone then
  begin
    warmsg := 'Stock Done?';
    SD := '1';
  end
  else
  begin
    warmsg := 'Not Stock Done?';
    SD := '0';
  end;
  if not CheckIfSelectRows(gridData, True, warmsg) then exit;
  COID := GetBatchFieldValueFromGrid(gridData, 'CustomerOrderID');
  slBasicParam.Clear;
  slBasicParam.Append('IsStockDone=' + SD);
  slBasicParam.Append('BatchCustomerOrderID=' + COID);
  slBasicParam.Append('Col=BatchCustomerOrderID');
  objMgrSS.UpdateShippingSchedule(slBasicParam);
  RefreshGrid(gridData, ds_active);
end;

procedure TfrmShippingSchedule.MenuUndoClick(Sender: TObject);
var
  COID: string;
begin
  inherited;
  if not CheckIfSelectRows(gridData, True, 'Undo Schedule?') then exit;
  COID := GetBatchFieldValueFromGrid(gridData, 'CustomerOrderID');
  slBasicParam.Clear;
  slBasicParam.Append('ShippingScheduleStatusID=3');
  slBasicParam.Append('BatchCustomerOrderID=' + COID);
  slBasicParam.Append('Col=BatchCustomerOrderID');
  objMgrSS.UpdateShippingSchedule(slBasicParam);
  RefreshGrid(gridData, ds_active);
end;

procedure TfrmShippingSchedule.MenuBatchEdtShippingScheduleClick(
  Sender: TObject);
var
  COID: string;
begin
  inherited;
  if not CheckIfSelectRows(gridData, True) then exit;
  COID := GetBatchFieldValueFromGrid(gridData, 'CustomerOrderID');
  TfrmBatchEdtShippingSchedule.EdtFromList(COID);
  RefreshGrid(gridData, ds_active);
end;

end.

