unit ufrmModel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmDBBasicPrn, PropFilerEh, DB, ADODB, PrnDbgeh, Menus,
  PropStorageEh, ActnList, ImgList, GridsEh, DBGridEh, PrViewEh, StdCtrls,
  DBCtrls, ComCtrls, ToolWin, ExtCtrls, Mask, DBCtrlsEh, DBLookupEh,
  uDMEntity, uDMManager;

type
  TfrmModel = class(TfrmDBBasicPrn)
    N2: TMenuItem;
    MenuEdtModel: TMenuItem;
    TabSheet1: TTabSheet;
    ds_mfModel: TDataSource;
    adt_mfModel: TADODataSet;
    adt_mfModelMainframeModelID: TAutoIncField;
    adt_mfModelModelID: TIntegerField;
    adt_mfModelMainframeModel: TStringField;
    adt_mfModelModel1: TStringField;
    gridMFModel: TDBGridEh;
    TabSheet2: TTabSheet;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    ds_ProductSeries: TDataSource;
    ds_ProductFamily: TDataSource;
    adt_ProductSeries: TADODataSet;
    adt_ProductFamily: TADODataSet;
    gridSeries: TDBGridEh;
    gridFamily: TDBGridEh;
    adt_activeModelID: TAutoIncField;
    adt_activeModel: TStringField;
    adt_activeModelDescription: TStringField;
    adt_activeProductClassification: TStringField;
    adt_activeIsValid: TBooleanField;
    adt_activeXRef: TStringField;
    adt_activeBaseShortHandCode: TStringField;
    adt_activeProductionFactor: TFloatField;
    adt_activeSchedulingCode: TStringField;
    adt_activeBaseSE: TStringField;
    adt_activeProductSeriesID: TIntegerField;
    adt_activecatalogue: TStringField;
    adt_activeSupplier: TStringField;
    adt_activeCommodityInspection: TStringField;
    adt_activeNote: TStringField;
    adt_activeModelChineseDescription: TStringField;
    adt_activeUpdateTime: TDateTimeField;
    adt_activeUpdateBy: TIntegerField;
    adt_activeSyncTime: TDateTimeField;
    adt_activeSyncStatus: TSmallintField;
    TabSheet3: TTabSheet;
    ds_modelInvoled: TDataSource;
    adt_modelInvoled: TADODataSet;
    IntegerField1: TIntegerField;
    StringField2: TStringField;
    gridModelInvolved: TDBGridEh;
    procedure adt_activeBeforeInsert(DataSet: TDataSet);
    procedure MenuEdtModelClick(Sender: TObject);
    procedure actGridSTFilterExecute(Sender: TObject);
    procedure gridDataEnter(Sender: TObject);
    procedure gridMFModelEnter(Sender: TObject);
    procedure gridSeriesEnter(Sender: TObject);
    procedure gridFamilyEnter(Sender: TObject);
    procedure gridMFModelGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure gridSeriesGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure gridFamilyGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure gridModelInvolvedEnter(Sender: TObject);
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

uses DataModule, uMJ, ufrmEdtModel, ufrmDBBasic;

{$R *.dfm}

{ TfrmModel }

procedure TfrmModel.SetData;
begin
  DM.DataSetQuery(adt_active, 'Select * from Model order by ModelID desc');
  DM.DataSetQuery(adt_mfModel, 'select * from MainframeModel');
  DM.DataSetQuery(adt_ProductSeries, 'select * from ProductSeries');
  DM.DataSetQuery(adt_ProductFamily, 'Select * from ProductFamily');
  DM.DataSetQuery(adt_modelInvoled, 'Select * from ModelInvolved');
end;

procedure TfrmModel.SetUI;
begin
  inherited;
  gridMFModel.ReadOnly := true;
  gridSeries.ReadOnly := true;
  gridFamily.ReadOnly := true;
  MenuEdtModel.Visible := false;
  tbsBody1.TabVisible := true;
  SetGridUI(gridMFModel, ds_mfModel);
  SetGridUI(gridSeries, ds_ProductSeries);
  SetGridUI(gridFamily, ds_ProductFamily);
  SetGridUI(gridModelInvolved, ds_modelInvoled);
end;

procedure TfrmModel.SetAccess;
begin
  if gVars.CurUserLevel = 22 then
  begin
    DBNavigator1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast];
    gridData.OnDblClick := MenuEdtModelClick;
    MenuEdtModel.Visible := true;
    TabSheet1.TabVisible := false;
    TabSheet2.TabVisible := false;
  end;
  inherited;
  if objCurUser.AccessLevel in [1, 2] then
  begin
    DBNavigator1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh, nbInsert];
    gridData.OnDblClick := MenuEdtModelClick;
    MenuEdtModel.Visible := true;
    gridMFModel.ReadOnly := false;
    gridSeries.ReadOnly := false;
    gridFamily.ReadOnly := false;
    gridModelInvolved.ReadOnly := false;
  end;
  if (gVars.CurUserLevel = 3) then
  begin
    DBNavigator1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast];
    gridData.OnDblClick := MenuEdtModelClick;
    MenuEdtModel.Visible := true;
  end; {
  if (gVars.CurUserLevel = 1) or (gVars.CurUserLevel = 2) then
  begin
    DBNavigator1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbInsert];
    gridData.OnDblClick := MenuEdtModelClick;
    MenuEdtModel.Visible := true;
    gridMFModel.ReadOnly := false;
    gridSeries.ReadOnly := false;
    gridFamily.ReadOnly := false;
  end; }
end;

procedure TfrmModel.adt_activeBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  TfrmEdtModel.EdtFromList(adt_active, true);
  adt_active.Active := false;
  adt_active.Active := true;
  Abort;
end;

procedure TfrmModel.gridMFModelGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if gridMFModel.SumList.RecNo mod 2 = 1 then
    Background := $00FFC4C4
  else
    Background := $00FFDDDD;
end;

procedure TfrmModel.gridSeriesGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if gridSeries.SumList.RecNo mod 2 = 1 then
    Background := $00FFC4C4
  else
    Background := $00FFDDDD;
end;

procedure TfrmModel.gridFamilyGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if gridFamily.SumList.RecNo mod 2 = 1 then
    Background := $00FFC4C4
  else
    Background := $00FFDDDD;
end;
  
procedure TfrmModel.MenuEdtModelClick(Sender: TObject);
begin
  inherited;
  if adt_active.RecordCount <> 0 then
    TfrmEdtModel.EdtFromList(adt_active, false);
  RefreshGrid(gridData, ds_active);
end;

procedure TfrmModel.actGridSTFilterExecute(Sender: TObject);
begin
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
    gridMFModel.STFilter.Visible := not gridMFModel.STFilter.Visible;
    if gridMFModel.STFilter.Visible then
    begin
      gridMFModel.ClearFilter;
      gridMFModel.ApplyFilter;
    end;
  end
  else if PageControl1.ActivePageIndex = 2 then
  begin
    if gridSeries.Focused then
    begin
      gridSeries.STFilter.Visible := not gridSeries.STFilter.Visible;
      if gridSeries.STFilter.Visible then
      begin
        gridSeries.ClearFilter;
        gridSeries.ApplyFilter;
      end;
    end
    else
    begin
      gridFamily.STFilter.Visible := not gridFamily.STFilter.Visible;
      if gridFamily.STFilter.Visible then
      begin
        gridFamily.ClearFilter;
        gridFamily.ApplyFilter;
      end;
    end;
  end
  else if PageControl1.ActivePageIndex = 3 then
  begin
    gridModelInvolved.STFilter.Visible := not gridModelInvolved.STFilter.Visible;
    if gridModelInvolved.STFilter.Visible then
    begin
      gridModelInvolved.ClearFilter;
      gridModelInvolved.ApplyFilter;
    end;
  end;
end;

procedure TfrmModel.gridDataEnter(Sender: TObject);
begin
  inherited;
  if objCurUser.AccessLevel in [1, 2] then
  begin
    DBNavigator1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbInsert];
    DBNavigator1.DataSource := ds_active;
    gridMFModel.SelectedRows.Clear;
  end;
  if objCurUser.AccessLevel = 22 then
    DBNavigator1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast];
end;

procedure TfrmModel.gridMFModelEnter(Sender: TObject);
begin
  inherited;
  if objCurUser.AccessLevel in [1, 2] then
  begin
    DBNavigator1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbPost, nbCancel];
    DBNavigator1.DataSource := ds_mfModel;
    gridData.SelectedRows.Clear;
    MenuEdtModel.Visible := false;
  end;
end;

procedure TfrmModel.gridSeriesEnter(Sender: TObject);
begin
  inherited;
  if objCurUser.AccessLevel in [1, 2] then
  begin
    DBNavigator1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbPost, nbCancel];
    DBNavigator1.DataSource := ds_ProductSeries;
    MenuEdtModel.Visible := false;
  end;
end;

procedure TfrmModel.gridFamilyEnter(Sender: TObject);
begin
  inherited;
  if objCurUser.AccessLevel in [1, 2] then
  begin
    DBNavigator1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbPost, nbCancel];
    DBNavigator1.DataSource := ds_ProductFamily;
    MenuEdtModel.Visible := false;
  end;
end;

procedure TfrmModel.gridModelInvolvedEnter(Sender: TObject);
begin
  inherited;
  if objCurUser.AccessLevel in [1, 2] then
  begin
    DBNavigator1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbPost, nbCancel];
    DBNavigator1.DataSource := ds_modelInvoled;
    MenuEdtModel.Visible := false;
  end;
end;

end.

