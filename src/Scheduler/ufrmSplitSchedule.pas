unit ufrmSplitSchedule;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmBasic, ActnList, ImgList, ComCtrls, ToolWin, ExtCtrls,
  StdCtrls, Buttons, DBCtrlsEh, Mask, ADODB, DB;

type
  TfrmSplitSchedule = class(TfrmBasic)
    Label10: TLabel;
    dbedtCustomerOrderID: TDBEditEh;
    gboxOrderInfo: TGroupBox;
    Label8: TLabel;
    Label6: TLabel;
    Label16: TLabel;
    dbedtOrderNumber: TDBEditEh;
    dbedtOrderQty: TDBEditEh;
    dbdtpRTD: TDBDateTimeEditEh;
    gboxNewScheduleInfo: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    edtScheduleQty: TEdit;
    dtpScheduleDate: TDateTimePicker;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    gboxOriginalScheduleInfo: TGroupBox;
    Label1: TLabel;
    Label4: TLabel;
    dbedtScheduleQty: TDBEditEh;
    dbdtpScheduleDate: TDBDateTimeEditEh;
    ds_active: TDataSource;
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure SetData; override;
    procedure SetUI; override;
    procedure SetAccess; override;
  public
    { Public declarations }
    class function EdtFromList(adt_from: TADODataSet): Boolean;
  end;


implementation

uses DataModule;

{$R *.dfm}

{ TfrmSplitSchedule }

procedure TfrmSplitSchedule.SetData;
begin
  inherited;

end;

procedure TfrmSplitSchedule.SetUI;
begin
  inherited;
  Position := poOwnerFormCenter;
  dbedtCustomerOrderID.Enabled := false;
  gboxOrderInfo.Enabled := false;
  gboxOriginalScheduleInfo.Enabled := false;
end;

procedure TfrmSplitSchedule.SetAccess;
begin
  inherited;

end;

class function TfrmSplitSchedule.EdtFromList(
  adt_from: TADODataSet): Boolean;
begin
  with TfrmSplitSchedule.Create(Application) do
  try
    ds_active.DataSet := adt_from;
    if (ds_active.DataSet.fieldbyname('ScheduleStartTime').AsString <> '') then
      dtpScheduleDate.DateTime := ds_active.DataSet.fieldbyname('ScheduleStartTime').AsDateTime + 1;
    result := ShowModal = mrOk;
  finally
    Free;
  end;
end;

procedure TfrmSplitSchedule.btnOKClick(Sender: TObject);
var
  ScheduleQuantity, newScheduleQuantity: integer;
  ProductionScheduleID, scheduleDate: string;
begin
  ProductionScheduleID := ds_active.DataSet.FieldByName('ProductionScheduleID').AsString;
  ScheduleQuantity := ds_active.DataSet.FieldByName('ScheduleQuantity').AsInteger;
  if Trim(edtScheduleQty.Text) = '' then
  begin
    ShowMessage('Please input new schedule qty.');
    ModalResult := mrNone;
    Exit;
  end
  else if Trim(edtScheduleQty.Text) = '0' then
  begin
    ShowMessage('Schedule qty. can''t be 0.');
    ModalResult := mrNone;
    Exit;
  end
  else if Trim(edtScheduleQty.Text) = FloatToStr(ScheduleQuantity) then
  begin
    ShowMessage('Schedule qty. can''t same to original schedule qty.');
    ModalResult := mrNone;
    Exit;
  end
  else if StrToFloat(Trim(edtScheduleQty.Text)) > ScheduleQuantity then
  begin
    ShowMessage('New schedule qty. can''t greater than original schedule qty.');
    ModalResult := mrNone;
    Exit;
  end
  else if (FormatDateTime('YYYY-mm-dd', dtpScheduleDate.DateTime)
    = FormatDateTime('YYYY-mm-dd', dbdtpScheduleDate.DataSource.DataSet.fieldbyname('ScheduleStartTime').AsDateTime)) then
  begin
    ShowMessage('Schedule date can''t same to original schedule date.');
    ModalResult := mrNone;
    Exit;
  end;
  newScheduleQuantity := StrToInt(Trim(edtScheduleQty.Text));
  scheduleDate := FormatDateTime('YYYY-mm-dd', dtpScheduleDate.DateTime);
  DM.DataSetModify('EXEC usp_InsertProductionScheduleCUDSplit '
    + ' @ProductionScheduleID=' + ProductionScheduleID
    + ',@NewScheduleQuantity=' + IntToStr(newScheduleQuantity)
    + ',@ScheduleQuantity=' + IntToStr(ScheduleQuantity - newScheduleQuantity)
    + ',@ScheduleStartTime=''' + scheduleDate + '''');
end;


 {
  sqlInsertSchedule := Format(sInsertScheduleCUDSplitSQL,
    [newScheduleQuantity, scheduleDate, ProductionScheduleID]);
  sqlUpdateSchedule := Format(sUpdateScheduleCUDSplitSQL,
    [ScheduleQuantity - newScheduleQuantity, ProductionScheduleID]);
  DM.DataSetModify(sqlInsertSchedule + sqlUpdateSchedule);  }

end.

