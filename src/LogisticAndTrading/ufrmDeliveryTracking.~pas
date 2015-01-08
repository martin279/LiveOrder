unit ufrmDeliveryTracking;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmDBBasicPrn, PropFilerEh, ActnList, PrnDbgeh, ImgList, DB,
  ADODB, Menus, PropStorageEh, DBCtrls, ComCtrls, ToolWin, GridsEh,
  DBGridEh, PrViewEh, StdCtrls, ExtCtrls, DBCtrlsEh, Mask, DBLookupEh;

type
  TfrmDeliveryTracking = class(TfrmDBBasicPrn)
    ds_Invoice: TDataSource;
    adt_Invoice: TADODataSet;
    ds_co: TDataSource;
    adt_co: TADODataSet;
    GroupBox2: TGroupBox;
    dbcbbInvoice: TDBLookupComboboxEh;
    Label22: TLabel;
    Button1: TButton;
    Panel1: TPanel;
    gridCO: TDBGridEh;
    Panel2: TPanel;
    gboxLogistic: TGroupBox;
    Label20: TLabel;
    Label27: TLabel;
    Label26: TLabel;
    dtpOnBoardDate: TDBDateTimeEditEh;
    dtpATA: TDBDateTimeEditEh;
    edtLanding: TEdit;
    btnSave: TButton;
    procedure btnSaveClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
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

uses DataModule, uMJ, uDMManager, ufrmDBBasic;

{$R *.dfm}

{ TfrmDeliveryTracking }

procedure TfrmDeliveryTracking.SetData;
begin
  inherited;
  if objCurUser.LoginID = 178 then
    DM.DataSetQuery(adt_Invoice, 'select distinct InvoiceNumber from CustomerOrder'
      + ' where  CustomerOrderStatesID<7 and  len(InvoiceNumber)<>0'
      + ' and left(InvoiceNumber,1)=''z'' and PlantID in (3,4,5) and Upper(Currency) =''USD'''
      + ' and InvoiceNumber not in (select InvoiceNumber from CustomerOrderDeliveryTracking where len(BillOfLanding)<>0)')
  else if objCurUser.LoginID = 154 then
    DM.DataSetQuery(adt_Invoice, 'select distinct InvoiceNumber from CustomerOrder'
      + ' where  CustomerOrderStatesID<7 and len(InvoiceNumber)<>0'
      + '  and left(InvoiceNumber,1)=''z'' and PlantID in (3,4,5) and Upper(Currency) =''RMB'''
      + ' and InvoiceNumber not in (select InvoiceNumber from CustomerOrderDeliveryTracking where len(BillOfLanding)<>0)')
  else
    DM.DataSetQuery(adt_Invoice, 'select distinct InvoiceNumber from CustomerOrder'
      + ' where  CustomerOrderStatesID<7 and len(InvoiceNumber)<>0'
      + ' and PlantID in (3,4,5)');
{  if objCurUser.AccessLevel in [5, 23] then
  begin
    DM.DataSetQuery(adt_active, 'select * from ViewCustomerOrderDeliveryTracking'
      + ' where Currency=''USD'' order by InvoiceNumber desc');
  end
  else if objCurUser.AccessLevel in [18] then
  begin
    DM.DataSetQuery(adt_active, 'select * from ViewCustomerOrderDeliveryTracking'
      + ' where Currency=''RMB'' order by InvoiceNumber desc');
  end
  else    }
  DM.DataSetQuery(adt_active, 'select * from ViewCustomerOrderDeliveryTracking order by InvoiceNumber desc');
  DM.DataSetQuery(adt_co, 'select I.InvoiceNumber,I.CustomerNumber,I.CustomerName,I.Currency,I.ATD,I.Forwarder from ViewCustomerOrder I'
    + ' where 0=1');
end;

procedure TfrmDeliveryTracking.SetUI;
begin
  inherited;

end;

procedure TfrmDeliveryTracking.SetAccess;
begin
  inherited;
  if objCurUser.AccessLevel in [1, 5, 18, 23] then
  begin
    DBNavigator1.VisibleButtons := [nbFirst, nbNext, nbPrior, nbLast, nbEdit, nbPost, nbCancel];
    pnlBottom.Visible := true;
    gridData.ReadOnly := false;
    gridData.FieldColumns['InvoiceNumber'].ReadOnly := true;
    gridData.FieldColumns['CustomerNumber'].ReadOnly := true;
    gridData.FieldColumns['CustomerName'].ReadOnly := true;
    gridData.FieldColumns['Currency'].ReadOnly := true;
    gridData.FieldColumns['ATD'].ReadOnly := true;
    gridData.FieldColumns['Forwarder'].ReadOnly := true;
  end;
end;

procedure TfrmDeliveryTracking.btnSaveClick(Sender: TObject);
var
  strSQL: string;
begin
  try
    begin
      strSQL := 'EXEC usp_InsertDeliveryTracking '
        + ' @InvoiceNumber=''' + VarToStr(dbcbbInvoice.Value) + ''''
        + ',@CustomerOnBoardDate=''' + FormatDateTime('yyyy-mm-dd', dtpOnBoardDate.Value) + ''''
        + ',@ATA=''' + FormatDateTime('yyyy-mm-dd', dtpATA.Value) + ''''
        + ',@BillOfLanding=''' + Trim(edtLanding.Text) + '''';
    end;
    if strSQL <> '' then
      DM.DataSetModify(strSQL);
  except on E: Exception do
    begin
      ShowMessage(E.Message);
    end;
  end;
  gridData.SelectedRows.Clear;
  gridData.Selection.Clear;
  gridData.DataSource.DataSet := nil;
  gridData.DataSource.DataSet := adt_active;
  gridData.DataSource.DataSet.Active := false;
  gridData.DataSource.DataSet.Active := true;
end;

procedure TfrmDeliveryTracking.Button1Click(Sender: TObject);
begin
  inherited;
  if VarToStr(dbcbbInvoice.Value) <> '' then
  begin
    RefreshGrid(gridCO, ds_co);
    DM.DataSetQuery(adt_co, 'select I.InvoiceNumber,I.CustomerNumber,I.CustomerName,I.Currency,I.ATD,I.Forwarder from ViewCustomerOrder I'
      + ' where I.InvoiceNumber=''' + VarToStr(dbcbbInvoice.Value) + '''');
  end;
end;

end.

