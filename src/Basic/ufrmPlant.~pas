unit ufrmPlant;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmDBBasicPrn, PropFilerEh, DB, ADODB, PrnDbgeh, Menus,
  PropStorageEh, ActnList, ImgList, GridsEh, DBGridEh, PrViewEh, StdCtrls,
  DBCtrls, ComCtrls, ToolWin, ExtCtrls;

type
  TfrmPlant = class(TfrmDBBasicPrn)
    adt_activePlantID: TAutoIncField;
    adt_activePlantCode: TStringField;
    adt_activePlantName: TStringField;
  private
    { Private declarations }
  protected
    procedure SetData; override;
  public
    { Public declarations }
  end;


implementation

uses DataModule;

{$R *.dfm}

{ TfrmPlant }

procedure TfrmPlant.SetData;
begin
  DM.DataSetQuery(adt_active, 'EXEC usp_GetPlant');
end;

end.
