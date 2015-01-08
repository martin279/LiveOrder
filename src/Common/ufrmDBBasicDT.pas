unit ufrmDBBasicDT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmDBBasic, PropFilerEh, Menus, PropStorageEh, DB, ADODB,
  ActnList, ImgList, GridsEh, DBGridEh, StdCtrls, DBCtrls, ComCtrls,
  ToolWin, ExtCtrls, DataDriverEh, DBTables; //MemTableDataEh, MemTableEh,

type
  TfrmDBBasicDT = class(TfrmDBBasic)
    GroupBox2: TGroupBox;
    gridData2: TDBGridEh;
    adt_active2: TADODataSet;
    ds_active2: TDataSource;
    Splitter1: TSplitter;
    tbtnOperation: TToolButton;
    procedure gridData2GetFooterParams(Sender: TObject; DataCol,
      Row: Integer; Column: TColumnEh; AFont: TFont;
      var Background: TColor; var Alignment: TAlignment;
      State: TGridDrawState; var Text: string);
    procedure gridDataEnter(Sender: TObject);
    procedure gridData2Enter(Sender: TObject);
    procedure actGridSTFilterExecute(Sender: TObject);
    procedure adt_active2PostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure adt_active2DeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure adt_active2EditError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure gridData2GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure adt_active2AfterPost(DataSet: TDataSet);
    procedure tbtnOperationClick(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure InitializeForm; override;
    procedure DestoryForm; override;
    procedure SetUI; override;
    procedure SetAccess; override;
  public
    { Public declarations }
  end;


implementation

uses uMJ;


{$R *.dfm}

procedure TfrmDBBasicDT.DestoryForm;
begin
  inherited;

end;

procedure TfrmDBBasicDT.InitializeForm;
begin
  inherited;
  gridData2.DataSource.DataSet.Active := false;
end;

procedure TfrmDBBasicDT.SetUI;
var
  i: integer;
begin
  inherited;
  if (gridData2.DataSource = nil) or (not gridData2.DataSource.DataSet.Active) then exit;
  gridData2.EditActions := [geaCopyEh, geaSelectAllEh];
  gridData2.STFilter.Local := true;
  for i := 0 to gridData2.Columns.Count - 1 do
  begin
    if gridData2.Columns[i].Visible = true then
    begin
      gridData2.Columns[i].Title.TitleButton := true;
      gridData2.Columns[i].STFilter.ListSource := ds_active2;
      if gridData2.DataSource.DataSet.FieldByName(gridData2.Columns[i].FieldName).FieldKind = fkData then
      begin
        gridData2.Columns[i].STFilter.ListField := gridData2.Columns[i].FieldName;
        gridData2.Columns[i].STFilter.KeyField := gridData2.Columns[i].FieldName;
        gridData2.Columns[i].STFilter.DataField := gridData2.Columns[i].FieldName;
      end
      else if gridData2.DataSource.DataSet.FieldByName(gridData2.Columns[i].FieldName).FieldKind = fkLookup then
      begin
        gridData2.Columns[i].STFilter.ListField := gridData2.DataSource.DataSet.FieldByName(gridData2.Columns[i].FieldName).LookupResultField;
        gridData2.Columns[i].STFilter.KeyField := gridData2.DataSource.DataSet.FieldByName(gridData2.Columns[i].FieldName).LookupResultField;
        gridData2.Columns[i].STFilter.DataField := gridData2.DataSource.DataSet.FieldByName(gridData2.Columns[i].FieldName).LookupResultField;
      end;
    end;
  end;
  gridData2.Columns[0].Footer.ValueType := fvtCount;
  gridData2.Columns[0].Footer.Value := IntToStr(gridData2.DataSource.DataSet.RecordCount);
end;

procedure TfrmDBBasicDT.SetAccess;
begin
  inherited;
  gridData2.IndicatorTitle.ShowDropDownSign := false;
  gridData2.IndicatorTitle.TitleButton := false;
  gridData2.RowSizingAllowed := false;
  gridData2.ReadOnly := true;
  gridData2.Options := [dgEditing, dgTitles, dgIndicator, dgColumnResize
    , dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection
    , dgConfirmDelete, dgCancelOnExit, dgMultiSelect];
end;

procedure TfrmDBBasicDT.gridDataEnter(Sender: TObject);
begin
  DBNavigator1.DataSource := ds_active;
  gridData2.SelectedRows.Clear;
end;

procedure TfrmDBBasicDT.gridData2Enter(Sender: TObject);
begin
  DBNavigator1.DataSource := ds_active2;
  gridData.SelectedRows.Clear;
end;

procedure TfrmDBBasicDT.gridData2GetFooterParams(Sender: TObject;
  DataCol, Row: Integer; Column: TColumnEh; AFont: TFont;
  var Background: TColor; var Alignment: TAlignment; State: TGridDrawState;
  var Text: string);
begin
  if (Column.Field.Index = 0) then Text := 'Count:' + Text; //Text + ' records';
end;

procedure TfrmDBBasicDT.actGridSTFilterExecute(Sender: TObject);
begin
  inherited;
  gridData2.STFilter.Visible := not gridData2.STFilter.Visible;
  if gridData2.STFilter.Visible then
  begin
    gridData2.ClearFilter;
    gridData2.ApplyFilter;
  end;
end;

procedure TfrmDBBasicDT.tbtnOperationClick(Sender: TObject);
begin
  GroupBox2.Visible := not GroupBox2.Visible;
  pnlBottom.Visible := not pnlBottom.Visible;
  gridData2.DataSource.DataSet.Active := GroupBox2.Visible;
  Splitter1.Align := alTop;
  Splitter1.Align := alBottom;
end;

procedure TfrmDBBasicDT.adt_active2DeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  inherited;
  if (E is EDatabaseError) then
  begin
    MessageDlg('Delete error.' + E.Message, mtWarning, [mbOK], 0);
    DataSet.Cancel;
    Abort;
  end;
end;

procedure TfrmDBBasicDT.gridData2GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  inherited;
  if gridData2.SumList.RecNo mod 2 = 1 then
    Background := $00FFC4C4
  else
    Background := $00FFDDDD;
end;

procedure TfrmDBBasicDT.adt_active2EditError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  inherited;
  if (E is EDatabaseError) then
  begin
    MessageDlg('Edit error.' + E.Message, mtWarning, [mbOK], 0);
    DataSet.Cancel;
    Abort;
  end;
end;

procedure TfrmDBBasicDT.adt_active2PostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  inherited;
  if (E is EDatabaseError) then
  begin
    MessageDlg('Post error.' + E.Message, mtWarning, [mbOK], 0);
    DataSet.Cancel;
    Abort;
  end;
end;

procedure TfrmDBBasicDT.adt_active2AfterPost(DataSet: TDataSet);
begin
  TADODataSet(DataSet).UpdateBatch();
end;

end.

