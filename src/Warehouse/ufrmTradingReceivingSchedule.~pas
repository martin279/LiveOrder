unit ufrmTradingReceivingSchedule;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmDBBasicPrn, PropFilerEh, ActnList, PrnDbgeh, ImgList, DB,
  ADODB, Menus, PropStorageEh, DBCtrls, ComCtrls, ToolWin, GridsEh,
  DBGridEh, PrViewEh, StdCtrls, ExtCtrls, uDMEntity, uDMManager;

type
  TfrmTradingReceivingSchedule = class(TfrmDBBasicPrn)
    tbtnRefresh: TToolButton;
    procedure tbtnRefreshClick(Sender: TObject);
  private
    { Private declarations }
    objBasicData: TMgrBasicData;
    objMgrSS: TMgrShippingSchedule;
    slParam: TStringList;
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

uses DataModule;

{$R *.dfm}

{ TfrmTradingShippingSchedule }
      
procedure TfrmTradingReceivingSchedule.InitializeForm;
begin    
  objMgrSS := TMgrShippingSchedule.Create;
  objBasicData := TMgrBasicData.Create;
  slParam := TStringList.Create;
  inherited;
end;

procedure TfrmTradingReceivingSchedule.DestoryForm;
begin
  inherited;
  objBasicData.Free;
  objMgrSS.Free;
  slParam.Free;
end;

procedure TfrmTradingReceivingSchedule.SetData;
begin
  inherited;
  slParam.Clear;
  slParam.Append('LoginID=' + IntToStr(objCurUser.LoginID));
  objBasicData.QueryBasicDataBySP(adt_active, 'usp_GetTradingReceivingSchedule', slParam);
end;

procedure TfrmTradingReceivingSchedule.SetUI;
begin
  inherited;
  gridData.FieldColumns['CustomerOrderQuantity'].Footer.ValueType := fvtSum;
end;
  
procedure TfrmTradingReceivingSchedule.SetAccess;
begin
  inherited;
end;

procedure TfrmTradingReceivingSchedule.tbtnRefreshClick(Sender: TObject);
begin
  inherited;
  adt_active.Active := false;
  adt_active.Active := true;
end;

end.
