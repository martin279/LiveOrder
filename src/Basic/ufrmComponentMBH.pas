unit ufrmComponentMBH;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmDBBasicPrn, PropFilerEh, DB, ADODB, PrnDbgeh, Menus,
  PropStorageEh, ActnList, ImgList, GridsEh, DBGridEh, PrViewEh, StdCtrls,
  ComCtrls, DBCtrls, ToolWin, ExtCtrls;

type
  TfrmComponentMBH = class(TfrmDBBasicPrn)
    adt_activeComponentMBHID: TAutoIncField;
    adt_activeComponentItem: TStringField;
    adt_activeCurrentInventoryCount: TBCDField;
    adt_activeCurrentInventoryDate: TDateTimeField;
    adt_activeMinimumLevel: TBCDField;
    adt_activeMaximumLevel: TBCDField;
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

{ TfrmComponentMBH }

procedure TfrmComponentMBH.SetData;
begin
  DM.DataSetQuery(adt_active, 'EXEC usp_GetComponentMBH');
end;

procedure TfrmComponentMBH.SetUI;
begin
  inherited;

end;

procedure TfrmComponentMBH.SetAccess;
begin
  inherited;
  DBNavigator1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
    + [nbInsert, nbEdit, nbPost, nbCancel];
  gridData.ReadOnly := false;
end;

end.

