unit ufrmProductPacking;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmDBBasicPrn, PropFilerEh, DB, ADODB, PrnDbgeh, Menus,
  PropStorageEh, ActnList, ImgList, GridsEh, DBGridEh, PrViewEh, StdCtrls,
  DBCtrls, ComCtrls, ToolWin, ExtCtrls, ACReportClass, Printers, uMJ;

type
  TfrmProductPacking = class(TfrmDBBasicPrn)
    Panel1: TPanel;
    Label1: TLabel;
    edtProductSN: TEdit;
    btnQuery: TButton;
    adt_activeProductTrackingID: TAutoIncField;
    adt_activeProductionScheduleID: TIntegerField;
    adt_activeProductSerialNumber: TStringField;
    adt_activeWarrentycardCode: TStringField;
    adt_activeWarrentycardReturnDate: TDateTimeField;
    adt_activeRemarks: TStringField;
    adt_activeProductionStartTime: TDateTimeField;
    adt_activeProductTrackingStatesID: TIntegerField;
    adt_activeProductTrackingStatesName: TStringField;
    adt_activeModel: TStringField;
    AcrptUnitBox: TAcReport;
    AcrptUnitBoxEN: TAcReport;
    AcrptWcCN: TAcReport;
    AcrptWcEN: TAcReport;
    AcrptBoxOrderCN: TAcReport;
    AcrptBoxOrderEN: TAcReport;
    AcrptUnitOrder: TAcReport;
    AcrptUnitOrderEN: TAcReport;
    AcReport1: TAcReport;
    qr_order: TADOQuery;
    qr_orderorder_code: TStringField;
    qr_ordercust_name: TStringField;
    ds_order: TDataSource;
    ds_prt_product: TDataSource;
    qr_prt_product: TADOQuery;
    qr_prt_productall_products_code: TStringField;
    qr_prt_productproduct_model_code: TStringField;
    qr_prt_productshipping_date: TDateTimeField;
    qr_prt_productmanufacture_date: TDateTimeField;
    qr_prt_productwarrentycard_code: TStringField;
    qr_prt_productproduct_chinese_name: TStringField;
    qr_prt_productproduct_english_name: TStringField;
    qr_prt_productproduct_gross: TStringField;
    qr_prt_productformal_size: TStringField;
    qr_prt_productpart_model_code: TStringField;
    qr_prt_productserial_no: TStringField;
    GroupBox3: TGroupBox;
    cbbPrtFormType: TComboBox;
    btnPrt: TButton;
    Label2: TLabel;
    GroupBox2: TGroupBox;
    RBtnDomestic: TRadioButton;
    RBtnOverseas: TRadioButton;
    StaticText1: TStaticText;
    Label3: TLabel;
    stPackge: TStaticText;
    procedure btnQueryClick(Sender: TObject);
    procedure edtProductSNKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnPrtClick(Sender: TObject);
  private
    { Private declarations }
    StrRec: TStrRec;
    function checkPrinter: Boolean;
    procedure PrinterPrepare;
    function QrCountry(sn: string): string;
    procedure QrCountryInfo;
  protected
    procedure SetData; override;
    procedure SetUI; override;
    procedure SetAccess; override;
  public
    { Public declarations }
    function GetLabelInfro(): TStrRec;
  end;


implementation

uses DataModule, uSQLConsts, ufrmPrtLabel;

{$R *.dfm}

{ TfrmProductPacking }

procedure TfrmProductPacking.SetData;
begin
  DM.DataSetQuery(adt_active, format(sQueryProductTrackingSQL,
    [' and 0=1']));
end;

procedure TfrmProductPacking.SetUI;
begin
  inherited;
  cbbPrtFormType.Items.Add('包装箱号');
  cbbPrtFormType.Items.Add('保修卡');
  cbbPrtFormType.Items.Add('装箱清单');
  cbbPrtFormType.Items.Add('订单号');
  cbbPrtFormType.Items.Add('标签');
end;

procedure TfrmProductPacking.SetAccess;
begin
  inherited;
  case gVars.CurUserLevel of
    20:
      pnlBottom.Visible := true;
    21:
      pnlBottom.Visible := true;
    22:
      pnlBottom.Visible := true;
  end;
end;

procedure TfrmProductPacking.btnQueryClick(Sender: TObject);
var
  sqlConst: string;
  adt_component: TADODataSet;
begin
  adt_component := TADODataSet.Create(nil);
  try
    if edtProductSN.Text = '' then
    begin
      ShowMessage('Please input product serial no.');
      exit;
    end;
    sqlConst := ' and ProductTrackingStatesID=3';
    sqlConst := sqlConst + ' and ProductSerialNumber=''' + trim(edtProductSN.Text) + '''';
    DM.DataSetQuery(adt_active, format(sQueryProductTrackingSQL, [sqlConst]));

    QrCountryInfo();
    {
    if RBtnDomestic.Checked then
      country := 'domestic'
    else if RBtnOverseas.Checked then
      country := 'overseas';}

    StrRec.str1 := adt_active.FieldByName('Model').AsString;
    StrRec.str2 := adt_active.FieldByName('ProductWeight').AsString;
    StrRec.str3 := adt_active.FieldByName('ProductSize').AsString;

    DM.DataSetQuery(adt_component, Format(sQueryProductComponentTrackingSQL,
      [' and ComponentSeriesID=113'
      + ' and ProductTrackingID=' + adt_active.FieldByName('ProductTrackingID').AsString]));
    StrRec.str4 := adt_component.FieldByName('ComponentSerialNumber').AsString;

    StrRec.str5 := adt_active.FieldByName('ProductSeriesChineseDesc').AsString;
    StrRec.str6 := adt_active.FieldByName('ProductSeriesDesc').AsString;
    StrRec.str7 := adt_active.FieldByName('ProductSerialNumber').AsString;

    StrRec.str8 := adt_active.FieldByName('CustomerOrderNumber').AsString;
    StrRec.str9 := adt_active.FieldByName('CustomerName').AsString;

    StrRec.str10 := adt_active.FieldByName('CustomerName').AsString;
    StrRec.str11 := adt_active.FieldByName('CustomerAddress').AsString;
    StrRec.str12 := adt_active.FieldByName('ContactPerson').AsString;
    StrRec.str13 := adt_active.FieldByName('Telephone').AsString;

    stPackge.Caption := adt_active.FieldByName('Country').AsString;
  finally
    adt_component.Free;
  end;
end;

procedure TfrmProductPacking.edtProductSNKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  ScanInfo: string;
begin
  QrCountryInfo();
  ScanInfo := trim(edtProductSN.Text);
  if (key = vk_down) or (key = 13) then
  begin
    if (ScanInfo[1] = 's') or (ScanInfo[1] = 'S') and (ScanInfo[2] = 'z')
      or (ScanInfo[2] = 'Z') and (length(ScanInfo) = 8) then
    begin
      btnQuery.SetFocus;
    end
    else
    begin
      showmessage('请输入正确的机组序列号!');
      edtProductSN.SelectAll;
    end;
  end;
end;

procedure TfrmProductPacking.QrCountryInfo;
begin
  if SameText(QrCountry(trim(edtProductSN.Text)), 'oversea') then
    RBtnOverseas.Checked := true
  else
    RBtnDomestic.Checked := true;
end;

function TfrmProductPacking.QrCountry(sn: string): string;
var
  qr: TADOQuery;
  str: string;
begin
  qr := TADOQuery.Create(nil);
  try
    qr.Connection := DM.ADOConnection1;
    qr.Close;
    qr.SQL.Clear;
    str := 'select * from ViewProductTracking'
      + ' where ProductSerialNumber=''' + sn + '''';
    qr.SQL.Add(str);
    //qr.ExecSQL;
    qr.Open;
    result := qr.FieldByName('Country').AsString;
  finally
    qr.Free;
  end;
end;

function TfrmProductPacking.checkPrinter: Boolean;
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

procedure TfrmProductPacking.PrinterPrepare;
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

procedure TfrmProductPacking.btnPrtClick(Sender: TObject);

  procedure InitalizeBoxVar(StrRecBox: TStrRec);
  begin
    if RBtnDomestic.Checked then
    begin
      AcrptUnitBox.Variants.SetVariant('ProductModel', StrRec.str1);
      AcrptUnitBox.Variants.SetVariant('ProductGross', StrRec.str2);
      AcrptUnitBox.Variants.SetVariant('FormalSize', StrRec.str3);
      AcrptUnitBox.Variants.SetVariant('CompressorCode', StrRec.str4);
      AcrptUnitBox.Variants.SetVariant('ProductCN', StrRec.str5);
      AcrptUnitBox.Variants.SetVariant('ProductEN', StrRec.str6);
      AcrptUnitBox.Variants.SetVariant('ProductCode', StrRec.str7);
      AcrptUnitBox.LoadFromFile(ExtractFilePath(ParamStr(0)) + '/FormTemplate/CUD/RptProductBox.apt');
    end
    else if RBtnOverseas.Checked then
    begin
      AcrptUnitBox.Variants.SetVariant('ProductModel', StrRec.str1);
      AcrptUnitBox.Variants.SetVariant('ProductGross', StrRec.str2);
      AcrptUnitBox.Variants.SetVariant('FormalSize', StrRec.str3);
      AcrptUnitBox.Variants.SetVariant('CompressorCode', StrRec.str4);
      AcrptUnitBox.Variants.SetVariant('ProductCN', StrRec.str5);
      AcrptUnitBox.Variants.SetVariant('ProductEN', StrRec.str6);
      AcrptUnitBox.Variants.SetVariant('ProductCode', StrRec.str7);
      AcrptUnitBox.LoadFromFile(ExtractFilePath(ParamStr(0)) + '/FormTemplate/CUD/RptOverseasProductBox.apt');
    end;
  end;

  procedure InitalizeBoxOrder;
  begin
    if RBtnDomestic.Checked then
    begin
      AcrptBoxOrderCN.LoadFromFile(ExtractFilePath(ParamStr(0)) + '/FormTemplate/CUD/RptBoxOrder.apt')
    end
    else if RBtnOverseas.Checked then
    begin
      AcrptBoxOrderEN.LoadFromFile(ExtractFilePath(ParamStr(0)) + '/FormTemplate/CUD/RptOverseasBoxOrder.apt');
    end;
  end;

  procedure InitalizeCust(StrRecOrder: TStrRec);
  begin
    if RBtnDomestic.Checked then
    begin
      AcrptWcCN.Variants.SetVariant('CustName', StrRec.str10);
      AcrptWcCN.Variants.SetVariant('address', StrRec.str11);
      AcrptWcCN.Variants.SetVariant('contact_person', StrRec.str12);
      AcrptWcCN.Variants.SetVariant('tel', StrRec.str13);
      AcrptWcCN.LoadFromFile(ExtractFilePath(ParamStr(0)) + '/FormTemplate/CUD/RptWarrentycard.apt')
    end
    else if RBtnOverseas.Checked then
    begin
      AcrptWcEN.Variants.SetVariant('CustName', StrRec.str10);
      AcrptWcEN.Variants.SetVariant('address', StrRec.str11);
      AcrptWcEN.Variants.SetVariant('contact_person', StrRec.str12);
      AcrptWcEN.Variants.SetVariant('tel', StrRec.str13);
      AcrptWcEN.LoadFromFile(ExtractFilePath(ParamStr(0)) + '/FormTemplate/CUD/RptOverseasWarrentycard.apt');
    end;
  end;

  procedure InitalizeOrder(StrRecOrder: TStrRec);
  begin
    if UpperCase(StrRec.str1) = 'ZXME-020E-TFD-302' then
      AcrptUnitOrder.Variants.SetVariant('Model2', '8403476')
    else if UpperCase(StrRec.str1) = 'ZXME-030E-TFD-302' then
      AcrptUnitOrder.Variants.SetVariant('Model2', '8403487')
    else if UpperCase(StrRec.str1) = 'ZXME-040E-TFD-302' then
      AcrptUnitOrder.Variants.SetVariant('Model2', '8403498')
    else if UpperCase(StrRec.str1) = 'ZXME-050E-TFD-302' then
      AcrptUnitOrder.Variants.SetVariant('Model2', '8403501')
    else if UpperCase(StrRec.str1) = 'ZXME-060E-TFD-302' then
      AcrptUnitOrder.Variants.SetVariant('Model2', '8403512')
    else if UpperCase(StrRec.str1) = 'ZXME-070E-TFD-302' then
      AcrptUnitOrder.Variants.SetVariant('Model2', '8403523');

    if UpperCase(Copy(StrRec.str1, 1, 3)) = 'ZX0' then
    begin
      if RBtnDomestic.Checked then
      begin
        AcrptUnitOrder.Variants.SetVariant('OrderCode', StrRec.str8);
        AcrptUnitOrder.Variants.SetVariant('CustName', StrRec.str9);
        AcrptUnitOrder.LoadFromFile(ExtractFilePath(ParamStr(0)) + '/FormTemplate/CUD/RptDomesticOrderCode.apt');
      end
      else if RBtnOverseas.Checked then
      begin
        AcrptUnitOrder.Variants.SetVariant('OrderCode', StrRec.str8);
        AcrptUnitOrder.Variants.SetVariant('CustName', StrRec.str9);
        AcrptUnitOrder.LoadFromFile(ExtractFilePath(ParamStr(0)) + '/FormTemplate/CUD/RptOverseasOrderCode.apt');
      end;
    end
    else if UpperCase(Copy(StrRec.str1, 1, 3)) = 'ZXM' then
    begin
      if RBtnOverseas.Checked then
      begin
        AcrptUnitOrder.Variants.SetVariant('OrderCode', StrRec.str8);
        AcrptUnitOrder.Variants.SetVariant('CustName', StrRec.str9);
        AcrptUnitOrder.LoadFromFile(ExtractFilePath(ParamStr(0)) + '/FormTemplate/CUD/RptOverseasOrderCode2.apt');
      end;
    end
    else
    begin
      if RBtnDomestic.Checked then
      begin
        AcrptUnitOrder.Variants.SetVariant('OrderCode', StrRec.str8);
        AcrptUnitOrder.Variants.SetVariant('CustName', StrRec.str9);
        AcrptUnitOrder.LoadFromFile(ExtractFilePath(ParamStr(0)) + '/FormTemplate/CUD/RptDomesticOrderCode.apt');
      end
      else if RBtnOverseas.Checked then
      begin
        AcrptUnitOrder.Variants.SetVariant('OrderCode', StrRec.str8);
        AcrptUnitOrder.Variants.SetVariant('CustName', StrRec.str9);
        AcrptUnitOrder.LoadFromFile(ExtractFilePath(ParamStr(0)) + '/FormTemplate/CUD/RptOverseasOrderCode.apt');
      end;
    end;
  end;

  procedure UpdateProductTrackingStates;
  var
    qr: TADOQuery;
    str: string;
  begin
    str := 'update ProductTracking';
    str := str + ' set ProductTrackingStatesID=4';
    str := str + ' where ProductSerialNumber=''' + trim(edtProductSN.Text) + '''';
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
begin
  if not checkPrinter then
    exit;
  case cbbPrtFormType.ItemIndex of
    0:
      begin
        if MessageDlg('是否预览?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          InitalizeBoxVar(StrRec);
          AcrptUnitBox.PrepareReport;
          AcrptUnitBox.Preview;
        end
        else
        begin
          InitalizeBoxVar(StrRec);
          PrinterPrepare;
          AcrptUnitBox.PrepareReport;
          AcrptUnitBox.Print;
          edtProductSN.SetFocus;
        end;
      end;
    1:
      begin
        if MessageDlg('是否预览?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          InitalizeCust(StrRec);
          if RBtnDomestic.Checked then
          begin
            AcrptWcCN.PrepareReport;
            AcrptWcCN.Preview;
          end
          else if RBtnOverseas.Checked then
          begin
            AcrptWcEN.PrepareReport;
            AcrptWcEN.Preview;
          end;
        end
        else
        begin
          UpdateProductTrackingStates;
          InitalizeCust(StrRec);
          PrinterPrepare;
          if RBtnDomestic.Checked then
          begin
            AcrptWcCN.PrepareReport;
            AcrptWcCN.Print;
          end
          else if RBtnOverseas.Checked then
          begin
            AcrptWcEN.PrepareReport;
            AcrptWcEN.Print;
          end;

          edtProductSN.SetFocus;
        end;
      end;
    2:
      begin
        if MessageDlg('是否预览?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          InitalizeBoxOrder;
          if RBtnDomestic.Checked then
          begin
            AcrptBoxOrderCN.PrepareReport;
            AcrptBoxOrderCN.Preview;
          end
          else if RBtnOverseas.Checked then
          begin
            AcrptBoxOrderEN.PrepareReport;
            AcrptBoxOrderEN.Preview;
          end;
        end
        else
        begin
          InitalizeBoxOrder;
          PrinterPrepare;
          if RBtnDomestic.Checked then
          begin
            AcrptBoxOrderCN.PrepareReport;
            AcrptBoxOrderCN.Print;
          end
          else if RBtnOverseas.Checked then
          begin
            AcrptBoxOrderEN.PrepareReport;
            AcrptBoxOrderEN.Print;
          end;
          edtProductSN.SetFocus;
        end;
      end;
    3:
      begin
        if MessageDlg('是否预览?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          InitalizeOrder(StrRec);
          AcrptUnitOrder.PrepareReport;
          AcrptUnitOrder.Preview;
        end
        else
        begin
          InitalizeOrder(StrRec);
          PrinterPrepare;
          AcrptUnitOrder.PrepareReport;
          AcrptUnitOrder.Print;
          edtProductSN.SetFocus;
        end;
      end;
    4:
      begin
        TfrmPrtLabel.Execute(StrRec);
      end;
  end;
end;

function TfrmProductPacking.GetLabelInfro: TStrRec;
begin
  if SameText(QrCountry(trim(edtProductSN.Text)), 'oversea') then
    RBtnOverseas.Checked := true
  else
    RBtnDomestic.Checked := true;
end;

end.

