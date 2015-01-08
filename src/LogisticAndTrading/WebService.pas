// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://delta-logistics.cn/Ws/WebService.asmx?wsdl
// Encoding : utf-8
// Version  : 1.0
// (2013/11/28 15:14:47 - 1.33.2.5)
// ************************************************************************ //

unit WebService;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns;

type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Borland types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:string          - "http://www.w3.org/2001/XMLSchema"

  INVResult            = class;                 { "http://tempuri.org/" }



  // ************************************************************************ //
  // Namespace : http://tempuri.org/
  // ************************************************************************ //
  INVResult = class(TRemotable)
  private
  published
  end;


  // ************************************************************************ //
  // Namespace : http://tempuri.org/
  // soapAction: http://tempuri.org/%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // binding   : WebServiceSoap
  // service   : WebService
  // port      : WebServiceSoap
  // URL       : http://delta-logistics.cn/Ws/WebService.asmx
  // ************************************************************************ //
  WebServiceSoap = interface(IInvokable)
  ['{F790808E-B4BF-D72D-D6C0-3B8652961A63}']
    function  INV: INVResult; stdcall;
    function  INVCSV: WideString; stdcall;
  end;

function GetWebServiceSoap(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): WebServiceSoap;


implementation

function GetWebServiceSoap(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): WebServiceSoap;
const
  defWSDL = 'http://delta-logistics.cn/Ws/WebService.asmx?wsdl';
  defURL  = 'http://delta-logistics.cn/Ws/WebService.asmx';
  defSvc  = 'WebService';
  defPrt  = 'WebServiceSoap';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as WebServiceSoap);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


initialization
  InvRegistry.RegisterInterface(TypeInfo(WebServiceSoap), 'http://tempuri.org/', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(WebServiceSoap), 'http://tempuri.org/%operationName%');
  RemClassRegistry.RegisterXSClass(INVResult, 'http://tempuri.org/', 'INVResult');

end. 