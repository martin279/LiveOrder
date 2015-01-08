unit ufrmForecast;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmDBBasicPrn, PropFilerEh, DB, ADODB, PrnDbgeh, Menus,
  PropStorageEh, ActnList, ImgList, GridsEh, DBGridEh, PrViewEh, StdCtrls,
  ComCtrls, DBCtrls, ToolWin, ExtCtrls, comObj;

type
  TfrmForecast = class(TfrmDBBasicPrn)
    btnImportForecast: TButton;
    adt_activeForecastID: TIntegerField;
    adt_activeModelID: TIntegerField;
    adt_activeQuantity: TIntegerField;
    adt_activeForecastMonth: TIntegerField;
    adt_activeForecastYear: TIntegerField;
    adt_activeModel: TStringField;
    procedure btnImportForecastClick(Sender: TObject);
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

{ TfrmForecast }

procedure TfrmForecast.SetData;
begin
  DM.DataSetQuery(adt_active, 'EXEC usp_GetSCCustomerOrderForecast');
end;

procedure TfrmForecast.SetUI;
begin
  inherited;
end;

procedure TfrmForecast.SetAccess;
begin
  inherited;
  case gVars.CurUserLevel of
    3:
      pnlBottom.Visible := true;
    4:
      pnlBottom.Visible := true;
  end;
end;

procedure TfrmForecast.btnImportForecastClick(Sender: TObject);
var
  excelapp, book, sheet: variant;
  model, qty, ForecastYear, ForecastMonth, sqlConst: string;
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
        DM.DataSetModify('EXEC usp_DeleteSCCustomerOrderForecast');
        for i := 1 to sheet.usedrange.rows.count do
        begin
          if (LowerCase(copy(sheet.cells[i, 1].value, 1, 25)) <> 'model') then
          begin
            model := copy(sheet.cells[i, 1].value, 1, 25);
            qty := copy(sheet.cells[i, 2].value, 1, 25);
            ForecastMonth := copy(sheet.cells[i, 3].value, 1, 10);
            ForecastYear := copy(sheet.cells[i, 4].value, 1, 10);
            sqlConst := 'EXEC usp_InsertSCCustomerOrderForecastImport '
              + ' @Model=''' + model + ''''
              + ',@Quantity=''' + qty + ''''
              + ',@ForecastMonth=''' + ForecastMonth + ''''
              + ',@ForecastYear=''' + ForecastYear + '''';
            DM.DataSetModify(sqlConst);
          end;
        end;
        DM.DataSetModify('EXEC usp_InsertSCCustomerOrderForecast');
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

