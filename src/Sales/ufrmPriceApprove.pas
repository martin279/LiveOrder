unit ufrmPriceApprove;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmDBBasicDT, PropFilerEh, DB, ADODB, Menus, PropStorageEh,
  ActnList, ImgList, GridsEh, DBGridEh, StdCtrls, ExtCtrls, DBCtrls,
  ComCtrls, ToolWin;

type
  TfrmPriceApprove = class(TfrmDBBasicDT)
    adt_activePriceID: TAutoIncField;
    adt_activeCustomerID: TIntegerField;
    adt_activeModelID: TIntegerField;
    adt_activeCurrency: TStringField;
    adt_activePrice: TBCDField;
    adt_activeDemandQuantity: TIntegerField;
    adt_activePaymentTerms: TStringField;
    adt_activePriceterm: TStringField;
    adt_activeEffectDate: TDateTimeField;
    adt_activeRemark: TStringField;
    adt_activeCustomerNumber: TStringField;
    adt_activeCustomerName: TStringField;
    adt_activeModel: TStringField;
    adt_activePriceStatesID: TIntegerField;
    adt_activePriceStatesName: TStringField;
    adt_active2PriceID: TAutoIncField;
    adt_active2CustomerID: TIntegerField;
    adt_active2ModelID: TIntegerField;
    adt_active2Currency: TStringField;
    adt_active2Price: TBCDField;
    adt_active2DemandQuantity: TIntegerField;
    adt_active2PaymentTerms: TStringField;
    adt_active2Priceterm: TStringField;
    adt_active2EffectDate: TDateTimeField;
    adt_active2Remark: TStringField;
    adt_active2CustomerNumber: TStringField;
    adt_active2CustomerName: TStringField;
    adt_active2Model: TStringField;
    adt_active2PriceStatesID: TIntegerField;
    adt_active2PriceStatesName: TStringField;
    MenuApprove: TMenuItem;
    MenuBack: TMenuItem;
    adt_activeCreatorLoginID: TIntegerField;
    adt_activeDisplayName: TStringField;
    adt_activeCreateTime: TDateTimeField;
    adt_active2CreatorLoginID: TIntegerField;
    adt_active2DisplayName: TStringField;
    adt_active2CreateTime: TDateTimeField;
    procedure MenuApproveClick(Sender: TObject);
    procedure MenuBackClick(Sender: TObject);
    procedure gridDataEnter(Sender: TObject);
    procedure gridData2Enter(Sender: TObject);
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

uses DataModule, uSQLConsts, uMJ, ufrmDBBasic;

{$R *.dfm}

{ TfrmPriceApprove }

procedure TfrmPriceApprove.SetData;
var
  sqlConst: string;
begin
  sqlConst := '';
  case gVars.CurUserLevel of
    8:
      sqlConst := ' and p.CustomerID in'
        + ' (select sc.CustomerID from SalesCustomer sc'
        + ' left outer join Sales s ON sc.SalesID = s.SalesID'
        + ' where s.LoginID=' + IntToStr(gVars.CurLoginID) + ')';
  end;
  DM.DataSetQuery(adt_active, format(sQueryPriceSQL, [sqlConst]));
  DM.DataSetQuery(adt_active2, format(sQueryPriceSQL, [sqlConst]));
end;

procedure TfrmPriceApprove.SetUI;
begin
  inherited;
  gridData.FrozenCols := 5;
  gridData2.FrozenCols := 5;
  GroupBox1.Caption := 'Price Waitting Approve';
  GroupBox2.Caption := 'Price Approved';
end;

procedure TfrmPriceApprove.SetAccess;
begin
  inherited;
  MenuApprove.Visible := false;
  MenuBack.Visible := false;
  gridData.Options := [dgEditing, dgTitles, dgIndicator, dgColumnResize
    , dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgRowSelect
    , dgConfirmDelete, dgCancelOnExit, dgMultiSelect];
  case gVars.CurUserLevel of
    8:
      begin
      end;
  end;
end;

procedure TfrmPriceApprove.gridDataEnter(Sender: TObject);
begin
  inherited;
  case gVars.CurUserLevel of
    8:
      begin
        MenuBack.Visible := false;
        MenuApprove.Visible := true;
      end;
  end;
end;

procedure TfrmPriceApprove.gridData2Enter(Sender: TObject);
begin
  inherited;
  case gVars.CurUserLevel of
    8:
      begin
        MenuBack.Visible := true;
        MenuApprove.Visible := false;
      end;
  end;
end;

procedure TfrmPriceApprove.MenuApproveClick(Sender: TObject);
var
  i: integer;
begin
  gridData.DataSource.DataSet.DisableControls;
  for i := 0 to gridData.SelectedRows.Count - 1 do
  begin
    gridData.DataSource.DataSet.Bookmark := gridData.SelectedRows.items[I];
    if not (adt_active.State in [dsEdit]) then
      adt_active.Edit;
    adt_active.FieldByName('PriceStatesID').Value := 2;
    adt_active.Post;
  end;
  gridData.DataSource.DataSet.EnableControls;

  adt_active.Active := false;
  adt_active.Active := true;
  adt_active2.Active := false;
  adt_active2.Active := true;
end;

procedure TfrmPriceApprove.MenuBackClick(Sender: TObject);
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
      adt_active2.FieldByName('PriceStatesID').Value := 1;
      adt_active2.Post;
    end;
    gridData2.DataSource.DataSet.EnableControls;
    adt_active.Active := false;
    adt_active.Active := true;
    adt_active2.Active := false;
    adt_active2.Active := true;
  end;
end;

end.

