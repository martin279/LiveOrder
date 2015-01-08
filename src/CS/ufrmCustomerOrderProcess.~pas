unit ufrmCustomerOrderProcess;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, PropFilerEh, MemTableDataEh, Db,
  DataDriverEh, MemTableEh, ADODB, Menus, PropStorageEh, ActnList, ImgList,
  StdCtrls, Buttons, ComCtrls, GridsEh, DBGridEh, DBCtrls, ToolWin,
  ExtCtrls, WordXP, OleServer, IniFiles, AppEvnts, ufrmDBBasicTreeDT,
  DBCtrlsEh, Mask, DBLookupEh, 
  IdComponent, IdTCPConnection, IdTCPClient, IdMessageClient, IdSMTP, IdBaseComponent, IdMessage,
  uMJ, uDMManager, uDMEntity;

type
  TfrmCustomerOrderProcess = class(TfrmDBBasicTreeDT)
    MenuSelectForOperation: TMenuItem;
    pageCtrlOP: TPageControl;
    tbsMF: TTabSheet;
    tbsForm: TTabSheet;
    gboxMF: TGroupBox;
    btnUpload: TButton;
    cbbMFType: TComboBox;
    cbbMFTypeDetail: TComboBox;
    MenuConfirmOrder: TMenuItem;
    edtMFAttach: TEdit;
    LabelMFAttach: TLabel;
    gboxMF2: TGroupBox;
    gboxForm: TGroupBox;
    btnGenerateForm: TButton;
    cbbFormType: TComboBox;
    WordDocument1: TWordDocument;
    WordApplication1: TWordApplication;
    WordFont1: TWordFont;
    gboxForm2: TGroupBox;
    edtForm: TEdit;
    LabelForm: TLabel;
    MenuSplitOrder: TMenuItem;
    MenuNewOrder: TMenuItem;
    MenuOpenOrder: TMenuItem;
    MenuReleaseOrder: TMenuItem;
    MenuShippingOrder: TMenuItem;
    MenuShippedOrder: TMenuItem;
    N4: TMenuItem;
    MenuBatchEdtCO: TMenuItem;
    MenuEdtCO: TMenuItem;
    MenuSelectForScheduling: TMenuItem;
    MenuAddCOComments: TMenuItem;
    MenuCancelCO: TMenuItem;
    MenuPaidOrder: TMenuItem;
    btnPreview: TButton;
    N5: TMenuItem;
    MenuWaitingShipment: TMenuItem;
    MenuConfirmedShipment: TMenuItem;
    N3: TMenuItem;
    N6: TMenuItem;
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure MenuSelectForOperationClick(Sender: TObject);
    procedure btnUploadClick(Sender: TObject);
    procedure btnGenerateFormClick(Sender: TObject);
    procedure MenuSplitOrderClick(Sender: TObject);
    procedure adt_activeBeforeDelete(DataSet: TDataSet);
    procedure MenuNewOrderClick(Sender: TObject);
    procedure MenuOpenOrderClick(Sender: TObject);
    procedure MenuConfirmOrderClick(Sender: TObject);
    procedure MenuReleaseOrderClick(Sender: TObject);
    procedure MenuShippingOrderClick(Sender: TObject);
    procedure MenuShippedOrderClick(Sender: TObject);
    procedure cbbMFTypeDetailChange(Sender: TObject);
    procedure cbbMFTypeChange(Sender: TObject);
    procedure cbbTreeTypeChange(Sender: TObject);
    procedure MenuEdtCOClick(Sender: TObject);
    procedure MenuBatchEdtCOClick(Sender: TObject);
    procedure cbbFormTypeChange(Sender: TObject);
    procedure MenuSelectForSchedulingClick(Sender: TObject);
    procedure MenuAddCOCommentsClick(Sender: TObject);
    procedure MenuCancelCOClick(Sender: TObject);
    procedure MenuPaidOrderClick(Sender: TObject);
    procedure btnPreviewClick(Sender: TObject);
    procedure MenuWaitingShipmentClick(Sender: TObject);
    procedure MenuConfirmedShipmentClick(Sender: TObject);
  private
    objCO: TCustomerOrder;
    objSS: TShippingSchedule;
    objMgrBasic: TMgrBasicData;
    objMgrPS: TMgrProductionSchedule;
    objMgrCO: TMgrCustomerOrder;
    objMgrTO: TMgrTradingOrder;
    objMgrSS: TMgrShippingSchedule;
    slCOParam: TStringList;
    procedure ChangeOrderStates(warMsg: string; OrderStatesID: integer);
    procedure CreateShippingSchedule(warMsg: string; ScheduleStatusID: integer);
  protected
    procedure InitializeForm; override;
    procedure DestoryForm; override;
    procedure SetData; override;
    procedure SetUI; override;
    procedure SetAccess; override;
    procedure LoadTreeView(nodeName: string); override;
  public
    { Public declarations }
  end;


implementation

uses DataModule, Math, ufrmSplitCustomerOrder, ufrmEdtCustomerOrder,
  ufrmBatchEdtCustomerOrder, uCustomerOrderProcessUploadMainframe,
  uCustomerOrderProcessGenerateForm, ufrmAddCustomerOrderComments,
  ufrmDBBasic, ufrmDBBasicTree, uSendMail, StrUtils;


{$R *.dfm}

{ TfrmCustomerOrder }

procedure TfrmCustomerOrderProcess.InitializeForm;
begin
  objCO := TCustomerOrder.Create;
  objSS := TShippingSchedule.Create;
  objMgrBasic := TMgrBasicData.Create;
  objMgrCO := TMgrCustomerOrder.Create;
  objMgrTO := TMgrTradingOrder.Create;
  objMgrPS := TMgrProductionSchedule.Create;
  objMgrSS := TMgrShippingSchedule.Create;
  slCOParam := TStringList.Create;
  inherited;
end;

procedure TfrmCustomerOrderProcess.DestoryForm;
begin
  objCO.Free;
  objSS.Free;
  objMgrBasic.Free;
  objMgrCO.Free;
  objMgrTO.Free;
  objMgrPS.Free;
  objMgrSS.Free;
  slCOParam.Free;
  inherited;
end;

procedure TfrmCustomerOrderProcess.SetData;
begin
  objCO.CustomerOrderID := 0;
  objMgrCO.QueryCustomerOrder(adt_active, objCO);
  objMgrCO.QueryCustomerOrder(adt_active2, objCO);
end;

procedure TfrmCustomerOrderProcess.SetUI;
begin
  inherited;
  tbsBody1.TabVisible := false;
  GroupBox1.Caption := 'Customer Order';
  cbbTreeType.Items.Add('Plant38-CO States');
  cbbTreeType.Items.Add('Plant72-CO States');
  cbbTreeType.Items.Add('Plant80-CO States');
  cbbTreeType.Items.Add('Oversea-CO States');
  if objCurUser.PlantID = '2' then
    cbbTreeType.ItemIndex := 1
  else
    cbbTreeType.ItemIndex := 0;
  TreeView1.ReadOnly := true;

  cbbMFType.Items.Add('ORDM');
  cbbMFType.Items.Add('IS02');
  cbbMFType.Items.Add('OINQ');
  cbbMFType.Items.Add('SPLN');
  cbbMFType.Items.Add('INVC');
  cbbMFType.ItemIndex := 0;
  cbbMFTypeDetail.Items.Add('<1> ADD NEW ORDER');
  cbbMFTypeDetail.Items.Add('<2> CHANGE ORDERS');
  cbbMFTypeDetail.Items.Add('<3> DELETE ORDERS');
  cbbMFTypeDetail.ItemIndex := 0;
  gboxMF2.Visible := false;
  LabelMFAttach.Caption := 'Freight Cost';
  //edtMFAttach.Text := '0';

  cbbFormType.Items.Add('OA');
  cbbFormType.Items.Add('Invoice');
  cbbFormType.Items.Add('Packing');
  cbbFormType.Items.Add('DeliveryNote');
  cbbFormType.ItemIndex := 0;
  gboxForm2.Visible := true;
  LabelForm.Caption := 'Freight Cost';
  edtForm.Text := '0';

  gridData.FieldColumns['CustomerOrderQuantity'].Footer.ValueType := fvtSum;
  gridData.FieldColumns['TotalAmount'].Footer.ValueType := fvtSum;
  gridData.FieldColumns['OINQReleaseCOQuantity'].Footer.ValueType := fvtSum;
  gridData.FieldColumns['ActualReleaseCOQuantity'].Footer.ValueType := fvtSum;
  gridData2.FieldColumns['CustomerOrderQuantity'].Footer.ValueType := fvtSum;
  gridData2.FieldColumns['TotalAmount'].Footer.ValueType := fvtSum;
  gridData2.FieldColumns['OINQReleaseCOQuantity'].Footer.ValueType := fvtSum;
  gridData2.FieldColumns['ActualReleaseCOQuantity'].Footer.ValueType := fvtSum;
end;

procedure TfrmCustomerOrderProcess.SetAccess;
begin
  inherited;
  tbtnOperation.Visible := objCurUser.AccessLevel in [1, 2];
  if not (objCurUser.AccessLevel in [1, 2, 10, 11]) then
  begin
    gridData.FieldColumns['Price'].Visible := false;
    gridData.FieldColumns['TotalAmount'].Visible := false;
    gridData.FieldColumns['Payment'].Visible := false;
  end;
  if objCurUser.LoginID in [181, 204] then
    gridData.FieldColumns['StatusToOpenOrderTime'].Visible := true
  else
    gridData.FieldColumns['StatusToOpenOrderTime'].Visible := false;
end;

procedure TfrmCustomerOrderProcess.LoadTreeView(nodeName: string);
var
  ftn_type: TTreeNode;
  adt_select: TADODataSet;
  aNodeName: string;
begin
  inherited;
  ftn_type := TreeView1.Items.AddChild(nil, nodeName);
  adt_select := TADODataSet.Create(nil);
  try
    if cbbTreeType.ItemIndex < 3 then
      objMgrBasic.QueryBasicData(adt_select, 'CustomerOrderStates')
    else if cbbTreeType.ItemIndex = 3 then
      objMgrBasic.QueryBasicData(adt_select, 'Oversea_CustomerOrderStates', 'CustomerOrderStatesID');

    while not adt_select.Eof do
    begin
      aNodeName := adt_select.FieldByName('CustomerOrderStatesName').AsString;
      TreeView1.Items.AddChild(ftn_type, aNodeName);
      adt_select.Next;
    end;
  finally
    adt_select.Free;
    ftn_type.Expanded := true;
  end;
end;

procedure TfrmCustomerOrderProcess.cbbMFTypeChange(Sender: TObject);
begin
  gboxMF2.Visible := false;
  cbbMFTypeDetail.Clear;
  edtMFAttach.Clear;
  case cbbMFType.ItemIndex of
    0:
      begin
        cbbMFTypeDetail.Items.Add('<1> ADD NEW ORDER');
        cbbMFTypeDetail.Items.Add('<2> CHANGE ORDERS');
        cbbMFTypeDetail.Items.Add('<3> DELETE ORDERS');
      end;
    1:
      begin
        cbbMFTypeDetail.Items.Add('<1> ADD NEW MASTER ORDER');
        cbbMFTypeDetail.Items.Add('<2> ADD ORDERS TO EXISTING MASTER ORDER');
        cbbMFTypeDetail.Items.Add('<3> CHANGE ORDERS');
        cbbMFTypeDetail.Items.Add('<4> DELETE ORDERS');
        cbbMFTypeDetail.Items.Add('<8> DOWNLOAD ORDERS');
      end;
    2:
      cbbMFTypeDetail.Items.Add('<1> GENETEATE RELEASE ORDER');
    3:
      begin
        cbbMFTypeDetail.Items.Add('<1> GENETEATE INVOICE NUMBER');
        cbbMFTypeDetail.Items.Add('<2> CHANGE FREIGHT COST');
        cbbMFTypeDetail.Items.Add('<3> DELETE INVOICE');
        LabelMFAttach.Caption := 'Freight Cost';
        edtMFAttach.Text := '0';
        gboxMF2.Visible := true;
      end;
    4:
      cbbMFTypeDetail.Items.Add('<1> DELETE ORDERS');
  end;
  cbbMFTypeDetail.ItemIndex := 0;
end;

procedure TfrmCustomerOrderProcess.cbbFormTypeChange(Sender: TObject);
begin
  inherited;
  if cbbFormType.ItemIndex = 0 then
  begin
    LabelForm.Caption := 'Freight Cost';
    edtForm.Text := '0';
  end
  else
  begin
    LabelForm.Caption := 'Invoice No.';
    edtForm.Clear;
  end;
end;

procedure TfrmCustomerOrderProcess.cbbTreeTypeChange(Sender: TObject);
begin
  inherited;
  TreeView1.Items[0].Selected := true;
end;

procedure TfrmCustomerOrderProcess.TreeView1Change(Sender: TObject;
  Node: TTreeNode);

  procedure SetAccessForUI;
  begin
    SetPopupMenu;
    if cbbTreeType.ItemIndex in [0, 1, 2] then
    begin
      if TreeView1.Selected.Level = 0 then
      begin
        pnlBodyRight.Visible := false;
        pnlBodyBottom.Visible := false;
      end
      else if TreeView1.Selected.Level = 1 then
      begin
        if objCurUser.AccessLevel = 2 then
        begin
          gridData.OnDblClick := MenuEdtCOClick;
          MenuEdtCO.Visible := True;
          MenuBatchEdtCO.Visible := True;
          MenuNewOrder.Visible := TreeView1.Selected.Index in [1, 2];
          MenuOpenOrder.Visible := TreeView1.Selected.Index in [0, 2];
          MenuConfirmOrder.Visible := TreeView1.Selected.Index in [1, 3];
          MenuReleaseOrder.Visible := TreeView1.Selected.Index in [2, 4];
          MenuShippingOrder.Visible := TreeView1.Selected.Index in [3, 5];
          MenuShippedOrder.Visible := TreeView1.Selected.Index = 4;
          MenuWaitingShipment.Visible := TreeView1.Selected.Index in [2, 3, 4];
          MenuConfirmedShipment.Visible := TreeView1.Selected.Index in [2, 3, 4];
          MenuCancelCO.Visible := TreeView1.Selected.Index < 5;
          MenuSplitOrder.Visible := TreeView1.Selected.Index < 6;
          MenuSelectForOperation.Visible := TreeView1.Selected.Index < 6;
          MenuAddCOComments.Visible := true;
          pnlBodyRight.Visible := true;
          pnlBodyBottom.Visible := true;
          Splitter2.Align := alTop;
          Splitter2.Align := alBottom;
        end
        else if objCurUser.AccessLevel = 3 then
        begin
          if TreeView1.Selected.Index < 3 then
            gridData.OnDblClick := MenuEdtCOClick;
          MenuEdtCO.Visible := TreeView1.Selected.Index < 3;
          MenuBatchEdtCO.Visible := TreeView1.Selected.Index < 3;
          MenuNewOrder.Visible := TreeView1.Selected.Index in [1, 2];
          MenuOpenOrder.Visible := TreeView1.Selected.Index in [0, 2];
          MenuConfirmOrder.Visible := TreeView1.Selected.Index in [1];
          MenuSelectForScheduling.Visible := (TreeView1.Selected.Index < 4) and (objCurUser.LoginID in [56, 181]);
        end;
      end;
    end
    else if cbbTreeType.ItemIndex = 3 then
    begin
      if TreeView1.Selected.Level = 0 then
      begin
        pnlBodyRight.Visible := false;
        pnlBodyBottom.Visible := false;
      end
      else if TreeView1.Selected.Level = 1 then
      begin
        gridData.OnDblClick := MenuEdtCOClick;
        MenuEdtCO.Visible := True;
        MenuBatchEdtCO.Visible := True;
        if objCurUser.AccessLevel = 2 then
        begin
          MenuNewOrder.Visible := TreeView1.Selected.Index = 1;
          MenuConfirmOrder.Visible := TreeView1.Selected.Index in [0, 2];
          MenuPaidOrder.Visible := TreeView1.Selected.Index in [1, 3];
          MenuShippedOrder.Visible := TreeView1.Selected.Index = 2;
          MenuCancelCO.Visible := TreeView1.Selected.Index < 3;
          MenuSplitOrder.Visible := TreeView1.Selected.Index < 4;
          MenuSelectForOperation.Visible := TreeView1.Selected.Index < 4;
          pnlBodyRight.Visible := true;
          pnlBodyBottom.Visible := true;
          Splitter2.Align := alTop;
          Splitter2.Align := alBottom;
        end;
      end;
    end;
  end;
begin
  inherited;
  if objCurUser.AccessLevel <> 1 then
    SetAccessForUI;
  objMgrCO.QueryCustomerOrderByTree(adt_active, TreeView1.Selected, nil, cbbTreeType.ItemIndex);
  objCO.CustomerOrderID := 0;
  objMgrCO.QueryCustomerOrder(adt_active2, objCO);
end;

procedure TfrmCustomerOrderProcess.MenuEdtCOClick(Sender: TObject);
var
  gridFrom: TDBGridEh;
begin
  inherited;
  gridFrom := gridData;
  if DBNavigator1.DataSource = ds_active2 then
    gridFrom := gridData2;
  TfrmEdtCustomerOrder.EdtFromList(TADODataSet(gridFrom.DataSource.DataSet));
  RefreshGrid(gridFrom, DBNavigator1.DataSource);
end;

procedure TfrmCustomerOrderProcess.MenuBatchEdtCOClick(Sender: TObject);
var
  COID: string;
  gridFrom: TDBGridEh;
begin
  gridFrom := gridData;
  if DBNavigator1.DataSource = ds_active2 then
  begin
    gridFrom := gridData2;
  end;
  if not CheckIfSelectRows(gridFrom) then exit;
  COID := GetBatchFieldValueFromGrid(gridFrom, 'CustomerOrderID');
  TfrmBatchEdtCustomerOrder.EdtFromList(COID);
  RefreshGrid(gridFrom, DBNavigator1.DataSource);
end;

procedure TfrmCustomerOrderProcess.MenuSplitOrderClick(Sender: TObject);
var
  gridFrom: TDBGridEh;
begin
  gridFrom := gridData;
  if DBNavigator1.DataSource = ds_active2 then
  begin
    gridFrom := gridData2;
  end;
  if TfrmSplitCustomerOrder.EdtFromList(TADODataSet(gridFrom.DataSource.DataSet)) then
    RefreshGrid(gridFrom, DBNavigator1.DataSource);
end;

procedure TfrmCustomerOrderProcess.MenuCancelCOClick(Sender: TObject);
var
  gridFrom: TDBGridEh;
begin
  gridFrom := gridData;
  if DBNavigator1.DataSource = ds_active2 then
  begin
    gridFrom := gridData2;
  end;
  if not CheckIfSelectRows(gridFrom, true, 'Cancel select customer order') then exit;
  objMgrCO.ChangeCustomerOrderStatus(gridFrom, 7);
  RefreshGrid(gridFrom, DBNavigator1.DataSource);
end;

procedure TfrmCustomerOrderProcess.MenuSelectForOperationClick(Sender: TObject);
var
  COID: WideString;
  slParent: TStringList;
begin
  if not CheckIfSelectRows(gridData) then exit;
  COID := GetBatchFieldValueFromGrid(gridData, 'CustomerOrderID');
  if adt_active2.RecordCount > 0 then
    COID := COID + ',' + GetBatchFieldValueFromGrid(gridData2, 'CustomerOrderID', false);
  if (COID <> '') and (RightStr(COID, 1) = ',') then
    COID := copy(COID, 1, length(COID) - 1);
  slParent := TStringList.Create;
  try
    RecoverGrid(gridData, ds_active, false);
    slParent.Clear;
    slParent.Append('CustomerOrderIDNone=' + COID);
    objMgrCO.QueryCustomerOrderByTree(adt_active, TreeView1.Selected, slParent, cbbTreeType.ItemIndex);
    slParent.Clear;
    slParent.Append('CustomerOrderID=' + COID);
    objMgrCO.QueryCustomerOrderByTree(adt_active2, TreeView1.Selected, slParent, cbbTreeType.ItemIndex);
  finally
    slParent.Free;
  end;
end;

procedure TfrmCustomerOrderProcess.MenuAddCOCommentsClick(Sender: TObject);
var
  gridFrom: TDBGridEh;
begin
  inherited;
  gridFrom := gridData;
  if DBNavigator1.DataSource = ds_active2 then
    gridFrom := gridData2;
  TfrmAddCustomerOrderComments.EdtFromList(TADODataSet(gridFrom.DataSource.DataSet));
  RefreshGrid(gridFrom, DBNavigator1.DataSource);
end;

procedure TfrmCustomerOrderProcess.ChangeOrderStates(warMsg: string; OrderStatesID: integer);
var
  gridFrom: TDBGridEh;
begin
  gridFrom := gridData;
  if DBNavigator1.DataSource = ds_active2 then
  begin
    gridFrom := gridData2;
  end;
  if not CheckIfSelectRows(gridFrom) then exit;
  objMgrCO.ChangeCustomerOrderStatus(gridFrom, OrderStatesID);
  RefreshGrid(gridFrom, DBNavigator1.DataSource);
end;

procedure TfrmCustomerOrderProcess.MenuNewOrderClick(Sender: TObject);
begin
  ChangeOrderStates(TMenuItem(sender).Caption, 1);
end;

procedure TfrmCustomerOrderProcess.MenuOpenOrderClick(Sender: TObject);
begin
  ChangeOrderStates(TMenuItem(sender).Caption, 2);
end;

procedure TfrmCustomerOrderProcess.MenuConfirmOrderClick(Sender: TObject);
begin
  ChangeOrderStates(TMenuItem(sender).Caption, 3);
end;

procedure TfrmCustomerOrderProcess.MenuReleaseOrderClick(Sender: TObject);
begin
  ChangeOrderStates(TMenuItem(sender).Caption, 4);
end;

procedure TfrmCustomerOrderProcess.MenuShippingOrderClick(Sender: TObject);
begin
  ChangeOrderStates(TMenuItem(sender).Caption, 5);
end;

procedure TfrmCustomerOrderProcess.MenuShippedOrderClick(Sender: TObject);
begin
  ChangeOrderStates(TMenuItem(sender).Caption, 6);
end;

procedure TfrmCustomerOrderProcess.MenuPaidOrderClick(Sender: TObject);
begin
  ChangeOrderStates(TMenuItem(sender).Caption, 5);
end;

procedure TfrmCustomerOrderProcess.MenuSelectForSchedulingClick(Sender: TObject);
begin
  if not CheckIfSelectRows(gridData, true, 'Upload to production schedule') then exit;
  try
    objMgrPS.AddProductionSchedule(gridData);
    RefreshGrid(gridData, DBNavigator1.DataSource);
  except on E: Exception do
      MessageDlg(E.Message + 'Error at process customer order to production schedule.', mtWarning, [mbOK], 0);
  end;
end;

procedure TfrmCustomerOrderProcess.adt_activeBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  try
    if DataSet.fieldbyname('CustomerOrderID').AsString <> '' then
    begin
      DM.DataSetModify('EXEC usp_DeleteCustomerOrder @CustomerOrderID='
        + DataSet.fieldbyname('CustomerOrderID').AsString);
      RefreshGrid(gridData, ds_active);
    end;
  finally
    Abort;
  end;
end;

procedure TfrmCustomerOrderProcess.cbbMFTypeDetailChange(Sender: TObject);
begin
  edtMFAttach.Clear;
  gboxMF2.Visible := false;
  if (cbbMFType.ItemIndex = 1) and (cbbMFTypeDetail.ItemIndex = 1) then
  begin
    LabelMFAttach.Caption := 'M No.';
    gboxMF2.Visible := true;
  end;
  if cbbMFType.ItemIndex = 3 then
  begin
    gboxMF2.Visible := true;
    if ((cbbMFTypeDetail.ItemIndex = 0) or (cbbMFTypeDetail.ItemIndex = 1)) then
    begin
      LabelMFAttach.Caption := 'Freight Cost';
      edtMFAttach.Text := '0';
    end;
    if (cbbMFTypeDetail.ItemIndex = 2) then
      LabelMFAttach.Caption := 'Invoice No.';
  end;
end;

procedure TfrmCustomerOrderProcess.btnUploadClick(Sender: TObject);
var
  objUploadMF: TCustomerOrderProcessUploadMainframe;
begin
  objUploadMF := TCustomerOrderProcessUploadMainframe.Create;
  try
    objUploadMF.UploadMainframe(self);
  finally
    objUploadMF.Free;
  end;
end;

procedure TfrmCustomerOrderProcess.btnGenerateFormClick(Sender: TObject);
var
  coGenerateForm: TCustomerOrderProcessGenerateForm;
  adt1: TADODataSet;
begin
  coGenerateForm := TCustomerOrderProcessGenerateForm.Create;
  try
    adt1 := TADODataSet.Create(nil);
    try
      if cbbFormType.ItemIndex <> 3 then
      begin
        DM.DataSetQuery(adt1, 'EXEC usp_GetCustomerOrder '
          + ' @InvoiceNumber=''' + trim(edtForm.Text) + '''');
        if adt1.FieldByName('IsPrintInvoice').AsBoolean then
        begin
          ShowMessage('warning: printed before.');
        end
        else
        begin
          if cbbFormType.ItemIndex = 1 then
            DM.DataSetModify('EXEC usp_UpdateCustomerOrderIsPrintInvoice '
              + ' @InvoiceNumber=''' + trim(edtForm.Text) + '''');
        end;
      end;
      if LowerCase(cbbFormType.Text) = 'invoice' then
      begin
        DM.DataSetQuery(adt1, 'select currency from CustomerOrder where InvoiceNumber=''' + Trim(edtForm.Text) + '''');
        if UpperCase(adt1.FieldByName('currency').AsString) = 'USD' then
          ShowMessage('Please do the MK Data.');
      end;
      coGenerateForm.GenerateForm(self);
    finally
      adt1.Free;
    end;
  finally
    coGenerateForm.Free;
  end;
end;

procedure TfrmCustomerOrderProcess.btnPreviewClick(Sender: TObject);
var
  coGenerateForm: TCustomerOrderProcessGenerateForm;
begin
  coGenerateForm := TCustomerOrderProcessGenerateForm.Create;
  try
    coGenerateForm.GenerateForm(self);
  finally
    coGenerateForm.Free;
  end;
end;

procedure TfrmCustomerOrderProcess.MenuWaitingShipmentClick(Sender: TObject);
begin
  inherited;
  CreateShippingSchedule(TMenuItem(sender).Caption, 1);
end;

procedure TfrmCustomerOrderProcess.MenuConfirmedShipmentClick(Sender: TObject);
begin
  inherited;
  CreateShippingSchedule(TMenuItem(sender).Caption, 2);
end;

procedure TfrmCustomerOrderProcess.CreateShippingSchedule(warMsg: string;
  ScheduleStatusID: integer);

  procedure SendShippingScheduleByMail(
    originalStatusID: integer; originalETD: TDateTime; IsHaveZSI: Boolean);
  var
    objSendMail: TMgrSendMail;
  begin
    objSendMail := TMgrSendMail.Create;
    try
      if (objCO.PlantID = 1) and (objCO.BusinessApplicationID <> 5) then
      begin
        if ((originalStatusID = 1) and (objSS.ShippingScheduleStatusID = 2))
          or ((originalStatusID = 2) and (objSS.ShippingScheduleStatusID = 1))
          or ((FormatDateTime('yyyymmdd', originalETD) = FormatDateTime('yyyymmdd', Now)) and (FormatDateTime('HHMM', Now) >= '0700'))
          or ((FormatDateTime('yyyymmdd', originalETD) = FormatDateTime('yyyymmdd', Now + 1)) and (FormatDateTime('HHMM', Now) >= '1700'))
          or IsHaveZSI then
          objSendMail.SendMailShippingSchedule(objSS.BatchCustomerOrderID);
      end;
    finally
      objSendMail.Free;
    end;
  end;
var
  i, originalStatusID: integer;
  coID: string;
  adtFrom, adt1: TADODataSet;
  originalETD: TDateTime;
  IsHaveZSI: Boolean;
  gridFrom: TDBGridEh;
begin
  gridFrom := gridData;
  adtFrom := adt_active;
  if DBNavigator1.DataSource = ds_active2 then
  begin
    gridFrom := gridData2;
    adtFrom := adt_active2;
  end;
  if not CheckIfSelectRows(gridFrom, true, warMsg) then exit;

  adtFrom.DisableControls;
  adt1 := TADODataSet.Create(nil);
  try
    coID := '';
    IsHaveZSI := False;
    for i := 0 to gridFrom.SelectedRows.Count - 1 do
    begin
      adtFrom.Bookmark := gridFrom.SelectedRows.items[I];
      objSS.CustomerOrderID := adtFrom.FieldByName('CustomerOrderID').AsInteger;
      objSS.ShippingScheduleStatusID := ScheduleStatusID;
      objMgrSS.CreateShippingSchedule(objSS);
      coID := coID + adtFrom.FieldByName('CustomerOrderID').AsString + ',';
      if (UpperCase(Copy(adtFrom.FieldByName('Model').AsString, 1, 3)) = 'ZSI')
        and (IsHaveZSI = false) then
        IsHaveZSI := true;
    end;
    coID := copy(coID, 0, (length(coID) - 1));
    objSS.BatchCustomerOrderID := coID;

    objMgrSS.UpdateShippingScheduleLotNumber(coID);
    slCOParam.Clear;
    slCOParam.Append('CustomerOrderID=' + coID);
    objMgrBasic.QueryBasicDataByParam(adt1, 'ViewShippingSchedule', 'CustomerOrderID', slCOParam);
    adt1.First;
    originalStatusID := adt1.FieldByName('ShippingScheduleStatusID').AsInteger;
    originalETD := adt1.FieldByName('ETD').AsDateTime;
    objMgrBasic.QueryBasicDataByParam(adt1, 'CustomerOrder', 'CustomerOrderID', slCOParam);
    adt1.First;
    objCO.PlantID := adt1.FieldByName('PlantID').AsInteger;
    objCO.BusinessApplicationID := adt1.FieldByName('BusinessApplicationID').AsInteger;


    DM.DataSetModify('Update ShippingSchedule set ShippingScheduleStatusID=' + IntToStr(ScheduleStatusID)
      + ' where customerorderid in (' + coID + ')');


    SendShippingScheduleByMail(originalStatusID, originalETD, IsHaveZSI);
    ShowMessage('Successfully create shipping schedule.');
    RefreshGrid(gridFrom, DBNavigator1.DataSource);
  finally
    adt1.Free;
    adtFrom.EnableControls;
  end;
end;


   {   DM.DataSetQuery(adt1, 'select top 1 ShippingScheduleStatusID,ETD,PlantID,'
        + 'BusinessApplicationID from ViewShippingSchedule where customerorderid in (' + coID + ')');
      objCO.PlantID := adt1.FieldByName('PlantID').AsInteger;
      objCO.BusinessApplicationID := adt1.FieldByName('BusinessApplicationID').AsInteger;    }
  {
procedure TfrmCustomerOrderProcess.OrderWaitingStatesChange(warMsg: string; WaitStates: string);
var
  i: integer;
  coID, strSql, originalWaitStates: string;
  adtFrom, adt1, adt2: TADODataSet;
  originalETD: TDateTime;
  IsHaveZSI: Boolean;
  objSendMail: TMgrSendMail;
  gridFrom: TDBGridEh;
begin
  gridFrom := gridData;
  adtFrom := adt_active;
  if DBNavigator1.DataSource = ds_active2 then
  begin
    gridFrom := gridData2;
    adtFrom := adt_active2;
  end;
  if not CheckIfSelectRows(gridData, true, warMsg) then exit;

  IsHaveZSI := False;
  objSendMail := TMgrSendMail.Create;
  adt1 := TADODataSet.Create(nil);
  adtFrom.DisableControls;
  try
    coID := '';
    for i := 0 to gridFrom.SelectedRows.Count - 1 do
    begin
      adtFrom.Bookmark := gridFrom.SelectedRows.items[I];
      coID := coID + adtFrom.FieldByName('CustomerOrderID').AsString + ',';
      if (UpperCase(Copy(adtFrom.FieldByName('Model').AsString, 1, 3)) = 'ZSI')
        and (IsHaveZSI = false) then
        IsHaveZSI := true;
    end;
    coID := copy(coID, 0, (length(coID) - 1));

    DM.DataSetQuery(adt1, 'select top 1 WaitingStates,ETD,PlantID,BusinessApplicationID from customerorder where customerorderid in (' + coID + ')');
    originalWaitStates := adt1.FieldByName('WaitingStates').AsString;
    originalETD := adt1.FieldByName('ETD').AsDateTime;

    strSql := 'EXEC usp_UpdateOrderWaintingStatesByCustomerOrderID @WaitingStates=''' + trim(WaitStates) + '''' + ',@IsPlanned=1'
      + ',@CustomerOrderID=''' + coID + '''';
    //if cbbTreeType.ItemIndex = 0 then
    begin
      adt2 := TADODataSet.Create(nil);
      DM.DataSetQuery(adt2, 'select (IsNull(max(LotNumber),0) + 1) as maxLotNumber from CustomerOrder');
      if adt2.FieldByName('maxLotNumber').AsString = '' then
      begin
        if MessageDlg('No Lot number generate, is continue?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
          exit;
      end;
      strSql := strSql + ',@LotNumber=''' + adt2.FieldByName('maxLotNumber').AsString + '''';
      adt2.Free;
    end;
    strSql := strSql + 'UPDATE TradingOrder SET	UpdateTime = getdate(),TradingOrderStatusID=6'
      + ' WHERE TradingOrderStatusID <> 8 AND CustomerOrderID in (' + coID + ')';
    DM.DataSetModify(strSql);

//    baid := adt1.FieldByName('BusinessApplicationID').AsInteger;
//    if adt1.FieldByName('PlantID').AsInteger <= 5 then
    if (adt1.FieldByName('PlantID').AsInteger = 1)
      and (adt1.FieldByName('BusinessApplicationID').AsInteger in [1, 6]) then
    begin
      if ((originalWaitStates = 'Waiting Shipment') and (WaitStates = 'Confirmed Shipment'))
        or ((FormatDateTime('yyyymmdd', originalETD) = FormatDateTime('yyyymmdd', Now)) and (FormatDateTime('HHMM', Now) >= '0700'))
        or ((FormatDateTime('yyyymmdd', originalETD) = FormatDateTime('yyyymmdd', Now + 1)) and (FormatDateTime('HHMM', Now) >= '1700'))
        or IsHaveZSI then
        objSendMail.CustomerOrderWaitingStatesChangeSendMail(coID);
    end;
    RefreshGrid(gridFrom, DBNavigator1.DataSource);
  finally
    adt1.Free;
    objSendMail.Free;
    adt_active.EnableControls;
  end;
end;
}

end.

