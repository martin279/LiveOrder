unit ufrmSplitTO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmBasic, DB, StdCtrls, Buttons, ComCtrls, DBCtrlsEh, Mask, adodb,
  uDMEntity, uDMManager;

type
  TfrmSplitTO = class(TfrmBasic)
    Label14: TLabel;
    Label10: TLabel;
    dbedtOrderStates: TDBEditEh;
    dbedtCustomerOrderID: TDBEditEh;
    gboxOriginalInfo: TGroupBox;
    Label8: TLabel;
    Label6: TLabel;
    dbedtOrderNumber: TDBEditEh;
    dbedtPOQty: TDBEditEh;
    gboxNewInfo: TGroupBox;
    Label2: TLabel;
    edtNewPOQty: TEdit;
    btnCancel: TBitBtn;
    btnOK: TBitBtn;
    ds_active: TDataSource;
    Label1: TLabel;
    dbedtLogisticStatus: TDBEditEh;
    dbedtCustomer: TDBEditEh;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    dbedtCOQty: TDBEditEh;
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure SetUI; override;
  public
    { Public declarations }
    class function EdtFromList(adt_from: TADODataSet): Boolean;
  end;

implementation

{$R *.dfm}

{ TfrmBasic1 }

procedure TfrmSplitTO.SetUI;
begin
  inherited;
  Position := poOwnerFormCenter;
end;

class function TfrmSplitTO.EdtFromList(adt_from: TADODataSet): Boolean;
begin
  with TfrmSplitTO.Create(Application) do
  try
    ds_active.DataSet := adt_from;
    result := ShowModal = mrOk;
  finally
    Free;
  end;
end;

procedure TfrmSplitTO.btnOKClick(Sender: TObject);
var
  objMgrTO: TMgrTradingOrder;
  slParam: TStringList;
begin
  if VarToStr(dbedtPOQty.Value) = '' then
  begin
    ShowMessage('Please input original PO qty.');
    ModalResult := mrNone;
    Exit;
  end;
  if Trim(edtNewPOQty.Text) = '' then
  begin
    ShowMessage('Please input new PO qty.');
    ModalResult := mrNone;
    Exit;
  end
  else if Trim(edtNewPOQty.Text) = '0' then
  begin
    ShowMessage('PO qty. can''t be 0.');
    ModalResult := mrNone;
    Exit;
  end
  else if ((Trim(edtNewPOQty.Text) = VarToStr(dbedtCOQty.Value))
    or (StrToFloat(Trim(edtNewPOQty.Text)) > StrToFloat(VarToStr(dbedtCOQty.Value)))) then
  begin
    ShowMessage('PO qty. can''t same to original PO qty.'
      + 'Or New order qty. can''t greater than original order qty.');
    ModalResult := mrNone;
    Exit;
  end;
  objMgrTO := TMgrTradingOrder.Create;
  slParam := TStringList.Create;
  try
    slParam.Append('TradingOrderID=' + ds_active.DataSet.FieldByName('TradingOrderID').AsString);
    slParam.Append('CustomerOrderID=' + ds_active.DataSet.FieldByName('CustomerOrderID').AsString);
    slParam.Append('SellerBuyerPOQuantity=' + IntToStr(ds_active.DataSet.FieldByName('SellerBuyerPOQuantity').AsInteger - StrToInt(Trim((edtNewPOQty.Text)))));
    slParam.Append('NewBuyerPOQuantity=' + Trim(edtNewPOQty.Text));
    objMgrTO.SplitTradingOrder(slParam);
  finally
    slParam.Free;
    objMgrTO.Free;
  end;
  ModalResult := mrOk;
end;

end.

