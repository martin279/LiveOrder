unit ufrmModelFamily;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmDBBasicPrn, PropFilerEh, DB, ADODB, PrnDbgeh, Menus,
  PropStorageEh, ActnList, ImgList, GridsEh, DBGridEh, PrViewEh, StdCtrls,
  ComCtrls, DBCtrls, ToolWin, ExtCtrls;

type
  TfrmModelFamily = class(TfrmDBBasicPrn)
    adt_activeProductFamilyName: TStringField;
    adt_activeModel: TStringField;
    adt_activeModelID: TIntegerField;
    adt_activeProductFamilyID: TIntegerField;
    adt_model: TADODataSet;
    adt_family: TADODataSet;
    adt_activeModel1: TStringField;
    adt_activeProductFamilyName1: TStringField;
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

uses DataModule, uMJ;

{$R *.dfm}

{ TfrmModelFamily }

procedure TfrmModelFamily.SetData;
begin
  DM.DataSetQuery(adt_active, 'EXEC usp_GetModelFamily'); 
  DM.DataSetQuery(adt_family, 'select * from ProductFamily');
  DM.DataSetQuery(adt_model, 'select * from Model');
end;

procedure TfrmModelFamily.SetUI;
begin
  inherited;

end;

procedure TfrmModelFamily.SetAccess;
begin
  inherited;
  case gVars.CurUserLevel of
    2:
      begin
        DBNavigator1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
          + [nbInsert, nbPost, nbEdit, nbDelete, nbCancel];
        gridData.ReadOnly := false;
      end;
    3:
      begin
        DBNavigator1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
          + [nbInsert, nbPost, nbEdit, nbCancel];
        gridData.ReadOnly := false;
      end;
  end;
end;

end.
