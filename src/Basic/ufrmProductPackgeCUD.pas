unit ufrmProductPackgeCUD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmDBBasicPrn, PropFilerEh, DB, ADODB, PrnDbgeh, Menus,
  PropStorageEh, ActnList, ImgList, GridsEh, DBGridEh, PrViewEh, StdCtrls,
  ComCtrls, DBCtrls, ToolWin, ExtCtrls;

type
  TfrmProductPackgeCUD = class(TfrmDBBasicPrn)
    adt_activeProductPackgeID: TIntegerField;
    adt_activeIsCHN: TStringField;
    adt_activeProductSeriesID: TIntegerField;
    adt_activeProductPackgeType: TStringField;
    adt_activeProductWeightUnit: TStringField;
    adt_activeProductWeight: TFloatField;
    adt_activeProductGrossWeight: TFloatField;
    adt_activeProductSizeUnit: TStringField;
    adt_activeProductSize: TStringField;
    adt_activeProductSeriesName: TStringField;
    adt_pt: TADODataSet;
    adt_activeProductSeriesName2: TStringField;
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

{ TfrmProductPackgeCUD }

procedure TfrmProductPackgeCUD.SetData;
begin
  //DM.DataSetQuery(adt_active, format(sQueryProductPackgeCUDSQL, ['']));
  DM.DataSetQuery(adt_active, 'EXEC usp_GetProductPackgeCUD');
end;

procedure TfrmProductPackgeCUD.SetUI;
begin
  inherited;
end;

procedure TfrmProductPackgeCUD.SetAccess;
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
          + [nbInsert, nbEdit, nbCancel, nbPost];
        gridData.ReadOnly := false;
      end;
  end;
end;

end.

