unit ufrmPriceTerms;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmDBBasicPrn, PropFilerEh, DB, ADODB, PrnDbgeh, Menus,
  PropStorageEh, ActnList, ImgList, GridsEh, DBGridEh, PrViewEh, StdCtrls,
  DBCtrls, ComCtrls, ToolWin, ExtCtrls;

type
  TfrmPriceTerms = class(TfrmDBBasicPrn)
    adt_activePriceTermsID: TAutoIncField;
    adt_activePriceTerms: TStringField;
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

{ TfrmPriceTerms }

procedure TfrmPriceTerms.SetData;
begin
  DM.DataSetQuery(adt_active, 'EXEC usp_GetPriceTerms');
end;

procedure TfrmPriceTerms.SetUI;
begin
  inherited;

end;

procedure TfrmPriceTerms.SetAccess;
begin
  inherited;
  case gVars.CurUserLevel of
    1:
      begin
        DBNavigator1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
          + [nbInsert, nbPost, nbEdit, nbDelete, nbCancel];
        gridData.ReadOnly := false;
      end;
    10:
      begin
        DBNavigator1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
          + [nbInsert, nbPost, nbEdit, nbDelete, nbCancel];
        gridData.ReadOnly := false;
      end;
  end;
end;

end.
