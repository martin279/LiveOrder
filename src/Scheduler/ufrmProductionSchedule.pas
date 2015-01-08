unit ufrmProductionSchedule;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmDBBasicPrn, PropFilerEh, DB, ADODB, PrnDbgeh, Menus,
  PropStorageEh, ActnList, ImgList, GridsEh, DBGridEh, PrViewEh, StdCtrls,
  DBCtrls, ComCtrls, ToolWin, ExtCtrls, comObj;

type
  TfrmProductionSchedule = class(TfrmDBBasicPrn)
    btnImportProductionSchedule: TButton;
    adt_activeProductionScheduleID: TAutoIncField;
    adt_activeLine: TStringField;
    adt_activeModel: TStringField;
    adt_activeScheduleQuantity: TIntegerField;
    adt_activeRTD: TDateTimeField;
    adt_activeScheduleStartTime: TDateTimeField;
    adt_activeAssemblyLineID: TIntegerField;
    adt_activeModelID: TIntegerField;
    adt_line: TADODataSet;
    adt_activeLine1: TStringField;
    adt_model: TADODataSet;
    adt_activeModel1: TStringField;
    Panel1: TPanel;
    Label1: TLabel;
    adt_activePlantID: TIntegerField;
    adt_activePlantCode: TStringField;
    procedure btnImportProductionScheduleClick(Sender: TObject);
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

uses DataModule, uMJ;

{$R *.dfm}

procedure TfrmProductionSchedule.SetData;
begin
  DM.DataSetQuery(adt_line, 'EXEC usp_GetAssemblyLine');
  DM.DataSetQuery(adt_active, 'EXEC usp_GetProductionSchedule');
end;

procedure TfrmProductionSchedule.SetUI;
begin
  inherited;
end;

procedure TfrmProductionSchedule.SetAccess;
begin
  inherited;
  case gVars.CurUserLevel of
    3:
      pnlBottom.Visible := true;
    4:
      pnlBottom.Visible := true;
  end;
end;

procedure TfrmProductionSchedule.btnImportProductionScheduleClick(
  Sender: TObject);
var
  excelapp, book, sheet: variant;
  line, qty, model, startTime, sqlConst: string;
  i: integer;
  OpenDialog1: TOpenDialog;
begin
  OpenDialog1 := TOpenDialog.Create(self);
  if OpenDialog1.Execute then
  begin
    excelapp := createoleobject('excel.application');
    excelapp.visible := false;
    excelapp.DisplayAlerts := False;
    try
      excelapp.workbooks.open(OpenDialog1.FileName);
      book := excelapp.workbooks[1];
      sheet := excelapp.worksheets[1];
      try
       // sqlConst := Format(sDeleteProductionScheduleSQL, [' and PlantID in ' + gVars.CurUserPlantID]);
       // DM.DataSetModify(sqlConst);
        DM.DataSetModify('EXEC usp_DeleteProductionSchedule @PlantID=' + gVars.CurUserPlantID);
        for i := 1 to sheet.usedrange.rows.count do
        begin
          line := copy(sheet.cells[i, 1].value, 1, 10);
          if (LowerCase(line) = 'line1')
            or (LowerCase(line) = 'line2')
            or (LowerCase(line) = 'summit') then
          begin
            model := copy(sheet.cells[i, 2].value, 1, 30);
            qty := copy(sheet.cells[i, 3].value, 1, 10);
            startTime := copy(sheet.cells[i, 4].value, 1, 30);
            if startTime <> '' then
            begin
              sqlConst := 'EXEC usp_InsertProductionScheduleImport '
                + ' @Line=''' + line + ''''
                + ',@Model=''' + model + ''''
                + ',@ScheduleQuantity=''' + qty + ''''
                + ',@RTD=''' + startTime + ''''
                + ',@ScheduleStartTime=''' + startTime + '''';
              DM.DataSetModify(sqlConst);
            end;
              //DM.DataSetModify(format(sInsertProductionScheduleImportSQL, [line, model, qty, startTime, startTime]));
          end;
        end;
        //DM.DataSetModify(sProcessProductionScheduleSQL);
        DM.DataSetModify('EXEC usp_InsertProductionSchedule');
      except on E: Exception do
        begin
          ShowMessage(E.Message);
        end;
      end;
      adt_active.Active := FALSE;
      adt_active.Active := TRUE;
    finally
      excelapp.quit;
      excelapp := null;
    end;
    ShowMessage('Finished Import.');
  end;
  OpenDialog1.Free;
end;


end.
