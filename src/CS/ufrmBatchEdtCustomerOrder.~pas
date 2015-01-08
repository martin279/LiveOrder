unit ufrmBatchEdtCustomerOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmBasic, ActnList, ImgList, ComCtrls, ToolWin, ExtCtrls, adodb,
  StdCtrls, Buttons, GridsEh, DBGridEh, Mask, DBCtrlsEh, DB, DBLookupEh,
  uDMManager, uDMEntity, DBCtrls, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP;

type
  TfrmBatchEdtCustomerOrder = class(TfrmBasic)
    gboxOrder: TGroupBox;
    chkCustomerPONum: TCheckBox;
    chkRTD: TCheckBox;
    edtCustomerPONum: TEdit;
    dtpRTD: TDateTimePicker;
    gboxConfirm: TGroupBox;
    chkRemark: TCheckBox;
    btnCancel: TBitBtn;
    btnSave: TButton;
    adt_plant: TADODataSet;
    ds_plant: TDataSource;
    adt_forwarder: TADODataSet;
    adt_forwarderForwarderID: TAutoIncField;
    adt_forwarderForwarderName: TStringField;
    ds_forwarder: TDataSource;
    dtpETD: TDateTimePicker;
    chkETDChange: TCheckBox;
    chkETD: TCheckBox;
    chkInvoiceNum: TCheckBox;
    edtInvoiceNum: TEdit;
    edtMNum: TEdit;
    chkMNum: TCheckBox;
    chkCustomerOrderNum: TCheckBox;
    edtCustomerOrderNum: TEdit;
    chkPayment: TCheckBox;
    edtPayment: TEdit;
    chkForwarder: TCheckBox;
    dbcbbForwarder: TDBLookupComboboxEh;
    dtpATD: TDateTimePicker;
    chkATD: TCheckBox;
    chkFreight: TCheckBox;
    edtFreight: TEdit;
    chkDestination: TCheckBox;
    edtDestination: TEdit;
    edtRemark: TEdit;
    chkInstruction: TCheckBox;
    edtInstruction: TEdit;
    chkETA: TCheckBox;
    dtpETA: TDateTimePicker;
    GroupBox1: TGroupBox;
    Label9: TLabel;
    adt_delay: TADODataSet;
    ds_delay: TDataSource;
    dbcbbDelay: TDBLookupComboBox;
    IdHTTP1: TIdHTTP;
    procedure btnSaveClick(Sender: TObject);
    procedure dbcbbDelayClick(Sender: TObject);
    procedure dtpETDChange(Sender: TObject);
    procedure dtpRTDChange(Sender: TObject);
  private
    { Private declarations }
    COID: WideString;
    objMgrBasic: TMgrBasicData;
    objCO: TCustomerOrder;
    objMgrCO: TMgrCustomerOrder;
    procedure SendMail();
  protected
    procedure InitializeForm; override;
    procedure DestoryForm; override;
    procedure SetData; override;
    procedure SetUI; override;
    procedure SetAccess; override;
  public
    { Public declarations }
    class procedure EdtFromList(SelectCOID: string);
  end;

var
  etdDelay, rtdDelay: Boolean;
  maxETD, maxRTD: TDateTime;
  plantid: integer;

implementation

uses DataModule, uMJ;

{$R *.dfm}

{ TfrmBatchChange }

procedure TfrmBatchEdtCustomerOrder.InitializeForm;
begin
  objCO := TCustomerOrder.Create;
  objMgrBasic := TMgrBasicData.Create;
  objMgrCO := TMgrCustomerOrder.Create;
  inherited;
end;

procedure TfrmBatchEdtCustomerOrder.DestoryForm;
begin
  inherited;
  objCO.Free;
  objMgrBasic.Free;
  objMgrCO.Free;
end;

procedure TfrmBatchEdtCustomerOrder.SetData;
begin
  objMgrBasic.QueryBasicData(adt_forwarder, 'Forwarder');
  if objCurUser.AccessLevel = 2 then
    DM.DataSetQuery(adt_delay, 'select * from ReasonOfDelay where ReasonOfDelayID in (15,16,17,20,21,22,23)')
  else if objCurUser.AccessLevel = 3 then
    DM.DataSetQuery(adt_delay, 'select * from ReasonOfDelay where left(ReasonOfDelayDesc,8)<>''Customer''')
  else
    objMgrBasic.QueryBasicData(adt_delay, 'ReasonOfDelay');
end;

procedure TfrmBatchEdtCustomerOrder.SetUI;
begin
  inherited;
  Position := poOwnerFormCenter;
  dtpRTD.DateTime := now;
  dtpETD.DateTime := now;
  dtpATD.DateTime := now;
  dtpETA.DateTime := now;
end;

procedure TfrmBatchEdtCustomerOrder.SetAccess;
begin
  inherited;
  if not (objCurUser.AccessLevel in [1, 2]) then
    gboxOrder.Enabled := false;
end;

class procedure TfrmBatchEdtCustomerOrder.EdtFromList(SelectCOID: string);
var
  adt1: TADODataSet;
{ sl: TStringList;
  i: integer;}
begin
  with TfrmBatchEdtCustomerOrder.Create(Application) do
  begin
    adt1 := TADODataSet.Create(nil);
    try
      COID := SelectCOID;
  {  sl := TStringList.Create;
    adt1 := TADODataSet.Create(nil);
    try
      sl.CommaText := COID;
      for i := 0 to sl.Count - 1 do
      begin
        objCO.CustomerOrderID := StrToInt(sl[i]);
        objMgrCO.QueryCustomerOrder(adt1, objCO);
      end;
    finally
      adt1.Free;
      sl.Free;
    end;     }
      rtdDelay := false;
      etdDelay := false;

      DM.DataSetQuery(adt1, 'select max(ETD) as maxETD from CustomerOrder where CustomerOrderID in (' + COID + ')');
      maxETD := adt1.FieldByName('maxETD').AsDateTime;
      DM.DataSetQuery(adt1, 'select max(RTD) as maxRTD from CustomerOrder where CustomerOrderID in (' + COID + ')');
      maxRTD := adt1.FieldByName('maxRTD').AsDateTime;

      DM.DataSetQuery(adt1, 'select top 1 plantid from customerorder where CustomerOrderID in (' + COID + ')');
      plantid := adt1.FieldByName('plantid').AsInteger;

      ShowModal;
    finally
      adt1.Free;
      Free;
    end;
  end;
end;

procedure TfrmBatchEdtCustomerOrder.btnSaveClick(Sender: TObject);
begin
  inherited;
  if etdDelay and (dbcbbDelay.Text = '') then
  begin
    ShowMessage('ETD delay, please select reason of delay.');
    Abort;
  end;
  if rtdDelay and etdDelay and (VarToStr(dbcbbDelay.KeyValue) = '23') then
  begin
    ShowMessage('ETD and RTD delay, can''t select plant reason.');
    Abort;
  end;

  if (not chkRTD.Checked)
    and (not chkETD.Checked)
    and (not chkATD.Checked)
    and (not chkCustomerPONum.Checked)
    and (not chkMNum.Checked)
    and (not chkInvoiceNum.Checked)
    and (not chkCustomerOrderNum.Checked)
    and (not chkPayment.Checked)
    and (not chkRemark.Checked)
    and (not chkInstruction.Checked)
    and (not chkForwarder.Checked)
    and (not chkDestination.Checked)
    and (not chkFreight.Checked)
    and (not chkETA.Checked) then
  begin
    ShowMessage('You must select one checkbox at least.');
    exit;
  end;

  if chkRTD.Checked then
    objCO.RTD := FormatDateTime('YYYY-mm-dd', dtpRTD.DateTime)
  else
    objCO.RTD := '';
  if chkETD.Checked then
  begin
    objCO.ETD := FormatDateTime('YYYY-mm-dd', dtpETD.DateTime);
    objCo.COConfirmedTime := FormatDateTime('YYYY-mm-dd', now());
  end
  else
  begin
    objCO.ETD := '';
    objCO.COConfirmedTime := '';
  end;
  if chkATD.Checked then
    objCO.ATD := FormatDateTime('YYYY-mm-dd', dtpATD.DateTime)
  else
    objCO.ATD := '';
  if chkETA.Checked then
    objCO.ETA := FormatDateTime('YYYY-mm-dd', dtpETA.DateTime)
  else
    objCO.ETA := '';
  if chkCustomerPONum.Checked then
    objCO.CustomerPurchaseOrderNumber := Trim(edtCustomerPONum.Text);
  if chkMNum.Checked then
    objCO.MNumber := Trim(edtMNum.Text);
  if chkInvoiceNum.Checked then
    objCO.InvoiceNumber := Trim(edtInvoiceNum.Text);
  if chkCustomerOrderNum.Checked then
    objCO.CustomerOrderNumber := Trim(edtCustomerOrderNum.Text);
  if chkPayment.Checked then
    objCO.Payment := Trim(edtPayment.Text);
  if chkRemark.Checked then
    objCO.Remark := Trim(edtRemark.Text);
  if chkInstruction.Checked then
    objCO.Instruction := Trim(edtInstruction.Text);
  if chkForwarder.Checked then
    objCO.ForwarderID := StrToInt(VarToStr(dbcbbForwarder.Value));
  if chkDestination.Checked then
    objCO.Destination := Trim(edtDestination.Text);
  if chkFreight.Checked then
    objCO.Freight := Trim(edtFreight.Text);
  if dbcbbDelay.Text <> '' then
    objCO.ReasonOfDelayID := VarToStr(dbcbbDelay.KeyValue);
  objCO.BatchCustomerOrderID := COID;
  objMgrCO.UpdateCustomerOrder(nil, objCO);
  close;
end;

procedure TfrmBatchEdtCustomerOrder.dbcbbDelayClick(Sender: TObject);
begin
  inherited;
  if dbcbbDelay.Text <> '' then
  begin
    if (VarToStr(dbcbbDelay.KeyValue) = '23') and etdDelay then
      SendMail();
  end;
end;

procedure TfrmBatchEdtCustomerOrder.SendMail();
var
  Response: TStringStream;
  slPSParam: TStringList;
  mailTo: string;
begin
  if (plantid = 1) then
    mailTo := cfsMailToPlt38;
  if (plantid = 2) then
    mailTo := cfsMailToPlt72;
  if (plantid in [3, 4]) then
    mailTo := cfsMailToPlt80;

  Response := TStringStream.Create('');
  slPSParam := TStringList.Create;
  try
    slPSParam.Clear;
    slPSParam.Append('subject=ETD delay remind.');
    slPSParam.Append('mailto=' + mailTo);
    slPSParam.Append('content=' + cfsETDMailContent);
    IdHTTP1.post(cfsSendMailUrl, slPSParam, Response);
    if (LowerCase(Response.DataString) <> '1') then
    begin
      showmessage('Failed send mail.');
      exit;
    end
    else
      showmessage('Successfully send mail.');
  finally
    slPSParam.Free;
    Response.Free;
  end;
end;


procedure TfrmBatchEdtCustomerOrder.dtpETDChange(Sender: TObject);
begin
  inherited;
  if objCurUser.AccessLevel = 2 then
  begin
    if maxETD > 0 then
    begin
      if dtpETD.DateTime > maxETD then
        etdDelay := true
      else
        etdDelay := false;
    end;
  end;
end;

procedure TfrmBatchEdtCustomerOrder.dtpRTDChange(Sender: TObject);
begin
  inherited;
  if objCurUser.AccessLevel = 2 then
  begin
    if maxRTD > 0 then
    begin
      if dtpRTD.DateTime > maxRTD then
        rtdDelay := true
      else
        rtdDelay := false;
    end;
  end;
end;

end.

