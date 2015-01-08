unit uMainframeCustomerOrder;

interface

uses
  SysUtils, Classes, IniFiles, MainframeOLE, uMJ, Controls, Dialogs, strutils, uDMManager, uDMEntity;

type
  TMainframeCustomerOrder = class
    constructor Create; virtual;
    destructor Destroy; override;
  private
    MainframeOLE1: TMainframeOLE;
    objCO: TCustomerOrder;
  public
    mfLogin, mfPassword, mfInitial, mfPlant, IS02SalesOffice38, IS02SalesOffice72, IS02SalesOffice8F: string;
    procedure AddLog(Str: string);
    function MainframeGetScreenAllData: string;
    function MainframeLogin(mfLogin, mfPassword: string): Boolean;
    function MainframeScreenSelect(mainframeScreen: string): Boolean;
    procedure MainframeScreenForward;
    function MainframeScreenReadRow(row, rowFrom, rowTo: integer): string;
    //ORDM
    procedure ORDMAddNewOrder(objCO: TCustomerOrder; mfPassword, mfInitial, orderNumHeader,
      custNum, PlantCode, custPONum, custName, rtd, model, priceInput: string; orderQty: integer);
    function ORDMChangeOrder(mfPassword, mfInitial, orderNum, custNum, PlantCode,
      custPONum, custName, rtd, model, priceInput: string; orderQty: integer): Boolean;
    procedure ORDMExitToMainScreen;
    function ORDMDeleteMasterOrder(coNum, custNum, PlantCode, mfInitial, mfPassword: string): Boolean;
    //IS02
    function IS02Login(mfInitial, selection: string; plantID: Integer): Boolean;
    function IS02AddExistingMNumber(custNum, rtd, shipVIA, custPONum, MNumber: string): Boolean;
    function IS02AddMasterOrder(custNum, rtd, shipVIA, custPONum: string): string;
    function IS02AddNewItems(model, ups, pt, bkt, priceInput: string;
      orderQty: Double; row: integer; IsEndOfData: Boolean): Boolean;
    procedure IS02ReadAllOrderNumber(slData: TStringList);
    procedure IS02ReadAllOrderNumberJustNewAdded(slData: TStringList; OrderCount: integer);
    function IS02ChangeMasterOrder(coNum, model, custPONum, rtd: string;
      qty: integer; price: double): Boolean;
    function IS02DeleteMasterOrder(coNum: string): Boolean;
    function IS02DownloadMasterOrder(mNum: string): Boolean;
    procedure IS02ExitToMainScreen;
    //OINQ
    function OINQInQueryMenu(custNum: string): Boolean;
    function OINQReadOrderReleasedQty(slData: TStringList): Boolean;
    procedure OINQExitToMainScreen;
    //SPLN
    function SPLNLogin(mfPlant, mfInitial, mfPassword: string): Boolean;
    function SPLNAddMasterOrder(custNo: string): string;
    procedure SPLNAddNewItems(row: integer; actualReleaseCOQuantity: string);
    function SPLNNewItemsGetCurrentPage: string;
    function SPLNNewItemsGetTotalPage: string;
    function SPLNNewItemsReadOrderNumber(row: integer): string;
    function SPLNAddOrderAttach(pieces, freightCost: string): Boolean;
    function ShipOrderAtSPLN(InvoiceNum, ATD, carriage, freightCost: string): Boolean;
    function SPLNChangeFreightCost(InvoiceNo: string; FreightCost: double): Boolean;
    function SPLNDeleteInvoice(InvoiceNumber, CustomerNumber: string): Boolean;
    procedure SPLNExitToMainScreen;
  end;


implementation


{ TMfCO }

constructor TMainframeCustomerOrder.Create;
var
  r: TIniFile;
begin
  MainframeOLE1 := TMainframeOLE.Create(nil);
  r := TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini'));
  mainframeole1.SessionName := r.ReadString('Setting', 'SessionName', '');
  mainframeole1.WaitTime := r.ReadInteger('Setting', 'WaitTime', 4000);
  IS02SalesOffice38 := r.ReadString('Setting', 'IS02SalesOffice38', '');
  IS02SalesOffice72 := r.ReadString('Setting', 'IS02SalesOffice72', '');
  IS02SalesOffice8F := r.ReadString('Setting', 'IS02SalesOffice8F', '');
end;

destructor TMainframeCustomerOrder.Destroy;
begin
  MainframeOLE1.free;
  inherited;
end;

function TMainframeCustomerOrder.MainframeLogin(mfLogin, mfPassword: string): Boolean;

  procedure LoginPhase1;
  begin
    mainframeOle1.Sendkeys('A<Enter>');
    mainframeOle1.WaithostQuiet;
  end;

  procedure LoginPhase2;
  begin
    MainframeOLE1.Moveto(7, 24);
    mainframeOle1.Sendkeys(mfLogin);
    MainframeOLE1.Moveto(9, 24);
    mainframeOle1.Sendkeys(mfPassword + '<Enter>');
    mainframeOle1.WaithostQuiet;
  end;
begin
  if (trim(MainframeOLE1.GetString(3, 1, 80)) = 'A - MOST BUSINESS SYSTEMS (CICSP1)') then
  begin
    LoginPhase1;
    if (trim(MainframeOLE1.GetString(5, 1, 80)) = 'Type your userid and password, then press ENTER:') then
    begin
      LoginPhase2;
      if (trim(MainframeOLE1.GetString(3, 25, 28)) = 'EMERSON CLIMATE TECHNOLOGIES') then
        Result := true
      else
        Result := false;
    end
    else
      Result := false;
  end
  else if (trim(MainframeOLE1.GetString(5, 1, 80)) = 'Type your userid and password, then press ENTER:') then
  begin
    LoginPhase2;
    if (trim(MainframeOLE1.GetString(3, 25, 28)) = 'EMERSON CLIMATE TECHNOLOGIES') then
      Result := true
    else
      Result := false;
  end
  else if (trim(MainframeOLE1.GetString(3, 25, 28)) = 'EMERSON CLIMATE TECHNOLOGIES') then
    Result := true
  else
    Result := true;
end;

function TMainframeCustomerOrder.MainframeScreenSelect(mainframeScreen: string): Boolean;
begin
  //SelectScreen
  if (trim(MainframeOLE1.GetString(3, 20, 40)) = 'EMERSON CLIMATE TECHNOLOGIES')
    or (MainframeGetScreenAllData = '') then
  begin
    mainframeOle1.Sendkeys(mainframeScreen + '<Enter>');
    mainframeOle1.WaithostQuiet;
    if trim(MainframeOLE1.GetString(3, 20, 40)) = 'EMERSON CLIMATE TECHNOLOGIES' then
      result := false
    else
      result := true;
  end
  else
    result := true;
end;

procedure TMainframeCustomerOrder.MainframeScreenForward;
begin
  mainframeOle1.Sendkeys('<PF8>');
  mainframeOle1.WaithostQuiet;
end;

function TMainframeCustomerOrder.MainframeGetScreenAllData: string;
var
  ScrData: string;
  r: integer;
begin
  for r := 4 to 22 do
  begin
    if (Trim(MainframeOLE1.GetString(r, 1, 80)) <> '') then
      ScrData := ScrData + Trim(MainframeOLE1.GetString(r, 1, 80));
  end;
  result := ScrData;
end;

procedure TMainframeCustomerOrder.ORDMAddNewOrder(objCO: TCustomerOrder; mfPassword, mfInitial,
  orderNumHeader, custNum, PlantCode, custPONum, custName,
  rtd, model, priceInput: string; orderQty: integer);
var
  orderNumber: string;
begin
  orderNumber := '';
  if trim(MainframeOLE1.GetString(1, 22, 41)) <> 'COPELAND CUSTOMER ORDER ENTRY/MAINTENANCE' then
    exit;
  MainframeOLE1.Moveto(19, 15);
  mainframeOle1.Sendkeys(orderNumHeader + '       ');
  MainframeOLE1.Moveto(19, 48);
  mainframeOle1.Sendkeys(custNum);
  MainframeOLE1.Moveto(20, 29);
  mainframeOle1.Sendkeys(mfInitial);
  MainframeOLE1.Moveto(20, 50);
  mainframeOle1.Sendkeys(PlantCode);
  MainframeOLE1.Moveto(20, 69);
  mainframeOle1.Sendkeys(mfPassword);
  mainframeOle1.Sendkeys('<PF4>');
  mainframeOle1.WaithostQuiet;
  if trim(MainframeOLE1.GetString(1, 22, 33)) <> 'COPELAND CUSTOMER NEW ORDER ENTRY' then
    exit;
  orderNumber := trim(MainframeOLE1.GetString(2, 19, 6));
  if orderNumber = '' then
    exit;
  MainframeOLE1.Moveto(3, 13);
  mainframeOle1.Sendkeys(copy(custPONum, 1, 13));
  MainframeOLE1.Moveto(4, 31);
  mainframeOle1.Sendkeys('n');
  MainframeOLE1.Moveto(13, 24);
  mainframeOle1.Sendkeys(model);
  MainframeOLE1.Moveto(14, 24);
  mainframeOle1.Sendkeys(custName);
  MainframeOLE1.Moveto(15, 24);
  mainframeOle1.Sendkeys(custPONum);
  mainframeOle1.Sendkeys('<PF6>');
  mainframeOle1.WaithostQuiet;
  if trim(MainframeOLE1.GetString(5, 2, 80)) <> '--QTY-- --COPELAND ITEM-- DUPL  ---PRICE-- ACCT NO     ADD CMTS         ACK-DT' then
    exit;
  MainframeOLE1.Moveto(1, 63);
  mainframeOle1.Sendkeys(rtd);
  if trim(MainframeOLE1.GetString(3, 18, 5)) = '' then
  begin
    MainframeOLE1.Moveto(3, 18);
    mainframeOle1.Sendkeys('TRUCK');
  end;
  MainframeOLE1.Moveto(6, 2);
  mainframeOle1.Sendkeys(IntToStr(orderQty));
  MainframeOLE1.Moveto(6, 10);
  mainframeOle1.Sendkeys(model);
  mainframeOle1.Sendkeys('<TAB>');
  mainframeOle1.Sendkeys('<Enter>');
  mainframeOle1.WaithostQuiet;
  if trim(MainframeOLE1.GetString(21, 2, 38)) = 'MESSAGES- **WARNING-REQ DT PRIOR TO TODAY: PF20 = ACCEPT,   PF22 = USE TODAY' then
  begin
    mainframeOle1.Sendkeys('<PF20>');
    mainframeOle1.WaithostQuiet;
  end;
  if (StrToFloat(trim(MainframeOLE1.GetString(6, 34, 10))) = 0)
    or (LowerCase(custNum) = 'c8qn') then
  begin
    MainframeOLE1.Moveto(6, 34);
    if LowerCase(priceInput) = 'nc' then
      mainframeOle1.Sendkeys(priceInput)
    else
    begin
      if PlantCode = '38' then
      begin
        if stringreplace(trim(MainframeOLE1.GetString(6, 34, 10)), ',', '', [rfreplaceall]) <> priceInput then
        begin
          if MessageDlg('Mainframe Price and LiveOrder Price is different, Use LiveOrder Price?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
          begin
            mainframeOle1.Sendkeys(FormatFloat('0000000.00', StrToFloat(priceInput)));
          end;
        end;
      end
      else
        mainframeOle1.Sendkeys(FormatFloat('0000000.00', StrToFloat(priceInput)));
    end;
  end;
  {
  if LowerCase(priceInput) = 'nc' then
  begin
    try
      MainframeOLE1.Moveto(6, 34);
      mainframeOle1.Sendkeys(priceInput);
    finally
    end;
  end
  else
  begin
    MainframeOLE1.Moveto(6, 34);
    mainframeOle1.Sendkeys(priceInput);
  end;    }
  mainframeOle1.Sendkeys('<PF4>');
  mainframeOle1.WaithostQuiet;
  if trim(MainframeOLE1.GetString(21, 2, 38)) = 'MESSAGES- MODEL OBSOLETE' then
  begin
    mainframeOle1.Sendkeys('<PF3>');
    mainframeOle1.WaithostQuiet;
    mainframeOle1.Sendkeys('<PF3>');
    mainframeOle1.WaithostQuiet;
    mainframeOle1.Sendkeys('<PF3>');
    mainframeOle1.WaithostQuiet;
    mainframeOle1.Sendkeys('cssf');
    mainframeOle1.WaithostQuiet;
    mainframeOle1.Sendkeys('<ENTER>');
    mainframeOle1.WaithostQuiet;
    orderNumber := 'n';
  end;
  if trim(MainframeOLE1.GetString(21, 2, 38)) = 'MESSAGES- THIS CUST/ITEM/REQ DT ON ORD' then
  begin
    MainframeOLE1.Moveto(6, 30);
    mainframeOle1.Sendkeys('Y');
    mainframeOle1.Sendkeys('<PF4>');
    mainframeOle1.WaithostQuiet;
  end;
  if trim(MainframeOLE1.GetString(21, 1, 80)) = 'MESSAGES- **WARNING-REQ DT PRIOR TO TODAY: PF20 = ACCEPT,   PF22 = USE TODAY' then
  begin
    mainframeOle1.Sendkeys('<PF4>');
    mainframeOle1.WaithostQuiet;
  end;
  {
  if (trim(MainframeOLE1.GetString(7, 16, 15)) <> 'NOT AVAILABLE')
    or (trim(MainframeOLE1.GetString(7, 16, 15)) = '') then
  begin
    MainframeOLE1.Moveto(7, 16);
    mainframeOle1.Sendkeys(model);
    MainframeOLE1.Moveto(8, 16);
    mainframeOle1.Sendkeys(model);
  end;}
  if (trim(MainframeOLE1.GetString(1, 22, 45)) <> 'COPELAND CUSTOMER ORDER ENTRY/MAINTENANCE')
    and (orderNumber <> 'n') then
    exit;
  objCO.CustomerOrderNumber := orderNumber;
end;

function TMainframeCustomerOrder.ORDMChangeOrder(mfPassword, mfInitial, orderNum, custNum,
  PlantCode, custPONum, custName, rtd, model, priceInput: string; orderQty: integer): Boolean;
begin
  if trim(MainframeOLE1.GetString(1, 22, 41)) <> 'COPELAND CUSTOMER ORDER ENTRY/MAINTENANCE' then
    Result := false
  else
  begin
    MainframeOLE1.Moveto(19, 15);
    mainframeOle1.Sendkeys(orderNum);
    MainframeOLE1.Moveto(19, 48);
    mainframeOle1.Sendkeys(custNum);
    MainframeOLE1.Moveto(20, 29);
    mainframeOle1.Sendkeys(mfInitial);
    MainframeOLE1.Moveto(20, 50);
    mainframeOle1.Sendkeys(PlantCode);
    MainframeOLE1.Moveto(20, 69);
    mainframeOle1.Sendkeys(mfPassword);
    mainframeOle1.Sendkeys('<PF5>');
    mainframeOle1.WaithostQuiet;
    if (trim(MainframeOLE1.GetString(5, 2, 80)) <> '--QTY-- --COPELAND ITEM-- DUPL  ---PRICE-- ACCT NO     ADD CMTS         ACK-DT')
      or (trim(MainframeOLE1.GetString(1, 24, 6)) <> orderNum) then
      Result := false
    else
    begin
      if trim(MainframeOLE1.GetString(1, 41, 13)) <> custPONum then
      begin
        MainframeOLE1.Moveto(1, 41);
        mainframeOle1.Sendkeys(custPONum);
      end;
      if trim(MainframeOLE1.GetString(1, 64, 6)) <> rtd then
      begin
        MainframeOLE1.Moveto(1, 64);
        mainframeOle1.Sendkeys(rtd);
      end;
      if trim(MainframeOLE1.GetString(6, 2, 7)) <> Format('%.7d', [orderQty]) then
      begin
        MainframeOLE1.Moveto(6, 2);
        mainframeOle1.Sendkeys(Format('%.7d', [orderQty]));
      end;
      if trim(MainframeOLE1.GetString(6, 10, 17)) <> model then
      begin
        MainframeOLE1.Moveto(6, 10);
        mainframeOle1.Sendkeys(model);
      end;
      if stringreplace(trim(MainframeOLE1.GetString(6, 34, 10)), ',', '', [rfreplaceall]) <> priceInput then
      begin
        if MessageDlg('Mainframe Price and LiveOrder Price is different, Use LiveOrder Price?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          MainframeOLE1.Moveto(6, 34);
          mainframeOle1.Sendkeys(FormatFloat('0000000.00', StrToFloat(priceInput)));
        end;
      end;
      mainframeOle1.Sendkeys('<PF4>');
      mainframeOle1.WaithostQuiet;
      if trim(MainframeOLE1.GetString(21, 1, 80)) = 'MESSAGES- **WARNING-REQ DT PRIOR TO TODAY: PF20 = ACCEPT,   PF22 = USE TODAY' then
      begin
        mainframeOle1.Sendkeys('<PF22>');
        mainframeOle1.WaithostQuiet;
      end;
      if trim(MainframeOLE1.GetString(21, 2, 38)) = 'MESSAGES- THIS CUST/ITEM/REQ DT ON ORD' then
      begin
        MainframeOLE1.Moveto(6, 30);
        mainframeOle1.Sendkeys('Y');
        mainframeOle1.Sendkeys('<PF4>');
        mainframeOle1.WaithostQuiet;
      end;
      if trim(MainframeOLE1.GetString(2, 2, 24)) = 'COPELAND ORDER # ' + orderNum then
      begin
        if trim(MainframeOLE1.GetString(3, 13, 13)) <> custPONum then
        begin
          MainframeOLE1.Moveto(3, 13);
          mainframeOle1.Sendkeys(custPONum);
        end;
        if trim(MainframeOLE1.GetString(13, 24, 20)) <> model then
        begin
          MainframeOLE1.Moveto(13, 24);
          mainframeOle1.Sendkeys(model);
        end;
        if trim(MainframeOLE1.GetString(15, 24, 20)) <> custPONum then
        begin
          MainframeOLE1.Moveto(15, 24);
          mainframeOle1.Sendkeys(custPONum);
        end;
      end;
      mainframeOle1.Sendkeys('<PF4>');
      mainframeOle1.WaithostQuiet;
      if (trim(MainframeOLE1.GetString(1, 22, 45)) <> 'COPELAND CUSTOMER ORDER ENTRY/MAINTENANCE') then
        Result := false
      else
        Result := true;
    end;
  end;
end;

function TMainframeCustomerOrder.ORDMDeleteMasterOrder(coNum, custNum,
  PlantCode, mfInitial, mfPassword: string): Boolean;
begin
  if trim(MainframeOLE1.GetString(1, 22, 41)) <> 'COPELAND CUSTOMER ORDER ENTRY/MAINTENANCE' then
    Result := false
  else
  begin
    MainframeOLE1.Moveto(19, 15);
    mainframeOle1.Sendkeys(coNum);
    MainframeOLE1.Moveto(19, 48);
    mainframeOle1.Sendkeys(custNum);
    MainframeOLE1.Moveto(20, 29);
    mainframeOle1.Sendkeys(mfInitial);
    MainframeOLE1.Moveto(20, 50);
    mainframeOle1.Sendkeys(PlantCode);
    MainframeOLE1.Moveto(20, 69);
    mainframeOle1.Sendkeys(mfPassword);
    mainframeOle1.Sendkeys('<PF2>');
    mainframeOle1.WaithostQuiet;
    if trim(MainframeOLE1.GetString(21, 25, 20)) <> 'HAS BEEN DELETED.' then
      Result := false
    else
      Result := true;
  end;
end;

procedure TMainframeCustomerOrder.ORDMExitToMainScreen;
begin
  if (trim(MainframeOLE1.GetString(1, 22, 45)) = 'COPELAND CUSTOMER ORDER ENTRY/MAINTENANCE') then
  begin
    mainframeOle1.Sendkeys('<PF3>');
    mainframeOle1.WaithostQuiet;
    mainframeOle1.Sendkeys('cssf');
    mainframeOle1.WaithostQuiet;
    mainframeOle1.Sendkeys('<ENTER>');
    mainframeOle1.WaithostQuiet;
  end;
end;

function TMainframeCustomerOrder.OINQInQueryMenu(custNum: string): Boolean;
begin
  if (trim(MainframeOLE1.GetString(1, 28, 27)) <> 'CUSTOMER ORDER INQUIRY MENU') then
    result := false
  else
  begin
    MainframeOLE1.Moveto(17, 33);
    mainframeOle1.Sendkeys(custNum);
    mainframeOle1.Sendkeys('<PF10>');
    mainframeOle1.WaithostQuiet;

    if (trim(MainframeOLE1.GetString(1, 22, 42)) <> 'OKAY TO SHIP SUMMARY BY CUST NO.   PAGE N') then
      result := false
    else
      result := true;
  end;
end;

function TMainframeCustomerOrder.OINQReadOrderReleasedQty(
  slData: TStringList): Boolean;
var
  j: integer;

  procedure ReadCOInfo(var j: integer; slData: TStringList);
  var
    i: integer;
   // test: string;
  begin
    for i := 5 to 21 do
    begin
      if trim(MainframeOLE1.GetString(i, 1, 79)) <> '' then
      begin
        objCO := TCustomerOrder.Create;
        objCO.CustomerOrderNumber := trim(MainframeOLE1.GetString(i, 7, 6));
        if trim(MainframeOLE1.GetString(i, 37, 4)) = '' then
          objCO.OINQCOQuantity := 0
        else
          objCO.OINQCOQuantity := StrToInt(trim(MainframeOLE1.GetString(i, 37, 4)));
        if trim(MainframeOLE1.GetString(i, 44, 4)) = '' then
          objCO.OINQReleaseCOQuantity := 0
        else
          objCO.OINQReleaseCOQuantity := StrToInt(trim(MainframeOLE1.GetString(i, 44, 4)));

        slData.AddObject(IntToStr(j), objCO);
        //test := TCustomerOrder(slData.Objects[j]).CustomerOrderNumber;
        j := j + 1;
      end
      else
        Break;
    end;
  end;
begin
  j := 0;
  while true do
  begin
    ReadCOInfo(j, slData);
    if (trim(MainframeOLE1.GetString(22, 1, 50)) = '**PRESS PF8   FOR MORE ORDERS**') then
    begin
      mainframeOle1.Sendkeys('<PF8>');
      mainframeOle1.WaithostQuiet;
    end
    else if (trim(MainframeOLE1.GetString(22, 1, 50)) = '*PAGE DOWN KEY-PF8 NOT ACTIVE ON LAST PAGE*')
      or (trim(MainframeOLE1.GetString(22, 1, 50)) = '*****  NO MORE ORDERS  *****')
      or (trim(MainframeOLE1.GetString(22, 1, 50)) = '') then
    begin
      //ReadCOInfo(j, slData);
      Break;
    end
    else
      Break;
  end;

  if (trim(MainframeOLE1.GetString(22, 1, 50)) = '*PAGE DOWN KEY-PF8 NOT ACTIVE ON LAST PAGE*')
    or (trim(MainframeOLE1.GetString(22, 1, 50)) = '*****  NO MORE ORDERS  *****')
    or (trim(MainframeOLE1.GetString(22, 1, 50)) = '') then
  begin
    mainframeOle1.Sendkeys('<PF3>');
    mainframeOle1.WaithostQuiet;
    result := true;
  end
  else
    result := false;
end;

procedure TMainframeCustomerOrder.SPLNExitToMainScreen;
begin
  if (trim(MainframeOLE1.GetString(1, 28, 27)) = 'CUSTOMER ORDER INQUIRY MENU') then
  begin
    mainframeOle1.Sendkeys('<PF3>');
    mainframeOle1.WaithostQuiet;
    if (trim(MainframeOLE1.GetString(1, 1, 79)) = '') then
    begin
      mainframeOle1.Sendkeys('CSSF');
      mainframeOle1.WaithostQuiet;
      mainframeOle1.Sendkeys('<ENTER>');
      mainframeOle1.WaithostQuiet;
    end;
  end
  else if (trim(MainframeOLE1.GetString(1, 29, 40)) = 'CUSTOMER ORDER OUTBOUND LOGISTICS MENU') then
  begin
    mainframeOle1.Sendkeys('<PF3>');
    mainframeOle1.WaithostQuiet;
    if (trim(MainframeOLE1.GetString(1, 1, 79)) = '') then
    begin
      mainframeOle1.Sendkeys('CSSF');
      mainframeOle1.WaithostQuiet;
      mainframeOle1.Sendkeys('<ENTER>');
      mainframeOle1.WaithostQuiet;
    end;
  end;
end;

function TMainframeCustomerOrder.IS02Login(mfInitial, selection: string; plantID: Integer): Boolean;
var
  IS02SalesOffice: string;
begin
  if plantID = 1 then
    IS02SalesOffice := IS02SalesOffice38
  else if plantID = 2 then
    IS02SalesOffice := IS02SalesOffice72
  else
    IS02SalesOffice := IS02SalesOffice8F;
  if (trim(MainframeOLE1.GetString(1, 16, 37)) <> 'INTERNATIONAL ORDER MANAGEMENT SYSTEM')
    or (trim(MainframeOLE1.GetString(2, 29, 10)) <> 'MAIN MENU') then
    result := false
  else
  begin
    if trim(MainframeOLE1.GetString(4, 12, 3)) <> mfInitial then
    begin
      MainframeOLE1.Moveto(4, 12);
      mainframeOle1.Sendkeys(mfInitial);
    end;
    if trim(MainframeOLE1.GetString(4, 31, 3)) <> IS02SalesOffice then
    begin
      MainframeOLE1.Moveto(4, 31);
      mainframeOle1.Sendkeys(IS02SalesOffice);
    end;
    MainframeOLE1.Moveto(5, 13);
    mainframeOle1.Sendkeys(selection);
    mainframeOle1.Sendkeys('<ENTER>');
    mainframeOle1.WaithostQuiet;
    if (trim(MainframeOLE1.GetString(1, 13, 43)) = 'INTERNATIONAL ORDER MANAGEMENT SYSTEM') then
    begin
      if ((trim(MainframeOLE1.GetString(2, 31, 12)) = 'MASTER ORDER')
        or (trim(MainframeOLE1.GetString(2, 25, 20)) = 'ADD ORDERS')
        or (trim(MainframeOLE1.GetString(2, 25, 20)) = 'CHANGE ORDERS')
        or (trim(MainframeOLE1.GetString(2, 25, 20)) = 'DOWNLOAD INFO')) then
        result := true
      else
        result := false;
    end
    else
      result := false;
  end;
end;

function TMainframeCustomerOrder.IS02AddExistingMNumber(custNum, rtd,
  shipVIA, custPONum, MNumber: string): Boolean;
begin
  if (trim(MainframeOLE1.GetString(1, 16, 40)) <> 'INTERNATIONAL ORDER MANAGEMENT SYSTEM') then
    result := false
  else
  begin
    MainframeOLE1.Moveto(3, 9);
    mainframeOle1.Sendkeys(MNumber);
    mainframeOle1.Sendkeys('<ENTER>');
    mainframeOle1.WaithostQuiet;
    if (Trim(MainframeOLE1.GetString(1, 13, 37)) <> 'INTERNATIONAL ORDER MANAGEMENT SYSTEM')
      or (Trim(MainframeOLE1.GetString(2, 31, 12)) <> 'MASTER ORDER') then
      result := false
    else
    begin
      if Trim(MainframeOLE1.GetString(3, 16, 4)) = '' then
      begin
        MainframeOLE1.Moveto(3, 16);
        mainframeOle1.Sendkeys(custNum);
      end;
      if Trim(MainframeOLE1.GetString(4, 16, 7)) = '' then
      begin
        MainframeOLE1.Moveto(4, 16);
        mainframeOle1.Sendkeys(custPONum);
      end;
      MainframeOLE1.Moveto(5, 16);
      mainframeOle1.Sendkeys(rtd);
      MainframeOLE1.Moveto(6, 16);
      mainframeOle1.Sendkeys(rtd);
      MainframeOLE1.Moveto(16, 21);
      mainframeOle1.Sendkeys(rtd);
      mainframeOle1.Sendkeys('<ENTER>');
      mainframeOle1.WaithostQuiet;
      MainframeOLE1.Moveto(8, 16);
      mainframeOle1.Sendkeys(shipVIA);
      mainframeOle1.Sendkeys('<PF9>');
      mainframeOle1.WaithostQuiet;
      if (Trim(MainframeOLE1.GetString(1, 15, 37)) <> 'INTERNATIONAL ORDER MANAGEMENT SYSTEM')
        or (Trim(MainframeOLE1.GetString(2, 29, 10)) <> 'NEW ITEMS') then
        result := false
      else
        result := true;
    end;
  end;
end;

function TMainframeCustomerOrder.IS02AddMasterOrder(custNum, rtd,
  shipVIA, custPONum: string): string;
var
  MNumber: string;
begin
  if (Trim(MainframeOLE1.GetString(1, 13, 37)) <> 'INTERNATIONAL ORDER MANAGEMENT SYSTEM')
    or (Trim(MainframeOLE1.GetString(2, 31, 12)) <> 'MASTER ORDER') then
    result := ''
  else
  begin
    if Trim(MainframeOLE1.GetString(3, 16, 4)) = '' then
    begin
      MainframeOLE1.Moveto(3, 16);
      mainframeOle1.Sendkeys(custNum);
    end;
    if Trim(MainframeOLE1.GetString(4, 16, 7)) = '' then
    begin
      MainframeOLE1.Moveto(4, 16);
      mainframeOle1.Sendkeys(custPONum);
    end;
    MainframeOLE1.Moveto(5, 16);
    mainframeOle1.Sendkeys(rtd);
    MainframeOLE1.Moveto(6, 16);
    mainframeOle1.Sendkeys(rtd);
    MainframeOLE1.Moveto(16, 21);
    mainframeOle1.Sendkeys(rtd);
    mainframeOle1.Sendkeys('<ENTER>');
    mainframeOle1.WaithostQuiet;
    MNumber := Trim(MainframeOLE1.GetString(2, 56, 6));
    MainframeOLE1.Moveto(8, 16);
    mainframeOle1.Sendkeys(shipVIA);
    mainframeOle1.Sendkeys('<PF9>');
    mainframeOle1.WaithostQuiet;
    if (Trim(MainframeOLE1.GetString(1, 15, 37)) <> 'INTERNATIONAL ORDER MANAGEMENT SYSTEM')
      or (Trim(MainframeOLE1.GetString(2, 29, 10)) <> 'NEW ITEMS') then
      result := ''
    else
    begin
      if MNumber = '' then
        MNumber := Trim(MainframeOLE1.GetString(3, 16, 6));
      if Trim(MainframeOLE1.GetString(3, 16, 6)) = '' then
        MNumber := 'error';
      result := MNumber;
    end;
  end;
end;

function TMainframeCustomerOrder.IS02AddNewItems(model, ups, pt, bkt, priceInput: string;
  orderQty: Double; row: integer; IsEndOfData: Boolean): Boolean;
begin
  MainframeOLE1.Moveto(row, 5);
  mainframeOle1.Sendkeys(ups);
  MainframeOLE1.Moveto(row, 8);
  mainframeOle1.Sendkeys(model);
  MainframeOLE1.Moveto(row, 34);
  mainframeOle1.Sendkeys(FloatToStr(orderQty));
  MainframeOLE1.Moveto(row, 44);
  mainframeOle1.Sendkeys(priceInput);
  MainframeOLE1.Moveto(row, 55);
  mainframeOle1.Sendkeys(pt);
  MainframeOLE1.Moveto(row, 57);
  mainframeOle1.Sendkeys(bkt);
  mainframeOle1.Sendkeys('<Enter>');
  mainframeOle1.WaithostQuiet(1000);
  if priceInput <> '0' then
  begin
    if Trim(MainframeOLE1.GetString(row, 44, 9)) = '' then
    begin
      MainframeOLE1.Moveto(row, 44);
      mainframeOle1.Sendkeys(priceInput);
    end;
  end;
  if ((row = 22) or IsEndOfData) then
  begin
    mainframeOle1.Sendkeys('<PF9>');
    mainframeOle1.WaithostQuiet;
  end;
  if IsEndOfData then
  begin
    if Trim(MainframeOLE1.GetString(7, 2, 40)) = 'MSG: NO IVAR RECORD FOR BUILD PLANT' then
      Result := false
    else
    begin
      mainframeOle1.Sendkeys('<PF3>');
      mainframeOle1.WaithostQuiet;
    {if (Trim(MainframeOLE1.GetString(1, 1, 65)) <> 'MASTER ORDER SUMMARY      INTERNATIONAL ORDER MANAGEMENT SYSTEM') then
      result := false
    else     }
      Result := true;
    end;
  end
  else if (Trim(MainframeOLE1.GetString(1, 15, 37)) <> 'INTERNATIONAL ORDER MANAGEMENT SYSTEM')
    or (Trim(MainframeOLE1.GetString(2, 29, 10)) <> 'NEW ITEMS') then
    result := false
  else
    result := true;
end;

procedure TMainframeCustomerOrder.IS02ReadAllOrderNumber(slData: TStringList);
var
  i, row: integer;
  IsEndOfData: Boolean;
begin
  IsEndOfData := false;
  for i := 0 to slData.Count - 1 do
  begin
    if i = slData.Count - 1 then IsEndOfData := true;
    row := (i mod 14) + 9;
    TCustomerOrder(slData.Objects[i]).CustomerOrderNumber := Trim(MainframeOLE1.GetString(row, 6, 7));

    if ((row = 22) and (IsEndOfData = false)) then
    begin
      mainframeOle1.Sendkeys('<PF8>');
      mainframeOle1.WaithostQuiet;
    end;
    if IsEndOfData then
    begin
      mainframeOle1.Sendkeys('<PF3>');
      mainframeOle1.WaithostQuiet;
      mainframeOle1.Sendkeys('<PF3>');
      mainframeOle1.WaithostQuiet;
      mainframeOle1.Sendkeys('<PF3>');
      mainframeOle1.WaithostQuiet;
      mainframeOle1.Sendkeys('CSSF');
      mainframeOle1.WaithostQuiet;
      mainframeOle1.Sendkeys('<ENTER>');
      mainframeOle1.WaithostQuiet;
    end;
  end;
end;

procedure TMainframeCustomerOrder.IS02ReadAllOrderNumberJustNewAdded(slData: TStringList; OrderCount: integer);
var
  i, j, row, beginRow: integer;
  IsEndOfData: Boolean;
begin
  for j := 1 to OrderCount do
  begin
    if (j <> 1) and ((j mod 14) = 0) then
    begin
      mainframeOle1.Sendkeys('<PF8>');
      mainframeOle1.WaithostQuiet;
    end;
  end;
  beginRow := OrderCount mod 14;

  IsEndOfData := false;
  for i := 0 to slData.Count - 1 do
  begin
    if i = slData.Count - 1 then IsEndOfData := true;
    row := (i mod 14) + 9 + beginRow;
    TCustomerOrder(slData.Objects[i]).CustomerOrderNumber := Trim(MainframeOLE1.GetString(row, 6, 7));

    if ((row = 22) and (IsEndOfData = false)) then
    begin
      mainframeOle1.Sendkeys('<PF8>');
      mainframeOle1.WaithostQuiet;
    end;
    if IsEndOfData then
    begin
      mainframeOle1.Sendkeys('<PF3>');
      mainframeOle1.WaithostQuiet;
      mainframeOle1.Sendkeys('<PF3>');
      mainframeOle1.WaithostQuiet;
      mainframeOle1.Sendkeys('<PF3>');
      mainframeOle1.WaithostQuiet;
      mainframeOle1.Sendkeys('CSSF');
      mainframeOle1.WaithostQuiet;
      mainframeOle1.Sendkeys('<ENTER>');
      mainframeOle1.WaithostQuiet;
    end;
  end;
end;

function TMainframeCustomerOrder.IS02ChangeMasterOrder(
  coNum, model, custPONum, rtd: string; qty: integer; price: double): Boolean;
begin
  if (Trim(MainframeOLE1.GetString(1, 13, 40)) <> 'INTERNATIONAL ORDER MANAGEMENT SYSTEM')
    or (Trim(MainframeOLE1.GetString(2, 25, 20)) <> 'CHANGE ORDERS') then
    result := false
  else
  begin
    MainframeOLE1.Moveto(3, 9);
    mainframeOle1.Sendkeys(coNum);
    mainframeOle1.Sendkeys('<ENTER>');
    mainframeOle1.WaithostQuiet;
    if Trim(MainframeOLE1.GetString(5, 1, 79)) = 'MSG: THE ORDER DOES NOT BELONG TO YOUR COMPANY.' then
      result := false
    else if Trim(MainframeOLE1.GetString(5, 1, 79)) = 'MSG: ENTER X FOR ORDER-DTL   F6=COMMENTS  DO NOT DELETE ORDER F9=SPEC INST' then
    begin
      MainframeOLE1.Moveto(7, 2);
      mainframeOle1.Sendkeys('x');
      mainframeOle1.Sendkeys('<ENTER>');
      mainframeOle1.WaithostQuiet;
      if Trim(MainframeOLE1.GetString(20, 1, 70)) = 'MSG: F2=PRICING  F3=END  F9=KEEP-CHANGES' then
      begin
        MainframeOLE1.Moveto(3, 24);
        mainframeOle1.Sendkeys(model);
        if custPONum <> '' then
        begin
          MainframeOLE1.Moveto(3, 66);
          mainframeOle1.Sendkeys(custPONum);
        end;
        MainframeOLE1.Moveto(4, 32);
        mainframeOle1.Sendkeys(rtd);
        MainframeOLE1.Moveto(4, 57);
        mainframeOle1.Sendkeys(rtd);
        MainframeOLE1.Moveto(7, 7);
        mainframeOle1.Sendkeys(Format('%.9d', [qty]));
        mainframeOle1.Sendkeys('<ENTER>');
        mainframeOle1.WaithostQuiet;
        if stringreplace(trim(MainframeOLE1.GetString(7, 26, 11)), ',', '', [rfreplaceall]) <> FloatToStr(price) then
        begin
          if MessageDlg('Mainframe Price and LiveOrder Price is different, Use LiveOrder Price?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
          begin
            MainframeOLE1.Moveto(7, 26);
            mainframeOle1.Sendkeys(FormatFloat('0000000.00', price));
          end;
        end;
        mainframeOle1.Sendkeys('<ENTER>');
        mainframeOle1.WaithostQuiet;
        mainframeOle1.Sendkeys('<PF9>');
        mainframeOle1.WaithostQuiet;
        mainframeOle1.Sendkeys('<PF2>');
        mainframeOle1.WaithostQuiet;
        result := true;
      end
      else
        result := false;
    end
    else
      result := false;
  end;
end;

function TMainframeCustomerOrder.IS02DeleteMasterOrder(coNum: string): Boolean;
begin
  if (Trim(MainframeOLE1.GetString(1, 13, 40)) <> 'INTERNATIONAL ORDER MANAGEMENT SYSTEM')
    or (Trim(MainframeOLE1.GetString(2, 25, 20)) <> 'DELETE ORDERS') then
    result := false
  else
  begin
    MainframeOLE1.Moveto(3, 9);
    mainframeOle1.Sendkeys(coNum);
    mainframeOle1.Sendkeys('<ENTER>');
    mainframeOle1.WaithostQuiet;
    if Trim(MainframeOLE1.GetString(4, 1, 79)) = 'MSG: F3=END  F6=DELETE MASTER  F9=DELETE ORDER WITH X  F7=FWD  F8=BWD' then
    begin
      MainframeOLE1.Moveto(6, 2);
      mainframeOle1.Sendkeys('x');
      mainframeOle1.Sendkeys('<PF9>');
      mainframeOle1.WaithostQuiet;
      mainframeOle1.Sendkeys('<PF9>');
      mainframeOle1.WaithostQuiet;
      mainframeOle1.Sendkeys('<PF3>');
      mainframeOle1.WaithostQuiet;
      mainframeOle1.Sendkeys('<PF2>');
      mainframeOle1.WaithostQuiet;
      result := true;
    end
    else
      result := false;
  end;
end;

function TMainframeCustomerOrder.IS02DownloadMasterOrder(mNum: string): Boolean;
begin
  if (Trim(MainframeOLE1.GetString(1, 13, 40)) <> 'INTERNATIONAL ORDER MANAGEMENT SYSTEM') then
    result := false
  else
  begin
    if Trim(MainframeOLE1.GetString(2, 25, 20)) = 'DOWNLOAD INFO' then
    begin
      MainframeOLE1.Moveto(3, 16);
      mainframeOle1.Sendkeys(mNum);
      mainframeOle1.Sendkeys('<ENTER>');
      mainframeOle1.WaithostQuiet;
      if Trim(MainframeOLE1.GetString(15, 1, 79)) = 'MSG: DOWNLOAD REQUEST SUCCESSFUL F3 FOR MENU.' then
      begin
        mainframeOle1.Sendkeys('<PF3>');
        mainframeOle1.WaithostQuiet;
        mainframeOle1.Sendkeys('<PF3>');
        mainframeOle1.WaithostQuiet;
        mainframeOle1.Sendkeys('CSSF');
        mainframeOle1.WaithostQuiet;
        mainframeOle1.Sendkeys('<ENTER>');
        mainframeOle1.WaithostQuiet;
        result := true;
      end
      else
        result := false;
    end
    else
      result := false;
  end;
end;

procedure TMainframeCustomerOrder.IS02ExitToMainScreen;
begin
  //if (Trim(MainframeOLE1.GetString(1, 13, 40)) = 'INTERNATIONAL ORDER MANAGEMENT SYSTEM') then
  begin
    mainframeOle1.Sendkeys('<PF3>');
    mainframeOle1.WaithostQuiet;
    mainframeOle1.Sendkeys('cssf');
    mainframeOle1.WaithostQuiet;
    mainframeOle1.Sendkeys('<ENTER>');
    mainframeOle1.WaithostQuiet;
  end;
end;

function TMainframeCustomerOrder.SPLNLogin(mfPlant, mfInitial,
  mfPassword: string): Boolean;
begin
  if (trim(MainframeOLE1.GetString(1, 29, 38)) <> 'CUSTOMER ORDER OUTBOUND LOGISTICS MENU')
    or (trim(MainframeOLE1.GetString(2, 23, 6)) <> 'PLANT:') then
  begin
    mainframeOle1.Sendkeys('<PF3>');
    mainframeOle1.WaithostQuiet;
    if MainframeGetScreenAllData <> '' then
    begin
      mainframeOle1.Sendkeys('<PF3>');
      mainframeOle1.WaithostQuiet;
    end;
    mainframeOle1.Sendkeys('SPLN');
    mainframeOle1.Sendkeys('<ENTER>');
    mainframeOle1.WaithostQuiet;
  end;
  if (trim(MainframeOLE1.GetString(1, 29, 38)) <> 'CUSTOMER ORDER OUTBOUND LOGISTICS MENU')
    or (trim(MainframeOLE1.GetString(2, 23, 6)) <> 'PLANT:') then
    result := false
  else
  begin
    if trim(MainframeOLE1.GetString(2, 23, 6)) <> '' then
    begin
      MainframeOLE1.Moveto(2, 31);
      mainframeOle1.Sendkeys(mfPlant);
    end;
    if trim(MainframeOLE1.GetString(2, 38, 9)) <> '' then
    begin
      MainframeOLE1.Moveto(2, 48);
      mainframeOle1.Sendkeys(mfInitial);
    end;
    MainframeOLE1.Moveto(3, 48);
    mainframeOle1.Sendkeys(mfPassword);
    mainframeOle1.Sendkeys('<ENTER>');
    mainframeOle1.WaithostQuiet;
    if (trim(MainframeOLE1.GetString(1, 29, 38)) <> 'CUSTOMER ORDER OUTBOUND LOGISTICS MENU')
      or (trim(MainframeOLE1.GetString(2, 1, 79)) <> '') then
      result := true
    else
      result := false;
  end;
end;

function TMainframeCustomerOrder.SPLNAddMasterOrder(
  custNo: string): string;
begin
  MainframeOLE1.Moveto(9, 20);
  mainframeOle1.Sendkeys(custNo);
  if (custNo = '7399') or (lowercase(custNo) = 'u12s') then
  begin
    MainframeOLE1.Moveto(19, 26);
    mainframeOle1.Sendkeys('Y');
  end;
  mainframeOle1.Sendkeys('<PF4>');
  mainframeOle1.WaithostQuiet;
  if (custNo = '7399') or (lowercase(custNo) = 'u12s') then
  begin
    if (trim(MainframeOLE1.GetString(1, 1, 79)) = 'A CUSTOMER WITH MULTIPLE SHIP TO LOCS AND/OR SHIP VIAS HAS BEEN FOUND')
      and (trim(MainframeOLE1.GetString(2, 1, 79)) = 'ENTER C ''S NEXT TO LOCS TO COMBINE FOR PLAN') then
    begin
      MainframeOLE1.Moveto(3, 5);
      mainframeOle1.Sendkeys('c');
      MainframeOLE1.Moveto(9, 5);
      mainframeOle1.Sendkeys('c');
     // MainframeOLE1.Moveto(3, 43);
     // mainframeOle1.Sendkeys('c');
      mainframeOle1.Sendkeys('<ENTER>');
      mainframeOle1.WaithostQuiet;
    end;
  end
  else if (trim(MainframeOLE1.GetString(1, 1, 79)) = 'A CUSTOMER WITH MULTIPLE SHIP TO LOCS AND/OR SHIP VIAS HAS BEEN FOUND')
    and (trim(MainframeOLE1.GetString(2, 1, 79)) = 'ENTER C ''S TO COMBINE FOR PLAN') then
  begin
    MainframeOLE1.Moveto(3, 5);
    mainframeOle1.Sendkeys('c');
    MainframeOLE1.Moveto(9, 5);
    mainframeOle1.Sendkeys('c');
    mainframeOle1.Sendkeys('<ENTER>');
    mainframeOle1.WaithostQuiet;
  end;
  if (trim(MainframeOLE1.GetString(1, 36, 23)) = 'SHIPMENT PLAN SELECTION') then
    result := trim(MainframeOLE1.GetString(2, 11, 8))
  else
    result := '';
end;

function TMainframeCustomerOrder.SPLNNewItemsGetCurrentPage: string;
begin
  if (trim(MainframeOLE1.GetString(1, 36, 23)) = 'SHIPMENT PLAN SELECTION') then
    result := Trim(MainframeOLE1.GetString(1, 65, 2))
  else
    result := '';
end;

function TMainframeCustomerOrder.SPLNNewItemsGetTotalPage: string;
begin
  if (trim(MainframeOLE1.GetString(1, 36, 23)) = 'SHIPMENT PLAN SELECTION') then
    result := Trim(MainframeOLE1.GetString(1, 71, 2))
  else
    result := '';
end;

function TMainframeCustomerOrder.SPLNNewItemsReadOrderNumber(row: integer): string;
begin
  if (trim(MainframeOLE1.GetString(1, 36, 23)) = 'SHIPMENT PLAN SELECTION') then
    result := Trim(MainframeOLE1.GetString(row, 8, 6))
  else
    result := '';
end;

procedure TMainframeCustomerOrder.SPLNAddNewItems(row: integer; actualReleaseCOQuantity: string);
begin
  MainframeOLE1.Moveto(row, 2);
  mainframeOle1.Sendkeys(actualReleaseCOQuantity);
end;

function TMainframeCustomerOrder.MainframeScreenReadRow(row, rowFrom, rowTo: integer): string;
begin
  result := trim(MainframeOLE1.GetString(row, rowFrom, rowTo));
end;

procedure TMainframeCustomerOrder.AddLog(Str: string);
begin
{  Listbox1.Items.Add(Datetimetostr(now) + ':' + Str);
  StatusBar1.SimpleText := Str;
  while Listbox1.Items.Count > 500 do
    Listbox1.Items.Delete(0);
  Listbox1.ItemIndex := listbox1.items.Count - 1;}
end;

function TMainframeCustomerOrder.SPLNAddOrderAttach(pieces, freightCost: string): Boolean;
var
  productWeight: string;
begin
  if (trim(MainframeOLE1.GetString(1, 36, 23)) <> 'SHIPMENT PLAN SELECTION') then
    result := false
  else
  begin
    mainframeOle1.Sendkeys('<PF9>');
    mainframeOle1.WaithostQuiet; {
    if (trim(MainframeOLE1.GetString(20, 1, 79)) = CurUserMFDisplayName + ', MAKE CORRECTIO  **WHEN NO LINE ITEMS SELECTED PRESS PF3-QUIT**') then
      result := false
    else if (trim(MainframeOLE1.GetString(1, 33, 21)) <> 'SHIPMENT PLAN REVIEW') then
      result := false
    else if (trim(MainframeOLE1.GetString(18, 1, 79)) = CurUserMFDisplayName + ',PLEASE ENTER CHGS & PRESS A VALID PF/F KEY') then  }
    begin
      mainframeOle1.Sendkeys('<PF9>');
      mainframeOle1.WaithostQuiet;
      mainframeOle1.Sendkeys('<PF11>');
      mainframeOle1.WaithostQuiet;
      if (trim(MainframeOLE1.GetString(18, 9, 56)) = 'ITEM(S) UNDER/OVER PICKED OR W/O WGTS')
        or (trim(MainframeOLE1.GetString(18, 9, 56)) = 'SOME ITEMS W/O WGTS')
        or (trim(MainframeOLE1.GetString(18, 9, 56)) = 'SHP PWK MUST BE REPRINTED TO SHOW CHANGES, CHGS MADE') then
        ShowMessage('Please input weight,then hit ok.');
      mainframeOle1.Sendkeys('<PF11>');
      mainframeOle1.WaithostQuiet;
      mainframeOle1.Sendkeys('<PF8>');
      mainframeOle1.WaithostQuiet; {
        mainframeOle1.Sendkeys('<PF9>');
        mainframeOle1.WaithostQuiet;     }
      MainframeOLE1.Moveto(11, 4);
      mainframeOle1.Sendkeys('x');
      mainframeOle1.Sendkeys('<Enter>');
      mainframeOle1.WaithostQuiet;
      productWeight := trim(MainframeOLE1.GetString(14, 71, 6));
      if productWeight = '' then
        productWeight := '1';
      MainframeOLE1.Moveto(13, 71);
      mainframeOle1.Sendkeys(productWeight);
      MainframeOLE1.Moveto(15, 43);
      mainframeOle1.Sendkeys('5');
      mainframeOle1.Sendkeys('<PF11>');
      mainframeOle1.WaithostQuiet;
      mainframeOle1.Sendkeys('<PF11>');
      mainframeOle1.WaithostQuiet;
      mainframeOle1.Sendkeys('<PF23>');
      mainframeOle1.WaithostQuiet;
      MainframeOLE1.Moveto(8, 40);
      mainframeOle1.Sendkeys(freightCost);
      mainframeOle1.Sendkeys('<Enter>');
      mainframeOle1.WaithostQuiet;
        {
        MainframeOLE1.Moveto(10, 40);
        mainframeOle1.Sendkeys(pieces);
        productWeight := trim(MainframeOLE1.GetString(14, 70, 6));
        MainframeOLE1.Moveto(10, 61);
        mainframeOle1.Sendkeys(productWeight);
        mainframeOle1.Sendkeys('<PF11>');
        mainframeOle1.WaithostQuiet;
        mainframeOle1.Sendkeys('<PF11>');
        mainframeOle1.WaithostQuiet;
        mainframeOle1.Sendkeys('<PF23>');
        mainframeOle1.WaithostQuiet;
        MainframeOLE1.Moveto(8, 40);
        mainframeOle1.Sendkeys(freightCost);
        mainframeOle1.Sendkeys('<Enter>');
        mainframeOle1.WaithostQuiet;
        }
      if (trim(MainframeOLE1.GetString(1, 29, 38)) <> 'CUSTOMER ORDER OUTBOUND LOGISTICS MENU') then
        result := false
      else
        result := true;
    end;
  end;
end;

function TMainframeCustomerOrder.SPLNChangeFreightCost(InvoiceNo: string; FreightCost: double): Boolean;
begin
  if (trim(MainframeOLE1.GetString(1, 29, 38)) <> 'CUSTOMER ORDER OUTBOUND LOGISTICS MENU') then
    result := false
  else
  begin
    MainframeOLE1.Moveto(9, 58);
    mainframeOle1.Sendkeys(InvoiceNo);
    mainframeOle1.Sendkeys('<PF23>');
    mainframeOle1.WaithostQuiet;
    if (trim(MainframeOLE1.GetString(5, 15, 30)) <> 'FREIGHT ASSIGNMENT SCREEN') then
      result := false
    else
    begin
      MainframeOLE1.Moveto(8, 40);
      mainframeOle1.Sendkeys(FormatFloat('000000000.00', FreightCost));
      mainframeOle1.Sendkeys('<ENTER>');
      mainframeOle1.WaithostQuiet;
      result := true;
    end;
  end;
end;

function TMainframeCustomerOrder.SPLNDeleteInvoice(InvoiceNumber, CustomerNumber: string): Boolean;
begin
  if (trim(MainframeOLE1.GetString(1, 29, 38)) <> 'CUSTOMER ORDER OUTBOUND LOGISTICS MENU') then
    result := false
  else
  begin
    //mainframeOle1.Sendkeys('<Escape>');
    //mainframeOle1.WaithostQuiet;
    MainframeOLE1.Moveto(9, 20);
    mainframeOle1.Sendkeys(CustomerNumber);
    MainframeOLE1.Moveto(9, 58);
    mainframeOle1.Sendkeys(InvoiceNumber);
    mainframeOle1.Sendkeys('<PF13>');
    mainframeOle1.WaithostQuiet;
   { if (trim(MainframeOLE1.GetString(22, 1, 80)) <> (gvars.CurUserMFDisplayName + ', PLEASE PRESS PF13 AGAIN TO DELETE PLAN')) then
      result := false
    else
    begin    }
    mainframeOle1.Sendkeys('<PF13>');
    mainframeOle1.WaithostQuiet;
    if (trim(MainframeOLE1.GetString(22, 1, 80)) <> (gvars.CurUserMFDisplayName + ' ,SHIP PLAN ' + InvoiceNumber + ' HAS BEEN DELETED')) then
      result := false
    else
      result := true;
   // end;
  end;
end;

procedure TMainframeCustomerOrder.OINQExitToMainScreen;
begin
  //if (trim(MainframeOLE1.GetString(1, 29, 38)) = 'CUSTOMER ORDER OUTBOUND LOGISTICS MENU') then
  if (trim(MainframeOLE1.GetString(1, 28, 28)) = 'CUSTOMER ORDER INQUIRY MENU') then
  begin
    mainframeOle1.Sendkeys('<PF3>');
    mainframeOle1.WaithostQuiet;
    mainframeOle1.Sendkeys('cssf');
    mainframeOle1.WaithostQuiet;
    mainframeOle1.Sendkeys('<ENTER>');
    mainframeOle1.WaithostQuiet;
  end;
end;

function TMainframeCustomerOrder.ShipOrderAtSPLN(InvoiceNum,
  ATD, carriage, freightCost: string): Boolean;
begin
  if (trim(MainframeOLE1.GetString(1, 29, 38)) <> 'CUSTOMER ORDER OUTBOUND LOGISTICS MENU') then
    Result := false
  else
  begin
    MainframeOLE1.Moveto(9, 58);
    mainframeOle1.Sendkeys(InvoiceNum);
    mainframeOle1.Sendkeys('<PF12>');
    mainframeOle1.WaithostQuiet;
    if (trim(MainframeOLE1.GetString(1, 31, 22)) <> 'SHIPMENT APPLICATION') then
      Result := false
    else
    begin
      MainframeOLE1.Moveto(9, 31);
      mainframeOle1.Sendkeys(ATD);
      MainframeOLE1.Moveto(11, 31);
      mainframeOle1.Sendkeys(carriage);
      if trim(MainframeOLE1.GetString(16, 31, 12)) = '' then
      begin
        MainframeOLE1.Moveto(16, 31);
        mainframeOle1.Sendkeys(freightCost);
      end;
      mainframeOle1.Sendkeys('<Enter>');
      mainframeOle1.WaithostQuiet;
      if (trim(MainframeOLE1.GetString(1, 29, 38)) <> 'CUSTOMER ORDER OUTBOUND LOGISTICS MENU') then
        Result := false
      else
        Result := true;
    end;
  end;

end;

end.

