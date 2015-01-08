unit ufrmReleasePO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmDBBasicPrn, PropFilerEh, DB, ADODB, PrnDbgeh, Menus,
  PropStorageEh, ActnList, ImgList, GridsEh, DBGridEh, PrViewEh, StdCtrls,
  DBCtrls, ComCtrls, ToolWin, ExtCtrls;

type

  TfrmReleasePO = class(TfrmDBBasicPrn)
    btnReleasePO: TButton;
    adt_activePurchaseOrderID: TAutoIncField;
    adt_activePurchaseOrderNumber: TStringField;
    adt_activeVendorID: TIntegerField;
    adt_activeComponentID: TIntegerField;
    adt_activePurchaseOrderQuantity: TIntegerField;
    adt_activeRTA: TDateTimeField;
    adt_activeConfirmedPurchaseOrderQuantity: TIntegerField;
    adt_activeETA: TDateTimeField;
    adt_activeConfirmedPurchaseOrderComments: TStringField;
    adt_activeActualReceiptsQuantity: TIntegerField;
    adt_activeATA: TDateTimeField;
    adt_activePurchaseOrderStatesID: TIntegerField;
    adt_activeComponentItem: TStringField;
    adt_activePurchaseOrderStatesName: TStringField;
    adt_activeVendorNumber: TStringField;
    adt_activeVendorName: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure btnReleasePOClick(Sender: TObject);
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

uses DataModule, uSQLConsts, uMJ, Math, ufrmDBBasic, uPurchaseOrder;

{$R *.dfm}

procedure TfrmReleasePO.FormCreate(Sender: TObject);
begin
  SetData;
  inherited;
end;

procedure TfrmReleasePO.SetData;
begin
  DM.DataSetQuery(adt_active, format(sQueryPurchaseOrderSQL, [' and p.PurchaseOrderStatesID=1']));
end;

procedure TfrmReleasePO.SetUI;
begin
  inherited;
end;

procedure TfrmReleasePO.SetAccess;
var
  i: integer;
begin
  inherited;
  pnlBottom.Visible := true;
  case CurUserLevel of
    4:
      begin
        DBNavigator1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
          + [nbPost, nbCancel];
        gridData.ReadOnly := false;
        for i := 0 to gridData.Columns.Count - 1 do
        begin
          if gridData.Columns[i].FieldName <> 'PurchaseOrderQuantity' then
            gridData.Columns[i].ReadOnly := true;
        end;
      end;
  end;
end;

procedure TfrmReleasePO.btnReleasePOClick(Sender: TObject);
begin
  if MessageDlg('Is Upload PO To Portal?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    DM.DataSetModify(sUpdatePOStatesSQL);
    DM.DataSetModify(format(sDeletePOSQL, [' and PurchaseOrderStatesID = 1']));
    adt_active.Active := false;
    adt_active.Active := true;
    ShowMessage('Upload success.');
  end;
end;


end.

