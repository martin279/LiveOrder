unit ufrmCustomerOrderShipment;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmDBBasicPrn, PropFilerEh, ActnList, PrnDbgeh, ImgList, DB,
  ADODB, Menus, PropStorageEh, DBCtrls, ComCtrls, ToolWin, GridsEh,
  DBGridEh, PrViewEh, StdCtrls, ExtCtrls;

type
  TfrmCustomerOrderShipment = class(TfrmDBBasicPrn)
    TabSheet1: TTabSheet;
    gridDetail: TDBGridEh;
    adt_ct: TADODataSet;
    ds_ct: TDataSource;
    adt1: TADODataSet;
    ds1: TDataSource;
    TabSheet2: TTabSheet;
    gridUnScan: TDBGridEh;
    procedure gridDetailEnter(Sender: TObject);
    procedure PageControl1Enter(Sender: TObject);
    procedure gridDataEnter(Sender: TObject);
    procedure actGridSTFilterExecute(Sender: TObject);
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

{ TfrmCustomerOrderShipment }

procedure TfrmCustomerOrderShipment.SetData;
begin
  inherited;
  DM.DataSetQuery(adt_active, 'select * from ViewCustomerOrder_Shipment_Sum order by ATD desc');
  DM.DataSetQuery(adt_ct, 'select * from ViewCustomerOrder_Shipment order by ATD desc');
  DM.DataSetQuery(adt1, 'select c.CustomerOrderNumber,c.ATD,c.CustomerName,c.Model,c.CustomerOrderQuantity'
    + ' from ViewCustomerOrder c'
    + ' where c.CustomerOrderID not in (select CustomerOrderID from CustomerOrder_Shipment)'
    + ' and c.CustomerOrderStatesID=5'
    + ' and c.PlantID=1'
    + ' and c.BusinessApplicationID in (1,2,6,7,8,10,14) order by c.CustomerOrderID desc');
end;

procedure TfrmCustomerOrderShipment.SetUI;
begin
  inherited;
  tbsBody1.TabVisible := true;
  tabSheet1.TabVisible := true;
  SetGridUI(gridDetail,ds_ct); 
  SetGridUI(gridUnScan,ds1);
end;

procedure TfrmCustomerOrderShipment.SetAccess;
begin
  inherited;

end;

procedure TfrmCustomerOrderShipment.gridDataEnter(Sender: TObject);
begin
  inherited;
  DBNavigator1.DataSource := ds_active;
end;

procedure TfrmCustomerOrderShipment.gridDetailEnter(Sender: TObject);
begin
  inherited;
  DBNavigator1.DataSource := ds_ct;
end;

procedure TfrmCustomerOrderShipment.PageControl1Enter(Sender: TObject);
begin
  inherited;
  DBNavigator1.DataSource := ds1;
end;

procedure TfrmCustomerOrderShipment.actGridSTFilterExecute(
  Sender: TObject);
begin
//  inherited;
  if PageControl1.ActivePageIndex = 0 then
  begin
    gridData.STFilter.Visible := not gridData.STFilter.Visible;
    if gridData.STFilter.Visible then
    begin
      gridData.ClearFilter;
      gridData.ApplyFilter;
    end;
  end
  else if PageControl1.ActivePageIndex = 1 then
  begin
    gridDetail.STFilter.Visible := not gridDetail.STFilter.Visible;
    if gridDetail.STFilter.Visible then
    begin
      gridDetail.ClearFilter;
      gridDetail.ApplyFilter;
    end;
  end
  else if PageControl1.ActivePageIndex = 2 then
  begin
    gridUnScan.STFilter.Visible := not gridUnScan.STFilter.Visible;
    if gridUnScan.STFilter.Visible then
    begin
      gridUnScan.ClearFilter;
      gridUnScan.ApplyFilter;
    end;
  end;
end;

end.

