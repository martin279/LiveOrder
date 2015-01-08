unit uGenerateNote;

interface

uses SysUtils, DBCtrls, Controls, Classes, Variants,
  ADODB, Dialogs, Forms, WordXP, OleServer, IniFiles, math;

type
  TGenerateNote = class
    WordDocument1: TWordDocument;
    WordApplication1: TWordApplication;
    WordFont1: TWordFont;
  public
    constructor Create; virtual;
    destructor Destroy; override;
    procedure GenerateNote(coID, customernumber, customername, modelInvolved, etd: string);
  end;


implementation

uses DataModule;

{ TGenerateNote }

constructor TGenerateNote.Create;
begin
  WordApplication1 := TWordApplication.Create(nil);
  WordDocument1 := TWordDocument.Create(nil);
end;

destructor TGenerateNote.Destroy;
begin
  WordDocument1.Free;
  WordApplication1.Free;
  inherited;
end;

procedure TGenerateNote.GenerateNote(coID, customernumber, customername, ModelInvolved, etd: string);
var
  a, b, c, d, e: OleVariant;
  Template, NewTemplate, DocumentType, isVisible, ItemIndex: OleVariant;
  CustomerQty: string;
  adt1: TADODataSet;
  FileName, Format: OleVariant;
begin
  adt1 := TADODataSet.Create(nil);
  DM.DataSetQuery(adt1, 'select customernumber,sum(customerorderquantity) as orderqty'
    + ' from ViewCustomerOrder where CustomerOrderID in ' + COID + ' and customerNumber=''' + customernumber + ''' group by customernumber');
  CustomerQty := adt1.fieldbyname('orderqty').AsString;

  try
    try
      WordApplication1.Connect;
    except
      Beep;
      MessageDlg('无法连接，没有安装Word', mtError, [mbOK], 0);
      Abort;
    end;

    WordApplication1.Visible := true;
    Template := ExtractFilePath(application.ExeName) + 'FormTemplate\ValveCoilDeliveryNote.dot'; //'FormTemplate\OASuzhou.dot';
    NewTemplate := False;
    DocumentType := wdNewBlankDocument;
    isVisible := true;
    WordApplication1.Documents.Add(Template, NewTemplate, DocumentType, isVisible);
    itemIndex := 1;
    WordDocument1.ConnectTo(WordApplication1.Documents.Item(itemIndex));

    a := 'mCustomerCode';
    b := 'mCustomerName';
    c := 'mCustomerOrderQty';
    d := 'mETD';
    e := 'mPartNumber';
    WordDocument1.Bookmarks.Item(a).Range.Text := CustomerNumber;
    WordDocument1.Bookmarks.Item(b).Range.Text := CustomerName;
    WordDocument1.Bookmarks.Item(c).Range.Text := CustomerQty;
    WordDocument1.Bookmarks.Item(d).Range.Text := ETD;
    WordDocument1.Bookmarks.Item(e).Range.Text := ModelInvolved;

    Format := wdFormatRTF;
    if DeliveryNotePath = '' then
      DeliveryNotePath := ExtractFilePath(application.ExeName);
    FileName := DeliveryNotePath + customernumber + 'DeliveryNote.doc';
    WordDocument1.SaveAs(FileName, Format);
    WordDocument1.Close;
    WordApplication1.Disconnect;
  except on E: Exception do
    begin
      ShowMessage(E.Message);
      WordApplication1.Disconnect;
    end;
  end;
  adt1.Free;
end;

end.

