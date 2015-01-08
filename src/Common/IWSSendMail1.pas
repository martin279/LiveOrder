// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : D:\LiveOrder\trunk\Common\IWSSendMail.xml
// Encoding : utf-8
// Version  : 1.0
// (2012/8/13 15:04:38 - 1.33.2.5)
// ************************************************************************ //

unit IWSSendMail1;

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
  // !:boolean         - "http://www.w3.org/2001/XMLSchema"

  TSendMainParam = class; { "urn:WSSendMailIntf" }



  // ************************************************************************ //
  // Namespace : urn:WSSendMailIntf
  // ************************************************************************ //
  TSendMainParam = class(TRemotable)
  private
    FSubject: WideString;
    FBody: WideString;
    FAttachment: WideString;
    FFrom: WideString;
    FRecipient: WideString;
    FCC: WideString;
    FBCC: WideString;
    FHtmlFormat: Boolean;
    FUseBase64Encode: Boolean;
  published
    property Subject: WideString read FSubject write FSubject;
    property Body: WideString read FBody write FBody;
    property Attachment: WideString read FAttachment write FAttachment;
    property From: WideString read FFrom write FFrom;
    property Recipient: WideString read FRecipient write FRecipient;
    property CC: WideString read FCC write FCC;
    property BCC: WideString read FBCC write FBCC;
    property HtmlFormat: Boolean read FHtmlFormat write FHtmlFormat;
    property UseBase64Encode: Boolean read FUseBase64Encode write FUseBase64Encode;
  end;


  // ************************************************************************ //
  // Namespace : urn:WSSendMailIntf-IWSSendMail
  // soapAction: |urn:WSSendMailIntf-IWSSendMail#SendMail|urn:WSSendMailIntf-IWSSendMail#SendMailEx
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : IWSSendMailbinding
  // service   : IWSSendMailservice
  // port      : IWSSendMailPort
  // URL       : http://142.103.41.243:8080/webapps/SMTPMail/WSSendMailISAPI.dll/soap/IWSSendMail
  // ************************************************************************ //
  IWSSendMail = interface(IInvokable)
    ['{05440A0F-B909-0590-8477-DA074720F7E9}']
    procedure SendMail(const From: WideString; const Recipient: WideString; const CC: WideString; const BCC: WideString; const Subject: WideString; const Body: WideString; const HtmlFormat: Boolean; const Attachment: WideString; const UseBase64Encode: Boolean); stdcall;
    procedure SendMailEx(const Param: TSendMainParam); stdcall;
  end;

function GetIWSSendMail(UseWSDL: Boolean = System.False; Addr: string = ''; HTTPRIO: THTTPRIO = nil): IWSSendMail;


implementation

function GetIWSSendMail(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): IWSSendMail;
const
  defWSDL = 'D:\LiveOrder\trunk\Common\IWSSendMail.xml';
  defURL = 'http://142.103.41.243:8080/webapps/SMTPMail/WSSendMailISAPI.dll/soap/IWSSendMail';
  defSvc = 'IWSSendMailservice';
  defPrt = 'IWSSendMailPort';
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
    Result := (RIO as IWSSendMail);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end
    else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


initialization
  InvRegistry.RegisterInterface(TypeInfo(IWSSendMail), 'urn:WSSendMailIntf-IWSSendMail', 'utf-8');
  InvRegistry.RegisterAllSOAPActions(TypeInfo(IWSSendMail), '|urn:WSSendMailIntf-IWSSendMail#SendMail|urn:WSSendMailIntf-IWSSendMail#SendMailEx');
  RemClassRegistry.RegisterXSClass(TSendMainParam, 'urn:WSSendMailIntf', 'TSendMainParam');

end.
