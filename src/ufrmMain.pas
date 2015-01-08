unit ufrmMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ImgList, StdActns, ActnList, ADODB, ShellAPI, StdCtrls,
  ExtCtrls, IniFiles;

const
 // WM_ICONTRAY = WM_USER + $00001;
  WM_MYCALL = WM_USER + $00001; //自定义消息
type
  TfrmMain = class(TForm)
    ImageList: TImageList;
    MainMenu1: TMainMenu;
    MenuSystem: TMenuItem;
    MenuUser: TMenuItem;
    MenuExit: TMenuItem;
    MenuScheduler: TMenuItem;
    MenuModel: TMenuItem;
    MenuWarehouse: TMenuItem;
    mmiWindows: TMenuItem;
    MinimizeAll1: TMenuItem;
    MenuHelp: TMenuItem;
    MenuCS: TMenuItem;
    MenuAddNewOrder: TMenuItem;
    MenuBasic: TMenuItem;
    MenuPrice: TMenuItem;
    MenuCustomerOrderProcess: TMenuItem;
    MenuCSN2: TMenuItem;
    MenuCustomerOrder: TMenuItem;
    MenuCustomer: TMenuItem;
    MenuCommunicator: TMenuItem;
    MenuForwarder: TMenuItem;
    MenuPlant: TMenuItem;
    MenuSales: TMenuItem;
    MenuOP: TMenuItem;
    MenuProductTracking: TMenuItem;
    MenuProductionScheduling: TMenuItem;
    MenuOPN1: TMenuItem;
    MenuProduct: TMenuItem;
    MenuDelivery: TMenuItem;
    MenuModelParameterCUD: TMenuItem;
    MenuShippingSche: TMenuItem;
    MenuCustomerOrderZXXJZB: TMenuItem;
    MenuProduct2: TMenuItem;
    MenuPrintParameterCUD: TMenuItem;
    ActionList1: TActionList;
    WindowClose1: TWindowClose;
    WindowCascade1: TWindowCascade;
    WindowTileHorizontal1: TWindowTileHorizontal;
    WindowTileVertical1: TWindowTileVertical;
    WindowMinimizeAll1: TWindowMinimizeAll;
    WindowArrange1: TWindowArrange;
    Arrange1: TMenuItem;
    Cascade1: TMenuItem;
    MenuComponentSeries: TMenuItem;
    MenuComponent: TMenuItem;
    MenuBOM: TMenuItem;
    MenuExchangeRate: TMenuItem;
    MenuFiscalCalendar: TMenuItem;
    MenuLogisticAndTrading: TMenuItem;
    MenuQueryTradingOrder: TMenuItem;
    MenuProcessTradingOrder: TMenuItem;
    MenuCountry: TMenuItem;
    MenuFilesImport: TMenuItem;
    N2: TMenuItem;
    MenuTradingReceivingSchedule: TMenuItem;
    MenuLogisticIn: TMenuItem;
    MenuQueryDMMReport: TMenuItem;
    MenuTradingModelInventory: TMenuItem;
    N1: TMenuItem;
    MenuQueryDMMForCS: TMenuItem;
    MenuProcessDMM: TMenuItem;
    MenuCustomerOrderShipment: TMenuItem;
    MenuDeliveryTracking: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MenuExitClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure MenuUserClick(Sender: TObject);

    procedure MenuSalesClick(Sender: TObject);
    procedure MenuPriceClick(Sender: TObject);
    procedure MenuAddNewOrderClick(Sender: TObject);
    procedure MenuCustomerOrderProcessClick(Sender: TObject);
    procedure MenuCustomerOrderClick(Sender: TObject);
    procedure MenuCustomerClick(Sender: TObject);
    procedure MenuCommunicatorClick(Sender: TObject);
    procedure MenuForwarderClick(Sender: TObject);
    procedure MenuPlantClick(Sender: TObject);

    procedure MenuModelClick(Sender: TObject);
    procedure MenuProductTrackingClick(Sender: TObject);
    procedure MenuProductionSchedulingClick(Sender: TObject);
    procedure MenuProductClick(Sender: TObject);
    procedure MenuDeliveryClick(Sender: TObject);
    procedure MenuModelParameterCUDClick(Sender: TObject);
    procedure MenuShippingScheClick(Sender: TObject);
    procedure MenuCustomerOrderZXXJZBClick(Sender: TObject);
    procedure MenuProduct2Click(Sender: TObject);
    procedure MenuPrintParameterCUDClick(Sender: TObject);
    procedure MenuComponentSeriesClick(Sender: TObject);
    procedure MenuComponentClick(Sender: TObject);
    procedure MenuBOMClick(Sender: TObject);
    procedure MenuFiscalCalendarClick(Sender: TObject);
    procedure MenuQueryTradingOrderClick(Sender: TObject);
    procedure MenuProcessTradingOrderClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MenuCountryClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure MenuFilesImportClick(Sender: TObject);
    procedure MenuTradingReceivingScheduleClick(Sender: TObject);
    procedure MenuLogisticInClick(Sender: TObject);
    procedure MenuQueryDMMReportClick(Sender: TObject);
    procedure MenuTradingModelInventoryClick(Sender: TObject);
    procedure MenuQueryDMMForCSClick(Sender: TObject);
    procedure MenuProcessDMMClick(Sender: TObject);
    procedure MenuCustomerOrderShipmentClick(Sender: TObject);
    procedure MenuDeliveryTrackingClick(Sender: TObject);
    procedure MenuExchangeRateClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses uDlgLogin, uMJ, ufrmUser, ufrmModel, DataModule, ufrmReasonOfDelay, ufrmPlant, ufrmCustomer,
  ufrmCustomerOrderProcess, ufrmAddCustomerOrder, ufrmCustomerOrder, ufrmForwarder,
  ufrmPrice, ufrmSales, ufrmCommunicator, ufrmProductTracking, ufrmProductionScheduling,
  ufrmProduct, ufrmDelivery, ufrmModelParameterCUD, ufrmShippingSchedule, ufrmCustomerOrderRef,
  ufrmProduct2, ufrmPrtCUDParameterLog,
  ufrmBillOfMaterials, ufrmComponent, ufrmComponentSeries,
  ufrmFiscalCalendar, ufrmQueryTradingOrder, ufrmProcessTradingOrder,
  ufrmCountry, uDMManager, uDMEntity, ufrmFileImportConfiguration,
  ufrmTradingOrderProcess, ufrmTradingReceivingSchedule, ufrmLogisticIn,
   ufrmQueryDMMReport, ufrmQueryDMMForCS,
  ufrmProcessDMM, ufrmCustomerOrderShipment, ufrmDeliveryTracking,
  ufrmExchangeRate;

{$R *.dfm}

procedure TfrmMain.FormCreate(Sender: TObject);
{const
  InfoNum = 9;
  InfoStr: array[1..InfoNum] of string = (
    'ProductName',
    'ProductVersion',
    'FileDescription',
    'LegalCopyright',
    'FileVersion',
    'CompanyName',
    'LegalTradeMarks',
    'InternalName',
    'OriginalFileName'
    );  }
var
  fn: string; {
  S: string;
  BufSize, Len: DWORD;
  Buf: PChar;
  Value: PChar; }
begin
  FormStyle := fsMDIForm;
  WindowState := wsMaximized;

  fn := ChangeFileExt(ParamStr(0), '.ini');
  if not fileexists(fn) then
  begin
    showmessage('The config file "' + fn + '" is not exist.');
    application.Terminate;
  end; {
  S := Application.ExeName;
  BufSize := GetFileVersionInfoSize(PChar(S), BufSize);
  if BufSize > 0 then
  begin
    Buf := AllocMem(BufSize);
    GetFileVersionInfo(PChar(S), 0, BufSize, Buf);
    if VerQueryValue(Buf, PChar('StringFileInfo\080403A8\' + InfoStr[5]), Pointer(Value), Len) then
    begin
      frmMain.Caption := ApplicationName; //+ Value;
      Application.Title := frmMain.Caption;
    end;
  end; }
  objCurUser := TCurUserInfo.Create;

  mjOpenForm(TLoginDlg, frmMain, true);
  mjDisabledMenu(self);
  DM.GetUserPurviewMenu(objCurUser.LoginID);

  if objCurUser.LoginName = '' then
  begin
    application.Terminate; //退出
  end
  else
  begin
    Caption := application.Title + mjGetBuildInfo
      + '--(User: ' + objCurUser.DisplayName
      + ' / Plant: ' + objCurUser.PlantCode
      + ' / Application: ' + objCurUser.BusinessApplicationName
      + ')';
    objCurUser.CurState := true; //登陆
    mmiWindows.Visible := true;
    MinimizeAll1.Visible := true;
    Arrange1.Visible := true;
    Cascade1.Visible := true;
  end;
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  objCurUser.Free;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  if objCurUser.AccessLevel = 21 then
  begin
 //   BorderStyle := bsSingle;
    MenuOP.Visible := false;
    MenuSystem.Visible := false;
    mmiWindows.Visible := false;
    MenuProductTracking.Click;
  end;
end;

procedure TfrmMain.MenuExitClick(Sender: TObject);
begin
  close();
end;

procedure TfrmMain.FormResize(Sender: TObject);
begin
  Self.Repaint;
end;

procedure TfrmMain.MenuAddNewOrderClick(Sender: TObject);
begin
  mjOpenForm(TfrmAddCustomerOrder, self);
end;

procedure TfrmMain.MenuCustomerOrderProcessClick(Sender: TObject);
begin
  mjOpenForm(TfrmCustomerOrderProcess, self);
end;

procedure TfrmMain.MenuCustomerOrderClick(Sender: TObject);
begin
  mjOpenForm(TfrmCustomerOrder, self);
end;

procedure TfrmMain.MenuCustomerClick(Sender: TObject);
begin
  mjOpenForm(TfrmCustomer, self);
end;

procedure TfrmMain.MenuPriceClick(Sender: TObject);
begin
  mjOpenForm(TfrmPrice, self);
end;

procedure TfrmMain.MenuCommunicatorClick(Sender: TObject);
begin
  mjOpenForm(TfrmCommunicator, self);
end;

procedure TfrmMain.MenuForwarderClick(Sender: TObject);
begin
  mjOpenForm(TfrmForwarder, self);
end;

procedure TfrmMain.MenuPlantClick(Sender: TObject);
begin
  mjOpenForm(TfrmPlant, self);
end;

procedure TfrmMain.MenuSalesClick(Sender: TObject);
begin
  mjOpenForm(TfrmSales, self);
end;

procedure TfrmMain.MenuModelClick(Sender: TObject);
begin
  mjOpenForm(TfrmModel, self);
end;

procedure TfrmMain.MenuUserClick(Sender: TObject);
begin
  mjOpenForm(TfrmUser, self);
end;

procedure TfrmMain.MenuDeliveryClick(Sender: TObject);
begin
  mjOpenForm(TfrmDelivery, self);
end;

procedure TfrmMain.MenuProductionSchedulingClick(Sender: TObject);
begin
  mjOpenForm(TfrmProductionScheduling, self);
end;

procedure TfrmMain.MenuProductTrackingClick(Sender: TObject);
begin
  mjOpenForm(TfrmProductTracking, self);
end;

procedure TfrmMain.MenuProductClick(Sender: TObject);
begin
  mjOpenForm(TfrmProduct, self);
end;

procedure TfrmMain.MenuModelParameterCUDClick(Sender: TObject);
begin
  mjOpenForm(TfrmModelParameterCUD, self);
end;

procedure TfrmMain.MenuShippingScheClick(Sender: TObject);
begin
  mjOpenForm(TfrmShippingSchedule, self);
end;

procedure TfrmMain.MenuCustomerOrderZXXJZBClick(Sender: TObject);
begin
  mjOpenForm(TfrmCustomerOrderRef, self);
end;

procedure TfrmMain.MenuProduct2Click(Sender: TObject);
begin
  mjOpenForm(TfrmProduct2, self);
end;

procedure TfrmMain.MenuPrintParameterCUDClick(Sender: TObject);
begin
  mjOpenForm(TfrmPrtCUDParameterLog, self);
end;

procedure TfrmMain.MenuComponentSeriesClick(Sender: TObject);
begin
  mjOpenForm(TfrmComponentSeries, self);
end;

procedure TfrmMain.MenuComponentClick(Sender: TObject);
begin
  mjOpenForm(TfrmComponent, self);
end;

procedure TfrmMain.MenuBOMClick(Sender: TObject);
begin
  mjOpenForm(TfrmBillOfMaterials, self)
end;

procedure TfrmMain.MenuFiscalCalendarClick(Sender: TObject);
begin
  mjOpenForm(TfrmFiscalCalendar, self);
end;

procedure TfrmMain.MenuProcessTradingOrderClick(Sender: TObject);
begin
  mjOpenForm(TfrmTradingOrderProcess, self);
end;

procedure TfrmMain.MenuQueryTradingOrderClick(Sender: TObject);
begin
  mjOpenForm(TfrmQueryTradingOrder, self);
end;

procedure TfrmMain.MenuCountryClick(Sender: TObject);
begin
  mjOpenForm(TfrmCountry, self);
end;

procedure TfrmMain.MenuFilesImportClick(Sender: TObject);
begin
  mjOpenForm(TfrmFileImportConfiguration, self);
end;

procedure TfrmMain.MenuTradingReceivingScheduleClick(Sender: TObject);
begin
  mjOpenForm(TfrmTradingReceivingSchedule, self);
end;

procedure TfrmMain.MenuLogisticInClick(Sender: TObject);
begin
  mjOpenForm(TfrmLogisticIn, self);
end;

procedure TfrmMain.MenuQueryDMMReportClick(Sender: TObject);
begin
  mjOpenForm(TfrmQueryDMMReport, self);
end;

procedure TfrmMain.MenuTradingModelInventoryClick(Sender: TObject);
begin
//  mjOpenForm(TfrmTradingModelInventory, self);
end;

procedure TfrmMain.MenuQueryDMMForCSClick(Sender: TObject);
begin
  mjOpenForm(TfrmQueryDMMForCS, self);
end;

procedure TfrmMain.MenuProcessDMMClick(Sender: TObject);
begin
  mjOpenForm(TfrmProcessDMM, self);
end;

procedure TfrmMain.MenuCustomerOrderShipmentClick(Sender: TObject);
begin
  mjOpenForm(TfrmCustomerOrderShipment, self);
end;

procedure TfrmMain.MenuDeliveryTrackingClick(Sender: TObject);
begin
  mjOpenForm(TfrmDeliveryTracking, self);
end;

procedure TfrmMain.MenuExchangeRateClick(Sender: TObject);
begin
  mjOpenForm(TfrmExchangeRate, self);
end;

end.

