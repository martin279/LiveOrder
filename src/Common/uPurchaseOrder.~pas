unit uPurchaseOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB;

type
  //JIT
  TobjSche = class
    AssemblyLineID: integer;
    ModelID: integer;
    ScheduleQuantity: integer;
    ScheduleStartTime: TDateTime;
    ScheduleEndTime: TDateTime;
  end;
  TobjBOM = class
    ModelID: integer;
    ComponentID: integer;
    bomQty: Double;
  end;
  TobjMRP = class
    AssemblyLineID: integer;
    ModelID: integer;
    ComponentID: integer;
    mrpQty: Double;
    ScheduleStartTime: TDateTime;
    ScheduleEndTime: TDateTime;
  end;
  TobjMRP2Hours = class
    AssemblyLineID: integer;
    ModelID: integer;
    ComponentID: integer;
    mrpQty: Double;
    ScheduleStartTime: TDateTime;
    ScheduleEndTime: TDateTime;
  end;
  TobjPO = class
    VendorID: integer;
    AssemblyLineID: integer;
    ModelID: integer;
    ComponentID: integer;
    poQty: Double;
    ScheduleStartTime: TDateTime;
    RTA: TDateTime;
    PurchaseOrderNumber: string;
    PurchaseOrderStatesID: integer;
  end;
  TobjComponent = class
    ComponentID: integer;
    CurrentInventoryCount: Double;
    MinimumLevel: Double;
  end;

  TPurchaseOrder = class
  private
    { Private declarations }
    //JIT
    slSche: TStringList;
    slBOM: TStringList;
    slMRP: TStringList;
    slMRP2Hours: TStringList;
    slPO: TStringList;
    slComponent: TStringList;
    objSche: TobjSche;
    objBOM: TobjBOM;
    objMRP: TobjMRP;
    objMRP2Hours: TobjMRP2Hours;
    objPO: TobjPO;
    objComponent: TobjComponent;
 {   procedure CalculateActualConsumption;
    procedure CalculateSchedule2Hours(adt_Schedule24Hours: TADODataSet);
    procedure CalculateMRP24Hours;
    procedure CalculateMRP2Hours;
    procedure CalculatePO;
    procedure ProcessPOToDB;  }
  public
    { Public declarations }
    constructor Create; virtual;
    destructor Destroy; override;
    //procedure mjGeneratePO;
    function CalculateSchedule: Boolean;
    function CalculateMRP: Boolean;
    function CalculatePO: Boolean;
    function ProcessPOToDB: Boolean;
    function ReleasePO: Boolean;

    function JITCalculateActualConsumption: boolean;
    function JITCalculateSchedule2Hours: Boolean;
    function JITCalculateMRP24Hours: Boolean;
    function JITCalculateMRP2Hours: Boolean;
    function JITCalculatePO: Boolean;
    function JITProcessPOToDB: Boolean;
    function JITReleasePO: Boolean;
  end;

implementation

uses DataModule, uMJ, Math, ufrmMain, DateUtils;

constructor TPurchaseOrder.Create;
begin
  slBOM := TStringList.Create;
  slSche := TStringList.Create;
  slMRP := TStringList.Create;
  slMRP2Hours := TStringList.Create;
  slPO := TStringList.Create;
  slComponent := TStringList.Create;
end;

destructor TPurchaseOrder.Destroy;
var
  i: integer;
begin
  for i := slSche.Count - 1 downto 0 do
    if Assigned(slSche.Objects[i]) then
      slSche.Objects[i].Free;
  for i := slBOM.Count - 1 downto 0 do
    if Assigned(slBOM.Objects[i]) then
      TobjBOM(slBOM.Objects[i]).Free;
  for i := slMRP.Count - 1 downto 0 do
    if Assigned(slMRP.Objects[i]) then
      TobjMRP(slMRP.Objects[i]).Free;
  for i := slMRP2Hours.Count - 1 downto 0 do
    if Assigned(slMRP2Hours.Objects[i]) then
      TobjMRP2Hours(slMRP2Hours.Objects[i]).Free;
  for i := slPO.Count - 1 downto 0 do
    if Assigned(slPO.Objects[i]) then
      TobjPO(slPO.Objects[i]).Free;
  for i := slComponent.Count - 1 downto 0 do
    if Assigned(slComponent.Objects[i]) then
      TobjComponent(slComponent.Objects[i]).Free;
  slPO.Free;
  slMRP2Hours.Free;
  slMRP.Free;
  slSche.Free;
  slBOM.Free;
  slComponent.Free;
  inherited;
end;

function TPurchaseOrder.CalculateSchedule: Boolean;
var
  a: array[1..1000] of TDateTime;
  bDTIndex, eDTIndex: integer;
  j, k, h, scheQty: integer;
  bDT, eDT, period: TDateTime;
  adt_schedule: TADODataSet;
begin
  adt_schedule := TADODataSet.Create(nil);
  try
    a[1] := StrToDateTime(formatdatetime('YYYY-mm-dd', floattodatetime(date - 3)) + ' 1:00');
    for h := 1 to 500 do
    begin
      a[h] := a[1] + h * strtodatetime('02:00');
    end;

    DM.DataSetQuery(adt_schedule, 'EXEC usp_GetProductionScheduleForCalculate @EndTime=''' + DateTimeToStr(date() + 1) + '''');
    h := 0;
    while not adt_schedule.Eof do
    begin
      scheQty := adt_schedule.FieldByName('ScheduleQuantity').AsInteger;
      bDT := adt_schedule.FieldByName('ScheduleStartTime').AsDateTime;
      eDT := adt_schedule.FieldByName('ScheduleEndTime').AsDateTime;
      period := eDT - bDT;
      bDTIndex := 1;
      eDTIndex := 1;
      for j := 1 to 500 do
      begin
        if (bDT >= a[j]) and (bDT < a[j + 1]) then
        begin
          bDTIndex := j;
        end;
        if (eDT >= a[j]) and (eDT < a[j + 1]) then
        begin
          eDTIndex := j;
        end;
      end;

      if bDTIndex = eDTIndex then
      begin
        objSche := TobjSche.Create();
        objSche.AssemblyLineID := adt_schedule.FieldByName('AssemblyLineID').AsInteger;
        objSche.ModelID := adt_schedule.FieldByName('ModelID').AsInteger;
        objSche.ScheduleStartTime := bDT;
        objSche.ScheduleEndTime := eDT;
        objSche.ScheduleQuantity := scheQty;
        slSche.AddObject(IntToStr(h), objSche);
     { Memo1.Lines.Add(IntToStr(objSche.AssemblyLineID)
        + ',' + IntToStr(objSche.ModelID)
        + ',' + FloatToStr(objSche.ScheduleQuantity)
        + ',' + DateTimeToStr(objSche.ScheduleStartTime)
        + ',' + DateTimeToStr(objSche.ScheduleEndTime)); }
        h := h + 1;
      end
      else
      begin
        for k := bDTIndex to eDTIndex do
        begin
          objSche := TobjSche.Create();
          objSche.AssemblyLineID := adt_schedule.FieldByName('AssemblyLineID').AsInteger;
          objSche.ModelID := adt_schedule.FieldByName('ModelID').AsInteger;
          if k = bDTIndex then
          begin
            objSche.ScheduleStartTime := bDT;
            objSche.ScheduleEndTime := a[k + 1];
            objSche.ScheduleQuantity :=
              mjGetRound(scheQty * (a[k + 1] - objSche.ScheduleStartTime) / period);
          end
          else
          begin
            if k = eDTIndex then
            begin
              objSche.ScheduleStartTime := a[k];
              objSche.ScheduleEndTime := eDT;
              objSche.ScheduleQuantity :=
                mjGetRound(scheQty * (objSche.ScheduleEndTime - a[k]) / period);
            end
            else
            begin
              objSche.ScheduleStartTime := a[k];
              objSche.ScheduleEndTime := a[k + 1];
              objSche.ScheduleQuantity := mjGetRound(scheQty * (a[k + 1] - a[k]) / period);
            end;
          end;
          slSche.AddObject(IntToStr(h), objSche);
       { Memo1.Lines.Add(IntToStr(objSche.AssemblyLineID)
          + ',' + IntToStr(objSche.ModelID)
          + ',' + FloatToStr(objSche.ScheduleQuantity)
          + ',' + DateTimeToStr(objSche.ScheduleStartTime)
          + ',' + DateTimeToStr(objSche.ScheduleEndTime));}
          h := h + 1;
        end;
      end;
      adt_schedule.Next;
    end;
  finally
    adt_schedule.Free;
    Result := true;
  end;
end;

function TPurchaseOrder.CalculateMRP: Boolean;
begin

  Result := true;
end;

function TPurchaseOrder.CalculatePO: Boolean;
begin

  Result := true;
end;

function TPurchaseOrder.ProcessPOToDB: Boolean;
begin

  Result := true;
end;

function TPurchaseOrder.ReleasePO: Boolean;
begin
  Result := true;
end;


//--------------JIT--------------------------------------------------

function TPurchaseOrder.JITCalculateSchedule2Hours: Boolean;
var
  a: array[1..1000] of TDateTime;
  bDTIndex, eDTIndex: integer;
  j, k, h, scheQty: integer;
  bDT, eDT, period: TDateTime;
  adt_schedule: TADODataSet;
begin
  adt_schedule := TADODataSet.Create(nil);
  try
    a[1] := StrToDateTime(formatdatetime('YYYY-mm-dd', floattodatetime(date - 3)) + ' 1:00');
    for h := 1 to 500 do
    begin
      a[h] := a[1] + h * strtodatetime('02:00');
    end;

    //DM.DataSetQuery(adt_schedule, sQueryProductionScheduleForCalculateSQL);
    DM.DataSetQuery(adt_schedule, 'EXEC usp_GetProductionScheduleForCalculate @EndTime=''' + DateTimeToStr(date() + 1) + '''');
    h := 0;
    while not adt_schedule.Eof do
    begin
      scheQty := adt_schedule.FieldByName('ScheduleQuantity').AsInteger;
      bDT := adt_schedule.FieldByName('ScheduleStartTime').AsDateTime;
      eDT := adt_schedule.FieldByName('ScheduleEndTime').AsDateTime;
      period := eDT - bDT;
      bDTIndex := 1;
      eDTIndex := 1;
      for j := 1 to 500 do
      begin
        if (bDT >= a[j]) and (bDT < a[j + 1]) then
        begin
          bDTIndex := j;
        end;
        if (eDT >= a[j]) and (eDT < a[j + 1]) then
        begin
          eDTIndex := j;
        end;
      end;

      if bDTIndex = eDTIndex then
      begin
        objSche := TobjSche.Create();
        objSche.AssemblyLineID := adt_schedule.FieldByName('AssemblyLineID').AsInteger;
        objSche.ModelID := adt_schedule.FieldByName('ModelID').AsInteger;
        objSche.ScheduleStartTime := bDT;
        objSche.ScheduleEndTime := eDT;
        objSche.ScheduleQuantity := scheQty;
        slSche.AddObject(IntToStr(h), objSche);
     { Memo1.Lines.Add(IntToStr(objSche.AssemblyLineID)
        + ',' + IntToStr(objSche.ModelID)
        + ',' + FloatToStr(objSche.ScheduleQuantity)
        + ',' + DateTimeToStr(objSche.ScheduleStartTime)
        + ',' + DateTimeToStr(objSche.ScheduleEndTime)); }
        h := h + 1;
      end
      else
      begin
        for k := bDTIndex to eDTIndex do
        begin
          objSche := TobjSche.Create();
          objSche.AssemblyLineID := adt_schedule.FieldByName('AssemblyLineID').AsInteger;
          objSche.ModelID := adt_schedule.FieldByName('ModelID').AsInteger;
          if k = bDTIndex then
          begin
            objSche.ScheduleStartTime := bDT;
            objSche.ScheduleEndTime := a[k + 1];
            objSche.ScheduleQuantity :=
              mjGetRound(scheQty * (a[k + 1] - objSche.ScheduleStartTime) / period);
          end
          else
          begin
            if k = eDTIndex then
            begin
              objSche.ScheduleStartTime := a[k];
              objSche.ScheduleEndTime := eDT;
              objSche.ScheduleQuantity :=
                mjGetRound(scheQty * (objSche.ScheduleEndTime - a[k]) / period);
            end
            else
            begin
              objSche.ScheduleStartTime := a[k];
              objSche.ScheduleEndTime := a[k + 1];
              objSche.ScheduleQuantity := mjGetRound(scheQty * (a[k + 1] - a[k]) / period);
            end;
          end;
          slSche.AddObject(IntToStr(h), objSche);
       { Memo1.Lines.Add(IntToStr(objSche.AssemblyLineID)
          + ',' + IntToStr(objSche.ModelID)
          + ',' + FloatToStr(objSche.ScheduleQuantity)
          + ',' + DateTimeToStr(objSche.ScheduleStartTime)
          + ',' + DateTimeToStr(objSche.ScheduleEndTime));}
          h := h + 1;
        end;
      end;
      adt_schedule.Next;
    end;
  finally
    adt_schedule.Free;
    Result := true;
  end;
end;

function TPurchaseOrder.JITCalculateMRP24Hours: Boolean;
var
  adt_bom: TADODataSet;
  i, j, k: integer;
begin
  adt_bom := TADODataSet.Create(nil);
  try
    //DM.DataSetQuery(adt_bom, Format(sQueryBOMSQLOnlyAmtekWithoutSummit, ['']));
    DM.DataSetQuery(adt_bom, 'EXEC usp_GetBOM @VendorID=17,@IsSummit=2,@Col=''ComponentID''');
    for i := 0 to adt_bom.RecordCount - 1 do
    begin
      objBOM := TobjBOM.Create;
      objBOM.ModelID := adt_bom.fieldbyName('ModelID').AsInteger;
      objBOM.ComponentID := adt_bom.fieldbyName('ComponentID').AsInteger;
      objBOM.bomQty := adt_bom.fieldbyName('ComponentQuantity').AsFloat;
      slBOM.AddObject(IntToStr(i), objBOM);
      adt_bom.Next;
    end;

    k := 0;
    for i := 0 to slSche.Count - 1 do
    begin
      for j := 0 to slBOM.Count - 1 do
      begin
        if TobjSche(slSche.Objects[i]).ModelID
          = TobjBOM(slBOM.Objects[j]).ModelID then
        begin
          objMRP := TobjMRP.Create;
          objMRP.ComponentID := TobjBOM(slBOM.Objects[j]).ComponentID;
          objMRP.mrpQty := TobjSche(slSche.Objects[i]).ScheduleQuantity
            * TobjBOM(slBOM.Objects[j]).bomQty;

          objMRP.AssemblyLineID := TobjSche(slSche.Objects[i]).AssemblyLineID;
          objMRP.ModelID := TobjSche(slSche.Objects[i]).ModelID;
          objMRP.ScheduleStartTime := TobjSche(slSche.Objects[i]).ScheduleStartTime;
          objMRP.ScheduleEndTime := TobjSche(slSche.Objects[i]).ScheduleEndTime;
          slMRP.AddObject(IntToStr(k), objMRP);
      {  Memo1.Lines.Add(IntToStr(objMRP.AssemblyLineID)
          + ',' + IntToStr(objMRP.ModelID)
          + ',' + IntToStr(objMRP.ComponentID)
          + ',' + FloatToStr(objMRP.mrpQty)
          + ',' + DateTimeToStr(objMRP.ScheduleStartTime)
          + ',' + DateTimeToStr(objMRP.ScheduleEndTime));  }
          k := k + 1;
        end;
      end;
    end;
  finally
    adt_bom.Free;
    Result := true;
  end;
end;

function TPurchaseOrder.JITCalculateMRP2Hours: Boolean;
var
  a: array[1..1000] of TDateTime;
  i, h: integer;
begin
  a[1] := StrToDateTime(formatdatetime('YYYY-mm-dd', floattodatetime(date - 3)) + ' 1:00');
  for h := 1 to 500 do
  begin
    a[h] := a[1] + h * strtodatetime('02:00');
  end;
  for i := 0 to slMRP.Count - 1 do
  begin
    objMRP2Hours := TobjMRP2Hours.Create;
    objMRP2Hours.AssemblyLineID := TobjMRP(slMRP.Objects[i]).AssemblyLineID;
    objMRP2Hours.ModelID := TobjMRP(slMRP.Objects[i]).ModelID;
    objMRP2Hours.ComponentID := TobjMRP(slMRP.Objects[i]).ComponentID;
    objMRP2Hours.mrpQty := TobjMRP(slMRP.Objects[i]).mrpQty;
    for h := 1 to 500 do
    begin
      if (TobjMRP(slMRP.Objects[i]).ScheduleStartTime >= a[h])
        and (TobjMRP(slMRP.Objects[i]).ScheduleStartTime < a[h + 1]) then
      begin
        objMRP2Hours.ScheduleStartTime := a[h];
        objMRP2Hours.ScheduleEndTime := a[h + 1];
        Break;
      end;
    end;
    slMRP2Hours.AddObject(IntToStr(i), objMRP2Hours);
   { Memo1.Lines.Add(IntToStr(objMRP2Hours.AssemblyLineID)
      + ',' + IntToStr(objMRP2Hours.ModelID)
      + ',' + IntToStr(objMRP2Hours.ComponentID)
      + ',' + FloatToStr(objMRP2Hours.mrpQty)
      + ',' + DateTimeToStr(objMRP2Hours.ScheduleStartTime)
      + ',' + DateTimeToStr(objMRP2Hours.ScheduleEndTime));  }
  end;
  Result := true;
end;

function TPurchaseOrder.JITCalculatePO: Boolean;
var
  componentID, i, OnWayPurchaseOrderQuantity: integer;
  adt_component, adt_po, adt_vc, adt_onlineInv: TADODataSet;

  function getPOQtyByPackge(qty: double; componentID1: integer): integer;
  var
    adt_component1: TADODataSet;
    packgeQty: integer;
  begin
    adt_component1 := TADODataSet.Create(nil);
    try
      if qty < 0 then
        qty := -1 * qty;
      //DM.DataSetQuery(adt_component1, format(sQueryComponentAmteckSQL, [' and ComponentID = ' + inttostr(componentID1)]));
      DM.DataSetQuery(adt_component1, 'EXEC usp_GetComponent @VendorID=17,@ComponentID=' + inttostr(componentID1));
      packgeQty := adt_component1.fieldbyname('PackageQuantity').AsInteger;
      if packgeQty = 0 then packgeQty := 1;
      if (mjGetRound(qty) mod packgeQty) = 0 then
      begin
        result := mjGetRound(qty)
      end
      else
        result := ((mjGetRound(qty) div packgeQty) + 1) * packgeQty;
    finally
      adt_component1.Free;
    end;
  end;
    {
  function getDueDateByRules(DueDate: TDateTime; IsHaveMiddleShift: Boolean): string;
  var
    date1, time1: string;
  begin
    DueDate := DueDate - 4 / 24;
    date1 := formatdatetime('yyyy-mm-dd', DueDate);
    time1 := formatdatetime('hh:mm', DueDate);
    case IsHaveMiddleShift of
      true:
        begin
          if (StrToTime(time1) >= StrToTime('3:00')) and (StrToTime(time1) <= StrToTime('7:00')) then
            result := DateToStr((strtodate(date1) - 1)) + ' 21:00'
          else
            result := DateTimeToStr(DueDate);
        end;
      false:
        begin
          if (StrToTime(time1) >= StrToTime('3:00')) and (StrToTime(time1) <= StrToTime('7:00')) then
            result := DateToStr((strtodate(date1) - 1)) + ' 15:00'
          else
            result := DateTimeToStr(DueDate);
        end;
    end;
  end;   }
begin
  adt_component := TADODataSet.Create(nil);
  adt_po := TADODataSet.Create(nil);
  adt_vc := TADODataSet.Create(nil);
  adt_onlineInv := TADODataSet.Create(nil);
  try
    //DM.DataSetQuery(adt_component, format(sQueryComponentAmteckSQL, ['']));
    DM.DataSetQuery(adt_component, 'EXEC usp_GetComponent @VendorID=17');
    while not adt_component.Eof do
    begin
      objComponent := TobjComponent.Create;
      objComponent.ComponentID := adt_component.fieldbyname('ComponentID').AsInteger;
      objComponent.MinimumLevel := adt_component.fieldbyname('MinimumLevel').AsFloat;
      objComponent.CurrentInventoryCount := adt_component.fieldbyname('CurrentInventoryCount').AsFloat;
      //sqlConst := ' and ComponentID=' + IntToStr(objComponent.ComponentID);
      //sqlConst := sqlConst + ' and RTA <= dateadd(mi,30,getdate())';
      //DM.DataSetQuery(adt_onlineInv, format(sQueryOnlineInventorySQL, [sqlConst]));
      DM.DataSetQuery(adt_onlineInv, 'EXEC usp_GetInventoryOnWay @ComponentID=' + IntToStr(objComponent.ComponentID));
      if adt_onlineInv.RecordCount = 1 then
        OnWayPurchaseOrderQuantity := adt_onlineInv.fieldbyname('OnWayPurchaseOrderQuantity').AsInteger
      else
        OnWayPurchaseOrderQuantity := 0;
      objComponent.CurrentInventoryCount := objComponent.CurrentInventoryCount + OnWayPurchaseOrderQuantity;

      slComponent.AddObject(adt_component.fieldbyname('ComponentID').AsString, objComponent);
      adt_component.Next;
    end;
    //DM.DataSetQuery(adt_po, format(sQueryPurchaseOrderSQL, [' and PurchaseOrderStatesID<>1 and PurchaseOrderStatesID<>2']));
    DM.DataSetQuery(adt_po, 'EXEC usp_GetPurchaseOrderJIT @PurchaseOrderStatesID=''3,4,5''');
    for i := 0 to slMRP2Hours.Count - 1 do
    begin
      componentID := TobjMRP2Hours(slMRP2Hours.Objects[i]).componentID;
      objPO := TobjPO.Create;
      objPO.AssemblyLineID := TobjMRP2Hours(slMRP2Hours.Objects[i]).AssemblyLineID;
      objPO.ModelID := TobjMRP2Hours(slMRP2Hours.Objects[i]).ModelID;
      objPO.ComponentID := componentID;
    //VendorID
      DM.DataSetQuery(adt_vc, 'EXEC usp_GetVendorComponent @ComponentID=' + IntToStr(componentID));
      objPO.VendorID := adt_vc.fieldbyname('VendorID').AsInteger;
    //ScheduleStartTime
      objPO.ScheduleStartTime := TobjMRP2Hours(slMRP2Hours.Objects[i]).ScheduleStartTime;
      objPO.RTA := objPO.ScheduleStartTime - 2 / 24;
    {
    case TimeToStr(TobjMRP2Hours(slMRP2Hours.Objects[i]).ScheduleStartTime) = '15:30' of
      true:
        objPO.RTA := StrToDateTime(getDueDateByRules(objPO.ScheduleStartTime, false));
      false:
        objPO.RTA := StrToDateTime(getDueDateByRules(objPO.ScheduleStartTime, true));
    end;}
    //poQty
      objPO.poQty := TobjMRP2Hours(slMRP2Hours.Objects[i]).mrpQty
        + TobjComponent(slComponent.Objects[slComponent.IndexOf(IntToStr(componentID))]).MinimumLevel
      - TobjComponent(slComponent.Objects[slComponent.IndexOf(IntToStr(componentID))]).CurrentInventoryCount;
      case objPO.poQty < 0 of
        true:
          begin
            TobjComponent(slComponent.Objects[slComponent.IndexOf(IntToStr(componentID))]).CurrentInventoryCount :=
            TobjComponent(slComponent.Objects[slComponent.IndexOf(IntToStr(componentID))]).CurrentInventoryCount
            - TobjMRP2Hours(slMRP2Hours.Objects[i]).mrpQty;
          end;
        false:
          begin
          //PurchaseOrderStatesID
            objPO.PurchaseOrderStatesID := 1;
            if adt_po.RecordCount > 0 then
            begin
              adt_po.First;
              while not adt_po.Eof do
              begin
                if (objPO.VendorID = adt_po.FieldByName('VendorID').AsInteger)
                  and (objPO.ComponentID = adt_po.FieldByName('ComponentID').AsInteger)
                  and (FormatDateTime('YYYY-mm-dd hh:mm', objPO.RTA) = FormatDateTime('YYYY-mm-dd hh:mm', adt_po.FieldByName('RTA').AsDateTime)) then
                begin
                  objPO.poQty := objPO.poQty - adt_po.FieldByName('PurchaseOrderQuantity').AsInteger;
                  objPO.RTA := objPO.ScheduleStartTime;
                //PurchaseOrderStatesID
                  objPO.PurchaseOrderStatesID := 5;
                //a := FormatDateTime('YYYY-mm-dd hh:mm', objPO.RTA);
                //Break;
                end;
                adt_po.Next;
              end;
            end;
            if objPO.poQty > 0 then
            begin
              objPO.poQty := getPOQtyByPackge(objPO.poQty, objPO.ComponentID);
              TobjComponent(slComponent.Objects[slComponent.IndexOf(IntToStr(componentID))]).CurrentInventoryCount :=
              TobjComponent(slComponent.Objects[slComponent.IndexOf(IntToStr(componentID))]).CurrentInventoryCount
              + objPO.poQty - TobjMRP2Hours(slMRP2Hours.Objects[i]).mrpQty;
              slPO.AddObject(IntToStr(i), objPO);
            {frmMain.Memo1.Lines.Add(IntToStr(objPO.VendorID)
              + ',' + IntToStr(objPO.AssemblyLineID)
              + ',' + IntToStr(objPO.ModelID)
              + ',' + IntToStr(objPO.ComponentID)
              + ',' + FloatToStr(objPO.poQty)
              + ',' + DateTimeToStr(objPO.ScheduleStartTime)
              + ',' + DateTimeToStr(objPO.RTA)
              + ',' + IntToStr(objPO.PurchaseOrderStatesID));}
            end;
          end;
      end;
    end;
  finally
    adt_po.Free;
    adt_component.Free;
    adt_vc.Free;
    adt_onlineInv.Free;
    Result := true;
  end;
end;

function TPurchaseOrder.JITProcessPOToDB: Boolean;
var
  adt_po_cache: TADODataSet;
  i: integer;
begin
  adt_po_cache := TADODataSet.Create(nil);
  try
   { sqlConst := ' and ComponentID not in (''40'',''374'',''73'',''74'',''64'')';
    sqlConst := sqlConst + ' and (PurchaseOrderStatesID=1 or PurchaseOrderStatesID=2)';
    DM.DataSetModify(format(sDeletePOSQL, [sqlConst])); }
    //DM.DataSetQuery(adt_po_cache, format(sQueryPurchaseOrderCacheSQL, ['']));
    //DM.DataSetModify('EXEC usp_DeletePurchaseOrder @PurchaseOrderStatesID=''1,2'''
    //  + ',@ComponentID=''40,374,73,74,64''');
    DM.DataSetModify('EXEC usp_DeletePurchaseOrderJIT @PurchaseOrderStatesID=''1,2''');
    DM.DataSetQuery(adt_po_cache, 'EXEC usp_GetPurchaseOrderCacheJIT');
    for i := 0 to slPO.Count - 1 do
    begin
    //if not (adt_po_cache.State in [dsEdit]) then
      //adt_po_cache.Edit;
      adt_po_cache.Append;
      adt_po_cache.FieldByName('VendorID').Value := TobjPO(slPO.Objects[i]).VendorID;
      adt_po_cache.FieldByName('AssemblyLineID').Value := TobjPO(slPO.Objects[i]).AssemblyLineID;
      adt_po_cache.FieldByName('ModelID').Value := TobjPO(slPO.Objects[i]).ModelID;
      adt_po_cache.FieldByName('ComponentID').Value := TobjPO(slPO.Objects[i]).ComponentID;
      adt_po_cache.FieldByName('PurchaseOrderQuantity').Value := TobjPO(slPO.Objects[i]).poQty;
      adt_po_cache.FieldByName('ScheduleStartTime').Value := TobjPO(slPO.Objects[i]).ScheduleStartTime;
      adt_po_cache.FieldByName('RTA').Value := TobjPO(slPO.Objects[i]).RTA;
      adt_po_cache.FieldByName('PurchaseOrderStatesID').Value := TobjPO(slPO.Objects[i]).PurchaseOrderStatesID;
      adt_po_cache.Post;
    end;
    //DM.DataSetModify(sProcessPurchaseOpenOrderSQL + sProcessPurchaseEmergencyOrderSQL);
    DM.DataSetModify('EXEC usp_ProcessPurchaseOrderJIT');
  finally
    adt_po_cache.Free;
    Result := true;
  end;
end;

function TPurchaseOrder.JITCalculateActualConsumption: Boolean;
var
  adtWIP, adtBom, adtComponent: TADODataSet;
  sqlConst, sqlTotal, model, component: string;
  consumpQty, bomQty: Double;
begin
  adtWIP := TADODataSet.Create(nil);
  adtBom := TADODataSet.Create(nil);
  adtComponent := TADODataSet.Create(nil);
  try
    //DM.DataSetQuery(adtComponent, Format(sQueryConsumpMaxTimeSQL, ['']));
    DM.DataSetQuery(adtComponent, 'EXEC usp_GetComponentConsumpMaxTime');
    sqlConst := ' select model_code,count(*) as consumpQty from compressor_wip_qty where 0=0 ';
    sqlConst := sqlConst + ' and collect_time > ''' + adtComponent.fieldbyname('LastUpdateTime').AsString + '''';
    sqlConst := sqlConst + ' group by model_code';
    DM.DataSetQuery2(adtWIP, sqlConst);
    while not adtWIP.Eof do
    begin
      model := adtWIP.fieldbyName('model_code').AsString;
      consumpQty := adtWIP.fieldbyname('consumpQty').AsFloat;
      {
      sqlBOM := ' AND m.BaseShortHandCode =''' + model + ''' '
        + ' and c.ComponentID in '
        + ' (select ComponentID '
        + ' from vendorComponent v '
        + ' left outer join vendor r on v.vendorid=r.vendorid '
        + ' where r.vendornumber=38226)';
      DM.DataSetQuery(adtBom, Format(sQueryBOMByModelShortHandCodeSQL, [sqlBOM]));
      }
      DM.DataSetQuery(adtBom, 'EXEC usp_GetBOM '
        + ' @BaseShortHandCode=''' + model + ''''
        + ',@VendorID=17');
      if adtBom.RecordCount > 0 then
      begin
        while not adtBom.Eof do
        begin
          component := adtBom.fieldbyName('ComponentItem').AsString;
          bomQty := adtBom.fieldbyName('ComponentQuantity').AsFloat;
          consumpQty := consumpQty * bomQty;
          //sqlTotal := sqlTotal + Format(sUpdateConsumptionSQL, [consumpQty, component]);
          sqlTotal := sqlTotal + ' EXEC usp_UpdateComponent @ActualConsumptionQty='
            + FloatToStr(consumpQty) + ',@ComponentItem=''' + component + ''',@Col=''ComponentItem''';
          adtBom.Next;
        end;
      end;
      adtWIP.Next;
    end;
    if sqltotal <> '' then
    begin
      DM.DataSetModify(sqlTotal);
      //DM.DataSetModify(sUpdateCurrentInventoryCountSQL);
      sqlTotal := '';
    end;
  finally
    adtWIP.Free;
    adtBom.Free;
    adtComponent.Free;
    Result := true;
  end;
end;

function TPurchaseOrder.JITReleasePO: Boolean;
begin
  DM.DataSetModify('EXEC usp_UpdatePurchaseOrderJITStates');
  DM.DataSetModify('EXEC usp_DeletePurchaseOrderJIT @PurchaseOrderStatesID=1');
  Result := true;
end;
{
   //DM.DataSetModify(sUpdatePOStatesSQL);
  //DM.DataSetModify(format(sDeletePOSQL, [' and PurchaseOrderStatesID = 1']));
     DM.DataSetQuery(adt_vc, format(sQueryVendorComponentSQL, [' and ComponentID=' + IntToStr(componentID)]));
 }
end.

