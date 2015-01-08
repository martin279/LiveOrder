unit ufrmBillOfMaterials;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmDBBasicDT, PropFilerEh, MemTableDataEh, Db, ADODB,
  DataDriverEh, MemTableEh, Menus, PropStorageEh, ActnList, ImgList,
  GridsEh, DBGridEh, StdCtrls, DBCtrls, ComCtrls, ToolWin, ExtCtrls, Mask,
  DBCtrlsEh, DBLookupEh;

type
  TfrmBillOfMaterials = class(TfrmDBBasicDT)
    adt_activeModelID: TAutoIncField;
    adt_activeModel: TStringField;
    adt_activeXRef: TStringField;
    adt_activeBaseShortHandCode: TStringField;
    adt_activeProductionFactor: TFloatField;
    adt_activeSchedulingCode: TStringField;
    adt_activeBaseSE: TStringField;
    Label1: TLabel;
    dbcbbModel: TDBLookupComboboxEh;
    btnSave: TButton;
    Label2: TLabel;
    dbcbbComponent: TDBLookupComboboxEh;
    adt_model: TADODataSet;
    adt_component: TADODataSet;
    ds_component: TDataSource;
    ds_model: TDataSource;
    adt_active2BillOfMaterialsID: TAutoIncField;
    adt_active2ModelID: TIntegerField;
    adt_active2ComponentID: TIntegerField;
    adt_active2ComponentQuantity: TFloatField;
    adt_active2ValidFrom: TDateTimeField;
    adt_active2ValidUntil: TDateTimeField;
    adt_active2Model: TStringField;
    adt_active2BaseShortHandCode: TStringField;
    adt_active2ComponentItem: TStringField;
    adt_active2ComponentDescription: TStringField;
    adt_active2ComponentSeriesID: TIntegerField;
    adt_active2ComponentSeriesName: TStringField;
    procedure gridDataCellClick(Column: TColumnEh);
    procedure btnSaveClick(Sender: TObject);
    procedure gridData2Enter(Sender: TObject);
    procedure gridDataEnter(Sender: TObject);
    procedure adt_active2BeforeDelete(DataSet: TDataSet);
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

{ TfrmBillOfMaterials }

procedure TfrmBillOfMaterials.SetData;
begin
  DM.DataSetQuery(adt_active, 'EXEC usp_GetModel');
  DM.DataSetQuery(adt_active2, 'EXEC usp_GetBOM @ModelID=1');
  DM.DataSetQuery(adt_model, 'select model,modelid from Model '
    + ' where (lower(substring(model,1,3))=''zx0'' '
    + ' or lower(substring(model,1,3))=''zxl'' '
    + ' or lower(substring(model,1,2))=''zx'' '
    + ' or lower(substring(model,1,2))=''xj'' '
    + ' or lower(substring(model,1,3))=''zxd'' '
    + ' or lower(substring(model,1,4))=''xjam'' '
    + ' or lower(substring(model,1,4))=''xjal'' '
    + ' or lower(substring(model,1,2))=''gp'')');
  DM.DataSetQuery(adt_component, 'select * from component');
end;

procedure TfrmBillOfMaterials.SetUI;
begin
  inherited;
  GroupBox1.Caption := 'Model';
  GroupBox2.Caption := 'Bill Of Materials';
end;

procedure TfrmBillOfMaterials.SetAccess;
begin
  inherited;
  case gVars.CurUserLevel of
    22:
      begin
        pnlBottom.Visible := true;
        gridData2.ReadOnly := false;
      end;
  end;
end;

procedure TfrmBillOfMaterials.gridDataCellClick(Column: TColumnEh);
begin
  inherited;
  if gridData.DataSource.DataSet.RecordCount = 0 then exit;
  DM.DataSetQuery(adt_active2, 'EXEC usp_GetBOM @ModelID='
    + gridData.DataSource.DataSet.FieldByName('ModelID').AsString);
  adt_active2.Active := false;
  adt_active2.Active := true;
end;

procedure TfrmBillOfMaterials.btnSaveClick(Sender: TObject);
var
  WarnMsg: string;
begin
  WarnMsg := 'Add new BOM?';
  if MessageDlg(WarnMsg, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    try
      if dbcbbModel.Text = '' then
      begin
        ShowMessage('Please input model.');
        exit;
      end;
      if dbcbbComponent.Text = '' then
      begin
        ShowMessage('Please input component.');
        exit;
      end;
      DM.DataSetModify('EXEC usp_InsertBillOfMaterials '
        + ' @ModelID=' + VarToStr(dbcbbModel.KeyValue)
        + ',@ComponentID=' + VarToStr(dbcbbComponent.KeyValue));
    except on E: Exception do
      begin
        ShowMessage(E.Message);
      end;
    end;
  end;
end;

procedure TfrmBillOfMaterials.gridData2Enter(Sender: TObject);
begin
  inherited;
  DBNavigator1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
    + [nbEdit, nbPost, nbCancel, nbDelete];
end;

procedure TfrmBillOfMaterials.gridDataEnter(Sender: TObject);
begin
  inherited;
  DBNavigator1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh];
end;

procedure TfrmBillOfMaterials.adt_active2BeforeDelete(DataSet: TDataSet);
begin
  inherited;
  if (adt_active.fieldbyname('ModelID').AsString <> '')
    and (adt_active2.fieldbyname('ComponentID').AsString <> '') then
    DM.DataSetModify('delete from BillOfMaterials where ModelID=' + adt_active.fieldbyname('ModelID').AsString
      + ' and ComponentID=' + adt_active2.fieldbyname('ComponentID').AsString);
  adt_active2.Active := false;
  adt_active2.Active := true;
  Abort;
end;

end.
