unit ufrmTradingOrderForCS1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmDBBasicPrn, PropFilerEh, ActnList, PrnDbgeh, ImgList, DB,
  ADODB, Menus, PropStorageEh, DBCtrls, ComCtrls, ToolWin, GridsEh,
  DBGridEh, PrViewEh, StdCtrls, ExtCtrls, DBCtrlsEh, wwdbedit, Wwdbspin,
  Mask, DBLookupEh, uDMManager, uDMEntity;

type
  TfrmTradingOrderForCS1 = class(TfrmDBBasicPrn)
    Panel2: TPanel;
    Label14: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    btnQuery: TButton;
    dtpETDFrom: TDateTimePicker;
    dtpETDTo: TDateTimePicker;
    chkRTD: TCheckBox;
    chkETD: TCheckBox;
    dtpRTDTo: TDateTimePicker;
    dtpRTDFrom: TDateTimePicker;
    chkATD: TCheckBox;
    dtpATDFrom: TDateTimePicker;
    dtpATDTo: TDateTimePicker;
    chkOrderStatus: TCheckBox;
    chkPlant: TCheckBox;
    dbcbbPlant: TDBLookupComboboxEh;
    chkCustomerCode: TCheckBox;
    chkCustomerName: TCheckBox;
    chkModel: TCheckBox;
    chkModelDesc: TCheckBox;
    chkCurrency: TCheckBox;
    chkCountry: TCheckBox;
    chkSalesMonth: TCheckBox;
    chkDMMMonth: TCheckBox;
    dbcbbModel: TDBLookupComboboxEh;
    dbcbbCounty: TDBLookupComboboxEh;
    dbcbbCustomerCode: TDBLookupComboboxEh;
    dbedtDMMMonth: TwwDBSpinEdit;
    edtModelDesc: TEdit;
    dbedtSalesMonth: TwwDBSpinEdit;
    edtCustomer: TEdit;
    cbbCurrency: TComboBox;
    dbcbbCOStatus: TDBLookupComboboxEh;
    adt_customer: TADODataSet;
    ds_customer: TDataSource;
    ds_country: TDataSource;
    adt_country: TADODataSet;
    ds_model: TDataSource;
    adt_model: TADODataSet;
    adt_plant: TADODataSet;
    ds_plant: TDataSource;
    adt_status: TADODataSet;
    ds_status: TDataSource;
    chkDeliveryStatus: TCheckBox;
    dbcbbDeliveryStatus: TDBLookupComboboxEh;
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

procedure TfrmTradingOrderForCS1.InitializeForm;
begin
  slParam := TStringList.Create;
  objMgrBasic := TMgrBasicData.Create;
  objMgrTO := TMgrTradingOrder.Create;
  inherited;
end;
 
procedure TfrmTradingOrderForCS1.DestoryForm;
begin
  inherited;
  slParam.Free;
  objMgrBasic.Free;
  objMgrTO.Free;
end;

procedure TfrmTradingOrderForCS1.SetData;
begin
  objMgrBasic.QueryBasicData(adt_customer, 'Customer');
  objMgrBasic.QueryBasicData(adt_plant, 'Plant');
  objMgrBasic.QueryBasicData(adt_country, 'Country');
  objMgrBasic.QueryBasicData(adt_model, 'Model');
  objMgrBasic.QueryBasicData(adt_status, 'CustomerOrderStates');
  slParam.Clear;
  slParam.Append('CustomerOrderID=0');
  objMgrBasic.QueryBasicDataByParam(adt_active, 'ViewTradingOrderForCS1', 'CustomerOrderID', slParam);
end;

procedure TfrmTradingOrderForCS1.SetUI;
begin
  inherited;
  dtpRTDFrom.DateTime := now;
  dtpRTDTo.DateTime := now;
  dtpETDFrom.DateTime := now;
  dtpETDTo.DateTime := now;
  dtpATDFrom.DateTime := now;
  dtpATDTo.DateTime := now;
end;
 
procedure TfrmTradingOrderForCS1.SetAccess;
begin
  inherited;

end;

end.
