unit ufrmCommunicatorCustomer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ADODB, DBGridEh, Mask, DBCtrlsEh,
  DBLookupEh, ExtCtrls, DB, DBCtrls;

type
  TfrmCommunicatorCustomer = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    pnlEdtSales: TPanel;
    Label4: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    btnSaveCommunicator: TButton;
    chkIsValid: TCheckBox;
    dbcbbDisplayName: TDBLookupComboboxEh;
    edtPhone: TEdit;
    edtFax: TEdit;
    edtMail: TEdit;
    BitBtn1: TBitBtn;
    TabSheet2: TTabSheet;
    Panel2: TPanel;
    ListView1: TListView;
    Panel1: TPanel;
    CheckBox1: TCheckBox;
    bitBtnSave: TBitBtn;
    bitBtnClose: TBitBtn;
    ds_active: TDataSource;
    adt_login: TADODataSet;
    ds_login: TDataSource;
    Label5: TLabel;
    edtCommunicatorCode: TEdit;
    procedure chkIsValidClick(Sender: TObject);
    procedure btnSaveCommunicatorClick(Sender: TObject);
    procedure bitBtnSaveClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure bitBtnCloseClick(Sender: TObject);
    procedure PageControl1Changing(Sender: TObject;
      var AllowChange: Boolean);
  private
    { Private declarations }
    CommunicatorID: string;
    gIsInsert: boolean;
    function AddCommunicatorReturnCommunicatorID: string;
    function SaveCommunicator: boolean;
  public
    { Public declarations }
    procedure GetCustomerList;
    function SaveCommunicatorCustomer: boolean;
    class procedure EdtFromList(adt_from: TADODataSet; isInsert: Boolean);
  end;


implementation

uses DataModule, uMJ;

{$R *.dfm}

class procedure TfrmCommunicatorCustomer.EdtFromList(adt_from: TADODataSet; isInsert: Boolean);
begin
  with TfrmCommunicatorCustomer.Create(Application) do
  try
    DM.DataSetQuery(adt_login, 'Select * from Login');
    CommunicatorID := adt_from.fieldbyname('CommunicatorID').AsString;
    ds_active.DataSet := adt_from;
    gIsInsert := isInsert;
    if isInsert then
    begin
      chkIsValid.Checked := true;
      chkIsValid.Enabled := false;
      chkIsValid.Color := clMenu;
      TabSheet2.TabVisible := false;
    end
    else
    begin
      dbcbbDisplayName.Color := clMenu;
      dbcbbDisplayName.Enabled := false;
      dbcbbDisplayName.Value := adt_from.fieldbyname('LoginID').AsString;
      edtPhone.Text := adt_from.fieldbyname('CommunicatorCode').AsString;
      edtPhone.Text := adt_from.fieldbyname('CommunicatorPhone').AsString;
      edtFax.Text := adt_from.fieldbyname('CommunicatorFax').AsString;
      edtMail.Text := adt_from.fieldbyname('CommunicatorMail').AsString;
      chkIsValid.Checked := adt_from.fieldbyname('IsValid').AsBoolean;
    end;
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmCommunicatorCustomer.GetCustomerList;

  procedure GetSalesCustomer;
  var
    i: integer;
  begin
    for i := 0 to ListView1.Items.Count - 1 do
    begin
      if dm.CCheckID('select 1 from CommunicatorCustomer where CommunicatorID=' + CommunicatorID
        + ' and CustomerID=''' + trim(listview1.Items.Item[i].Caption) + '''') then
        ListView1.Items.Item[i].Checked := true;
    end;
  end;

var
  adt1: TADODataSet;
begin
  ListView1.Items.Clear;
  adt1 := TADODataSet.Create(nil);
  try
    DM.DataSetQuery(adt1, 'exec usp_GetCustomer @plantid=''select plantid from LoginPlant where LoginID='
      + VarToStr(dbcbbDisplayName.value) + '''');
    while not adt1.Eof do
    begin
      with ListView1.Items.Add do
      begin
        Caption := trim(adt1.fieldbyname('CustomerID').AsString);
        SubItems.Add(adt1.fieldbyname('CustomerNumber').AsString);
        SubItems.Add(adt1.fieldbyname('CustomerName').AsString);
        SubItems.Add(adt1.fieldbyname('PlantCode').AsString);
      end;
      adt1.Next;
    end;
    GetSalesCustomer;
  finally
    adt1.Free;
  end;
end;

procedure TfrmCommunicatorCustomer.chkIsValidClick(Sender: TObject);
begin
  if not chkIsValid.Checked then
  begin
    if MessageDlg('Cancel this communicator?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      if SaveCommunicator then
      begin
        ds_active.DataSet.Active := false;
        ds_active.DataSet.Active := true;
        close;
      end;
    end
    else
      chkIsValid.Checked := true;
  end;
end;

procedure TfrmCommunicatorCustomer.btnSaveCommunicatorClick(Sender: TObject);
var
  bk: TBookmark;
begin
  if trim(edtCommunicatorCode.Text) = '' then
  begin
    ShowMessage('Please input communicator code!');
    edtCommunicatorCode.SetFocus;
    Exit;
  end;
  if gIsInsert then
  begin
    if AddCommunicatorReturnCommunicatorID = '' then
      application.messagebox('Save communicator failed! please check.', 'Prompt!')
    else
    begin
      mjLockForm(pnlEdtSales);
      PageControl1.ActivePageIndex := 1;
      TabSheet2.TabVisible := true;
      ds_active.DataSet.Active := false;
      ds_active.DataSet.Active := true;
    end;
  end
  else
  begin
    bk := ds_active.DataSet.GetBookmark;
    try
      if not SaveCommunicator then
        application.messagebox('Save communicator failed! please check .', 'Prompt!')
      else
        PageControl1.ActivePageIndex := 1;
    finally
      ds_active.DataSet.Active := false;
      ds_active.DataSet.Active := true;
      if ds_active.DataSet.BookmarkValid(bk) then
        ds_active.DataSet.GotoBookmark(bk);
      ds_active.DataSet.FreeBookmark(bk);
    end;
  end;
end;

function TfrmCommunicatorCustomer.AddCommunicatorReturnCommunicatorID: string;
var
  Query: TADOQuery;
begin
  Query := TADOQuery.Create(self);
  Query.Connection := dm.ADOConnection1;
  try
    dm.ADOConnection1.BeginTrans;
    Query.SQL.Clear;
    Query.SQL.Text := 'exec usp_InsertCommunicator @CommunicatorPhone=''' + Trim(edtPhone.Text)
      + ''',@CommunicatorFax=''' + Trim(edtFax.Text)
      + ''',@CommunicatorMail=''' + Trim(edtMail.Text)
      + ''',@CommunicatorCode=''' + Trim(edtCommunicatorCode.Text)
      + ''',@LoginID=' + VarToStr(dbcbbDisplayName.value);
    Query.ExecSQL;
    Query.SQL.Clear;
    Query.SQL.Text := 'select max(CommunicatorID) as CommunicatorID from Communicator';
    Query.Open;
    CommunicatorID := Query.FieldValues['CommunicatorID'];
    dm.ADOConnection1.CommitTrans;
    result := CommunicatorID;
  except
    dm.ADOConnection1.RollbackTrans;
    result := '';
  end;
  Query.Close;
  Query.Free;
end;

function TfrmCommunicatorCustomer.SaveCommunicator: boolean;
var
  IsValid: integer;
begin
  if chkIsValid.Checked then
    IsValid := 1
  else
    IsValid := 0;
  try
    DM.DataSetModify('exec usp_UpdateCommunicator @CommunicatorID=' + CommunicatorID
      + ',@CommunicatorPhone=''' + Trim(edtPhone.Text)
      + ''',@CommunicatorFax=''' + Trim(edtFax.Text)
      + ''',@CommunicatorMail=''' + Trim(edtMail.Text)
      + ''',@CommunicatorCode=''' + Trim(edtCommunicatorCode.Text)
      + ''',@LoginID=' + VarToStr(dbcbbDisplayName.value)
      + ',@IsValid=' + IntToStr(IsValid));
    result := true;
  except
    result := false;
  end;
end;

procedure TfrmCommunicatorCustomer.bitBtnSaveClick(Sender: TObject);
begin
  if SaveCommunicatorCustomer then
    application.messagebox('Save customer for this sales success!', 'Prompt!')
  else
    application.messagebox('Save failed!', 'Prompt!');
end;

function TfrmCommunicatorCustomer.SaveCommunicatorCustomer: boolean;
var
  Query: TADOQuery;
  i: integer;
begin
  Query := TADOQuery.Create(self);
  Query.Connection := dm.ADOConnection1;
  try
    dm.ADOConnection1.BeginTrans;
    Query.SQL.Clear;
    Query.SQL.Text := 'delete from CommunicatorCustomer where CommunicatorID=:LID';
    Query.Parameters.ParamByName('LID').Value := CommunicatorID;
    Query.ExecSQL;
    for i := 0 to ListView1.Items.Count - 1 do
      if ListView1.Items.Item[i].Checked then
      begin
        Query.SQL.Clear;
        Query.SQL.Text := 'insert into CommunicatorCustomer (CommunicatorID,CustomerID) values (:LID,:id)';
        Query.Parameters.ParamByName('LID').Value := CommunicatorID;
        Query.Parameters.ParamByName('id').Value := trim(ListView1.Items.Item[i].Caption);
        Query.ExecSQL;
      end;
    dm.ADOConnection1.CommitTrans;
    result := true;
  except
    dm.ADOConnection1.RollbackTrans;
    result := false;
  end;
  Query.Close;
  Query.Free;
end;

procedure TfrmCommunicatorCustomer.CheckBox1Click(Sender: TObject);
var
  i: integer;
begin
  if CheckBox1.Checked then
  begin
    for i := 0 to listview1.Items.Count - 1 do
    begin
      listview1.Items.Item[i].Checked := true;
    end;
  end
  else
  begin
    for i := 0 to listview1.Items.Count - 1 do
    begin
      listview1.Items.Item[i].Checked := False;
    end;
  end;
end;

procedure TfrmCommunicatorCustomer.bitBtnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCommunicatorCustomer.PageControl1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
  if ListView1.Items.Count = 0 then
    GetCustomerList;
end;

end.
