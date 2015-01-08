unit ufrmModelParameterCUD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmDBBasicPrn, PropFilerEh, DB, ADODB, PrnDbgeh, Menus,
  PropStorageEh, ActnList, ImgList, GridsEh, DBGridEh, PrViewEh, StdCtrls,
  ComCtrls, DBCtrls, ToolWin, ExtCtrls, uDMEntity, uDMManager;

type
  TfrmModelParameterCUD = class(TfrmDBBasicPrn)
    adt_activeModelParameterCUDID: TAutoIncField;
    adt_activeModelID: TIntegerField;
    adt_activeProductWeightUnit: TStringField;
    adt_activeProductWeight: TFloatField;
    adt_activeProductGrossWeight: TFloatField;
    adt_activeProductSizeUnit: TStringField;
    adt_activeProductSize: TStringField;
    adt_activeVoltage: TStringField;
    adt_activePh: TStringField;
    adt_activeHz: TStringField;
    adt_activeCapacity: TStringField;
    adt_activeCOP: TStringField;
    adt_activeL_R_A: TStringField;
    adt_activeR_L_A: TStringField;
    adt_activehigh_pressure: TStringField;
    adt_activelow_pressure: TStringField;
    adt_activeoil: TStringField;
    adt_activeRefrigerant: TStringField;
    adt_activestandard: TStringField;
    adt_activeModel: TStringField;
    adt_model: TADODataSet;
    adt_activeModel2: TStringField;
    adt_activeFan: TStringField;
    adt_activeEvaporatingTempRange: TStringField;
    adt_activePower: TStringField;
    adt_activeRatingCondition: TStringField;
    adt_activeMaxWorkingPressure: TStringField;
    adt_activeMaxOperatingCurrent: TStringField;
    adt_activeApplication: TStringField;
    adt_activeupdate_time: TDateTimeField;
    adt_activeupdate_by: TStringField;
    adt_activeDisplayName: TStringField;
    adt_activeupdate_ip: TStringField;
    tbsParaUSA: TTabSheet;
    GroupBox2: TGroupBox;
    gridParaUSA: TDBGridEh;
    adt_ParaUSA: TADODataSet;
    ds_ParaUSA: TDataSource;
    adt_ParaUSAModelParameterCUDUSAID: TAutoIncField;
    adt_ParaUSAModelID: TIntegerField;
    adt_ParaUSAProductWeightUnit: TStringField;
    adt_ParaUSAProductWeight: TFloatField;
    adt_ParaUSAProductGrossWeight: TFloatField;
    adt_ParaUSAProductSizeUnit: TStringField;
    adt_ParaUSAProductSize: TStringField;
    adt_ParaUSAApplication: TStringField;
    adt_ParaUSARefrigant: TStringField;
    adt_ParaUSACrankcaseHeaterPower: TStringField;
    adt_ParaUSADesignPressureHigh: TStringField;
    adt_ParaUSADesignPressureLow: TStringField;
    adt_ParaUSACompressorVoltage: TStringField;
    adt_ParaUSACompressorMotorPH: TStringField;
    adt_ParaUSACompressorMotorHZ: TStringField;
    adt_ParaUSACompressorMotorRLA: TStringField;
    adt_ParaUSACompressorMotorLRA: TStringField;
    adt_ParaUSACondenserFanQty: TStringField;
    adt_ParaUSACondenserFanVoltage: TStringField;
    adt_ParaUSACondenserFanPH: TStringField;
    adt_ParaUSACondenserFanHZ: TStringField;
    adt_ParaUSACondenserFanFLA: TStringField;
    adt_ParaUSACondenserFanWattb: TStringField;
    adt_ParaUSAUnitPowerSupplyVoltage: TStringField;
    adt_ParaUSAUnitPowerSupplyPH: TStringField;
    adt_ParaUSAUnitPowerSupplyHZ: TStringField;
    adt_ParaUSAMinCircuitAmpacity: TStringField;
    adt_ParaUSAAmpsMaxBranchCircuitFuse: TStringField;
    adt_ParaUSAModel: TStringField;
    adt_ParaUSAmodel1: TStringField;
    tbsPackgeParameter: TTabSheet;
    tbsProductPackge: TTabSheet;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    adt_series: TADODataSet;
    gridPack: TDBGridEh;
    gridPackPara: TDBGridEh;
    adt_PackPara: TADODataSet;
    adt_pack: TADODataSet;
    ds_PackPara: TDataSource;
    ds_pack: TDataSource;
    adt_PackParaModelID: TIntegerField;
    adt_PackParaQuantity: TIntegerField;
    adt_PackParaNetWeightPerPCS: TFloatField;
    adt_PackParaGrossWeight: TFloatField;
    adt_PackParaDimensions: TStringField;
    adt_PackParaModel: TStringField;
    adt_PackParamodel3: TStringField;
    adt_packProductPackgeID: TAutoIncField;
    adt_packProductSeriesID: TIntegerField;
    adt_packProductPackgeType: TStringField;
    adt_packProductWeightUnit: TStringField;
    adt_packProductWeight: TFloatField;
    adt_packProductGrossWeight: TFloatField;
    adt_packProductSizeUnit: TStringField;
    adt_packProductSize: TStringField;
    adt_packProductSeriesName: TStringField;
    adt_packProductSeriesName1: TStringField;
    adt_packIsCHN: TBooleanField;
    procedure adt_activeBeforePost(DataSet: TDataSet);
    procedure gridDataEnter(Sender: TObject);
    procedure gridParaUSAEnter(Sender: TObject);
    procedure actGridSTFilterExecute(Sender: TObject);
    procedure gridParaUSAGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure gridPackGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure gridPackParaGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure gridPackEnter(Sender: TObject);
    procedure gridPackParaEnter(Sender: TObject);
    procedure adt_packAfterPost(DataSet: TDataSet);
    procedure adt_packBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    objMgrBasic: TMgrBasicData;
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

uses DataModule, uMJ, ufrmDBBasic;

{$R *.dfm}

{ TfrmModelParameterCUD }

procedure TfrmModelParameterCUD.InitializeForm;
begin
  objMgrBasic := TMgrBasicData.Create;
  inherited;
end;

procedure TfrmModelParameterCUD.DestoryForm;
begin
  inherited;
  objMgrBasic.Free;
end;

procedure TfrmModelParameterCUD.SetData;
begin
  DM.DataSetQuery(adt_model, 'select model,modelid from Model'
    + ' where lower(substring(model,1,3))=''zx0'''
    + ' or lower(substring(model,1,3))=''zxl'''
    + ' or lower(substring(model,1,3))=''zxd'''
    + ' or lower(substring(model,1,2))=''gp'''
    + ' or lower(substring(model,1,4))=''xjam'''
    + ' or lower(substring(model,1,4))=''xjal'''
    + ' or lower(substring(model,1,2))=''zx''');
  DM.DataSetQuery(adt_series, 'select * from ProductSeries');
  DM.DataSetQuery(adt_active, 'EXEC usp_GetModelParameterCUD');
  DM.DataSetQuery(adt_ParaUSA, 'EXEC usp_GetModelParameterCUDUSA');
  DM.DataSetQuery(adt_PackPara, 'select p.*,m.Model from ModelPackingParameter p left outer join Model m on p.ModelID=m.ModelID');
  DM.DataSetQuery(adt_pack, 'EXEC usp_GetProductPackgeCUD');
end;

procedure TfrmModelParameterCUD.SetUI;
begin
  inherited;
  tbsBody1.TabVisible := true;
  SetGridUI(gridParaUSA, ds_ParaUSA);
  SetGridUI(gridPackPara, ds_PackPara);
  SetGridUI(gridPack, ds_pack);
end;

procedure TfrmModelParameterCUD.SetAccess;
begin
  inherited;
  gridData.FieldColumns['update_time'].ReadOnly := true;
  gridData.FieldColumns['DisplayName'].ReadOnly := true;
  gridData.FieldColumns['update_ip'].ReadOnly := true;
  if (gVars.CurUserLevel = 1) or (gVars.CurUserLevel = 22) then
  begin
    DBNavigator1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
      + [nbInsert, nbPost, nbEdit, nbDelete, nbCancel];
    gridData.ReadOnly := false;
    gridParaUSA.ReadOnly := false;
    gridPackPara.ReadOnly := false;
    gridPack.ReadOnly := false;
  end;
end;

procedure TfrmModelParameterCUD.adt_activeBeforePost(DataSet: TDataSet);
var
  IpList: TStringList;
  a: integer;
begin
  inherited;
  try
    IpList := TStringList.Create;
    a := mjGetLocalIpList(IpList);
    gridData.DataSource.DataSet.DisableControls;
    if not (adt_active.State in [dsEdit]) then
      adt_active.Edit;
    adt_active.FieldByName('update_time').Value := now();
    adt_active.FieldByName('update_by').Value := gvars.CurLoginID;
    adt_active.FieldByName('update_ip').Value := IpList.Strings[0];
    gridData.DataSource.DataSet.EnableControls;
  except
    exit;
  end;
end;

procedure TfrmModelParameterCUD.actGridSTFilterExecute(Sender: TObject);
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
    gridParaUSA.STFilter.Visible := not gridParaUSA.STFilter.Visible;
    if gridParaUSA.STFilter.Visible then
    begin
      gridParaUSA.ClearFilter;
      gridParaUSA.ApplyFilter;
    end;
  end
  else if PageControl1.ActivePageIndex = 2 then
  begin
    gridPackPara.STFilter.Visible := not gridPackPara.STFilter.Visible;
    if gridPackPara.STFilter.Visible then
    begin
      gridPackPara.ClearFilter;
      gridPackPara.ApplyFilter;
    end;
  end
  else if PageControl1.ActivePageIndex = 3 then
  begin
    gridPack.STFilter.Visible := not gridPack.STFilter.Visible;
    if gridPack.STFilter.Visible then
    begin
      gridPack.ClearFilter;
      gridPack.ApplyFilter;
    end;
  end;
end;

procedure TfrmModelParameterCUD.gridParaUSAGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if gridParaUSA.SumList.RecNo mod 2 = 1 then
    Background := $00FFC4C4
  else
    Background := $00FFDDDD;
end;

procedure TfrmModelParameterCUD.gridPackParaGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if gridPackPara.SumList.RecNo mod 2 = 1 then
    Background := $00FFC4C4
  else
    Background := $00FFDDDD;
end;

procedure TfrmModelParameterCUD.gridPackGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if gridPack.SumList.RecNo mod 2 = 1 then
    Background := $00FFC4C4
  else
    Background := $00FFDDDD;
end;

procedure TfrmModelParameterCUD.gridDataEnter(Sender: TObject);
begin
  inherited;
  DBNavigator1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbPost, nbCancel];
  DBNavigator1.DataSource := ds_active;
 // gridParaUSA.SelectedRows.Clear;
end;

procedure TfrmModelParameterCUD.gridParaUSAEnter(Sender: TObject);
begin
  inherited;
  DBNavigator1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbPost, nbCancel];
  DBNavigator1.DataSource := ds_ParaUSA;
  //gridData.SelectedRows.Clear;
end;

procedure TfrmModelParameterCUD.gridPackParaEnter(Sender: TObject);
begin
  inherited;
  DBNavigator1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbPost, nbCancel];
  DBNavigator1.DataSource := ds_PackPara;
end;

procedure TfrmModelParameterCUD.gridPackEnter(Sender: TObject);
begin
  inherited;
  DBNavigator1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbPost, nbCancel];
  DBNavigator1.DataSource := ds_pack;
end;

procedure TfrmModelParameterCUD.adt_packAfterPost(DataSet: TDataSet);
begin
  inherited;
  TADODataSet(DataSet).UpdateBatch();
end;

procedure TfrmModelParameterCUD.adt_packBeforePost(DataSet: TDataSet);
begin
  inherited;
  if not (DataSet.State in [dsEdit]) then
    DataSet.Edit;
  if DataSet.FieldByName('ISCHN').Value = null then
    DataSet.FieldByName('ISCHN').Value := 0;
end;

end.

