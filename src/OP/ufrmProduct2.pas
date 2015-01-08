unit ufrmProduct2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmDBBasicPrn, PropFilerEh, DB, ADODB, PrnDbgeh, Menus,
  PropStorageEh, ActnList, ImgList, GridsEh, DBGridEh, PrViewEh, StdCtrls,
  ComCtrls, DBCtrls, ToolWin, ExtCtrls;

type
  TfrmProduct2 = class(TfrmDBBasicPrn)
    Panel1: TPanel;
    chkProductSN: TCheckBox;
    edtProductSN: TEdit;
    edtComponentSN: TEdit;
    chkComponentSN: TCheckBox;
    btnQuery: TButton;
    procedure btnQueryClick(Sender: TObject);
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

uses DataModule;

{$R *.dfm}

procedure TfrmProduct2.SetData;
begin
  inherited;

end;

procedure TfrmProduct2.SetUI;
begin
  inherited;

end;

procedure TfrmProduct2.SetAccess;
begin
  inherited;

end;

procedure TfrmProduct2.btnQueryClick(Sender: TObject);
var
  sqlConst: string;
begin
  sqlConst := '';
  if chkProductSN.Checked then
    sqlConst := sqlConst + ',@ProductSerialNumber=''' + Trim(edtProductSN.Text) + '''';
  if chkComponentSN.Checked then
    sqlConst := sqlConst + ',@ComponentSerialNumber=''' + Trim(edtComponentSN.Text) + '''';
  if sqlConst <> '' then sqlConst := copy(sqlConst, 2, length(sqlConst));

  adt_active.AfterScroll := nil;

  DM.DataSetQuery(adt_active, 'EXEC usp_GetProductTracking3 ' + sqlConst)

end;

end.
