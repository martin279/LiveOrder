unit uSQLConsts;

interface

//resourcestring

   
    {
  sQueryCustomerOrderSQL = ' select * from ViewCustomerOrder'
    + ' where 0=0 %s';

  sQueryAllCustomerOrderSQL = ' select * from ViewAllCustomerOrder'
    + ' where 0=0 %s';
        
  sQueryOnlineInventorySQL = 'select ComponentID'
    + ',sum(ConfirmedPurchaseOrderQuantity) as OnWayPurchaseOrderQuantity from PurchaseOrder'
    + ' where 0=0 %s '
    + ' and PurchaseOrderStatesID=3'
    + ' group by ComponentID';
  sUpdateCurrentInventoryCountSQL = ' update Component '
    + ' set CurrentInventoryCount = PhysicalInventoryCount - StartPointConsumption + StartPointPurchaseOrders, '
    + ' CurrentInventoryDate = StartPointConsumptionDate ';
  sUpdateComponentPOReceiptsSQL = ' update Component '
    + ' set StartPointPurchaseOrders = StartPointPurchaseOrders + %f, '
    + ' StartPointPurchaseOrdersDate = getdate() '
    + ' where ComponentID = %s '
    + ' and ComponentID not in (''40'',''374'',''73'',''74'',''64'')';
  sUpdateComponentPOReceiptsSQL2 = ' update Component '
    + ' set StartPointPurchaseOrders = StartPointPurchaseOrders - %f, '
    + ' StartPointPurchaseOrdersDate = getdate() '
    + ' where ComponentID = %s '
    + ' and ComponentID not in (''40'',''374'',''73'',''74'',''64'')';


  sQueryPurchaseOrderSQL = ' select * from ViewPurchaseOrder where 0=0 %s ';
  sQueryPurchaseOrderCacheSQL = ' select * from ViewPurchaseOrderCache'
    + ' where 0=0 %s ';
//----注:此处只用amtek的非Summit的物料来计算PO,Summit的PO由手动来下
  sQueryBOMSQLOnlyAmtekWithoutSummit = ' SELECT bom.ModelID,bom.ComponentID,m.Model,c.ComponentItem,'
    + ' bom.ComponentQuantity,bom.ValidFrom,bom.ValidUntil'
    + ' FROM BillOfMaterials bom'
    + ' LEFT OUTER JOIN Component c ON bom.ComponentID = c.ComponentID'
    + ' LEFT OUTER JOIN Model m ON bom.ModelID = m.ModelID'
    + ' WHERE 0=0 %s '
    + ' AND c.ComponentID in '
    + ' (select ComponentID '
    + ' from vendorComponent v '
    + ' left outer join vendor r on v.vendorid=r.vendorid '
    + ' where r.vendornumber=38226)'
    + ' and bom.ComponentID not in (''40'',''374'',''73'',''74'',''64'')'
    + ' order by bom.ComponentID';
  sQueryBOMByModelShortHandCodeSQL = 'SELECT m.Model,c.ComponentItem, '
    + ' bom.ComponentQuantity FROM Component c '
    + ' LEFT JOIN BillOfMaterials bom ON c.ComponentID = bom.ComponentID '
    + ' LEFT JOIN Model m ON bom.ModelID = m.ModelID '
    + ' WHERE m.Model is not null %s';
  sQueryPriceSQL = ' select p.* from ViewPrice p where 0=0 %s';
  sUpdateCustomerOrderNumberSQL = ' update CustomerOrder'
    + ' set MNumber =''%s'' '
    + ' ,CustomerOrderNumber =''%s'' '
    + ' ,CustomerOrderStatesID =%d  '
    + ' where CustomerOrderID=''%s'' ';
  sUpdateCustomerOrderNumberSQL2 = ' update CustomerOrder'
    + ' set CustomerOrderNumber =''%s'' '
    + ' ,CustomerOrderStatesID =%d '
    + ' where CustomerOrderID=%d ';
  sUpdateCustomerInvoiceNumberSQL = ' update CustomerOrder'
    + ' set InvoiceNumber =''%s'' '
    + ' ,CustomerOrderStatesID =5 '
    + ' where CustomerOrderID=%d ';
  sUpdateCustomerOrderReleaseSQL = ' update CustomerOrder'
    + ' set OINQCOQuantity =%d '
    + ' ,OINQReleaseCOQuantity =%d '
    + ' ,CustomerOrderStatesID =%d '
    + ' where CustomerOrderID=%d ';
  sUpdateCustomerOrderStatesSQL = ' update CustomerOrder'
    + ' set CustomerOrderStatesID =%d  '
    + ' where CustomerOrderID in %s ';  
  sUpdateCustomerOrderStatesSQL2 = ' update CustomerOrder '
    + ' set CustomerOrderStatesID = 6 '
    + ' where InvoiceNumber = ''%s'' ';      
  sQueryProductTrackingSQL = ' select * from ViewProductTracking'
    + ' where 0=0 %s ';
  sQueryProductComponentTrackingSQL = ' select * from ViewProductComponentTracking'
    + ' where 0=0 %s ';
  sInsertCustomerOrderInvoiceSQL = ' insert into CustomerOrderInvoice'
    + '(InvoiceNumber,FreightCost)'
    + ' select distinct InvoiceNumber, %s from CustomerOrder c'
    + ' where CustomerOrderStatesID=5'
    + ' and not exists (select 1 from CustomerOrderInvoice e where c.InvoiceNumber=c.InvoiceNumber)';
  sQueryWIPSQL2 = ' select collect_id,line_num,model_code,wip_qty,collect_time'
    + ' from compressor_wip_qty'
    + ' where 0=0 and collect_time>=DATEADD(Hour,-1,getdate())'
    + ' order by line_num,collect_time desc';
  sInsertProductComponentTrackingSQL = ' insert into ProductComponentTracking'
    + '(ProductTrackingID,ComponentID) values(%d,%d)';
  sInsertProductTrackingSQL = ' insert into ProductTracking'
    + '(ProductionScheduleID,ProductSerialNumber,ProductTrackingStatesID)'
    + ' values(%d,''%s'',%d)';
  sUpdateProductTrackingSQL = ' update ProductTracking '
    + ' set ProductTrackingStatesID = %d '
    + ' ,ProductionStartTime = ''%s'' '
    + ' where ProductTrackingID = %d ';
  sUpdateProductComponentTrackingSQL = ' update ProductComponentTracking '
    + ' set ComponentSerialNumber = ''%s'' '
    + ' where ProductTrackingID = %d '
    + ' and ComponentID = %d';
  sUpdateCustomerOrderATDSQL = ' update CustomerOrderInvoice '
    + ' set ATD = ''%s'' '
    + ' ,CustomerOrderStatesID = 6 '
    + ' where InvoiceNumber = ''%s'' '
    + ' update CustomerOrder '
    + ' set ATD = ''%s'' '
    + ' ,CustomerOrderStatesID = 6 '
    + ' where InvoiceNumber = ''%s'' ';
  sInsertCustomerOrderInvoiceSQL2 = ' insert into CustomerOrderInvoice(InvoiceNumber)'
    + ' select distinct InvoiceNumber from CustomerOrder c'
    + ' where CustomerOrderStatesID=5'
    + ' and not exists (select 1 from CustomerOrderInvoice e where c.InvoiceNumber=c.InvoiceNumber)';
  sQueryCustomerOrderInvoiceSQL = ' select e.*'
    + ' from CustomerOrderInvoice e'
    + ' where 0=0 %s ';
  sUpdateConsumptionSQL = ' update Component '
    + ' set StartPointConsumption = StartPointConsumption + %f, '
    + ' StartPointConsumptionDate = getdate() '
    + ' where ComponentItem = ''%s'' ';
//---Sales---
  sDeleteSalesSQL = ' delete from Sales where 0=0 %s';
  sDeleteSalesCustomerSQL = ' delete from SalesCustomer where 0=0 %s';
  sUpdatePOStatesSQL = ' update PurchaseOrder '
    + ' set PurchaseOrderStatesID=2'
    + ' where PurchaseOrderStatesID=1';
  sDeleteProductTrackingSQL = ' delete from ProductTracking where 0=0 %s';
  sDeleteProductComponentTrackingSQL = ' delete from ProductComponentTracking where 0=0 %s';

     sDeleteCustomerOrderSQL = ' delete from CustomerOrder'
    + ' where 0=0 %s';
  //sDeletePOSQL = ' delete from PurchaseOrderCache delete from PurchaseOrder where 0=0 %s ';
  //sQueryConsumpMaxTimeSQL = ' select max(StartPointConsumptionDate) as LastUpdateTime from component where 0=0 %s ';

//---Planner---
  //sQueryComponentSQL = ' select * from ViewComponent where 0=0 %s ';
  sQueryComponentAmteckSQL = ' select c.*,s.ComponentSeriesName'
    + ' ,s.PlantID,p.PlantCode from component c'
    + ' left outer join ComponentSeries s on c.ComponentSeriesID=s.ComponentSeriesID'
    + ' left outer join Plant p on s.PlantID=p.PlantID'
    + ' where 0=0 %s'
    + ' AND c.ComponentID in '
    + ' (select ComponentID '
    + ' from vendorComponent v '
    + ' left outer join vendor r on v.vendorid=r.vendorid '
    + ' where r.vendornumber=38226)';
  sQueryVendorSQL = ' select * from vendor order by vendorname ';
  sQueryVendorComponentSQL = ' select * from ViewVendorComponent where 0=0 %s';
  sQueryBOMSQL = ' select * from ViewBOM where 0=0 %s';

  sQueryModelParameterCUDSQL = ' select d.*,m.Model from ModelParameterCUD d'
    + ' left outer join Model m on d.ModelID=m.ModelID '
    + ' where 0=0 %s ';
  sQueryModelParameterCUDUSASQL = ' select d.*,m.Model from ModelParameterCUDUSA d'
    + ' left outer join Model m on d.ModelID=m.ModelID '
    + ' where 0=0 %s ';
  sQueryProductPackgeCUDSQL = ' select p.*,s.ProductSeriesName'
    + ' from ProductPackgeCUD p'
    + ' left outer join ProductSeries s on p.ProductSeriesID=s.ProductSeriesID'
    + ' where 0=0 %s ';

 sQueryMinScheduleStartTimeSQL = ' select isnull(min(ScheduleStartTime),getdate()) as MinScheduleStartTime from ViewProductTracking'
    + ' where ProductTrackingStatesID=1 ';

  sInsertCommunicatorCustomerSQL = ' insert into CommunicatorCustomer'
    + '(CommunicatorID,CustomerID) values(%d,%d)';  }

//---System---
{  sQueryLoginSQL = ' select l.* from Login l'
    + ' where 0=0 %s ';
  sQueryUserSQL = ' select l.*,lp.PlantID,p.PlantCode from Login l'
    + ' left outer join LoginPlant lp on l.LoginID=lp.LoginID'
    + ' left outer join plant p on lp.PlantID=p.PlantID'
    + ' where 0=0 %s ';
  sQueryMainframeAccessSQL = ' select m.*,p.PlantCode from MainframeAccess m '
    + ' left outer join plant p on m.PlantID=p.PlantID'
    + ' where 0=0 %s ';
  sQueryFileImportConfigurationSQL = ' select * from FileImportConfiguration'
    + ' where 0=0 %s ';
  sQueryFileImportConfigurationDetailSQL = ' select * from FileImportConfigurationDetail'
    + ' where 0=0 %s ';   }
//---CS---
{  sQueryPlantSQL = ' select * from Plant where 0=0 %s ';
  sQueryCommunicatorSQL = ' select c.*,l.DisplayName from Communicator c'
    + ' left outer join Login l on c.LoginID=l.LoginID'
    + ' where 0=0 %s';
  sQueryCustomerSQL = ' select * from ViewCustomer where 0=0 %s';
  sQueryPaymentTermsSQL = ' select * from PaymentTerms where 0=0 %s ';
  sQueryPriceTermsSQL = ' select * from PriceTerms where 0=0 %s ';   }
{  sQueryPriceChangeLogSQL = ' select p.PriceChangeLogID,p.PriceID'
    + ' ,p.DemandQuantity,p.Currency,p.Price,p.PaymentTermsID,p.PriceTermsID'
    + ' ,p.EffectDate,p.Remark,pt.PaymentTerms,ps.PriceTerms'
    + ' from PriceChangeLog p'
    + ' left outer join PaymentTerms pt on p.PaymentTermsID=pt.PaymentTermsID'
    + ' left outer join PriceTerms ps on p.PriceTermsID=ps.PriceTermsID'
    + ' where 0=0 %s';

  sQueryPlantCustomerSQL = ' SELECT pc.*,p.PlantCode'
    + ' FROM PlantCustomer pc'
    + ' LEFT OUTER JOIN plant p ON pc.PlantID = p.PlantID'
    + ' WHERE 0=0 %s';
  sQueryForwarderSQL = ' select * from Forwarder where 0=0 %s ';
  sQueryReasonOfDelaySQL = ' select * from ReasonOfDelay where 0=0 %s ';
  sQueryCOStatesSQL = ' select * from CustomerOrderStates where 0=0 %s';
  sQueryMainframeModelSQL = ' select * from MainframeModel where 0=0 %s ';

  sQueryModelSQL = ' select m.*,p.ProductSeriesName from Model m'
    + ' left outer join ProductSeries p on m.ProductSeriesID=p.ProductSeriesID'
    + ' where 0=0 %s ';
  sQueryProductSeriesSQL = ' select s.*,p.PlantCode from ProductSeries s'
    + ' left outer join Plant p on s.PlantID=p.PlantID'
    + ' where 0=0 %s ';
//  sQueryAssemblyLineSQL = ' select * from AssemblyLine where 0=0 %s ';
//  sQueryShiftSQL = ' select * from Shift where 0=0 %s ';
  sQueryCapacitySQL = ' select c.*,a.* from Capacity c'
    + ' left outer join AssemblyLine a on c.AssemblyLineID=a.AssemblyLineID'
    + ' where 0 = 0 %s';
  sQueryProductionCalendarSQL = ' select p.*,a.Line,s.ShiftNumber from ProductionCalendar p'
    + ' left outer join AssemblyLine a on p.AssemblyLineID=a.AssemblyLineID'
    + ' left outer join Shift s on p.ShiftID=s.ShiftID'
    + ' where 0=0 %s ';
  sQueryProductionScheduleSQL = ' select * from ViewProductionSchedule'
    + ' where 0=0 %s ';
  sQueryProductionScheduleForCalculateSQL = ' select * from ViewProductionScheduleForCalculate'
    + ' order by ScheduleStartTime';
  sQueryDailyStartsSQL = ' select s.*,a.Line'
    + ' from ScheduleStartPoint s'
    + ' left outer join AssemblyLine a on s.AssemblyLineID=a.AssemblyLineID'
    + ' where 0=0 %s ';
  sQueryProductionScheduleCUDSQL = ' select * from ViewProductionScheduleCUD'
    + ' where 0=0 %s ';
  sQueryScheduleModelForTaxisSQL = ' select Model from Model'
    + ' where ModelID in ('
    + ' select distinct ModelID from ProductionScheduleCUD'
    + ' where PlantID in %s '
    + ' and AssemblyLineID=%d'
    + ' and Convert(varchar(10),ScheduleStartTime,120)=''%s'' '
    + ' )';
  sQueryDistinctModelFromScheduleSQL = 'select distinct ModelID from ProductionScheduleCUD'
    + ' where PlantID in %s '
    + ' and AssemblyLineID = %d '
    + ' and ScheduleStartTime>= ''%s'' '
    + ' and ScheduleStartTime<= ''%s'' '
    + ' and ProductionScheduleID in %s ';
//  sQueryPlannerLedgerSQL = ' select * from PlannerLedger where 0=0 %s ';
 // sQueryPOStatesSQL = ' select * from PurchaseOrderStates where 0=0 %s';
  sQueryComponentSeriesSQL = ' select s.*,p.PlantCode from ComponentSeries s'
    + ' LEFT OUTER JOIN plant p ON s.PlantID = p.PlantID'
    + ' where 0=0 %s';
  sPODistinctRTASQL = ' select top 2 RTA from ( '
    + ' select distinct convert(varchar(16),RTA,120) as RTA'
    + ' from PurchaseOrder'
    + ' where PurchaseOrderStatesID=2) as a';
   
 // sQueryBusinessApplicationSQL = ' select * from BusinessApplication'    + ' where 0=0 %s ';
  sQuerySalesSQL = ' select s.*,l.DisplayName,b.BusinessApplicationName from Sales s'
    + ' left outer join BusinessApplication b on s.BusinessApplicationID=b.BusinessApplicationID'
    + ' left outer join Login l on s.LoginID=l.LoginID'
    + ' where 0=0 %s ';
  sQuerySalesCustomerSQL = ' SELECT sc.*'
    + ' ,c.CustomerNumber,c.CustomerName'
    + ' FROM SalesCustomer sc'
    + ' LEFT OUTER JOIN Customer c ON sc.CustomerID = c.CustomerID'
    + ' WHERE 0=0 %s';  

  //sDeleteCommunicatorSQL = ' delete from Communicator where 0=0 %s';
 //sDeleteCommunicatorCustomerSQL = ' delete from CommunicatorCustomer where 0=0 %s';
  sInsertPriceSQL = ' insert into Price(CustomerID,ModelID'
    + ' ,DemandQuantity,Currency,Price,PaymentTermsID,PriceTermsID'
    + ' ,EffectDate,Remark,CreatorLoginID,CreateTime,PriceStatesID)'
    + ' values(%d,%d,%d,''%s'',%f,%d,%d,''%s'',''%s'',%d,''%s'',%d) ';
  //sDeletePriceSQL = ' delete from Price where 0=0 %s';
  sInsertCustomerOrderSQL = ' insert into CustomerOrder(CustomerID'
    + ' ,ModelID,Currency,CustomerOrderQuantity,Price,TotalAmount'
    + ' ,ContractDate,RTD,CustomerPurchaseOrderNumber,Remark'
    + ' ,CustomerOrderStatesID,LoginID,COGenerateTime)'
    + ' values(%d,%d,''%s'',%f,%f,%f,'
    + ' ''%s'',''%s'',''%s'',''%s'',%d,%d,getdate()) ';  
  sInsertCustomerOrderSQL2 = ' insert into CustomerOrder(CustomerID'
    + ' ,ModelID,Currency,CustomerOrderQuantity,Price,TotalAmount'
    + ' ,ContractDate,CustomerPurchaseOrderNumber,Remark'
    + ' ,CustomerOrderStatesID,LoginID,COGenerateTime)'
    + ' values(%d,%d,''%s'',%f,%f,%f,'
    + ' ''%s'',''%s'',''%s'',%d,%d,getdate()) ';

  sInsertCustomerOrderSplitSQL = ' insert into CustomerOrder'
    + '(CustomerOrderNumber,MNumber,InvoiceNumber,'
    + 'CustomerID,ModelID,Currency,Price,CustomerOrderQuantity,'
    + 'TotalAmount,ContractDate,RTD,ETD,ATD,ETA,ATA,Remark,'
    + 'CustomerPurchaseOrderNumber,ReasonOfDelayID,'
    + 'CustomerOrderStatesID,COGenerateTime,COConfirmedTime,LoginID)'
    + 'select CustomerOrderNumber,MNumber,InvoiceNumber,'
    + 'CustomerID,ModelID,Currency,Price,%f,TotalAmount,'
    + 'ContractDate,''%s'',ETD,ATD,ETA,ATA,Remark,'
    + 'CustomerPurchaseOrderNumber,ReasonOfDelayID,'
    + 'CustomerOrderStatesID,COGenerateTime,COConfirmedTime,LoginID'
    + ' from CustomerOrder where CustomerOrderID = %d';
  sUpdateCustomerOrderSplitSQL = ' update CustomerOrder'
    + ' set CustomerOrderQuantity = %f'
    + ' where CustomerOrderID = %d';
      
//---Scheduler---
 { sInsertModelSQL = ' insert into Model(Model,ModelDescription'
    + ',ProductionFactor,ProductSeriesID,IsValid)'
    + ' values(''%s'',''%s'',1,%d,1) ';

  sUpdateModelSQL = ' update Model'
    + ' set Model = ''%s'''
    + ',ModelDescription=''%s'''
    + ',ProductSeriesID=%d'
    + ' where ModelID = %d';
  sDeleteModelSQL = ' delete from Model where 0=0 %s';

  sDeleteProductSeriesSQL = ' delete from ProductSeries where 0=0 %s';

  sInsertProductionScheduleImportSQL = ' insert into ProductionScheduleImport(Line,Model,ScheduleQuantity,RTD,ScheduleStartTime)'
    + ' values(ltrim(rtrim(''%s'')),ltrim(rtrim(''%s'')),ltrim(rtrim(''%s'')),ltrim(rtrim(''%s'')),ltrim(rtrim(''%s''))) ';
  sProcessProductionScheduleSQL = 'INSERT ProductionSchedule'
    + ' (AssemblyLineID,ModelID,ScheduleQuantity,RTD'
    + ' ,ScheduleStartTime,PlantID)'
    + ' SELECT a.AssemblyLineID,m.ModelID,p.ScheduleQuantity'
    + ' ,CAST(p.ScheduleStartTime AS DATETIME)'
    + ' ,CAST(p.ScheduleStartTime AS DATETIME),1'
    + ' FROM ProductionScheduleImport p'
    + ' LEFT OUTER JOIN AssemblyLine a on p.Line=a.Line'
    + ' LEFT OUTER JOIN Model m on p.Model=m.Model'
    + ' WHERE ltrim(rtrim(m.Model)) <> ''''	AND (lower(substring(m.Model,1,1)) = ''z'' '
    + ' or lower(substring(m.Model, 1, 1)) = ''v'')';
  sDeleteProductionScheduleSQL = ' delete from ProductionScheduleImport'
    + ' delete from ProductionSchedule where 0=0 %s';
  sInsertProductionScheduleCUDSQL = ' insert into ProductionScheduleCUD'
    + ' (CustomerOrderID,AssemblyLineID,ScheduleQuantity,IsScheduled)'
    + ' select v.CustomerOrderID,5,v.CustomerOrderQuantity,0'
    + ' from ViewCustomerOrder v'
    + ' where 0=0'
    + ' and v.RTD is not null'
    + ' and not exists (select 1 from ProductionScheduleCUD p where v.CustomerOrderID = p.CustomerOrderID )'
    + ' and (v.PlantID=7 or v.PlantID2=7)'
    + ' and v.CustomerOrderStatesID=3'
    + ' order by v.RTD';
  sUpdateProductionScheduleCUDSQL = ' update ProductionScheduleCUD '
    + ' set SchedulePriority = %d '
    + ' where ProductionScheduleID = %d ';
  sUpdateScheduleCUDIsScheduledSQL = ' update ProductionScheduleCUD '
    + ' set IsScheduled = %d '
    + ' where ProductionScheduleID = %d ';
  sInsertScheduleCUDSplitSQL = ' insert into ProductionScheduleCUD'
    + '(CustomerOrderID,AssemblyLineID,ModelID,ScheduleQuantity,'
    + 'RTD,ScheduleStartTime,PlantID,IsScheduled)'
    + 'select CustomerOrderID,AssemblyLineID,ModelID,%f,'
    + 'RTD,''%s'',PlantID,IsScheduled'
    + ' from ProductionScheduleCUD where ProductionScheduleID = %d';
  sUpdateScheduleCUDSplitSQL = ' update ProductionScheduleCUD'
    + ' set ScheduleQuantity = %f'
    + ' where ProductionScheduleID = %d';
  sProcessPurchaseOpenOrderSQL = ' insert into PurchaseOrder ('
    + ' VendorID,ComponentID,RTA,RTD,PurchaseOrderStatesID,PurchaseOrderQuantity,POGenerateTime)'
    + ' SELECT VendorID,ComponentID,RTA,DATEADD(Hour, -1, RTA) as RTD,PurchaseOrderStatesID,'
    + 'sum(PurchaseOrderQuantity) as PurchaseOrderQuantity,getdate()'
    + ' FROM PurchaseOrderCache Where PurchaseOrderStatesID=1'
    + ' Group by VendorID,ComponentID,RTA,PurchaseOrderStatesID';
  sProcessPurchaseEmergencyOrderSQL = ' insert into PurchaseOrder ('
    + ' VendorID,ComponentID,RTA,RTD,PurchaseOrderStatesID,PurchaseOrderQuantity,POGenerateTime)'
    + ' SELECT VendorID,ComponentID,RTA,DATEADD(Hour, -1, RTA) as RTD,PurchaseOrderStatesID,'
    + 'sum(PurchaseOrderQuantity) as PurchaseOrderQuantity,getdate()'
    + ' FROM PurchaseOrderCache Where PurchaseOrderStatesID=5'
    + ' Group by VendorID,ComponentID,RTA,PurchaseOrderStatesID';

  }

implementation
end.

