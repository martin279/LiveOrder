unit ufrmUserPlant;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ADODB;

type
  TfrmUserPlant = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    bitBtnClose: TBitBtn;
    edtLoginName: TEdit;
    edtDisplayName: TEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GroupBox4: TGroupBox;
    ListView1: TListView;
    CheckBox1: TCheckBox;
    GroupBox1: TGroupBox;
    ListView2: TListView;
    CheckBox2: TCheckBox;
    bitBtnSavePlant: TBitBtn;
    btnSaveApplication: TBitBtn;
    procedure CheckBox1Click(Sender: TObject);
    procedure bitBtnCloseClick(Sender: TObject);
    procedure bitBtnSavePlantClick(Sender: TObject);
    procedure btnSaveApplicationClick(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
  private
    { Private declarations }
    LoginID: string;
  public
    { Public declarations }
    procedure GetPlantList;
    function SaveUserPlant: boolean;
    procedure GetApplicationList;
    function SaveUserApplication: boolean;
    class procedure EdtFromList(adt_from: TADODataSet);
  end;

implementation

uses DataModule;

{$R *.dfm}

{ TForm1 }

class procedure TfrmUserPlant.EdtFromList(adt_from: TADODataSet);
begin
  with TfrmUserPlant.Create(Application) do
  try
    LoginID := adt_from.fieldbyname('LoginID').AsString;
    edtLoginName.Text := adt_from.fieldbyname('LoginName').AsString;
    edtDisplayName.Text := adt_from.fieldbyname('DisplayName').AsString;
    GetPlantList;
    GetApplicationList;
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmUserPlant.GetPlantList;

  procedure GetUserPlant;
  var
    i: integer;
  begin
    for i := 0 to ListView1.Items.Count - 1 do
    begin
      if dm.CCheckID('select 1 from LoginPlant where LoginID=' + LoginID
        + ' and PlantID=''' + trim(listview1.Items.Item[i].Caption) + '''') then
        ListView1.Items.Item[i].Checked := true;
    end;
  end;

var
  adt1: TADODataSet;
begin
  ListView1.Items.Clear;
  adt1 := TADODataSet.Create(nil);
  try
    DM.DataSetQuery(adt1, 'select PlantID,PlantCode from Plant order by PlantID');
    while not adt1.Eof do
    begin
      with ListView1.Items.Add do
      begin
        Caption := trim(adt1.fieldbyname('PlantID').AsString);
        SubItems.Add(adt1.fieldbyname('PlantCode').AsString);
      end;
      adt1.Next;
    end;
    GetUserPlant;
  finally
    adt1.Free;
  end;
end;

procedure TfrmUserPlant.GetApplicationList;

  procedure GetUserApplication;
  var
    i: integer;
  begin
    for i := 0 to ListView2.Items.Count - 1 do
    begin
      if dm.CCheckID('select 1 from LoginBusinessApplication where LoginID=' + LoginID
        + ' and BusinessApplicationID=''' + trim(ListView2.Items.Item[i].Caption) + '''') then
        ListView2.Items.Item[i].Checked := true;
    end;
  end;

var
  adt1: TADODataSet;
begin
  ListView2.Items.Clear;
  adt1 := TADODataSet.Create(nil);
  try
    DM.DataSetQuery(adt1, 'select BusinessApplicationID,BusinessApplicationName from BusinessApplication order by BusinessApplicationID');
    while not adt1.Eof do
    begin
      with ListView2.Items.Add do
      begin
        Caption := trim(adt1.fieldbyname('BusinessApplicationID').AsString);
        SubItems.Add(adt1.fieldbyname('BusinessApplicationName').AsString);
      end;
      adt1.Next;
    end;
    GetUserApplication;
  finally
    adt1.Free;
  end;
end;

function TfrmUserPlant.SaveUserPlant: boolean;
var
  Query: TADOQuery;
  i: integer;
begin
  Query := TADOQuery.Create(self);
  Query.Connection := dm.ADOConnection1;
  try
    dm.ADOConnection1.BeginTrans;
    Query.SQL.Clear;
    Query.SQL.Text := 'delete from LoginPlant where LoginID=:LID';
    Query.Parameters.ParamByName('LID').Value := LoginID;
    Query.ExecSQL;
    for i := 0 to ListView1.Items.Count - 1 do
      if ListView1.Items.Item[i].Checked then
      begin
        Query.SQL.Clear;
        Query.SQL.Text := 'insert into LoginPlant (LoginID,PlantID) values (:LID,:id)';
        Query.Parameters.ParamByName('LID').Value := LoginID;
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

function TfrmUserPlant.SaveUserApplication: boolean;
var
  Query: TADOQuery;
  i: integer;
begin
  Query := TADOQuery.Create(self);
  Query.Connection := dm.ADOConnection1;
  try
    dm.ADOConnection1.BeginTrans;
    Query.SQL.Clear;
    Query.SQL.Text := 'delete from LoginBusinessApplication where LoginID=:LID';
    Query.Parameters.ParamByName('LID').Value := LoginID;
    Query.ExecSQL;
    for i := 0 to ListView2.Items.Count - 1 do
      if ListView2.Items.Item[i].Checked then
      begin
        Query.SQL.Clear;
        Query.SQL.Text := 'insert into LoginBusinessApplication (LoginID,BusinessApplicationID) values (:LID,:id)';
        Query.Parameters.ParamByName('LID').Value := LoginID;
        Query.Parameters.ParamByName('id').Value := trim(ListView2.Items.Item[i].Caption);
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

procedure TfrmUserPlant.bitBtnSavePlantClick(Sender: TObject);
begin
  if SaveUserPlant then
    application.messagebox('Save plant for this user success!', 'Prompt!')
  else
    application.messagebox('Save failed!', 'Prompt!');
end;

procedure TfrmUserPlant.btnSaveApplicationClick(Sender: TObject);
begin
  if SaveUserApplication then
    application.messagebox('Save application for this user success!', 'Prompt!')
  else
    application.messagebox('Save failed!', 'Prompt!');
end;

procedure TfrmUserPlant.CheckBox1Click(Sender: TObject);
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

procedure TfrmUserPlant.CheckBox2Click(Sender: TObject);
var
  i: integer;
begin
  if CheckBox2.Checked then
  begin
    for i := 0 to listview2.Items.Count - 1 do
    begin
      listview2.Items.Item[i].Checked := true;
    end;
  end
  else
  begin
    for i := 0 to listview2.Items.Count - 1 do
    begin
      listview2.Items.Item[i].Checked := False;
    end;
  end;
end;

procedure TfrmUserPlant.bitBtnCloseClick(Sender: TObject);
begin
  Close;
end;


end.
