unit ufrmCustomer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmDBBasicPrn, PropFilerEh, DB, ADODB, PrnDbgeh, Menus, PropStorageEh,
  ActnList, ImgList, GridsEh, DBGridEh, PrViewEh, StdCtrls, DBCtrls, ComCtrls,
  ToolWin, ExtCtrls, Mask, DBCtrlsEh, DBLookupEh, uDMEntity, uDMManager;

type
  TfrmCustomer = class(TfrmDBBasicPrn)
    adt_plant: TADODataSet;
    ds_plant: TDataSource;
    N2: TMenuItem;
    MenuAssignApplication: TMenuItem;
    ds_country: TDataSource;
    adt_country: TADODataSet;
    adt_type: TADODataSet;
    ds_type: TDataSource;
    tbsBody2: TTabSheet;
    gridTradingCustomer: TDBGridEh;
    adt_trading: TADODataSet;
    ds_trading: TDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    gboxEdtCustomer: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    LabelCustomerID: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    edtCustomerName: TEdit;
    edtCustomerNumber: TEdit;
    dbcbbPlant: TDBLookupComboboxEh;
    cbbOrigin: TComboBox;
    edtFullName: TEdit;
    edtChineseName: TEdit;
    edtAddress: TEdit;
    edtContactPerson: TEdit;
    edtTelephone: TEdit;
    edtFax: TEdit;
    edtCellPhone: TEdit;
    edtSoldTo: TEdit;
    edtShipTo: TEdit;
    edtDestination: TEdit;
    edtEmail: TEdit;
    edtRemark: TEdit;
    dbchkBoxKeyOrder: TDBCheckBoxEh;
    btnSave: TButton;
    gboxLogistic: TGroupBox;
    Label20: TLabel;
    Label21: TLabel;
    btnSave2: TButton;
    Label8: TLabel;
    dbcbbCountry: TDBLookupComboboxEh;
    Label22: TLabel;
    dbcbbType: TDBLookupComboboxEh;
    DBEditEh1: TDBEditEh;
    DBCheckBoxEh1: TDBCheckBoxEh;
    DBCheckBoxEh2: TDBCheckBoxEh;
    DBCheckBoxEh3: TDBCheckBoxEh;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    dbedtCustomerFamily: TDBEditEh;
    DBEditEh3: TDBEditEh;
    Label27: TLabel;
    Label26: TLabel;
    DBEditEh2: TDBEditEh;
    Label28: TLabel;
    DBEditEh4: TDBEditEh;
    DBEditEh5: TDBEditEh;
    Label29: TLabel;
    procedure btnSaveClick(Sender: TObject);
    procedure gridDataDblClick(Sender: TObject);
    procedure adt_activeBeforeInsert(DataSet: TDataSet);
    procedure MenuAssignApplicationClick(Sender: TObject);
    procedure btnSave2Click(Sender: TObject);
  private
    { Private declarations }
    objMgrBasic: TMgrBasicData;
  protected
    procedure InitializeForm; override;
    procedure DestoryForm; override;
    procedure SetData; override;
    procedure SetUI; override;
    procedure SetAccess; override;
  public
    { Public declarations }
  end;


implementation

uses DataModule, uMJ, ufrmApplicationCustomer, ufrmDBBasic;

{$R *.dfm}

{ TfrmCustomer }

procedure TfrmCustomer.InitializeForm;
begin
  objMgrBasic := TMgrBasicData.Create;
  inherited;
end;

procedure TfrmCustomer.DestoryForm;
begin
  inherited;
  objMgrBasic.Free;
end;

procedure TfrmCustomer.SetData;
begin
  objMgrBasic.QueryBasicData(adt_country, 'country', 'countryname');
  objMgrBasic.QueryBasicData(adt_plant, 'Plant');
  objMgrBasic.QueryBasicData(adt_type, 'customer_type', 'customer_type_id');
  objMgrBasic.QueryBasicData(adt_active, 'ViewCustomer', 'CustomerID');
  objMgrBasic.QueryBasicData(adt_trading, 'ViewTradingCustomer', 'CustomerID');
end;

procedure TfrmCustomer.SetUI;
begin
  inherited;
  gridData.FrozenCols := 4;
  tbsBody1.TabVisible := true;
  tbsBody1.Caption := 'Customer';
  tbsBody2.Caption := 'Trading Customer';
  pnlBottom.Visible := false;
end;

procedure TfrmCustomer.SetAccess;
begin
  inherited;
  gridTradingCustomer.ReadOnly := true;
  if objCurUser.AccessLevel in [1, 2] then
  begin
    DBNavigator1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh, nbInsert];
    gridData.OnDblClick := gridDataDblClick;
    MenuAssignApplication.Visible := true;
  end
  else if objCurUser.AccessLevel = 15 then
    gridData.OnDblClick := gridDataDblClick;
end;

procedure TfrmCustomer.adt_activeBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  LabelCustomerID.Caption := '';
  edtCustomerNumber.Text := '';
  edtCustomerName.Text := '';
  edtFullName.Text := '';
  edtChineseName.Text := '';
  edtAddress.Text := '';
  edtContactPerson.Text := '';
  edtTelephone.Text := '';
  edtFax.Text := '';
  edtCellPhone.Text := '';
  edtEmail.Text := '';
  cbbOrigin.Text := '';
  edtSoldTo.Text := '';
  edtShipTo.Text := '';
  gboxEdtCustomer.Caption := 'Add new customer';
  pnlBottom.Visible := true;
  Abort;
end;

procedure TfrmCustomer.MenuAssignApplicationClick(Sender: TObject);
begin
  inherited;
  if adt_active.RecordCount <> 0 then
    TfrmApplicationCustomer.EdtFromList(adt_active);
end;

procedure TfrmCustomer.gridDataDblClick(Sender: TObject);
begin
  inherited;
  if MessageDlg('Change Select customer Information?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    gboxEdtCustomer.Caption := 'Edit customer';
    LabelCustomerID.Caption := gridData.DataSource.DataSet.FieldByName('CustomerID').AsString;
    edtCustomerNumber.Text := gridData.DataSource.DataSet.FieldByName('CustomerNumber').AsString;
    edtCustomerName.Text := gridData.DataSource.DataSet.FieldByName('CustomerName').AsString;
    edtFullName.Text := gridData.DataSource.DataSet.FieldByName('FullName').AsString;
    edtChineseName.Text := gridData.DataSource.DataSet.FieldByName('ChineseName').AsString;
    edtAddress.Text := gridData.DataSource.DataSet.FieldByName('CustomerAddress').AsString;
    //cbbCountry.Text := gridData.DataSource.DataSet.FieldByName('Country').AsString;
    dbcbbCountry.Value := gridData.DataSource.DataSet.FieldByName('CountryID').AsVariant;
    edtContactPerson.Text := gridData.DataSource.DataSet.FieldByName('ContactPerson').AsString;
    edtTelephone.Text := gridData.DataSource.DataSet.FieldByName('Telephone').AsString;
    edtFax.Text := gridData.DataSource.DataSet.FieldByName('Fax').AsString;
    edtCellPhone.Text := gridData.DataSource.DataSet.FieldByName('CellPhone').AsString;
    edtEmail.Text := gridData.DataSource.DataSet.FieldByName('Email').AsString;
    cbbOrigin.Text := gridData.DataSource.DataSet.FieldByName('Origin').AsString;
    edtSoldTo.Text := gridData.DataSource.DataSet.FieldByName('SoldTo').AsString;
    edtShipTo.Text := gridData.DataSource.DataSet.FieldByName('ShipTo').AsString;
    edtDestination.Text := gridData.DataSource.DataSet.FieldByName('Destination').AsString;
    edtRemark.Text := gridData.DataSource.DataSet.FieldByName('Remark').AsString;
    dbcbbPlant.Value := gridData.DataSource.DataSet.FieldByName('PlantID').AsString;
    if gridData.DataSource.DataSet.FieldByName('customer_type_id').AsString <> '' then
      dbcbbType.Value := gridData.DataSource.DataSet.FieldByName('customer_type_id').AsString;
    //dbcbbCountry.ItemIndex := dbcbbCountry.Items.IndexOf(gridData.DataSource.DataSet.FieldByName('CountryID').AsString);
    cbbOrigin.ItemIndex := cbbOrigin.Items.IndexOf(gridData.DataSource.DataSet.FieldByName('Origin').AsString);
    pnlBottom.Visible := true;
  end;
end;

procedure TfrmCustomer.btnSaveClick(Sender: TObject);
var
  WarnMsg, IsCHN, IsKeyOrder, strSQL: string;
begin
  if LabelCustomerID.Caption <> '' then
    WarnMsg := 'Save change of customer id: ' + LabelCustomerID.Caption
  else
    WarnMsg := 'Add new customer?';
  begin
    try
      if Trim(edtCustomerNumber.Text) = '' then
      begin
        ShowMessage('Please input customer number.');
        Exit;
      end;
      if Trim(edtCustomerName.Text) = '' then
      begin
        ShowMessage('Please input customer name.');
        Exit;
      end;
      if VarToStr(dbcbbType.Value) = '' then
      begin
        ShowMessage('Please input customer type.');
        Exit;
      end;
      if LowerCase(VarToStr(dbcbbCountry.Text)) = 'chn' then
        IsCHN := '1'
      else
        IsCHN := '0';
      if dbchkBoxKeyOrder.Checked then
        IsKeyOrder := '1'
      else
        IsKeyOrder := '0';
      strSQL := '';
      if LabelCustomerID.Caption <> '' then
      begin
        strSQL := 'EXEC usp_UpdateCustomer '
          + ' @CustomerID=' + Trim(LabelCustomerID.Caption)
          + ',@CustomerNumber=''' + Trim(edtCustomerNumber.Text) + ''''
          + ',@CustomerName=''' + Trim(edtCustomerName.Text) + ''''
          + ',@FullName=''' + Trim(edtFullName.Text) + ''''
          + ',@ChineseName=''' + Trim(edtChineseName.Text) + ''''
          + ',@CustomerAddress=''' + Trim(edtAddress.Text) + ''''
          //+ ',@Country=''' + Trim(cbbCountry.Text) + ''''
        + ',@CountryID=' + VarToStr(dbcbbCountry.Value)
          + ',@ContactPerson=''' + Trim(edtContactPerson.Text) + ''''
          + ',@Telephone=''' + Trim(edtTelephone.Text) + ''''
          + ',@Fax=''' + Trim(edtFax.Text) + ''''
          + ',@CellPhone=''' + Trim(edtCellPhone.Text) + ''''
          + ',@Email=''' + Trim(edtEmail.Text) + ''''
          + ',@Origin=''' + Trim(cbbOrigin.Text) + ''''
          + ',@SoldTo=''' + Trim(edtSoldTo.Text) + ''''
          + ',@ShipTo=''' + Trim(edtShipTo.Text) + ''''
          + ',@Destination=''' + Trim(edtDestination.Text) + ''''
          + ',@PlantID=' + VarToStr(dbcbbPlant.Value)
          + ',@Remark=''' + Trim(edtRemark.Text) + '''' {
          + ',@customer_type_id=' + VarToStr(dbcbbType.Value)
          + ',@Region=''' + Trim(edtRegion.Text) + ''''
          + ',@AsiaPOR=''' + Trim(edtAsiaPOR.Text) + ''''      }
        + ',@IsCHN=' + IsCHN
          + ',@IsKeyOrder=' + IsKeyOrder;
        LabelCustomerID.Caption := '';
      end
      else
      begin
        strSQL := 'EXEC usp_InsertCustomer '
          + ' @CustomerNumber=''' + Trim(edtCustomerNumber.Text) + ''''
          + ',@CustomerName=''' + Trim(edtCustomerName.Text) + ''''
          + ',@FullName=''' + Trim(edtFullName.Text) + ''''
          + ',@ChineseName=''' + Trim(edtChineseName.Text) + ''''
          + ',@CustomerAddress=''' + Trim(edtAddress.Text) + ''''
          //+ ',@Country=''' + Trim(cbbCountry.Text) + ''''
        + ',@CountryID=' + VarToStr(dbcbbCountry.Value)
          + ',@ContactPerson=''' + Trim(edtContactPerson.Text) + ''''
          + ',@Telephone=''' + Trim(edtCustomerName.Text) + ''''
          + ',@Fax=''' + Trim(edtTelephone.Text) + ''''
          + ',@CellPhone=''' + Trim(edtCellPhone.Text) + ''''
          + ',@Email=''' + Trim(edtEmail.Text) + ''''
          + ',@Origin=''' + Trim(cbbOrigin.Text) + ''''
          + ',@SoldTo=''' + Trim(edtSoldTo.Text) + ''''
          + ',@ShipTo=''' + Trim(edtShipTo.Text) + ''''
          + ',@Destination=''' + Trim(edtDestination.Text) + ''''
          + ',@PlantID=' + VarToStr(dbcbbPlant.Value)
        //  + ',@customer_type_id=' + VarToStr(dbcbbType.Value)
        + ',@Remark=''' + Trim(edtRemark.Text) + ''''
          + ',@LoginID=' + IntToStr(objCurUser.LoginID)
          + ',@IsCHN=' + IsCHN
          + ',@IsKeyOrder=' + IsKeyOrder;
      end;
      if strSQL <> '' then
        DM.DataSetModify(strSQL);
    except on E: Exception do
      begin
        ShowMessage(E.Message);
      end;
    end;
    pnlBottom.Visible := false;
    gridData.SelectedRows.Clear;
    gridData.Selection.Clear;
  //gridData.ClearFilter;
  //gridData.ApplyFilter;
    gridData.DataSource.DataSet := nil;
    gridData.DataSource.DataSet := adt_active;
    gridData.DataSource.DataSet.Active := false;
    gridData.DataSource.DataSet.Active := true;
  end;
end;

procedure TfrmCustomer.btnSave2Click(Sender: TObject);
begin
  inherited;
  if (adt_trading.State in [dsEdit]) then
    adt_trading.Post;
end;

end.

