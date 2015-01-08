unit ufrmDBBasic;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmBasic, ActnList, ImgList, ComCtrls, ToolWin, ExtCtrls, GridsEh, DBGridEh,
  DB, ADODB, DBCtrls, Menus, clipbrd, StdCtrls, Buttons, PropFilerEh, PropStorageEh,
  DBGridEhImpExp, ShellApi, uDMManager;

type
  TfrmDBBasic = class(TfrmBasic)
    gridData: TDBGridEh;
    ds_active: TDataSource;
    PopupMenu1: TPopupMenu;
    ppmCut: TMenuItem;
    ppmCopy: TMenuItem;
    ppmPaste: TMenuItem;
    ppmDelete: TMenuItem;
    ppmSelectAll: TMenuItem;
    N1: TMenuItem;
    ppmSaveSelection: TMenuItem;
    SaveDialog1: TSaveDialog;
    PropStorageEh1: TPropStorageEh;
    pnlBottom: TPanel;
    GroupBox1: TGroupBox;
    adt_active: TADODataSet;
    PageControl1: TPageControl;
    tbsBody1: TTabSheet;
    PnlTop: TPanel;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    tbtnExit: TToolButton;
    ToolButton2: TToolButton;
    DBNavigator1: TDBNavigator;
    ToolButton3: TToolButton;
    tbtnFilter: TToolButton;
    ImageList1: TImageList;
    ActionList1: TActionList;
    actExit: TAction;
    actGridSTFilter: TAction;
    actFind: TAction;
    MenuExportFromDataset: TMenuItem;
    SaveDialog2: TSaveDialog;
    procedure gridDataColWidthsChanged(Sender: TObject);
    procedure gridDataKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ppmCutClick(Sender: TObject);
    procedure ppmCopyClick(Sender: TObject);
    procedure ppmPasteClick(Sender: TObject);
    procedure ppmDeleteClick(Sender: TObject);
    procedure ppmSelectAllClick(Sender: TObject);
    procedure ppmSaveSelectionClick(Sender: TObject);
   // procedure gridDataTitleBtnClick(Sender: TObject; ACol: Integer;
   //   Column: TColumnEh);
//    procedure gridDataSortMarkingChanged(Sender: TObject);
    procedure adt_activePostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    //procedure btnSaveClick(Sender: TObject);
    //procedure adt_activeAfterRefresh(DataSet: TDataSet);
    procedure actGridSTFilterExecute(Sender: TObject);
    procedure gridDataGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure gridDataGetFooterParams(Sender: TObject; DataCol,
      Row: Integer; Column: TColumnEh; AFont: TFont;
      var Background: TColor; var Alignment: TAlignment;
      State: TGridDrawState; var Text: string);
    procedure adt_activeDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure adt_activeEditError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure adt_activeAfterDelete(DataSet: TDataSet);
    procedure adt_activeAfterPost(DataSet: TDataSet);
    procedure actExitExecute(Sender: TObject);
    procedure MenuExportFromDatasetClick(Sender: TObject);
  private
    { Private declarations }
    procedure ExceptionHandler(Sender: TObject; ExceptionObj: Exception);
  protected
    procedure InitializeForm; override;
    procedure DestoryForm; override;
    procedure SetUI; override;
    procedure SetAccess; override;
    procedure SetGridUI(aGridData: TDBGridEh = nil; aDataSource: TDataSource = nil);
    procedure SetPopupMenu;
//    procedure Refresh_PreservePosition(gridFrom: TDBGridEh);
    function CheckIfSelectRows(gridFrom: TDBGridEh; IsSelectMultiRows: Boolean = true; strWarMsg: string = ''): Boolean;
    procedure RecoverGrid(gridFrom: TDBGridEh; dsFrom: TDataSource = nil; IsClearFilter: Boolean = true); virtual;
    procedure RefreshGrid(gridFrom: TDBGridEh; dsFrom: TDataSource); virtual;
    function GetBatchFieldValueFromGrid(gridFrom: TDBGridEh; fieldName: string; IsSelectRows: Boolean = true): WideString;
  public
    { Public declarations }
    FilterControlList: TStringList;
    function GridSelectionAsText(AGrid: TDBGridEh): string;
    procedure ColumnMenuItem(Sender: TObject);
    procedure ApplicationIdle(Sender: TObject; var Done: Boolean);
    procedure BuildIndicatorTitleMenu(Grid: TCustomDBGridEh; var PopupMenu: TPopupMenu);
    procedure mjSaveDBGridEhToExcel(fileName: string);
  end;


var
  IniPropStorageMan: TIniPropStorageManEh;

implementation

{$R *.dfm}
uses DataModule, uMJ, CustPrev, EHLibADO, EhlibMTE, DataSets2Excel;

procedure TfrmDBBasic.InitializeForm;
begin
  Application.OnIdle := ApplicationIdle;
  Application.OnException := ExceptionHandler;
  FilterControlList := TStringList.Create;
  inherited;
end;

procedure TfrmDBBasic.DestoryForm;
begin
  FilterControlList.Free;
  Application.OnIdle := nil;
  inherited;
end;

procedure TfrmDBBasic.SetUI;
begin
  inherited;
  GroupBox1.Caption := Caption;
  tbsBody1.TabVisible := false;
  PageControl1.ActivePage := tbsBody1;
  pnlBottom.Visible := false;
  DBNavigator1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh];
  SetGridUI;
end;

procedure TfrmDBBasic.SetGridUI(aGridData: TDBGridEh; aDataSource: TDataSource);
var
  i: integer;
begin
  if aGridData = nil then aGridData := gridData;
  if aDataSource = nil then aDataSource := ds_active;

  aGridData.ReadOnly := true;
  aGridData.Align := alClient;
  aGridData.UseMultiTitle := true;
  aGridData.Flat := true;
  aGridData.ParentFont := false;
  aGridData.ParentShowHint := false;
  aGridData.PopupMenu := PopupMenu1;
  aGridData.FrozenCols := 1;
  aGridData.ShowHint := true;

  aGridData.EditActions := [geaCutEh, geaCopyEh, geaPasteEh, geaDeleteEh, geaSelectAllEh];
  aGridData.SortLocal := true;
  aGridData.STFilter.Local := true;
  for i := 0 to aGridData.Columns.Count - 1 do
  begin
    if aGridData.Columns[i].Visible = true then
    begin
      aGridData.Columns[i].Title.TitleButton := true;
      aGridData.Columns[i].STFilter.ListSource := aDataSource;
      if aGridData.DataSource.DataSet.FieldByName(aGridData.Columns[i].FieldName).FieldKind = fkData then
      begin
        aGridData.Columns[i].STFilter.ListField := aGridData.Columns[i].FieldName;
        aGridData.Columns[i].STFilter.KeyField := aGridData.Columns[i].FieldName;
        aGridData.Columns[i].STFilter.DataField := aGridData.Columns[i].FieldName;
      end
      else if aGridData.DataSource.DataSet.FieldByName(aGridData.Columns[i].FieldName).FieldKind = fkLookup then
      begin
        aGridData.Columns[i].STFilter.ListField := aGridData.DataSource.DataSet.FieldByName(aGridData.Columns[i].FieldName).LookupResultField;
        aGridData.Columns[i].STFilter.KeyField := aGridData.DataSource.DataSet.FieldByName(aGridData.Columns[i].FieldName).LookupResultField;
        aGridData.Columns[i].STFilter.DataField := aGridData.DataSource.DataSet.FieldByName(aGridData.Columns[i].FieldName).LookupResultField;
      end;
    end;
  end;
  aGridData.SumList.Active := true;
  aGridData.SumList.VirtualRecords := true;
  aGridData.Columns[0].Footer.ValueType := fvtCount;
 // if aGridData.DataSource.DataSet.Active = true then
 //   aGridData.Columns[0].Footer.Value := IntToStr(aGridData.DataSource.DataSet.RecordCount);
  //if LowerCase(copy(aGridData.Columns[0].Title.Caption, Length(aGridData.Columns[0].Title.Caption) - 1, Length(aGridData.Columns[0].Title.Caption))) = 'id' then
  //  aGridData.Columns[0].Title.Caption := 'ID';

  aGridData.IndicatorTitle.ShowDropDownSign := false;
  aGridData.IndicatorTitle.TitleButton := false;
  aGridData.RowSizingAllowed := false;
  aGridData.AllowedOperations := [alopUpdateEh];
  aGridData.Options := [dgEditing, dgTitles, dgIndicator, dgColumnResize
    , dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection
    , dgConfirmDelete, dgCancelOnExit, dgMultiSelect];
  aGridData.OptionsEh := [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus
    , dghClearSelection, dghAutoSortMarking, dghMultiSortMarking
    , dghTraceColSizing, dghIncSearch, dghPreferIncSearch
    , dghRowHighlight, dghDblClickOptimizeColWidth, dghDialogFind];
  if objCurUser.AccessLevel <> 1 then
    SetPopupMenu;
end;

procedure TfrmDBBasic.SetAccess;
begin
  inherited;
end;

procedure TfrmDBBasic.SetPopupMenu;
var
  i: integer;
begin
{  ppmCut.Visible := false;
  ppmPaste.Visible := false;
  ppmDelete.Visible := false;  }
  if PopupMenu1.Items.Count > 6 then
  begin
    for i := 0 to PopupMenu1.Items.Count - 1 do
    begin
      if (PopupMenu1.Items[i].Name <> 'ppmCopy')
        and (PopupMenu1.Items[i].Name <> 'ppmSelectAll')
        and (PopupMenu1.Items[i].Name <> 'ppmSaveSelection')
        and (PopupMenu1.Items[i].Name <> 'MenuExportFromDataset') then
        PopupMenu1.Items[i].Visible := false;
    end;
  end;
  gridData.OnDblClick := nil;
end;

{$IFDEF CIL}

function DataSetCompareBookmarks(DataSet: TDataSet; Bookmark1, Bookmark2: TBookmarkStr): Integer;
var
  I1, I2: IntPtr;
begin
  try
    I1 := Marshal.StringToHGlobalAnsi(Bookmark1);
    I2 := Marshal.StringToHGlobalAnsi(Bookmark1);
    Result := DataSet.CompareBookmarks(TBookmark(I1), TBookmark(I2));
  finally
    Marshal.FreeHGlobal(I1);
    if Assigned(I2) then
      Marshal.FreeHGlobal(I2);
  end;
end;
{$ELSE}

function DataSetCompareBookmarks(DataSet: TDataSet; Bookmark1, Bookmark2: TBookmarkStr): Integer;
begin
  Result := DataSet.CompareBookmarks(TBookmark(Bookmark1), TBookmark(Bookmark2));
end;
{$ENDIF}

procedure TfrmDBBasic.ApplicationIdle(Sender: TObject; var Done: Boolean);
begin
  // Under Delphi 4 and upper better to user Actions to determine
  // enablitity buttons and menus
  try
    //bbCopy.Enabled := gridData.Selection.SelectionType <> gstNon;
    if ActiveControl is TDBGridEh then
      with TDBGridEh(ActiveControl) do
      begin
        ppmCut.Enabled := CheckCutAction and (geaCutEh in EditActions);
        ppmCopy.Enabled := CheckCopyAction and (geaCopyEh in EditActions);
        ppmPaste.Enabled := CheckPasteAction and (geaPasteEh in EditActions);
        ppmDelete.Enabled := CheckDeleteAction and (geaDeleteEh in EditActions);
        ppmSelectAll.Enabled := CheckSelectAllAction and (geaSelectAllEh in EditActions);
        ppmSaveSelection.Enabled := CheckCopyAction and (geaCopyEh in EditActions);
        //ppmPreview.Enabled := True;
      end;
  except on E: Exception do
    begin
      ShowMessage(E.Message);
    end;
  end;
end;

procedure TfrmDBBasic.ExceptionHandler(Sender: TObject;
  ExceptionObj: Exception);
begin
  Application.OnIdle := nil;
end;

procedure TfrmDBBasic.gridDataColWidthsChanged(Sender: TObject);
var
  Indent, i, k: Integer;
  control: TControl;
begin
  inherited;
  if not Assigned(FilterControlList) then Exit;
  Indent := IndicatorWidth + 2;
  for i := 0 to gridData.Columns.Count - 1 do
  begin
    k := FilterControlList.IndexOf(gridData.Columns.Items[i].FieldName);
    if (k <> -1) then
    begin
      control := (TControl(FilterControlList.Objects[k]));
      control.Left := Indent + 1;
      control.Width := gridData.Columns.Items[i].Width - 1;
    end;
    Indent := Indent + gridData.Columns.Items[i].Width + 1;
  end;
end;

procedure TfrmDBBasic.gridDataKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = VK_INSERT) and ([ssCtrl] = Shift) then
    Clipboard.AsText := GridSelectionAsText(gridData);
end;

function TfrmDBBasic.GridSelectionAsText(AGrid: TDBGridEh): string;
var //bm:TBookmarkStr;
  i, j: Integer;
  ss: TStringStream;

  function StringTab(s: string; Index, Count: Integer): string;
  begin
    if Index <> Count then
      Result := s + #09
    else
      Result := s;
  end;
begin
  Result := '';
  with AGrid do
  begin
    if Selection.SelectionType = gstNon then Exit;
    ss := TStringStream.Create('');
    with Datasource.Dataset do
    try
      // BM := Bookmark;
      SaveBookmark;
      DisableControls;
      try
        case Selection.SelectionType of
          gstRecordBookmarks:
            begin
              for I := 0 to Selection.Rows.Count - 1 do
              begin
                Bookmark := Selection.Rows[I];
                for j := 0 to VisibleColumns.Count - 1 do
                  ss.WriteString(StringTab(VisibleColumns[j].DisplayText, j, VisibleColumns.Count - 1));
                ss.WriteString(#13#10);
              end;
            end;
          gstRectangle:
            begin
              Bookmark := Selection.Rect.TopRow;
              while True do
              begin
                for j := Selection.Rect.LeftCol to Selection.Rect.RightCol do
                  if Columns[j].Visible then
                    ss.WriteString(StringTab(Columns[j].DisplayText, j, Selection.Rect.RightCol));
                if DataSetCompareBookmarks(Datasource.Dataset, Selection.Rect.BottomRow, Bookmark) = 0 then Break;
                Next;
                if Eof then Break;
                ss.WriteString(#13#10);
              end;
            end;
          gstColumns:
            begin
              for j := 0 to Selection.Columns.Count - 1 do
                ss.WriteString(StringTab(Selection.Columns[j].Title.Caption, j, Selection.Columns.Count - 1));
              ss.WriteString(#13#10);
              First;
              while EOF = False do
              begin
                for j := 0 to Selection.Columns.Count - 1 do
                  ss.WriteString(StringTab(Selection.Columns[j].DisplayText, j, Selection.Columns.Count - 1));
                ss.WriteString(#13#10);
                Next;
              end;
              for i := 0 to FooterRowCount - 1 do
              begin
                for j := 0 to Selection.Columns.Count - 1 do
                  ss.WriteString(StringTab(GetFooterValue(i, Selection.Columns[j]), j, Selection.Columns.Count - 1));
                ss.WriteString(#13#10);
              end;
            end;
          gstAll:
            begin
              for j := 0 to VisibleColumns.Count - 1 do
                ss.WriteString(StringTab(VisibleColumns[j].Title.Caption, j, VisibleColumns.Count - 1));
              ss.WriteString(#13#10);
              First;
              while EOF = False do
              begin
                for j := 0 to VisibleColumns.Count - 1 do
                  ss.WriteString(StringTab(VisibleColumns[j].DisplayText, j, VisibleColumns.Count - 1));
                ss.WriteString(#13#10);
                Next;
              end;
              for i := 0 to FooterRowCount - 1 do
              begin
                for j := 0 to VisibleColumns.Count - 1 do
                  ss.WriteString(StringTab(GetFooterValue(i, VisibleColumns[j]), j, VisibleColumns.Count - 1));
                ss.WriteString(#13#10);
              end;
            end;
        end;
        Result := ss.DataString;
      finally
        //Bookmark := BM;
        RestoreBookmark;
        EnableControls;
      end;
    finally
      ss.Free;
    end;
  end;
end;

procedure TfrmDBBasic.ColumnMenuItem(Sender: TObject);
begin
  TColumnEh(TMenuItem(Sender).Tag).Index := gridData.VisibleColumns.Count;
  TColumnEh(TMenuItem(Sender).Tag).Visible := True;
  Sender.Free;
//  if (gridData.Columns.Count = gridData.VisibleColumns.Count) then
//    btnPrevious.Enabled := False;
end;

procedure TfrmDBBasic.BuildIndicatorTitleMenu(Grid: TCustomDBGridEh;
  var PopupMenu: TPopupMenu);
begin
  DBGridEhCenter.DefaultBuildIndicatorTitleMenu(Grid, PopupMenu);
end;

procedure TfrmDBBasic.ppmCutClick(Sender: TObject);
begin
  inherited;
  if (ActiveControl is TDBGridEh) then
    with TDBGridEh(ActiveControl) do
      if CheckCutAction and (geaCutEh in EditActions) then
        DBGridEh_DoCutAction(TDBGridEh(ActiveControl), False);
end;

procedure TfrmDBBasic.ppmCopyClick(Sender: TObject);
begin
  inherited;
  if (ActiveControl is TDBGridEh) then
    with TDBGridEh(ActiveControl) do
      if CheckCopyAction and (geaCopyEh in EditActions) then
        DBGridEh_DoCopyAction(TDBGridEh(ActiveControl), False);
end;

procedure TfrmDBBasic.ppmPasteClick(Sender: TObject);
begin
  inherited;
  if (ActiveControl is TDBGridEh) then
    with TDBGridEh(ActiveControl) do
      if CheckPasteAction and (geaPasteEh in EditActions) then
        DBGridEh_DoPasteAction(TDBGridEh(ActiveControl), False);
end;

procedure TfrmDBBasic.ppmDeleteClick(Sender: TObject);
begin
  inherited;
  if (ActiveControl is TDBGridEh) then
    with TDBGridEh(ActiveControl) do
      if CheckDeleteAction and (geaDeleteEh in EditActions) then
        DBGridEh_DoDeleteAction(TDBGridEh(ActiveControl), False);
end;

procedure TfrmDBBasic.ppmSelectAllClick(Sender: TObject);
begin
  inherited;
  if (ActiveControl is TDBGridEh) then
    with TDBGridEh(ActiveControl) do
      if CheckSelectAllAction and (geaSelectAllEh in EditActions) then
        Selection.SelectAll;
end;

procedure TfrmDBBasic.ppmSaveSelectionClick(Sender: TObject);
var
  ExpClass: TDBGridEhExportClass;
  Ext, fileName: string;
begin
  inherited;
  if MessageDlg('Is Open?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    fileName := 'D:\' + FormatDateTime('YYYYmmddhhmmss', now) + '.xls';
    mjSaveDBGridEhToExcel(fileName);
    ShellExecute(0, 'Open', PChar(fileName), nil, nil, SW_SHOW);
  end
  else
  begin
    SaveDialog1.FileName := 'file1';
    if (ActiveControl is TDBGridEh) then
      if SaveDialog1.Execute then
      begin
        case SaveDialog1.FilterIndex of
          1:
            begin
              ExpClass := TDBGridEhExportAsText; Ext := 'txt';
            end;
          2:
            begin
              ExpClass := TDBGridEhExportAsCSV; Ext := 'csv';
            end;
          3:
            begin
              ExpClass := TDBGridEhExportAsHTML; Ext := 'htm';
            end;
          4:
            begin
              ExpClass := TDBGridEhExportAsRTF; Ext := 'rtf';
            end;
          5:
            begin
              ExpClass := TDBGridEhExportAsXLS; Ext := 'xls';
            end;
        else
          ExpClass := nil; Ext := '';
        end;
        if ExpClass <> nil then
        begin
          if UpperCase(Copy(SaveDialog1.FileName, Length(SaveDialog1.FileName) - 2, 3)) <>
            UpperCase(Ext) then
            SaveDialog1.FileName := SaveDialog1.FileName + '.' + Ext;
          SaveDBGridEhToExportFile(ExpClass, TDBGridEh(ActiveControl),
            SaveDialog1.FileName, False);
        end;
      end;
  end;
end;

procedure TfrmDBBasic.mjSaveDBGridEhToExcel(fileName: string);
var
  ExpClass: TDBGridEhExportClass;
  Ext: string;
begin
  inherited;
  if (ActiveControl is TDBGridEh) then
  begin
    ExpClass := TDBGridEhExportAsXLS; Ext := 'xls';
    if UpperCase(Copy(fileName, Length(fileName) - 2, 3))
      <> UpperCase(Ext) then
      fileName := 'file1' + '.' + Ext;
    SaveDBGridEhToExportFile(ExpClass, TDBGridEh(ActiveControl),
      fileName, False);
  end;
end;

procedure TfrmDBBasic.MenuExportFromDatasetClick(Sender: TObject);
var
  ADataSets: array of TDataSet;
begin
  inherited;
  if adt_active.RecordCount > 0 then
  begin
    SaveDialog2.FileName := 'file1';
    if SaveDialog2.Execute then
    begin
      SetLength(ADataSets, 1);
      ADataSets[0] := TDataSet(adt_active);
      DataSetsToExcel(ADataSets, '', SaveDialog2.FileName + '.xls');
      ShowMessage('Finish.');
    end;
  end
  else
    ShowMessage('Dataset is null, please query first.');
end;

procedure TfrmDBBasic.adt_activePostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  inherited;
  if (E is EDatabaseError) then
  begin
    MessageDlg(E.Message, mtWarning, [mbOK], 0);
    DataSet.Cancel;
    Abort;
  end;
end;

procedure TfrmDBBasic.adt_activeDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  inherited;
  if (E is EDatabaseError) then
  begin
    MessageDlg(E.Message, mtWarning, [mbOK], 0);
    DataSet.Cancel;
    Abort;
  end;
end;

procedure TfrmDBBasic.adt_activeEditError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  inherited;
  if (E is EDatabaseError) then
  begin
    MessageDlg(E.Message, mtWarning, [mbOK], 0);
    DataSet.Cancel;
    Abort;
  end;
end;

{
procedure TfrmDBBasic.btnSaveClick(Sender: TObject);
begin
  inherited;
  adt_active.Filtered := True;
  adt_active.FilterGroup := fgPendingRecords;
  if MessageDlg('Save these record change?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    try
      adt_active.UpdateBatch();
      adt_active.Requery();
    except on E: Exception do
        MessageDlg(E.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;

procedure TfrmDBBasic.adt_activeAfterRefresh(DataSet: TDataSet);
begin
  inherited;
  adt_active.Requery();
end;
}

procedure TfrmDBBasic.gridDataGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  inherited;
  if gridData.SumList.RecNo mod 2 = 1 then
    Background := $00FFC4C4
  else
    Background := $00FFDDDD;
end;

procedure TfrmDBBasic.gridDataGetFooterParams(Sender: TObject; DataCol,
  Row: Integer; Column: TColumnEh; AFont: TFont; var Background: TColor;
  var Alignment: TAlignment; State: TGridDrawState; var Text: string);
begin
  if (Column.Field.Index = 0) then
    Text := 'Count:' + Text; //Text + ' records';
end;

procedure TfrmDBBasic.actGridSTFilterExecute(Sender: TObject);
begin
  if gridData.STFilter.Visible then
  begin
    gridData.ClearFilter;
    gridData.ApplyFilter;
  end;
  gridData.STFilter.Visible := not gridData.STFilter.Visible;
end;

procedure TfrmDBBasic.adt_activeAfterDelete(DataSet: TDataSet);
begin
  inherited;
  DataSet.Active := false;
  DataSet.Active := true;
end;

procedure TfrmDBBasic.adt_activeAfterPost(DataSet: TDataSet);
begin
  TADODataSet(DataSet).UpdateBatch();
end;

procedure TfrmDBBasic.actExitExecute(Sender: TObject);
begin
  inherited;
  Close;
end;

function TfrmDBBasic.CheckIfSelectRows(gridFrom: TDBGridEh;
  IsSelectMultiRows: Boolean; strWarMsg: string): Boolean;
var
  warmsg: string;
begin
  warmsg := '';
  if strWarMsg <> '' then
    if MessageDlg(strWarMsg + '?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    begin
      Result := false;
      Exit;
    end;
  if gridFrom.DataSource.DataSet.RecordCount = 0 then
    warmsg := 'There haven''t data in this grid.';
  if IsSelectMultiRows then
    if gridFrom.SelectedRows.Count = 0 then
      warmsg := 'please select rows first.';
  if warmsg <> '' then
  begin
    ShowMessage(warmsg);
    Result := false;
  end
  else
    Result := true;
end;

procedure TfrmDBBasic.RecoverGrid(gridFrom: TDBGridEh; dsFrom: TDataSource = nil; IsClearFilter: Boolean = true);
begin
  if gridFrom.SelectedRows.Count > 0 then
  begin
    gridFrom.SelectedRows.Clear;
    gridFrom.Selection.Clear;
  end;
  if IsClearFilter then
  begin
    if gridFrom.STFilter.Visible then
    begin
      gridFrom.ClearFilter;
      gridFrom.ApplyFilter;
    end;
  end;
  if dsFrom <> nil then
  begin
    gridFrom.DataSource := nil;
    gridFrom.DataSource := dsFrom;
  end;
end;

procedure TfrmDBBasic.RefreshGrid(gridFrom: TDBGridEh; dsFrom: TDataSource);
begin
  if gridFrom.SelectedRows.Count > 0 then
  begin
    gridFrom.SelectedRows.Clear;
    gridFrom.Selection.Clear;
  end;
  gridFrom.DataSource := nil;
  gridFrom.DataSource := dsFrom;
  gridFrom.DataSource.DataSet.Active := false;
  gridFrom.DataSource.DataSet.Active := true;
end;

function TfrmDBBasic.GetBatchFieldValueFromGrid(gridFrom: TDBGridEh; fieldName: string; IsSelectRows: Boolean = true): WideString;
var
  i: integer;
  fieldValue: WideString;
  sl: TStringList;
begin
  sl := TStringList.Create;
  sl.Clear;
  sl.Sorted := True; //需要先指定排序
  sl.Duplicates := dupIgnore; //如有重复值则放弃
  if gridFrom.DataSource = nil then
    gridFrom.DataSource := ds_active;
  if not gridFrom.DataSource.DataSet.Active then
    gridFrom.DataSource.DataSet.Active := true;
  fieldValue := '';
  gridData.DataSource.DataSet.First;
  gridFrom.DataSource.DataSet.DisableControls;
  try
    if IsSelectRows then
    begin
      if gridFrom.SelectedRows.Count = 1 then
      begin
        gridFrom.DataSource.DataSet.Bookmark := gridFrom.SelectedRows.items[0];
       // ShowMessage(gridFrom.DataSource.DataSet.FieldByName(fieldName).AsString);
        sl.Add(gridFrom.DataSource.DataSet.FieldByName(fieldName).AsString);
      end
      else
      begin
        for i := 0 to gridFrom.SelectedRows.Count - 1 do
        begin
          gridFrom.DataSource.DataSet.Bookmark := gridFrom.SelectedRows.items[I];
        //fieldValue := fieldValue + gridFrom.DataSource.DataSet.FieldByName(fieldName).AsString + ',';
          sl.Add(gridFrom.DataSource.DataSet.FieldByName(fieldName).AsString);
        end;
      end;
    end
    else
    begin
      while not gridFrom.DataSource.DataSet.Eof do
      begin
        //fieldValue := fieldValue + gridFrom.DataSource.DataSet.FieldByName(fieldName).AsString + ',';
        sl.Add(gridFrom.DataSource.DataSet.FieldByName(fieldName).AsString);
        gridFrom.DataSource.DataSet.Next;
      end;
    end;
    if sl.Count > 0 then
      fieldValue := sl.CommaText;
    //fieldValue := copy(fieldValue, 0, (length(fieldValue) - 1));
  finally
    Result := fieldValue;
    gridFrom.DataSource.DataSet.EnableControls;
    //RecoverGrid(gridFrom);
    sl.Free;
  end;
end;
{
procedure TfrmDBBasic.Refresh_PreservePosition(gridFrom: TDBGridEh);
var
  rowDelta: Integer;
  row: integer;
  ds: TDataSet;
begin
  ds := TDBGridEh(gridFrom).DataSource.DataSet;

  rowDelta := -1 + TDBGridEh(gridFrom).Row;
  row := ds.RecNo;

  ds.Refresh;

  with ds do
  begin
    DisableControls;
    RecNo := row;
    MoveBy(-rowDelta);
    MoveBy(rowDelta);
    EnableControls;
  end;
end;
}

initialization
  IniPropStorageMan := TIniPropStorageManEh.Create(nil);
  IniPropStorageMan.IniFileName := ChangeFileExt(ParamStr(0), '.ini'); //ExtractFileDir(ParamStr(0)) + '\LiveJIT.ini';
  SetDefaultPropStorageManager(IniPropStorageMan);
  DBGridEhDefaultStyle.FilterEditCloseUpApplyFilter := True;
  DefFontData.Name := 'Microsoft Sans Serif';

end.

