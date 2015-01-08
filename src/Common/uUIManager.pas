unit uUIManager;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, PropFilerEh, Menus, PropStorageEh, ActnList, ImgList, StdCtrls,
  Buttons, ComCtrls, GridsEh, DBGridEh, DBCtrls, ToolWin, ExtCtrls,
  uMJ, uDMManager, uDMEntity;


type

  TUIMgrCustomerOrder = class
  private
  public
    procedure SetForm;
  end;

  TUIMgrTradingOrder = class
  private
  public
    procedure SetForm(instanceForm: TForm);
  end;


implementation


{ TUIMgrCustomerOrder }

procedure TUIMgrCustomerOrder.SetForm;
begin

end;

{ TUIMgrTradingOrder }

procedure TUIMgrTradingOrder.SetForm(instanceForm: TForm);
begin
  with instanceForm do
  begin
    cbbTreeType.Items.Add('Trading Order Logistic Status');
    cbbTreeType.ItemIndex := 0;
    TreeView1.ReadOnly := true;
    tbtnOperation.Visible := false;
    pnlBodyRight.Visible := false;
    pnlBodyBottom.Visible := false;
    if gridData.FieldColumns['TradingOrderID'].Visible then
      gridData.FieldColumns['TradingOrderID'].Footer.ValueType := fvtCount
    else
      gridData.FieldColumns['CustomerOrderID'].Footer.ValueType := fvtCount;
    gridData.FieldColumns['CustomerOrderQuantity'].Footer.ValueType := fvtSum;
    gridData.FieldColumns['SellerBuyerPOQuantity'].Footer.ValueType := fvtSum;
  end;
end;

end.

