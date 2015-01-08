unit uCustomerOrderProcessOperationAccess;

interface

uses SysUtils, DBCtrls, Controls, ufrmCustomerOrderProcess;

procedure EnableOperation(CustomerOrderOPAccess: TfrmCustomerOrderProcess);

implementation

uses DataModule, uMJ, ufrmDBBasicTreeDT, ufrmDBBasic, ufrmDBBasicTree;

procedure EnableOperation(CustomerOrderOPAccess: TfrmCustomerOrderProcess);
var
  sqlConst, sqlConst2, sqlPlant, sqlReleaseQty1, sqlReleaseQty2, sqlStates: string;
begin
  sqlConst := '';
  sqlConst2 := '';
  sqlPlant := '';
  sqlReleaseQty1 := '';
  sqlReleaseQty2 := '';
  sqlStates := '';
  with CustomerOrderOPAccess do
  begin
    case gVars.CurUserLevel of
      2:
        begin
          case cbbTreeType.ItemIndex of
            0:
              sqlPlant := ',@PlantID=''2,3,4,5''';
            1:
              sqlPlant := ',@PlantID=1';
            2:
              sqlPlant := ',@PlantID=6';
          end;
        end;
      3:
        begin
          if gVars.CurUserPlantIDSet = [1] then
            sqlPlant := ',@PlantID=''' + gVars.CurUserPlantID + ''''
          else
            sqlPlant := ',@PlantID=''' + gVars.CurUserPlantID + '''';
        end;
      4:
        begin
          if cbbTreeType.ItemIndex = 0 then
            sqlPlant := ',@PlantID=''2,3,4,5'''
          else if cbbTreeType.ItemIndex = 1 then
            sqlPlant := ',@PlantID=1,@BusinessApplicationID=2';
        end;
    end;
    sqlConst := sqlConst + ',@ATDNone=1';
    case cbbTreeType.ItemIndex of
      0: //TreeType--States
        begin
          //sqlConst := sqlConst + ',@PlantID=''2,3,4,5''';
          case TreeView1.Selected.Level of
            0: //selected Level--root
              begin
                case gVars.CurUserLevel of
                  2:
                    sqlConst := sqlConst + ',@LoginID=' + IntToStr(gVars.CurLoginID);
                end;
              end;
            1: //selected Level--states deltail
              begin
                gridData.OnDblClick := gridDataDblClick;
                sqlStates := ',@CustomerOrderStatesName=''' + TreeView1.Selected.Text + '''';
                //sqlConst := sqlConst + ',@CustomerOrderStatesName=''' + TreeView1.Selected.Text + '''';
                case gVars.CurUserLevel of
                  2: //User access--CS
                    begin
                      sqlConst := sqlConst + ',@LoginID=' + IntToStr(gVars.CurLoginID);
                      case TreeView1.Selected.Index of
                        1: //Open order
                          begin
                            GroupBox1.Caption := 'Open Order--Only Plant 80';
                            sqlPlant := ',@PlantID=''3,4,5''';
                          end;
                        6:
                          tbtnOperation.Click;
                      end;
                    end;
                  3: //User access--Scheduler
                    begin
                      if (gVars.CurUserPlantIDSet = [2])
                        and ((TreeView1.Selected.Index = 0)
                        or (TreeView1.Selected.Index = 1)
                        or (TreeView1.Selected.Index = 2)) then
                      begin
                        sqlReleaseQty1 := ',@OINQReleaseCOQuantity=''''';
                        sqlReleaseQty2 := ',@OINQReleaseCOQuantity=0';
                      end;
                    end;
                end;
              end;
          end;
        end;
      1: //TreeType--Plant38
        begin
          case TreeView1.Selected.Level of
            0: //selected Level--root
              begin
                case gVars.CurUserLevel of
                  2:
                    sqlConst := sqlConst + ',@LoginID=' + IntToStr(gVars.CurLoginID);
                end;
              end;
            1: //selected Level--states deltail
              begin
                sqlStates := ',@CustomerOrderStatesName=''' + TreeView1.Selected.Text + '''';
                case gVars.CurUserLevel of
                  2: //User access--CS
                    sqlConst := sqlConst + ',@LoginID=' + IntToStr(gVars.CurLoginID);
                end;
              end;
          end;
        end;
    end;
    if gVars.CurUserLevel = 1 then
      gridData.OnDblClick := gridDataDblClick;
    sqlConst := sqlConst + sqlStates + sqlPlant + sqlReleaseQty1 + ',@Col=''CustomerOrderID Desc''';
    if sqlReleaseQty2 = '' then
      sqlConst2 := ',@CustomerOrderID=1000000'
    else
      sqlConst2 := sqlPlant + sqlStates + sqlReleaseQty2 + ',@Col=''CustomerOrderID Desc''';
    sqlConst := Copy(sqlConst, 2, length(sqlConst));
    sqlConst2 := Copy(sqlConst2, 2, length(sqlConst2));
    if (gVars.CurUserLevel = 2) or (gVars.CurUserLevel = 4) then
    begin
      DM.DataSetQuery(adt_active, 'EXEC usp_GetCustomerOrder ' + sqlConst);
      DM.DataSetQuery(adt_active2, 'EXEC usp_GetCustomerOrder @CustomerOrderID=1000000');
    end
    else if gVars.CurUserLevel = 3 then
    begin
      if gVars.CurUserPlantIDSet = [1] then
      begin
        DM.DataSetQuery(adt_active, 'EXEC usp_GetCustomerOrder ' + sqlConst + ',@IsScheduled=0');
        DM.DataSetQuery(adt_active2, 'EXEC usp_GetCustomerOrder @IsScheduled=1');
      end
      else if gVars.CurUserPlantIDSet = [2] then
      begin
        GroupBox2.Caption := 'Customer Order -- RTD is generated automatic';
        DM.DataSetQuery(adt_active, 'EXEC usp_GetCustomerOrder ' + sqlConst);
        DM.DataSetQuery(adt_active2, 'EXEC usp_GetCustomerOrder ' + sqlConst2);
      end
      else
      begin
        DM.DataSetQuery(adt_active, 'EXEC usp_GetCustomerOrder ' + sqlConst);
        DM.DataSetQuery(adt_active2, 'EXEC usp_GetCustomerOrder @CustomerOrderID=1000000');
      end;
    end;
  end;
end;

end.

