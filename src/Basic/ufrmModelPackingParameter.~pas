unit ufrmModelPackingParameter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmDBBasicPrn, PropFilerEh, DB, ADODB, PrnDbgeh, Menus,
  PropStorageEh, ActnList, ImgList, GridsEh, DBGridEh, PrViewEh, StdCtrls,
  ComCtrls, DBCtrls, ToolWin, ExtCtrls;

type
  TfrmModelPackingParameter = class(TfrmDBBasicPrn)
    adt_activeModelID: TIntegerField;
    adt_activeNetWeightPerPCS: TFloatField;
    adt_activeGrossWeight: TFloatField;
    adt_activeDimensions: TStringField;
    adt_activeModel: TStringField;
    adt_model: TADODataSet;
    ds_model: TDataSource;
    adt_modelModelID: TAutoIncField;
    adt_modelModel: TStringField;
    adt_modelModelDescription: TStringField;
    adt_modelXRef: TStringField;
    adt_modelBaseShortHandCode: TStringField;
    adt_modelProductionFactor: TFloatField;
    adt_modelSchedulingCode: TStringField;
    adt_modelBaseSE: TStringField;
    adt_modelProductSeriesID: TIntegerField;
    adt_modelIsValid: TBooleanField;
    adt_modelcatalogue: TStringField;
    adt_activeModel1: TStringField;
    adt_activeQuantity: TIntegerField;
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

uses uMJ, DataModule;

{$R *.dfm}

{ TfrmModelPackingParameter }

procedure TfrmModelPackingParameter.SetData;
begin
  DM.DataSetQuery(adt_active, 'select p.*,m.Model from ModelPackingParameter p left outer join Model m on p.ModelID=m.ModelID');
end;

procedure TfrmModelPackingParameter.SetUI;
begin
  inherited;

end;

procedure TfrmModelPackingParameter.SetAccess;
begin
  inherited;
  case gVars.CurUserLevel of
    1:
      begin
        DBNavigator1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
          + [nbInsert, nbPost, nbEdit, nbDelete, nbCancel];
        gridData.ReadOnly := false;
      end;      
    2:
      begin
        DBNavigator1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
          + [nbInsert, nbPost, nbEdit, nbDelete, nbCancel];
        gridData.ReadOnly := false;
      end;
  end;
end;

end.

