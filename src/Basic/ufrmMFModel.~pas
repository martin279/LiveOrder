unit ufrmMFModel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmDBBasicPrn, PropFilerEh, DB, ADODB, PrnDbgeh, Menus,
  PropStorageEh, ActnList, ImgList, GridsEh, DBGridEh, PrViewEh, StdCtrls,
  ComCtrls, DBCtrls, ToolWin, ExtCtrls, Mask, DBCtrlsEh, DBLookupEh;

type
  TfrmMFModel = class(TfrmDBBasicPrn)
    adt_activeMainframeModelID: TAutoIncField;
    adt_activeModelID: TIntegerField;
    adt_activeMainframeModel: TStringField;
    adt_activeModel: TStringField;
    adt_model: TADODataSet;
    adt_activeModel2: TStringField;
    dbcbbModel: TDBLookupComboboxEh;
    Label1: TLabel;
    Label2: TLabel;
    edtMFModel: TEdit;
    btnSave: TButton;
    ds_model: TDataSource;
    procedure btnSaveClick(Sender: TObject);
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

{ TfrmMFModel }

procedure TfrmMFModel.SetData;
begin
  DM.DataSetQuery(adt_active, 'EXEC usp_GetMainframeModel');
end;

procedure TfrmMFModel.SetUI;
begin
  inherited;
end;

procedure TfrmMFModel.SetAccess;
begin
  inherited;
  if (gVars.CurUserLevel = 2) or (gVars.CurUserLevel = 22) then
  begin
    gridData.ReadOnly := false;
    DBNavigator1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
      + [nbInsert, nbPost, nbCancel];
    //pnlBottom.Visible := true;
  end;
end;

procedure TfrmMFModel.btnSaveClick(Sender: TObject);
var
  WarnMsg: string;
begin
  WarnMsg := 'Add new mainframe model?';
  if MessageDlg(WarnMsg, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    try
      if Trim(edtMFModel.Text) = '' then
      begin
        ShowMessage('Please input mainframe model.');
        Exit;
      end;
      DM.DataSetModify('EXEC usp_InsertMainframeModel '
        + ' @MainframeModel=''' + Trim(edtMFModel.Text) + ''''
        + ',@ModelID=' + VarToStr(dbcbbModel.KeyValue));
    except on E: Exception do
      begin
        ShowMessage(E.Message);
      end;
    end;
    gridData.SelectedRows.Clear;
    gridData.Selection.Clear;
    edtMFModel.Clear;
    gridData.DataSource.DataSet := nil;
    gridData.DataSource.DataSet := adt_active;
    gridData.DataSource.DataSet.Active := false;
    gridData.DataSource.DataSet.Active := true;
  end;
end;

end.

