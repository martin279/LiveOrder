unit ufrmCustomer1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmDBBasicPrn, PropFilerEh, DB, ADODB, PrnDbgeh, Menus,
  PropStorageEh, ActnList, ImgList, GridsEh, DBGridEh, PrViewEh, StdCtrls,
  DBCtrls, ComCtrls, ToolWin, ExtCtrls;

type
  TfrmCustomer1 = class(TfrmDBBasicPrn)
    adt_activeCustomerID: TAutoIncField;
    adt_activeCustomerNumber: TStringField;
    adt_activeCustomerName: TStringField;
    adt_activeFullName: TStringField;
    adt_activeChineseName: TStringField;
    adt_activeCountry: TStringField;
    adt_activeContactPerson: TStringField;
    adt_activeTelephone: TStringField;
    adt_activeFax: TStringField;
    adt_activeCellPhone: TStringField;
    adt_activeEmail: TStringField;
    adt_plant: TADODataSet;
    adt_activePlantID: TIntegerField;
    adt_activePlantCode: TStringField;
    adt_activePlantCode2: TStringField;
    adt_activeIsValid: TBooleanField;
    adt_activeCreatorLoginID: TIntegerField;
    adt_activeDisplayName: TStringField;
    adt_activeCreateTime: TDateTimeField;
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

uses DataModule, uSQLConsts, uMJ, ufrmDBBasic;

{$R *.dfm}

{ TfrmCustomer }

procedure TfrmCustomer1.SetData;
var
  sqlConst: string;
begin
  DM.DataSetQuery(adt_plant, format(sQueryPlantSQL, ['']));
  sqlConst := '';
  case CurUserLevel of
    2:
      begin
        sqlConst := ' and c.CustomerID in'
          + ' (select cc.CustomerID from CommunicatorCustomer cc'
          + ' left outer join Communicator r ON cc.CommunicatorID = r.CommunicatorID'
          + ' where r.LoginID=' + IntToStr(CurLoginID) + ')';
      end;
    8:
      sqlConst := ' and c.CustomerID in'
        + ' (select sc.CustomerID from SalesCustomer sc'
        + ' left outer join Sales s ON sc.SalesID = s.SalesID'
        + ' where s.LoginID=' + IntToStr(CurLoginID) + ')';
    11:
      sqlConst := ' and c.CustomerID in'
        + ' (select sc.CustomerID from SalesCustomer sc'
        + ' left outer join Sales s ON sc.SalesID = s.SalesID'
        + ' where s.LoginID=' + IntToStr(CurLoginID) + ')';
  end;
  sqlConst := sqlConst + ' and c.PlantID in' + CurUserPlantID;
  DM.DataSetQuery(adt_active, format(sQueryCustomerSQL, [sqlConst]));
end;

procedure TfrmCustomer1.SetUI;
begin
  inherited;
  gridData.FrozenCols := 4;
end;

procedure TfrmCustomer1.SetAccess;
begin
  inherited;
  case CurUserLevel of
    1:
      begin
        DBNavigator1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
          + [nbInsert, nbPost, nbEdit, nbCancel];
        gridData.ReadOnly := false;
      end;
    2:
      begin
        DBNavigator1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
          + [nbInsert, nbPost, nbEdit, nbCancel];
        gridData.ReadOnly := false;
      end;
    10:
      begin
        DBNavigator1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
          + [nbInsert, nbPost, nbEdit, nbCancel];
        gridData.ReadOnly := false;
      end;
  end;
end;

end.

