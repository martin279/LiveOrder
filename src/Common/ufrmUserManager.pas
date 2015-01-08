unit ufrmUserManager;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmDBBasicPrn, PropFilerEh, DB, ADODB, PrnDbgeh, Menus,
  PropStorageEh, ActnList, ImgList, GridsEh, DBGridEh, PrViewEh, StdCtrls,
  ComCtrls, DBCtrls, ToolWin, ExtCtrls;

type
  TfrmUserManager = class(TfrmDBBasicPrn)
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

{ TfrmUserManager }

procedure TfrmUserManager.SetData;
begin
  inherited;
  DM.DataSetQuery(adt_active, 'select * from Login');
end;

procedure TfrmUserManager.SetUI;
begin
  inherited;

end;

procedure TfrmUserManager.SetAccess;
begin
  inherited;

end;

end.

