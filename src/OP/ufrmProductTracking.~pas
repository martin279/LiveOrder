unit ufrmProductTracking;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmDBBasicDT, PropFilerEh, DB, ADODB, Menus, PropStorageEh,
  ActnList, ImgList, GridsEh, DBGridEh, StdCtrls, ExtCtrls, DBCtrls,
  ComCtrls, ToolWin, Mask, DBCtrlsEh, ACReportClass, Printers, uDMEntity, uDMManager;

type
  TComponentInfo = record
    ComponentID: integer;
    ComponentSeriesID: integer;
  end;

  TfrmProductTracking = class(TfrmDBBasicDT)
    Panel1: TPanel;
    gboxComponentTrack: TGroupBox;
    gridComponentTrack: TDBGridEh;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    gboxScan: TGroupBox;
    Label4: TLabel;
    Panel2: TPanel;
    btnQuery: TButton;
    dtpScheduleDate: TDateTimePicker;
    Label5: TLabel;
    edtComponentItem: TEdit;
    LabelPrompt: TLabel;
    adt_component: TADODataSet;
    ds_component: TDataSource;
    adt_componentProductComponentTrackingID: TAutoIncField;
    adt_componentProductTrackingID: TIntegerField;
    adt_componentComponentID: TIntegerField;
    adt_componentComponentSerialNumber: TStringField;
    adt_componentComponentItem: TStringField;
    adt_componentComponentSeriesName: TStringField;
    Label8: TLabel;
    dbtxtTrackingID: TDBText;
    dbtxtScheduleID: TDBText;
    Label9: TLabel;
    edtComponentSN: TEdit;
    Label10: TLabel;
    dbtxtCustomerName: TDBText;
    dbtxtModel: TDBText;
    Label11: TLabel;
    dbtxtProductSN: TDBText;
    dbtxtPackgeType: TDBText;
    LabelComponentID: TLabel;
    Label7: TLabel;
    dbtxtTrackingStatesID: TDBText;
    Label6: TLabel;
    Label12: TLabel;
    dbtxtCustomerNumber: TDBText;
    Timer1: TTimer;
    Splitter2: TSplitter;
    N2: TMenuItem;
    MenuPrtUnitLabel: TMenuItem;
    MenuPrtUnitPackge: TMenuItem;
    MenuPrtPackgeList: TMenuItem;
    AcrptUnitBox: TAcReport;
    AcrptUnitBoxEN: TAcReport;
    AcrptWcCN: TAcReport;
    AcrptWcEN: TAcReport;
    AcrptBoxOrderCN: TAcReport;
    AcrptBoxOrderEN: TAcReport;
    AcReport1: TAcReport;
    N3: TMenuItem;
    MenuChangeToUM180: TMenuItem;
    procedure adt_activeAfterScroll(DataSet: TDataSet);
    procedure edtComponentItemKeyPress(Sender: TObject; var Key: Char);
    procedure btnQueryClick(Sender: TObject);
    procedure edtComponentSNKeyPress(Sender: TObject; var Key: Char);
    procedure edtComponentSNExit(Sender: TObject);
    procedure gridComponentTrackGetCellParams(Sender: TObject;
      Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure adt_active2AfterScroll(DataSet: TDataSet);
    procedure gridData2Enter(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure MenuPrtUnitLabelClick(Sender: TObject);
    procedure MenuPrtUnitPackgeClick(Sender: TObject);
    procedure MenuPrtPackgeListClick(Sender: TObject);
    procedure MenuChangeToUM180Click(Sender: TObject);
    procedure gridDataEnter(Sender: TObject);
  private
    { Private declarations }
    procedure ComponentSNKeyPressEnter;
    procedure PrinterPrepare;
    procedure PrtForm(FormTypeID: integer);
    procedure UpdateProductTrackingStates(TrackingID, ProductTrackingStatesID: string);
  protected
    procedure SetData; override;
    procedure SetUI; override;
    procedure SetAccess; override;
  public
    { Public declarations }
  end;


implementation

uses DataModule, uMJ, ufrmDBBasic, ufrmPrtLabel, ufrmCheckProductSN,
  ufrmMain, uDlgLogin;

{$R *.dfm}

{ TfrmProductTracking }

procedure TfrmProductTracking.SetData;
var
  adt_productDate: TADODataSet;
begin
  DM.DataSetQuery(adt_component, 'EXEC usp_GetProductComponentTracking @ProductTrackingID=0');
  adt_productDate := TADODataSet.Create(nil);
  try
    DM.DataSetQuery(adt_productDate, 'EXEC usp_GetMinScheduleStartTime');
    if adt_productDate.RecordCount = 1 then
      dtpScheduleDate.DateTime := adt_productDate.fieldbyname('MinScheduleStartTime').AsDateTime
    else
      dtpScheduleDate.DateTime := now();
  finally
    adt_productDate.Free;
  end;
  DM.DataSetQuery(adt_active, 'EXEC usp_GetProductTracking @ProductionScheduleID=0');
  DM.DataSetQuery(adt_active2, 'EXEC usp_GetProductTracking @ProductionScheduleID=0');
end;

procedure TfrmProductTracking.SetUI;
begin
  inherited;
  BorderIcons := [];
  PnlTop.Visible := false;
{  tbtnExit.Visible := false;
  tbtnFilter.Visible := false;
  tbtnFind.Visible := false;
  tbtnOperation.Visible := false;
  DBNavigator1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast];  }
end;

procedure TfrmProductTracking.SetAccess;
begin
  inherited;
  if objCurUser.LoginID = 64 then
  begin
    Timer1.Enabled := false;
    Panel1.Visible := false;
    Splitter2.Visible := false;
  end
  else
  begin
    Timer1.Enabled := true;
    MenuChangeToUM180.Visible := False;
    MenuPrtUnitLabel.Visible := False;
    MenuPrtUnitPackge.Visible := False;
    MenuPrtPackgeList.Visible := False;
    edtComponentSN.Enabled := False;
    edtComponentSN.ParentColor := true;
    gridData.Enabled := False;
    gridData.ParentColor := true;
    gridData2.Enabled := False;
    gridData2.ParentColor := true;
    gridComponentTrack.ReadOnly := true;
    gridComponentTrack.ParentColor := true;
  end;
  case gVars.CurUserLevel of
    3:
      begin
        gridData.Enabled := true;
        gridData2.Enabled := true;
        gridData.ParentColor := false;
        gridData2.ParentColor := false;
        gboxScan.Visible := false;
      end;
  end;
  btnQuery.Click;
end;

procedure TfrmProductTracking.btnQueryClick(Sender: TObject);
var
  TrackingStatesID1, TrackingStatesID2: string;
begin
  case gVars.CurUserLevel of
    1:
      begin
        TrackingStatesID1 := '1';
        TrackingStatesID2 := '2';
      end;
    3:
      begin
        TrackingStatesID1 := '1';
        TrackingStatesID2 := '2';
      end;
    21:
      begin
        case objCurUser.LoginID of
          62:
            begin
              TrackingStatesID1 := '1';
              TrackingStatesID2 := '2';
            end;
          63:
            begin
              TrackingStatesID1 := '2';
              TrackingStatesID2 := '3';
            end;
          64:
            begin
              TrackingStatesID1 := '3';
              TrackingStatesID2 := '5';
            end;
          101:
            begin
              TrackingStatesID1 := '4';
              TrackingStatesID2 := '5';
            end;
          102:
            begin
              TrackingStatesID1 := '5';
              TrackingStatesID2 := '6';
            end;
        end;
      end;
  end;

  adt_active.AfterScroll := nil;
  try
    DM.DataSetQuery(adt_active, 'EXEC usp_GetProductTracking @ProductTrackingStatesID=''' + TrackingStatesID1
      + ''',@ScheduleStartTime=''' + FormatDateTime('YYYY-mm-dd', dtpScheduleDate.DateTime) + ''''
      + ',@Col=''ProductTrackingID''');
    DM.DataSetQuery(adt_active2, 'EXEC usp_GetProductTracking @ProductTrackingStatesID=' + TrackingStatesID2
      + ',@ScheduleStartTime=''' + FormatDateTime('YYYY-mm-dd', dtpScheduleDate.DateTime) + ''''
      + ',@Col=''ProductTrackingID desc''');
  {
    if ((TrackingStatesID1 <> '0') and (TrackingStatesID1 <> '10')) then
    begin
      DM.DataSetQuery(adt_active, 'EXEC usp_GetProductTracking @ProductTrackingStatesID=''' + TrackingStatesID1
        + ''',@ScheduleStartTime=''' + FormatDateTime('YYYY-mm-dd', dtpScheduleDate.DateTime) + ''''
        + ',@Col=''ProductTrackingID''');
      DM.DataSetQuery(adt_active2, 'EXEC usp_GetProductTracking @ProductTrackingStatesID=' + TrackingStatesID2
        + ',@ScheduleStartTime=''' + FormatDateTime('YYYY-mm-dd', dtpScheduleDate.DateTime) + ''''
        + ',@Col=''ProductTrackingID desc''');
    end
    else
    begin
      DM.DataSetQuery(adt_active, 'EXEC usp_GetProductTracking2 @ProductTrackingStatesID=0,@ScheduleStartTime=''' + FormatDateTime('YYYY-mm-dd', dtpScheduleDate.DateTime) + '''');
      DM.DataSetQuery(adt_active2, 'EXEC usp_GetProductTracking2 @ProductTrackingStatesID=10,@ScheduleStartTime=''' + FormatDateTime('YYYY-mm-dd', dtpScheduleDate.DateTime) + ''''
        + ',@Col=''ProductTrackingID desc''');
    end;    }
  finally
    adt_active.AfterScroll := adt_activeAfterScroll;
    adt_active.First;
  end;
end;

procedure TfrmProductTracking.adt_activeAfterScroll(DataSet: TDataSet);
var
//  adt_packge: TADODataSet;
  sqlConst: string;
begin
  inherited;
  if DataSet.RecordCount > 0 then
  begin
    if gridComponentTrack.DataSource.DataSet = nil then
    begin
      gridComponentTrack.DataSource.DataSet := adt_component;
      gridComponentTrack.DataSource.DataSet.Active := false;
      gridComponentTrack.DataSource.DataSet.Active := true;
    end;
    gboxComponentTrack.Caption := 'Component Of Model : ' + DataSet.fieldbyname('Model').AsString
      + ' / Unit SN. : ' + DataSet.fieldbyname('ProductSerialNumber').AsString
      + ' / ID : ' + DataSet.fieldbyname('ProductTrackingID').AsString;

    sqlConst := '';
    if dbtxtTrackingStatesID.Caption = '1' then
      sqlConst := ',@Station=''um10''';
    if dbtxtTrackingStatesID.Caption = '2' then
      sqlConst := ',@Station=''us20''';
    if dbtxtTrackingStatesID.Caption = '5' then
      sqlConst := ',@Station=''um180''';
    //if dbtxtTrackingStatesID.Caption = '0' then
{   if objCurUser.LoginID = 102 then
      sqlConst := ',@Station=0';     }
    DM.DataSetQuery(adt_component, 'EXEC usp_GetProductComponentTracking @ProductTrackingID='
      + DataSet.fieldbyname('ProductTrackingID').AsString + sqlConst);
    if DataSet.fieldbyname('CustomerID').AsInteger = 230 then
    begin
      dbtxtPackgeType.Caption := 'ÊµÄ¾°ü×°';
    end;
   // else
     // dbtxtPackgeType.DataSource.DataSet := adt_active;
    {
    adt_packge := TADODataSet.Create(nil);
    try
      gboxComponentTrack.Caption := 'Component Of Model : ' + DataSet.fieldbyname('Model').AsString
        + ' / Unit SN. : ' + DataSet.fieldbyname('ProductSerialNumber').AsString
        + ' / ID : ' + DataSet.fieldbyname('ProductTrackingID').AsString;
      DM.DataSetQuery(adt_component, 'EXEC usp_GetProductComponentTracking @ProductTrackingID='
        + DataSet.fieldbyname('ProductTrackingID').AsString);
      DM.DataSetQuery(adt_packge, 'EXEC usp_GetProductPackgeCUD @ProductSeriesID='
        + gridData.DataSource.DataSet.FieldByName('ProductSeriesID').AsString
        + ',@IsCHN=' + gridData.DataSource.DataSet.FieldByName('IsCHN').AsString);
      if adt_packge.RecordCount > 0 then
        dbtxtPackgeType.Caption := adt_packge.fieldbyname('ProductPackgeType').AsString;
    finally
      adt_packge.Free;
    end;
    }
  end
  else
  begin
    gridComponentTrack.DataSource.DataSet := nil;
    gboxComponentTrack.Caption := '';
  end;
end;

procedure TfrmProductTracking.gridDataEnter(Sender: TObject);
begin
  inherited;
  MenuPrtUnitLabel.Visible := true;
  MenuPrtUnitPackge.Visible := true;
  MenuPrtPackgeList.Visible := true;
  MenuChangeToUM180.Visible := true;
end;

procedure TfrmProductTracking.gridData2Enter(Sender: TObject);
begin
  inherited;
  MenuPrtUnitLabel.Visible := false;
  MenuPrtUnitPackge.Visible := false;
  MenuPrtPackgeList.Visible := false;
  MenuChangeToUM180.Visible := false;
//  adt_active2.AfterScroll := adt_active2AfterScroll;
end;

procedure TfrmProductTracking.adt_active2AfterScroll(DataSet: TDataSet);
var
  adt_packge: TADODataSet;
begin
  inherited;
  if gridData2.DataSource.DataSet.RecordCount > 0 then
  begin
    adt_packge := TADODataSet.Create(nil);
    try
      gboxComponentTrack.Caption := 'Component Of Model : ' + DataSet.fieldbyname('Model').AsString
        + ' / Product SN. : ' + DataSet.fieldbyname('ProductSerialNumber').AsString;

      DM.DataSetQuery(adt_component, 'EXEC usp_GetProductComponentTracking @ProductTrackingID='
        + DataSet.fieldbyname('ProductTrackingID').AsString);

      DM.DataSetQuery(adt_packge, 'EXEC usp_GetProductPackgeCUD @ProductSeriesID='
        + gridData.DataSource.DataSet.FieldByName('ProductSeriesID').AsString
        + ',@IsCHN=' + gridData.DataSource.DataSet.FieldByName('IsCHN').AsString);
      if adt_packge.RecordCount > 0 then
        dbtxtPackgeType.Caption := adt_packge.fieldbyname('ProductPackgeType').AsString;
    finally
      adt_packge.Free;
    end;
  end;
end;

procedure TfrmProductTracking.edtComponentSNExit(Sender: TObject);
begin
  inherited;
  edtComponentSN.Clear;
  edtComponentSN.Enabled := false;
  edtComponentSN.Color := clBtnFace;
end;

procedure TfrmProductTracking.edtComponentItemKeyPress(Sender: TObject;
  var Key: Char);

  function CheckScanInfo(Model, ScanComponentItem: string): TComponentInfo;
  var
    adt_bom: TADODataSet;
    componentInfo: TComponentInfo;
  begin
    adt_bom := TADODataSet.Create(nil);
    try
      DM.DataSetQuery(adt_bom, 'EXEC usp_GetBOM_NoLine @Model='''
        + Model + ''',@ComponentItem=''' + ScanComponentItem + '''');
      if adt_bom.RecordCount = 0 then
      begin
        componentInfo.ComponentID := 0;
        componentInfo.ComponentSeriesID := 0;
      end
      else if adt_bom.RecordCount = 1 then
      begin
        if dbtxtTrackingStatesID.Caption <> '5' then
        begin
          componentInfo.ComponentID := adt_bom.fieldbyname('ComponentID').AsInteger;
          componentInfo.ComponentSeriesID := adt_bom.fieldbyname('ComponentSeriesID').AsInteger;
        end
        else
        begin
          if (gridData.DataSource.DataSet.FieldByName('IsCHN').AsBoolean)
            or (Uppercase(gridData.DataSource.DataSet.FieldByName('Country').AsString) = 'CHN') then
          begin
            DM.DataSetQuery(adt_bom, 'select * from ViewBOM where Model='''
              + Model + ''' and ComponentItem=''' + ScanComponentItem + ''''
              + ' and ComponentID in (1729,1736,1743,1762)');
          end
          else
          begin
            DM.DataSetQuery(adt_bom, 'select * from ViewBOM where Model='''
              + Model + ''' and ComponentItem=''' + ScanComponentItem + ''''
              + ' and ComponentID in (1734,1739,1741,1745,1770)');
          end;
          componentInfo.ComponentID := adt_bom.fieldbyname('ComponentID').AsInteger;
          componentInfo.ComponentSeriesID := adt_bom.fieldbyname('ComponentSeriesID').AsInteger;
        end;
      end;
      Result := componentInfo;
    finally
      adt_bom.Free;
    end;
  end;

var
  compInfo: TComponentInfo;
begin
  edtComponentSN.Clear;
  edtComponentSN.Enabled := false;
  edtComponentSN.Color := clBtnFace;
  if (Key = #13) then
  begin
    if gridComponentTrack.DataSource.DataSet = nil then
    begin
      showmessage('gridComponentTrack isn''t connect to db.');
      exit;
    end;
    if gridComponentTrack.DataSource.DataSet.RecordCount = 0 then
    begin
      showmessage('gridComponentTrack haven''t record.');
      exit;
    end;
    if edtComponentItem.Text = '' then
    begin
      showmessage('Please input part no.');
      exit;
    end;
    compInfo := CheckScanInfo(Trim(dbtxtModel.Caption), Trim(edtComponentItem.Text));
    LabelComponentID.Caption := IntToStr(compInfo.ComponentID);
    if compInfo.ComponentID = 0 then
    begin
      ShowMessage('Not exist this component in database.');
      edtComponentSN.Enabled := false;
      edtComponentSN.Color := clBtnFace;
      //GroupBox1.Enabled := false;
      edtComponentItem.SetFocus;
      edtComponentItem.SelectAll;
      exit;
    end
    else
    begin
      gridComponentTrack.DataSource.DataSet.First;
      while not gridComponentTrack.DataSource.DataSet.Eof do
      begin
        if gridComponentTrack.DataSource.DataSet.FieldByName('ComponentID').AsString
          = LabelComponentID.Caption then
        begin
          gridComponentTrack.DataSource.DataSet.GetBookmark;
          Break;
        end;
        gridComponentTrack.DataSource.DataSet.Next;
      end;
      edtComponentSN.Enabled := true;
      edtComponentSN.Color := clWindow;
      //GroupBox1.Enabled := true;
      edtComponentSN.SetFocus;
      edtComponentSN.SelectAll;

      if dbtxtTrackingStatesID.Caption = '5' then
        TfrmCheckProductSN.EdtFromList(gridData.DataSource.DataSet.fieldbyname('ProductTrackingID').AsInteger);

      if compInfo.ComponentSeriesID <> 113 then
      begin
        edtComponentSN.Text := '1';
        ComponentSNKeyPressEnter;
      end;
    end;
  end;
end;

procedure TfrmProductTracking.edtComponentSNKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = #13) then
  begin
    ComponentSNKeyPressEnter;
  end;
end;

procedure TfrmProductTracking.ComponentSNKeyPressEnter;

  function CheckScanInfoIsFullyIn1stStation(TrackingID, TrackingStatesID: integer): Boolean;
  var
    strSql, sqlConst: string;
    adt_pc: TADODataSet;
  begin
    adt_pc := TADODataSet.Create(nil);
    try
      if TrackingStatesID = 1 then
        sqlConst := ',@Station=''um10''';
      if TrackingStatesID = 2 then
        sqlConst := ',@Station=''us20''';
      if TrackingStatesID = 5 then
      begin
        sqlConst := ',@Station=''um180''';
        if (gridData.DataSource.DataSet.FieldByName('IsCHN').AsBoolean)
          or (Uppercase(gridData.DataSource.DataSet.FieldByName('Country').AsString) = 'CHN') then
          sqlConst := ',@ComponentID=''1729,1736,1743,1762'''
        else
          sqlConst := ',@ComponentID=''1734,1739,1741,1745''';
      end;
      if TrackingStatesID = 0 then
        sqlConst := ',@Station=0';
      strSql := 'EXEC usp_GetProductComponentTracking '
        + ' @ProductTrackingID=' + IntToStr(TrackingID)
        + ',@ComponentSerialNumber=''''' + sqlConst;
      DM.DataSetQuery(adt_pc, strSql);
      if adt_pc.RecordCount = 0 then
        Result := True
      else
        Result := False;
    finally
      adt_pc.Free;
    end;
  end;

begin
  if edtComponentSN.Text = '' then
  begin
    showmessage('Please input component serial number.');
    exit;
  end;
  gridData.DataSource.DataSet.DisableControls;
  gridComponentTrack.DataSource.DataSet.DisableControls;
  try
    DM.DataSetModify('EXEC usp_UpdateProductComponentTracking '
      + ' @ProductTrackingID=' + dbtxtTrackingID.Caption
      + ',@ComponentID=' + LabelComponentID.Caption
      + ',@ComponentSerialNumber=''' + trim(edtComponentSN.Text) + '''');
    if CheckScanInfoIsFullyIn1stStation(StrToInt(dbtxtTrackingID.Caption),
      StrToInt(dbtxtTrackingStatesID.Caption)) then
    begin
      DM.DataSetModify('EXEC usp_UpdateProductTracking '
        + ' @ProductTrackingID=' + dbtxtTrackingID.Caption
        + ',@ProductTrackingStatesID=' + IntToStr(StrToInt(dbtxtTrackingStatesID.Caption) + 1));
      btnQuery.Click;
      if gridData.DataSource.DataSet.RecordCount = 0 then
      begin
        gridData.DataSource.DataSet := nil;
        gridData.DataSource.DataSet := adt_active;
      end;
    end
    else
    begin
      gridComponentTrack.DataSource.DataSet.Active := false;
      gridComponentTrack.DataSource.DataSet.Active := true;
      gridComponentTrack.DataSource.DataSet.First;
      if gridComponentTrack.DataSource.DataSet.FieldByName('ComponentID').AsString
        <> LabelComponentID.Caption then
      begin
        while not gridComponentTrack.DataSource.DataSet.Eof do
        begin
          if gridComponentTrack.DataSource.DataSet.FieldByName('ComponentID').AsString
            = LabelComponentID.Caption then Break;
          gridComponentTrack.DataSource.DataSet.Next;
        end;
      end;
    end;
  finally
    gridComponentTrack.DataSource.DataSet.EnableControls;
    gridData.DataSource.DataSet.EnableControls;
    edtComponentSN.Clear;
    edtComponentSN.Enabled := false;
    edtComponentSN.Color := clBtnFace;
    //GroupBox1.Enabled := true;
    edtComponentItem.Clear;
    edtComponentItem.SetFocus;
  end;
end;

procedure TfrmProductTracking.gridComponentTrackGetCellParams(
  Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if trim(gridComponentTrack.DataSource.DataSet.fieldbyname('ComponentSerialNumber').AsString) <> '' then
    Background := clYellow;
end;

procedure TfrmProductTracking.Timer1Timer(Sender: TObject);
begin
  inherited;
  btnQuery.Click;
  //check us50 data is fully automatic, if the data is fully then update states to um50
end;

procedure TfrmProductTracking.MenuPrtUnitPackgeClick(Sender: TObject);
begin
  PrtForm(1);
end;

procedure TfrmProductTracking.MenuPrtPackgeListClick(Sender: TObject);
begin
  PrtForm(3);
end;

procedure TfrmProductTracking.MenuPrtUnitLabelClick(Sender: TObject);
begin
  PrtForm(5);
end;

procedure TfrmProductTracking.PrinterPrepare;
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

procedure TfrmProductTracking.PrtForm(FormTypeID: integer);

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
{
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
}

var
  IsChn, IsPreview: Boolean;
  compressorSN, compressorItem: string;
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
  {  2:
      begin
        ATD := FormatDateTime('YYYY-mm-dd', adt_active.fieldbyname('ETD').AsDateTime);
        ProductDate := FormatDateTime('YYYY-mm-dd', adt_active.fieldbyname('ProductionStartTime').AsDateTime);
        PrintUnitWaCard(IsChn, IsPreview, compressorSN,
          compressorItem, ProductDate, ATD);
        UpdateProductTrackingStates(adt_active.fieldbyname('ProductTrackingID').AsString, '5');
      end;        }
    3:
      begin
        PrintPackgeOrder(IsChn, IsPreview);
        MenuChangeToUM180.Click;
      end;
 {   4:
      begin
        Model := UpperCase(adt_active.fieldbyname('Model').AsString);
        PrintOrderCode(IsChn, IsPreview, Model);
      end;      }
    5:
      begin
        TfrmPrtLabel.EdtFromList(adt_active);
      end;
  end;
end;

procedure TfrmProductTracking.UpdateProductTrackingStates(TrackingID, ProductTrackingStatesID: string);
var
  qr: TADOQuery;
  str: string;
begin
  str := 'update ProductTracking';
  str := str + ' set ProductTrackingStatesID=' + ProductTrackingStatesID;
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

procedure TfrmProductTracking.MenuChangeToUM180Click(Sender: TObject);
begin
  UpdateProductTrackingStates(adt_active.fieldbyname('ProductTrackingID').AsString, '5');
  adt_active.Active := false;
  adt_active.Active := true;
  adt_active2.Active := false;
  adt_active2.Active := true;
end;

      {
      bk := gridData.DataSource.DataSet.GetBookmark;
      try
        btnQuery.Click;
        if gridData.DataSource.DataSet.RecordCount <> 0 then
          gridData.DataSource.DataSet.GotoBookmark(bk)
        else
        begin
          gridData.DataSource.DataSet := nil;
          gridData.DataSource.DataSet := adt_active;
        end;
      finally
        gridData.DataSource.DataSet.FreeBookmark(bk);
      end;
      }
      {
      if gridData.DataSource.DataSet.FieldByName('Country').AsString = 'chn' then
        IsCHN := 1
      else
        IsCHN := 0;

      sqlConst := ' and p.ProductSeriesID=' + gridData.DataSource.DataSet.FieldByName('ProductSeriesID').AsString;
      sqlConst := sqlConst + ' and p.IsCHN=' + IntToStr(IsCHN);
      DM.DataSetQuery(adt_packge, Format(sQueryProductPackgeCUDSQL, [sqlConst]));

      DM.DataSetQuery(adt_packge, 'EXEC usp_GetProductPackgeCUD @ProductSeriesID='
        + gridData.DataSource.DataSet.FieldByName('ProductSeriesID').AsString
        + ',@IsCHN=' + IntToStr(IsCHN));
       }

    {
    sqlConst := ' and ProductTrackingID=' + IntToStr(TrackingID);
    sqlConst := sqlConst + ' and (ltrim(rtrim(ComponentSerialNumber))='''' '
      + ' or (ltrim(rtrim(ComponentSerialNumber)) is null))';
    if TrackingStatesID = 1 then
      sqlConst := sqlConst + ' and ComponentSeriesID in (''113'',''114'',''115'',''122'')';
    if TrackingStatesID = 2 then
      sqlConst := sqlConst + ' and ComponentSeriesID in (''113'',''114'',''115'',''122'',''117'',''118'')';
          //DM.DataSetQuery(adt_pc, Format(sQueryProductComponentTrackingSQL, [sqlConst]));
    }
   // sqlConst := ' and Model=''' + Model + '''';
   // sqlConst := sqlConst + ' and ComponentItem=''' + ScanComponentItem + '''';
      //DM.DataSetQuery(adt_bom, Format(sQueryBOMSQL, [sqlConst]));
        {
    DM.DataSetModify(Format(sUpdateProductTrackingSQL,
      [,
      FormatDateTime('YYYY-mm-dd hh:mm', now), TrackingID]));

  ComponentID := StrToInt();
  TrackingID := StrToInt();
  DM.DataSetModify(Format(sUpdateProductComponentTrackingSQL,
    [, TrackingID, ComponentID]));
var
  sqlConst1, sqlConst2: string;
  sqlConst1 := '';
  sqlConst2 := '';
  case gVars.CurUserLevel of
    3:
      begin
        sqlConst1 := ' and ProductTrackingStatesID=1';
        sqlConst2 := ' and ProductTrackingStatesID=2';
      end;
    21:
      begin
        case objCurUser.LoginID of
          62:
            begin
              sqlConst1 := ' and ProductTrackingStatesID=1';
              sqlConst2 := ' and ProductTrackingStatesID=2';
            end;
          63:
            begin
              sqlConst1 := ' and ProductTrackingStatesID=2';
              sqlConst2 := ' and ProductTrackingStatesID=3';
            end;
        end;
      end;
  end;
  sqlConst1 := sqlConst1 + ' and 0=1';


      gridComponentTrack.DataSource.DataSet.Active := false;
      //gridData.DataSource.DataSet.AfterScroll := nil;
      gridData.DataSource.DataSet.Active := false;
      gridData.DataSource.DataSet.Active := true;
      gridData2.DataSource.DataSet.Active := false;
      gridData2.DataSource.DataSet.Active := true;
      //gridData.DataSource.DataSet.AfterScroll := adt_activeAfterScroll;
      gridComponentTrack.DataSource.DataSet.Active := true;      }

{
  DM.DataSetQuery(adt_active, format(sQueryProductTrackingSQL, [' and 0=1']));
  DM.DataSetQuery(adt_active2, format(sQueryProductTrackingSQL, [' and 0=1']));
  DM.DataSetQuery(adt_component, format(sQueryProductComponentTrackingSQL, [' and 0=1']));
}
{
  sqlConst1 := sqlConst1 + ' and Convert(varchar(10),ScheduleStartTime,120)='''
    + FormatDateTime('YYYY-mm-dd', dtpScheduleDate.DateTime) + '''';
  sqlConst2 := sqlConst2 + ' and Convert(varchar(10),ScheduleStartTime,120)='''
    + FormatDateTime('YYYY-mm-dd', dtpScheduleDate.DateTime) + '''';
  DM.DataSetQuery(adt_active, format(sQueryProductTrackingSQL, [sqlConst1]));
  DM.DataSetQuery(adt_active2, format(sQueryProductTrackingSQL, [sqlConst2]));


        sqlConst := ' and ProductTrackingID=' + DataSet.fieldbyname('ProductTrackingID').AsString;
      DM.DataSetQuery(adt_component, Format(sQueryProductComponentTrackingSQL, [sqlConst]));

}
    //DM.DataSetQuery(adt_productDate, sQueryMinScheduleStartTimeSQL);


end.

