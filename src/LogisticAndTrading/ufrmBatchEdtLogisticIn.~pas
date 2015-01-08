unit ufrmBatchEdtLogisticIn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmBasic, StdCtrls, ComCtrls, ADODB,
  uDMEntity, uDMManager, Mask, DBCtrlsEh, wwdbedit, Wwdbspin;

type
  TfrmBatchEdtLogisticIn = class(TfrmBasic)
    pageControl1: TPageControl;
    tbsLogisticIn: TTabSheet;
    tbsSellerInvoice: TTabSheet;
    gbox4: TGroupBox;
    edtInvoiceNumber: TEdit;
    chkInvoiceNum: TCheckBox;
    chkSellerInvoiceDate: TCheckBox;
    btnSave: TButton;
    gbox3: TGroupBox;
    chkDMMMonth: TCheckBox;
    chkSalesMonth: TCheckBox;
    dbedtDMMRemark: TDBEditEh;
    chkDMMRemark: TCheckBox;
    dbedtSalesMonth: TwwDBSpinEdit;
    dbedtDMMMonth: TwwDBSpinEdit;
    gbox2: TGroupBox;
    chkSortingDate: TCheckBox;
    dtpSortingDate: TDBDateTimeEditEh;
    gbox1: TGroupBox;
    edtReceivingQty: TEdit;
    edtSheetNumber: TEdit;
    chkImportSheetNo: TCheckBox;
    chkOriginPickupDate: TCheckBox;
    chkArrWHDate: TCheckBox;
    chkLogisticInRCED: TCheckBox;
    chkReceivingQty: TCheckBox;
    chkPOReceivingQty: TCheckBox;
    dtpArrWHDate: TDBDateTimeEditEh;
    dtpPickupDate: TDBDateTimeEditEh;
    dtpLogisticInRCED: TDBDateTimeEditEh;
    btnSaveSeller: TButton;
    dtpInvoiceDate: TDateTimePicker;
    procedure btnSaveClick(Sender: TObject);
    procedure chkPOReceivingQtyClick(Sender: TObject);
    procedure chkReceivingQtyClick(Sender: TObject);
    procedure btnSaveSellerClick(Sender: TObject);
  private
    { Private declarations }
    BatchTOID: WideString;
    BatchReceivingScheduleID: WideString;
    slParam: TStringList;
    objMgrBasic: TMgrBasicData;
    objMgrTO: TMgrTradingOrder;
  protected
    procedure InitializeForm; override;
    procedure DestoryForm; override;
    procedure SetData; override;
    procedure SetUI; override;
    procedure SetAccess; override;
  public
    { Public declarations }
    class procedure EdtFromList(SelectTOID, ReceivingScheduleID: string);
  end;

implementation

uses Math, uMJ, DataModule;

{$R *.dfm}

procedure TfrmBatchEdtLogisticIn.InitializeForm;
begin
  inherited;
  slParam := TStringList.Create;
  objMgrBasic := TMgrBasicData.Create;
  objMgrTO := TMgrTradingOrder.Create;
end;

procedure TfrmBatchEdtLogisticIn.DestoryForm;
begin
  inherited;
  slParam.Free;
  objMgrBasic.Free;
  objMgrTO.Free;
end;

procedure TfrmBatchEdtLogisticIn.SetData;
begin
  inherited;

end;

procedure TfrmBatchEdtLogisticIn.SetUI;
begin
  inherited;
  dtpPickupDate.Value := now;
  dtpArrWHDate.Value := now;
  dtpSortingDate.Value := now;
  dtpLogisticInRCED.Value := now;
end;

procedure TfrmBatchEdtLogisticIn.SetAccess;
begin
  inherited;
  if objCurUser.AccessLevel = 23 then
  begin
    gbox1.Enabled := false;
    gbox3.Enabled := false;
    PageControl1.ActivePage := tbsLogisticIn;
    tbsSellerInvoice.TabVisible := false;
  end
  else if objCurUser.AccessLevel = 17 then
  begin
    gbox2.Enabled := false;
    gbox3.Enabled := false;
    PageControl1.ActivePage := tbsLogisticIn;
    tbsSellerInvoice.TabVisible := false;
  end
  else if objCurUser.AccessLevel = 15 then
  begin
    gbox1.Enabled := false;
    gbox2.Enabled := false;
    PageControl1.ActivePage := tbsLogisticIn;
    tbsSellerInvoice.TabVisible := false;
  end
  else if objCurUser.AccessLevel = 16 then
  begin
    PageControl1.ActivePage := tbsSellerInvoice;
    tbsLogisticIn.TabVisible := false;
  end;
end;

class procedure TfrmBatchEdtLogisticIn.EdtFromList(SelectTOID, ReceivingScheduleID: string);
begin
  with TfrmBatchEdtLogisticIn.Create(Application) do
  try
    BatchTOID := SelectTOID;
    BatchReceivingScheduleID := ReceivingScheduleID;
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmBatchEdtLogisticIn.btnSaveClick(Sender: TObject);
var
  i: integer;
  sl2: TStringList;
  adt1: TADODataSet;
begin
  inherited;
  if chkSortingDate.Checked then
  begin
    slParam.Clear;
    if VarToStr(dtpSortingDate.Value) = '' then
      slParam.Append('SortingDate=')
    else
      slParam.Append('SortingDate=' + FormatDateTime('YYYY-mm-dd', dtpSortingDate.Value));
    slParam.Append('BatchTradingOrderID=' + BatchTOID);
  {  slParam.Append('Col=BatchTradingOrderID'); }
    slParam.Append('BatchReceivingScheduleID=' + BatchReceivingScheduleID);
    objMgrTO.UpdateTradingOrderReceivingSchedule(slParam);
  end
  else
  begin
    if (chkReceivingQty.Checked) and (Trim(edtReceivingQty.Text) = '') then
    begin
      ShowMessage('Please input receiving quantity.');
      Exit;
    end;
    adt1 := TADODataSet.Create(nil);
    try
      slParam.Clear;
      if chkReceivingQty.Checked then
        slParam.Append('ReceivingQuantity=' + Trim(edtReceivingQty.Text));
      if chkImportSheetNo.Checked then
        slParam.Append('ImportSheetNo=' + Trim(edtSheetNumber.Text));
      if chkOriginPickupDate.Checked then
        if VarToStr(dtpPickupDate.Value) = '' then
          slParam.Append('OriginPickupDate=')
        else
          slParam.Append('OriginPickupDate=' + FormatDateTime('YYYY-mm-dd', dtpPickupDate.Value));
      if chkArrWHDate.Checked then
        if VarToStr(dtpArrWHDate.Value) = '' then
          slParam.Append('ActArriveWarehouseDate=')
        else
          slParam.Append('ActArriveWarehouseDate=' + FormatDateTime('YYYY-mm-dd', dtpArrWHDate.Value));
      if chkSortingDate.Checked then
        if VarToStr(dtpSortingDate.Value) = '' then
          slParam.Append('SortingDate=')
        else
          slParam.Append('SortingDate=' + FormatDateTime('YYYY-mm-dd', dtpSortingDate.Value));
      if chkLogisticInRCED.Checked then
        if VarToStr(dtpLogisticInRCED.Value) = '' then
          slParam.Append('LogisticInRCED=')
        else
          slParam.Append('LogisticInRCED=' + FormatDateTime('YYYY-mm-dd', dtpLogisticInRCED.Value));

      if (slParam.Count > 0) or (chkPOReceivingQty.Checked) then
      begin
        //sl := TStringList.Create;
        sl2 := TStringList.Create;
        try
          //sl.CommaText := BatchTOID;
          sl2.CommaText := BatchReceivingScheduleID;
          for i := 0 to sl2.Count - 1 do
          begin
            if chkPOReceivingQty.Checked then
            begin
              DM.DataSetQuery(adt1, 'select SellerBuyerPOQuantity from TradingOrder '
                + ' where TradingOrderID in (select distinct TradingOrderID from TradingOrderReceivingSchedule'
                + ' where ReceivingScheduleID in (' + sl2[i] + '))');
              if not VarIsNull(adt1.FieldByName('SellerBuyerPOQuantity').CurValue) then
                slParam.Values['ReceivingQuantity'] := adt1.FieldByName('SellerBuyerPOQuantity').AsString;
            end;
            //slParam.Values['TradingOrderID'] := sl[i];
            slParam.Values['ReceivingScheduleID'] := sl2[i];
         {   slParam.Values['IsNewRS'] := '0';
            DM.DataSetQuery(adt1, 'select count(*) as acount from TradingOrderReceivingSchedule where TradingOrderID=' + sl[i]);
            if adt1.FieldByName('acount').AsInteger > 0 then
            begin
             // if MessageDlg('Receving Schedule is exitss, select Yes is Update, select No is Add a new record?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
              slParam.Values['IsNewRS'] := '1'
             // else
             //   slParam.Values['IsNewRS'] := '0';
            end;          }
            objMgrTO.CreateReceivingSchedule(slParam);
          end;
        finally
          //sl.Free;
          sl2.Free;
        end;
      end;

      slParam.Clear;
      if chkSalesMonth.Checked then
        slParam.Append('DemandManagingSalesMonth=' + Trim(dbedtSalesMonth.Text));
      if chkDMMMonth.Checked then
        slParam.Append('DemandManagingDMMMonth=' + Trim(dbedtDMMMonth.Text));
      if chkDMMRemark.Checked then
        slParam.Append('DemandManagingDMMRemark=' + Trim(dbedtDMMRemark.Text));

      if slParam.Count > 0 then
      begin
        slParam.Append('BatchTradingOrderID=' + BatchTOID);
        slParam.Append('Col=BatchTradingOrderID');
        DM.DataSetSPModify('usp_UpdateTradingOrder', slParam);
      end;

      if (chkOriginPickupDate.Checked)
        or (chkArrWHDate.Checked)
        or (chkLogisticInRCED.Checked)
        or (chkImportSheetNo.Checked) then
        DM.DataSetModify('Update TradingOrder set TradingOrderStatusID=4 '
          + ' where TradingOrderStatusID<4 and TradingOrderID in (' + BatchTOID + ')');
    finally
      adt1.Free;
    end;
  end;
  Close;
end;

procedure TfrmBatchEdtLogisticIn.chkPOReceivingQtyClick(Sender: TObject);
begin
  inherited;
  if chkReceivingQty.Checked then
    chkReceivingQty.Checked := false;
end;

procedure TfrmBatchEdtLogisticIn.chkReceivingQtyClick(Sender: TObject);
begin
  inherited;
  if chkPOReceivingQty.Checked then
    chkPOReceivingQty.Checked := false;
end;

procedure TfrmBatchEdtLogisticIn.btnSaveSellerClick(Sender: TObject);
var
  i: integer;
  sl2: TStringList;
begin
  inherited;
  if (chkSellerInvoiceDate.Checked) and (chkInvoiceNum.Checked) then
  begin
    sl2 := TStringList.Create;
    try
      sl2.CommaText := BatchReceivingScheduleID;
      for i := 0 to sl2.Count - 1 do
      begin
        DM.DataSetModify('insert into TradingOrderSellerInvoice(ReceivingScheduleID,SellerInvoiceNumber,SellerInvoiceDate,UpdateTime) '
          + ' values(' + sl2[i] + ',''' + Trim(edtInvoiceNumber.Text) + ''','''
          + FormatDateTime('YYYY-mm-dd', dtpInvoiceDate.DateTime) + ''',getdate())');
      end;
    finally
      Close;
    end;
  end
  else
    ShowMessage('please input invoice number and date.');
end;

end.

