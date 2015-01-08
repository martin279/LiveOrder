unit ufrmDBBasicTreeDT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmDBBasicTree, PropFilerEh, DB, ADODB, Menus, PropStorageEh,
  ActnList, ImgList, StdCtrls, Buttons, ComCtrls, GridsEh, DBGridEh,
  ExtCtrls, DBCtrls, ToolWin, MemTableDataEh, DataDriverEh, MemTableEh;

type
  TfrmDBBasicTreeDT = class(TfrmDBBasicTree)
    pnlBodyBottom: TPanel;
    GroupBox2: TGroupBox;
    gridData2: TDBGridEh;
    Splitter2: TSplitter;
    ds_active2: TDataSource;
    adt_active2: TADODataSet;
    tbtnOperation: TToolButton;
    pnlBodyRight: TPanel;
    procedure tbtnOperationClick(Sender: TObject);
    procedure gridDataEnter(Sender: TObject);
    procedure gridData2Enter(Sender: TObject);
    procedure actGridSTFilterExecute(Sender: TObject);
    procedure gridData2GetFooterParams(Sender: TObject; DataCol,
      Row: Integer; Column: TColumnEh; AFont: TFont;
      var Background: TColor; var Alignment: TAlignment;
      State: TGridDrawState; var Text: string);
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure gridData2GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure gridData2Exit(Sender: TObject);
{    procedure gridData2TitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure gridData2SortMarkingChanged(Sender: TObject);}
  private
    { Private declarations }
  protected
    procedure SetData; override;
    procedure SetUI; override;
    procedure SetGridData2;
    procedure SetAccess; override;
    procedure LoadTreeView(nodeName: string); override;
  public
    { Public declarations }
  end;

implementation

uses uMJ, ufrmDBBasic;

{$R *.dfm}

{ TfrmDBBasicTreeDT }

procedure TfrmDBBasicTreeDT.SetData;
begin

end;

procedure TfrmDBBasicTreeDT.SetUI;
begin
  inherited;
  tbtnOperation.Visible := false; 
  pnlBodyRight.Visible:=false; 
  pnlBodyBottom.Visible:=false;
  SetGridData2; {
  gridData.Options := [dgEditing, dgTitles, dgIndicator, dgColumnResize
    , dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection //, dgRowSelect
    , dgConfirmDelete, dgCancelOnExit, dgMultiSelect];
  gridData2.Options := [dgEditing, dgTitles, dgIndicator, dgColumnResize
    , dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection //, dgRowSelect
    , dgConfirmDelete, dgCancelOnExit, dgMultiSelect];    }
end;

procedure TfrmDBBasicTreeDT.SetAccess;
begin
  inherited;
end;

procedure TfrmDBBasicTreeDT.SetGridData2;
var
  i: integer;
begin
  if (gridData2.DataSource = nil) then exit;
//  gridData2.DataSource := ds_active2;
  gridData2.EditActions := [geaCopyEh, geaSelectAllEh];
  gridData2.SortLocal := true;
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
  gridData2.SumList.Active := true;
  gridData2.SumList.VirtualRecords := true;
  gridData2.Columns[0].Footer.ValueType := fvtCount;
  //if gridData2.DataSource.DataSet.Active = true then
    //gridData2.Columns[0].Footer.Value := IntToStr(gridData2.DataSource.DataSet.RecordCount);

  gridData2.IndicatorTitle.ShowDropDownSign := false;
  gridData2.IndicatorTitle.TitleButton := false;
  gridData2.RowSizingAllowed := false;
  gridData2.ReadOnly := true;
  gridData2.Options := [dgEditing, dgTitles, dgIndicator, dgColumnResize
    , dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection
    , dgConfirmDelete, dgCancelOnExit, dgMultiSelect];
  gridData2.OptionsEh := [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus
    , dghClearSelection, dghAutoSortMarking, dghMultiSortMarking
    , dghTraceColSizing, dghIncSearch, dghPreferIncSearch
    , dghRowHighlight, dghDblClickOptimizeColWidth, dghDialogFind];
end;

procedure TfrmDBBasicTreeDT.tbtnOperationClick(Sender: TObject);
begin
  pnlBodyRight.Visible := not pnlBodyRight.Visible;
  pnlBodyBottom.Visible := pnlBodyRight.Visible;
  Splitter2.Align := alTop;
  Splitter2.Align := alBottom;
end;

procedure TfrmDBBasicTreeDT.gridDataEnter(Sender: TObject);
begin
  inherited;
  DBNavigator1.DataSource := ds_active;
  gridData2.SelectedRows.Clear;
end;

procedure TfrmDBBasicTreeDT.gridData2Enter(Sender: TObject);
begin
  inherited;
  gridData.SelectedRows.Clear;
  DBNavigator1.DataSource := ds_active2;
//  gridData2.PopupMenu := PopupMenu1;
end;

procedure TfrmDBBasicTreeDT.gridData2Exit(Sender: TObject);
begin
  inherited;
//  gridData2.PopupMenu := nil;
end;

procedure TfrmDBBasicTreeDT.actGridSTFilterExecute(Sender: TObject);
begin
  inherited;
  if (gridData2.DataSource = nil) or (not gridData2.DataSource.DataSet.Active) then exit;
  if gridData2.STFilter.Visible then
  begin
    gridData2.ClearFilter;
    gridData2.ApplyFilter;
  end;
  gridData2.STFilter.Visible := not gridData2.STFilter.Visible;
end;

procedure TfrmDBBasicTreeDT.gridData2GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  inherited;
  if gridData2.SumList.RecNo mod 2 = 1 then
    Background := $00FFC4C4
  else
    Background := $00FFDDDD;
end;

procedure TfrmDBBasicTreeDT.gridData2GetFooterParams(Sender: TObject;
  DataCol, Row: Integer; Column: TColumnEh; AFont: TFont;
  var Background: TColor; var Alignment: TAlignment; State: TGridDrawState;
  var Text: string);
begin
  inherited;
  if (Column.Field.Index = 0) then Text := 'Count:' + Text; //Text + ' records';
end;

procedure TfrmDBBasicTreeDT.LoadTreeView(nodeName: string);
begin
  inherited; {
  gridData2.Options := [dgEditing, dgTitles, dgIndicator, dgColumnResize
    , dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection
    , dgConfirmDelete, dgCancelOnExit, dgMultiSelect];     }
end;

procedure TfrmDBBasicTreeDT.TreeView1Change(Sender: TObject;
  Node: TTreeNode);
begin
  inherited;
  RecoverGrid(gridData, ds_active);
  if gridData2.DataSource <> nil then
    RecoverGrid(gridData2, ds_active2);
end;


end.

