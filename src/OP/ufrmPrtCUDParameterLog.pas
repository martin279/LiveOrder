unit ufrmPrtCUDParameterLog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmDBBasicPrn, PropFilerEh, DB, ADODB, PrnDbgeh, Menus,
  PropStorageEh, ActnList, ImgList, GridsEh, DBGridEh, PrViewEh, StdCtrls,
  ComCtrls, DBCtrls, ToolWin, ExtCtrls;

type
  TfrmPrtCUDParameterLog = class(TfrmDBBasicPrn)
    adt_activeLogID: TAutoIncField;
    adt_activeProductSerialNumber: TStringField;
    adt_activeModel: TStringField;
    adt_activeProductDate: TDateTimeField;
    adt_activeVoltage: TStringField;
    adt_activePh: TStringField;
    adt_activeHz: TStringField;
    adt_activeFan: TStringField;
    adt_activeEvaporatingTempRange: TStringField;
    adt_activeL_R_A: TStringField;
    adt_activeR_L_A: TStringField;
    adt_activeCapacity: TStringField;
    adt_activePower: TStringField;
    adt_activeCOP: TStringField;
    adt_activeRatingCondition: TStringField;
    adt_activelow_pressure: TStringField;
    adt_activehigh_pressure: TStringField;
    adt_activeoil: TStringField;
    adt_activeRefrigerant: TStringField;
    adt_activeProductWeight: TFloatField;
    adt_activeupdate_time: TDateTimeField;
    adt_activeupdate_by: TStringField;
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

uses DataModule;

{$R *.dfm}

{ TfrmDBBasicPrn1 }

procedure TfrmPrtCUDParameterLog.SetData;
begin
  DM.DataSetQuery(adt_active, 'select * from PrintCUDParameterLog');
end;

procedure TfrmPrtCUDParameterLog.SetUI;
begin
  inherited;

end;

procedure TfrmPrtCUDParameterLog.SetAccess;
begin
  inherited;

end;

end.
