unit ufrmTradingOrderForSales1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmDBBasicPrn, PropFilerEh, ActnList, PrnDbgeh, ImgList, DB,
  ADODB, Menus, PropStorageEh, DBCtrls, ComCtrls, ToolWin, GridsEh,
  DBGridEh, PrViewEh, StdCtrls, ExtCtrls, Mask, DBCtrlsEh, DBLookupEh,
  wwdbedit, Wwdbspin, uDMManager, uDMEntity;

type
  TfrmTradingOrderForSales1 = class(TfrmDBBasicPrn)
    adt_activeTradingOrderID: TAutoIncField;
    adt_activeCustomerNumber: TStringField;
    adt_activeCustomerName: TStringField;
    adt_activeModel: TStringField;
    adt_activeModelDescription: TStringField;
    adt_activeInvoiceNumber: TStringField;
    adt_activeCustomerOrderNumber: TStringField;
    adt_activeCustomerOrderQuantity: TFloatField;
    adt_activeCurrency: TStringField;
    adt_activePrice: TBCDField;
    adt_activeTotalAmount: TBCDField;
    adt_activeContractDate: TDateTimeField;
    adt_activeRTD: TDateTimeField;
    adt_activeETD: TDateTimeField;
    adt_activeATD: TDateTimeField;
    adt_activeCustomerPurchaseOrderNumber: TStringField;
    adt_activePlantCode: TStringField;
    adt_activeCustomerOrderStatesName: TStringField;
    adt_activeCommunicatorName: TStringField;
    adt_activeProductFamilyName: TStringField;
    adt_activecustomer_type_name: TStringField;
    adt_activeCountry: TStringField;
    adt_activeRegion: TStringField;
    adt_activeAsiaPOR: TBooleanField;
    adt_activeDemandManagingSalesMonth: TStringField;
    adt_activeDemandManagingDMMMonth: TStringField;
    adt_activeDemandManagingDMMRemark: TStringField;
    Panel2: TPanel;
    btnQuery: TButton;
    dtpETDFrom: TDateTimePicker;
    Label14: TLabel;
    Label19: TLabel;
    dtpETDTo: TDateTimePicker;
    Label20: TLabel;
    chkRTD: TCheckBox;
    chkETD: TCheckBox;
    Label21: TLabel;
    dtpRTDTo: TDateTimePicker;
    dtpRTDFrom: TDateTimePicker;
    chkATD: TCheckBox;
    dtpATDFrom: TDateTimePicker;
    Label22: TLabel;
    Label23: TLabel;
    dtpATDTo: TDateTimePicker;
    chkOrderStatus: TCheckBox;
    chkPlant: TCheckBox;
    dbcbbPlant: TDBLookupComboboxEh;
    chkCustomerCode: TCheckBox;
    chkCustomerName: TCheckBox;
    chkModel: TCheckBox;
    chkModelDesc: TCheckBox;
    chkAsiaPOR: TCheckBox;
    chkProductFamily: TCheckBox;
    chkCurrency: TCheckBox;
    chkCountry: TCheckBox;
    chkRegion: TCheckBox;
    chkSalesMonth: TCheckBox;
    chkDMMMonth: TCheckBox;
    chkDMMRemark: TCheckBox;
    dbcbbModel: TDBLookupComboboxEh;
    dbcbbCounty: TDBLookupComboboxEh;
    dbcbbCustomerCode: TDBLookupComboboxEh;
    dbcbbProductFamily: TDBLookupComboboxEh;
    dbedtDMMMonth: TwwDBSpinEdit;
    dbedtDMMRemark: TDBEditEh;
    adt_plant: TADODataSet;
    ds_plant: TDataSource;
    adt_customer: TADODataSet;
    ds_customer: TDataSource;
    ds_country: TDataSource;
    adt_country: TADODataSet;
    edtRegion: TEdit;
    edtModelDesc: TEdit;
    adt_model: TADODataSet;
    ds_model: TDataSource;
    adt_pf: TADODataSet;
    ds_pf: TDataSource;
    adt_status: TADODataSet;
    ds_status: TDataSource;
    dbedtSalesMonth: TwwDBSpinEdit;
    edtCustomer: TEdit;
    cbbCurrency: TComboBox;
    dbcbbCOStatus: TDBLookupComboboxEh;
    edtAsiaPOR: TEdit;
    procedure btnQueryClick(Sender: TObject);
  private
    { Private declarations }
    slParam: TStringList;
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

uses DataModule, uMJ;

{$R *.dfm}

{ TfrmDBBasicPrn1 }

procedure TfrmTradingOrderForSales1.InitializeForm;
begin
  slParam := TStringList.Create;
  objMgrBasic := TMgrBasicData.Create;
  objMgrTO := TMgrTradingOrder.Create;
  inherited;
end;

procedure TfrmTradingOrderForSales1.DestoryForm;
begin
  inherited;
  slParam.Free;
  objMgrBasic.Free;
  objMgrTO.Free;
end;

procedure TfrmTradingOrderForSales1.SetData;
begin
  objMgrBasic.QueryBasicData(adt_customer, 'Customer');
  objMgrBasic.QueryBasicData(adt_plant, 'Plant');
  objMgrBasic.QueryBasicData(adt_country, 'Country');
  objMgrBasic.QueryBasicData(adt_model, 'Model');
  objMgrBasic.QueryBasicData(adt_pf, 'ProductFamily');
  objMgrBasic.QueryBasicData(adt_status, 'CustomerOrderStates');
  slParam.Clear;
  slParam.Append('CustomerOrderID=0');
  objMgrBasic.QueryBasicDataByParam(adt_active, 'ViewTradingOrderForSales1', 'CustomerOrderID', slParam);
end;

procedure TfrmTradingOrderForSales1.SetUI;
begin
  inherited;
  dtpRTDFrom.DateTime := now;
  dtpRTDTo.DateTime := now;
  dtpETDFrom.DateTime := now;
  dtpETDTo.DateTime := now;
  dtpATDFrom.DateTime := now;
  dtpATDTo.DateTime := now;
end;

procedure TfrmTradingOrderForSales1.SetAccess;
begin
  inherited;

end;

procedure TfrmTradingOrderForSales1.btnQueryClick(Sender: TObject);
var
  slTOParam: TStringList;
begin
  inherited;
  RecoverGrid(gridData, ds_active);
  slTOParam := TStringList.Create;
  try
    slTOParam.Clear;
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
    if chkATD.Checked then
    begin
      slTOParam.Append('ATDFrom=' + FormatDateTime('YYYY-mm-dd', dtpATDFrom.DateTime));
      slTOParam.Append('ATDTo=' + FormatDateTime('YYYY-mm-dd', dtpATDTo.DateTime));
    end;
    if chkCustomerCode.Checked then
    begin
      slTOParam.Append('CustomerID=' + VarToStr(dbcbbCustomerCode.Value));
    end;
    if chkCustomerName.Checked then
    begin
      slTOParam.Append('CustomerName=' + Trim(edtCustomer.Text));
    end;
    if chkPlant.Checked then
    begin
      slTOParam.Append('PlantID=' + VarToStr(dbcbbPlant.Value));
    end;
    if chkCountry.Checked then
    begin
      slTOParam.Append('CountryID=' + VarToStr(dbcbbCounty.Value));
    end;
    if chkRegion.Checked then
    begin
      slTOParam.Append('Region=' + trim(edtRegion.Text));
    end;
    if chkAsiaPOR.Checked then
    begin
      slTOParam.Append('AsiaPOR=' + trim(edtAsiaPOR.Text));
    end;
    if chkCurrency.Checked then
    begin
      slTOParam.Append('Currency=' + Trim(cbbCurrency.Text));
    end;
    if chkModel.Checked then
    begin
      slTOParam.Append('ModelID=' + VarToStr(dbcbbModel.Value));
    end;
    if chkModelDesc.Checked then
    begin
      slTOParam.Append('ModelDescription=' + Trim(edtModelDesc.Text));
    end;
    if chkProductFamily.Checked then
    begin
      slTOParam.Append('ProductFamilyID=' + VarToStr(dbcbbProductFamily.Value));
    end;
    if chkSalesMonth.Checked then
    begin
      slTOParam.Append('SalesMonth=' + VarToStr(dbedtSalesMonth.Value));
    end;
    if chkDMMMonth.Checked then
    begin
      slTOParam.Append('DMMMonth=' + VarToStr(dbedtDMMMonth.Value));
    end;
    if chkDMMRemark.Checked then
    begin
      slTOParam.Append('DMMRemark=' + VarToStr(dbedtDMMRemark.Value));
    end;
    if chkOrderStatus.Checked then
    begin
      slTOParam.Append('CustomerOrderStatesID=' + VarToStr(dbcbbCOStatus.Value));
    end;
    slTOParam.Values['Col'] := 'TradingOrderID';
    objMgrTO.QueryTradingOrderForSales1(adt_active, nil, slTOParam);
  finally
    slTOParam.Free;
  end;
end;

end.

