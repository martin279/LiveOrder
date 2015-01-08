unit ufrmCountry;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmDBBasicPrn, PropFilerEh, ActnList, PrnDbgeh, ImgList, DB,
  ADODB, Menus, PropStorageEh, DBCtrls, ComCtrls, ToolWin, GridsEh,
  DBGridEh, PrViewEh, StdCtrls, ExtCtrls;

type
  TfrmCountry = class(TfrmDBBasicPrn)
    adt_activeCountryID: TAutoIncField;
    adt_activeCountryName: TStringField;
    adt_activeCountryDesc: TStringField;
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

uses DataModule, uMJ, ufrmDBBasic;

{$R *.dfm}

{ TfrmDBBasicPrn1 }

procedure TfrmCountry.SetData;
begin
  DM.DataSetQuery(adt_active, 'select * from country');
end;

procedure TfrmCountry.SetUI;
begin
  inherited;

end;

procedure TfrmCountry.SetAccess;
begin
  inherited;
  if (gVars.CurUserLevel = 1) or (gVars.CurUserLevel = 2) then
  begin
    DBNavigator1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
      + [nbInsert, nbPost, nbCancel];
    gridData.ReadOnly := false;
  end;
end;

end.

