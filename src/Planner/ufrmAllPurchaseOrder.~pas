unit ufrmAllPurchaseOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmDBBasicTree, PropFilerEh, DB, ADODB, Menus, PropStorageEh,
  ActnList, ImgList, StdCtrls, Buttons, ComCtrls, GridsEh, DBGridEh,
  DBCtrls, ToolWin, ExtCtrls;

type
  TfrmAllPurchaseOrder = class(TfrmDBBasicTree)
    adt_activeComponentID: TAutoIncField;
    adt_activeComponentItem: TStringField;
    adt_activeSR01: TFloatField;
    adt_activePurchaseOrderID: TAutoIncField;
    adt_activePurchaseOrderNumber: TStringField;
    adt_activeDueDate: TStringField;
    adt_activeComponentQuantity: TFloatField;
    adt_activeConfirmedPurchaseOrderQuantity: TFloatField;
    adt_activeETD: TStringField;
    adt_activeConfirmedPurchaseOrderComment: TStringField;
    adt_activeSKSF_SupplierInventory: TFloatField;
    adt_activeSKSF_UpdateDate: TDateTimeField;
    adt_activeVendorNumber: TStringField;
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
  private
    { Private declarations }
  protected
    procedure SetData; override;
    procedure SetUI; override;
    procedure SetAccess; override;
    procedure LoadTreeView(nodeName: string); override;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses DataModule, uMJ;

{ TfrmAllPurchaseOrder }

procedure TfrmAllPurchaseOrder.SetData;
begin
  DM.DataSetQuery3(adt_active, 'EXEC JIT_usp_GetAllPurchaseOrder');
end;

procedure TfrmAllPurchaseOrder.SetUI;
begin
  inherited;
  cbbTreeType.Items.Add('PO ETD(Only Confirmed PO)');
  cbbTreeType.ItemIndex := 0;
end;

procedure TfrmAllPurchaseOrder.SetAccess;
begin
  inherited;
  case gVars.CurUserLevel of
    6:
      cbbTreeType.ItemIndex := 1;
    7:
      cbbTreeType.ItemIndex := 1;
  end;
end;

procedure TfrmAllPurchaseOrder.LoadTreeView(nodeName: string);
var
  ftn_type: TTreeNode;
  adt_select: TADODataSet;
  aNodeName, orderCount, sqlConst: string;
begin
  inherited;
  ftn_type := TreeView1.Items.AddChild(nil, nodeName);
  adt_select := TADODataSet.Create(nil);
  try
    case cbbTreeType.ItemIndex of
      0:
        begin
          ftn_type.DeleteChildren;
          sqlConst := 'select convert(varchar(16),ETD,120) as ETD,count(*) as orderCount from ViewAllPurchaseOrder where 0=0';
          sqlConst := sqlConst + ' and DueDate >=convert(varchar(10),getdate(),120)';
          sqlConst := sqlConst + ' and DueDate < convert(varchar(10),getdate()+5,120)';
          sqlConst := sqlConst + ' group by ETD';
          sqlConst := sqlConst + ' order by ETD DESC';
          DM.DataSetQuery3(adt_select, sqlConst);
          while not adt_select.Eof do
          begin
            aNodeName := adt_select.FieldByName('ETD').AsString;
            orderCount := adt_select.FieldByName('orderCount').AsString;
            TreeView1.Items.AddChild(ftn_type, aNodeName + '(' + orderCount + ')');
            adt_select.Next;
          end;
        end;
    end;
  finally
    adt_select.Free;
    ftn_type.Expanded := true;
  end;
end;

procedure TfrmAllPurchaseOrder.TreeView1Change(Sender: TObject;
  Node: TTreeNode);
var
  sqlConst: string;
begin
  inherited;
  if Node = nil then exit;

  //sqlConst := ' and ISNull(ISNull(ATA,ETD),RTD)>=getdate()-2';
  sqlConst := '';
  case TreeView1.Selected.Level of
    1:
      sqlConst := sqlConst + ' @ETD=''' + Copy(Node.Text, 1, 10) + '''';
  end;
  DM.DataSetQuery3(adt_active, 'EXEC JIT_usp_GetAllPurchaseOrder ' + sqlConst);
end;

end.

