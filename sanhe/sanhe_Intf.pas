unit sanhe_Intf;

// ----------------------------------------------------------------------
//  This file was automatically generated by Remoting SDK from a
//  RODL file downloaded from a server or associated with this project.
//
//  Do not modify this file manually, or your changes will be lost when
//  it is regenerated the next time you update your RODL.
// ----------------------------------------------------------------------

{$I RemObjects.inc}

interface

uses
  {$IFDEF DELPHIXE2UP}System.SysUtils{$ELSE}SysUtils{$ENDIF},
  {$IFDEF DELPHIXE2UP}System.Classes{$ELSE}Classes{$ENDIF},
  {$IFDEF DELPHIXE2UP}System.TypInfo{$ELSE}TypInfo{$ENDIF},
  uROEncoding,
  uROUri,
  uROProxy,
  uROExceptions,
  uROXMLIntf,
  uROClasses,
  uROTypes,
  uROClientIntf,
  uROAsync,
  uROEventReceiver,
  DataAbstract4_Intf;

const LibraryUID: String = '{CB5D2DC4-D58B-40D6-B396-F07630C3BE82}';
const DefaultNamespace: String = 'sanhe';
const TargetNamespace: String = 'sanhe';
const IDataService_IID: TGUID = '{51A7F1F9-2B17-402D-A877-C778E7E3A593}';
const ILoginService_IID: TGUID = '{7F0E0D54-EDE8-4EDA-BDC6-59F5915C300E}';
type
  { Forward declarations }
  IDataService = interface;
  IDataService_Async = interface;
  IDataService_AsyncEx = interface;
  ILoginService = interface;
  ILoginService_Async = interface;
  ILoginService_AsyncEx = interface;
  CoDataService = class;
  CoDataService_Async = class;
  CoDataService_AsyncEx = class;
  TDataService_Proxy = class;
  TDataService_AsyncProxy = class;
  TDataService_AsyncProxyEx = class;
  CoLoginService = class;
  CoLoginService_Async = class;
  CoLoginService_AsyncEx = class;
  TLoginService_Proxy = class;
  TLoginService_AsyncProxy = class;
  TLoginService_AsyncProxyEx = class;

  IDataService = interface(DataAbstract4_intf.IDataAbstractService)
  ['{51A7F1F9-2B17-402D-A877-C778E7E3A593}']
  end;

  IDataService_Async = interface(DataAbstract4_intf.IDataAbstractService_Async)
  ['{767371CA-17F0-49FD-AEC4-0B94D0E8A0F9}']
  end;

  IDataService_AsyncEx = interface(DataAbstract4_intf.IDataAbstractService_AsyncEx)
  ['{88ADB62B-A9F2-445A-AAA1-9999D173F292}']
  end;

  CoDataService = class(System.TObject)
  public
    class function Create(const aMessage: IROMessage; aTransportChannel: IROTransportChannel): IDataService; overload;
    class function Create(const aUri: TROUri; aDefaultNamespaces: String = ''): IDataService; overload;
    class function Create(const aUrl: String; aDefaultNamespaces: String = ''): IDataService; overload;
  end;

  CoDataService_Async = class(System.TObject)
  public
    class function Create(const aMessage: IROMessage; aTransportChannel: IROTransportChannel): IDataService_Async; overload;
    class function Create(const aUri: TROUri; aDefaultNamespaces: String = ''): IDataService_Async; overload;
    class function Create(const aUrl: String; aDefaultNamespaces: String = ''): IDataService_Async; overload;
  end;

  CoDataService_AsyncEx = class(System.TObject)
  public
    class function Create(const aMessage: IROMessage; aTransportChannel: IROTransportChannel): IDataService_AsyncEx; overload;
    class function Create(const aUri: TROUri; aDefaultNamespaces: String = ''): IDataService_AsyncEx; overload;
    class function Create(const aUrl: String; aDefaultNamespaces: String = ''): IDataService_AsyncEx; overload;
  end;

  TDataService_Proxy = class(DataAbstract4_intf.TDataAbstractService_Proxy, IDataService)
  protected
    function __GetInterfaceName: String; override;
  end;

  TDataService_AsyncProxy = class(DataAbstract4_intf.TDataAbstractService_AsyncProxy, IDataService_Async)
  protected
    function __GetInterfaceName: String; override;
  end;

  TDataService_AsyncProxyEx = class(DataAbstract4_intf.TDataAbstractService_AsyncProxyEx, IDataService_AsyncEx)
  protected
    function __GetInterfaceName: String; override;
  end;

  ILoginService = interface(DataAbstract4_intf.ISimpleLoginService)
  ['{7F0E0D54-EDE8-4EDA-BDC6-59F5915C300E}']
  end;

  ILoginService_Async = interface(DataAbstract4_intf.ISimpleLoginService_Async)
  ['{FBCB4680-9E2E-4506-9E25-B70695B8EC21}']
  end;

  ILoginService_AsyncEx = interface(DataAbstract4_intf.ISimpleLoginService_AsyncEx)
  ['{EE6F2DBA-AA34-4480-8234-1DEB9EA07550}']
  end;

  CoLoginService = class(System.TObject)
  public
    class function Create(const aMessage: IROMessage; aTransportChannel: IROTransportChannel): ILoginService; overload;
    class function Create(const aUri: TROUri; aDefaultNamespaces: String = ''): ILoginService; overload;
    class function Create(const aUrl: String; aDefaultNamespaces: String = ''): ILoginService; overload;
  end;

  CoLoginService_Async = class(System.TObject)
  public
    class function Create(const aMessage: IROMessage; aTransportChannel: IROTransportChannel): ILoginService_Async; overload;
    class function Create(const aUri: TROUri; aDefaultNamespaces: String = ''): ILoginService_Async; overload;
    class function Create(const aUrl: String; aDefaultNamespaces: String = ''): ILoginService_Async; overload;
  end;

  CoLoginService_AsyncEx = class(System.TObject)
  public
    class function Create(const aMessage: IROMessage; aTransportChannel: IROTransportChannel): ILoginService_AsyncEx; overload;
    class function Create(const aUri: TROUri; aDefaultNamespaces: String = ''): ILoginService_AsyncEx; overload;
    class function Create(const aUrl: String; aDefaultNamespaces: String = ''): ILoginService_AsyncEx; overload;
  end;

  TLoginService_Proxy = class(DataAbstract4_intf.TSimpleLoginService_Proxy, ILoginService)
  protected
    function __GetInterfaceName: String; override;
  end;

  TLoginService_AsyncProxy = class(DataAbstract4_intf.TSimpleLoginService_AsyncProxy, ILoginService_Async)
  protected
    function __GetInterfaceName: String; override;
  end;

  TLoginService_AsyncProxyEx = class(DataAbstract4_intf.TSimpleLoginService_AsyncProxyEx, ILoginService_AsyncEx)
  protected
    function __GetInterfaceName: String; override;
  end;

function DefaultNamespaces: String;
implementation

uses
  uROSerializer,
  uROClient,
  uROTransportChannel,
  uRORes;

function DefaultNamespaces: String;
var
  lres: String;
begin
  lres := DefaultNamespace;
  lres := (lres + ';') + DataAbstract4_Intf.DefaultNamespace;
  result := lres;
  exit;
end;

type
  { Forward declarations }
  TMyTransportChannel = class;

  TMyTransportChannel = class(TROTransportChannel)
  end;

class function CoDataService.Create(const aMessage: IROMessage; aTransportChannel: IROTransportChannel): IDataService;
begin
  result := TDataService_Proxy.Create(aMessage, aTransportChannel);
  exit;
end;

class function CoDataService.Create(const aUri: TROUri; aDefaultNamespaces: String = ''): IDataService;
begin
  result := TDataService_Proxy.Create(aUri, aDefaultNamespaces);
  exit;
end;

class function CoDataService.Create(const aUrl: String; aDefaultNamespaces: String = ''): IDataService;
begin
  result := TDataService_Proxy.Create(aUrl, aDefaultNamespaces);
  exit;
end;

class function CoDataService_Async.Create(const aMessage: IROMessage; aTransportChannel: IROTransportChannel): IDataService_Async;
begin
  result := TDataService_AsyncProxy.Create(aMessage, aTransportChannel);
  exit;
end;

class function CoDataService_Async.Create(const aUri: TROUri; aDefaultNamespaces: String = ''): IDataService_Async;
begin
  result := TDataService_AsyncProxy.Create(aUri, aDefaultNamespaces);
  exit;
end;

class function CoDataService_Async.Create(const aUrl: String; aDefaultNamespaces: String = ''): IDataService_Async;
begin
  result := TDataService_AsyncProxy.Create(aUrl, aDefaultNamespaces);
  exit;
end;

class function CoDataService_AsyncEx.Create(const aMessage: IROMessage; aTransportChannel: IROTransportChannel): IDataService_AsyncEx;
begin
  result := TDataService_AsyncProxyEx.Create(aMessage, aTransportChannel);
  exit;
end;

class function CoDataService_AsyncEx.Create(const aUri: TROUri; aDefaultNamespaces: String = ''): IDataService_AsyncEx;
begin
  result := TDataService_AsyncProxyEx.Create(aUri, aDefaultNamespaces);
  exit;
end;

class function CoDataService_AsyncEx.Create(const aUrl: String; aDefaultNamespaces: String = ''): IDataService_AsyncEx;
begin
  result := TDataService_AsyncProxyEx.Create(aUrl, aDefaultNamespaces);
  exit;
end;

function TDataService_Proxy.__GetInterfaceName: String;
begin
  result := 'DataService';
  exit;
end;

function TDataService_AsyncProxy.__GetInterfaceName: String;
begin
  result := 'DataService';
  exit;
end;

function TDataService_AsyncProxyEx.__GetInterfaceName: String;
begin
  result := 'DataService';
  exit;
end;

class function CoLoginService.Create(const aMessage: IROMessage; aTransportChannel: IROTransportChannel): ILoginService;
begin
  result := TLoginService_Proxy.Create(aMessage, aTransportChannel);
  exit;
end;

class function CoLoginService.Create(const aUri: TROUri; aDefaultNamespaces: String = ''): ILoginService;
begin
  result := TLoginService_Proxy.Create(aUri, aDefaultNamespaces);
  exit;
end;

class function CoLoginService.Create(const aUrl: String; aDefaultNamespaces: String = ''): ILoginService;
begin
  result := TLoginService_Proxy.Create(aUrl, aDefaultNamespaces);
  exit;
end;

class function CoLoginService_Async.Create(const aMessage: IROMessage; aTransportChannel: IROTransportChannel): ILoginService_Async;
begin
  result := TLoginService_AsyncProxy.Create(aMessage, aTransportChannel);
  exit;
end;

class function CoLoginService_Async.Create(const aUri: TROUri; aDefaultNamespaces: String = ''): ILoginService_Async;
begin
  result := TLoginService_AsyncProxy.Create(aUri, aDefaultNamespaces);
  exit;
end;

class function CoLoginService_Async.Create(const aUrl: String; aDefaultNamespaces: String = ''): ILoginService_Async;
begin
  result := TLoginService_AsyncProxy.Create(aUrl, aDefaultNamespaces);
  exit;
end;

class function CoLoginService_AsyncEx.Create(const aMessage: IROMessage; aTransportChannel: IROTransportChannel): ILoginService_AsyncEx;
begin
  result := TLoginService_AsyncProxyEx.Create(aMessage, aTransportChannel);
  exit;
end;

class function CoLoginService_AsyncEx.Create(const aUri: TROUri; aDefaultNamespaces: String = ''): ILoginService_AsyncEx;
begin
  result := TLoginService_AsyncProxyEx.Create(aUri, aDefaultNamespaces);
  exit;
end;

class function CoLoginService_AsyncEx.Create(const aUrl: String; aDefaultNamespaces: String = ''): ILoginService_AsyncEx;
begin
  result := TLoginService_AsyncProxyEx.Create(aUrl, aDefaultNamespaces);
  exit;
end;

function TLoginService_Proxy.__GetInterfaceName: String;
begin
  result := 'LoginService';
  exit;
end;

function TLoginService_AsyncProxy.__GetInterfaceName: String;
begin
  result := 'LoginService';
  exit;
end;

function TLoginService_AsyncProxyEx.__GetInterfaceName: String;
begin
  result := 'LoginService';
  exit;
end;

initialization
  RegisterProxyClass(IDataService_IID, TDataService_Proxy);
  RegisterProxyClass(ILoginService_IID, TLoginService_Proxy);
finalization
  UnregisterProxyClass(IDataService_IID);
  UnregisterProxyClass(ILoginService_IID);
end.

