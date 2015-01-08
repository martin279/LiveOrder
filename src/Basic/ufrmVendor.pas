unit ufrmVendor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmDBBasicPrn, PropFilerEh, DB, ADODB, PrnDbgeh, Menus,
  PropStorageEh, ActnList, ImgList, GridsEh, DBGridEh, PrViewEh, StdCtrls,
  DBCtrls, ComCtrls, ToolWin, ExtCtrls;

type
  TfrmVendor = class(TfrmDBBasicPrn)
    adt_activeVendorID: TAutoIncField;
    adt_activeVendorNumber: TStringField;
    adt_activeVendorName: TStringField;
    adt_activePeriodSummarize: TIntegerField;
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

procedure TfrmVendor.SetData;
begin
  DM.DataSetQuery(adt_active, 'EXEC usp_GetVendor');
end;

procedure TfrmVendor.SetUI;
begin
  inherited;

end;

procedure TfrmVendor.SetAccess;
begin
  inherited;
  case gVars.CurUserLevel of
    1:
      begin
        DBNavigator1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
          + [nbInsert, nbPost, nbEdit, nbDelete, nbCancel];
        gridData.ReadOnly := false;
      end;
    4:
      begin
        DBNavigator1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
          + [nbInsert, nbPost, nbEdit, nbDelete, nbCancel];
        gridData.ReadOnly := false;
      end;
  end;
end;

end.
