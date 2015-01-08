unit ufrmPlannerLedger;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmDBBasicPrn, PropFilerEh, DB, ADODB, PrnDbgeh, Menus,
  PropStorageEh, ActnList, ImgList, GridsEh, DBGridEh, PrViewEh, StdCtrls,
  DBCtrls, ComCtrls, ToolWin, ExtCtrls;

type
  TfrmPlannerLedger = class(TfrmDBBasicPrn)
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

{ TfrmDBBasicPrn3 }

procedure TfrmPlannerLedger.SetData;
begin
  DM.DataSetQuery(adt_active, 'EXEC usp_GetPlannerLedger');
end;

procedure TfrmPlannerLedger.SetUI;
begin
  inherited;

end;

procedure TfrmPlannerLedger.SetAccess;
begin
  inherited;

end;

end.
