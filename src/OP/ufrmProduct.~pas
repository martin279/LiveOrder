unit ufrmProduct;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmDBBasicDT, PropFilerEh, DB, ADODB, Menus, PropStorageEh,
  ActnList, ImgList, GridsEh, DBGridEh, StdCtrls, ExtCtrls, DBCtrls,
  ComCtrls, ToolWin, Mask, DBCtrlsEh, DBLookupEh, ACReportClass, Printers;

type
  TfrmProduct = class(TfrmDBBasicDT)
    Panel1: TPanel;
    btnQuery: TButton;
    edtProductSN: TEdit;
    chkProductSN: TCheckBox;
    chkComponentSN: TCheckBox;
    edtComponentSN: TEdit;
    chkCustomer: TCheckBox;
    chkOrderNumber: TCheckBox;
    edtCONumber: TEdit;
    dbcbbCustomer: TDBLookupComboboxEh;
    adt_customer: TADODataSet;
    ds_customer: TDataSource;
    ds_model: TDataSource;
    adt_model: TADODataSet;
    dbcbbModel: TDBLookupComboboxEh;
    chkModel: TCheckBox;
    chkWaCode: TCheckBox;
    edtWaCode: TEdit;
    chkProductionTime: TCheckBox;
    dtpProductionTimeFrom: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    dtpProductionTimeTo: TDateTimePicker;
    adt_active2ProductComponentTrackingID: TAutoIncField;
    adt_active2ProductTrackingID: TIntegerField;
    adt_active2ComponentID: TIntegerField;
    adt_active2ComponentSerialNumber: TStringField;
    adt_active2ComponentItem: TStringField;
    adt_active2ComponentSeriesID: TIntegerField;
    adt_active2ComponentSeriesName: TStringField;
    N2: TMenuItem;
    MenuPrtUnitPackge: TMenuItem;
    MenuPrtPackgeList: TMenuItem;
    MenuPrtOrderInfo: TMenuItem;
    AcrptUnitBox: TAcReport;
    AcrptUnitBoxEN: TAcReport;
    AcrptWcCN: TAcReport;
    AcrptWcEN: TAcReport;
    AcrptBoxOrderEN: TAcReport;
    AcrptOrderCode: TAcReport;
    AcrptOrderCodeEN: TAcReport;
    AcReport1: TAcReport;
    MenuPrtUnitLabel: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    MenuEdtProduct: TMenuItem;
    chkTrackingStates: TCheckBox;
    dbcbbTrackingStates: TDBLookupComboboxEh;
    adt_trackingStates: TADODataSet;
    ds_trackingStates: TDataSource;
    AcrptBoxOrderCN: TAcReport;
    procedure btnQueryClick(Sender: TObject);
    procedure MenuPrtUnitPackgeClick(Sender: TObject);
    procedure MenuPrtWaCardClick(Sender: TObject);
    procedure MenuPrtPackgeListClick(Sender: TObject);
    procedure MenuPrtOrderInfoClick(Sender: TObject);
    procedure MenuPrtUnitLabelClick(Sender: TObject);
    procedure MenuEdtProductClick(Sender: TObject);
    procedure gridDataDblClick(Sender: TObject);
    procedure gridData2Enter(Sender: TObject);
    procedure gridDataEnter(Sender: TObject);
    procedure gridDataCellClick(Column: TColumnEh);
  private
    { Private declarations }
    //function checkPrinter: Boolean;
    procedure PrinterPrepare;
    procedure PrtForm(FormTypeID: integer);
  protected
    procedure SetData; override;
    procedure SetUI; override;
    procedure SetAccess; override;
  public
    { Public declarations }
  end;

implementation

uses DataModule, uMJ, ufrmPrtLabel, ufrmEdtProduct, ufrmDBBasic, uDMEntity,
  uDMManager;

{$R *.dfm}

{ TfrmProduct }

procedure TfrmProduct.SetData;
var
  sqlBusiness: string;
begin
  sqlBusiness := '';
  if objCurUser.BusinessApplicationID = '1' then
    sqlBusiness := ',@BusinessApplicationID=1'
  else if objCurUser.BusinessApplicationID = '2' then
    sqlBusiness := ',@BusinessApplicationID=2';
  DM.DataSetQuery(adt_customer, 'EXEC usp_GetCustomer @PlantID=''' + objCurUser.PlantID + '''' + sqlBusiness);
  DM.DataSetQuery(adt_model, 'Select * from Model where modelid in '
    + ' (select distinct modelid from plantmodel '
    + ' where plantid in (' + objCurUser.PlantID + '))');
  DM.DataSetQuery(adt_active, 'EXEC usp_GetProductTracking @ProductionScheduleID=0');
  DM.DataSetQuery(adt_active2, 'EXEC usp_GetProductComponentTracking @ProductTrackingID=0');
  DM.DataSetQuery(adt_trackingStates, 'EXEC usp_GetProductTrackingStates');
end;

procedure TfrmProduct.SetUI;
begin
  inherited;
  dtpProductionTimeFrom.DateTime := now;
  dtpProductionTimeTo.DateTime := now;
  //MenuPrtWaCard.Visible := false;
end;

procedure TfrmProduct.SetAccess;
begin
  inherited;
  gridData2.ReadOnly := false;
  gridData2.FieldColumns['ProductTrackingID'].ReadOnly := true;
  gridData2.FieldColumns['ComponentItem'].ReadOnly := true;
  gridData2.FieldColumns['ComponentSeriesName'].ReadOnly := true;
  case objCurUser.AccessLevel of
    3:
      begin
        MenuEdtProduct.Visible := true;
        chkTrackingStates.Enabled := true;
        gridData.OnDblClick := gridDataDblClick;
      end;
    20:
      begin
        pnlBottom.Visible := true;
      end;
    21:
      begin
        MenuEdtProduct.Enabled := false;
        chkTrackingStates.Checked := true;
        chkTrackingStates.Enabled := false;
        dbcbbTrackingStates.Value := 4;
        gridData.OnDblClick := nil;
        btnQuery.Click;
      end;
    22:
      begin
        MenuEdtProduct.Visible := true;
        MenuPrtUnitLabel.Visible := true;
        MenuPrtUnitPackge.Visible := true;
        MenuPrtPackgeList.Visible := true;
        MenuPrtOrderInfo.Visible := true;
      end;
  end;
end;

procedure TfrmProduct.gridDataEnter(Sender: TObject);
begin
  inherited;
  DBNavigator1.VisibleButtons := [nbFirst, nbNext, nbPrior, nbLast];
end;

procedure TfrmProduct.gridData2Enter(Sender: TObject);
begin
  inherited;
  DBNavigator1.VisibleButtons := [nbFirst, nbNext, nbPrior, nbLast, nbPost, nbEdit, nbCancel];
end;

procedure TfrmProduct.btnQueryClick(Sender: TObject);
var
  sqlConst: string;
begin
  sqlConst := '';
  if chkCustomer.Checked then
  begin
    if dbcbbCustomer.Value = null then
    begin
      ShowMessage('Please select customer.');
      exit;
    end;
    sqlConst := sqlConst + ',@CustomerID=' + VarToStr(dbcbbCustomer.Value);
  end;
  if chkModel.Checked then
  begin
    if dbcbbModel.Value = null then
    begin
      ShowMessage('Please select model.');
      exit;
    end;
    sqlConst := sqlConst + ',@ModelID=' + VarToStr(dbcbbModel.Value);
  end;
  if chkProductSN.Checked then
    sqlConst := sqlConst + ',@ProductSerialNumber=''' + Trim(edtProductSN.Text) + '''';
  if chkComponentSN.Checked then
    sqlConst := sqlConst + ',@ComponentSerialNumber=''' + Trim(edtComponentSN.Text) + '''';
  if chkWaCode.Checked then
    sqlConst := sqlConst + ',@WarrentycardCode=''' + Trim(edtWaCode.Text) + '''';
  if chkOrderNumber.Checked then
    sqlConst := sqlConst + ',@CustomerOrderNumber=''' + Trim(edtCONumber.Text) + '''';
  if chkProductionTime.Checked then
    sqlConst := sqlConst + ',@ProductionStartTimeFrom='''
      + FormatDateTime('YYYY-mm-dd', dtpProductionTimeFrom.DateTime) + ''''
      + ',@ProductionStartTimeTo='''
      + FormatDateTime('YYYY-mm-dd', dtpProductionTimeTo.DateTime) + '''';
  if chkTrackingStates.Checked then
    sqlConst := sqlConst + ',@ProductTrackingStatesID=' + VarToStr(dbcbbTrackingStates.Value);
  if sqlConst <> '' then sqlConst := copy(sqlConst, 2, length(sqlConst));

  adt_active.AfterScroll := nil;
  try
    if objCurUser.AccessLevel = 21 then
    begin
      DM.DataSetQuery(adt_active, 'EXEC usp_GetProductTracking1 ' + sqlConst)
    end
    else
    begin
      DM.DataSetQuery(adt_active, 'EXEC usp_GetProductTracking ' + sqlConst)
    end;
  finally
    adt_active.First;
  end;
end;

procedure TfrmProduct.MenuEdtProductClick(Sender: TObject);
begin
  if gridData.DataSource.DataSet.RecordCount <> 0 then
    TfrmEdtProduct.EdtFromList(TADODataSet(gridData.DataSource.DataSet));
end;

procedure TfrmProduct.gridDataDblClick(Sender: TObject);
begin
  if gridData.DataSource.DataSet.RecordCount <> 0 then
    TfrmEdtProduct.EdtFromList(TADODataSet(gridData.DataSource.DataSet));
end;

procedure TfrmProduct.MenuPrtUnitPackgeClick(Sender: TObject);
begin
  PrtForm(1);
end;

procedure TfrmProduct.MenuPrtWaCardClick(Sender: TObject);
begin
  PrtForm(2);
end;

procedure TfrmProduct.MenuPrtPackgeListClick(Sender: TObject);
begin
  PrtForm(3);
end;

procedure TfrmProduct.MenuPrtOrderInfoClick(Sender: TObject);
begin
  PrtForm(4);
end;

procedure TfrmProduct.MenuPrtUnitLabelClick(Sender: TObject);
begin
  PrtForm(5);
end;

{
function TfrmProduct.checkPrinter: Boolean;
var
  Str: string;
begin
  Str := 'Please check printer "' + CurrPrinterPath
    + '"'#13'. If it is ready, click "Yes" to print.';
  if Application.MessageBox(Pchar(Str), 'Check Printer', MB_YESNO + MB_ICONQUESTION) <> IDYES then
    result := false
  else
    result := true;
end;
}

procedure TfrmProduct.PrinterPrepare;
var
  Device: array[0..cchDeviceName - 1] of Char;
  Driver: array[0..(max_path - 1)] of Char;
  Port: array[0..32] of Char;
  hDMode: THandle;
begin
  Printer.GetPrinter(Device, Driver, Port, hDMode);
  Sysutils.StrPCopy(Device, CurrPrinterPath);
  Printer.SetPrinter(Device, Driver, Port, hDMode);
end;

procedure TfrmProduct.PrtForm(FormTypeID: integer);

  procedure PrintUnitPackge(IsChn, IsPreview: Boolean; compressorSN, compressorItem, CustomerOrderNumber, CustomerName: string);
  begin
    case IsChn of
      true:
        begin
          AcrptUnitBox.Variants.SetVariant('CompressorSN', CompressorSN);
          AcrptUnitBox.Variants.SetVariant('CompressorItem', CompressorItem);
          AcrptUnitBox.Variants.SetVariant('CustomerOrderNumber', CustomerOrderNumber);
          AcrptUnitBox.Variants.SetVariant('CustomerName', CustomerName);
          AcrptUnitBox.LoadFromFile(ExtractFilePath(ParamStr(0)) + '/FormTemplate/CUD/RptProductBox.apt');
          AcrptUnitBox.PrepareReport;
          case IsPreview of
            true:
              AcrptUnitBox.Preview;
            false:
              begin
                PrinterPrepare;
                AcrptUnitBox.Print;
              end;
          end;
        end;
      false:
        begin
          AcrptUnitBoxEN.Variants.SetVariant('CompressorSN', CompressorSN);
          AcrptUnitBoxEN.Variants.SetVariant('CompressorItem', CompressorItem);
          AcrptUnitBoxEN.Variants.SetVariant('CustomerOrderNumber', CustomerOrderNumber);
          AcrptUnitBoxEN.Variants.SetVariant('CustomerName', CustomerName);
          AcrptUnitBoxEN.LoadFromFile(ExtractFilePath(ParamStr(0)) + '/FormTemplate/CUD/RptOverseasProductBox.apt');
          AcrptUnitBoxEN.PrepareReport;
          case IsPreview of
            true:
              AcrptUnitBoxEN.Preview;
            false:
              begin
                PrinterPrepare;
                AcrptUnitBoxEN.Print;
              end;
          end;
        end;
    end;
  end;

  procedure PrintUnitWaCard(IsChn, IsPreview: Boolean;
    compressorSN, compressorItem, ProductDate, ATD: string);
  begin
    case IsChn of
      true:
        begin
          AcrptWcCN.Variants.SetVariant('ProductDate', ProductDate);
          AcrptWcCN.Variants.SetVariant('ATD', ATD);
          AcrptWcCN.Variants.SetVariant('CompressorSN', CompressorSN);
          AcrptWcCN.Variants.SetVariant('CompressorItem', CompressorItem);
          AcrptWcCN.LoadFromFile(ExtractFilePath(ParamStr(0)) + '/FormTemplate/CUD/RptWarrentycard.apt');
          AcrptWcCN.PrepareReport;
          case IsPreview of
            true:
              AcrptWcCN.Preview;
            false:
              begin
                PrinterPrepare;
                AcrptWcCN.Print;
              end;
          end;
        end;
      false:
        begin
          AcrptWcCN.Variants.SetVariant('ProductDate', ProductDate);
          AcrptWcCN.Variants.SetVariant('ATD', ATD);
          AcrptWcEN.Variants.SetVariant('CompressorSN', CompressorSN);
          AcrptWcEN.Variants.SetVariant('CompressorItem', CompressorItem);
          AcrptWcEN.LoadFromFile(ExtractFilePath(ParamStr(0)) + '/FormTemplate/CUD/RptOverseasWarrentycard.apt');
          AcrptWcEN.PrepareReport;
          case IsPreview of
            true:
              AcrptWcEN.Preview;
            false:
              begin
                PrinterPrepare;
                AcrptWcEN.Print;
              end;
          end;
        end;
    end;
  end;

  procedure PrintPackgeOrder(IsChn, IsPreview: Boolean);
  begin
    case IsChn of
      true:
        begin
          AcrptBoxOrderCN.LoadFromFile(ExtractFilePath(ParamStr(0)) + '/FormTemplate/CUD/RptBoxOrder.apt');
          AcrptBoxOrderCN.PrepareReport;
          case IsPreview of
            true:
              AcrptBoxOrderCN.Preview;
            false:
              begin
                PrinterPrepare;
                AcrptBoxOrderCN.Print;
              end;
          end;
        end;
      false:
        begin
          AcrptBoxOrderEN.LoadFromFile(ExtractFilePath(ParamStr(0)) + '/FormTemplate/CUD/RptOverseasBoxOrder.apt');
          AcrptBoxOrderEN.PrepareReport;
          case IsPreview of
            true:
              AcrptBoxOrderEN.Preview;
            false:
              begin
                PrinterPrepare;
                AcrptBoxOrderEN.Print;
              end;
          end;
        end;
    end;
  end;

  procedure PrintOrderCode(IsChn, IsPreview: Boolean; Model: string);
  var
    Model2: string;
  begin
    case IsChn of
      true:
        begin
          Model2 := '';
          if Model = 'ZXME-020E-TFD-302' then
            Model2 := '8403476';
          if Model = 'ZXME-030E-TFD-302' then
            Model2 := '8403487';
          if Model = 'ZXME-040E-TFD-302' then
            Model2 := '8403498';
          if Model = 'ZXME-050E-TFD-302' then
            Model2 := '8403501';
          if Model = 'ZXME-060E-TFD-302' then
            Model2 := '8403512';
          if Model = 'ZXME-070E-TFD-302' then
            Model2 := '8403523';
          AcrptOrderCode.LoadFromFile(ExtractFilePath(ParamStr(0)) + '/FormTemplate/CUD/RptDomesticOrderCode.apt');
          AcrptOrderCode.PrepareReport;
          case IsPreview of
            true:
              AcrptOrderCode.Preview;
            false:
              begin
                PrinterPrepare;
                AcrptOrderCode.Print;
              end;
          end;
        end;
      false:
        begin
          if UpperCase(Copy(Model, 1, 3)) = 'ZXM' then
            AcrptOrderCodeEN.LoadFromFile(ExtractFilePath(ParamStr(0)) + '/FormTemplate/CUD/RptOverseasOrderCode2.apt')
          else
            AcrptOrderCodeEN.LoadFromFile(ExtractFilePath(ParamStr(0)) + '/FormTemplate/CUD/RptOverseasOrderCode.apt');
          AcrptOrderCodeEN.PrepareReport;
          case IsPreview of
            true:
              AcrptOrderCodeEN.Preview;
            false:
              begin
                PrinterPrepare;
                AcrptOrderCodeEN.Print;
              end;
          end;
        end;
    end;
  end;

  procedure UpdateProductTrackingStates(TrackingID: string);
  var
    qr: TADOQuery;
    str: string;
  begin
    str := 'update ProductTracking';
    str := str + ' set ProductTrackingStatesID=5';
    str := str + ' where ProductTrackingID=' + TrackingID;
    qr := TADOQuery.Create(nil);
    try
      qr.Connection := DM.ADOConnection1;
      qr.Close;
      qr.SQL.Clear;
      qr.SQL.Add(str);
      qr.ExecSQL;
    finally
      qr.Free;
    end;
  end;
var
  IsChn, IsPreview: Boolean;
  compressorSN, compressorItem, ProductDate, ATD, Model: string;
  CustomerOrderNumber, CustomerName: string;
  adt_c, adt_pt: TADODataSet;
begin
//  adt_active.First;
  adt_c := TADODataSet.Create(nil);
  try
   { DM.DataSetQuery(adt_c, Format(sQueryProductComponentTrackingSQL,
      [' and ComponentSeriesID=113'
      + ' and ProductTrackingID=' + adt_active.FieldByName('ProductTrackingID').AsString]));
    }
    DM.DataSetQuery(adt_c, 'EXEC usp_GetProductComponentTracking @ComponentSeriesID=113'
      + ',@ProductTrackingID=' + adt_active.FieldByName('ProductTrackingID').AsString);
    CompressorSN := adt_c.FieldByName('ComponentSerialNumber').AsString;
    CompressorItem := adt_c.FieldByName('ComponentItem').AsString;
  finally
    adt_c.Free;
  end;
  adt_pt := TADODataSet.Create(nil);
  try
    DM.DataSetQuery(adt_pt, 'EXEC usp_GetProductTracking'
      + ' @ProductTrackingID=' + adt_active.FieldByName('ProductTrackingID').AsString);
    CustomerOrderNumber := adt_pt.FieldByName('CustomerOrderNumber').AsString;
    CustomerName := adt_pt.FieldByName('CustomerName').AsString;
  finally
    adt_pt.Free;
  end;
  //if not checkPrinter then exit;
  if LowerCase(adt_active.FieldByName('Country').AsString) = 'chn' then
    IsChn := true
  else
    IsChn := false;
  IsPreview := true;
  if FormTypeID <> 5 then
  begin
    if MessageDlg('Preview?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      IsPreview := true
    else
      IsPreview := false;
  end;
  case FormTypeID of
    1:
      PrintUnitPackge(IsChn, IsPreview, compressorSN, compressorItem, CustomerOrderNumber, CustomerName);
    2:
      begin
        ATD := FormatDateTime('YYYY-mm-dd', adt_active.fieldbyname('ETD').AsDateTime);
        ProductDate := FormatDateTime('YYYY-mm-dd', adt_active.fieldbyname('ProductionStartTime').AsDateTime);
        PrintUnitWaCard(IsChn, IsPreview, compressorSN,
          compressorItem, ProductDate, ATD);
        UpdateProductTrackingStates(adt_active.fieldbyname('ProductTrackingID').AsString);
      end;
    3:
      PrintPackgeOrder(IsChn, IsPreview);
    4:
      begin
        Model := UpperCase(adt_active.fieldbyname('Model').AsString);
        PrintOrderCode(IsChn, IsPreview, Model);
      end;
    5:
      begin
        TfrmPrtLabel.EdtFromList(adt_active);
      end;
  end;
end;

{
  DM.DataSetQuery(adt_active, 'EXEC usp_GetCustomer @PlantID=''' + gVars.CurUserPlantID + '''');
  DM.DataSetQuery(adt_active, format(sQueryProductTrackingSQL, [' and 0=1']));
  DM.DataSetQuery(adt_active2, format(sQueryProductComponentTrackingSQL, [' and 0=1']));
  sqlConst := ' and p.PlantID in' + gVars.CurUserPlantID;
  DM.DataSetQuery(adt_model, format(sQueryModelSQL, [sqlConst]));
  //sqlConst := ' and PlantID in' + gVars.CurUserPlantID;
  //DM.DataSetQuery(adt_customer, format(sQueryCustomerSQL, [sqlConst]));
}

  {
  sqlConst := '';
  if chkProductSN.Checked then
    sqlConst := sqlConst + ',@ProductSerialNumber=''' + Trim(edtProductSN.Text) + '''';
  if chkComponentSN.Checked then
    sqlConst := sqlConst + ' and ProductTrackingID in'
      + ' (select ProductTrackingID from ProductComponentTracking'
      + ' where ComponentSerialNumber=''' + Trim(edtComponentSN.Text) + ''')';
  if chkModel.Checked then
    sqlConst := sqlConst + ' and ModelID=' + VarToStr(dbcbbModel.KeyValue);
  if chkWaCode.Checked then
    sqlConst := sqlConst + ' and WarrentycardCode=' + Trim(edtWaCode.Text);
  if chkCustomer.Checked then
    sqlConst := sqlConst + ' and CustomerID=' + VarToStr(dbcbbCustomer.KeyValue);
  if chkOrderNumber.Checked then
    sqlConst := sqlConst + ' and CustomerOrderNumber=' + Trim(edtCONumber.Text);
  if chkProductionTime.Checked then
    sqlConst := sqlConst + ' and ProductionStartTime>='''
      + FormatDateTime('YYYY-mm-dd 00:01', dtpProductionTimeFrom.DateTime) + ''''
      + ' and ProductionStartTime<='''
      + FormatDateTime('YYYY-mm-dd 23:59', dtpProductionTimeTo.DateTime) + '''';
  //DM.DataSetQuery(adt_active, format(sQueryProductTrackingSQL, [sqlConst]));
  DM.DataSetQuery(adt_active2, format(sQueryProductComponentTrackingSQL, [' and 0=1']));
  }

procedure TfrmProduct.gridDataCellClick(Column: TColumnEh);
begin
  inherited;
  if gridData.DataSource.DataSet.RecordCount > 0 then
  begin
    GroupBox2.Caption := 'Component Of Tracking ID : ' + gridData.DataSource.DataSet.fieldbyname('ProductTrackingID').AsString;
    //sqlConst := ' and ProductTrackingID=' + DataSet.fieldbyname('ProductTrackingID').AsString;
    //DM.DataSetQuery(adt_active2, Format(sQueryProductComponentTrackingSQL, [sqlConst]));
    DM.DataSetQuery(adt_active2, 'EXEC usp_GetProductComponentTracking @ProductTrackingID='
      + gridData.DataSource.DataSet.fieldbyname('ProductTrackingID').AsString);
  end;
end;

end.

