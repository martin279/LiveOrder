unit ufrmDailyStarts;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmDBBasicPrn, PropFilerEh, DB, ADODB, PrnDbgeh, Menus,
  PropStorageEh, ActnList, ImgList, GridsEh, DBGridEh, PrViewEh, StdCtrls,
  DBCtrls, ComCtrls, ToolWin, ExtCtrls;

type
  TfrmDailyStarts = class(TfrmDBBasicPrn)
    adt_line: TADODataSet;
    adt_activeScheduleStartPointID: TAutoIncField;
    adt_activeScheduleStartPointDate: TDateTimeField;
    adt_activeScheduleStartPointEntryDate: TDateTimeField;
    adt_activeAssemblyLineID: TIntegerField;
    adt_activeScheduleNumber: TStringField;
    adt_activeScheduleSequence: TStringField;
    adt_activeScheduleQuantityComplete: TIntegerField;
    adt_activeLine: TStringField;
    adt_activeLine1: TStringField;
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

{ TfrmDailyStarts }

procedure TfrmDailyStarts.SetData;
begin
  DM.DataSetQuery(adt_line, 'EXEC usp_GetAssemblyLine');
  DM.DataSetQuery(adt_active, 'EXEC usp_GetScheduleStartPoint');
end;

procedure TfrmDailyStarts.SetUI;
begin
  inherited;

end;

procedure TfrmDailyStarts.SetAccess;
begin
  inherited;
  case gVars.CurUserLevel of
    1:
      begin
        DBNavigator1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
          + [nbInsert, nbPost, nbEdit, nbDelete, nbCancel];
        gridData.ReadOnly := false;
      end;
    3:
      begin
        DBNavigator1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
          + [nbPost, nbCancel];
        gridData.ReadOnly := false;
      end;
    4:
      begin
        DBNavigator1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
          + [nbPost, nbCancel];
        gridData.ReadOnly := false;
      end;
  end;
end;

end.
