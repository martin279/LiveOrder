unit ufrmProductFamily;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmDBBasicPrn, PropFilerEh, DB, ADODB, PrnDbgeh, Menus,
  PropStorageEh, ActnList, ImgList, GridsEh, DBGridEh, PrViewEh, StdCtrls,
  ComCtrls, DBCtrls, ToolWin, ExtCtrls;

type
  TfrmProductFamily = class(TfrmDBBasicPrn)
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

{ TfrmProductFamily }

procedure TfrmProductFamily.SetData;
begin
  inherited;
  DM.DataSetQuery(adt_active, 'Select * from ProductFamily');
end;

procedure TfrmProductFamily.SetUI;
begin
  inherited;

end;

procedure TfrmProductFamily.SetAccess;
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
