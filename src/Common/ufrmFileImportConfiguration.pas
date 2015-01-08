unit ufrmFileImportConfiguration;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmDBBasicPrn, PropFilerEh, DB, ADODB, PrnDbgeh, Menus,
  PropStorageEh, ActnList, ImgList, GridsEh, DBGridEh, PrViewEh, StdCtrls,
  DBCtrls, ComCtrls, ToolWin, ExtCtrls, comObj, uDMEntity, uDMManager;

type
//  FileImport = (ImportAll = 0, ImportCurrent = 1, ImportSelected = 2);

  TfrmFileImportConfiguration = class(TfrmDBBasicPrn)
    adt_activeFileImportConfigurationID: TAutoIncField;
    adt_activeImportSequence: TIntegerField;
    adt_activeCreationDate: TDateTimeField;
    adt_activeLastFileDate: TDateTimeField;
    adt_activeLastImportDate: TDateTimeField;
    adt_activeDescription: TStringField;
    adt_activeImportFilePath: TStringField;
    adt_activeImportFileName: TStringField;
    adt_activeIsTokenSeparated: TBooleanField;
    adt_activeTokenSeparator: TStringField;
    adt_activeHeaderRows: TIntegerField;
    adt_activeActive: TBooleanField;
    adt_activeStoredProcedureDelete: TStringField;
    adt_activeStoredProcedureInsert: TStringField;
    adt_activeStoredProcedureProcess: TStringField;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    gridCOImport: TDBGridEh;
    gridPriceImport: TDBGridEh;
    adt_co: TADODataSet;
    adt_price: TADODataSet;
    ds_co: TDataSource;
    ds_price: TDataSource;
    Panel1: TPanel;
    Label2: TLabel;
    labelStatus: TLabel;
    buttonImportSelected: TButton;
    adt_priceCustomerNumber: TStringField;
    adt_priceModel: TStringField;
    adt_priceDemandQuantity: TStringField;
    adt_priceCurrency: TStringField;
    adt_pricePrice: TStringField;
    adt_priceEffectDate: TStringField;
    adt_pricePaymentTerms: TStringField;
    adt_pricePriceTerms: TStringField;
    adt_priceProductFamilyName: TStringField;
    adt_priceProductSeriesName: TStringField;
    adt_pricePlantCode: TStringField;
    adt_priceImportBy: TStringField;
    adt_priceCreateTime: TDateTimeField;
    procedure buttonImportSelectedClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
  private
    { Private declarations }
    slParam: TStringList;
    objMgrBasic: TMgrBasicData;
    procedure ImportFiles();
//    procedure ImportLine(ImportTableName, fieldName, line: string);
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

{ TfrmFileImportConfiguration }

procedure TfrmFileImportConfiguration.InitializeForm;
begin
  slParam := TStringList.Create;
  objMgrBasic := TMgrBasicData.Create;
  inherited;
end;

procedure TfrmFileImportConfiguration.DestoryForm;
begin
  inherited;
  slParam.Free;
  objMgrBasic.Free;
end;

procedure TfrmFileImportConfiguration.SetData;
begin
  slParam.Clear;
  slParam.Append('ImportBy=' + IntToStr(objCurUser.LoginID));
  objMgrBasic.QueryBasicDataByParam(adt_co, 'Oversea_COImport', 'ImportBy', slParam);
  objMgrBasic.QueryBasicDataByParam(adt_price, 'PriceImport', 'ImportBy', slParam);
  objMgrBasic.QueryBasicDataBySP(adt_active, 'usp_GetFileImportConfigurations', slParam);
//  DM.DataSetQuery(adt_active, 'EXEC usp_GetFileImportConfigurations @ImportBy=' + IntToStr(objCurUser.LoginID));
end;

procedure TfrmFileImportConfiguration.SetUI;
begin
  inherited;
  tbsBody1.TabVisible := true;
end;

procedure TfrmFileImportConfiguration.SetAccess;
begin
  inherited;
  DBNavigator1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbPost, nbCancel, nbRefresh];
  gridData.ReadOnly := false;
  gridData.FieldColumns['FileImportConfigurationID'].ReadOnly := true;
  gridData.FieldColumns['ImportSequence'].ReadOnly := true;
  gridData.FieldColumns['LastFileDate'].ReadOnly := true;
  gridData.FieldColumns['LastImportDate'].ReadOnly := true;
  gridData.FieldColumns['Description'].ReadOnly := true;
  gridData.FieldColumns['FileImportConfigurationID'].Visible := false;
  gridData.FieldColumns['CreationDate'].Visible := false;
  gridData.FieldColumns['IsTokenSeparated'].Visible := false;
  gridData.FieldColumns['TokenSeparator'].Visible := false;
  gridData.FieldColumns['HeaderRows'].Visible := false;
  gridData.FieldColumns['Active'].Visible := false;
  gridData.FieldColumns['StoredProcedureDelete'].Visible := false;
  gridData.FieldColumns['StoredProcedureInsert'].Visible := false;
  gridData.FieldColumns['StoredProcedureProcess'].Visible := false;
  gridData.Options := [dgEditing, dgTitles, dgIndicator, dgColumnResize
    , dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection
    , dgConfirmDelete, dgCancelOnExit, dgMultiSelect];
end;
  
procedure TfrmFileImportConfiguration.PageControl1Change(Sender: TObject);
begin
  inherited;
  slParam.Clear;
  slParam.Append('ImportBy=' + IntToStr(objCurUser.LoginID));
  objMgrBasic.QueryBasicDataByParam(adt_co, 'Oversea_COImport', 'ImportBy', slParam);
  objMgrBasic.QueryBasicDataByParam(adt_price, 'PriceImport', 'ImportBy', slParam);
end;

procedure TfrmFileImportConfiguration.buttonImportSelectedClick(Sender: TObject);
begin
  if MessageDlg('Import select?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    exit;
  try
    begin
      // Import only the selected files
      Self.Enabled := false;
      //Screen.Cursor := crSQLWait;
      buttonImportSelected.Enabled := false;
      try
        begin
          ImportFiles();
          ShowMessage('File import complete.');
        end;
      except on E: Exception do
        begin
         // Screen.Cursor := crDefault;
          MessageDlg(E.Message, mtWarning, [mbOK], 0);
        end;
      end;
    end;
  finally
    begin
      Self.Enabled := True;
      buttonImportSelected.Enabled := true;
    end;
  end;
end;

procedure TfrmFileImportConfiguration.ImportFiles();

  function getSpParameter(sl1, sl2: TStringList): string;
  var
    i: integer;
    strParameter: string;
  begin
    strParameter := '';
    for i := 0 to sl1.count - 1 do
    begin
      strParameter := strParameter + trim(sl1[i]) + '=''' + trim(sl2[i]) + ''',';
    end;
    strParameter := strParameter + '@ImportBy=' + IntToStr(objCurUser.LoginID);
    //strParameter := Copy(strParameter, 1, length(strParameter) - 1);
    Result := strParameter;
  end;
var
  // fieldName, ImportTableName, ImportDBName: string;
//  tokenSeparator: string;
//  importedSomething, isTokenSeparated, rowSelected: Boolean;
//  fileStream: TFileStream;
//  reader: TReader;
  fileName, filePath, nextLine, strParameter: string;
  storedProcedureDelete, storedProcedureInsert, storedProcedureProcess: string;
  fileImportConfigurationID, headerRows, i, k: integer;
//  lastFileDate: TDateTime;
  adt_config, adt_detail: TADODataSet;
  NameList: TStringList;
  sl1, sl2: TStringList;
begin
//  importedSomething := false;
  labelStatus.Caption := '';
  adt_config := TADODataSet.Create(nil);
  adt_detail := TADODataSet.Create(nil);
  sl1 := TStringList.Create;
  sl2 := TStringList.Create;
  NameList := TStringList.Create;
  try
    begin
      if gridData.SelectedRows.Count = 0 then
        gridData.SelectedRows.CurrentRowSelected := true;
      for k := 0 to gridData.SelectedRows.Count - 1 do
      begin
        gridData.DataSource.DataSet.Bookmark := gridData.SelectedRows[k];
        DM.DataSetQuery(adt_config, 'select * from FileImportConfiguration where FileImportConfigurationID='
          + gridData.DataSource.DataSet.fieldbyname('FileImportConfigurationID').AsString);

      // import mainframe files
{       fileStream := nil;
        reader := nil;
        isTokenSeparated := adt_config.fieldbyname('IsTokenSeparated').AsBoolean;
        tokenSeparator := adt_config.fieldbyname('TokenSeparator').AsString;        }
        fileImportConfigurationID := adt_config.fieldbyname('FileImportConfigurationID').AsInteger;
        fileName := adt_config.fieldbyname('ImportFileName').AsString;
//        lastFileDate := adt_config.fieldbyname('LastFileDate').AsDateTime;
        filePath := adt_config.fieldbyname('ImportFilePath').AsString + '\' + adt_active.fieldbyname('ImportFileName').AsString;
        headerRows := adt_config.fieldbyname('HeaderRows').AsInteger;
        //ImportDBName := adt_config.fieldbyname('ImportDBName').AsString;
       // ImportTableName := adt_config.fieldbyname('ImportTableName').AsString;
        storedProcedureDelete := adt_config.fieldbyname('StoredProcedureDelete').AsString;
        storedProcedureInsert := adt_config.fieldbyname('StoredProcedureInsert').AsString;
        storedProcedureProcess := adt_config.fieldbyname('StoredProcedureProcess').AsString;

        //delete
        DM.DataSetModify('EXEC ' + storedProcedureDelete + ' @ImportBy=' + IntToStr(objCurUser.LoginID));

        //insert
        strParameter := '';
        DM.DataSetQuery(adt_detail, 'EXEC usp_GetFileImportConfigurationDetails @FileImportConfigurationID='
          + IntToStr(fileImportConfigurationID));
        while not adt_detail.Eof do
        begin
          sl1.Add(adt_detail.fieldbyname('ColumnParameterName').AsString);
          adt_detail.Next;
        end;

        NameList.LoadFromFile(filePath);
        for i := headerRows to NameList.Count - 1 do
        begin
          try
            begin
              labelStatus.Caption := 'Importing ' + fileName + ': ' + nextLine;
              labelStatus.Refresh;
             // Screen.Cursor := crSQLWait;
              nextLine := NameList[i];
              sl2 := mjSplit(nextLine, ',');
              if (sl1.Count = sl2.Count) and (sl1.Count <> 0) then
              begin
                strParameter := getSpParameter(sl1, sl2);
                DM.DataSetModify('EXEC ' + storedProcedureInsert + ' ' + strParameter);
              end;
            end;
          except on E: Exception do
            begin
              labelStatus.Caption := '';
              MessageDlg(E.Message, mtWarning, [mbOK], 0);
            end;
          end;
        end;

        {
        fieldName := '';
        DM.DataSetQuery(adt_detail, 'select name from ' + ImportDBName + '.dbo.syscolumns where object_name(id)=''' + ImportTableName + ''' order by colid');
        while not adt_detail.Eof do
        begin
          fieldName := fieldName + adt_detail.fieldbyname('name').AsString + ',';
          adt_detail.Next;
        end;
        fieldName := copy(fieldName, 1, length(fieldName) - 1);

        NameList := TStringList.Create;
        try
          NameList.LoadFromFile(filePath);
          for i := headerRows to NameList.Count - 1 do
          begin
            nextLine := NameList[i];
            try
              begin
                labelStatus.Caption := 'Importing ' + fileName + ': ' + nextLine;
                labelStatus.Refresh;
                Screen.Cursor := crSQLWait;
                ImportLine(ImportTableName, fieldName, nextLine);
              end;
            except on E: Exception do
              begin
                labelStatus.Caption := '';
                MessageDlg(E.Message, mtWarning, [mbOK], 0);
              end;
            end;
          end;
        finally
          NameList.Free;
        end;
        adt_config.Next;
      end;
      }
        //process
        DM.DataSetModify('EXEC ' + storedProcedureProcess + ' @ImportBy=' + IntToStr(objCurUser.LoginID));

        DM.DataSetModify('Update FileImportConfiguration set LastImportDate=getdate() where FileImportConfigurationID='
          + IntToStr(fileImportConfigurationID));
      end;
    end;
  finally
    begin
      //Screen.Cursor := crDefault;
      labelStatus.Caption := '';
      NameList.Free;
      sl1.Free;
      sl2.Free;
      adt_detail.free;
      adt_config.free;
    end;
  end;
end;
 {
procedure TfrmFileImportConfiguration.ImportLine(ImportTableName, fieldName, line: string);
var
  strList: TStringList;
  i: integer;
  fieldValue, aValue: string;
begin
  strList := mjSplit(line, ',');
  fieldValue := '';
  for i := 0 to strList.Count - 1 do
  begin
    if Trim(strList[i]) = '' then
      aValue := ''
    else
      aValue := Trim(strList[i]);
    fieldValue := fieldValue + '''' + aValue + ''',';
  end;
  fieldValue := copy(fieldValue, 1, length(fieldValue) - 1);
  DM.DataSetModify('insert into ' + ImportTableName + '(' + fieldName + ') values(' + fieldValue + ')');
end;


procedure TfrmFileImportConfiguration.Button1Click(Sender: TObject);
var
  T: textfile;
  i: Integer;
  s: string;
  sl: TStringList;
begin
  inherited;
  sl := TStringList.Create;
  AssignFile(T, '');
  Reset(T);
  while not Eof(T) do
  begin
    Readln(T, s);
    sl.CommaText := s;
    for i := 0 to sl.Count - 1 do
    begin
      sl[i]
    end;
  end;
  CloseFile(T);

end;

                  fileStream := TFileStream.Create(filePath, fmOpenRead or fmShareExclusive);
                  //ShowMessage(IntToStr(fileStream.Size));
                  SetLength(Buffer, fileStream.Size);
                  FillChar(Pointer(Buffer)^, fileStream.Size, #0);
                  fileStream.Read(Pointer(Buffer)^, fileStream.Size);
                  ShowMessage(Buffer);
                  exit;
                  }


                  {
                while (true) do
                begin
//                      nextLine = reader.ReadLine();
  //                    if (nextLine = nil)
    //                    break;
                  try
                    begin
                      labelStatus.Caption := 'Importing ' + fileName + ': ' + nextLine;
                      labelStatus.Refresh;
                          //Application.DoEvents();
                      Screen.Cursor := crSQLWait;
                      ImportLine(nextLine);
                    end;
                  except on E: Exception do
                    begin
                      labelStatus.Caption := '';
                      MessageDlg(E.Message, mtWarning, [mbOK], 0);
                    end;
                  end;
                end;

                labelStatus.Caption := 'Saving data from ' + fileName;
                labelStatus.Refresh();
                  //Application.DoEvents();
                Refresh();
                  // now that import is complete, run ProcessImport stored procedure
                DM.DataSetModify(storedProcedureProcess);

                  // update dates in database
                gridData.DataSource.DataSet.DisableControls;
                if not (adt_active.State in [dsEdit]) then
                  adt_active.Edit;
                adt_active.fieldbyname('LastFileDate').Value := FormatDateTime('YYYY-mm-dd hh:mm', mjGetFileTime(filePath));
                adt_active.fieldbyname('LastImportDate').Value := FormatDateTime('YYYY-mm-dd hh:mm', mjGetFileTime(filePath));
                adt_active.Post;
                gridData.DataSource.DataSet.EnableControls;

                importedSomething := true;
              end;

            except on E: Exception do
              begin
                labelStatus.Caption := '';
                MessageDlg(E.Message, mtWarning, [mbOK], 0);
              end;
            end;
                }
                {
procedure TfrmFileImportConfiguration.buttonImportSelectedClick(
  Sender: TObject);
var
  excelapp, book, sheet: variant;
  ImportFileName, StoredProcedureDelete, StoredProcedureInsert, StoredProcedureProcess: string;
  i: integer;
begin
  ImportFileName := adt_active.fieldbyname('ImportFileName').AsString;
  StoredProcedureDelete := adt_active.fieldbyname('StoredProcedureDelete').AsString;
  StoredProcedureInsert := adt_active.fieldbyname('StoredProcedureInsert').AsString;
  StoredProcedureProcess := adt_active.fieldbyname('StoredProcedureProcess').AsString;

  excelapp := createoleobject('excel.application');
  excelapp.visible := false;
  excelapp.DisplayAlerts := False;
  try
    excelapp.workbooks.open(ImportFileName);
    book := excelapp.workbooks[1];
    sheet := excelapp.worksheets[1];
    DM.DataSetModify(StoredProcedureDelete);
    for i := 1 to sheet.usedrange.rows.count do
    begin
      line := copy(sheet.cells[i, 1].value, 1, 10);
      model := copy(sheet.cells[i, 2].value, 1, 30);
      qty := copy(sheet.cells[i, 3].value, 1, 10);
      startTime := copy(sheet.cells[i, 4].value, 1, 30);
      if startTime <> '' then
        DM.DataSetModify(format(StoredProcedureInsert, [line, model, qty, startTime, startTime]));
    end;
    DM.DataSetModify(StoredProcedureProcess);
  finally
    excelapp.quit;
    excelapp := null;
  end;
  ShowMessage('Finished Import.');
end;
}

end.

