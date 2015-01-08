unit ufrmProductSeries;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmDBBasicPrn, PropFilerEh, DB, ADODB, PrnDbgeh, Menus,
  PropStorageEh, ActnList, ImgList, GridsEh, DBGridEh, PrViewEh, StdCtrls,
  DBCtrls, ComCtrls, ToolWin, ExtCtrls;

type
  TfrmProductSeries = class(TfrmDBBasicPrn)
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

{ TfrmProductSeries }

procedure TfrmProductSeries.SetData;
begin
  DM.DataSetQuery(adt_active, 'select * from ProductSeries');
end;

procedure TfrmProductSeries.SetUI;
begin
  inherited;

end;

procedure TfrmProductSeries.SetAccess;
begin
  inherited;
  if (gVars.CurUserLevel = 1) or (gVars.CurUserLevel = 2) then
  begin
    DBNavigator1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
      + [nbInsert, nbPost, nbEdit, nbDelete, nbCancel];
    gridData.ReadOnly := false;
  end;
end;

end.

