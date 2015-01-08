unit ufrmSalesCustomer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmDBBasicDT, PropFilerEh, MemTableDataEh, Db, ADODB,
  DataDriverEh, MemTableEh, Menus, PropStorageEh, ActnList, ImgList,
  GridsEh, DBGridEh, StdCtrls, ExtCtrls, DBCtrls, ComCtrls, ToolWin, Mask,
  DBCtrlsEh, DBLookupEh;

type
  TfrmSalesCustomer = class(TfrmDBBasicDT)
    adt_activeSalesID: TAutoIncField;
    adt_activeSalesPhone: TStringField;
    adt_activeSalesFax: TStringField;
    adt_activeSalesMail: TStringField;
    adt_activeBusinessApplicationID: TIntegerField;
    adt_activeLoginID: TIntegerField;
    adt_activeDisplayName: TStringField;
    adt_active2SalesCustomerID: TAutoIncField;
    adt_active2SalesID: TIntegerField;
    adt_active2CustomerID: TIntegerField;
    adt_active2CustomerNumber: TStringField;
    adt_active2CustomerName: TStringField;
    adt_business: TADODataSet;
    adt_login: TADODataSet;
    adt_customer: TADODataSet;
    adt_activeBusinessApplicationName1: TStringField;
    adt_active2CustomerName1: TStringField;
    adt_activeDisplayName1: TStringField;
    Label1: TLabel;
    Label2: TLabel;
    dbcbbSales: TDBLookupComboboxEh;
    dbcbbCustomer: TDBLookupComboboxEh;
    btnSave: TButton;
    ds_customer: TDataSource;
    adt_sales: TADODataSet;
    ds_sales: TDataSource;
    procedure gridDataEnter(Sender: TObject);
    procedure gridData2Enter(Sender: TObject);
    procedure adt_active2BeforePost(DataSet: TDataSet);
    procedure adt_activeBeforeDelete(DataSet: TDataSet);
    procedure adt_active2BeforeDelete(DataSet: TDataSet);
    procedure adt_activeAfterScroll(DataSet: TDataSet);
    procedure btnSaveClick(Sender: TObject);
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

uses DataModule, uMJ, ufrmDBBasic;

{$R *.dfm}

procedure TfrmSalesCustomer.SetData;
begin
  DM.DataSetQuery(adt_business, 'EXEC usp_GetBusinessApplication');
  DM.DataSetQuery(adt_login, 'EXEC usp_GetLogin @AccessLevel=''2,8,11'',@Col=''DisplayName''');
  if gvars.CurUserLevel = 2 then
  begin
    DM.DataSetQuery(adt_customer, 'EXEC usp_GetCustomer @Col=''CustomerNumber''');
    DM.DataSetQuery(adt_sales, 'select * from ViewSales');
    DM.DataSetQuery(adt_active, 'EXEC usp_GetSales');
  end
  else
  begin
    DM.DataSetQuery(adt_customer, 'EXEC usp_GetCustomer @PlantID=''' + gVars.CurUserPlantID + ''',@Col=''CustomerName''');
    DM.DataSetQuery(adt_active, 'EXEC usp_GetSales @LoginID=' + IntToStr(gVars.CurLoginID));
  end;
  DM.DataSetQuery(adt_active2, 'EXEC usp_GetSalesCustomer @SalesID=0');
end;

procedure TfrmSalesCustomer.SetUI;
begin
  inherited;
  GroupBox1.Caption := 'Sales';
  GroupBox2.Caption := 'Sales--Customer';
end;

procedure TfrmSalesCustomer.SetAccess;
begin
  inherited;
  tbtnOperation.Visible := false;
  if (gVars.CurUserLevel = 1) or (gVars.CurUserLevel = 11) then
  begin
    DBNavigator1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
      + [nbInsert, nbPost, nbEdit, nbDelete, nbCancel];
    gridData.ReadOnly := false;
    gridData2.ReadOnly := false;
  end
  else if gVars.CurUserLevel = 8 then
  begin
    DBNavigator1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
      + [nbPost, nbCancel];
    gridData.ReadOnly := false;
    gridData.FieldColumns['DisplayName1'].ReadOnly := true;
    gridData.FieldColumns['BusinessApplicationName1'].ReadOnly := true;
  end;
  if gVars.CurUserLevel = 2 then
    pnlBottom.Visible := true;
end;

procedure TfrmSalesCustomer.gridDataEnter(Sender: TObject);
begin
  inherited;
  if gVars.CurUserLevel = 8 then
    DBNavigator1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
      + [nbPost, nbCancel];
end;

procedure TfrmSalesCustomer.gridData2Enter(Sender: TObject);
begin
  inherited;
  if gVars.CurUserLevel = 8 then
    DBNavigator1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh];
end;

procedure TfrmSalesCustomer.adt_active2BeforePost(DataSet: TDataSet);
begin
  DataSet.FieldByName('SalesID').Value := gridData.DataSource.DataSet.FieldByName('SalesID').Value;
end;

procedure TfrmSalesCustomer.adt_activeBeforeDelete(DataSet: TDataSet);
begin
  DM.DataSetModify('EXEC usp_DeleteSales @SalesID=' + DataSet.fieldbyname('SalesID').AsString);
  DataSet.Active := false;
  DataSet.Active := true;
  gridData2.DataSource.DataSet.Active := false;
  gridData2.DataSource.DataSet.Active := true;
  Abort;
end;

procedure TfrmSalesCustomer.adt_active2BeforeDelete(DataSet: TDataSet);
begin
  DM.DataSetModify('EXEC usp_DeleteSalesCustomer @SalesID=' + DataSet.fieldbyname('SalesID').AsString);
  gridData2.DataSource.DataSet.Active := false;
  gridData2.DataSource.DataSet.Active := true;
  Abort;
end;

procedure TfrmSalesCustomer.adt_activeAfterScroll(DataSet: TDataSet);
begin
  if DataSet.FieldByName('SalesID').AsString = '' then
    DM.DataSetQuery(adt_active2, 'EXEC usp_GetSalesCustomer @SalesID=0')
  else
    DM.DataSetQuery(adt_active2, 'EXEC usp_GetSalesCustomer @SalesID=' + DataSet.FieldByName('SalesID').AsString);
end;

procedure TfrmSalesCustomer.btnSaveClick(Sender: TObject);
begin
  inherited;
  DM.DataSetModify('exec usp_InsertSalesCustomer @LoginID=' + VarToStr(dbcbbSales.Value) + ',@CustomerID=' + VarToStr(dbcbbCustomer.Value));
end;

{
  {sqlConst := '';
  if gVars.CurUserLevel = 8 then
    sqlConst := ' and l.LoginID=' + IntToStr(gVars.CurLoginID);
  DM.DataSetQuery(adt_active, format(sQuerySalesSQL, [sqlConst]));
  sqlConst := ' and sc.SalesID=0';
  DM.DataSetQuery(adt_active2, format(sQuerySalesCustomerSQL, [sqlConst]));


  //DM.DataSetQuery(adt_business, format(sQueryBusinessApplicationSQL, ['']));
procedure TfrmSalesCustomer.gridDataCellClick(Column: TColumnEh);
var
  SalesID: integer;
begin

  SalesID := gridData.DataSource.DataSet.FieldByName('SalesID').AsInteger;
  if SalesID = 0 then exit;
  sqlConst := ' and sc.SalesID=' + IntToStr(SalesID);
  sqlConst := sqlConst + ' order by c.CustomerName';
  DM.DataSetQuery(adt_active2, format(sQuerySalesCustomerSQL, [sqlConst]));

  DM.DataSetQuery(adt_active2, 'EXEC usp_GetSalesCustomer @SalesID='
    + gridData.DataSource.DataSet.FieldByName('SalesID').AsString);
  gridData2.DataSource.DataSet.Active := false;
  gridData2.DataSource.DataSet.Active := true;
end;

sqlSC := Format(sDeleteSalesCustomerSQL, [' and SalesID=' + DataSet.fieldbyname('SalesID').AsString]);
  sqlSales := Format(sDeleteSalesSQL, [' and SalesID=' + DataSet.fieldbyname('SalesID').AsString]);
  DM.DataSetModify(sqlSC + sqlSales);
  sqlSC := Format(sDeleteSalesCustomerSQL, [' and SalesCustomerID=' + DataSet.fieldbyname('SalesCustomerID').AsString]);
  DM.DataSetModify(sqlSC);
 
  sqlConst := ' and (l.AccessLevel=8 or l.AccessLevel=11) order by l.DisplayName';
  DM.DataSetQuery(adt_login, format(sQueryLoginSQL, [sqlConst]));
  sqlConst := ' and PlantID in' + gVars.CurUserPlantID;
  sqlConst := sqlConst + ' order by CustomerName';
  DM.DataSetQuery(adt_customer, format(sQueryCustomerSQL, [sqlConst]));

}

end.

