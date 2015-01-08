unit ufrmUser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmDBBasicDT, PropFilerEh, MemTableDataEh, Db, ADODB,
  DataDriverEh, MemTableEh, Menus, PropStorageEh, ActnList, ImgList,
  GridsEh, DBGridEh, StdCtrls, ExtCtrls, DBCtrls, ComCtrls, ToolWin, uDMEntity, uDMManager;

type
  TfrmUser = class(TfrmDBBasicDT)
    adt_active2MainframeAccessID: TAutoIncField;
    adt_active2LoginID: TIntegerField;
    adt_active2MainframeLogin: TStringField;
    adt_active2MainframePassword: TStringField;
    adt_active2MainframeInitial: TStringField;
    adt_active2MainframeScreen: TStringField;
    adt_active2PlantID: TIntegerField;
    adt_active2PlantCode: TStringField;
    adt_plant: TADODataSet;
    adt_active2PlantCode1: TStringField;
    N2: TMenuItem;
    MenuAssignMenu: TMenuItem;
    MenuAssignPlant: TMenuItem;
    procedure MenuAssignPlantClick(Sender: TObject);
    procedure MenuAssignMenuClick(Sender: TObject);
    procedure actGridSTFilterExecute(Sender: TObject);
    procedure gridDataCellClick(Column: TColumnEh);
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

uses DataModule, uMJ, ufrmUserMenu, ufrmUserPlant;

{$R *.dfm}

{ TfrmUser }

procedure TfrmUser.InitializeForm;
begin
  objMgrBasic := TMgrBasicData.Create;
  inherited;
end;

procedure TfrmUser.DestoryForm;
begin
  inherited;
  objMgrBasic.Free;
end;

procedure TfrmUser.SetData;
var
  sl1: TStringList;
begin
  sl1 := TStringList.Create;
  objMgrBasic.QueryBasicData(adt_plant, 'Plant');
  sl1.Append('LoginID=' + IntToStr(objCurUser.LoginID));
  if objCurUser.AccessLevel = 1 then
    objMgrBasic.QueryBasicData(adt_active, 'Login')
  else
    objMgrBasic.QueryBasicDataByParam(adt_active, 'Login', 'LoginID', sl1);
  objMgrBasic.QueryBasicDataByParam(adt_active2, 'ViewMainframeAccess', 'MainframeAccessID', sl1);
  sl1.Free;
end;

procedure TfrmUser.SetUI;
begin
  inherited;
  GroupBox1.Caption := 'User Information';
  GroupBox2.Caption := 'Mainframe Access';
end;

procedure TfrmUser.SetAccess;
var
  i: integer;
begin
  inherited;
  gridData.ReadOnly := false;
  gridData2.ReadOnly := false;
  if gVars.CurUserLevel = 1 then
  begin
    DBNavigator1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
      + [nbInsert, nbPost, nbCancel];
  end
  else
  begin
    MenuAssignMenu.Visible := false;
    MenuAssignPlant.Visible := false;
    DBNavigator1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbPost, nbCancel];
    GroupBox2.Visible := false;
    for i := 0 to gridData.VisibleColumns.Count - 1 do
    begin
      if gridData.Columns[i].FieldName <> 'LoginPassword' then
        gridData.Columns[i].ReadOnly := true;
    end;
    for i := 0 to gridData2.VisibleColumns.Count - 1 do
    begin
      if gridData2.Columns[i].FieldName = 'LoginID' then
        gridData2.Columns[i].ReadOnly := true;
    end;
  end;
end;

procedure TfrmUser.MenuAssignMenuClick(Sender: TObject);
begin
  if gridData.DataSource.DataSet.RecordCount <> 0 then
    TfrmUserMenu.EdtFromList(TADODataSet(gridData.DataSource.DataSet));
end;

procedure TfrmUser.MenuAssignPlantClick(Sender: TObject);
begin
  if adt_active.RecordCount <> 0 then
    TfrmUserPlant.EdtFromList(TADODataSet(adt_active));
end;

procedure TfrmUser.actGridSTFilterExecute(Sender: TObject);
begin
  gridData.STFilter.Visible := not gridData.STFilter.Visible;
  if gridData.STFilter.Visible then
  begin
    gridData.ClearFilter;
    gridData.ApplyFilter;
  end;
end;

procedure TfrmUser.gridDataCellClick(Column: TColumnEh);
begin
  inherited;
  if adt_active.FieldByName('LoginID').AsString <> '' then
    DM.DataSetQuery(adt_active2, 'EXEC usp_GetMainframeScreen @LoginID='
      + adt_active.FieldByName('LoginID').AsString);
end;

end.

