unit ufrmCustomerOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmDBBasicDT, PropFilerEh, DBGridEh, ComCtrls, StdCtrls, Mask,
  DBCtrlsEh, DBLookupEh, DB, ADODB, Menus, PropStorageEh, ActnList,
  ImgList, GridsEh, ExtCtrls, DBCtrls, ToolWin, uDMManager;

type
  TfrmCustomerOrder = class(TfrmDBBasicDT)
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
    Label15: TLabel;
    chkCurrency: TCheckBox;
    chkLogbook: TCheckBox;
    cbbIsLogbook: TComboBox;
    cbbCurrency: TComboBox;
    chkIsBonded: TCheckBox;
    cbbIsBonded: TComboBox;
    Export1: TMenuItem;
    procedure btnQueryClick(Sender: TObject);
    procedure dbcbbPlantChange(Sender: TObject);
    procedure MenuAddOrderCommentsClick(Sender: TObject);
    procedure tbtnOperationClick(Sender: TObject);
    procedure gridDataCellClick(Column: TColumnEh);
  private
    { Private declarations }
    objMgrBasic: TMgrBasicData;
    objMgrCO: TMgrCustomerOrder;
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

uses DataModule, uMJ, ufrmAddCustomerOrderComments, ufrmDBBasic;

{$R *.dfm}

procedure TfrmCustomerOrder.InitializeForm;
begin
  objMgrCO := TMgrCustomerOrder.Create;
  objMgrBasic := TMgrBasicData.Create;
  inherited;
end;

procedure TfrmCustomerOrder.DestoryForm;
begin
  inherited;
  objMgrBasic.Free;
  objMgrCO.Free;
end;

procedure TfrmCustomerOrder.SetData;
var
  sl1: TStringList;
begin
  sl1 := TStringList.Create;
  try
    with objMgrBasic do
    begin
      sl1.Clear;
      sl1.Append('CustomerOrderID=0');
      QueryBasicDataByParam(adt_active, 'ViewAllCustomerOrder', 'CustomerOrderID', sl1);
      sl1.Clear;
      sl1.Append('PlantID=' + objCurUser.PlantID);
      QueryBasicDataBySP(adt_plant, 'usp_GetPlant', sl1);
      sl1.Clear;
      sl1.Append('LoginID=' + IntToStr(objCurUser.LoginID));
      QueryBasicDataByParam(adt_business, 'ViewLoginBusinessApplication', 'BusinessApplicationID', sl1);
      QueryBasicDataByParam(adt_sales, 'ViewSales', 'SalesID', sl1);
      QueryBasicData(adt_productSeries, 'ProductSeries');
      QueryBasicData(adt_communicator, 'ViewCommunicator', 'CommunicatorID');
    end;
    objMgrCO.QueryCustomerOrderLog(adt_active2);
  finally
    sl1.Free;
  end;
end;

procedure TfrmCustomerOrder.SetUI;
var
  Year, Month, Day: Word;
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
  gridData.FieldColumns['TotalAmountUSD'].Footer.ValueType := fvtSum;
  DecodeDate(now, Year, Month, Day);
  cbbFYFrom.ItemIndex := cbbFYFrom.Items.IndexOf(IntToStr(year));
  cbbFYTo.ItemIndex := cbbFYTo.Items.IndexOf(IntToStr(year));
  cbbFMFrom.ItemIndex := 9;
  cbbFMTo.ItemIndex := 8;
end;

procedure TfrmCustomerOrder.SetAccess;
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
  if (objCurUser.AccessLevel in [8, 11]) then
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
  if objCurUser.AccessLevel = 2 then
  begin
    dbcbbCreator.KeyValue := objCurUser.LoginID;
    MenuAddOrderComments.Visible := true;
    chkCreator.Checked := true;
  end;
  if objCurUser.AccessLevel = 3 then
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
  if (objCurUser.AccessLevel in [4, 5, 8, 11, 13]) then
  begin
    chkPlant.Checked := true;
    chkPlant.Enabled := false;
  end;
  if (objCurUser.AccessLevel in [1, 2, 8, 10, 11, 13, 26])
    or (objCurUser.LoginID = 133) or (objCurUser.LoginID = 181) then
  begin
    for i := 0 to gridData.Columns.Count - 1 do
    begin
      if (gridData.Columns[i].FieldName = 'Price')
        or (gridData.Columns[i].FieldName = 'TotalAmount')
        or (gridData.Columns[i].FieldName = 'TotalAmountUSD')
        or (gridData.Columns[i].FieldName = 'Payment') then
        gridData.Columns[i].Visible := true;
    end;
  end
  else
  begin
    for i := 0 to gridData.Columns.Count - 1 do
    begin
      if (gridData.Columns[i].FieldName = 'Price')
        or (gridData.Columns[i].FieldName = 'TotalAmount')
        or (gridData.Columns[i].FieldName = 'TotalAmountUSD')
        or (gridData.Columns[i].FieldName = 'Payment') then
        gridData.Columns[i].Visible := false;
    end;
  end;
  if objCurUser.LoginID = 67 then
  begin
    for i := 0 to gridData.Columns.Count - 1 do
    begin
      if (gridData.Columns[i].FieldName = 'TotalAmount')
        or (gridData.Columns[i].FieldName = 'TotalAmountUSD') then
        gridData.Columns[i].Visible := true;
    end;
  end;
  cbbOrderStates.Items.Add('Shipped Order');
  cbbOrderStates.Items.Add('UnShipped Order');
  if objCurUser.LoginID = 181 then
    cbbOrderStates.Items.Add('Cancel Order');

  if objCurUser.LoginID in [67, 69, 88, 103] then
  begin
    gridData.FieldColumns['Price'].Visible := true;
    gridData.FieldColumns['TotalAmount'].Visible := true;
    gridData.FieldColumns['TotalAmountUSD'].Visible := true;
  end;

      {
  if objCurUser.AccessLevel = 6 then
  begin
    for i := 0 to gridData.Columns.Count - 1 do
    begin
      if (gridData.Columns[i].FieldName = 'CustomerOrderID')
        or (gridData.Columns[i].FieldName = 'CustomerOrderNumber')
        or (gridData.Columns[i].FieldName = 'Model')
        or (gridData.Columns[i].FieldName = 'CustomerOrderQuantity')
        or (gridData.Columns[i].FieldName = 'CustomerNumber')
        or (gridData.Columns[i].FieldName = 'CustomerName')
        or (gridData.Columns[i].FieldName = 'InvoiceNumber')
        or (gridData.Columns[i].FieldName = 'ATD')
        or (gridData.Columns[i].FieldName = 'PlantCode')
        or (gridData.Columns[i].FieldName = 'CustomerPurchaseOrderNumber')
        or (gridData.Columns[i].FieldName = 'Creator')
        or (gridData.Columns[i].FieldName = 'ATA') then
        gridData.Columns[i].Visible := true
      else
        gridData.Columns[i].Visible := false;
    end;
  end;        }
end;

procedure TfrmCustomerOrder.tbtnOperationClick(Sender: TObject);
begin
  //inherited;
  GroupBox2.Visible := not GroupBox2.Visible;
  Splitter1.Align := alTop;
  Splitter1.Align := alBottom;
end;

procedure TfrmCustomerOrder.dbcbbPlantChange(Sender: TObject);
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

procedure TfrmCustomerOrder.MenuAddOrderCommentsClick(Sender: TObject);
begin
  if gridData.DataSource.DataSet.RecordCount <> 0 then
  begin
    TfrmAddCustomerOrderComments.EdtFromList(TADODataSet(gridData.DataSource.DataSet));
  end
end;

procedure TfrmCustomerOrder.btnQueryClick(Sender: TObject);
var
  slCOParam: TStringList;
  adt3: TADODataSet;
begin
  inherited;
  RecoverGrid(gridData);
  slCOParam := TStringList.Create;
  try
    slCOParam.Clear;
    slCOParam.Values['IsAllCO'] := '1';

    if chkOrderStates.Checked then
    begin
      if cbbOrderStates.ItemIndex = 0 then
        slCOParam.Append('CustomerOrderStatesID=6');
      if cbbOrderStates.ItemIndex = 1 then
        slCOParam.Append('CustomerOrderStatesID=1,2,3,4,5');
      if cbbOrderStates.ItemIndex = 2 then
        slCOParam.Append('CustomerOrderStatesID=7');
    end;
    if chkCreator.Checked then
    begin
      if VarToStr(dbcbbCreator.Value) = '' then
      begin
        ShowMessage('Please select order creater.');
        Exit;
      end;
      if objCurUser.AccessLevel = 2 then
      begin
        slCOParam.Values['Roles'] := 'communicator';
        slCOParam.Values['LoginID'] := VarToStr(dbcbbCreator.keyValue);
      end;
    end;

    if chkFY.Checked then
    begin
      adt3 := TADODataSet.Create(nil);
      try
        DM.DataSetQuery3(adt3, 'select min(ActualDate) as ActualDate from FiscalCalendar where FiscalYear='
          + cbbFYFrom.Text + ' and FiscalMonth=' + cbbFMFrom.Text);
        slCOParam.Values['FYFrom'] := adt3.fieldbyname('ActualDate').AsString;
        DM.DataSetQuery3(adt3, 'select max(ActualDate) as ActualDate from FiscalCalendar where FiscalYear='
          + cbbFYTo.Text + ' and FiscalMonth=' + cbbFMTo.Text);
        slCOParam.Values['FYTo'] := adt3.fieldbyname('ActualDate').AsString;
      finally
        adt3.Free;
      end;
    end;

    if chkProductSeries.Checked then
    begin
      if VarToStr(dbcbbProductSeries.Value) = '' then
      begin
        ShowMessage('Please select product series.');
        Exit;
      end;
      slCOParam.Values['ProductSeriesID'] := VarToStr(dbcbbProductSeries.Value);
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
      slCOParam.Values['PlantID'] := VarToStr(dbcbbPlant.Value);
      if chkBusinessApplication.Checked then
      begin
        slCOParam.Values['BusinessApplicationID'] := VarToStr(dbcbbBusinessApplication.Value);
      end;
    end;
    if chkATD.Checked then
    begin
      slCOParam.Values['ATDFrom'] := FormatDateTime('YYYY-mm-dd', dtpATDFrom.DateTime);
      slCOParam.Values['ATDTo'] := FormatDateTime('YYYY-mm-dd', dtpATDTo.DateTime);
    end;
    if chkRTD.Checked then
    begin
      slCOParam.Values['RTDFrom'] := FormatDateTime('YYYY-mm-dd', dtpRTDFrom.DateTime);
      slCOParam.Values['RTDTo'] := FormatDateTime('YYYY-mm-dd', dtpRTDTo.DateTime);
    end;
    if chkETD.Checked then
    begin
      slCOParam.Values['ETDFrom'] := FormatDateTime('YYYY-mm-dd', dtpETDFrom.DateTime);
      slCOParam.Values['ETDTo'] := FormatDateTime('YYYY-mm-dd', dtpETDTo.DateTime);
    end;
    if chkContractDate.Checked then
    begin
      slCOParam.Values['ContractDateFrom'] := FormatDateTime('YYYY-mm-dd', dtpContractDateFrom.DateTime);
      slCOParam.Values['ContractDateTo'] := FormatDateTime('YYYY-mm-dd', dtpContractDateTo.DateTime);
    end;
    if chkChangeTime.Checked then
    begin
      slCOParam.Values['ChangeTimeFrom'] := FormatDateTime('YYYY-mm-dd', dtpChangeTimeFrom.DateTime);
      slCOParam.Values['ChangeTimeTo'] := FormatDateTime('YYYY-mm-dd', dtpChangeTimeTo.DateTime);
    end;
    if chkSales.Checked then
    begin
      if VarToStr(dbcbbSales.Value) = '' then
      begin
        ShowMessage('Please select sales.');
        Exit;
      end;
      if (objCurUser.AccessLevel = 8) or (objCurUser.AccessLevel = 11) then
        slCOParam.Values['Roles'] := 'sales';
    end;
    if (objCurUser.AccessLevel <> 1) and (objCurUser.AccessLevel <> 2) then
      slCOParam.Values['LoginID'] := IntToStr(objCurUser.LoginID);

    if chkCurrency.Checked then
      slCOParam.Values['Currency'] := cbbCurrency.Text;
    if chkIsBonded.Checked then
      slCOParam.Values['IsBonded'] := IntToStr(cbbIsBonded.Items.IndexOf(cbbIsBonded.Text));
    if chkLogbook.Checked then
      slCOParam.Values['IsLogbook'] := IntToStr(cbbIsLogbook.Items.IndexOf(cbbIsLogbook.Text));

    slCOParam.Values['Col'] := 'CustomerOrderID Desc';
    objMgrCO.QueryCustomerOrder(adt_active, nil, slCOParam);
  finally
    slCOParam.Free;
  end;
end;

procedure TfrmCustomerOrder.gridDataCellClick(Column: TColumnEh);
begin
  inherited;
  if gridData.DataSource.DataSet.RecordCount > 0 then
  begin
    GroupBox2.Caption := 'Change Log Of Customer Order ID : ' + gridData.DataSource.DataSet.fieldbyname('CustomerOrderID').AsString;
    DM.DataSetQuery(adt_active2, 'EXEC usp_GetCustomerOrderChangeLog @CustomerOrderID=' + gridData.DataSource.DataSet.fieldbyname('CustomerOrderID').AsString);
  end;
end;


end.

