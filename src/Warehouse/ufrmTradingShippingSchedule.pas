unit ufrmTradingShippingSchedule;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmDBBasicPrn, PropFilerEh, ActnList, PrnDbgeh, ImgList, DB,
  ADODB, Menus, PropStorageEh, DBCtrls, ComCtrls, ToolWin, GridsEh,
  DBGridEh, PrViewEh, StdCtrls, ExtCtrls, uDMEntity, uDMManager;

type
  TfrmTradingShippingSchedule = class(TfrmDBBasicPrn)
    tbtnRefresh: TToolButton;
    N2: TMenuItem;
    StockDone1: TMenuItem;
    procedure tbtnRefreshClick(Sender: TObject);
  private
    { Private declarations }
    objBasicData: TMgrBasicData;
    objMgrSS: TMgrShippingSchedule;
    slParam: TStringList;
    procedure UpdateStockDone(IsStockDone: Boolean = true);
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

{$R *.dfm}

{ TfrmTradingShippingSchedule }
      
procedure TfrmTradingShippingSchedule.InitializeForm;
begin    
  objMgrSS := TMgrShippingSchedule.Create;
  objBasicData := TMgrBasicData.Create;
  slParam := TStringList.Create;
  inherited;
end;

procedure TfrmTradingShippingSchedule.DestoryForm;
begin
  inherited;
  objBasicData.Free;
  objMgrSS.Free;
  slParam.Free;
end;

procedure TfrmTradingShippingSchedule.SetData;
begin
  inherited;
  slParam.Clear;
  slParam.Append('LoginID=' + IntToStr(objCurUser.LoginID));
  objBasicData.QueryBasicDataBySP(adt_active, 'usp_GetShippingSchedule', slParam);
end;

procedure TfrmTradingShippingSchedule.SetUI;
begin
  inherited;
  gridData.FieldColumns['CustomerOrderQuantity'].Footer.ValueType := fvtSum;
end;
  
procedure TfrmTradingShippingSchedule.SetAccess;
begin
  inherited;
end;

procedure TfrmTradingShippingSchedule.tbtnRefreshClick(Sender: TObject);
begin
  inherited;
  adt_active.Active := false;
  adt_active.Active := true;
end;

end.
