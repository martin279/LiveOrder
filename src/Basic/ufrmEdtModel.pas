unit ufrmEdtModel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmDBBasic, PropFilerEh, ActnList, ImgList, DB, ADODB, Menus,
  PropStorageEh, DBCtrls, ComCtrls, ToolWin, GridsEh, DBGridEh, StdCtrls,
  ExtCtrls, uDMEntity, uDMManager;

type
  TfrmEdtModel = class(TfrmDBBasic)
    ds_family: TDataSource;
    adt_family: TADODataSet;
    ds_series: TDataSource;
    adt_series: TADODataSet;
    ds_plant: TDataSource;
    adt_plant: TADODataSet;
    adt_activePlantModelID: TAutoIncField;
    adt_activePlantID: TIntegerField;
    adt_activeModelID: TIntegerField;
    adt_activeProductSeriesID: TIntegerField;
    adt_activeProductFamilyID: TIntegerField;
    adt_activeModel: TStringField;
    adt_activeModelDescription: TStringField;
    adt_activeProductClassification: TStringField;
    adt_activeIsValid: TBooleanField;
    adt_activePlantCode1: TStringField;
    adt_activeProductFamilyName1: TStringField;
    adt_activeProductSeriesName1: TStringField;
    btnSave1: TButton;
    btnCancel: TButton;
    Label4: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    edtModelDesc: TEdit;
    edtModel: TEdit;
    chkIsValid: TCheckBox;
    cbbClass: TComboBox;
    cbbCI: TComboBox;
    edtModelChineseDesc: TEdit;
    Label5: TLabel;
    procedure btnSave1Click(Sender: TObject);
    procedure chkIsValidClick(Sender: TObject);
    procedure adt_activeBeforePost(DataSet: TDataSet);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
    sl1: TStringList;
    objMgrBasic: TMgrBasicData;
    ModelID: string;
    gIsInsert: boolean;
    function AddModelReturnModelID: string;
    function SaveModel: boolean;
  protected
    procedure InitializeForm; override;
    procedure DestoryForm; override;
    procedure SetData; override;
    procedure SetUI; override;
    procedure SetAccess; override;
  public
    { Public declarations }
    class procedure EdtFromList(adt_from: TADODataSet; isInsert: Boolean);
  end;

implementation

uses DataModule, uMJ;

{$R *.dfm}

{ TfrmEdtModel }

procedure TfrmEdtModel.InitializeForm;
begin
  objMgrBasic := TMgrBasicData.Create;
  sl1 := TStringList.Create;
  inherited;
end;

procedure TfrmEdtModel.DestoryForm;
begin
  inherited;
  objMgrBasic.Free;
end;

procedure TfrmEdtModel.SetData;
begin
  objMgrBasic.QueryBasicData(adt_plant, 'Plant');
  objMgrBasic.QueryBasicData(adt_family, 'ProductFamily');
  objMgrBasic.QueryBasicData(adt_series, 'ProductSeries');
  sl1.Append('ModelID=0');
  objMgrBasic.QueryBasicDataByParam(adt_active, 'ViewPlantModel', 'PlantModelID', sl1);
  inherited;
end;

procedure TfrmEdtModel.SetUI;
begin
  inherited;
end;

procedure TfrmEdtModel.SetAccess;
begin
  inherited;
  pnlBottom.Visible := true;
  gridData.ReadOnly := false;
  DBNavigator1.VisibleButtons := [nbFirst, nbNext, nbLast, nbPrior, nbInsert, nbPost, nbCancel];
  if (gVars.CurUserLevel = 3) then
  begin
    DBNavigator1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast];
    GroupBox1.Enabled := false;
    chkIsValid.Enabled := false;
    cbbCI.Enabled := false;
  end;
end;

class procedure TfrmEdtModel.EdtFromList(adt_from: TADODataSet;
  isInsert: Boolean);
begin
  with TfrmEdtModel.Create(Application) do
  try
    gIsInsert := isInsert;
    if isInsert then
    begin
      chkIsValid.Checked := true;
      chkIsValid.Enabled := false;
      chkIsValid.Color := clMenu;
      //TabSheet2.TabVisible := false;
    end
    else
    begin
      edtModel.Color := clMenu;
      edtModel.Enabled := false;
      chkIsValid.Checked := adt_from.fieldbyname('IsValid').AsBoolean;
      ModelID := adt_from.fieldbyname('ModelID').AsString;
      edtModel.Text := adt_from.fieldbyname('Model').AsString;
      edtModelDesc.Text := adt_from.fieldbyname('ModelDescription').AsString;
      edtModelChineseDesc.Text := adt_from.fieldbyname('ModelChineseDescription').AsString;
      cbbCI.ItemIndex := cbbCI.Items.IndexOf(adt_from.fieldbyname('CommodityInspection').AsString);
      cbbClass.ItemIndex := cbbClass.Items.IndexOf(adt_from.fieldbyname('ProductClassification').AsString);
      sl1.Clear;
      sl1.Append('ModelID=' + ModelID);
      objMgrBasic.QueryBasicDataByParam(adt_active, 'ViewPlantModel', 'PlantModelID', sl1);
    end;
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmEdtModel.adt_activeBeforePost(DataSet: TDataSet);
begin
  inherited;
  try
    //adt_plantmodel.DisableControls;
    if not (adt_active.State in [dsEdit]) then
      adt_active.Edit;
    adt_active.FieldByName('ModelID').Value := ModelID;
    //adt_plantmodel.EnableControls;
  except
    exit;
  end;
end;

function TfrmEdtModel.AddModelReturnModelID: string;
var
  Query: TADOQuery;
  strSql: string;
begin
  Query := TADOQuery.Create(self);
  Query.Connection := dm.ADOConnection1;
  try
    dm.ADOConnection1.BeginTrans;
    Query.SQL.Clear;
    strSql := 'exec usp_InsertModel @Model=''' + Trim(edtModel.Text)
      + ''',@ModelDescription=''' + Trim(edtModelDesc.Text)
      + ''',@ModelChineseDescription=''' + Trim(edtModelChineseDesc.Text)
      + ''',@ProductClassification=''' + Trim(cbbClass.Text)
      + ''',@IsValid=1';
    if Trim(cbbCI.Text) <> '' then
      strSql := strSql + ',@CommodityInspection=''' + Trim(cbbCI.Text) + '''';
    Query.SQL.Text := strSql;
    Query.ExecSQL;
    Query.SQL.Clear;
    Query.SQL.Text := 'select max(ModelID) as ModelID from Model';
    Query.Open;
    ModelID := Query.FieldValues['ModelID'];
    dm.ADOConnection1.CommitTrans;
    if Trim(edtModelDesc.Text) <> '' then
      mjSendMailReport('', 'Chunlei.Zhang@Emerson.com;Yanyun.Ge@emerson.com', 'New Model Information.', Trim(edtModel.Text));
    result := ModelID;
  except
    dm.ADOConnection1.RollbackTrans;
    result := '';
  end;
  Query.Close;
  Query.Free;
end;

function TfrmEdtModel.SaveModel: boolean;
var
  IsValid: integer;
  strSql: string;
begin
  if chkIsValid.Checked then
    IsValid := 1
  else
    IsValid := 0;
  try
    strSql := 'exec usp_UpdateModel @ModelID=' + ModelID + ',@Model=''' + Trim(edtModel.Text)
      + ''',@ModelDescription=''' + Trim(edtModelDesc.Text)
      + ''',@ModelChineseDescription=''' + Trim(edtModelChineseDesc.Text)
      + ''',@ProductClassification=''' + Trim(cbbClass.Text)
      + ''',@IsValid=' + IntToStr(IsValid);
    if Trim(cbbCI.Text) <> '' then
      strSql := strSql + ',@CommodityInspection=''' + Trim(cbbCI.Text) + '''';
    DM.DataSetModify(strSql);
    result := true;
  except
    result := false;
  end;
end;

procedure TfrmEdtModel.btnSave1Click(Sender: TObject);
//var
//  bk: TBookmark;
begin
  if gIsInsert then
  begin
    if AddModelReturnModelID = '' then
    begin
      application.messagebox('Save model failed! please check model if duplicate.', 'Prompt!');
      Exit;
    end;
  end
  else
  begin
    if not SaveModel then
      application.messagebox('Save model failed! please check.', 'Prompt!');
  {
    bk := ds_active.DataSet.GetBookmark;
    try
      if not SaveModel then
        application.messagebox('Save model failed! please check.', 'Prompt!');
    finally
      ds_active.DataSet.Active := false;
      ds_active.DataSet.Active := true;
      if ds_active.DataSet.BookmarkValid(bk) then
        ds_active.DataSet.GotoBookmark(bk);
      ds_active.DataSet.FreeBookmark(bk);
    end;   }
  end;
end;

procedure TfrmEdtModel.chkIsValidClick(Sender: TObject);
begin
  if not chkIsValid.Checked then
  begin
    if MessageDlg('Cancel this model?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      if SaveModel then
      begin
        ds_active.DataSet.Active := false;
        ds_active.DataSet.Active := true;
        close;
      end;
    end
    else
      chkIsValid.Checked := true;
  end;
end;

procedure TfrmEdtModel.btnCancelClick(Sender: TObject);
begin
  inherited;
  Close;
end;

end.

