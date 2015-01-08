unit ufrmEdtShippingSchedule;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmBasic, ExtCtrls, DBCtrls, DBCtrlsEh, StdCtrls, Mask, DB, ADODB;

type
  TfrmEdtShippingSchedule = class(TfrmBasic)
    gboxCOBasicInfor: TGroupBox;
    Label4: TLabel;
    LabelPrice: TLabel;
    Label7: TLabel;
    Label6: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    LabelTotalAmount: TLabel;
    Label23: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText5: TDBText;
    DBText6: TDBText;
    DBText7: TDBText;
    DBText8: TDBText;
    DBText9: TDBText;
    DBText10: TDBText;
    DBText12: TDBText;
    DBText13: TDBText;
    DBText14: TDBText;
    DBText15: TDBText;
    dbtxtCOQty: TDBText;
    gboxLogisticOut: TGroupBox;
    Label43: TLabel;
    Label48: TLabel;
    Label44: TLabel;
    Label47: TLabel;
    Label42: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    DBEditEh17: TDBEditEh;
    DBEditEh20: TDBEditEh;
    DBDateTimeEditEh16: TDBDateTimeEditEh;
    DBDateTimeEditEh19: TDBDateTimeEditEh;
    DBDateTimeEditEh20: TDBDateTimeEditEh;
    DBDateTimeEditEh21: TDBDateTimeEditEh;
    dbcbbIncoterms: TDBComboBoxEh;
    ds_active: TDataSource;
    DBText4: TDBText;
    Label28: TLabel;
    dbcbbPackingList: TDBComboBoxEh;
    Label12: TLabel;
    DBEditEh1: TDBEditEh;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    Label13: TLabel;
    Panel1: TPanel;
    DBNavigator1: TDBNavigator;
    Label58: TLabel;
    dbedtCustomerOrderID: TDBEditEh;
    Label11: TLabel;
    dbedtTradingOrderID: TDBEditEh;
    Label60: TLabel;
    dbedtScheduleStatus: TDBEditEh;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure adt_fromBeforePost(DataSet: TDataSet);
    procedure adt_fromAfterPost(DataSet: TDataSet);
  protected
    procedure InitializeForm; override;
    procedure DestoryForm; override;
    procedure SetData; override;
    procedure SetUI; override;
    procedure SetAccess; override;
  public
    { Public declarations }
    class procedure EdtFromList(adt_from: TADODataSet);
  end;

implementation

{$R *.dfm}

{ TfrmBasic1 }

procedure TfrmEdtShippingSchedule.InitializeForm;
begin
  inherited;

end;

procedure TfrmEdtShippingSchedule.DestoryForm;
begin
  inherited;

end;

procedure TfrmEdtShippingSchedule.SetData;
begin
  inherited;

end;

procedure TfrmEdtShippingSchedule.SetUI;
begin
  inherited;

end;

procedure TfrmEdtShippingSchedule.SetAccess;
begin
  inherited;

end;

class procedure TfrmEdtShippingSchedule.EdtFromList(adt_from: TADODataSet);
begin
  with TfrmEdtShippingSchedule.Create(Application) do
  try
    ds_active.DataSet := adt_from;    
    adt_from.BeforePost := adt_fromBeforePost;
    adt_from.AfterPost := adt_fromAfterPost;
    if (adt_from.State in [dsEdit]) then
      adt_from.Cancel;

    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmEdtShippingSchedule.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if (ds_active.DataSet.State in [dsEdit]) then
  begin
    if MessageDlg('Is update Schedule?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      ds_active.DataSet.Post
    else
      ds_active.DataSet.Cancel;
  end;
end;

procedure TfrmEdtShippingSchedule.adt_fromBeforePost(DataSet: TDataSet);
begin
  DataSet.FieldByName('UpdateTime').Value := now();
end;

procedure TfrmEdtShippingSchedule.adt_fromAfterPost(DataSet: TDataSet);
begin
  TADODataSet(DataSet).UpdateBatch();
end;

end.

