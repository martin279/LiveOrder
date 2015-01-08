unit ufrmQueryTradingOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmDBBasicDT, PropFilerEh, DB, ADODB, Menus, PropStorageEh,
  ActnList, ImgList, GridsEh, DBGridEh, StdCtrls, ComCtrls, ExtCtrls,
  DBCtrls, ToolWin, Mask, DBCtrlsEh, DBLookupEh, uDMManager, uDMEntity;

type
  TfrmQueryTradingOrder = class(TfrmDBBasicDT)
    Panel2: TPanel;
    Label16: TLabel;
    Label17: TLabel;
    adt_plant: TADODataSet;
    ds_plant: TDataSource;
    ds_logistic: TDataSource;
    adt_logistic: TADODataSet;
    Label9: TLabel;
    Label8: TLabel;
    Label7: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label19: TLabel;
    Label18: TLabel;
    Label15: TLabel;
    Label14: TLabel;
    Label13: TLabel;
    Label12: TLabel;
    Label11: TLabel;
    Label10: TLabel;
    Label1: TLabel;
    dtpRTDTo: TDateTimePicker;
    dtpRTDFrom: TDateTimePicker;
    dtpRCEDSellerOATo: TDateTimePicker;
    dtpRCEDSellerOAFrom: TDateTimePicker;
    dtpEXWHDateTo: TDateTimePicker;
    dtpEXWHDateFrom: TDateTimePicker;
    dtpETDTo: TDateTimePicker;
    dtpETDFrom: TDateTimePicker;
    dtpContractDateTo: TDateTimePicker;
    dtpContractDateFrom: TDateTimePicker;
    dtpATDTo: TDateTimePicker;
    dtpATDFrom: TDateTimePicker;
    dbcbbSalesMonth: TDBLookupComboboxEh;
    dbcbbPlant: TDBLookupComboboxEh;
    dbcbbLogisticStatus: TDBLookupComboboxEh;
    chkSalesMonth: TCheckBox;
    chkRTD: TCheckBox;
    chkRCEDSellerOA: TCheckBox;
    chkPlant: TCheckBox;
    chkOrderStatus: TCheckBox;
    chkFY: TCheckBox;
    chkEXWHDate: TCheckBox;
    chkETD: TCheckBox;
    chkDelivery: TCheckBox;
    chkContractDate: TCheckBox;
    chkATD: TCheckBox;
    cbbFYTo: TComboBox;
    cbbFYFrom: TComboBox;
    cbbFMTo: TComboBox;
    cbbFMFrom: TComboBox;
    cbbDelivery: TComboBox;
    btnQuery: TButton;
    chkOHOrder: TCheckBox;
    chkDemandManagingRCED: TCheckBox;
    Label20: TLabel;
    Label21: TLabel;
    dtpDemandManagingRCEDTo: TDateTimePicker;
    dtpDemandManagingRCEDFrom: TDateTimePicker;
    procedure btnQueryClick(Sender: TObject);
    procedure tbtnOperationClick(Sender: TObject);
    procedure chkDeliveryClick(Sender: TObject);
    procedure chkOrderStatusClick(Sender: TObject);
    procedure chkOHOrderClick(Sender: TObject);
  private
    { Private declarations }
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
  end;

implementation

uses DataModule, uMJ, ufrmDBBasic;

{$R *.dfm}

procedure TfrmQueryTradingOrder.InitializeForm;
begin
  objTO := TTradingOrder.Create;
  objMgrBasic := TMgrBasicData.Create;
  objMgrTO := TMgrTradingOrder.Create;
  inherited;
end;

procedure TfrmQueryTradingOrder.DestoryForm;
begin
  inherited;
  objTO.Free;
  objMgrBasic.Free;
  objMgrTO.Free;
end;

procedure TfrmQueryTradingOrder.SetData;
begin
  DM.DataSetQuery(adt_plant, 'select 3 as PlantID,''8f'' as PlantCode union select 4,''8c''');
  objMgrBasic.QueryBasicData(adt_logistic, 'TradingOrderStatus');
  objTO.TradingOrderID := 0;
  objMgrTO.QueryTradingOrder(adt_active, objTO);
  objMgrBasic.QueryBasicData(adt_active2, 'ViewTradingOrderLog', 'TradingOrderLogID');
end;

procedure TfrmQueryTradingOrder.SetUI;
begin
  inherited;
  dtpRTDFrom.DateTime := now;
  dtpRTDTo.DateTime := now;
  dtpETDFrom.DateTime := now;
  dtpETDTo.DateTime := now;
  dtpATDFrom.DateTime := now;
  dtpATDTo.DateTime := now;
  dtpContractDateFrom.DateTime := now;
  dtpContractDateTo.DateTime := now;
  dtpRCEDSellerOAFrom.DateTime := now;
  dtpRCEDSellerOATo.DateTime := now;
  dtpDemandManagingRCEDFrom.DateTime := now;
  dtpDemandManagingRCEDTo.DateTime := now;
  dtpEXWHDateFrom.DateTime := now;
  dtpEXWHDateTo.DateTime := now;
  GroupBox2.Visible := false;
  gridData.FieldColumns['CustomerOrderQuantity'].Footer.ValueType := fvtSum;
  gridData.FieldColumns['SellerBuyerPOQuantity'].Footer.ValueType := fvtSum;
end;

procedure TfrmQueryTradingOrder.SetAccess;
//var
//  i: integer;
begin
  inherited;
  if gridData.VisibleColCount >= 7 then
    gridData.FrozenCols := 7;
  if (objCurUser.AccessLevel = 1)
    or (objCurUser.AccessLevel = 25)
    or (objCurUser.AccessLevel = 15)
    or (objCurUser.AccessLevel = 26) then
  begin
    gridData.FieldColumns['Price'].Visible := true;
    gridData.FieldColumns['TotalAmount'].Visible := true;
  end
  else
  begin
    gridData.FieldColumns['Price'].Visible := false;
    gridData.FieldColumns['TotalAmount'].Visible := false;
  end;
  if objCurUser.AccessLevel = 2 then
  begin
    gridData.FieldColumns['ModelChineseDescription'].Visible := false;
    gridData.FieldColumns['Forwarder'].Visible := false;
    gridData.FieldColumns['Destination'].Visible := false;
    gridData.FieldColumns['SellerPOToSellerDate'].Visible := false;
    gridData.FieldColumns['SellerPartNo'].Visible := false;
    gridData.FieldColumns['SellerAirFreightPaidBy'].Visible := false;
    gridData.FieldColumns['SellerStockDueToOrderCancel'].Visible := false;
    gridData.FieldColumns['SellerBuyerRemark'].Visible := false;
  {
    for i := 10 to gridData.FieldCount - 1 do
    begin
      gridData.Columns[i].Visible := false;
    end;
    gridData.FieldColumns['SellerBuyerPONumber'].Visible := true;
    gridData.FieldColumns['SellerBuyerPOQuantity'].Visible := true;
    //gridData.FieldColumns['LogisticInImportSheetNo'].Visible := true;
    //gridData.FieldColumns['LogisticInRCED'].Visible := true;
    //gridData.FieldColumns['ThirdPartyWarehouseReceivingDate'].Visible := true;
    gridData.FieldColumns['DemandManagingRCED'].Visible := true;
    gridData.FieldColumns['DemandManagingDMMMonth'].Visible := true;     }
  end;
end;

procedure TfrmQueryTradingOrder.tbtnOperationClick(Sender: TObject);
begin
  //inherited;
  GroupBox2.Visible := not GroupBox2.Visible;
  Splitter1.Align := alTop;
  Splitter1.Align := alBottom;
end;

procedure TfrmQueryTradingOrder.chkDeliveryClick(Sender: TObject);
begin
  inherited;
  if chkDelivery.Checked then
    chkOrderStatus.Checked := false;
end;

procedure TfrmQueryTradingOrder.chkOrderStatusClick(Sender: TObject);
begin
  inherited;
  if chkOrderStatus.Checked then
    chkDelivery.Checked := false;
end;

procedure TfrmQueryTradingOrder.chkOHOrderClick(Sender: TObject);
begin
  inherited;
  if chkOHOrder.Checked then
    chkDemandManagingRCED.Checked := true;
end;

procedure TfrmQueryTradingOrder.btnQueryClick(Sender: TObject);
var
  slTOParam: TStringList;
  adt3: TADODataSet;
begin
  inherited;
  RecoverGrid(gridData, ds_active);
  slTOParam := TStringList.Create;
  try
    slTOParam.Clear;
    if chkOrderStatus.Checked then
    begin
      if VarToStr(dbcbbLogisticStatus.Value) = '' then
      begin
        ShowMessage('Please select trading order status.');
        Exit;
      end;
      slTOParam.Append('TradingOrderStatusID=' + IntToStr(dbcbbLogisticStatus.Value));
    end;
    if chkFY.Checked then
    begin
      adt3 := TADODataSet.Create(nil);
      try
        DM.DataSetQuery3(adt3, 'select min(ActualDate) as ActualDate from FiscalCalendar where FiscalYear='
          + cbbFYFrom.Text + ' and FiscalMonth=' + cbbFMFrom.Text);
        slTOParam.Append('FYFrom=' + adt3.fieldbyname('ActualDate').AsString);
        DM.DataSetQuery3(adt3, 'select max(ActualDate) as ActualDate from FiscalCalendar where FiscalYear='
          + cbbFYTo.Text + ' and FiscalMonth=' + cbbFMTo.Text);
        slTOParam.Append('FYTo=' + adt3.fieldbyname('ActualDate').AsString);
      finally
        adt3.Free;
      end;
    end;
    if chkPlant.Checked then
    begin
      if VarToStr(dbcbbPlant.Value) = '' then
      begin
        ShowMessage('Please select plant.');
        Exit;
      end;
      slTOParam.Append('PlantID=' + VarToStr(dbcbbPlant.Value));
    end;

    if chkATD.Checked then
    begin
      slTOParam.Append('ATDFrom=' + FormatDateTime('YYYY-mm-dd', dtpATDFrom.DateTime));
      slTOParam.Append('ATDTo=' + FormatDateTime('YYYY-mm-dd', dtpATDTo.DateTime));
    end;
    if chkRTD.Checked then
    begin
      slTOParam.Append('RTDFrom=' + FormatDateTime('YYYY-mm-dd', dtpRTDFrom.DateTime));
      slTOParam.Append('RTDTo=' + FormatDateTime('YYYY-mm-dd', dtpRTDTo.DateTime));
    end;
    if chkETD.Checked then
    begin
      slTOParam.Append('ETDFrom=' + FormatDateTime('YYYY-mm-dd', dtpETDFrom.DateTime));
      slTOParam.Append('ETDTo=' + FormatDateTime('YYYY-mm-dd', dtpETDTo.DateTime));
    end;
    if chkContractDate.Checked then
    begin
      slTOParam.Append('ContractDateFrom=' + FormatDateTime('YYYY-mm-dd', dtpContractDateFrom.DateTime));
      slTOParam.Append('ContractDateTo=' + FormatDateTime('YYYY-mm-dd', dtpContractDateTo.DateTime));
    end;
    if chkRCEDSellerOA.Checked then
    begin
      slTOParam.Append('SellerRCEDFrom=' + FormatDateTime('YYYY-mm-dd', dtpRCEDSellerOAFrom.DateTime));
      slTOParam.Append('SellerRCEDTo=' + FormatDateTime('YYYY-mm-dd', dtpRCEDSellerOATo.DateTime));
    end;
    if chkEXWHDate.Checked then
    begin
      slTOParam.Append('SellerExFactoryDateFrom=' + FormatDateTime('YYYY-mm-dd', dtpEXWHDateFrom.DateTime));
      slTOParam.Append('SellerExFactoryDateTo=' + FormatDateTime('YYYY-mm-dd', dtpEXWHDateTo.DateTime));
    end;
    if chkDemandManagingRCED.Checked then
    begin
      slTOParam.Append('DemandManagingRCEDFrom=' + FormatDateTime('YYYY-mm-dd', dtpDemandManagingRCEDFrom.DateTime));
      slTOParam.Append('DemandManagingRCEDTo=' + FormatDateTime('YYYY-mm-dd', dtpDemandManagingRCEDTo.DateTime));
    end;
    if chkOHOrder.Checked then
      slTOParam.Append('OHOrder=1');
    if chkDelivery.Checked then
    begin
      if cbbDelivery.ItemIndex = 0 then
        slTOParam.Append('TradingOrderStatusID=7');
      if cbbDelivery.ItemIndex = 1 then
        slTOParam.Append('TradingOrderStatusID=1,2,3,4,5,6');
    end;
    objMgrTO.QueryTradingOrder(adt_active, nil, slTOParam);
  finally
    slTOParam.Free;
  end;
end;

end.

