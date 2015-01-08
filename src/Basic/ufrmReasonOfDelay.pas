unit ufrmReasonOfDelay;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmDBBasicPrn, PropFilerEh, DB, ADODB, PrnDbgeh, Menus,
  PropStorageEh, ActnList, ImgList, GridsEh, DBGridEh, PrViewEh, StdCtrls,
  DBCtrls, ComCtrls, ToolWin, ExtCtrls;

type
  TfrmReasonOfDelay = class(TfrmDBBasicPrn)
    adt_activeReasonOfDelayID: TAutoIncField;
    adt_activeReasonOfDelayDesc: TStringField;
  private
    { Private declarations }
  protected
    procedure SetData; override;
    procedure SetUI; override;
  public
    { Public declarations }
  end;


implementation

uses DataModule, uMJ;

{$R *.dfm}

{ TfrmReasonOfDelay }

procedure TfrmReasonOfDelay.SetData;
begin
  DM.DataSetQuery(adt_active, 'EXEC usp_GetReasonOfDelay');
end;

procedure TfrmReasonOfDelay.SetUI;
begin
  inherited;

end;


end.
