unit ufrmBillOfMaterialsLiveMRP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmDBBasicPrn, PropFilerEh, DB, ADODB, PrnDbgeh, Menus,
  PropStorageEh, ActnList, ImgList, GridsEh, DBGridEh, PrViewEh, StdCtrls,
  ComCtrls, DBCtrls, ToolWin, ExtCtrls;

type
  TfrmBillOfMaterialsLiveMRP = class(TfrmDBBasicPrn)
    adt_activeModel: TStringField;
    adt_activeComponentItem: TStringField;
    adt_activeComponentDescription: TStringField;
    adt_activeComponentQuantity: TFloatField;
    adt_activeValidFrom: TDateTimeField;
    adt_activeValidUntil: TDateTimeField;
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
      
procedure TfrmBillOfMaterialsLiveMRP.SetData;
begin
  DM.DataSetQuery3(adt_active, 'EXEC usp_GetBillOfMaterialsLiveMRP');
end;

procedure TfrmBillOfMaterialsLiveMRP.SetUI;
begin
  inherited;
end;

procedure TfrmBillOfMaterialsLiveMRP.SetAccess;
begin
  inherited;
end;

end.
 