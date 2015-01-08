unit ufrmSelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GridsEh, DBGridEh, ExtCtrls, DBCtrls, StdCtrls, DB, ADODB;

type
  TfrmSelect = class(TForm)
    ds_select: TDataSource;
    Panel1: TPanel;
    DBNavigator1: TDBNavigator;
    Panel2: TPanel;
    gridSelect: TDBGridEh;
    Panel3: TPanel;
    btnClose: TButton;
    btnSelect: TButton;
    procedure gridSelectDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class function SelectFromList(adt_from: TADODataSet;
      out Rst: Variant): Boolean;
  end;


implementation

uses DataModule;

{$R *.dfm}

procedure TfrmSelect.gridSelectDblClick(Sender: TObject);
begin
  //ModalResult := mrOk;
end;

class function TfrmSelect.SelectFromList(adt_from: TADODataSet;
  out Rst: Variant): Boolean;
var
  ResArray: array of array of string;
  i, arrayLen: integer;
  fieldName: string;
begin
  arrayLen := adt_from.Fields.Count;
  Rst := Null;
  with TfrmSelect.Create(Application) do
  try
    ds_select.DataSet := adt_from;
    ds_select.DataSet.Active := True;
    for i := 0 to arrayLen - 1 do
    begin
      gridSelect.Columns[i].Width := 100;
      gridSelect.Columns[i].Title.TitleButton := True;
      gridSelect.Columns[i].STFilter.ListSource := ds_select;
      gridSelect.Columns[i].STFilter.ListField := adt_from.Fields[i].FieldName;
      gridSelect.Columns[i].STFilter.KeyField := adt_from.Fields[i].FieldName;
      gridSelect.Columns[i].STFilter.DataField := adt_from.Fields[i].FieldName;
    end;
    Result := ShowModal = mrOk;
    if Result then
    begin
      SetLength(ResArray, 2, arrayLen);
      for i := 0 to arrayLen - 1 do
      begin
        fieldName := adt_from.Fields[i].FieldName;
        ResArray[0][i] := fieldName;
        ResArray[1][i] := adt_from.fieldbyname(fieldName).AsString;
      end;
      Rst := ResArray;
    end;
  finally
    Free;
  end;
end;

{
class function TfrmSelect.SelectFromList(adt_from: TADODataSet;
  out Rst: Variant): Boolean;
var
  ResArray: array of string;
  i, arrayLen: integer;
begin
  arrayLen := adt_from.Fields.Count;
  Rst := Null;
  with TfrmSelect.Create(Application) do
  try
    ds_select.DataSet := adt_from;
    ds_select.DataSet.Active := True;
    Result := ShowModal = mrOk;
    if Result then
    begin
      SetLength(ResArray, arrayLen);
      ResArray[0] := 'a';
      ResArray[1] := 'b';
      Rst := ResArray;
    end;
  finally
    Free;
  end;
end;
 }
end.

