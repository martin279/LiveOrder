unit ufrmReceiptsOpenPO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmDBBasicDT, PropFilerEh, DB, ADODB, Menus, PropStorageEh,
  ActnList, ImgList, GridsEh, DBGridEh, StdCtrls, ComCtrls, ExtCtrls,
  DBCtrls, ToolWin;

type
  TfrmReceiptOpenPO = class(TfrmDBBasicDT)
    N2: TMenuItem;
    MenuReceipt: TMenuItem;
    MenuBack: TMenuItem;
    adt_activePurchaseOrderID: TAutoIncField;
    adt_activePurchaseOrderNumber: TStringField;
    adt_activeVendorID: TIntegerField;
    adt_activeComponentID: TIntegerField;
    adt_activePurchaseOrderQuantity: TIntegerField;
    adt_activeConfirmedPurchaseOrderQuantity: TIntegerField;
    adt_activeConfirmedPurchaseOrderComments: TStringField;
    adt_activeActualReceiptsQuantity: TIntegerField;
    adt_activePurchaseOrderStatesID: TIntegerField;
    adt_activeIsChanged: TBooleanField;
    adt_activeRTA: TDateTimeField;
    adt_activeRTD: TDateTimeField;
    adt_activeETD: TDateTimeField;
    adt_activeETA: TDateTimeField;
    adt_activeATA: TDateTimeField;
    adt_activePOGenerateTime: TDateTimeField;
    adt_activePOConfirmedTime: TDateTimeField;
    adt_activeRTAB: TStringField;
    adt_activeRTDB: TStringField;
    adt_activeETDB: TStringField;
    adt_activeETAB: TStringField;
    adt_activeATAB: TStringField;
    adt_activePOGenerateTimeB: TStringField;
    adt_activePOConfirmedTimeB: TStringField;
    adt_activeComponentItem: TStringField;
    adt_activePackageWeightUnit: TStringField;
    adt_activePackageWeight: TFloatField;
    adt_activePackageSizeUnit: TStringField;
    adt_activePackageSize: TFloatField;
    adt_activePackage: TIntegerField;
    adt_activePurchaseOrderStatesName: TStringField;
    adt_activeVendorNumber: TStringField;
    adt_activeVendorName: TStringField;
    adt_active2PurchaseOrderID: TAutoIncField;
    adt_active2PurchaseOrderNumber: TStringField;
    adt_active2VendorID: TIntegerField;
    adt_active2ComponentID: TIntegerField;
    adt_active2PurchaseOrderQuantity: TIntegerField;
    adt_active2ConfirmedPurchaseOrderQuantity: TIntegerField;
    adt_active2ConfirmedPurchaseOrderComments: TStringField;
    adt_active2ActualReceiptsQuantity: TIntegerField;
    adt_active2PurchaseOrderStatesID: TIntegerField;
    adt_active2IsChanged: TBooleanField;
    adt_active2RTA: TDateTimeField;
    adt_active2RTD: TDateTimeField;
    adt_active2ETD: TDateTimeField;
    adt_active2ETA: TDateTimeField;
    adt_active2ATA: TDateTimeField;
    adt_active2POGenerateTime: TDateTimeField;
    adt_active2POConfirmedTime: TDateTimeField;
    adt_active2RTAB: TStringField;
    adt_active2RTDB: TStringField;
    adt_active2ETDB: TStringField;
    adt_active2ETAB: TStringField;
    adt_active2ATAB: TStringField;
    adt_active2POGenerateTimeB: TStringField;
    adt_active2POConfirmedTimeB: TStringField;
    adt_active2ComponentItem: TStringField;
    adt_active2PackageWeightUnit: TStringField;
    adt_active2PackageWeight: TFloatField;
    adt_active2PackageSizeUnit: TStringField;
    adt_active2PackageSize: TFloatField;
    adt_active2Package: TIntegerField;
    adt_active2PurchaseOrderStatesName: TStringField;
    adt_active2VendorNumber: TStringField;
    adt_active2VendorName: TStringField;
    procedure gridDataEnter(Sender: TObject);
    procedure gridData2Enter(Sender: TObject);
    procedure MenuReceiptClick(Sender: TObject);
    procedure MenuBackClick(Sender: TObject);
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

uses DataModule, uMJ;

{$R *.dfm}

{ TfrmReceiptOpenPO }

procedure TfrmReceiptOpenPO.SetData;
begin
  DM.DataSetQuery(adt_active, 'EXEC usp_GetPurchaseOrderJIT @PurchaseOrderStatesID=2');
  DM.DataSetQuery(adt_active2, 'EXEC usp_GetPurchaseOrderJIT @PurchaseOrderStatesID=4'
    + ',@RTAFrom=''' + formatdatetime('YYYY-mm-dd', now) + '''');
end;

procedure TfrmReceiptOpenPO.SetUI;
begin
  inherited;
  GroupBox1.Caption := 'Materials--waitting for receipt';
  GroupBox2.Caption := 'Materials--receipted';
end;

procedure TfrmReceiptOpenPO.SetAccess;
var
  i: integer;
begin
  inherited;
  case gVars.CurUserLevel of
    1:
      begin
        DBNavigator1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
          + [nbInsert, nbPost, nbEdit, nbDelete, nbCancel];
        gridData.ReadOnly := false;
      end;
    4:
      begin
        MenuReceipt.Visible := false;
        MenuBack.Visible := false;
      end;
    5:
      begin
        DBNavigator1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
          + [nbPost, nbCancel];
        gridData.ReadOnly := false;
        for i := 0 to gridData.Columns.Count - 1 do
        begin
          if gridData.Columns[i].FieldName <> 'ActualReceiptsQuantity' then
            gridData.Columns[i].ReadOnly := true;
        end;
      end;
  end;
end;

procedure TfrmReceiptOpenPO.gridDataEnter(Sender: TObject);
begin
  inherited;
  case gVars.CurUserLevel of
    5:
      begin
        MenuBack.Visible := false;
        MenuReceipt.Visible := true;
      end;
  end;
end;

procedure TfrmReceiptOpenPO.gridData2Enter(Sender: TObject);
begin
  inherited;
  case gVars.CurUserLevel of
    5:
      begin
        MenuBack.Visible := true;
        MenuReceipt.Visible := false;
      end;
  end;
end;

procedure TfrmReceiptOpenPO.MenuReceiptClick(Sender: TObject);
var
  i: integer;
begin
  gridData.DataSource.DataSet.DisableControls;
  for i := 0 to gridData.SelectedRows.Count - 1 do
  begin
    gridData.DataSource.DataSet.Bookmark := gridData.SelectedRows.items[I];
   // ShowMessage(gridData.DataSource.DataSet.Fields[0].AsString);
    if not (adt_active.State in [dsEdit]) then
      adt_active.Edit;
    adt_active.FieldByName('ATA').Value := now;
    adt_active.FieldByName('PurchaseOrderStatesID').Value := 4;
    adt_active.Post;
   { DM.DataSetModify(format(sUpdateComponentPOReceiptsSQL,
      [adt_active.fieldbyname('ActualReceiptsQuantity').AsFloat, adt_active.FieldByName('ComponentID').AsString])
      + sUpdateCurrentInventoryCountSQL);    }
    DM.DataSetModify('EXEC usp_UpdateComponent '
      + ' @StartPointPurchaseOrdersOperation=0'
      + ',@ActualReceiptsQuantity=' + adt_active.fieldbyname('ActualReceiptsQuantity').AsString
      + ',@ComponentID=' + adt_active.FieldByName('ComponentID').AsString);
  end;
  gridData.DataSource.DataSet.EnableControls;

  adt_active.Active := false;
  adt_active.Active := true;
  adt_active2.Active := false;
  adt_active2.Active := true;
end;

procedure TfrmReceiptOpenPO.MenuBackClick(Sender: TObject);
var
  i: integer;
begin
  if MessageDlg('Is Back?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    gridData2.DataSource.DataSet.DisableControls;
    for i := 0 to gridData2.SelectedRows.Count - 1 do
    begin
      gridData2.DataSource.DataSet.Bookmark := gridData2.SelectedRows.items[I];
      if not (adt_active2.State in [dsEdit]) then
        adt_active2.Edit;
      adt_active2.FieldByName('ATA').Value := null;
      adt_active2.FieldByName('PurchaseOrderStatesID').Value := 3;
      adt_active2.Post;
     { DM.DataSetModify(format(sUpdateComponentPOReceiptsSQL2,
        [adt_active2.fieldbyname('ActualReceiptsQuantity').AsFloat, adt_active2.FieldByName('ComponentID').AsString])
        + sUpdateCurrentInventoryCountSQL);  }
      DM.DataSetModify('EXEC usp_UpdateComponent '
        + ' @StartPointPurchaseOrdersOperation=1'
        + ',@ActualReceiptsQuantity=' + adt_active.fieldbyname('ActualReceiptsQuantity').AsString
        + ',@ComponentID=' + adt_active.FieldByName('ComponentID').AsString);
    end;
    gridData2.DataSource.DataSet.EnableControls;
    adt_active.Active := false;
    adt_active.Active := true;
    adt_active2.Active := false;
    adt_active2.Active := true;
  end;
end;

end.
