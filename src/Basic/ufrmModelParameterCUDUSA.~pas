unit ufrmModelParameterCUDUSA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmDBBasicPrn, PropFilerEh, DB, ADODB, PrnDbgeh, Menus,
  PropStorageEh, ActnList, ImgList, GridsEh, DBGridEh, PrViewEh, StdCtrls,
  ComCtrls, DBCtrls, ToolWin, ExtCtrls;

type
  TfrmModelParameterCUDUSA = class(TfrmDBBasicPrn)
    adt_activeModelParameterCUDUSAID: TAutoIncField;
    adt_activeModelID: TIntegerField;
    adt_activeProductWeightUnit: TStringField;
    adt_activeProductWeight: TFloatField;
    adt_activeProductGrossWeight: TFloatField;
    adt_activeProductSizeUnit: TStringField;
    adt_activeProductSize: TStringField;
    adt_activeApplication: TStringField;
    adt_activeRefrigant: TStringField;
    adt_activeCrankcaseHeaterPower: TStringField;
    adt_activeDesignPressureHigh: TStringField;
    adt_activeDesignPressureLow: TStringField;
    adt_activeCompressorVoltage: TStringField;
    adt_activeCompressorMotorPH: TStringField;
    adt_activeCompressorMotorHZ: TStringField;
    adt_activeCompressorMotorRLA: TStringField;
    adt_activeCompressorMotorLRA: TStringField;
    adt_activeCondenserFanQty: TStringField;
    adt_activeCondenserFanVoltage: TStringField;
    adt_activeCondenserFanPH: TStringField;
    adt_activeCondenserFanHZ: TStringField;
    adt_activeCondenserFanFLA: TStringField;
    adt_activeCondenserFanWattb: TStringField;
    adt_activeUnitPowerSupplyVoltage: TStringField;
    adt_activeUnitPowerSupplyPH: TStringField;
    adt_activeUnitPowerSupplyHZ: TStringField;
    adt_activeMinCircuitAmpacity: TStringField;
    adt_activeAmpsMaxBranchCircuitFuse: TStringField;
    adt_activeModel: TStringField;
    adt_model: TADODataSet;
    adt_activeModel2: TStringField;
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

{ TfrmModelParameterCUDUSA }

procedure TfrmModelParameterCUDUSA.SetData;
begin
  //DM.DataSetQuery(adt_active, format(sQueryModelParameterCUDUSASQL, ['']));
  DM.DataSetQuery(adt_active, 'EXEC usp_GetModelParameterCUDUSA');
end;

procedure TfrmModelParameterCUDUSA.SetUI;
begin
  inherited;
  //gridData.FieldColumns['Model'].ReadOnly := true;
end;

procedure TfrmModelParameterCUDUSA.SetAccess;
begin
  inherited;
  case gVars.CurUserLevel of
    1:
      begin
        DBNavigator1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
          + [nbInsert, nbPost, nbEdit, nbDelete, nbCancel];
        gridData.ReadOnly := false;
      end;
    22:
      begin
        DBNavigator1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
          + [nbInsert, nbPost, nbEdit, nbCancel, nbPost];
        gridData.ReadOnly := false;
      end;
  end;
end;

end.
