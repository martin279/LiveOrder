unit DataSets2Excel;

{*******************************************************************************
*                     DataSets Export to EXCEL via OLE                         *
*                                                                              *
*   功能：  通过OLE将若干个DataSet导出到Excel，可导出大量数据，速度比较快。    *
            本单元可以导出超过65535条数据到Excel，支持自动分页。               *
*   实现：  2005.8 ~ 2005.9 在D7下实现导出大量数据到Excel                      *
*           2013.4.11       整理代码，使其支持Unicode                          *
*           2013.8.31       Delphi XE4下测试通过                               *
*   EMail:  iamdream%yeah.net  (% -> @)                                        *
*                                                                              *
*   本单元支持D5~XE4，在D5/D7/D2007/D2010/XE2/XE3/XE4下测试通过，其他版本未测  *
*   试                                                                         *
*******************************************************************************}

interface

// ========================== Determine compiler ========================== //
{$IFDEF VER80} Sorry, Delphi 1 is not supported !  {$ENDIF} // D1
{$IFDEF VER90} Sorry, Delphi 2 is not supported !  {$ENDIF} // D2
{$IFDEF VER93} Sorry, BCB 1 is not supported !     {$ENDIF} // CPPB 1
{$IFDEF VER100} Sorry, Delphi 3 is not supported ! {$ENDIF} // D3
{$IFDEF VER110} Sorry, BCB 3 is not supported !    {$ENDIF} // CPPB 3
{$IFDEF VER120} Sorry, Delphi 4 is not supported ! {$ENDIF} // D4
{$IFDEF VER125} Sorry, BCB 4 is not supported !    {$ENDIF} // CPPB 4
{$IFDEF VER130}        //D5
  {$DEFINE DELPHI5UP}
{$ENDIF}
{$IFDEF VER135}        //BCB5
  {$DEFINE DELPHI5UP}
{$ENDIF}
{$IFDEF VER140}        //D6
  {$DEFINE DELPHI5UP}
  {$DEFINE DELPHI6UP}
{$ENDIF}
{$IFDEF VER145}        //BCB6
  {$DEFINE DELPHI5UP}
  {$DEFINE DELPHI6UP}
{$ENDIF}
{$IFDEF VER150}        //D7
  {$DEFINE DELPHI5UP}
  {$DEFINE DELPHI6UP}
  {$DEFINE DELPHI7UP}
{$ENDIF}
{$IFDEF VER170}        //D9(D2005)
  {$DEFINE DELPHI5UP}
  {$DEFINE DELPHI6UP}
  {$DEFINE DELPHI7UP}
  {$DEFINE D2005UP}
{$ENDIF}
{$IFDEF VER180}        //D10(D2006)|BCB10
  {$DEFINE DELPHI5UP}
  {$DEFINE DELPHI6UP}
  {$DEFINE DELPHI7UP}
  {$DEFINE D2005UP}
  {$DEFINE D2006UP}
{$ENDIF}
{$IFDEF VER185}        //D11(D2007)|BCB11
  {$DEFINE DELPHI5UP}
  {$DEFINE DELPHI6UP}
  {$DEFINE DELPHI7UP}
  {$DEFINE D2005UP}
  {$DEFINE D2006UP}
  {$DEFINE D2007UP}
{$ENDIF}
{$IFDEF VER200}        //D12(D2009)|BCB12
  {$DEFINE DELPHI5UP}
  {$DEFINE DELPHI6UP}
  {$DEFINE DELPHI7UP}
  {$DEFINE D2005UP}
  {$DEFINE D2006UP}
  {$DEFINE D2007UP}
  {$DEFINE D2009UP}
{$ENDIF}
{$IFDEF VER210}        //D14(D2010)|BCB14
  {$DEFINE DELPHI5UP}
  {$DEFINE DELPHI6UP}
  {$DEFINE DELPHI7UP}
  {$DEFINE D2005UP}
  {$DEFINE D2006UP}
  {$DEFINE D2007UP}
  {$DEFINE D2009UP}
  {$DEFINE D2010UP}
{$ENDIF}
{$IFDEF VER220}        //DelphiXE
  {$DEFINE DELPHI5UP}
  {$DEFINE DELPHI6UP}
  {$DEFINE DELPHI7UP}
  {$DEFINE D2005UP}
  {$DEFINE D2006UP}
  {$DEFINE D2007UP}
  {$DEFINE D2009UP}
  {$DEFINE D2010UP}
  {$DEFINE DELPHIXEUP}
{$ENDIF}
{$IFDEF VER230}        //DelphiXE2
  {$DEFINE DELPHI5UP}
  {$DEFINE DELPHI6UP}
  {$DEFINE DELPHI7UP}
  {$DEFINE D2005UP}
  {$DEFINE D2006UP}
  {$DEFINE D2007UP}
  {$DEFINE D2009UP}
  {$DEFINE D2010UP}
  {$DEFINE DELPHIXEUP}
  {$DEFINE DELPHIXE2UP}
{$ENDIF}
{$IFDEF VER240}        //DelphiXE3
  {$DEFINE DELPHI5UP}
  {$DEFINE DELPHI6UP}
  {$DEFINE DELPHI7UP}
  {$DEFINE D2005UP}
  {$DEFINE D2006UP}
  {$DEFINE D2007UP}
  {$DEFINE D2009UP}
  {$DEFINE D2010UP}
  {$DEFINE DELPHIXEUP}
  {$DEFINE DELPHIXE2UP}
  {$DEFINE DELPHIXE3UP}
{$ENDIF}
{$IFDEF VER250}        //DelphiXE4
  {$DEFINE DELPHI5UP}
  {$DEFINE DELPHI6UP}
  {$DEFINE DELPHI7UP}
  {$DEFINE D2005UP}
  {$DEFINE D2006UP}
  {$DEFINE D2007UP}
  {$DEFINE D2009UP}
  {$DEFINE D2010UP}
  {$DEFINE DELPHIXEUP}
  {$DEFINE DELPHIXE2UP}
  {$DEFINE DELPHIXE3UP}
  {$DEFINE DELPHIXE4UP}
{$ENDIF}
// ========================== Determine compiler ========================== //

uses
  Classes, Graphics, SysUtils, Forms, ComCtrls, DB, ComObj, Math
  {$IFDEF DELPHI6UP},Variants{$ENDIF};

// USE OLE to export to excel
type
  TExportProgressEvent = procedure (ADataSet: TDataSet; ACurrIdx, ATotalIdx: Integer) of object;
  TExportSheetChangeEvent = procedure (ADataSet: TDataSet; ASheetIdx, ASheetNo: Integer; var ASheetName: string) of object;
  TSetColumnTitleEvent = procedure (AField: TField; ACol: Integer; var AColTitle: string; var AColWidth: Integer) of object;

function DataSetsToExcel(ADataSets: array of TDataSet; const ATitle, AExcelFile: string;
  AUseDSName: Boolean = True; AIgnoreInvisible: Boolean = True; AExportRate: TExportProgressEvent = nil;
  AExportSheetChange: TExportSheetChangeEvent = nil; ASetColumnTitle: TSetColumnTitleEvent = nil): Integer;

implementation

// Use OLE to export to excel

//从多个DataSet导出到Excel
function DataSetsToExcel(ADataSets: array of TDataSet; const ATitle, AExcelFile: string;
  AUseDSName: Boolean; AIgnoreInvisible: Boolean; AExportRate: TExportProgressEvent;
  AExportSheetChange: TExportSheetChangeEvent; ASetColumnTitle: TSetColumnTitleEvent): Integer;
const
  MAX_SHEET_ROWS = 65536-1;  //Excel每Sheet最大行数
  MAX_VAR_ONCE   = 200;      //一次导出的条数
  MAX_CELL_LEN   = 255;
  ColRowSepChar = ':';

  procedure OneDataSetToExcel(ADataSet: TDataSet; var AWorkBook: Variant; var ASheetIdx: Integer);

    function GetNewSheet(ASheetName: string; ASheetNo: Integer): OleVariant;
    begin
      if ASheetIdx <= AWorkBook.WorkSheets.Count then begin
        Result := AWorkBook.WorkSheets[ASheetIdx];
      end else begin                                                 //加在后面 (AWorkBook.WorkSheets.Count > 0)
        Result := AWorkBook.WorkSheets.Add(NULL, AWorkBook.WorkSheets[AWorkBook.WorkSheets.Count]);
      end;
      if AUseDSName then begin
        if Assigned(AExportSheetChange) then begin
          AExportSheetChange(ADataSet, ASheetIdx, ASheetNo, ASheetName);
        end;
        if (ASheetName <> '') then begin  //Sheet的Name不能重复!
          Result.Name := ASheetName;
        end;
      end;
      Inc(ASheetIdx);
    end;

    procedure AddTitleToSheet(ASheet: OleVariant; var ARow: Integer);
    var
      i, iCol, iRow: Integer;
      colTitle: string;
      colWidth: Integer;
    begin
      iRow := 1;
      // add export title
      if ATitle <> '' then begin
        ASheet.Cells[iRow, 1] :=  ATitle;
        Inc(iRow);
      end;
      // add header
      iCol := 1;
      for i := 0 to ADataSet.FieldCount -1 do begin
        if AIgnoreInvisible and not ADataSet.Fields[i].Visible then Continue;
        colTitle := ADataSet.Fields[i].DisplayName;
        colWidth := ADataSet.Fields[i].DisplayWidth;
        if Assigned(ASetColumnTitle) then begin
          ASetColumnTitle(ADataSet.Fields[i], iCol, colTitle, colWidth);
        end;
        ASheet.Cells[iRow, iCol].Font.Bold := True;
        ASheet.Cells[iRow, iCol] := colTitle;
        ASheet.Columns[iCol].ColumnWidth := Min(255, colWidth); //Note: ColumnWidth <= 255!!
        case ADataSet.Fields[i].DataType of
          ftString,
          ftWideString,
          ftMemo,
          ftFmtMemo,
          {$IFDEF D2006UP}ftWideMemo,{$ENDIF}
          ftBlob:     ASheet.Columns[iCol].NumberFormatLocal := AnsiChar('@'); //对于“字符串”型数据则设Excel单元格为“文本”型
          ftDate:     ASheet.Columns[iCol].NumberFormatLocal := {$IFDEF DELPHIXE2UP}FormatSettings.{$ENDIF}ShortDateFormat;
          ftDateTime: ASheet.Columns[iCol].NumberFormatLocal := {$IFDEF DELPHIXE2UP}FormatSettings.{$ENDIF}ShortDateFormat + ' ' + {$IFDEF DELPHIXE2UP}FormatSettings.{$ENDIF}ShortTimeFormat;
          ftTime:     ASheet.Columns[iCol].NumberFormatLocal := {$IFDEF DELPHIXE2UP}FormatSettings.{$ENDIF}ShortTimeFormat;
        end;
        Inc(iCol);
      end;
      ARow := iRow + 1;
    end;

    function ConvertRtfText(ARTFString: string): string;
    var
      pStream: TStringStream;
    begin
      pStream:= TStringStream.Create(ARTFString);
      with TRichEdit.Create(nil) do try
        Parent   := Application.MainForm;
        WordWrap := False;
        Lines.LoadFromStream(pStream);
        Result := Lines.Text;
      finally
        pStream.Free;
        Free;
      end;
    end;

  var
    pBookmark: {$IFDEF UNICODE}TBookMark{$ELSE}TBookmarkStr{$ENDIF};
    i, c, r, idx, iVarCount, iCol, iRow, iCurRow: Integer;
    varCells: Variant;
    sheetNo: Integer;
    MySheet, Cell1, Cell2, Range: OleVariant;
    pOutStr, S: string;
    pBigTxtCaches: TStrings;
  begin
    if not ADataSet.Active then Exit;
    if Assigned(AExportRate) then AExportRate(ADataSet, 0, Result);
    pBookmark := ADataSet.Bookmark;
    ADataSet.DisableControls;
    pBigTxtCaches := TStringList.Create;
    try
      ADataSet.First;
      if ADataSet.RecordCount <= MAX_VAR_ONCE then begin
        iVarCount := ADataSet.RecordCount;
      end else begin
        iVarCount := MAX_VAR_ONCE;
      end;
      varCells  := VarArrayCreate([1,
                                   iVarCount,
                                   1,
                                   ADataSet.FieldCount], varVariant);
      sheetNo := 1;
      MySheet := GetNewSheet(ADataSet.Name, sheetNo);
      AddTitleToSheet(MySheet, iRow);
      while not ADataSet.Eof do
      begin
        if (iRow > MAX_SHEET_ROWS + 1) then begin
          Inc(sheetNo);
          MySheet := GetNewSheet(Format('%s%d', [ADataSet.Name, sheetNo]), sheetNo);
          AddTitleToSheet(MySheet, iRow);
        end;
        pBigTxtCaches.Clear;
        iCurRow := 1;
        while not ADataSet.Eof do begin
          iCol := 1;
          for i := 0 to ADataSet.FieldCount -1 do begin
            if AIgnoreInvisible and not ADataSet.Fields[i].Visible then Continue;
            case ADataSet.Fields[i].DataType of
              ftDate,
              ftDateTime,
              ftTime:
                begin
                  if ADataSet.Fields[i].IsNull or (ADataSet.Fields[i].AsDateTime <= 0) then begin
                    varCells[iCurRow, iCol] := '';
                  end else begin
                    varCells[iCurRow, iCol] := ADataSet.Fields[i].AsDateTime;
                  end;
                end;
            else
              begin
                pOutStr := ADataSet.Fields[i].AsString;
                if (ADataSet.Fields[i].DataType in [ftMemo{$IFDEF D2006UP}, ftWideMemo{$ENDIF}]) then begin
                  if (Copy(ADataSet.Fields[i].AsString, 1, 5) = '{\rtf') then begin
                    pOutStr := ConvertRtfText(ADataSet.Fields[i].AsString);
                  end;
                end else if ADataSet.Fields[i].IsBlob and (pOutStr <> '') then begin
                  pOutStr := '(BLOB)';  // Special for Blob Field
                end;
                // 处理超长的串 (>255)
                if Length(pOutStr) > MAX_CELL_LEN then begin
                  pBigTxtCaches.Add(Format('%d%s%d=%s', [iRow, ColRowSepChar, iCol, pOutStr]));
                  pOutStr := '';
                end;
                varCells[iCurRow, iCol] := pOutStr;
              end;
            end;
            Inc(iCol);
          end;
          Inc(iRow);
          Inc(iCurRow);
          Inc(Result);
          ADataSet.Next;
          if (iCurRow > iVarCount) or (iRow > MAX_SHEET_ROWS + 1) then begin
            if Assigned(AExportRate) then AExportRate(ADataSet, iCurRow, Result);
            //Application.ProcessMessages;
            Break;
          end else if iRow > ADataSet.RecordCount + 1 then begin
            if Assigned(AExportRate) then AExportRate(ADataSet, iCurRow, Result);
          end;
        end;
        Cell1 := MySheet.Cells[iRow - iCurRow + 1, 1];
        Cell2 := MySheet.Cells[iRow - 1,
                              ADataSet.FieldCount];
        Range := MySheet.Range[Cell1 ,Cell2];
        Range.Value := varCells;
        Cell1 := Unassigned;
        Cell2 := Unassigned;
        Range := Unassigned;
        // 输出超长串 (>255)
        for i := 0 to pBigTxtCaches.Count -1 do begin
          S := pBigTxtCaches.Names[i];
          pOutStr := Copy(pBigTxtCaches[i], Length(S) + 2, MaxInt);
          idx := Pos(ColRowSepChar, S);
          r := StrToIntDef(Copy(S, 1, idx -1), 0);
          c := StrToIntDef(Copy(S, idx +1, MaxInt), 0);
          if (c > 0) and (r > 0) then begin
            MySheet.Cells[r, c] := pOutStr;
          end;
        end;
        if (iRow > MAX_SHEET_ROWS + 1) then     //一个Sheet导出结束
        begin
          MySheet.Select;
          MySheet.Cells[1, 1].Select;    //使得每一Sheet均定位在第一格
        end;
      end;
      varCells := Unassigned;
    finally
      pBigTxtCaches.Free;
      ADataSet.Bookmark := pBookmark;
      ADataSet.EnableControls;
    end;
  end;

var
  i, pSheetIdx: Integer;
  myExcel, myWorkBook: Variant;
begin
  Result := 0;
  if Length(ADataSets) = 0 then Exit;
  try
    myExcel := CreateOleObject('Excel.Application');
  except
    raise Exception.Create('It may be not install Excel');
  end;
  try
    myWorkBook := myExcel.WorkBooks.Add;
    myExcel.Visible := False;
    myExcel.DisplayAlerts := False;
    pSheetIdx := 1;
    for i := Low(ADataSets) to High(ADataSets) do begin
      OneDataSetToExcel(ADataSets[i], myWorkBook, pSheetIdx);
    end;
    for i := myWorkBook.WorkSheets.Count downto pSheetIdx do begin
      myWorkBook.WorkSheets[i].Delete;
    end;
    myWorkBook.WorkSheets[1].Select;
    myWorkBook.WorkSheets[1].Cells[1, 1].Select;
    myWorkBook.SaveAs(AExcelFile);
    myWorkBook := Unassigned;
  finally
    myExcel.ActiveWorkBook.Saved := True;
    myExcel.Quit;
    myExcel := Unassigned;
  end;
end;

end.
