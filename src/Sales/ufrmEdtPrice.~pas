unit ufrmEdtPrice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmBasic, ActnList, ImgList, ComCtrls, ToolWin, ExtCtrls, DB,
  ADODB, DBGridEh, StdCtrls, Mask, DBCtrlsEh, DBLookupEh, DBCtrls;

type
  TfrmEdtPrice = class(TfrmBasic)
    ImageList2: TImageList;
    ActionList2: TActionList;
    Action1: TAction;
    gboxBasicInfo: TGroupBox;
    Label4: TLabel;
    Label7: TLabel;
    Label6: TLabel;
    dbcbbModel: TDBLookupComboboxEh;
    dbcbbCustomer: TDBLookupComboboxEh;
    gboxDetailInfo: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label16: TLabel;
    Label13: TLabel;
    Label5: TLabel;
    dbcbbPaymentTerms: TDBLookupComboboxEh;
    dbcbbPriceTerms: TDBLookupComboboxEh;
    adt_customer: TADODataSet;
    ds_customer: TDataSource;
    adt_model: TADODataSet;
    ds_model: TDataSource;
    adt_paymentterms: TADODataSet;
    adt_priceterms: TADODataSet;
    ds_paymentterms: TDataSource;
    ds_priceterms: TDataSource;
    dbedtDemandQuantity: TDBEditEh;
    dbedtRemark: TDBEditEh;
    dbedtPrice: TDBEditEh;
    ds_active: TDataSource;
    dbdtpEffectDate: TDBDateTimeEditEh;
    Label10: TLabel;
    dbedtPriceId: TDBEditEh;
    dbcbbCurrency: TDBComboBox;
    DBNavigator1: TDBNavigator;
    procedure adt_fromBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  protected
    procedure SetData; override;
    procedure SetUI; override;
    procedure SetAccess; override;
  public
    { Public declarations }
    class procedure EdtFromList(adt_from: TADODataSet);
  end;


implementation

uses DataModule, uMJ;

{$R *.dfm}

{ TfrmEdtPrice }

procedure TfrmEdtPrice.SetData;
begin
  DM.DataSetQuery(adt_customer, 'Select * from Customer');
  DM.DataSetQuery(adt_model, 'Select * from Model');
  DM.DataSetQuery(adt_paymentterms, 'select * from PaymentTerms');
  DM.DataSetQuery(adt_priceterms, 'select * from PriceTerms');
end;

procedure TfrmEdtPrice.SetUI;
begin
  inherited;
  dbcbbCustomer.Enabled := false;
  dbcbbModel.Enabled := false;
  dbcbbCustomer.Color := clBtnFace;
  dbcbbModel.Color := clBtnFace;
end;

procedure TfrmEdtPrice.SetAccess;
begin
  inherited;
  DBNavigator1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast]
    + [nbPost, nbCancel];
end;

class procedure TfrmEdtPrice.EdtFromList(adt_from: TADODataSet);
begin
  with TfrmEdtPrice.Create(Application) do
  try
    ds_active.DataSet := adt_from;
    adt_from.BeforePost := adt_fromBeforePost;
    if (adt_from.State in [dsEdit]) then
      adt_from.Cancel;
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmEdtPrice.adt_fromBeforePost(DataSet: TDataSet);
var
  sqlUSP, PaymentTermsID, PriceTermsID, EffectDate: string;
begin
  if VarToStr(DataSet.FieldByName('PaymentTermsID').Value) = '' then
  begin
    ShowMessage('Please input Payment Terms.');
    Abort;
  end;
  if VarToStr(DataSet.FieldByName('PriceTermsID').Value) = '' then
  begin
    ShowMessage('Please input Price Terms.');
    Abort;
  end;
  if VarToStr(DataSet.FieldByName('EffectDate').Value) = '' then
  begin
    ShowMessage('Please input Effect Date.');
    Abort;
  end;
  if VarToStr(DataSet.FieldByName('PaymentTermsID').OldValue) = '' then
    PaymentTermsID := VarToStr(DataSet.FieldByName('PaymentTermsID').Value)
  else
    PaymentTermsID := VarToStr(DataSet.FieldByName('PaymentTermsID').OldValue);
  if VarToStr(DataSet.FieldByName('PriceTermsID').OldValue) = '' then
    PriceTermsID := VarToStr(DataSet.FieldByName('PriceTermsID').Value)
  else
    PriceTermsID := VarToStr(DataSet.FieldByName('PriceTermsID').OldValue);
  if VarToStr(DataSet.FieldByName('EffectDate').OldValue) = '' then
    EffectDate := VarToStr(DataSet.FieldByName('EffectDate').Value)
  else
    EffectDate := VarToStr(DataSet.FieldByName('EffectDate').OldValue);
  sqlUSP := '';
  if ((DataSet.FieldByName('DemandQuantity').OldValue <> DataSet.FieldByName('DemandQuantity').Value)
    or (DataSet.FieldByName('Currency').OldValue <> DataSet.FieldByName('Currency').Value)
    or (VarToStr(DataSet.FieldByName('Price').OldValue) <> VarToStr(DataSet.FieldByName('Price').Value))
    or (DataSet.FieldByName('PaymentTermsID').OldValue <> DataSet.FieldByName('PaymentTermsID').Value)
    or (DataSet.FieldByName('PriceTermsID').OldValue <> DataSet.FieldByName('PriceTermsID').Value)) then
    sqlUSP := sqlUSP + ' EXEC usp_InsertPriceChangeLog '
      + ' @PriceID=''' + VarToStr(dbedtPriceId.Value) + ''''
      + ',@DemandQuantity=' + VarToStr(DataSet.FieldByName('DemandQuantity').OldValue)
      + ',@Currency=''' + VarToStr(DataSet.FieldByName('Currency').OldValue) + ''''
      + ',@Price=''' + VarToStr(DataSet.FieldByName('Price').OldValue) + ''''
      + ',@PaymentTermsID=''' + PaymentTermsID + ''''
      + ',@PriceTermsID=''' + PriceTermsID + ''''
      + ',@EffectDate=''' + EffectDate + ''''
      + ',@Remark=''' + VarToStr(DataSet.FieldByName('Remark').OldValue) + '''';
  if sqlUSP <> '' then
  begin
    DM.DataSetModify(sqlUSP);
  end;
  DataSet.FieldByName('UpdateTime').Value := now();
end;

end.

