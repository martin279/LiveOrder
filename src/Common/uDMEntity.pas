unit uDMEntity;

interface

uses Classes;

type
  TCustomerOrder = class
    CustomerOrderID: integer;
    CustomerID: integer;
    ModelID: integer;
    Model: string;
    CustomerOrderQuantity: integer;
    Price: Double;
    TotalAmount: Double;
    RTD: string;
    ETD: string;
    ATD: string;
    ETA: string;
    CustomerPurchaseOrderNumber: string;
    CustomerOrderNumber: string;
    MNumber: string;
    InvoiceNumber: string;
    Payment: string;
    Remark: string;
    Instruction: string;
    ForwarderID: integer;
    Destination: WideString;
    Freight: string;
    PlantID: integer;
    ReasonOfDelayID: string;
    BusinessApplicationID: integer;
    OINQCOQuantity: integer;
    OINQReleaseCOQuantity: integer;
    COConfirmedTime: string;
    MaiframePrice: string;
    CustomerOrderStatesID: integer;
    BatchCustomerOrderID: WideString;
  end;

  TCustomerOrderLog = class
    CustomerOrderID: integer;
    LogChangeField: string;
  end;

  TShippingSchedule = class
    CustomerOrderID: integer;
    DeliveryPlanToWarehouseDate: string;
    ThirdPartyWarehouseReceivingDate: string;
    LogisticOutDeliveryETDEst: string;
    LogisticOutDeliveryETAEst: string;
    GoodsEXThirdPartyWarehouseDate: string;
    ThirdPartyWarehousePackingList: string;
    ThirdPartyWarehouseRemark: string;
    ThirdPartyWarehouseReference: string;
    LogisticOutLogisticExportSheetNo: string;
    LogisticOutIncoterms: string;
    LogisticOutDeliveryOnboardAct: string;
    LogisticOutForwarderPickupDateEst: string;
    LogisticOutLogisticRemark: string;
    ShippingScheduleStatusID: integer;
    BatchCustomerOrderID: WideString;
  end;

  TTradingOrder = class
    TradingOrderID: integer;
    CustomerOrderID: integer;
    SellerPartNo: string;
    SellerCode: string;
    VendorID: integer;
    VendorNumber: string;
    VendorName: string;
    SellerPOToSellerDate: string;
    SellerBuyerPONumber: string;
    SellerBuyerPOQuantity: integer;
    SellerShippingMode: string;
    SellerAirFreightPaidBy: string;
    SellerOAReplyDate: string;
    SellerRCEDSellerOA: string;
    SellerExFactoryDate: string;
    SellerExFactoryDate1: string;
    SellerLogisticDTDTime: string;
    SellerStockDueToOrderCancel: string;
    SellerBuyerRemark: string;
    LogisticInSellerETDDate: string;
    LogisticInSellerETADate: string;
    DemandManagingRCED: string;
    DemandManagingSalesMonth: integer;
    DemandManagingDMMMonth: integer;
    DemandManagingCargoStatusTypeID: string;
    DemandManagingCargoStatus: string;
    DemandManagingCargoStatusRemark: string;
    DemandManagingDMMRemark: string;
    SalesAnalysisRegion: string;
    SalesAnalysisCountry: string;
    SalesAnalysisProductFamily: string;
    SalesAnalysisAsiaPOR: string;
    TradingOrderStatusID: integer;
    BatchCustomerOrderID: string;
    BatchTradingOrderID: string;
  end;

  TTradingPOReceiving = class
    TradingOrderID: integer;
    ReceivingQuantity: integer;
    OriginPickupDate: string;
    ActArriveWarehouseDate: string;
    SortingDate: string;
    LogisticInRCED: string;
    ImportSheetNo: string;
  end;

  TTradingPOSellerInvoice = class
    TradingOrderID: integer;
    SellerInvoiceNumber: string;
    SellerInvoiceDate: string;
  end;

  TTradingOrderLog = class
    CustomerOrderID: integer;
    LogChangeField: string;
  end;

  TCurUserInfo = class
    LoginID: integer;
    LoginName: string;
    LoginPassword: string;
    DisplayName: string;
    AccessLevel: integer;
    CommunicatorID: integer;
    PlantID: string;
    PlantCode: string;
    BusinessApplicationID: string;
    BusinessApplicationName: string;
    CurState: boolean; //true为当前已登陆，false为头次登陆
    CurUserLonginTime: tdatetime; //储存登陆时间
  end;


implementation

end.

