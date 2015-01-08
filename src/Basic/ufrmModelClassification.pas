unit ufrmModelClassification;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmDBBasicPrn, PropFilerEh, DB, ADODB, PrnDbgeh, Menus,
  PropStorageEh, ActnList, ImgList, GridsEh, DBGridEh, PrViewEh, StdCtrls,
  ComCtrls, DBCtrls, ToolWin, ExtCtrls;

type
  TfrmModelClassification = class(TfrmDBBasicPrn)
    adt_model: TADODataSet;
    adt_activeModel: TStringField;
    adt_activeModelID: TIntegerField;
    adt_activeProductClassification: TStringField;
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

{ TfrmModelClassification }

procedure TfrmModelClassification.SetData;
begin
  DM.DataSetQuery(adt_active, 'EXEC usp_GetModelClassification'); 
  DM.DataSetQuery(adt_model, 'select * from Model');
end;

procedure TfrmModelClassification.SetUI;
begin
  inherited;

end;

procedure TfrmModelClassification.SetAccess;
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
