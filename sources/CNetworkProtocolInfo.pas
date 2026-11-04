{
TNetworkProtocolInfo Component Version 3.4 - Suite GLibWMI
Copyright (c) 2024,  by German Estevez (Neftali)

La clase Win32_NetworkProtocol representa un protocolo de red y sus caracteristicas
en un sistema informatico Win32.


Utilizacion/Usage:
(ES) Basta con "soltar" el componente y activarlo.
(EN) Place the component in the form and active it.

MSDN Info:
https://learn.microsoft.com/es-es/windows/win32/cimwin32prov/win32-networkprotocol

=========================================================================
IMPORTANTE PROGRAMADORES: Por favor, si tienes comentarios, mejoras, ampliaciones,
errores y/o cualquier otro tipo de sugerencia envia un mail a:
german_ral@hotmail.com

IMPORTANT PROGRAMMERS: please, if you have comments, improvements, enlargements,
errors and/or any another type of suggestion send a mail to:
german_ral@hotmail.com
=========================================================================

@author German Estevez (Neftali)
@web    http://neftali.clubDelphi.com
@cat    Package GLibWMI
}
unit CNetworkProtocolInfo;

//=========================================================================
//
// I N T E R F A C E
//
//=========================================================================
interface

uses
  Classes, Controls, CWMIBase;

type

  {%ClassProperties PropertiesClass%}
  //: Clase para definir las propiedades del componente.
  TNetworkProtocolProperties = class(TPersistent)
  private
    {%PrivateClassVars PropertiesClass%}
    FCaption:string;
    FConnectionlessService:boolean;
    FDescription:string;
    FGuaranteesDelivery:boolean;
    FGuaranteesSequencing:boolean;
    FInstallDate:TDatetime;
    FMaximumAddressSize:integer;
    FMaximumMessageSize:integer;
    FMessageOriented:boolean;
    FMinimumAddressSize:integer;
    FName:string;
    FPseudoStreamOriented:boolean;
    FStatus:string;
    FSupportsBroadcasting:boolean;
    FSupportsConnectData:boolean;
    FSupportsDisconnectData:boolean;
    FSupportsEncryption:boolean;
    FSupportsExpeditedData:boolean;
    FSupportsFragmentation:boolean;
    FSupportsGracefulClosing:boolean;
    FSupportsGuaranteedBandwidth:boolean;
    FSupportsMulticasting:boolean;
    FSupportsQualityofService:boolean;

  public
    {%PublicGetMethods PropertiesClass%}
    // Obtener la propiedad <Status> como string
    function GetAllStatusAsString(index:integer):string;
    // Obtener el numero de elementos disponibles de la propiedad <Status>
    function GetAllStatusCount:integer;

  published
    {%PublishedProperties PropertiesClass%}
    /// <summary>
    ///  La propiedad Caption contiene una descripcion textual breve del objeto.
    /// </summary>
    property Caption:string read FCaption write FCaption stored False;
    /// <summary>
    ///  La propiedad ConnectionlessService indica si el protocolo admite el servicio sin conexion
    ///  (datagramas). En este servicio los paquetes se enrutan de forma independiente y pueden llegar
    ///  en un orden distinto al de envio. Si se produce un error de conexion, se notifica a la aplicacion.
    /// </summary>
    property ConnectionlessService:boolean read FConnectionlessService write FConnectionlessService stored False;
    /// <summary>
    ///  La propiedad Description contiene una descripcion textual del objeto.
    /// </summary>
    property Description:string read FDescription write FDescription stored False;
    /// <summary>
    ///  La propiedad GuaranteesDelivery indica si el protocolo admite la entrega de paquetes de datos.
    ///  Si es False, no se garantiza que todos los datos enviados lleguen al destino previsto.
    /// </summary>
    property GuaranteesDelivery:boolean read FGuaranteesDelivery write FGuaranteesDelivery stored False;
    /// <summary>
    ///  La propiedad GuaranteesSequencing indica si el protocolo garantiza que los datos lleguen
    ///  en el orden en que se enviaron. No garantiza la entrega, solo el orden.
    /// </summary>
    property GuaranteesSequencing:boolean read FGuaranteesSequencing write FGuaranteesSequencing stored False;
    /// <summary>
    ///  La propiedad InstallDate indica cuando se instalo el objeto. La falta de un valor no indica
    ///  que el objeto no este instalado.
    /// </summary>
    property InstallDate:TDatetime read FInstallDate write FInstallDate stored False;
    /// <summary>
    ///  La propiedad MaximumAddressSize indica la longitud maxima, en caracteres, de una direccion
    ///  de socket compatible con el protocolo.
    /// </summary>
    property MaximumAddressSize:integer read FMaximumAddressSize write FMaximumAddressSize stored False;
    /// <summary>
    ///  La propiedad MaximumMessageSize indica el tamano maximo, en caracteres, de un mensaje que el host
    ///  puede enviar o recibir con el protocolo. En protocolos sin tramas de mensaje, el tamano real
    ///  enviable a una direccion puede ser menor.
    /// </summary>
    property MaximumMessageSize:integer read FMaximumMessageSize write FMaximumMessageSize stored False;
    /// <summary>
    ///  La propiedad MessageOriented indica si el protocolo esta orientado a mensajes (usa paquetes de datos
    ///  para transferir informacion). Los protocolos orientados a flujo transfieren bytes de forma continua.
    /// </summary>
    property MessageOriented:boolean read FMessageOriented write FMessageOriented stored False;
    /// <summary>
    ///  La propiedad MinimumAddressSize indica la longitud minima, en caracteres, de una direccion
    ///  de socket compatible con el protocolo.
    /// </summary>
    property MinimumAddressSize:integer read FMinimumAddressSize write FMinimumAddressSize stored False;
    /// <summary>
    ///  La propiedad Name contiene el nombre del protocolo. Ejemplo: "TCP/IP".
    /// </summary>
    property Name:string read FName write FName stored False;
    /// <summary>
    ///  La propiedad PseudoStreamOriented indica si el protocolo, siendo orientado a mensajes, puede recibir
    ///  paquetes de longitud variable o datos transmitidos en todas las operaciones de recepcion, es decir,
    ///  si se comporta como orientado a flujo.
    /// </summary>
    property PseudoStreamOriented:boolean read FPseudoStreamOriented write FPseudoStreamOriented stored False;
    /// <summary>
    ///  La propiedad Status indica el estado actual del objeto. Valores posibles:
    ///  OK, Error, Degradado, Desconocido, Error previo, Inicio, Detener, Servicio,
    ///  Estresado, NonRecover, Sin contacto, Lost Comm.
    /// </summary>
    property Status:string read FStatus write FStatus stored False;
    /// <summary>
    ///  La propiedad SupportsBroadcasting indica si el protocolo admite un mecanismo para difundir
    ///  mensajes a traves de la red.
    /// </summary>
    property SupportsBroadcasting:boolean read FSupportsBroadcasting write FSupportsBroadcasting stored False;
    /// <summary>
    ///  La propiedad SupportsConnectData indica si el protocolo permite enviar datos al conectar a traves de la red.
    /// </summary>
    property SupportsConnectData:boolean read FSupportsConnectData write FSupportsConnectData stored False;
    /// <summary>
    ///  La propiedad SupportsDisconnectData indica si el protocolo permite enviar datos al desconectar a traves de la red.
    /// </summary>
    property SupportsDisconnectData:boolean read FSupportsDisconnectData write FSupportsDisconnectData stored False;
    /// <summary>
    ///  La propiedad SupportsEncryption indica si el protocolo admite el cifrado de datos.
    /// </summary>
    property SupportsEncryption:boolean read FSupportsEncryption write FSupportsEncryption stored False;
    /// <summary>
    ///  La propiedad SupportsExpeditedData indica si el protocolo admite datos acelerados (urgentes) a traves
    ///  de la red. Pueden omitir el control de flujo y tienen prioridad sobre los datos normales.
    /// </summary>
    property SupportsExpeditedData:boolean read FSupportsExpeditedData write FSupportsExpeditedData stored False;
    /// <summary>
    ///  La propiedad SupportsFragmentation indica si el protocolo admite la transmision de datos en fragmentos.
    ///  La MTU de la red fisica queda oculta para las aplicaciones.
    /// </summary>
    property SupportsFragmentation:boolean read FSupportsFragmentation write FSupportsFragmentation stored False;
    /// <summary>
    ///  La propiedad SupportsGracefulClosing indica si el protocolo admite operaciones de cierre en dos fases
    ///  (cierre correcto). En caso contrario solo admite cierres abortivos.
    /// </summary>
    property SupportsGracefulClosing:boolean read FSupportsGracefulClosing write FSupportsGracefulClosing stored False;
    /// <summary>
    ///  La propiedad SupportsGuaranteedBandwidth indica si el protocolo dispone de un mecanismo para establecer
    ///  y mantener un ancho de banda garantizado.
    /// </summary>
    property SupportsGuaranteedBandwidth:boolean read FSupportsGuaranteedBandwidth write FSupportsGuaranteedBandwidth stored False;
    /// <summary>
    ///  La propiedad SupportsMulticasting indica si el protocolo admite multidifusion.
    /// </summary>
    property SupportsMulticasting:boolean read FSupportsMulticasting write FSupportsMulticasting stored False;
    /// <summary>
    ///  La propiedad SupportsQualityofService indica si el protocolo puede admitir calidad de servicio (QoS)
    ///  por parte del proveedor de servicios de capas inferiores o del transportista.
    /// </summary>
    property SupportsQualityofService:boolean read FSupportsQualityofService write FSupportsQualityofService stored False;
  end;

  {%InterfaceClass WMIClass%}
  /// <summary>
  ///  La clase Win32_NetworkProtocol representa un protocolo de red y sus caracteristicas
  ///  en un sistema informatico Win32.
  /// </summary>
  TNetworkProtocolInfo = class(TWMIBase)
  private
    FNetworkProtocolProperties: TNetworkProtocolProperties;
  protected
    //: Rellenar las propiedades.
    procedure FillProperties(aIndex:integer); override;
    // propiedad Active
    procedure SetActive(const Value: Boolean); override;
    //: Clase para el componente.
    function GetWMIClass():string; override;
    //: Obtener el root.
    function GetWMIRoot():string; override;
    //: Limpiar las propiedades
    procedure ClearProps(); override;
  public
    // redefinido el constructor
    constructor Create(AOwner: TComponent); override;
    //: destructor
    destructor Destroy; override;

    {%InterfacePublicMethods WMIClass%}
  published
    {%InterfacePublishedPart WMIClass%}
    // propiedades del protocolo de red
    property NetworkProtocolProperties:TNetworkProtocolProperties read FNetworkProtocolProperties write FNetworkProtocolProperties;
  end;


// Constantes para la propiedad Status
const
  ENUM_STRING_STATUS_00 = 'OK';
  ENUM_STRING_STATUS_01 = 'Error';
  ENUM_STRING_STATUS_02 = 'Degradado';
  ENUM_STRING_STATUS_03 = 'Desconocido';
  ENUM_STRING_STATUS_04 = 'Error previo';
  ENUM_STRING_STATUS_05 = 'Inicio';
  ENUM_STRING_STATUS_06 = 'Detener';
  ENUM_STRING_STATUS_07 = 'Servicio';
  ENUM_STRING_STATUS_08 = 'Estresado';
  ENUM_STRING_STATUS_09 = 'NonRecover';
  ENUM_STRING_STATUS_10 = 'Sin contacto';
  ENUM_STRING_STATUS_11 = 'Lost Comm';

//=========================================================================
//
// I M P L E M E N T A T I O N
//
//=========================================================================
implementation

uses
  {Generales} Forms, Dialogs, Windows, SysUtils, WbemScripting_TLB,
  {GLibWMI} UProcedures, UConstantes, Types;

// Limpiar las propiedades
procedure TNetworkProtocolInfo.ClearProps;
begin
  Self.NetworkProtocolProperties.FCaption := EmptyStr;
  Self.NetworkProtocolProperties.FConnectionlessService := False;
  Self.NetworkProtocolProperties.FDescription := EmptyStr;
  Self.NetworkProtocolProperties.FGuaranteesDelivery := False;
  Self.NetworkProtocolProperties.FGuaranteesSequencing := False;
  Self.NetworkProtocolProperties.FInstallDate := 0;
  Self.NetworkProtocolProperties.FMaximumAddressSize := 0;
  Self.NetworkProtocolProperties.FMaximumMessageSize := 0;
  Self.NetworkProtocolProperties.FMessageOriented := False;
  Self.NetworkProtocolProperties.FMinimumAddressSize := 0;
  Self.NetworkProtocolProperties.FName := EmptyStr;
  Self.NetworkProtocolProperties.FPseudoStreamOriented := False;
  Self.NetworkProtocolProperties.FStatus := EmptyStr;
  Self.NetworkProtocolProperties.FSupportsBroadcasting := False;
  Self.NetworkProtocolProperties.FSupportsConnectData := False;
  Self.NetworkProtocolProperties.FSupportsDisconnectData := False;
  Self.NetworkProtocolProperties.FSupportsEncryption := False;
  Self.NetworkProtocolProperties.FSupportsExpeditedData := False;
  Self.NetworkProtocolProperties.FSupportsFragmentation := False;
  Self.NetworkProtocolProperties.FSupportsGracefulClosing := False;
  Self.NetworkProtocolProperties.FSupportsGuaranteedBandwidth := False;
  Self.NetworkProtocolProperties.FSupportsMulticasting := False;
  Self.NetworkProtocolProperties.FSupportsQualityofService := False;
end;

//: Constructor del componente
constructor TNetworkProtocolInfo.Create(AOwner: TComponent);
begin
  inherited;
  Self.FNetworkProtocolProperties := TNetworkProtocolProperties.Create();
  Self.MSDNHelp := 'https://learn.microsoft.com/es-es/windows/win32/cimwin32prov/win32-networkprotocol';
end;

//: destructor del componente
destructor TNetworkProtocolInfo.Destroy();
begin
  // liberar
  FreeAndNil(Self.FNetworkProtocolProperties);
  inherited;
end;

//: Obtener la clase
function TNetworkProtocolInfo.GetWMIClass(): string;
begin
  Result := 'Win32_NetworkProtocol'
end;

//: Obtener Root
function TNetworkProtocolInfo.GetWMIRoot(): string;
begin
  Result := '';
end;

//: Procedimiento de activacion
procedure TNetworkProtocolInfo.SetActive(const Value: Boolean);
begin
  // metodo heredado
  inherited;
end;

//: Rellenar las propiedades del componente.
procedure TNetworkProtocolInfo.FillProperties(AIndex: integer);
var
  v:     variant;
  vNull: boolean;
  vp:    TNetworkProtocolProperties;
begin
  // Llamar al heredado (importante)
  inherited;
  // Rellenar propiedades...
  vp := NetworkProtocolProperties;

  GetWMIPropertyValue(Self, 'Caption', v, vNull);
  vp.FCaption := VariantStrValue(v, vNull);

  GetWMIPropertyValue(Self, 'ConnectionlessService', v, vNull);
  vp.FConnectionlessService := VariantBooleanValue(v, vNull);

  GetWMIPropertyValue(Self, 'Description', v, vNull);
  vp.FDescription := VariantStrValue(v, vNull);

  GetWMIPropertyValue(Self, 'GuaranteesDelivery', v, vNull);
  vp.FGuaranteesDelivery := VariantBooleanValue(v, vNull);

  GetWMIPropertyValue(Self, 'GuaranteesSequencing', v, vNull);
  vp.FGuaranteesSequencing := VariantBooleanValue(v, vNull);

  GetWMIPropertyValue(Self, 'InstallDate', v, vNull);
  vp.FInstallDate := VariantDateTimeValue(v, vNull);

  GetWMIPropertyValue(Self, 'MaximumAddressSize', v, vNull);
  vp.FMaximumAddressSize := VariantIntegerValue(v, vNull);

  GetWMIPropertyValue(Self, 'MaximumMessageSize', v, vNull);
  vp.FMaximumMessageSize := VariantIntegerValue(v, vNull);

  GetWMIPropertyValue(Self, 'MessageOriented', v, vNull);
  vp.FMessageOriented := VariantBooleanValue(v, vNull);

  GetWMIPropertyValue(Self, 'MinimumAddressSize', v, vNull);
  vp.FMinimumAddressSize := VariantIntegerValue(v, vNull);

  GetWMIPropertyValue(Self, 'Name', v, vNull);
  vp.FName := VariantStrValue(v, vNull);

  GetWMIPropertyValue(Self, 'PseudoStreamOriented', v, vNull);
  vp.FPseudoStreamOriented := VariantBooleanValue(v, vNull);

  GetWMIPropertyValue(Self, 'Status', v, vNull);
  vp.FStatus := VariantStrValue(v, vNull);

  GetWMIPropertyValue(Self, 'SupportsBroadcasting', v, vNull);
  vp.FSupportsBroadcasting := VariantBooleanValue(v, vNull);

  GetWMIPropertyValue(Self, 'SupportsConnectData', v, vNull);
  vp.FSupportsConnectData := VariantBooleanValue(v, vNull);

  GetWMIPropertyValue(Self, 'SupportsDisconnectData', v, vNull);
  vp.FSupportsDisconnectData := VariantBooleanValue(v, vNull);

  GetWMIPropertyValue(Self, 'SupportsEncryption', v, vNull);
  vp.FSupportsEncryption := VariantBooleanValue(v, vNull);

  GetWMIPropertyValue(Self, 'SupportsExpeditedData', v, vNull);
  vp.FSupportsExpeditedData := VariantBooleanValue(v, vNull);

  GetWMIPropertyValue(Self, 'SupportsFragmentation', v, vNull);
  vp.FSupportsFragmentation := VariantBooleanValue(v, vNull);

  GetWMIPropertyValue(Self, 'SupportsGracefulClosing', v, vNull);
  vp.FSupportsGracefulClosing := VariantBooleanValue(v, vNull);

  GetWMIPropertyValue(Self, 'SupportsGuaranteedBandwidth', v, vNull);
  vp.FSupportsGuaranteedBandwidth := VariantBooleanValue(v, vNull);

  GetWMIPropertyValue(Self, 'SupportsMulticasting', v, vNull);
  vp.FSupportsMulticasting := VariantBooleanValue(v, vNull);

  GetWMIPropertyValue(Self, 'SupportsQualityofService', v, vNull);
  vp.FSupportsQualityofService := VariantBooleanValue(v, vNull);
end;


// Obtener la propiedad como string
function TNetworkProtocolProperties.GetAllStatusAsString(index:integer):string;
begin
  case index of
    00: Result := ENUM_STRING_STATUS_00;
    01: Result := ENUM_STRING_STATUS_01;
    02: Result := ENUM_STRING_STATUS_02;
    03: Result := ENUM_STRING_STATUS_03;
    04: Result := ENUM_STRING_STATUS_04;
    05: Result := ENUM_STRING_STATUS_05;
    06: Result := ENUM_STRING_STATUS_06;
    07: Result := ENUM_STRING_STATUS_07;
    08: Result := ENUM_STRING_STATUS_08;
    09: Result := ENUM_STRING_STATUS_09;
    10: Result := ENUM_STRING_STATUS_10;
    11: Result := ENUM_STRING_STATUS_11;
  else
    Result := STR_EMPTY;
  end;
end;

// Obtener n. de elementos de la propiedad como string
function TNetworkProtocolProperties.GetAllStatusCount:integer;
begin
  Result := 12
end;


end.
