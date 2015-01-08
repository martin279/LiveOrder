unit ufrmCustomerOrderSYModel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmDBBasicDT, PropFilerEh, DBGridEh, ComCtrls, StdCtrls, Mask,
  DBCtrlsEh, DBLookupEh, DB, ADODB, Menus, PropStorageEh, ActnList,
  ImgList, GridsEh, ExtCtrls, DBCtrls, ToolWin;

type
  TfrmCustomerOrderSYModel = class(TfrmDBBasicDT)
    adt_productSeries: TADODataSet;
    ds_productSeries: TDataSource;
    adt_plant: TADODataSet;
    ds_plant: TDataSource;
    adt_communicator: TADODataSet;
    adt_communicatorCommunicatorID: TAutoIncField;
    adt_communicatorCommunicatorCode: TStringField;
    adt_communicatorCommunicatorPhone: TStringField;
    adt_communicatorCommunicatorFax: TStringField;
    adt_communicatorCommunicatorMail: TStringField;
    adt_communicatorLoginID: TIntegerField;
    adt_communicatorDisplayName: TStringField;
    ds_communicator: TDataSource;
    adt_business: TADODataSet;
    ds_business: TDataSource;
    adt_sales: TADODataSet;
    ds_sales: TDataSource;
    Panel2: TPanel;
    ScrollBox1: TScrollBox;
    Label8: TLabel;
    Label7: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    btnQuery: TButton;
    dbcbbCreator: TDBLookupComboboxEh;
    dbcbbProductSeries: TDBLookupComboboxEh;
    dbcbbPlant: TDBLookupComboboxEh;
    chkFY: TCheckBox;
    chkFM: TCheckBox;
    chkPlant: TCheckBox;
    chkProductSeries: TCheckBox;
    chkRTD: TCheckBox;
    chkETD: TCheckBox;
    chkATD: TCheckBox;
    chkContractDate: TCheckBox;
    chkCreator: TCheckBox;
    cbbFYFrom: TComboBox;
    cbbFYTo: TComboBox;
    cbbFMFrom: TComboBox;
    cbbFMTo: TComboBox;
    dtpRTDFrom: TDateTimePicker;
    dtpRTDTo: TDateTimePicker;
    dtpETDFrom: TDateTimePicker;
    dtpETDTo: TDateTimePicker;
    dtpATDTo: TDateTimePicker;
    dtpContractDateFrom: TDateTimePicker;
    dtpContractDateTo: TDateTimePicker;
    chkBusinessApplication: TCheckBox;
    dbcbbBusinessApplication: TDBLookupComboboxEh;
    chkSales: TCheckBox;
    dbcbbSales: TDBLookupComboboxEh;
    chkOrderStates: TCheckBox;
    cbbOrderStates: TComboBox;
    chkChangeTime: TCheckBox;
    dtpChangeTimeFrom: TDateTimePicker;
    dtpChangeTimeTo: TDateTimePicker;
    dtpATDFrom: TDateTimePicker;
    N2: TMenuItem;
    MenuAddOrderComments: TMenuItem;
    adt_activeCustomerOrderID: TAutoIncField;
    adt_activeCustomerOrderNumber: TStringField;
    adt_activeMNumber: TStringField;
    adt_activeInvoiceNumber: TStringField;
    adt_activeCustomerID: TIntegerField;
    adt_activeModelID: TIntegerField;
    adt_activeCurrency: TStringField;
    adt_activePrice: TBCDField;
    adt_activeCustomerOrderQuantity: TFloatField;
    adt_activeTotalAmount: TBCDField;
    adt_activeContractDate: TDateTimeField;
    adt_activeRTD: TDateTimeField;
    adt_activeETD: TDateTimeField;
    adt_activeATD: TDateTimeField;
    adt_activeETA: TDateTimeField;
    adt_activeATA: TDateTimeField;
    adt_activeRemark: TStringField;
    adt_activeCustomerPurchaseOrderNumber: TStringField;
    adt_activePayment: TStringField;
    adt_activeReasonOfDelayID: TIntegerField;
    adt_activeCustomerOrderStatesID: TIntegerField;
    adt_activeReasonOfDelayRemark: TStringField;
    adt_activeCOGenerateTime: TDateTimeField;
    adt_activeCOConfirmedTime: TDateTimeField;
    adt_activeLoginID: TIntegerField;
    adt_activeCustomerNumber: TStringField;
    adt_activeCustomerName: TStringField;
    adt_activeOrigin: TStringField;
    adt_activeCountry: TStringField;
    adt_activeChineseName: TStringField;
    adt_activePlantID: TIntegerField;
    adt_activePlantCode: TStringField;
    adt_activeBusinessApplicationID: TIntegerField;
    adt_activeBusinessApplicationName: TStringField;
    adt_activeModel: TStringField;
    adt_activeModelDescription: TStringField;
    adt_activeCustomerOrderStatesName: TStringField;
    adt_activeReasonOfDelayDesc: TStringField;
    adt_activeDisplayName: TStringField;
    adt_active2CustomerOrderChangeLogID: TAutoIncField;
    adt_active2CustomerOrderID: TIntegerField;
    adt_active2CustomerOrderQuantity: TFloatField;
    adt_active2RTD: TDateTimeField;
    adt_active2ETD: TDateTimeField;
    adt_active2ChangeField: TStringField;
    adt_active2ChangeTime: TDateTimeField;
    adt_activeSYPlantNumber: TStringField;
    adt_activeModelOption: TStringField;
    adt_activeWO_VAT: TBCDField;
    adt_activeTotalAmountUSD: TBCDField;
    adt_activeRTD2: TStringField;
    adt_activeETD2: TStringField;
    adt_activeCOGenerateTime2: TStringField;
    adt_activeInlandFree: TBCDField;
    adt_activeSeaFreight: TBCDField;
    adt_activeInvoiceAmount: TBCDField;
    adt_activeOINQCOQuantity: TIntegerField;
    adt_activeOINQReleaseCOQuantity: TIntegerField;
    adt_activeActualReleaseCOQuantity: TIntegerField;
    adt_activeIsRebate: TBooleanField;
    adt_activeSystemPOID: TStringField;
    adt_activeSYCOSates: TIntegerField;
    adt_activeRegion: TStringField;
    adt_activeArea: TStringField;
    adt_activeProductSeriesID: TIntegerField;
    adt_activeProductSeriesName: TStringField;
    adt_activePlantID2: TIntegerField;
    adt_activeFiscalYear: TIntegerField;
    adt_activeFiscalMonth: TIntegerField;
    procedure btnQueryClick(Sender: TObject);
    procedure dbcbbPlantChange(Sender: TObject);
    procedure MenuAddOrderCommentsClick(Sender: TObject);
    procedure tbtnOperationClick(Sender: TObject);
    procedure actGridSTFilterExecute(Sender: TObject);
    procedure gridDataCellClick(Column: TColumnEh);
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

uses DataModule, uMJ, ufrmAddCustomerOrderComments, ufrmDBBasic;

{$R *.dfm}

procedure TfrmCustomerOrderSYModel.SetData;
begin
  DM.DataSetQuery4(adt_plant, 'EXEC usp_GetPlant @PlantID=''' + gvars.CurUserPlantID + '''');
  DM.DataSetQuery4(adt_business, 'EXEC usp_GetBusinessApplication @LoginID=' + IntToStr(gvars.CurLoginID));
  DM.DataSetQuery4(adt_productSeries, 'EXEC usp_GetProductSeries @PlantID=''' + gVars.CurUserPlantID + '''');
  DM.DataSetQuery4(adt_communicator, 'EXEC usp_GetCommunicator');
  DM.DataSetQuery4(adt_sales, 'EXEC usp_GetSales @LoginID=' + IntToStr(gvars.CurLoginID));
  DM.DataSetQuery4(adt_active, 'EXEC usp_GetCustomerOrderModel @CustomerOrderID = 1000000');
  DM.DataSetQuery4(adt_active2, 'EXEC usp_GetCustomerOrderModelChangeLog @CustomerOrderID = 1000000');
end;

procedure TfrmCustomerOrderSYModel.SetUI;
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
  dtpChangeTimeFrom.DateTime := now;
  dtpChangeTimeTo.DateTime := now;
  chkBusinessApplication.Enabled := false;
  dbcbbBusinessApplication.Enabled := false;
  dbcbbBusinessApplication.Color := clBtnFace;
  gridData.FieldColumns['CustomerOrderQuantity'].Footer.ValueType := fvtSum;
  gridData.FieldColumns['TotalAmount'].Footer.ValueType := fvtSum;
end;

procedure TfrmCustomerOrderSYModel.SetAccess;
var
  i: integer;
begin
  inherited;
  GroupBox2.Visible := false;
  MenuAddOrderComments.Visible := false;
  gridData.Options := [dgEditing, dgTitles, dgIndicator, dgColumnResize
    , dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgRowSelect
    , dgConfirmDelete, dgCancelOnExit, dgMultiSelect];
  chkSales.Enabled := false;
  dbcbbSales.Enabled := false;
  if gVars.CurUserLevel = 8 then
  begin
    chkCreator.Enabled := false;
    dbcbbCreator.Enabled := false;
    dbcbbCreator.Color := clBtnFace;
    chkSales.Checked := true;
    chkSales.Enabled := false;
    dbcbbSales.Enabled := false;
    dbcbbSales.Color := clBtnFace;
    if adt_sales.fieldbyname('SalesID').AsString <> '' then
    begin
      dbcbbSales.Value := adt_sales.fieldbyname('SalesID').Value;
    end;
  end;
  if gVars.CurUserLevel = 2 then
  begin
    dbcbbCreator.KeyValue := gVars.CurLoginID;
    MenuAddOrderComments.Visible := true;
    chkCreator.Checked := true;
  end;
  if gVars.CurUserLevel = 3 then
  begin
    chkPlant.Checked := true;
    chkPlant.Enabled := false;
    chkBusinessApplication.Checked := true;
    chkBusinessApplication.Enabled := false;
    chkOrderStates.Checked := true;
    if gVars.CurUserPlantIDSet = [1] then
    begin
      dbcbbPlant.Value := 1;
      if gVars.CurUserBusinessID = '1' then
        dbcbbBusinessApplication.Value := 1;
      if gVars.CurUserBusinessID = '2' then
        dbcbbBusinessApplication.Value := 2;
    end;
  end;
  if ((gVars.CurUserLevel = 4) or (gVars.CurUserLevel = 5)
    or (gVars.CurUserLevel = 8) or (gVars.CurUserLevel = 11) or (gVars.CurUserLevel = 13)) then
  begin
    chkPlant.Checked := true;
    chkPlant.Enabled := false;
  end;
  if (gVars.CurUserLevel = 2)
    or (gVars.CurUserLevel = 8)
    or (gVars.CurUserLevel = 10)
    or (gVars.CurUserLevel = 11)
    or (gVars.CurUserLevel = 13) then
  begin
    for i := 0 to gridData.Columns.Count - 1 do
    begin
      if (gridData.Columns[i].FieldName = 'Currency')
        or (gridData.Columns[i].FieldName = 'Price')
        or (gridData.Columns[i].FieldName = 'TotalAmount')
        or (gridData.Columns[i].FieldName = 'Payment') then
        gridData.Columns[i].Visible := true;
    end;
  end
  else
  begin
    for i := 0 to gridData.Columns.Count - 1 do
    begin
      if (gridData.Columns[i].FieldName = 'Currency')
        or (gridData.Columns[i].FieldName = 'Price')
        or (gridData.Columns[i].FieldName = 'TotalAmount')
        or (gridData.Columns[i].FieldName = 'Payment') then
        gridData.Columns[i].Visible := false;
    end;
  end;
end;

procedure TfrmCustomerOrderSYModel.tbtnOperationClick(Sender: TObject);
begin
  //inherited;
  GroupBox2.Visible := not GroupBox2.Visible;
  Splitter1.Align := alTop;
  Splitter1.Align := alBottom;
end;

procedure TfrmCustomerOrderSYModel.dbcbbPlantChange(Sender: TObject);
begin
  if VarToStr(dbcbbPlant.Value) = '1' then
  begin
    chkBusinessApplication.Enabled := true;
    dbcbbBusinessApplication.Enabled := true;
    dbcbbBusinessApplication.Color := clWindow;
  end
  else
  begin
    chkBusinessApplication.Checked := false;
    chkBusinessApplication.Enabled := false;
    dbcbbBusinessApplication.Enabled := false;
    dbcbbBusinessApplication.Color := clBtnFace;
  end;
end;

procedure TfrmCustomerOrderSYModel.MenuAddOrderCommentsClick(Sender: TObject);
begin
  if gridData.DataSource.DataSet.RecordCount <> 0 then
  begin
    TfrmAddCustomerOrderComments.EdtFromList(TADODataSet(gridData.DataSource.DataSet));
  end
end;

procedure TfrmCustomerOrderSYModel.btnQueryClick(Sender: TObject);
var
  sqlConst, pRoles, PStates: string;
begin
  inherited;
  gridData.ClearFilter;
  gridData.ApplyFilter;
  gridData.SelectedRows.Clear;
  gridData.Selection.Clear;
  gridData.DataSource.DataSet := nil;
  gridData.DataSource.DataSet := adt_active;

  sqlConst := ' @IsAllCO=1';
  pRoles := '';
  PStates := '';
  if chkOrderStates.Checked then
  begin
    if cbbOrderStates.ItemIndex = 0 then
      PStates := ',@CustomerOrderStatesID=''6''';
    if cbbOrderStates.ItemIndex = 1 then
      PStates := ',@CustomerOrderStatesID=''1,2,3,4,5''';
  end;
  if chkCreator.Checked then
  begin
    if VarToStr(dbcbbCreator.Value) = '' then
    begin
      ShowMessage('Please select order creater.');
      Exit;
    end;        
    if gVars.CurUserLevel = 2 then
      pRoles := ',@Roles=''communicator'',@LoginID=' + VarToStr(dbcbbCreator.keyValue);
    //sqlConst := sqlConst + ',@LoginID=' + VarToStr(dbcbbCreator.Value);
  end;
{  if chkFY.Checked then
    sqlConst := sqlConst + ' and r.FiscalYear = ' + cbbFY.Value + '';
  if chkFM.Checked then
    sqlConst := sqlConst + ' and r.FiscalMonth = ' + cbbFM.Value + '';
 }
  if chkProductSeries.Checked then
  begin
    if VarToStr(dbcbbProductSeries.Value) = '' then
    begin
      ShowMessage('Please select product series.');
      Exit;
    end;
    sqlConst := sqlConst + ',@ProductSeriesID=' + VarToStr(dbcbbProductSeries.Value);
  end;
  if chkPlant.Checked then
  begin
    if VarToStr(dbcbbPlant.Value) = '' then
    begin
      ShowMessage('Please select plant.');
      Exit;
    end;
    if ((VarToStr(dbcbbPlant.Value) = '1')
      and (chkBusinessApplication.Checked = true)
      and (VarToStr(dbcbbBusinessApplication.Value) = '')) then
    begin
      ShowMessage('Please select Business Application.');
      Exit;
    end;
    sqlConst := sqlConst + ',@PlantID=' + VarToStr(dbcbbPlant.Value);
    if chkBusinessApplication.Checked then
    begin
      sqlConst := sqlConst + ',@BusinessApplicationID=' + VarToStr(dbcbbBusinessApplication.Value);
    end;
  end;
  if chkATD.Checked then
    sqlConst := sqlConst + ',@ATDFrom=''' + FormatDateTime('YYYY-mm-dd', dtpATDFrom.DateTime) + ''''
      + ',@ATDTo=''' + FormatDateTime('YYYY-mm-dd', dtpATDTo.DateTime) + '''';
  if chkRTD.Checked then
    sqlConst := sqlConst + ',@RTDFrom=''' + FormatDateTime('YYYY-mm-dd', dtpRTDFrom.DateTime) + ''''
      + ',@RTDTo=''' + FormatDateTime('YYYY-mm-dd', dtpRTDTo.DateTime) + '''';
  if chkETD.Checked then
    sqlConst := sqlConst + ',@ETDFrom=''' + FormatDateTime('YYYY-mm-dd', dtpETDFrom.DateTime) + ''''
      + ',@ETDTo=''' + FormatDateTime('YYYY-mm-dd', dtpETDTo.DateTime) + '''';
  if chkContractDate.Checked then
    sqlConst := sqlConst + ',@ContractDateFrom=''' + FormatDateTime('YYYY-mm-dd', dtpContractDateFrom.DateTime) + ''''
      + ',@ContractDateTo=''' + FormatDateTime('YYYY-mm-dd', dtpContractDateTo.DateTime) + '''';
  if chkChangeTime.Checked then
    sqlConst := sqlConst + ',@ChangeTimeFrom=''' + FormatDateTime('YYYY-mm-dd', dtpChangeTimeFrom.DateTime) + ''''
      + ',@ChangeTimeTo=''' + FormatDateTime('YYYY-mm-dd', dtpChangeTimeTo.DateTime) + '''';
  if chkSales.Checked then
  begin
    if VarToStr(dbcbbSales.Value) = '' then
    begin
      ShowMessage('Please select sales.');
      Exit;
    end;            
   // if gVars.CurUserLevel = 2 then
   //   pRoles := ',@Roles=''communicator'',@LoginID=' + IntToStr(dbcbbSales.Value);
    if gVars.CurUserLevel = 8 then
      pRoles := ',@Roles=''sales'',@LoginID=' + IntToStr(gvars.CurLoginID);
  end;

  sqlConst := 'EXEC usp_GetCustomerOrderModel ' + sqlConst + pRoles + PStates + ',@Col=''ContractDate desc''';
  try
    DM.DataSetQuery4(adt_active, sqlConst);
  except on E: Exception do
      MessageDlg(E.Message, mtWarning, [mbOK], 0);
  end;
end;

procedure TfrmCustomerOrderSYModel.actGridSTFilterExecute(Sender: TObject);
begin
  //inherited;
  gridData.STFilter.Visible := not gridData.STFilter.Visible;
  if gridData.STFilter.Visible then
  begin
    gridData.ClearFilter;
    gridData.ApplyFilter;
  end;
end;

procedure TfrmCustomerOrderSYModel.gridDataCellClick(Column: TColumnEh);
begin
  inherited;
  if gridData.DataSource.DataSet.RecordCount > 0 then
  begin
    GroupBox2.Caption := 'Change Log Of Customer Order ID : ' + gridData.DataSource.DataSet.fieldbyname('CustomerOrderID').AsString;
    DM.DataSetQuery4(adt_active2, 'EXEC usp_GetCustomerOrderModelChangeLog @CustomerOrderID=' + gridData.DataSource.DataSet.fieldbyname('CustomerOrderID').AsString);
  end;
end;

end.

