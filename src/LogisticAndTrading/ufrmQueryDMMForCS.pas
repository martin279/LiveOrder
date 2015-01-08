unit ufrmQueryDMMForCS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmDBBasicPrn, PropFilerEh, ActnList, PrnDbgeh, ImgList, DB,
  ADODB, Menus, PropStorageEh, DBCtrls, ComCtrls, ToolWin, GridsEh,
  DBGridEh, PrViewEh, StdCtrls, ExtCtrls, DBCtrlsEh, wwdbedit, Wwdbspin,
  Mask, DBLookupEh, uDMManager, uDMEntity;

type
  TfrmQueryDMMForCS = class(TfrmDBBasicPrn)
    Panel2: TPanel;
    btnQuery: TButton;
    chkOrderStatus: TCheckBox;
    chkPlant: TCheckBox;
    dbcbbPlant: TDBLookupComboboxEh;
    chkCustomerCode: TCheckBox;
    chkCustomerName: TCheckBox;
    chkModel: TCheckBox;
    chkCurrency: TCheckBox;
    chkCountry: TCheckBox;
    chkImportSheetNum: TCheckBox;
    chkDMMStatus: TCheckBox;
    dbcbbModel: TDBLookupComboboxEh;
    dbcbbCounty: TDBLookupComboboxEh;
    dbcbbCustomerCode: TDBLookupComboboxEh;
    edtCustomer: TEdit;
    adt_customer: TADODataSet;
    ds_customer: TDataSource;
    ds_country: TDataSource;
    adt_country: TADODataSet;
    ds_model: TDataSource;
    adt_model: TADODataSet;
    adt_plant: TADODataSet;
    ds_plant: TDataSource;
    chkCommunicator: TCheckBox;
    dbcbbCommunicator: TDBLookupComboboxEh;
    adt_communicator: TADODataSet;
    adt_communicatorCommunicatorID: TAutoIncField;
    adt_communicatorCommunicatorCode: TStringField;
    adt_communicatorCommunicatorPhone: TStringField;
    adt_communicatorCommunicatorFax: TStringField;
    adt_communicatorCommunicatorMail: TStringField;
    adt_communicatorLoginID: TIntegerField;
    adt_communicatorDisplayName: TStringField;
    ds_communicator: TDataSource;
    chkContractDate: TCheckBox;
    Label7: TLabel;
    dtpContractDateFrom: TDateTimePicker;
    dtpContractDateTo: TDateTimePicker;
    Label8: TLabel;
    edtImportSheetNum: TEdit;
    cbbDMMStatus: TComboBox;
    cbbCurrency: TComboBox;
    cbbOrderStates: TComboBox;
    chkCustomerPONum: TCheckBox;
    edtCustomerPONum: TEdit;
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

uses DataModule;

{$R *.dfm}

{ TfrmTradingOrderForCS1 }

procedure TfrmQueryDMMForCS.InitializeForm;
begin
  slParam := TStringList.Create;
  objMgrBasic := TMgrBasicData.Create;
  objMgrTO := TMgrTradingOrder.Create;
  inherited;
end;

procedure TfrmQueryDMMForCS.DestoryForm;
begin
  inherited;
  slParam.Free;
  objMgrBasic.Free;
  objMgrTO.Free;
end;

procedure TfrmQueryDMMForCS.SetData;
begin
  objMgrBasic.QueryBasicData(adt_customer, 'Customer');
  objMgrBasic.QueryBasicData(adt_plant, 'Plant');
  objMgrBasic.QueryBasicData(adt_country, 'Country');
  objMgrBasic.QueryBasicData(adt_model, 'Model');
//  objMgrBasic.QueryBasicData(adt_status, 'CustomerOrderStates');
  objMgrBasic.QueryBasicData(adt_communicator, 'ViewCommunicator', 'CommunicatorID');
  slParam.Clear;
  slParam.Append('CustomerOrderID=0');
  objMgrBasic.QueryBasicDataByParam(adt_active, 'ViewTradingOrderForCS1', 'CustomerOrderID', slParam);
end;

procedure TfrmQueryDMMForCS.SetUI;
begin
  inherited;
  dtpContractDateFrom.DateTime := now;
  dtpContractDateTo.DateTime := now;
end;

procedure TfrmQueryDMMForCS.SetAccess;
begin
  inherited;

end;

procedure TfrmQueryDMMForCS.btnQueryClick(Sender: TObject);
var
  slTOParam: TStringList;
begin
  inherited;
  RecoverGrid(gridData, ds_active);
  slTOParam := TStringList.Create;
  try
    slTOParam.Clear;
    if chkContractDate.Checked then
    begin
      slTOParam.Append('ContractDateFrom=' + FormatDateTime('YYYY-mm-dd', dtpContractDateFrom.DateTime));
      slTOParam.Append('ContractDateTo=' + FormatDateTime('YYYY-mm-dd', dtpContractDateTo.DateTime));
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
    if chkCurrency.Checked then
    begin
      slTOParam.Append('Currency=' + Trim(cbbCurrency.Text));
    end;
    if chkModel.Checked then
    begin
      slTOParam.Append('ModelID=' + VarToStr(dbcbbModel.Value));
    end;
    if chkImportSheetNum.Checked then
    begin
      slTOParam.Append('ImportSheetNumber=' + Trim(edtImportSheetNum.Text));
    end;
    if chkOrderStatus.Checked then
    begin
      if cbbOrderStates.ItemIndex = 0 then
        slTOParam.Append('CustomerOrderStatesID=6')
      else if cbbOrderStates.ItemIndex = 1 then
        slTOParam.Append('CustomerOrderStatesID=1,2,3,4,5')
      else if cbbOrderStates.ItemIndex = 2 then
        slTOParam.Append('CustomerOrderStatesID=7')
      else if cbbOrderStates.ItemIndex = 3 then
        slTOParam.Append('CustomerOrderStatesID=1')
      else if cbbOrderStates.ItemIndex = 4 then
        slTOParam.Append('CustomerOrderStatesID=2')
      else if cbbOrderStates.ItemIndex = 5 then
        slTOParam.Append('CustomerOrderStatesID=3')
      else if cbbOrderStates.ItemIndex = 6 then
        slTOParam.Append('CustomerOrderStatesID=4')
      else if cbbOrderStates.ItemIndex = 7 then
        slTOParam.Append('CustomerOrderStatesID=5');
    end;
    if chkDMMStatus.Checked then
    begin
      slTOParam.Append('DMMStatus=' + IntToStr(cbbDMMStatus.ItemIndex));
    end;     
    if chkCustomerPONum.Checked then
    begin
      slTOParam.Append('CustomerPurchaseOrderNumber=' + Trim(edtCustomerPONum.Text));
    end;
    if objCurUser.AccessLevel = 2 then
    begin
      slTOParam.Values['Roles'] := 'communicator';
      slTOParam.Values['LoginID'] := VarToStr(dbcbbCommunicator.Value);
    end;
    slTOParam.Values['Col'] := 'TradingOrderID';
    objMgrTO.QueryTradingOrderForCS1(adt_active, nil, slTOParam);
  finally
    slTOParam.Free;
  end;
end;

end.

