unit uCustomerOrderProcessUploadMainframe;

interface

uses SysUtils, DBCtrls, Controls, Classes, ADODB, Dialogs, Variants,
  uMainframeCustomerOrder, ufrmCustomerOrderProcess, uDMManager, uDMEntity;

type

  TCustomerOrderProcessUploadMainframe = class
    constructor Create; virtual;
    destructor Destroy; override;
  private
    slData: TStringList;
  public
    procedure UploadMainframe(CustomerOrderProcess: TfrmCustomerOrderProcess);
    //ORDM
    procedure UploadORDM(CustomerOrderProcess: TfrmCustomerOrderProcess; mfCO: TMainframeCustomerOrder);
    procedure UploadORDMChangeOrder(CustomerOrderProcess: TfrmCustomerOrderProcess; mfCO: TMainframeCustomerOrder);
    procedure UploadORDMDeleteOrder(CustomerOrderProcess: TfrmCustomerOrderProcess; mfCO: TMainframeCustomerOrder);
    //IS02
    procedure UploadIS02(CustomerOrderProcess: TfrmCustomerOrderProcess; mfCO: TMainframeCustomerOrder);
    procedure UploadIS02AddExistOrder(CustomerOrderProcess: TfrmCustomerOrderProcess; mfCO: TMainframeCustomerOrder);
    procedure UploadIS02ChangeOrder(CustomerOrderProcess: TfrmCustomerOrderProcess; mfCO: TMainframeCustomerOrder);
    procedure UploadIS02DeleteOrder(CustomerOrderProcess: TfrmCustomerOrderProcess; mfCO: TMainframeCustomerOrder);
    procedure UploadIS02DownloadOrder(CustomerOrderProcess: TfrmCustomerOrderProcess; mfCO: TMainframeCustomerOrder);
    function GetMainframeModel(modelID: string): string;
    //OINQ
    procedure DownloadOINQ(CustomerOrderProcess: TfrmCustomerOrderProcess; mfCO: TMainframeCustomerOrder);
    //SPLN
    procedure UploadSPLN(CustomerOrderProcess: TfrmCustomerOrderProcess; mfCO: TMainframeCustomerOrder);
    procedure UploadSPLNChangeFreightCost(CustomerOrderProcess: TfrmCustomerOrderProcess; mfCO: TMainframeCustomerOrder);
    procedure UploadSPLNDeleteInvoice(CustomerOrderProcess: TfrmCustomerOrderProcess; mfCO: TMainframeCustomerOrder);
    procedure UploadINVC(CustomerOrderProcess: TfrmCustomerOrderProcess; mfCO: TMainframeCustomerOrder);
  end;

implementation

uses DataModule, uMJ, math, ufrmDBBasicTree, DB, ufrmDBBasicTreeDT;

constructor TCustomerOrderProcessUploadMainframe.Create;
begin
  inherited;
  slData := TStringList.Create;
end;

destructor TCustomerOrderProcessUploadMainframe.Destroy;
var
  i: integer;
begin
  for i := slData.Count - 1 downto 0 do
    if Assigned(slData.Objects[i]) then
      slData.Objects[i].Free;
  inherited;
end;

procedure TCustomerOrderProcessUploadMainframe.UploadMainframe(CustomerOrderProcess: TfrmCustomerOrderProcess);
var
  adt_mf: TADODataSet;
  mfCO: TMainframeCustomerOrder;
  plantID: integer;
begin
  with CustomerOrderProcess do
  begin
    if gridData2.DataSource.DataSet.RecordCount = 0 then
    begin
      ShowMessage('Please select data for processing.');
      exit;
    end
    else
    begin
      gridData2.DataSource.DataSet.First;
      plantID := gridData2.DataSource.DataSet.fieldbyname('PlantID').AsInteger;
      if (cbbMFType.ItemIndex = 0) or (cbbMFType.ItemIndex = 1) then
      begin
        if LowerCase(gridData2.DataSource.DataSet.fieldbyname('Currency').AsString) = 'rmb' then
        begin
          if cbbMFType.ItemIndex <> 0 then
          begin
            ShowMessage('Mainframe screen must be ORDM because currency is RMB.');
            cbbMFType.ItemIndex := 0;
          end;
        end
        else if LowerCase(gridData2.DataSource.DataSet.fieldbyname('Currency').AsString) = 'usd' then
        begin
          if cbbMFType.ItemIndex <> 1 then
          begin
            ShowMessage('Mainframe screen must be IS02 because currency is USD.');
            cbbMFType.ItemIndex := 1;
          end;
        end;
      end;
    end;

    slData.Clear;
    adt_mf := TADODataSet.Create(nil);
    DM.DataSetQuery(adt_mf, 'EXEC usp_GetMainframeScreen @LoginID=' + IntToStr(objCurUser.LoginID)
      + ',@MainframeScreen=''' + cbbMFType.Text + '''' + ',@PlantID=' + IntToStr(plantID));
    if adt_mf.RecordCount = 0 then
    begin
      ShowMessage('You haven''t maintenance mainframe account in liveorder.');
      Exit;
    end;
    mfCO := TMainframeCustomerOrder.Create;
    mfCO.mfLogin := Trim(adt_mf.fieldbyname('MainframeLogin').AsString);
    mfCO.mfPassword := Trim(adt_mf.fieldbyname('MainframePassword').AsString);
    mfCO.mfInitial := Trim(adt_mf.fieldbyname('MainframeInitial').AsString);
    mfCO.mfPlant := Trim(adt_mf.fieldbyname('PlantCode').AsString);
    if (mfCO.mfLogin = '') or (mfCO.mfPassword = '')
      or (mfCO.mfPassword = '') or (mfCO.mfPlant = '') then
    begin
      ShowMessage('There haven''t mainframe user,password,or initial information in liveorder.');
      Exit;
    end;

    if not mfCO.MainframeLogin(mfCO.mfLogin, mfCO.mfPassword) then
    begin
      if MessageDlg('Phase-Login: Again to login?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        if not mfCO.MainframeLogin(mfCO.mfLogin, mfCO.mfPassword) then
        begin
          ShowMessage('Phase-Login: Please login again.');
          exit;
        end;
      end
      else
        exit;
    end;
    if not mfCO.MainframeScreenSelect(cbbMFType.Text) then
    begin
      ShowMessage('Phase-Select Screen: Please Select Screen again.');
      exit;
    end;

    try
      if LowerCase(cbbMFType.Text) = 'ordm' then
      begin
        if cbbMFTypeDetail.ItemIndex = 0 then
          UploadORDM(CustomerOrderProcess, mfCO);
        if cbbMFTypeDetail.ItemIndex = 1 then
          UploadORDMChangeOrder(CustomerOrderProcess, mfCO);
        if cbbMFTypeDetail.ItemIndex = 2 then
        begin
          if MessageDlg('Delete Orders?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
            exit;
          UploadORDMDeleteOrder(CustomerOrderProcess, mfCO);
        end;
      end;
      if LowerCase(cbbMFType.Text) = 'is02' then
      begin
        if cbbMFTypeDetail.ItemIndex = 0 then
          UploadIS02(CustomerOrderProcess, mfCO);
        if cbbMFTypeDetail.ItemIndex = 1 then
          UploadIS02AddExistOrder(CustomerOrderProcess, mfCO);
        if cbbMFTypeDetail.ItemIndex = 2 then
          UploadIS02ChangeOrder(CustomerOrderProcess, mfCO);
        if cbbMFTypeDetail.ItemIndex = 3 then
        begin
          if MessageDlg('Delete Orders?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
            exit;
          UploadIS02DeleteOrder(CustomerOrderProcess, mfCO);
        end;
        if cbbMFTypeDetail.ItemIndex = 4 then
          UploadIS02DownloadOrder(CustomerOrderProcess, mfCO);
      end;
      if LowerCase(cbbMFType.Text) = 'oinq' then
      begin
        if cbbMFTypeDetail.ItemIndex = 0 then
          DownloadOINQ(CustomerOrderProcess, mfCO);
      end;
      if LowerCase(cbbMFType.Text) = 'spln' then
      begin
        if cbbMFTypeDetail.ItemIndex = 0 then
          UploadSPLN(CustomerOrderProcess, mfCO);
        if cbbMFTypeDetail.ItemIndex = 1 then
          UploadSPLNChangeFreightCost(CustomerOrderProcess, mfCO);
        if cbbMFTypeDetail.ItemIndex = 2 then
          UploadSPLNDeleteInvoice(CustomerOrderProcess, mfCO);
      end;
      if LowerCase(cbbMFType.Text) = 'invc' then
      begin
        if cbbMFTypeDetail.ItemIndex = 0 then
        begin
          if MessageDlg('Delete Orders?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
            exit;
          UploadINVC(CustomerOrderProcess, mfCO);
        end;
      end;
    finally
      gridData.DataSource.DataSet.Active := false;
      gridData.DataSource.DataSet.Active := true;
      gridData2.DataSource.DataSet.Active := false;
      gridData2.DataSource.DataSet.Active := true;
      adt_mf.Free;
      mfCO.Free;
    end;
  end;
end;

procedure TCustomerOrderProcessUploadMainframe.UploadORDM(CustomerOrderProcess: TfrmCustomerOrderProcess; mfCO: TMainframeCustomerOrder);
var
  orderNumHeader, custNum, custName, rtd, modelID: string;
  model, mainframeModel, custPONum, PlantCode, priceInput, currency: string;
  price: Double;
  objCO: TCustomerOrder;
  i, orderQty, plantID, BusinessApplicationID: integer; //CustomerOrderStatesID
begin
  with CustomerOrderProcess do
  begin
    gridData2.DataSource.DataSet.First;
    //CustomerOrderStatesID := gridData2.DataSource.DataSet.FieldByName('CustomerOrderStatesID').AsInteger;
    for i := 0 to gridData2.DataSource.DataSet.RecordCount - 1 do
    begin
      objCO := TCustomerOrder.Create;
      objCO.CustomerOrderID := gridData2.DataSource.DataSet.FieldByName('CustomerOrderID').AsInteger;
      objCO.PlantID := gridData2.DataSource.DataSet.FieldByName('PlantID').AsInteger;
      plantID := gridData2.DataSource.DataSet.FieldByName('PlantID').AsInteger;
      PlantCode := gridData2.DataSource.DataSet.FieldByName('PlantCode').AsString;
      custPONum := gridData2.DataSource.DataSet.FieldByName('CustomerPurchaseOrderNumber').AsString;
      custNum := UpperCase(gridData2.DataSource.DataSet.FieldByName('CustomerNumber').AsString);
      custName := gridData2.DataSource.DataSet.FieldByName('CustomerName').AsString;
      rtd := FormatDateTime('mmddyy', gridData2.DataSource.DataSet.FieldByName('RTD').AsDateTime);
      modelID := gridData2.DataSource.DataSet.FieldByName('ModelID').AsString;
      model := gridData2.DataSource.DataSet.FieldByName('Model').AsString;
      orderQty := gridData2.DataSource.DataSet.FieldByName('CustomerOrderQuantity').AsInteger;
      currency := gridData2.DataSource.DataSet.FieldByName('Currency').AsString;
      BusinessApplicationID := gridData2.DataSource.DataSet.FieldByName('BusinessApplicationID').AsInteger;
      if LowerCase(trim(currency)) = 'rmb' then
        price := RoundTo(gridData2.DataSource.DataSet.FieldByName('Price').AsFloat / 1.17, -2)
      else
        price := RoundTo(gridData2.DataSource.DataSet.FieldByName('Price').AsFloat, -2);
      priceInput := FloatToStr(price);
      if (LowerCase(custPONum) = 'freesample') or (LowerCase(custPONum) = 'free sample') then
        priceInput := 'NC';
      if (LowerCase(copy(model, 0, 2)) = 'zx')
        or (LowerCase(copy(model, 0, 2)) = 'gp') then
      begin
        mainframeModel := GetMainframeModel(modelID);
        if mainframeModel <> '' then
          model := mainframeModel;
      end;
      if (plantID = 1) or (plantID = 4) then
      begin
        if IsNumberic(copy(model, 0, 1)) then
          orderNumHeader := 'P'
        else
          orderNumHeader := 'U';
      end
      else if (plantID = 2) or (plantID = 3) or (plantID = 5)
        or (UpperCase(custNum) = 'C2YN') or (UpperCase(custNum) = 'C2VN')
        or (UpperCase(custNum) = 'C53N') then
        orderNumHeader := 'S';
      if (UpperCase(custNum) = 'C2YN') or (UpperCase(custNum) = 'C2VN')
        or (UpperCase(custNum) = 'C53N') or (UpperCase(custNum) = 'CPXN')
        or (UpperCase(custNum) = 'CYRN') or (UpperCase(custNum) = 'C2DN')
        or (UpperCase(custNum) = 'CKXN') or (UpperCase(custNum) = 'CMHN')
        or (UpperCase(custNum) = 'CDKN') or (UpperCase(custNum) = '868C')
        or (UpperCase(custNum) = 'C4WN') then
        orderNumHeader := 'S';
      if (plantID = 1) and (BusinessApplicationID = 6) and (UpperCase(custNum) = 'C5CN') then  
        orderNumHeader := 'S';

      if ((plantID = 1) and (BusinessApplicationID = 5)) then
        if IsNumberic(copy(model, 0, 1)) then
          orderNumHeader := 'P';
      mfCO.ORDMAddNewOrder(objCO, mfCO.mfPassword, mfCO.mfInitial, orderNumHeader,
        custNum, PlantCode, custPONum, custName, rtd, model, priceInput, orderQty);
      if objCO.CustomerOrderNumber = '' then
      begin
        ShowMessage('Phase-ORDM Add New Order:Please Add New Order again.');
        exit;
      end
      else if objCO.CustomerOrderNumber = 'n' then
      begin
        ShowMessage('MESSAGES-MODEL OBSOLETE.');
        exit;
      end
      else
        slData.AddObject(IntToStr(i), objCO);
      DM.DataSetModify('EXEC usp_UpdateCustomerOrder '
        + ' @CustomerOrderNumber=' + TCustomerOrder(slData.Objects[i]).CustomerOrderNumber
        + ',@CustomerOrderID=' + IntToStr(TCustomerOrder(slData.Objects[i]).CustomerOrderID)
        + ',@Col=''CustomerOrderID''');
      gridData2.DataSource.DataSet.Next;
    end;
    mfCO.ORDMExitToMainScreen;
    gridData2.DataSource.DataSet.Active := false;
    gridData2.DataSource.DataSet.Active := true;
    (*
     if TCustomerOrder(slData.Objects[i]).PlantID = 1 then
        pStates := ',@CustomerOrderStatesID=' + IntToStr(CustomerOrderStatesID + 1);

    for i := 0 to slData.Count - 1 do
    begin
      {DM.DataSetModify(Format(sUpdateCustomerOrderNumberSQL2,
        [TCustomerOrder(slData.Objects[i]).CustomerOrderNumber,
        CustomerOrderStatesID + 1,
          TCustomerOrder(slData.Objects[i]).CustomerOrderID]));   }
      if TCustomerOrder(slData.Objects[i]).PlantID <> 2 then
        pStates := ',@CustomerOrderStatesID=' + IntToStr(CustomerOrderStatesID + 1);
      DM.DataSetModify('EXEC usp_UpdateCustomerOrder '
        + ' @CustomerOrderNumber=' + TCustomerOrder(slData.Objects[i]).CustomerOrderNumber
        + ',@CustomerOrderID=' + IntToStr(TCustomerOrder(slData.Objects[i]).CustomerOrderID)
        + pStates + ',@Col=''CustomerOrderID''');
    end;
    gridData2.DataSource.DataSet.Active := false;
    gridData2.DataSource.DataSet.Active := true;   *)
  end;
end;

procedure TCustomerOrderProcessUploadMainframe.UploadORDMChangeOrder(
  CustomerOrderProcess: TfrmCustomerOrderProcess; mfCO: TMainframeCustomerOrder);
var
  custNum, custName, rtd, modelID, orderNum, currency: string;
  model, mainframeModel, custPONum, PlantCode, priceInput: string;
  price: Double;
  i, orderQty: integer;
  IsSuccess: Boolean;
begin
  IsSuccess := false;
  with CustomerOrderProcess do
  begin
    gridData2.DataSource.DataSet.First;
    for i := 0 to gridData2.DataSource.DataSet.RecordCount - 1 do
    begin
      custNum := gridData2.DataSource.DataSet.FieldByName('CustomerNumber').AsString;
      custName := gridData2.DataSource.DataSet.FieldByName('CustomerName').AsString;
      rtd := FormatDateTime('mmddyy', gridData2.DataSource.DataSet.FieldByName('RTD').AsDateTime);
      modelID := gridData2.DataSource.DataSet.FieldByName('ModelID').AsString;
      model := gridData2.DataSource.DataSet.FieldByName('Model').AsString;
      orderQty := gridData2.DataSource.DataSet.FieldByName('CustomerOrderQuantity').AsInteger;
      orderNum := gridData2.DataSource.DataSet.FieldByName('CustomerOrderNumber').AsString;
      //plantID := gridData2.DataSource.DataSet.FieldByName('PlantID').AsInteger;
      PlantCode := gridData2.DataSource.DataSet.FieldByName('PlantCode').AsString;
      custPONum := gridData2.DataSource.DataSet.FieldByName('CustomerPurchaseOrderNumber').AsString;
      if (custPONum = '') then
        custPONum := Copy(custName, 1, 13)
      else if ((custPONum <> '') and (Length(custPONum) > 13)) then
        custPONum := Copy(custPONum, 1, 13);
      currency := gridData2.DataSource.DataSet.FieldByName('Currency').AsString;
      if LowerCase(trim(currency)) = 'rmb' then
        price := RoundTo(gridData2.DataSource.DataSet.FieldByName('Price').AsFloat / 1.17, -2)
      else
        price := RoundTo(gridData2.DataSource.DataSet.FieldByName('Price').AsFloat, -2);
      priceInput := FloatToStr(price);
      if (LowerCase(custPONum) = 'freesample') or (LowerCase(custPONum) = 'free sample') then
        priceInput := 'NC';
      if (LowerCase(copy(model, 0, 2)) = 'zx')
        or (LowerCase(copy(model, 0, 2)) = 'gp') then
      begin
        mainframeModel := GetMainframeModel(modelID);
        if mainframeModel <> '' then
          model := mainframeModel;
      end;
      if not mfCO.ORDMChangeOrder(mfCO.mfPassword, mfCO.mfInitial, orderNum, custNum,
        PlantCode, custPONum, custName, rtd, model, priceInput, orderQty) then
      begin
        ShowMessage('Phase-ORDM Change Order:Error at ORDM Change Order.');
        Break;
      end;
      IsSuccess := true;
      gridData2.DataSource.DataSet.Next;
    end;
    mfCO.ORDMExitToMainScreen;
    if IsSuccess then
      ShowMessage('Successfully change mainframe.');
  end;
end;

procedure TCustomerOrderProcessUploadMainframe.UploadORDMDeleteOrder(
  CustomerOrderProcess: TfrmCustomerOrderProcess; mfCO: TMainframeCustomerOrder);
var
  coNum, custNum, coID, PlantCode: string;
  i: integer;
begin
  with CustomerOrderProcess do
  begin
    gridData2.DataSource.DataSet.First;
    PlantCode := gridData2.DataSource.DataSet.FieldByName('PlantCode').AsString;
    for i := 0 to gridData2.DataSource.DataSet.RecordCount - 1 do
    begin
      coID := gridData2.DataSource.DataSet.FieldByName('CustomerOrderID').AsString;
      coNum := gridData2.DataSource.DataSet.FieldByName('CustomerOrderNumber').AsString;
      custNum := gridData2.DataSource.DataSet.FieldByName('CustomerNumber').AsString;
      if not mfCO.ORDMDeleteMasterOrder(coNum, custNum, PlantCode, mfCO.mfInitial, mfCO.mfPassword) then
      begin
        ShowMessage('Phase-ORDM Delete Order : Error at ORDM Delete Order.');
        exit;
      end;
      DM.DataSetModify('EXEC usp_UpdateCustomerOrder '
        + ' @CustomerOrderID=' + coID
        + ',@CustomerOrderStatesID=7');
      gridData2.DataSource.DataSet.Next;
    end;
    gridData2.DataSource.DataSet.Active := false;
    gridData2.DataSource.DataSet.Active := true;
  end;
end;

function TCustomerOrderProcessUploadMainframe.GetMainframeModel(modelID: string): string;
var
  adtModel: TADODataSet;
begin
  adtModel := TADODataSet.Create(nil);
  try
    DM.DataSetQuery(adtModel, 'EXEC usp_GetMainframeModel @ModelID=' + modelID);
    if adtModel.RecordCount > 0 then
      Result := adtModel.fieldbyname('MainframeModel').AsString
    else
      result := '';
  finally
    adtModel.Free;
  end;
end;

procedure TCustomerOrderProcessUploadMainframe.UploadIS02(CustomerOrderProcess: TfrmCustomerOrderProcess; mfCO: TMainframeCustomerOrder);
var
  mNumber, CustomerOrderID, modelID, custNum, custName, rtd: string;
  model, mainframeModel, custPONum, shipVIA: string;
  ups, pt, bkt, priceInput: string;
  IS02ItemsRow, i, plantID: integer;
  orderQty, price: Double;
  objCO: TCustomerOrder;
  IsEndOfData: Boolean;
begin
  with CustomerOrderProcess do
  begin
    gridData2.DataSource.DataSet.First;
    custNum := gridData2.DataSource.DataSet.FieldByName('CustomerNumber').AsString;
    custName := gridData2.DataSource.DataSet.FieldByName('CustomerName').AsString;
    rtd := FormatDateTime('mmddyy', gridData2.DataSource.DataSet.FieldByName('RTD').AsDateTime);
    custPONum := gridData2.DataSource.DataSet.FieldByName('CustomerPurchaseOrderNumber').AsString;
    plantID := gridData2.DataSource.DataSet.FieldByName('PlantID').AsInteger;
    shipVIA := 'OCEAN';

    if mfCO.IS02Login(mfCO.mfInitial, IntToStr(cbbMFTypeDetail.ItemIndex + 1), plantID) = false then
    begin
      ShowMessage('Phase-IS02 MainMenu : Error at IS02 MainMenu.');
      exit;
    end;

    mNumber := mfCO.IS02AddMasterOrder(custNum, rtd, shipVIA, custPONum);
    if ((mNumber = '') or (LowerCase(Copy(mNumber, 0, 1)) <> 'm')) then
    begin
      ShowMessage('Phase-IS02 Add Master Order:Please Add Master Order again.');
      exit;
    end;

    IS02ItemsRow := 11;
    IsEndOfData := false;
    for i := 0 to gridData2.DataSource.DataSet.RecordCount - 1 do
    begin
      if i = (gridData2.DataSource.DataSet.RecordCount - 1) then
        IsEndOfData := true;
      objCO := TCustomerOrder.Create;
      objCO.CustomerOrderID := gridData2.DataSource.DataSet.FieldByName('CustomerOrderID').AsInteger;
      objCO.PlantID := gridData2.DataSource.DataSet.FieldByName('PlantID').AsInteger;
      CustomerOrderID := gridData2.DataSource.DataSet.FieldByName('CustomerOrderID').AsString;
      model := gridData2.DataSource.DataSet.FieldByName('Model').AsString;
      modelID := gridData2.DataSource.DataSet.FieldByName('ModelID').AsString;
      orderQty := gridData2.DataSource.DataSet.FieldByName('CustomerOrderQuantity').AsFloat;
      price := RoundTo(gridData2.DataSource.DataSet.FieldByName('Price').AsFloat, -2);
      priceInput := FloatToStr(price);

      if (LowerCase(copy(model, 0, 2)) = 'zx')
        or (LowerCase(copy(model, 0, 2)) = 'gp') then
      begin
        mainframeModel := GetMainframeModel(modelID);
        if mainframeModel <> '' then
          model := mainframeModel;
      end;
      if plantID = 1 then
      begin
        if IsNumberic(copy(model, 0, 1)) then
        begin
          ups := 'P';
          pt := 'A';
        end
        else
        begin
          ups := 'U';
          pt := 'C';
        end;
      end
      else
      begin
        ups := 'U';
        pt := 'C';
      end;
      if (LowerCase(custPONum) = 'freesample') or (LowerCase(custPONum) = 'free sample') then
      begin
        pt := 'N';
        bkt := 'C';
      end;

      if not mfCO.IS02AddNewItems(model, ups, pt, bkt, priceInput, orderQty, IS02ItemsRow, IsEndOfData) then
      begin
        ShowMessage('Phase-IS02 Add New Items:Please Add New Items again.');
        exit;
      end;
      IS02ItemsRow := IS02ItemsRow + 1;
      if IS02ItemsRow = 23 then IS02ItemsRow := 11;
      slData.AddObject(IntToStr(i), objCO);
      gridData2.DataSource.DataSet.Next;
    end;

    mfCO.IS02ReadAllOrderNumber(slData);
    for i := 0 to slData.Count - 1 do
    begin
      DM.DataSetModify('EXEC usp_UpdateCustomerOrder '
        + ' @MNumber=''' + mNumber + ''''
        + ',@CustomerOrderNumber=''' + TCustomerOrder(slData.Objects[i]).CustomerOrderNumber + '''' //slData.ValueFromIndex[i]
        + ',@CustomerOrderID=''' + IntToStr(TCustomerOrder(slData.Objects[i]).CustomerOrderID) + '''' //slData.Names[i]
        + ',@Col=''CustomerOrderID''');
    end;
  end;
end;

procedure TCustomerOrderProcessUploadMainframe.UploadIS02AddExistOrder(
  CustomerOrderProcess: TfrmCustomerOrderProcess; mfCO: TMainframeCustomerOrder);
var
  mNumber, CustomerOrderID, modelID, custNum, custName, rtd: string;
  model, mainframeModel, custPONum, shipVIA, ups, pt, bkt, priceInput: string;
  IS02ItemsRow, i, plantID, OrderCount: integer;
  orderQty, price: Double;
  objCO: TCustomerOrder;
  IsEndOfData: Boolean;
  adt_mo: TADODataSet;
begin
  with CustomerOrderProcess do
  begin
    if Trim(edtMFAttach.Text) = '' then
    begin
      ShowMessage('Please input M No.');
      exit;
    end;
    adt_mo := TADODataSet.Create(nil);
    try
      DM.DataSetQuery(adt_mo, 'EXEC usp_GetCustomerOrderCountByMNumber @MNum=''' + Trim(edtMFAttach.Text) + '''');
      if adt_mo.RecordCount > 0 then
        OrderCount := adt_mo.fieldbyname('OrderCount').AsInteger
      else
        OrderCount := 0;
    finally
      adt_mo.Free;
    end;

    gridData2.DataSource.DataSet.First;
    custNum := gridData2.DataSource.DataSet.FieldByName('CustomerNumber').AsString;
    custName := gridData2.DataSource.DataSet.FieldByName('CustomerName').AsString;
    rtd := FormatDateTime('mmddyy', gridData2.DataSource.DataSet.FieldByName('RTD').AsDateTime);
    custPONum := gridData2.DataSource.DataSet.FieldByName('CustomerPurchaseOrderNumber').AsString;
    plantID := gridData2.DataSource.DataSet.FieldByName('PlantID').AsInteger;
    shipVIA := 'OCEAN';

    if mfCO.IS02Login(mfCO.mfInitial, IntToStr(cbbMFTypeDetail.ItemIndex + 1), plantID) = false then
    begin
      ShowMessage('Phase-IS02 MainMenu : Error at IS02 MainMenu.');
      exit;
    end;

    mNumber := Trim(edtMFAttach.Text);
    if not mfCO.IS02AddExistingMNumber(custNum, rtd, shipVIA, custPONum, mNumber) then
    begin
      ShowMessage('Phase-IS02 Add Master Order:Please Add Master Order again.');
      exit;
    end;

    IS02ItemsRow := 11;
    IsEndOfData := false;
    for i := 0 to gridData2.DataSource.DataSet.RecordCount - 1 do
    begin
      if i = (gridData2.DataSource.DataSet.RecordCount - 1) then
        IsEndOfData := true;
      objCO := TCustomerOrder.Create;
      objCO.CustomerOrderID := gridData2.DataSource.DataSet.FieldByName('CustomerOrderID').AsInteger;
      objCO.PlantID := gridData2.DataSource.DataSet.FieldByName('PlantID').AsInteger;
      CustomerOrderID := gridData2.DataSource.DataSet.FieldByName('CustomerOrderID').AsString;
      model := gridData2.DataSource.DataSet.FieldByName('Model').AsString;
      modelID := gridData2.DataSource.DataSet.FieldByName('ModelID').AsString;
      orderQty := gridData2.DataSource.DataSet.FieldByName('CustomerOrderQuantity').AsFloat;
      price := RoundTo(gridData2.DataSource.DataSet.FieldByName('Price').AsFloat, -2);
      priceInput := FloatToStr(price);

      if (LowerCase(copy(model, 0, 2)) = 'zx')
        or (LowerCase(copy(model, 0, 2)) = 'gp') then
      begin
        mainframeModel := GetMainframeModel(modelID);
        if mainframeModel <> '' then
          model := mainframeModel;
      end;
      if plantID = 1 then
      begin
        if IsNumberic(copy(model, 0, 1)) then
        begin
          ups := 'P';
          pt := 'A';
        end
        else
        begin
          ups := 'U';
          pt := 'C';
        end;
      end
      else
      begin
        ups := 'U';
        pt := 'C';
      end;
      if (LowerCase(custPONum) = 'freesample') or (LowerCase(custPONum) = 'free sample') then
      begin
        pt := 'N';
        bkt := 'C';
      end;

      if not mfCO.IS02AddNewItems(model, ups, pt, bkt, priceInput, orderQty, IS02ItemsRow, IsEndOfData) then
      begin
        ShowMessage('Phase-IS02 Add New Items:Please Add New Items again.');
        exit;
      end;
      IS02ItemsRow := IS02ItemsRow + 1;
      if IS02ItemsRow = 23 then IS02ItemsRow := 11;
      slData.AddObject(IntToStr(i), objCO);
      gridData2.DataSource.DataSet.Next;
    end;
    mfCO.IS02ExitToMainScreen;

    mfCO.IS02ReadAllOrderNumberJustNewAdded(slData, OrderCount);
    for i := 0 to slData.Count - 1 do
    begin
      DM.DataSetModify('EXEC usp_UpdateCustomerOrder '
        + ' @MNumber=''' + mNumber + ''''
        + ',@CustomerOrderNumber=''' + TCustomerOrder(slData.Objects[i]).CustomerOrderNumber + '''' //slData.ValueFromIndex[i]
        + ',@CustomerOrderID=''' + IntToStr(TCustomerOrder(slData.Objects[i]).CustomerOrderID) + '''' //slData.Names[i]
        + ',@Col=''CustomerOrderID''');
    end;
    gridData2.DataSource.DataSet.Active := false;
    gridData2.DataSource.DataSet.Active := true;
  end;
end;

procedure TCustomerOrderProcessUploadMainframe.UploadIS02ChangeOrder(
  CustomerOrderProcess: TfrmCustomerOrderProcess; mfCO: TMainframeCustomerOrder);
var
  coNum, model, modelID, mainframeModel, custPONum, rtd: string;
  i, plantID, qty: integer;
  price: Double;
begin
  with CustomerOrderProcess do
  begin
    gridData2.DataSource.DataSet.First;
    plantID := gridData2.DataSource.DataSet.FieldByName('PlantID').AsInteger;
    if mfCO.IS02Login(mfCO.mfInitial, IntToStr(cbbMFTypeDetail.ItemIndex + 1), plantID) = false then
    begin
      ShowMessage('Phase-IS02 MainMenu : Error at IS02 MainMenu.');
      exit;
    end;
    gridData2.DataSource.DataSet.First;
    for i := 0 to gridData2.DataSource.DataSet.RecordCount - 1 do
    begin
      coNum := gridData2.DataSource.DataSet.FieldByName('CustomerOrderNumber').AsString;
      model := gridData2.DataSource.DataSet.FieldByName('Model').AsString;
      modelID := gridData2.DataSource.DataSet.FieldByName('ModelID').AsString;

      if (LowerCase(copy(model, 0, 2)) = 'zx')
        or (LowerCase(copy(model, 0, 2)) = 'gp') then
      begin
        mainframeModel := GetMainframeModel(modelID);
        if mainframeModel <> '' then
          model := mainframeModel;
      end;

      custPONum := gridData2.DataSource.DataSet.FieldByName('CustomerPurchaseOrderNumber').AsString;
      rtd := FormatDateTime('mmddyy', gridData2.DataSource.DataSet.FieldByName('RTD').AsDateTime);
      qty := gridData2.DataSource.DataSet.FieldByName('CustomerOrderQuantity').AsInteger;
      price := RoundTo(gridData2.DataSource.DataSet.FieldByName('Price').AsFloat, -2);
      if not mfCO.IS02ChangeMasterOrder(coNum, model, custPONum, rtd, qty, price) then
      begin
        ShowMessage('Phase-IS02 Change Order : Error at IS02 Change Order.');
        exit;
      end;
      gridData2.DataSource.DataSet.Next;
    end;
    mfCO.IS02ExitToMainScreen;
  end;
end;

procedure TCustomerOrderProcessUploadMainframe.UploadIS02DeleteOrder(
  CustomerOrderProcess: TfrmCustomerOrderProcess; mfCO: TMainframeCustomerOrder);
var
  coNum, coID: string;
  i, plantID: integer;
begin
  with CustomerOrderProcess do
  begin
    gridData2.DataSource.DataSet.First;
    plantID := gridData2.DataSource.DataSet.FieldByName('PlantID').AsInteger;
    if mfCO.IS02Login(mfCO.mfInitial, IntToStr(cbbMFTypeDetail.ItemIndex + 1), plantID) = false then
    begin
      ShowMessage('Phase-IS02 MainMenu : Error at IS02 MainMenu.');
      exit;
    end;
    gridData2.DataSource.DataSet.First;
    for i := 0 to gridData2.DataSource.DataSet.RecordCount - 1 do
    begin
      coID := gridData2.DataSource.DataSet.FieldByName('CustomerOrderID').AsString;
      coNum := gridData2.DataSource.DataSet.FieldByName('CustomerOrderNumber').AsString;
      if coNum = '' then
      begin
        ShowMessage('Customer Order No. can''t be empty.');
        exit;
      end;
      if not mfCO.IS02DeleteMasterOrder(coNum) then
      begin
        ShowMessage('Phase-IS02 Delete Order : Error at IS02 Delete Order.');
        exit;
      end;
      DM.DataSetModify('EXEC usp_UpdateCustomerOrder '
        + ' @CustomerOrderID=' + coID
        + ',@CustomerOrderStatesID=7');
      gridData2.DataSource.DataSet.Next;
    end;
    mfCO.IS02ExitToMainScreen;
    gridData2.DataSource.DataSet.Active := false;
    gridData2.DataSource.DataSet.Active := true;
  end;
end;

procedure TCustomerOrderProcessUploadMainframe.UploadIS02DownloadOrder(
  CustomerOrderProcess: TfrmCustomerOrderProcess;
  mfCO: TMainframeCustomerOrder);
var
  mNum: string;
  plantID: integer;
begin
  with CustomerOrderProcess do
  begin
    gridData2.DataSource.DataSet.First;
    plantID := gridData2.DataSource.DataSet.FieldByName('PlantID').AsInteger;
    mNum := gridData2.DataSource.DataSet.FieldByName('MNumber').AsString;
    if not mfCO.IS02Login(mfCO.mfInitial, '8', plantID) then
    begin
      ShowMessage('Phase-IS02 MainMenu : Error at IS02 MainMenu.');
      exit;
    end;
    if not mfCO.IS02DownloadMasterOrder(mNum) then
    begin
      ShowMessage('Phase-IS02 DOWNLOAD : Error at IS02 DOWNLOAD.');
      exit;
    end
    else
      ShowMessage('Download Sucessfully.');
  end;
end;

procedure TCustomerOrderProcessUploadMainframe.DownloadOINQ(CustomerOrderProcess: TfrmCustomerOrderProcess; mfCO: TMainframeCustomerOrder);
var
  LastCustNum, CurrentLineCustNum: string;
  sqlConst: WideString;
  i: integer;
begin
  with CustomerOrderProcess do
  begin
    gridData2.DataSource.DataSet.DisableControls;
    try
      sqlConst := '';
      sqlConst := TADODataSet(gridData2.DataSource.DataSet).CommandText;
      //sqlConst := sqlConst + ',@Col=''CustomerNumber''';
      DM.DataSetQuery(adt_active2, sqlConst);
      sqlConst := '';
      LastCustNum := '';
      gridData2.DataSource.DataSet.First;
      while not gridData2.DataSource.DataSet.Eof do
      begin
        CurrentLineCustNum := gridData2.DataSource.DataSet.fieldbyname('CustomerNumber').AsString;
        if CurrentLineCustNum <> LastCustNum then
        begin
          if not mfCO.OINQInQueryMenu(CurrentLineCustNum) then
          begin
            ShowMessage('Phase-OINQ In Query Menu:Please Add check customer number.');
            exit;
          end;
          if not mfCO.OINQReadOrderReleasedQty(slData) then
          begin
            ShowMessage('Phase-OINQ Scrap data from screen:Error at Scrap OINQ data.');
            exit;
          end;
        end;
        LastCustNum := CurrentLineCustNum;
        gridData2.DataSource.DataSet.Next;
      end;
      mfCO.OINQExitToMainScreen;

      for i := 0 to slData.Count - 1 do
      begin
        if TCustomerOrder(slData.Objects[i]).OINQReleaseCOQuantity <> 0 then
        begin
          gridData2.DataSource.DataSet.First;
          while not gridData2.DataSource.DataSet.Eof do
          begin
            if gridData2.DataSource.DataSet.FieldByName('CustomerOrderNumber').AsString
              = TCustomerOrder(slData.Objects[i]).CustomerOrderNumber then
            begin
            {
              sqlConst := format(sUpdateCustomerOrderReleaseSQL,
                [TCustomerOrder(slData.Objects[i]).OINQCOQuantity,
                TCustomerOrder(slData.Objects[i]).OINQReleaseCOQuantity, 4,
                  gridData2.DataSource.DataSet.FieldByName('CustomerOrderID').AsInteger]);
              if sqlConst <> '' then
                DM.DataSetModify(sqlConst);
                }
              DM.DataSetModify('EXEC usp_UpdateCustomerOrder '
                + ' @OINQCOQuantity=' + IntToStr(TCustomerOrder(slData.Objects[i]).OINQCOQuantity)
                + ',@OINQReleaseCOQuantity=' + IntToStr(TCustomerOrder(slData.Objects[i]).OINQReleaseCOQuantity)
                + ',@CustomerOrderStatesID=4'
                + ',@CustomerOrderID=' + gridData2.DataSource.DataSet.FieldByName('CustomerOrderID').AsString);
              break;
            end;
            gridData2.DataSource.DataSet.Next;
          end;
        end;
      end;
      ShowMessage('Successfully generate OINQ release quantity.');
    finally
      gridData2.DataSource.DataSet.EnableControls;
    end;
  end;
end;

procedure TCustomerOrderProcessUploadMainframe.UploadSPLN(CustomerOrderProcess: TfrmCustomerOrderProcess; mfCO: TMainframeCustomerOrder);
var
  freightCost, custNo, invoiceNumber, currentPage, totalPage: string;
  sqlConst, SPLNOrderNumber, pieces: string;
  actualReleaseCOQuantity: integer;
  adt_coRelease, adt_invoice: TADODataSet;

  procedure WriteCOReleaeQty(CustomerOrderProcess: TfrmCustomerOrderProcess; adt_coRelease: TADODataSet);
  var
    i, OrderQty: integer;
  begin
    with CustomerOrderProcess do
    begin
      for i := 6 to 19 do
      begin
        if mfCO.MainframeScreenReadRow(i, 1, 79) <> '' then
        begin
          SPLNOrderNumber := mfCO.SPLNNewItemsReadOrderNumber(i);
          sqlConst := TADODataSet(gridData2.DataSource.DataSet).CommandText;
          sqlConst := sqlConst + ',@CustomerOrderNumber=''' + SPLNOrderNumber + '''';
          DM.DataSetQuery(adt_coRelease, sqlConst);
          if adt_coRelease.RecordCount > 0 then
          begin
            OrderQty := adt_coRelease.FieldByName('CustomerOrderQuantity').AsInteger;
            actualReleaseCOQuantity := adt_coRelease.fieldbyname('ActualReleaseCOQuantity').AsInteger;
            if actualReleaseCOQuantity = 0 then
              actualReleaseCOQuantity := adt_coRelease.fieldbyname('OINQReleaseCOQuantity').AsInteger;
            if actualReleaseCOQuantity > OrderQty then
              actualReleaseCOQuantity := OrderQty;
            mfCO.SPLNAddNewItems(i, IntToStr(actualReleaseCOQuantity));
          end
          else
          begin
       {warinMessage := 'ID: ' + adt_coRelease.fieldbyname('CustomerOrderID').AsString
        + ', Order Number: ' + adt_coRelease.fieldbyname('CustomerOrderNumber').AsString
        + ' haven''t released quantity, is continue?';
      if MessageDlg(warinMessage, mtConfirmation, [mbYes, mbNo], 0) = mrNo then
        exit;   }
          end;
        end
        else
          Break;
      end;
    end;
  end;
begin
  with CustomerOrderProcess do
  begin
    pieces := IntToStr(strtoint(VarToStr(gridData2.FieldColumns['ActualReleaseCOQuantity'].Footer.SumValue))
      + strtoint(VarToStr(gridData2.FieldColumns['OINQReleaseCOQuantity'].Footer.SumValue)));
    freightCost := trim(edtMFAttach.Text);

    if not mfCO.SPLNLogin(mfCO.mfPlant, mfCO.mfInitial, mfCO.mfPassword) then
    begin
      ShowMessage('Phase-SPLN MainMenu : Error at SPLN MainMenu.');
      exit;
    end;
    gridData2.DataSource.DataSet.First;
    custNo := gridData2.DataSource.DataSet.fieldbyname('CustomerNumber').AsString;
    invoiceNumber := mfCO.SPLNAddMasterOrder(custNo);
    if invoiceNumber = '' then
    begin
      ShowMessage('Phase-SPLN Add Master Order : Error at SPLN Add Master Order.');
      exit;
    end;

    adt_coRelease := TADODataSet.Create(nil);
    adt_invoice := TADODataSet.Create(nil);
    try
      while true do
      begin
        WriteCOReleaeQty(CustomerOrderProcess, adt_coRelease);

        currentPage := mfCO.SPLNNewItemsGetCurrentPage();
        if currentPage = '' then
        begin
          ShowMessage('Phase-SPLN Add New Items : Error at SPLN get current page.');
          exit;
        end;
        totalPage := mfCO.SPLNNewItemsGetTotalPage();
        if totalPage = '' then
        begin
          if custNo = '7399' then
          begin
            totalPage := '30';
          end
          else if lowercase(custNo) = 'u12s' then
          begin
            totalPage := '9';
          end
          else
          begin
            ShowMessage('Phase-SPLN Add New Items : Error at SPLN get total page.');
            exit;
          end;
        end;
        if currentPage <> totalPage then
        begin
          mfCO.MainframeScreenForward;
          if mfCO.MainframeScreenReadRow(20, 29, 40) = 'MAY NOT PICK MORE THAN ORDERED' then
          begin
            ShowMessage('Phase-SPLN Add New Items : MAY NOT PICK MORE THAN ORDERED.');
            exit;
          end;
        end
        else
        begin
          Break;
        end;
      end;

      if not mfCO.SPLNAddOrderAttach(pieces, freightCost) then
      begin
        ShowMessage('Phase-SPLN Add New Items : Error at add product weight.');
        exit;
      end
      else
      begin
        while not gridData2.DataSource.DataSet.Eof do
        begin
          DM.DataSetModify('EXEC usp_UpdateCustomerOrder '
            + ' @CustomerOrderStatesID=5'
            + ',@InvoiceNumber=''' + invoiceNumber + ''''
            + ',@CustomerOrderID=' + gridData2.DataSource.DataSet.FieldByName('CustomerOrderID').AsString);
          gridData2.DataSource.DataSet.Next;
        end;
      end;
      mfCO.SPLNExitToMainScreen;
      DM.DataSetModify(' EXEC usp_InsertCustomerOrderInvoice @InvoiceNumber=''' + invoiceNumber + ''''
        + ',@FreightCost=' + Trim(edtMFAttach.Text));
      DM.DataSetQuery(adt_invoice, 'EXEC usp_GetCustomerOrderInvoice '
        + ' @InvoiceNumber=''' + invoiceNumber + ''''
        + ',@FreightCost=' + Trim(edtMFAttach.Text));
      if adt_invoice.RecordCount = 0 then
      begin
        ShowMessage('Successfully generate invoice number,but faild send invoice to warehouse.');
        exit;
      end;
      ShowMessage('Successfully generate invoice number.');
    finally
      adt_coRelease.Free;
      adt_invoice.Free;
    end;
  end;
end;

procedure TCustomerOrderProcessUploadMainframe.UploadSPLNChangeFreightCost(
  CustomerOrderProcess: TfrmCustomerOrderProcess; mfCO: TMainframeCustomerOrder);
var
  InvoiceNumber: string;
  FreightCost: Double;
begin
  with CustomerOrderProcess do
  begin
    if trim(edtMFAttach.Text) = '' then
    begin
      ShowMessage('Please input freight cost.');
      exit;
    end;
    if not IsNumberic(trim(edtMFAttach.Text)) then
    begin
      ShowMessage('Freight cost must be number.');
      exit;
    end;
    FreightCost := StrToFloat(trim(edtMFAttach.Text));
    gridData2.DataSource.DataSet.First;
    InvoiceNumber := gridData2.DataSource.DataSet.fieldbyname('InvoiceNumber').AsString;
    if not mfCO.SPLNLogin(mfCO.mfPlant, mfCO.mfInitial, mfCO.mfPassword) then
    begin
      ShowMessage('Phase-SPLN MainMenu : Error at SPLN MainMenu.');
      exit;
    end;
    if not mfCO.SPLNChangeFreightCost(InvoiceNumber, FreightCost) then
    begin
      ShowMessage('Phase-SPLN FREIGHT ASSIGNMENT SCREEN : Error at SPLN Change Freight Cost.');
      exit;
    end;
    mfCO.SPLNExitToMainScreen;
    DM.DataSetModify('EXEC usp_UpdateCustomerOrderInvoiceByInvoiceNum '
      + ' @InvoiceNumber =''' + InvoiceNumber + ''''
      + ',@FreightCost=''' + trim(edtMFAttach.Text) + '''');
    ShowMessage('Successfully update freight cost.');
  end;
end;

procedure TCustomerOrderProcessUploadMainframe.UploadSPLNDeleteInvoice(
  CustomerOrderProcess: TfrmCustomerOrderProcess; mfCO: TMainframeCustomerOrder);
var
  InvoiceNumber, CustomerNumber: string;
begin
  with CustomerOrderProcess do
  begin
    if trim(edtMFAttach.Text) = '' then
    begin
      ShowMessage('Please input Invoice Number.');
      exit;
    end;
    InvoiceNumber := trim(edtMFAttach.Text);
    gridData2.DataSource.DataSet.First;
    CustomerNumber := gridData2.DataSource.DataSet.fieldbyname('CustomerNumber').AsString;
    if not mfCO.SPLNLogin(mfCO.mfPlant, mfCO.mfInitial, mfCO.mfPassword) then
    begin
      ShowMessage('Phase-SPLN MainMenu : Error at SPLN MainMenu.');
      exit;
    end;
    if not mfCO.SPLNDeleteInvoice(InvoiceNumber, CustomerNumber) then
    begin
      ShowMessage('Error at SPLN Delete Invoice.');
      exit;
    end;
    while not gridData2.DataSource.DataSet.Eof do
    begin
      DM.DataSetModify('EXEC usp_UpdateCustomerOrderInvoiceByCustomerOrderID '
        + ' @InvoiceNumber='''''
        + ',@CustomerOrderID=' + gridData2.DataSource.DataSet.fieldbyname('CustomerOrderID').AsString);
      gridData2.DataSource.DataSet.Next;
    end;
    mfCO.SPLNExitToMainScreen;
    ShowMessage('Success delete.');
  end;
end;

procedure TCustomerOrderProcessUploadMainframe.UploadINVC(
  CustomerOrderProcess: TfrmCustomerOrderProcess;
  mfCO: TMainframeCustomerOrder);
begin

end;

end.

