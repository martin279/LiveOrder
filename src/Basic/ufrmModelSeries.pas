unit ufrmModelSeries;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmDBBasicPrn, PropFilerEh, DB, ADODB, PrnDbgeh, Menus,
  PropStorageEh, ActnList, ImgList, GridsEh, DBGridEh, PrViewEh, StdCtrls,
  ComCtrls, DBCtrls, ToolWin, ExtCtrls;

type
  TfrmModelSeries = class(TfrmDBBasicPrn)
    adt_series: TADODataSet;
    adt_model: TADODataSet;
    adt_activeProductSeriesName: TStringField;
    adt_activeModel: TStringField;
    adt_activeModelID: TIntegerField;
    adt_activeProductSeriesID: TIntegerField;
    adt_activeModel1: TStringField;
    adt_activeProductSeriesName1: TStringField;
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

{ TfrmDBBasicPrn1 }

procedure TfrmModelSeries.SetData;
begin
  DM.DataSetQuery(adt_active, 'EXEC usp_GetModelSeries'); 
  DM.DataSetQuery(adt_series, 'select * from ProductSeries');
  DM.DataSetQuery(adt_model, 'select * from Model');
end;

procedure TfrmModelSeries.SetUI;
begin
  inherited;

end;

procedure TfrmModelSeries.SetAccess;
begin
  inherited;
  case gVars.CurUserLevel of
    2:
      begin
        DBNavigator1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
          + [nbInsert, nbPost, nbEdit, nbDelete, nbCancel];
        gridData.ReadOnly := false;
      end;
    3:
      begin
        DBNavigator1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
          + [nbInsert, nbPost, nbEdit, nbCancel];
        gridData.ReadOnly := false;
      end;
  end;
end;

end.
