unit ufrmForwarder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmDBBasicPrn, PropFilerEh, DB, ADODB, PrnDbgeh, Menus,
  PropStorageEh, ActnList, ImgList, GridsEh, DBGridEh, PrViewEh, StdCtrls,
  DBCtrls, ComCtrls, ToolWin, ExtCtrls, uDMManager;

type
  TfrmForwarder = class(TfrmDBBasicPrn)
    adt_activeForwarderID: TAutoIncField;
    adt_activeForwarderName: TStringField;
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

{ TfrmForwarder }

procedure TfrmForwarder.SetData;
begin
  DM.DataSetQuery(adt_active, 'EXEC usp_GetForwarder');
end;

procedure TfrmForwarder.SetUI;
begin
  inherited;

end;

procedure TfrmForwarder.SetAccess;
begin
  inherited;
  if objCurUser.AccessLevel in [1, 2] then
  begin
    gridData.ReadOnly := false;
    DBNavigator1.VisibleButtons := [nbFirst, nbNext, nbLast, nbPrior, nbInsert, nbPost, nbCancel];
  end;
end;

end.

