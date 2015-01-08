unit ufrmFiscalCalendar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmDBBasicPrn, PropFilerEh, DB, ADODB, PrnDbgeh, Menus,
  PropStorageEh, ActnList, ImgList, GridsEh, DBGridEh, PrViewEh, StdCtrls,
  ComCtrls, DBCtrls, ToolWin, ExtCtrls;

type
  TfrmFiscalCalendar = class(TfrmDBBasicPrn)
  private
    { Private declarations }
  protected
    procedure SetData; override;
    procedure SetUI; override;
    procedure SetAccess; override;
  public
    { Public declarations }
  end;

var
  frmFiscalCalendar: TfrmFiscalCalendar;

implementation

uses DataModule, uMJ;

{$R *.dfm}

{ TfrmDBBasicPrn1 }

procedure TfrmFiscalCalendar.SetData;
begin
  inherited;
  DM.DataSetQuery3(adt_active, 'select * from FiscalCalendar'
    + ' where FiscalYear>=DATEPART(year,getdate())-3 and  FiscalYear<=DATEPART(year,getdate())+1'
    +' order by FiscalCalendarID desc');
end;

procedure TfrmFiscalCalendar.SetUI;
begin
  inherited;

end;

procedure TfrmFiscalCalendar.SetAccess;
begin
  inherited;
  if (gVars.CurUserLevel = 1) or (gVars.CurUserLevel = 2) or (gVars.CurUserLevel = 4) then
  begin
    DBNavigator1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
      + [nbPost, nbEdit, nbCancel];
    gridData.ReadOnly := false;
  end;
end;

end.
