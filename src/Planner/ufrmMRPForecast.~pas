unit ufrmMRPForecast;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmDBBasicPrn, PropFilerEh, DB, ADODB, PrnDbgeh, Menus,
  PropStorageEh, ActnList, ImgList, GridsEh, DBGridEh, PrViewEh, StdCtrls,
  ComCtrls, DBCtrls, ToolWin, ExtCtrls;

type
  TobjForecast = class
    Model: string;
    ModelID: integer;
    Quantity: integer;
    ForecastMonth: integer;
    ForecastYear: integer;
  end;
  TobjBOM = class
    ModelID: integer;
    ComponentID: integer;
    bomQty: Double;
  end;
  TobjMRP = class
    ModelID: integer;
    ComponentID: integer;
    mrpQty: Double;
    ForecastMonth: integer;
    ForecastYear: integer;
  end;

  TfrmMRPForecast = class(TfrmDBBasicPrn)
    btnGenerateMRP: TButton;
    ProgressBar1: TProgressBar;
    adt_activeForecastID: TAutoIncField;
    adt_activeComponentID: TIntegerField;
    adt_activeQuantity: TIntegerField;
    adt_activeForecastMonth: TIntegerField;
    adt_activeForecastYear: TIntegerField;
    adt_activeComponentItem: TStringField;
    procedure btnGenerateMRPClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    slForecast: TStringList;
    slBOM: TStringList;
    slMRP: TStringList;
    objForecast: TobjForecast;
    objBOM: TobjBOM;
    objMRP: TobjMRP;
  protected
    procedure SetData; override;
    procedure SetUI; override;
    procedure SetAccess; override;
  public
    { Public declarations }
    function CalculateForecast: Boolean;
    function CalculateMRP: Boolean;
    function ProcessPOToDB: Boolean;
  end;


implementation

{$R *.dfm}
uses DataModule, uMJ;

procedure TfrmMRPForecast.SetData;
begin
  DM.DataSetQuery(adt_active, 'EXEC usp_GetSCMRPForecast');
end;

procedure TfrmMRPForecast.SetUI;
begin
  inherited;
end;

procedure TfrmMRPForecast.SetAccess;
begin
  inherited;
  case gVars.CurUserLevel of
    3:
      pnlBottom.Visible := true;
    4:
      pnlBottom.Visible := true;
  end;
end;

procedure TfrmMRPForecast.FormCreate(Sender: TObject);
begin
  inherited;
  slForecast := TStringList.Create;
  slBOM := TStringList.Create;
  slMRP := TStringList.Create;
end;

procedure TfrmMRPForecast.FormDestroy(Sender: TObject);
var
  i: integer;
begin
  for i := slForecast.Count - 1 downto 0 do
    if Assigned(slForecast.Objects[i]) then
      slForecast.Objects[i].Free;
  for i := slBOM.Count - 1 downto 0 do
    if Assigned(slBOM.Objects[i]) then
      TobjBOM(slBOM.Objects[i]).Free;
  for i := slMRP.Count - 1 downto 0 do
    if Assigned(slMRP.Objects[i]) then
      TobjMRP(slMRP.Objects[i]).Free;
  slMRP.Free;
  slForecast.Free;
  inherited;
end;

function TfrmMRPForecast.CalculateForecast: Boolean;
var
  h: integer;
  adt_schedule: TADODataSet;
begin
  adt_schedule := TADODataSet.Create(nil);
  try
    DM.DataSetQuery(adt_schedule, 'EXEC usp_GetSCCustomerOrderForecast');
    h := 0;
    while not adt_schedule.Eof do
    begin {
      ModelID := adt_schedule.FieldByName('ModelID').AsInteger;
      Model := adt_schedule.FieldByName('Model').AsString;
      Quantity := adt_schedule.FieldByName('Quantity').AsInteger;
      ForecastMonth := adt_schedule.FieldByName('ForecastMonth').AsInteger;
      ForecastYear := adt_schedule.FieldByName('ForecastYear').AsInteger;
           }
      objForecast := TobjForecast.Create();
      objForecast.Model := adt_schedule.FieldByName('Model').AsString;
      objForecast.ModelID := adt_schedule.FieldByName('ModelID').AsInteger;
      objForecast.Quantity := adt_schedule.FieldByName('Quantity').AsInteger;
      objForecast.ForecastMonth := adt_schedule.FieldByName('ForecastMonth').AsInteger;
      objForecast.ForecastYear := adt_schedule.FieldByName('ForecastYear').AsInteger;

      slForecast.AddObject(IntToStr(h), objForecast);
      h := h + 1;
    {  Memo1.Lines.Add(objForecast.Model
        + ',' + IntToStr(objForecast.ModelID)
        + ',' + IntToStr(objForecast.ForecastMonth));     }
      adt_schedule.Next;
    end;
  finally
    adt_schedule.Free;
    Result := true;
  end;
end;

function TfrmMRPForecast.CalculateMRP: Boolean;
var
  adt_bom: TADODataSet;
  i, j, k: integer;
begin
  adt_bom := TADODataSet.Create(nil);
  try
    DM.DataSetQuery(adt_bom, 'EXEC usp_GetBOM @Col=''ComponentID''');
    for i := 0 to adt_bom.RecordCount - 1 do
    begin
      objBOM := TobjBOM.Create;
      objBOM.ModelID := adt_bom.fieldbyName('ModelID').AsInteger;
      objBOM.ComponentID := adt_bom.fieldbyName('ComponentID').AsInteger;
      objBOM.bomQty := adt_bom.fieldbyName('ComponentQuantity').AsFloat;
      slBOM.AddObject(IntToStr(i), objBOM);
      adt_bom.Next;
    end;

    k := 0;
    for i := 0 to slForecast.Count - 1 do
    begin
      for j := 0 to slBOM.Count - 1 do
      begin
        if TobjForecast(slForecast.Objects[i]).ModelID
          = TobjBOM(slBOM.Objects[j]).ModelID then
        begin
          objMRP := TobjMRP.Create;
          objMRP.ComponentID := TobjBOM(slBOM.Objects[j]).ComponentID;
          objMRP.mrpQty := TobjForecast(slForecast.Objects[i]).Quantity
            * TobjBOM(slBOM.Objects[j]).bomQty;

          objMRP.ModelID := TobjForecast(slForecast.Objects[i]).ModelID;
          objMRP.ForecastMonth := TobjForecast(slForecast.Objects[i]).ForecastMonth;
          objMRP.ForecastYear := TobjForecast(slForecast.Objects[i]).ForecastYear;
          slMRP.AddObject(IntToStr(k), objMRP);
        {  Memo1.Lines.Add(IntToStr(objMRP.ModelID)
            + ',' + IntToStr(objMRP.ComponentID)
            + ',' + FloatToStr(objMRP.mrpQty)
            + ',' + IntToStr(objMRP.ForecastMonth)
            + ',' + IntToStr(objMRP.ForecastYear));   }
          k := k + 1;
        end;
      end;
    end;
  finally
    adt_bom.Free;
    Result := true;
  end;
end;

function TfrmMRPForecast.ProcessPOToDB: Boolean;
var
  adt_cache: TADODataSet;
  i: integer;
begin
  adt_cache := TADODataSet.Create(nil);
  try
    DM.DataSetModify('EXEC usp_DeleteSCMRPForecast');
    DM.DataSetQuery(adt_cache, 'EXEC usp_GetSCMRPForecast');
    for i := 0 to slMRP.Count - 1 do
    begin
      adt_cache.Append;
      adt_cache.FieldByName('ComponentID').Value := TobjMRP(slMRP.Objects[i]).ComponentID;
      adt_cache.FieldByName('Quantity').Value := TobjMRP(slMRP.Objects[i]).mrpQty;
      adt_cache.FieldByName('ForecastMonth').Value := TobjMRP(slMRP.Objects[i]).ForecastMonth;
      adt_cache.FieldByName('ForecastYear').Value := TobjMRP(slMRP.Objects[i]).ForecastYear;
      adt_cache.Post;
    end;
  finally
    adt_cache.Free;
    Result := true;
  end;
end;

procedure TfrmMRPForecast.btnGenerateMRPClick(Sender: TObject);
begin
  inherited;
  if MessageDlg('Is generate MRP?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    if CalculateForecast then
    begin
      ProgressBar1.Position := 30;
      Application.ProcessMessages;
      sleep(10);
    end;
    if CalculateMRP then
    begin
      ProgressBar1.Position := 50;
      Application.ProcessMessages;
      sleep(10);
    end;
    if ProcessPOToDB then
    begin
      ProgressBar1.Position := 100;
      Application.ProcessMessages;
      sleep(10);
    end;
  end;
end;

end.

