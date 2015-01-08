unit ufrmPlantModel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmDBBasicPrn, PropFilerEh, DB, ADODB, PrnDbgeh, Menus,
  PropStorageEh, ActnList, ImgList, GridsEh, DBGridEh, PrViewEh, StdCtrls,
  ComCtrls, DBCtrls, ToolWin, ExtCtrls;

type
  TfrmPlantModel = class(TfrmDBBasicPrn)
    adt_activePlantCode: TStringField;
    adt_activeModel: TStringField;
    adt_activePlantID: TIntegerField;
    adt_activeModelID: TIntegerField;
    adt_plant: TADODataSet;
    adt_model: TADODataSet;
    adt_activePlantCode1: TStringField;
    adt_activeModel1: TStringField;
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

procedure TfrmPlantModel.SetData;
begin
  DM.DataSetQuery(adt_active, 'EXEC usp_GetPlantModel'); 
//  DM.DataSetQuery(adt_plant, 'select * from plant');
//  DM.DataSetQuery(adt_model, 'select * from Model');
end;

procedure TfrmPlantModel.SetUI;
begin
  inherited;

end;

procedure TfrmPlantModel.SetAccess;
begin
  inherited;
  case gVars.CurUserLevel of
    2:
      begin
        DBNavigator1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
          + [nbInsert, nbPost, nbEdit, nbCancel];
        gridData.ReadOnly := false;
      end;
  end;
end;

end.
