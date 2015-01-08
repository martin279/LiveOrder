unit ufrmDelivery;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmDBBasicDT, PropFilerEh, DB, ADODB, Menus, PropStorageEh,
  ActnList, ImgList, GridsEh, DBGridEh, StdCtrls, ComCtrls, ExtCtrls,
  DBCtrls, ToolWin, uDMEntity, uDMManager;

type
  TfrmDelivery = class(TfrmDBBasicDT)
    Panel1: TPanel;
    btnQuery: TButton;
    chkInvoiceNum: TCheckBox;
    edtInvoiceNum: TEdit;
    adt_forwarder: TADODataSet;
    ds_forwarder: TDataSource;
    adt_active2CustomerOrderID: TAutoIncField;
    adt_active2CustomerOrderNumber: TStringField;
    adt_active2MNumber: TStringField;
    adt_active2InvoiceNumber: TStringField;
    adt_active2CustomerID: TIntegerField;
    adt_active2ModelID: TIntegerField;
    adt_active2Currency: TStringField;
    adt_active2Price: TBCDField;
    adt_active2CustomerOrderQuantity: TFloatField;
    adt_active2TotalAmount: TBCDField;
    adt_active2ContractDate: TDateTimeField;
    adt_active2RTD: TDateTimeField;
    adt_active2ETD: TDateTimeField;
    adt_active2ATD: TDateTimeField;
    adt_active2ETA: TDateTimeField;
    adt_active2ATA: TDateTimeField;
    adt_active2Remark: TStringField;
    adt_active2CustomerPurchaseOrderNumber: TStringField;
    adt_active2Payment: TStringField;
    adt_active2ReasonOfDelayID: TIntegerField;
    adt_active2CustomerOrderStatesID: TIntegerField;
    adt_active2ReasonOfDelayRemark: TStringField;
    adt_active2COGenerateTime: TDateTimeField;
    adt_active2COConfirmedTime: TDateTimeField;
    adt_active2LoginID: TIntegerField;
    adt_active2OINQCOQuantity: TIntegerField;
    adt_active2OINQReleaseCOQuantity: TIntegerField;
    adt_active2ActualReleaseCOQuantity: TIntegerField;
    adt_active2CustomerNumber: TStringField;
    adt_active2CustomerName: TStringField;
    adt_active2Origin: TStringField;
    adt_active2Country: TStringField;
    adt_active2ChineseName: TStringField;
    adt_active2PlantID: TIntegerField;
    adt_active2PlantCode: TStringField;
    adt_active2BusinessApplicationID: TIntegerField;
    adt_active2BusinessApplicationName: TStringField;
    adt_active2Model: TStringField;
    adt_active2ModelDescription: TStringField;
    adt_active2PlantID2: TIntegerField;
    adt_active2CustomerOrderStatesName: TStringField;
    adt_active2ReasonOfDelayDesc: TStringField;
    adt_active2DisplayName: TStringField;
    adt_activeCustomerOrderInvoiceID: TAutoIncField;
    adt_activeInvoiceNumber: TStringField;
    adt_activeForwarderName: TStringField;
    adt_activeFreightCost: TFloatField;
    adt_activeATD: TDateTimeField;
    adt_active3: TADODataSet;
    ds_active3: TDataSource;
    adt_active3CustomerOrderInvoiceID: TAutoIncField;
    adt_active3InvoiceNumber: TStringField;
    adt_active3ForwarderName: TStringField;
    adt_active3FreightCost: TFloatField;
    adt_active3ATD: TDateTimeField;
    GroupBox3: TGroupBox;
    Panel2: TPanel;
    btnUpload: TButton;
    gridData3: TDBGridEh;
    N2: TMenuItem;
    MenuShip: TMenuItem;
    MenuBack: TMenuItem;
    MenuSelectForShip: TMenuItem;
    adt_activeIsShipped: TBooleanField;
    adt_active3IsShipped: TBooleanField;
    procedure btnQueryClick(Sender: TObject);
    procedure btnUploadClick(Sender: TObject);
    procedure gridData3Enter(Sender: TObject);
    procedure MenuBackClick(Sender: TObject);
    procedure gridDataEnter(Sender: TObject);
    procedure MenuShipClick(Sender: TObject);
    procedure gridData3CellClick(Column: TColumnEh);
    procedure gridDataCellClick(Column: TColumnEh);
    procedure gridData2Enter(Sender: TObject);
    procedure MenuSelectForShipClick(Sender: TObject);
    procedure edtInvoiceNumKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  protected
    procedure SetData; override;
    procedure SetUI; override;
    procedure SetAccess; override;
  public
    { Public declarations }
  end;


implementation

uses DataModule, uMJ, uMainframeCustomerOrder, ufrmDBBasic;

{$R *.dfm}

{ TfrmDelivery }

procedure TfrmDelivery.SetData;
begin
  DM.DataSetQuery(adt_forwarder, 'EXEC usp_GetForwarder');
  DM.DataSetQuery(adt_active, 'EXEC usp_GetCustomerOrderInvoice @InvoiceNumber=0');
  DM.DataSetQuery(adt_active3, 'EXEC usp_GetCustomerOrderInvoice @InvoiceNumber=0');
  DM.DataSetQuery(adt_active2, 'EXEC usp_GetCustomerOrder @CustomerOrderID=1000000');
end;

procedure TfrmDelivery.SetUI;
begin
  inherited;
  GroupBox1.Caption := 'Shipping Order';
  chkInvoiceNum.Checked := true;
  chkInvoiceNum.Enabled := false;
  tbtnFilter.Enabled := false;
  btnUpload.Enabled := false;
end;

procedure TfrmDelivery.SetAccess;
begin
  inherited;
  DBNavigator1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
    + [nbEdit, nbCancel, nbPost];
  gridData.ReadOnly := false;
  gridData.FieldColumns['InvoiceNumber'].ReadOnly := true;
  gridData3.ReadOnly := true;
 { gridData3.ReadOnly := false;
  gridData3.FieldColumns['InvoiceNumber'].ReadOnly := true;      }
end;

procedure TfrmDelivery.gridDataEnter(Sender: TObject);
begin
  inherited;
  MenuShip.Visible := true;
  MenuBack.Visible := false;
  MenuSelectForShip.Visible := false;
end;

procedure TfrmDelivery.gridData3Enter(Sender: TObject);
begin
  MenuShip.Visible := false;
  MenuBack.Visible := true;
  MenuSelectForShip.Visible := false;
  DBNavigator1.DataSource := ds_active3;
  gridData.SelectedRows.Clear;
  gridData2.SelectedRows.Clear;
end;

procedure TfrmDelivery.gridData2Enter(Sender: TObject);
begin
  inherited;
  MenuShip.Visible := false;
  MenuBack.Visible := false;
  MenuSelectForShip.Visible := true;
end;

procedure TfrmDelivery.gridDataCellClick(Column: TColumnEh);
begin
  inherited;
  if gridData.DataSource.DataSet.RecordCount = 0 then
  begin
    ShowMessage('No data in this grid.');
    Abort;
  end;
end;

procedure TfrmDelivery.gridData3CellClick(Column: TColumnEh);
begin
  inherited;
  if gridData3.DataSource.DataSet.RecordCount = 0 then
  begin
    ShowMessage('No data in this grid.');
    Abort;
  end;
end;

procedure TfrmDelivery.btnQueryClick(Sender: TObject);
var
  sqlConst: string;
begin
  if Trim(edtInvoiceNum.Text) = '' then
  begin
    ShowMessage('Please input Invoice No.');
    Exit;
  end;
  sqlConst := '@PlantID=''' + objCurUser.PlantID + '''';
  if chkInvoiceNum.Checked then
  begin
    sqlConst := sqlConst + ',@InvoiceNumber = ''' + Trim(edtInvoiceNum.Text) + '''';
  end;
  //try
  btnUpload.Enabled := true;
  DM.DataSetQuery(adt_active, 'EXEC usp_GetCustomerOrderInvoice @IsATDNone=0,' + sqlConst);
  DM.DataSetQuery(adt_active3, 'EXEC usp_GetCustomerOrderInvoice @IsATDNone=1,' + sqlConst);
  DM.DataSetQuery(adt_active2, 'EXEC usp_GetCustomerOrder ' + sqlConst);
{  finally
    gridData.DataSource.DataSet.Active := false;
    gridData.DataSource.DataSet.Active := true;
    gridData2.DataSource.DataSet.Active := false;
    gridData2.DataSource.DataSet.Active := true;
    gridData3.DataSource.DataSet.Active := false;
    gridData3.DataSource.DataSet.Active := true;
  end;       }
end;

procedure TfrmDelivery.btnUploadClick(Sender: TObject);

  function checkCOShippment(InvoiceNumber: string): boolean;
  var
    adt1: TADODataset;
    qty1, qty2: integer;
  begin
    adt1 := TADODataset.Create(nil);
    try
      DM.DataSetQuery(adt1, 'select sum(Qty) as Qty from CustomerOrder_Shipment '
        + ' where CustomerOrderID in (select CustomerOrderID from CustomerOrder'
        + ' where InvoiceNumber=''' + InvoiceNumber + ''')');
      qty1 := adt1.fieldbyname('Qty').AsInteger;
      DM.DataSetQuery(adt1, 'select sum(CustomerOrderQuantity) as CustomerOrderQuantity from CustomerOrder'
        + ' where InvoiceNumber=''' + InvoiceNumber + '''');
      qty2 := adt1.fieldbyname('CustomerOrderQuantity').AsInteger;
      if qty1 = qty2 then
        result := true
      else
        result := false;
    finally
      adt1.Free;
    end;
  end;
var
  mfCO: TMainframeCustomerOrder;
  adt_mf: TADODataSet;
  plantID: integer;
  InvoiceNumber, ATDMF, ATD: string;
begin
  if (gridData.DataSource.DataSet.RecordCount = 0)
    or (gridData2.DataSource.DataSet.RecordCount = 0)
    or (Trim(edtInvoiceNum.Text) = '') then
  begin
    ShowMessage('Please query invoice by invoice no. first.');
    Exit;
  end;
  while not adt_active2.Eof do
  begin
    if formatdatetime('yyyy/mm/dd', VarToDateTime(adt_active2.FieldByName('ETD').Value)) > formatdatetime('yyyy/mm/dd', now) then
    begin
      ShowMessage('ETD must today or before today.');
      Exit;
    end;
    adt_active2.Next;
  end;

  if (objCurUser.LoginID = 208) then
    if not checkCOShippment(Trim(edtInvoiceNum.Text)) then
    begin
      ShowMessage('Scan qty not equal to customer order quantity.');
      Exit;
    end;

  gridData2.DataSource.DataSet.First;
  plantID := gridData2.DataSource.DataSet.fieldbyname('PlantID').AsInteger;

  adt_mf := TADODataSet.Create(nil);
  DM.DataSetQuery(adt_mf, 'EXEC usp_GetMainframeScreen @LoginID=' + IntToStr(objCurUser.LoginID)
    + ',@MainframeScreen=''SPLN'',@PlantID=' + IntToStr(plantID));
  if adt_mf.RecordCount = 0 then
  begin
    ShowMessage('You haven''t maintenance mainframe account in liveorder.');
    Exit;
  end;
  mfCO := TMainframeCustomerOrder.Create;
  mfCO.mfLogin := Trim(adt_mf.fieldbyname('MainframeLogin').AsString);
  mfCO.mfPassword := Trim(adt_mf.fieldbyname('MainframePassword').AsString);
  mfCO.mfInitial := Trim(adt_mf.fieldbyname('MainframeInitial').AsString);
  mfCO.mfPlant := Trim(adt_mf.fieldbyname('PlantCode').AsString);
  if (mfCO.mfLogin = '') or (mfCO.mfPassword = '')
    or (mfCO.mfPassword = '') or (mfCO.mfPlant = '') then
  begin
    ShowMessage('There haven''t mainframe user,password,or initial information in liveorder.');
    Exit;
  end;

  if not mfCO.MainframeLogin(mfCO.mfLogin, mfCO.mfPassword) then
  begin
    if MessageDlg('Phase-Login: Again to login?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      if not mfCO.MainframeLogin(mfCO.mfLogin, mfCO.mfPassword) then
      begin
        ShowMessage('Phase-Login: Please login again.');
        exit;
      end;
    end
    else
      exit;
  end;
  if not mfCO.MainframeScreenSelect('SPLN') then
  begin
    ShowMessage('Phase-Select Screen: Please Select Screen again.');
    exit;
  end;

  gridData.DataSource.DataSet.First;
  gridData.DataSource.DataSet.DisableControls;
  gridData2.DataSource.DataSet.DisableControls;
  gridData3.DataSource.DataSet.DisableControls;
  try
    if gridData.DataSource.DataSet.FieldByName('ForwarderName').AsString = '' then
    begin
      ShowMessage('Please input ForwarderName for ID: '
        + gridData.DataSource.DataSet.FieldByName('CustomerOrderInvoiceID').AsString);
      exit;
    end;
    if gridData.DataSource.DataSet.FieldByName('FreightCost').AsString = '' then
    begin
      ShowMessage('Please input FreightCost for ID: '
        + gridData.DataSource.DataSet.FieldByName('CustomerOrderInvoiceID').AsString);
      exit;
    end;
    if not mfCO.SPLNLogin(mfCO.mfPlant, mfCO.mfInitial, mfCO.mfPassword) then
    begin
      ShowMessage('Phase-SPLN MainMenu : Error at SPLN MainMenu.');
      exit;
    end;
    //InvoiceNumber := gridData.DataSource.DataSet.fieldbyname('InvoiceNumber').AsString;
    InvoiceNumber := Trim(edtInvoiceNum.Text);
    if gridData.DataSource.DataSet.fieldbyname('ATD').AsString = '' then
    begin
      ATDMF := FormatDateTime('mmddYYYY', now);
      ATD := FormatDateTime('YYYY-mm-dd', now);
    end
    else
    begin
      ATDMF := FormatDateTime('mmddYYYY', gridData.DataSource.DataSet.fieldbyname('ATD').AsDateTime);
      ATD := FormatDateTime('YYYY-mm-dd', gridData.DataSource.DataSet.fieldbyname('ATD').AsDateTime);
    end;
    if not mfCO.ShipOrderAtSPLN(
      InvoiceNumber, ATDMF,
      gridData.DataSource.DataSet.fieldbyname('ForwarderName').AsString,
      gridData.DataSource.DataSet.fieldbyname('FreightCost').AsString) then
    begin
      ShowMessage('Error at shipped order.');
      exit;
    end
    else
    begin
      DM.DataSetModify('EXEC usp_UpdateCustomerOrderATD '
        + ' @InvoiceNumber=''' + InvoiceNumber + ''''
        + ',@ATD=''' + ATD + ''''
        + ',@LoginID=' + IntToStr(objCurUser.LoginID));
    end;
  finally
    mfCO.SPLNExitToMainScreen;
    gridData.DataSource.DataSet.EnableControls;
    gridData2.DataSource.DataSet.EnableControls;
    gridData3.DataSource.DataSet.EnableControls;
    gridData.DataSource.DataSet.Active := false;
    gridData.DataSource.DataSet.Active := true;
    gridData2.DataSource.DataSet.Active := false;
    gridData2.DataSource.DataSet.Active := true;
    gridData3.DataSource.DataSet.Active := false;
    gridData3.DataSource.DataSet.Active := true;
    mfCO.Free;
  end;
  if (gridData.DataSource.DataSet.RecordCount = 0)
    and (gridData3.DataSource.DataSet.RecordCount <> 0) then
  begin
    while not gridData2.DataSource.DataSet.Eof do
    begin
      if gridData2.DataSource.DataSet.fieldbyname('CustomerOrderStatesID').AsInteger <> 6 then
      begin
        ShowMessage('Error at change order states,Please change order states manually.');
        Exit;
      end;
      gridData2.DataSource.DataSet.Next;
    end;
  end;
end;

procedure TfrmDelivery.MenuShipClick(Sender: TObject);
var
  InvoiceNumber, ATD: string;
begin
  if (gridData.DataSource.DataSet.RecordCount = 0)
    or (Trim(edtInvoiceNum.Text) = '') then
  begin
    ShowMessage('Please query invoice by invoice no. first.');
    Exit;
  end;
  if MessageDlg('Is Ship?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    gridData.DataSource.DataSet.First;
    gridData.DataSource.DataSet.DisableControls;
    gridData2.DataSource.DataSet.DisableControls;
    gridData3.DataSource.DataSet.DisableControls;
    try
      if gridData.DataSource.DataSet.FieldByName('ATD').AsString = '' then
      begin
        if not (gridData.DataSource.DataSet.State in [dsEdit]) then
          gridData.DataSource.DataSet.Edit;
        gridData.DataSource.DataSet.FieldByName('ATD').Value := Now;
        gridData.DataSource.DataSet.Post;
        TADODataSet(gridData.DataSource.DataSet).UpdateBatch();
        ATD := FormatDateTime('YYYY-mm-dd', now);
      end
      else
        ATD := FormatDateTime('YYYY-mm-dd', gridData.DataSource.DataSet.fieldbyname('ATD').AsDateTime);
      InvoiceNumber := Trim(edtInvoiceNum.Text);
      DM.DataSetModify('EXEC usp_UpdateCustomerOrderStatesByInvoiceNum @CustomerOrderStatesID=6'
        + ',@InvoiceNumber=''' + InvoiceNumber + ''''
        + ',@ATD=''' + ATD + '''');
    finally
      gridData.DataSource.DataSet.EnableControls;
      gridData2.DataSource.DataSet.EnableControls;
      gridData3.DataSource.DataSet.EnableControls;
      gridData.DataSource.DataSet.Active := false;
      gridData.DataSource.DataSet.Active := true;
      gridData2.DataSource.DataSet.Active := false;
      gridData2.DataSource.DataSet.Active := true;
      gridData3.DataSource.DataSet.Active := false;
      gridData3.DataSource.DataSet.Active := true;
    end;
  end;
end;

procedure TfrmDelivery.MenuBackClick(Sender: TObject);
var
  InvoiceNumber: string;
begin
  if (gridData3.DataSource.DataSet.RecordCount = 0)
    or (Trim(edtInvoiceNum.Text) = '') then
  begin
    ShowMessage('Please query invoice by invoice no. first.');
    Exit;
  end;
  if MessageDlg('Is Back?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    gridData3.DataSource.DataSet.First;
    gridData.DataSource.DataSet.DisableControls;
    gridData2.DataSource.DataSet.DisableControls;
    gridData3.DataSource.DataSet.DisableControls;
    try
      if not (gridData3.DataSource.DataSet.State in [dsEdit]) then
        gridData3.DataSource.DataSet.Edit;
      gridData3.DataSource.DataSet.FieldByName('ATD').Value := null;
      gridData3.DataSource.DataSet.Post;
      TADODataSet(gridData3.DataSource.DataSet).UpdateBatch();
      InvoiceNumber := Trim(edtInvoiceNum.Text);
      DM.DataSetModify('EXEC usp_UpdateCustomerOrderStatesByInvoiceNum @CustomerOrderStatesID=5'
        + ',@InvoiceNumber=''' + InvoiceNumber + '''');
    finally
      gridData.DataSource.DataSet.EnableControls;
      gridData2.DataSource.DataSet.EnableControls;
      gridData3.DataSource.DataSet.EnableControls;
      gridData.DataSource.DataSet.Active := false;
      gridData.DataSource.DataSet.Active := true;
      gridData2.DataSource.DataSet.Active := false;
      gridData2.DataSource.DataSet.Active := true;
      gridData3.DataSource.DataSet.Active := false;
      gridData3.DataSource.DataSet.Active := true;
    end;
  end;
end;

procedure TfrmDelivery.MenuSelectForShipClick(Sender: TObject);
var
  invoiceNumber: string;
begin
  inherited;
  if gridData2.DataSource.DataSet.RecordCount = 0 then
  begin
    ShowMessage('No data in this grid.');
    Exit;
  end;
  gridData2.DataSource.DataSet.First;
  invoiceNumber := gridData2.DataSource.DataSet.fieldbyname('InvoiceNumber').AsString;
  try
    DM.DataSetModify(' EXEC usp_InsertCustomerOrderInvoice @InvoiceNumber=''' + invoiceNumber + ''''
      + ',@FreightCost=0');
  finally
    edtInvoiceNum.Text := invoiceNumber;
    btnQuery.Click;
  end;
end;

procedure TfrmDelivery.edtInvoiceNumKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
    btnQuery.Click;
end;

end.

