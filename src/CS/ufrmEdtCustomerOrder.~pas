unit ufrmEdtCustomerOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmBasic, ActnList, ImgList, ComCtrls, ToolWin, ExtCtrls,
  DBGridEh, DB, ADODB, StdCtrls, Mask, DBCtrlsEh, DBLookupEh, DBCtrls,
  Buttons, GridsEh, PropFilerEh, PropStorageEh, uDMEntity, uDMManager,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TfrmEdtCustomerOrder = class(TfrmBasic)
    adt_model: TADODataSet;
    ds_model: TDataSource;
    ds_customer: TDataSource;
    adt_customer: TADODataSet;
    ds_delay: TDataSource;
    adt_delay: TADODataSet;
    ds_active: TDataSource;
    Panel1: TPanel;
    Label14: TLabel;
    dbedtCustomerOrderID: TDBEditEh;
    Label10: TLabel;
    gboxCOBasicInfor: TGroupBox;
    Label4: TLabel;
    LabelPrice: TLabel;
    Label7: TLabel;
    Label6: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    dbcbbModel: TDBLookupComboboxEh;
    dbcbbCustomer: TDBLookupComboboxEh;
    dbedtOrderQty: TDBEditEh;
    dbedtPrice: TDBEditEh;
    edtModelDesc: TEdit;
    edtCustomerName: TEdit;
    gboxCOInfor: TGroupBox;
    Label13: TLabel;
    Label11: TLabel;
    Label16: TLabel;
    dbdtpRTD: TDBDateTimeEditEh;
    dbedtCustomerPONo: TDBEditEh;
    dbedtRemark: TDBEditEh;
    gboxCOConfirm: TGroupBox;
    Label1: TLabel;
    Label9: TLabel;
    dbcbbDelay: TDBLookupComboboxEh;
    dbdtpETD: TDBDateTimeEditEh;
    chkDelay: TCheckBox;
    gboxCONumber: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label8: TLabel;
    dbedtInvoiceNumber: TDBEditEh;
    dbedtMNumber: TDBEditEh;
    dbedtOrderNumber: TDBEditEh;
    gboxCORelease: TGroupBox;
    gboxBOM: TGroupBox;
    gridBOM: TDBGridEh;
    ds_bom: TDataSource;
    adt_bom: TADODataSet;
    adt_bomModelID: TIntegerField;
    adt_bomComponentID: TIntegerField;
    adt_bomModel: TStringField;
    adt_bomComponentItem: TStringField;
    adt_bomComponentQuantity: TFloatField;
    adt_bomValidFrom: TDateTimeField;
    adt_bomValidUntil: TDateTimeField;
    adt_bomComponentDescription: TStringField;
    PropStorageEh1: TPropStorageEh;
    Label12: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    dbtxtOINQQty: TDBText;
    dbtxtOINQReleaseQty: TDBText;
    dbedtActualReleaseCOQty: TDBEditEh;
    dbcbbCurrency: TDBComboBoxEh;
    gboxPayment: TGroupBox;
    dbedtPayment: TDBEditEh;
    Label5: TLabel;
    adt_bomComponentSeriesName: TStringField;
    gboxShip: TGroupBox;
    Label20: TLabel;
    dbdtpATD: TDBDateTimeEditEh;
    Label21: TLabel;
    dbdtpContractDate: TDBDateTimeEditEh;
    gboxCOChangeLog: TGroupBox;
    gridLog: TDBGridEh;
    adt_Log: TADODataSet;
    ds_Log: TDataSource;
    adt_LogCustomerOrderChangeLogID: TAutoIncField;
    adt_LogCustomerOrderID: TIntegerField;
    adt_LogCustomerOrderQuantity: TFloatField;
    adt_LogRTD: TDateTimeField;
    adt_LogETD: TDateTimeField;
    adt_LogChangeField: TStringField;
    adt_LogChangeTime: TDateTimeField;
    LabelTotalAmount: TLabel;
    dbedtTotalAmount: TDBEditEh;
    dbcbbPlant: TDBLookupComboboxEh;
    Label23: TLabel;
    dbcbbBusinessApplication: TDBLookupComboboxEh;
    ds_business: TDataSource;
    adt_business: TADODataSet;
    ds_plant: TDataSource;
    adt_plant: TADODataSet;
    LabelBusinessApplication: TLabel;
    Label22: TLabel;
    dbedtDelayRemark: TDBEditEh;
    Label24: TLabel;
    dbedtCreator: TDBEditEh;
    adt_LogChangeBy: TIntegerField;
    gboxFreight: TGroupBox;
    Label25: TLabel;
    Label26: TLabel;
    dbedtFreight: TDBEditEh;
    dbedtDestination: TDBEditEh;
    gboxATA: TGroupBox;
    Label27: TLabel;
    Label28: TLabel;
    dbdtpETA: TDBDateTimeEditEh;
    dbdtpATA: TDBDateTimeEditEh;
    dbcbbLoginID: TDBLookupComboboxEh;
    ds_login: TDataSource;
    adt_login: TADODataSet;
    GroupBox3: TGroupBox;
    dbedtInstruction: TDBEditEh;
    Label30: TLabel;
    dbcbbForwarder: TDBLookupComboboxEh;
    adt_forwarder: TADODataSet;
    ds_forwarder: TDataSource;
    adt_forwarderForwarderID: TAutoIncField;
    adt_forwarderForwarderName: TStringField;
    dbcbbOrderStates: TDBLookupComboboxEh;
    ds_states: TDataSource;
    adt_states: TADODataSet;
    adt_statesCustomerOrderStatesID: TAutoIncField;
    adt_statesCustomerOrderStatesName: TStringField;
    adt_statesCustomerOrderStatesDesc: TStringField;
    adt_statesOverseaCustomerOrderStatesName: TStringField;
    sbtnAddDelay: TSpeedButton;
    Panel2: TPanel;
    DBNavigator1: TDBNavigator;
    Label29: TLabel;
    DBEditEh1: TDBEditEh;
    dbchkBonded: TDBCheckBoxEh;
    Button1: TButton;
    IdHTTP1: TIdHTTP;
    procedure dbedtOrderQtyKeyPress(Sender: TObject; var Key: Char);
//    procedure chkRTDClick(Sender: TObject);
    procedure chkDelayClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure adt_fromBeforePost(DataSet: TDataSet);
    procedure adt_fromAfterPost(DataSet: TDataSet);
    procedure adt_fromBeforeCancel(DataSet: TDataSet);
    procedure adt_customerAfterScroll(DataSet: TDataSet);
    procedure adt_modelAfterScroll(DataSet: TDataSet);
//    procedure btnSaveCOReleaseClick(Sender: TObject);
    procedure dbedtCustomerOrderIDChange(Sender: TObject);
    procedure dbedtOrderQtyExit(Sender: TObject);
    procedure dbedtPriceExit(Sender: TObject);
    procedure dbcbbDelayChange(Sender: TObject);
    procedure sbtnAddDelayClick(Sender: TObject);
    procedure dbcbbModelExit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure dbdtpRTDExit(Sender: TObject);
    procedure dbdtpETDChange(Sender: TObject);
  private
    { Private declarations }
    objMgrBasic: TMgrBasicData;
    procedure checkPrice;
    procedure SendMail();
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

var
  etdDelay, rtdDelay: Boolean;
  originalETD: TDateTime;

implementation

uses DataModule, uMJ, ufrmReasonOfDelay;

{$R *.dfm}

{ TfrmEdtCustomerOrder }

procedure TfrmEdtCustomerOrder.InitializeForm;
begin
  objMgrBasic := TMgrBasicData.Create;
  inherited;
end;

procedure TfrmEdtCustomerOrder.DestoryForm;
begin
  inherited;
  objMgrBasic.Free;
end;

procedure TfrmEdtCustomerOrder.SetData;
var
  slBasic: TStringList;
begin
  slBasic := TStringList.Create;
  try
    slBasic.Append('LoginID=' + IntToStr(objCurUser.LoginID));
    objMgrBasic.QueryBasicDataByParam(adt_plant, 'ViewLoginPlant', 'PlantID', slBasic);
    objMgrBasic.QueryBasicDataByParam(adt_business, 'ViewLoginBusinessApplication', 'BusinessApplicationID', slBasic);
    objMgrBasic.QueryBasicData(adt_customer, 'Customer');
    objMgrBasic.QueryBasicData(adt_model, 'Model');
    if objCurUser.AccessLevel = 2 then
      DM.DataSetQuery(adt_delay, 'select * from ReasonOfDelay where ReasonOfDelayID in (15,16,17,20,21,22,23)')
    else if objCurUser.AccessLevel = 3 then
      DM.DataSetQuery(adt_delay, 'select * from ReasonOfDelay where left(ReasonOfDelayDesc,8)<>''Customer''')
    else
      objMgrBasic.QueryBasicData(adt_delay, 'ReasonOfDelay');
    objMgrBasic.QueryBasicData(adt_forwarder, 'Forwarder');
    objMgrBasic.QueryBasicData(adt_states, 'CustomerOrderStates');
  finally
    slBasic.Free;
  end;
end;

procedure TfrmEdtCustomerOrder.SetUI;
begin
  inherited;
  Position := poOwnerFormCenter;
end;

procedure TfrmEdtCustomerOrder.SetAccess;
begin
  inherited;
  gboxCOBasicInfor.Enabled := false;
  gboxCOInfor.Enabled := false;
  gboxCOConfirm.Enabled := false;
  gboxCONumber.Enabled := false;
  gboxPayment.Enabled := false;
  gboxShip.Enabled := false;
  gboxCORelease.Enabled := false;
  gboxATA.Enabled := false;
  gboxFreight.Enabled := false;

  dbcbbCurrency.Enabled := false;
  dbedtPrice.Enabled := false;
  dbedtTotalAmount.Enabled := false;
  edtCustomerName.Enabled := false;
  edtModelDesc.Enabled := false;
  gridBOM.ReadOnly := true;
  gridBOM.ParentColor := true;
  gridLog.ReadOnly := true;
  gridLog.ParentColor := true;
  edtCustomerName.ParentColor := true;
  edtModelDesc.ParentColor := true;
  dbcbbLoginID.Enabled := false;
  dbcbbOrderStates.Enabled := false;

  dbedtFreight.Enabled := false;
  dbedtDestination.Enabled := false;
  dbedtInstruction.Enabled := false;
  DBNavigator1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast]
    + [nbPost, nbCancel];

  case objCurUser.AccessLevel of
    1:
      begin
        gboxCOBasicInfor.Enabled := true;
        gboxCOInfor.Enabled := true;
        gboxCOConfirm.Enabled := true;
        gboxCORelease.Enabled := true;
        gboxCONumber.Enabled := true;
        gboxPayment.Enabled := true;
        gboxShip.Enabled := true;
        dbcbbOrderStates.Enabled := true;
        gboxFreight.Enabled := true;
        dbedtDestination.Enabled := true;
        dbedtInstruction.Enabled := true;
      end;
    2: //CS
      begin
        gboxCOBasicInfor.Enabled := true;
        gboxCOInfor.Enabled := true;
        gboxCORelease.Enabled := true;
        gboxCONumber.Enabled := true;
        gboxPayment.Enabled := true;
        gboxShip.Enabled := true;
        gboxCOConfirm.Enabled := true;
        gboxATA.Enabled := true;
        gboxFreight.Enabled := true;

        dbedtFreight.Enabled := true;
        dbedtDestination.Enabled := true;
        dbedtInstruction.Enabled := true;
        dbcbbLoginID.Enabled := true;
        dbcbbOrderStates.Enabled := true;
        dbcbbCurrency.Enabled := true;
      end;
    3: //scheduler
      begin
        LabelPrice.Visible := false;
        dbcbbCurrency.Visible := false;
        dbedtPrice.Visible := false;
        LabelTotalAmount.Visible := false;
        dbedtTotalAmount.Visible := false;
        gboxCOConfirm.Enabled := true;
        dbedtDelayRemark.Enabled := false;
        dbedtDelayRemark.Color := clBtnFace;
        dbchkBonded.Enabled := true;
        if objCurUser.LoginID = 56 then
        begin
          dbdtpETD.Enabled := true;
        end;
        if objCurUser.LoginID = 59 then
        begin
          gboxCOInfor.Enabled := true;
          dbdtpRTD.Enabled := false;
          dbedtCustomerPONo.Enabled := false;
          dbedtRemark.Enabled := true;
        end;
      end;
    4: //planner
      begin
        LabelPrice.Visible := false;
        dbcbbCurrency.Visible := false;
        dbedtPrice.Visible := false;
        LabelTotalAmount.Visible := false;
        dbedtTotalAmount.Visible := false;
        gboxCOConfirm.Enabled := true;
        dbdtpETD.Enabled := false;
        dbdtpETD.Color := clBtnFace;
        dbedtDelayRemark.Enabled := false;
        dbedtDelayRemark.Color := clBtnFace;
       { if (ds_active.DataSet.fieldbyname('CustomerOrderStatesID').AsInteger = 6)
          or (ds_active.DataSet.fieldbyname('CustomerOrderStatesID').AsInteger = 7) then
          gboxCOConfirm.Enabled := false;   }
      end;
    6: //logistic
      begin
        gboxATA.Enabled := true;
        dbdtpETA.Enabled := false;
      end;
  end;
  dbcbbCustomer.ParentColor := not gboxCOBasicInfor.Enabled;
  dbcbbModel.ParentColor := not gboxCOBasicInfor.Enabled;
  dbedtOrderQty.ParentColor := not gboxCOBasicInfor.Enabled;
  dbcbbCurrency.ParentColor := not gboxCOBasicInfor.Enabled;
  dbedtPrice.ParentColor := not gboxCOBasicInfor.Enabled;
  dbedtTotalAmount.ParentColor := not gboxCOBasicInfor.Enabled;
  dbcbbPlant.ParentColor := not gboxCOBasicInfor.Enabled;
  dbcbbBusinessApplication.ParentColor := not gboxCOBasicInfor.Enabled;

  dbdtpRTD.ParentColor := not gboxCOInfor.Enabled;
  dbedtCustomerPONo.ParentColor := not gboxCOInfor.Enabled;
  dbedtRemark.ParentColor := not gboxCOInfor.Enabled;

  dbdtpETD.ParentColor := not gboxCOConfirm.Enabled;
  dbcbbDelay.ParentColor := not gboxCOConfirm.Enabled;
  dbedtDelayRemark.ParentColor := not gboxCOConfirm.Enabled;
  chkDelay.ParentColor := not gboxCOConfirm.Enabled;

  dbedtInvoiceNumber.ParentColor := not gboxCONumber.Enabled;
  dbedtMNumber.ParentColor := not gboxCONumber.Enabled;
  dbedtOrderNumber.ParentColor := not gboxCONumber.Enabled;

  dbedtPayment.ParentColor := not gboxPayment.Enabled;
  dbdtpATD.ParentColor := not gboxShip.Enabled;
  dbedtActualReleaseCOQty.ParentColor := not gboxCORelease.Enabled;
  gridBOM.ParentColor := not gboxBOM.Enabled;

  dbdtpETA.ParentColor := not gboxATA.Enabled;
  dbdtpATA.ParentColor := not gboxATA.Enabled;
end;

class procedure TfrmEdtCustomerOrder.EdtFromList(adt_from: TADODataSet);
begin
  with TfrmEdtCustomerOrder.Create(Application) do
  try
    if adt_from.RecordCount = 0 then exit;
    if not adt_from.Active then
      adt_from.Active := true;
    if ds_active.DataSet = nil then
      ds_active.DataSet := adt_from;
    edtModelDesc.Text := adt_from.fieldbyname('ModelDescription').AsString;
    gboxBOM.Caption := 'BOM Of Model : ' + dbcbbModel.Text;
    gboxCOChangeLog.Caption := 'Change Log Of Order ID : ' + dbedtCustomerOrderID.Text;
    chkDelay.OnClick := nil;
    if adt_from.fieldbyname('ReasonOfDelayID').AsString <> '' then
      chkDelay.Checked := true;
    chkDelay.OnClick := chkDelayClick;
    rtdDelay := false;
    etdDelay := false;

    adt_from.BeforePost := adt_fromBeforePost;
    adt_from.BeforeCancel := adt_fromBeforeCancel;
    adt_from.AfterPost := adt_fromAfterPost;
    adt_customer.AfterScroll := adt_customerAfterScroll;
    adt_model.AfterScroll := adt_modelAfterScroll;

    if (adt_from.State in [dsEdit]) then
      adt_from.Cancel;

    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmEdtCustomerOrder.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if (dbdtpRTD.DataSource.DataSet.State in [dsEdit]) then
  begin
    if MessageDlg('Is update Order?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      ds_active.DataSet.Post
    else
      ds_active.DataSet.Cancel;
  end;
end;

procedure TfrmEdtCustomerOrder.dbedtOrderQtyKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = #13) then
  begin
    checkPrice;
  end;
end;

procedure TfrmEdtCustomerOrder.dbedtOrderQtyExit(Sender: TObject);
begin
  checkPrice;
end;

procedure TfrmEdtCustomerOrder.dbedtPriceExit(Sender: TObject);
begin
  dbedtTotalAmount.Text := FloatToStr(StrToInt(dbedtOrderQty.Text) * StrToFloat(dbedtPrice.Text));
end;

procedure TfrmEdtCustomerOrder.checkPrice;
var
  adt_price: TADODataSet;
begin
  if dbcbbCustomer.Text = '' then
  begin
    ShowMessage('Please select customer');
    exit;
  end;
  if dbcbbModel.Text = '' then
  begin
    ShowMessage('Please select model');
    exit;
  end;
  if trim(dbedtOrderQty.Text) = '' then
  begin
    ShowMessage('Please input order qty.');
    exit;
  end;

  adt_price := TADODataSet.Create(nil);
  try
    DM.DataSetQuery(adt_price, 'EXEC usp_GetPrice '
      + ' @CustomerID=' + VarToStr(dbcbbCustomer.KeyValue)
      + ',@ModelID=' + VarToStr(dbcbbModel.KeyValue)
      + ',@DemandQuantity=' + Trim(dbedtOrderQty.Text)
      + ',@GetMaxPrice=1');
    if adt_price.RecordCount > 0 then
    begin
      adt_price.First;
      dbcbbCurrency.ItemIndex := dbcbbCurrency.Items.IndexOf(adt_price.fieldbyname('Currency').AsString);
      if (Trim(dbedtPrice.Text) = '') then
        dbedtPrice.Text := adt_price.fieldbyname('Price').AsString
      else if (Trim(dbedtPrice.Text) <> adt_price.fieldbyname('Price').AsString) then
      begin
        if MessageDlg('Price is different from price list, is update price here?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
          dbedtPrice.Text := adt_price.fieldbyname('Price').AsString;
      end;
    end;
{    else
      dbedtPrice.Text := '0';  }
    dbcbbCurrency.Enabled := true;
    dbedtPrice.Enabled := true;
    dbcbbCurrency.SetFocus;
  finally
    dbedtTotalAmount.Text := FloatToStr(StrToInt(dbedtOrderQty.Text) * StrToFloat(dbedtPrice.Text));
    adt_price.Free;
  end;
end;

procedure TfrmEdtCustomerOrder.sbtnAddDelayClick(Sender: TObject);
begin
  with TfrmReasonOfDelay.Create(Application) do
  try
    ShowModal;
  finally
    Free;
    adt_delay.Active := false;
    adt_delay.Active := true;
  end;
end;

procedure TfrmEdtCustomerOrder.chkDelayClick(Sender: TObject);
begin
  if chkDelay.Checked then
  begin
    if dbcbbDelay.Value <> null then
    begin
      dbedtDelayRemark.Enabled := true;
      dbedtDelayRemark.Color := clWindow;
    end;
    if not (dbcbbDelay.DataSource.DataSet.State in [dsEdit]) then
      dbcbbDelay.DataSource.DataSet.Edit;
    if dbcbbDelay.DataSource.DataSet.FieldByName('ReasonOfDelayID').OldValue = null then
      dbcbbDelay.DataSource.DataSet.FieldByName('ReasonOfDelayID').Value := dbcbbDelay.KeyValue
    else
    begin
      dbcbbDelay.DataSource.DataSet.FieldByName('ReasonOfDelayID').Value :=
        dbcbbDelay.DataSource.DataSet.FieldByName('ReasonOfDelayID').OldValue;
      dbcbbDelay.DataSource.DataSet.FieldByName('ReasonOfDelayRemark').Value :=
        dbcbbDelay.DataSource.DataSet.FieldByName('ReasonOfDelayRemark').OldValue;
    end;
  end
  else
  begin
    if not (dbcbbDelay.DataSource.DataSet.State in [dsEdit]) then
      dbcbbDelay.DataSource.DataSet.Edit;
    dbcbbDelay.DataSource.DataSet.FieldByName('ReasonOfDelayID').Value := null;
    dbcbbDelay.DataSource.DataSet.FieldByName('ReasonOfDelayRemark').Value := null;
  end;
end;

procedure TfrmEdtCustomerOrder.SendMail();

  function getMailContent(): string;
  var
    strHtmlHead, strHtmlBody, strHtmlEnd, aOriginalETD: string;
  begin
    if DateTimeToStr(originalETD) = '1899/12/30' then aOriginalETD := '';
    strHtmlHead := '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">';
    strHtmlHead := strHtmlHead + '<html xmlns="http://www.w3.org/1999/xhtml">';
    strHtmlHead := strHtmlHead + '<head><meta http-equiv="Content-Type" content="text/html;charset=gb2312" />';
    strHtmlHead := strHtmlHead + '<style>.datalist{border:1px solid #0058a3;font-family:Arial;border-collapse:collapse;font-size:14px;}';
    strHtmlHead := strHtmlHead + '.datalist caption{padding-bottom:5px;font:bold 1.4em;text-align:left;}';
    strHtmlHead := strHtmlHead + '.datalist th{border:1px solid #0058a3;background-color:#4bacff;color:#FFFFFF;font-weight:bold;padding-top:4px; padding-bottom:4px;padding-left:12px; padding-right:12px;text-align:center;}';
    strHtmlHead := strHtmlHead + '.datalist td{border:1px solid #0058a3;text-align:left;padding-top:4px; padding-bottom:4px;padding-left:10px; padding-right:10px;}';
    strHtmlHead := strHtmlHead + '</style></head>';
    strHtmlHead := strHtmlHead + '<body><H2><font name="Arial">' + cfsETDMailContent + '</font></H2>';
    strHtmlHead := strHtmlHead + 'This file is sent automatically by system, please do not reply to this mail.<br>';

    //str := '<H3>' + VarToStr(dbcbbPlant.Value) + '</H3>';
    strHtmlBody := '<table class="datalist">';
    strHtmlBody := strHtmlBody + '<tr> <th scope="col">Customer Code</th>'
      + ' <th scope="col">Customer Name</th>'      
      + ' <th scope="col">Model</th>'               
      + ' <th scope="col">Customer Order Quantity</th>'
      + ' <th scope="col">Plant</th>'
      + ' <th scope="col">Customer Order Number</th>'
      + ' <th scope="col">RTD</th>'
      + ' <th scope="col">ETD</th>'
      + ' <th scope="col">Original ETD</th>'
      + ' <th scope="col">CS Communicator</th></tr>';

    strHtmlBody := strHtmlBody + '<tr>';
    strHtmlBody := strHtmlBody + '<td><center>' + VarToStr(dbcbbCustomer.Value) + '</center></td>'
      + '<td><center>' + edtCustomerName.Text + '</center></td>'   
      + '<td><center>' + VarToStr(dbcbbModel.Value) + '</center></td>'
      + '<td><center>' + dbedtOrderQty.Text + '</center></td>'
      + '<td><center>' + dbcbbPlant.Text + '</center></td>'
      + '<td><center>' + dbedtOrderNumber.Text + '</center></td>'
      + '<td><center>' + VarToStr(dbdtpRTD.Value) + '</center></td>'
      + '<td><center>' + VarToStr(dbdtpETD.Value) + '</center></td>'
      + '<td><center>' + aOriginalETD + '</center></td>'
      + '<td><center>' + VarToStr(dbedtCreator.Value) + '</center></td>';
    strHtmlBody := strHtmlBody + '</tr>';

    strHtmlEnd := '</table></body></html>';

    result := strHtmlHead + strHtmlBody + strHtmlEnd;
  end;
var
  Response: TStringStream;
  slPSParam: TStringList;
  slCOParam: TStringList;
  mailTo: string;
  applicationid, plantid: integer;
  objMgrBasicData: TMgrBasicData;
  adt1: TADODataSet;
  MailFrom: string;
begin
  applicationid := ds_active.DataSet.FieldByName('BusinessApplicationID').AsInteger;
  plantid := ds_active.DataSet.FieldByName('PlantID').AsInteger;
  if (applicationid in [1, 6, 7, 8]) and (plantid = 1) then
    mailTo := cfsMailToPlt38;
  if (applicationid in [2, 3, 5]) and (plantid in [1, 2]) then
    mailTo := cfsMailToPlt72;
  if (plantid in [3, 4]) then
    mailTo := cfsMailToPlt80;
  mailTo := mailTo + ';' + ds_active.DataSet.fieldbyname('CommunicatorMail').AsString;
                                 
  objMgrBasicData := TMgrBasicData.Create;
  adt1 := TADODataSet.Create(nil);
  slCOParam := TStringList.Create;
  slCOParam.Append('loginid=' + IntToStr(objCurUser.LoginID));
  objMgrBasicData.QueryBasicDataByParam(adt1, 'Communicator', 'CommunicatorID', slCOParam);
  MailFrom := adt1.fieldbyname('CommunicatorMail').AsString;
  slCOParam.Free;
  adt1.Free;
  objMgrBasicData.Free;

  Response := TStringStream.Create('');
  slPSParam := TStringList.Create;
  try
    slPSParam.Clear;
    slPSParam.Append('subject=ETD Delay Remind');
    slPSParam.Append('mailfrom=' + MailFrom);
    slPSParam.Append('mailto=' + mailTo);
    slPSParam.Append('content=' + getMailContent());
    IdHTTP1.post(cfsSendMailUrl, slPSParam, Response);
{    if (LowerCase(Response.DataString) <> '1') then
    begin
      showmessage('Failed send mail.');
      exit;
    end
    else
      showmessage('Successfully send mail.');   }
  finally
    slPSParam.Free;
    Response.Free;
  end;
end;

procedure TfrmEdtCustomerOrder.dbcbbDelayChange(Sender: TObject);
begin
  if (chkDelay.Checked) and (dbcbbDelay.Value <> null) then
  begin
    dbedtDelayRemark.Enabled := true;
    dbedtDelayRemark.Color := clWindow;
    dbedtDelayRemark.Clear;
  end
  else
  begin
    dbedtDelayRemark.Enabled := false;
    dbedtDelayRemark.Color := clBtnFace;
  end;
  if VarToStr(dbcbbDelay.Value) <> '' then
  begin
    if (VarToStr(dbcbbDelay.Value) = '23') and etdDelay then
      SendMail;
  end;
end;

procedure TfrmEdtCustomerOrder.adt_customerAfterScroll(DataSet: TDataSet);
begin
  inherited;
  edtCustomerName.Text := ds_customer.DataSet.FieldByName('CustomerName').AsString;
end;

procedure TfrmEdtCustomerOrder.adt_modelAfterScroll(DataSet: TDataSet);
begin
  inherited;
  edtModelDesc.Text := ds_model.DataSet.FieldByName('ModelDescription').AsString;
  if VarToStr(dbcbbModel.KeyValue) <> '' then
  begin
    //DM.DataSetQuery(adt_bom, format(sQueryBOMSQL,  [' and ModelID=' + VarToStr(dbcbbModel.KeyValue)]));
    DM.DataSetQuery(adt_bom, 'EXEC usp_GetBOM @ModelID=' + VarToStr(dbcbbModel.KeyValue));
    gridBOM.DataSource.DataSet.Active := false;
    gridBOM.DataSource.DataSet.Active := true;
  end;
end;

procedure TfrmEdtCustomerOrder.adt_fromBeforePost(DataSet: TDataSet);
        {
  function checkBonded(ModelID: string): Boolean;
  var
    adt1: TADODataset;
  begin
    adt1 := TADODataset.Create(nil);
    try
      //DM.DataSetQuery(adt1, 'Select * from Model where ModelID in (select ModelID from LogisticLogbook)');
      DM.DataSetQuery(adt1, 'select ModelID from LogisticLogbook where ModelID=' + ModelID);
      if adt1.RecordCount > 0 then
        Result := true
      else
        Result := false;
    finally
      adt1.Free;
    end;
  end;  }
var
  sqlUSP: string;
begin
  if objCurUser.AccessLevel = 2 then
  begin
    if VarToStr(dbdtpETD.Text) <> '    -  -  ' then
    begin
      if (VarToStr(dbdtpETD.Field.OldValue) <> '') then
      begin
        if (rtdDelay and etdDelay and (VarToStr(dbcbbDelay.Value) = '23')) then
        begin
          ShowMessage('ETD and RTD delay, can''t select plant reason.');
          Abort;
        end;
        if (VarToDateTime(ds_active.DataSet.FieldByName('ETD').Value) > VarToDateTime(ds_active.DataSet.FieldByName('ETD').OldValue))
          and (DataSet.FieldByName('ReasonOfDelayID').Value = null)
          then
        begin
          ShowMessage('ETD delay, Please select reason of delay.');
          Abort;
        end;
      end;
    end;
    if VarToStr(dbdtpRTD.Text) <> '    -  -  ' then
    begin
     // if ds_active.DataSet.FieldByName('RTD').Value <> null then
      if (VarToStr(dbdtpRTD.Field.OldValue) <> '') then
      begin
        if (VarToDateTime(ds_active.DataSet.FieldByName('RTD').Value) > VarToDateTime(ds_active.DataSet.FieldByName('RTD').OldValue))
          and (DataSet.FieldByName('ReasonOfDelayID').Value = null)
          then
        begin
          if etdDelay = true then
          begin
            ShowMessage('RTD and ETD delay, Please select reason of delay.');
            Abort;
          end;
        end;
      end;
    end;
    {
    if not checkIsSetReasonOfDelay then
    begin
      ShowMessage('You have change ETD delay, please select reason of delay.');
      Abort;
    end;  }
  end;

  if ds_active.DataSet.FieldByName('CustomerID').Value <>
    ds_active.DataSet.FieldByName('CustomerID').OldValue then
  begin
    if MessageDlg('Is change customer?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    begin
      if ds_active.DataSet.State in [dsEdit] then
        ds_active.DataSet.Cancel;
      Abort;
    end;
  end;
  if ds_active.DataSet.FieldByName('ModelID').Value <>
    ds_active.DataSet.FieldByName('ModelID').OldValue then
  begin
    if MessageDlg('Is change model?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    begin
      if ds_active.DataSet.State in [dsEdit] then
        ds_active.DataSet.Cancel;
      Abort;
    end;
  end;
  {
  if (objCurUser.LoginID in [69, 88, 103]) and (ds_active.DataSet.fieldbyname('IsBonded').AsString = '') then
    if checkBonded(ds_active.DataSet.fieldbyname('ModelID').AsString) then
    begin
      if MessageDlg('Please confirm bonded with "Yes", not bonded with "No"?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        DataSet.FieldByName('IsBonded').Value := 1
      else
        DataSet.FieldByName('IsBonded').Value := 0;
    end;      }

  DataSet.FieldByName('UpdateTime').Value := now;
  if ((DataSet.FieldByName('BusinessApplicationID').OldValue <> null)
    and (DataSet.FieldByName('BusinessApplicationID').OldValue <> DataSet.FieldByName('BusinessApplicationID').Value)) then
  begin
    if MessageDlg('Are you sure change business application?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    begin
      DataSet.FieldByName('BusinessApplicationID').Value := DataSet.FieldByName('BusinessApplicationID').OldValue;
    end;
  end;
  if {(DataSet.FieldByName('ETD').OldValue = null)
    and }(DataSet.FieldByName('ETD').Value <> null) then
  begin
    DataSet.FieldByName('COConfirmedTime').Value := now;
    if DataSet.FieldByName('CustomerOrderStatesID').Value = 1 then
    begin
      //if DataSet.FieldByName('CustomerOrderNumber').AsString <> '' then
      DataSet.FieldByName('CustomerOrderStatesID').Value := 2;
    end;
  end;

  if (DataSet.FieldByName('InvoiceNumber').OldValue <> null)
    and (LowerCase(Copy(DataSet.FieldByName('InvoiceNumber').OldValue, 1, 1)) <> 'c')
    and (DataSet.FieldByName('InvoiceNumber').Value = null) then
  begin
    if (DataSet.FieldByName('CustomerOrderStatesID').Value = 5)
      or (DataSet.FieldByName('CustomerOrderStatesID').Value = 6) then
      DataSet.FieldByName('CustomerOrderStatesID').Value := 4;
  end;

  sqlUSP := '';
  if (DataSet.FieldByName('CustomerOrderQuantity').OldValue <> DataSet.FieldByName('CustomerOrderQuantity').Value) then
    sqlUSP := sqlUSP + ' EXEC usp_InsertCustomerOrderChangeLog '
      + '@CustomerOrderID=' + VarToStr(dbedtCustomerOrderID.Value) + ','
      + '@LoginID=' + IntToStr(objCurUser.LoginID) + ','
      + '@CustomerOrderQuantity=' + VarToStr(DataSet.FieldByName('CustomerOrderQuantity').OldValue) + ','
      + '@ChangeField=''CustomerOrderQuantity''';
  if ((DataSet.FieldByName('RTD').OldValue <> null)
    and (DataSet.FieldByName('RTD').OldValue <> DataSet.FieldByName('RTD').Value)) then
    sqlUSP := sqlUSP + ' EXEC usp_InsertCustomerOrderChangeLog '
      + '@CustomerOrderID=' + VarToStr(dbedtCustomerOrderID.Value) + ','
      + '@LoginID=' + IntToStr(objCurUser.LoginID) + ','
      + '@RTD=''' + VarToStr(DataSet.FieldByName('RTD').OldValue) + ''','
      + '@ChangeField=''RTD''';
  if ((DataSet.FieldByName('ETD').OldValue <> null)
    and (DataSet.FieldByName('ETD').OldValue <> DataSet.FieldByName('ETD').Value)) then
    sqlUSP := sqlUSP + ' EXEC usp_InsertCustomerOrderChangeLog '
      + '@CustomerOrderID=' + VarToStr(dbedtCustomerOrderID.Value) + ','
      + '@LoginID=' + IntToStr(objCurUser.LoginID) + ','
      + '@ETD=''' + VarToStr(DataSet.FieldByName('ETD').OldValue) + ''','
      + '@ChangeField=''ETD''';
  if ((DataSet.FieldByName('ModelID').OldValue <> null)
    and (DataSet.FieldByName('ModelID').OldValue <> DataSet.FieldByName('ModelID').Value)) then
    sqlUSP := sqlUSP + ' EXEC usp_InsertCustomerOrderChangeLog '
      + '@CustomerOrderID=' + VarToStr(dbedtCustomerOrderID.Value) + ','
      + '@LoginID=' + IntToStr(objCurUser.LoginID) + ','
      //+ '@ETD=''' + VarToStr(DataSet.FieldByName('ETD').OldValue) + ''','
    + '@ChangeField=''Model''';
  if sqlUSP <> '' then
  begin
    DM.DataSetModify(sqlUSP);
    gridLog.DataSource.DataSet.Active := false;
    gridLog.DataSource.DataSet.Active := true;
  end;
end;

procedure TfrmEdtCustomerOrder.adt_fromBeforeCancel(DataSet: TDataSet);
begin
  if dbcbbDelay.Value = null then
    chkDelay.Checked := false;
end;

procedure TfrmEdtCustomerOrder.dbedtCustomerOrderIDChange(Sender: TObject);
begin
  gboxBOM.Caption := 'BOM Of Model : ' + dbcbbModel.Text;
  gboxCOChangeLog.Caption := 'Change Log Of Order ID : ' + dbedtCustomerOrderID.Text;
  if dbedtCustomerOrderID.Value <> null then
  begin
    DM.DataSetQuery(adt_Log, 'EXEC usp_GetCustomerOrderChangeLog @CustomerOrderID='
      + VarToStr(dbedtCustomerOrderID.Value));
    gridLog.DataSource.DataSet.Active := false;
    gridLog.DataSource.DataSet.Active := true;
  end;
end;

procedure TfrmEdtCustomerOrder.adt_fromAfterPost(DataSet: TDataSet);
begin
  TADODataSet(DataSet).UpdateBatch();
end;

procedure TfrmEdtCustomerOrder.dbcbbModelExit(Sender: TObject);
begin
  inherited;
  if ds_active.DataSet.FieldByName('ModelID').Value <>
    ds_active.DataSet.FieldByName('ModelID').OldValue then
    if MessageDlg('Is change model?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
      if ds_active.DataSet.State in [dsEdit] then
        ds_active.DataSet.Cancel;
end;
   {
function TfrmEdtCustomerOrder.checkIsSetReasonOfDelay: boolean;
begin
  if etdDelay then
  begin
    if dbcbbDelay.Value = null then
      result := false
    else
      Result := true;
  end
  else
    Result := true;
end;
     }

procedure TfrmEdtCustomerOrder.Button1Click(Sender: TObject);
begin
  inherited;
  if MessageDlg('Send delay reason mail?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    SendMail();
  end;
end;

procedure TfrmEdtCustomerOrder.dbdtpRTDExit(Sender: TObject);
begin
  inherited;
  if objCurUser.AccessLevel = 2 then
  begin
    if VarToStr(dbdtpRTD.Text) <> '    -  -  ' then
    begin
      if VarToStr(dbdtpRTD.Field.OldValue) <> '' then
      begin
        if (VarToDateTime(trim(dbdtpRTD.Text)) > VarToDateTime(dbdtpRTD.Field.OldValue)) then
          rtdDelay := true
        else
          rtdDelay := false;
      end;
    end;
  end;
end;

procedure TfrmEdtCustomerOrder.dbdtpETDChange(Sender: TObject);
begin
  inherited;
  if objCurUser.AccessLevel = 2 then
  begin
    if VarToStr(dbdtpETD.Text) <> '    -  -  ' then
    begin
      if (VarToStr(dbdtpETD.Field.OldValue) <> '') then
      begin
        if (VarToDateTime(trim(dbdtpETD.Text)) > VarToDateTime(dbdtpETD.Field.OldValue)) then
        begin
          etdDelay := true;
        end
        else
          etdDelay := false;
      end;
    end;
  end;
end;

end.

