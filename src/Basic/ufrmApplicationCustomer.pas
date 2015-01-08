unit ufrmApplicationCustomer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, DB, ADODB, Mask, DBCtrlsEh;

type
  TfrmApplicationCustomer = class(TForm)
    Label1: TLabel;
    GroupBox4: TGroupBox;
    ListView1: TListView;
    bitBtnFinish: TBitBtn;
    bitBtnClose: TBitBtn;
    chkSelectAll: TCheckBox;
    ds_active: TDataSource;
    dbEdtCustomerName: TDBEditEh;
    Label2: TLabel;
    dbEdtCustomerNumber: TDBEditEh;
    procedure bitBtnFinishClick(Sender: TObject);
    procedure bitBtnCloseClick(Sender: TObject);
    procedure chkSelectAllClick(Sender: TObject);
  private
    { Private declarations }
    CustomerID: string;
  public
    { Public declarations }
    procedure GetApplicationList;
    function SaveCustomerApplication: boolean;
    class procedure EdtFromList(adt_from: TADODataSet);
  end;

implementation

uses DataModule;

{$R *.dfm}

{ TfrmApplicationCustomer }

class procedure TfrmApplicationCustomer.EdtFromList(adt_from: TADODataSet);
begin
  with TfrmApplicationCustomer.Create(Application) do
  try
    CustomerID := adt_from.fieldbyname('CustomerID').AsString;
    ds_active.DataSet := adt_from;
    GetApplicationList;
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmApplicationCustomer.GetApplicationList;

  procedure GetCustomerApplication;
  var
    i: integer;
  begin
    for i := 0 to ListView1.Items.Count - 1 do
    begin
      if dm.CCheckID('select 1 from BusinessApplicationCustomer where CustomerID=' + CustomerID
        + ' and BusinessApplicationID=''' + trim(listview1.Items.Item[i].Caption) + '''') then
        ListView1.Items.Item[i].Checked := true;
    end;
  end;

var
  adt1: TADODataSet;
begin
  ListView1.Items.Clear;
  adt1 := TADODataSet.Create(nil);
  try
    DM.DataSetQuery(adt1, 'select BusinessApplicationID,BusinessApplicationName from BusinessApplication');
    while not adt1.Eof do
    begin
      with ListView1.Items.Add do
      begin
        Caption := trim(adt1.fieldbyname('BusinessApplicationID').AsString);
        SubItems.Add(adt1.fieldbyname('BusinessApplicationName').AsString);
      end;
      adt1.Next;
    end;
    GetCustomerApplication;
  finally
    adt1.Free;
  end;
end;

function TfrmApplicationCustomer.SaveCustomerApplication: boolean;
var
  Query: TADOQuery;
  i: integer;
begin
  Query := TADOQuery.Create(self);
  Query.Connection := dm.ADOConnection1;
  try
    dm.ADOConnection1.BeginTrans;
    Query.SQL.Clear;
    Query.SQL.Text := 'delete from BusinessApplicationCustomer where CustomerID=:LID';
    Query.Parameters.ParamByName('LID').Value := CustomerID;
    Query.ExecSQL;
    for i := 0 to ListView1.Items.Count - 1 do
      if ListView1.Items.Item[i].Checked then
      begin
        Query.SQL.Clear;
        Query.SQL.Text := 'insert into BusinessApplicationCustomer (CustomerID,BusinessApplicationID) values (:LID,:id)';
        Query.Parameters.ParamByName('LID').Value := CustomerID;
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

procedure TfrmApplicationCustomer.bitBtnFinishClick(Sender: TObject);
begin
  if SaveCustomerApplication then
    application.messagebox('Assign application for this customer success!', 'Prompt!')
  else
    application.messagebox('Save failed!', 'Prompt!');
end;

procedure TfrmApplicationCustomer.bitBtnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmApplicationCustomer.chkSelectAllClick(Sender: TObject);
var
  i: integer;
begin
  if chkSelectAll.Checked then
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

end.
