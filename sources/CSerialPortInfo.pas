{
TSerialPortInfo Component Version 3.4 - Suite GLibWMI
Copyright (c) 2024,  by German Estevez (Neftali)

La clase Win32_SerialPort representa un puerto serie en un sistema informatico
que ejecuta Windows.


Utilizacion/Usage:
(ES) Basta con "soltar" el componente y activarlo.
(EN) Place the component in the form and active it.

MSDN Info:
https://learn.microsoft.com/es-es/windows/win32/cimwin32prov/win32-serialport

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
unit CSerialPortInfo;

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
  TSerialPortProperties = class(TPersistent)
  private
    {%PrivateClassVars PropertiesClass%}
    FAvailability:integer;
    FBinary:boolean;
    FCapabilities:TArrInteger;
    FCapabilitiesCount:integer;
    FCapabilitiesAsString:string;
    FCapabilityDescriptions:TArrString;
    FCapabilityDescriptionsCount:integer;
    FCapabilityDescriptionsAsString:string;
    FCaption:string;
    FConfigManagerErrorCode:integer;
    FConfigManagerUserConfig:boolean;
    FCreationClassName:string;
    FDescription:string;
    FDeviceID:string;
    FErrorCleared:boolean;
    FErrorDescription:string;
    FInstallDate:TDatetime;
    FLastErrorCode:integer;
    FMaxBaudRate:integer;
    FMaximumInputBufferSize:integer;
    FMaximumOutputBufferSize:integer;
    FMaxNumberControlled:integer;
    FName:string;
    FOSAutoDiscovered:boolean;
    FPNPDeviceID:string;
    FPowerManagementCapabilities:TArrInteger;
    FPowerManagementCapabilitiesCount:integer;
    FPowerManagementCapabilitiesAsString:string;
    FPowerManagementSupported:boolean;
    FProtocolSupported:integer;
    FProviderType:string;
    FSettableBaudRate:boolean;
    FSettableDataBits:boolean;
    FSettableFlowControl:boolean;
    FSettableParity:boolean;
    FSettableParityCheck:boolean;
    FSettableRLSD:boolean;
    FSettableStopBits:boolean;
    FStatus:string;
    FStatusInfo:integer;
    FSupports16BitMode:boolean;
    FSupportsDTRDSR:boolean;
    FSupportsElapsedTimeouts:boolean;
    FSupportsIntTimeouts:boolean;
    FSupportsParityCheck:boolean;
    FSupportsRLSD:boolean;
    FSupportsRTSCTS:boolean;
    FSupportsSpecialCharacters:boolean;
    FSupportsXOnXOff:boolean;
    FSupportsXOnXOffSet:boolean;
    FSystemCreationClassName:string;
    FSystemName:string;
    FTimeOfLastReset:TDatetime;

  private
    {%PrivateGetMethods PropertiesClass%}
    function GetCapabilities(index: integer):integer;
    function GetCapabilityDescriptions(index: integer):string;
    function GetPowerManagementCapabilities(index: integer):integer;

  public
    {%PublicGetMethods PropertiesClass%}
    // Obtener la propiedad <Availability> como string
    function GetAllAvailabilityAsString(index:integer):string;
    // Obtener el numero de elementos disponibles de la propiedad <Availability>
    function GetAllAvailabilityCount:integer;
    // Obtener la propiedad <Capabilities> como string
    function GetAllCapabilitiesAsString(index:integer):string;
    // Obtener el numero de elementos disponibles de la propiedad <Capabilities>
    function GetAllCapabilitiesCount:integer;
    // Obtener la propiedad <ConfigManagerErrorCode> como string
    function GetAllConfigManagerErrorCodeAsString(index:integer):string;
    // Obtener el numero de elementos disponibles de la propiedad <ConfigManagerErrorCode>
    function GetAllConfigManagerErrorCodeCount:integer;
    // Obtener la propiedad <PowerManagementCapabilities> como string
    function GetAllPowerManagementCapabilitiesAsString(index:integer):string;
    // Obtener el numero de elementos disponibles de la propiedad <PowerManagementCapabilities>
    function GetAllPowerManagementCapabilitiesCount:integer;
    // Obtener la propiedad <ProtocolSupported> como string
    function GetAllProtocolSupportedAsString(index:integer):string;
    // Obtener el numero de elementos disponibles de la propiedad <ProtocolSupported>
    function GetAllProtocolSupportedCount:integer;
    // Obtener la propiedad <ProviderType> como string
    function GetAllProviderTypeAsString(index:integer):string;
    // Obtener el numero de elementos disponibles de la propiedad <ProviderType>
    function GetAllProviderTypeCount:integer;
    // Obtener la propiedad <Status> como string
    function GetAllStatusAsString(index:integer):string;
    // Obtener el numero de elementos disponibles de la propiedad <Status>
    function GetAllStatusCount:integer;
    // Obtener la propiedad <StatusInfo> como string
    function GetAllStatusInfoAsString(index:integer):string;
    // Obtener el numero de elementos disponibles de la propiedad <StatusInfo>
    function GetAllStatusInfoCount:integer;

    {%PublicArrayMethods PropertiesClass%}
    property Capabilities[index:integer]:integer read GetCapabilities;
    property CapabilitiesCount:integer read FCapabilitiesCount stored False;
    property CapabilityDescriptions[index:integer]:string read GetCapabilityDescriptions;
    property CapabilityDescriptionsCount:integer read FCapabilityDescriptionsCount stored False;
    property PowerManagementCapabilities[index:integer]:integer read GetPowerManagementCapabilities;
    property PowerManagementCapabilitiesCount:integer read FPowerManagementCapabilitiesCount stored False;

  published
    {%PublishedProperties PropertiesClass%}
    /// <summary>
    ///  La disponibilidad y estado del dispositivo. Valores habituales: 3 (funcionando con energia completa),
    ///  4 (advertencia), 5 (en prueba), 10 (degradado), 13-15 y 17 (ahorro de energia).
    /// </summary>
    property Availability:integer read FAvailability write FAvailability stored False;
    /// <summary>
    ///  Si es True, el puerto serie esta configurado para la transferencia de datos binarios.
    ///  Como la API de Windows no admite el modo no binario, esta propiedad debe ser True.
    /// </summary>
    property Binary:boolean read FBinary write FBinary stored False;
    /// <summary>
    ///  La propiedad de matriz Capabilities contiene la matriz de compatibilidad de nivel de chip
    ///  del controlador serie (almacenamiento en bufer y otras funcionalidades inherentes al hardware).
    /// </summary>
    property CapabilitiesAsString:string read FCapabilitiesAsString write FCapabilitiesAsString stored False;
    /// <summary>
    ///  La propiedad de matriz CapabilityDescriptions contiene cadenas de forma libre que explican
    ///  con mas detalle las funcionalidades indicadas en Capabilities. Cada entrada se relaciona con
    ///  la entrada de Capabilities que ocupa el mismo indice.
    /// </summary>
    property CapabilityDescriptionsAsString:string read FCapabilityDescriptionsAsString write FCapabilityDescriptionsAsString stored False;
    /// <summary>
    ///  Breve descripcion textual del objeto.
    /// </summary>
    property Caption:string read FCaption write FCaption stored False;
    /// <summary>
    ///  Codigo de error del Administrador de configuracion de Win32 (0 a 31). El valor 0 indica
    ///  que el dispositivo funciona correctamente.
    /// </summary>
    property ConfigManagerErrorCode:integer read FConfigManagerErrorCode write FConfigManagerErrorCode stored False;
    /// <summary>
    ///  Si es True, el dispositivo usa una configuracion definida por el usuario.
    /// </summary>
    property ConfigManagerUserConfig:boolean read FConfigManagerUserConfig write FConfigManagerUserConfig stored False;
    /// <summary>
    ///  Nombre de la primera clase concreta de la cadena de herencia usada en la creacion de la instancia.
    /// </summary>
    property CreationClassName:string read FCreationClassName write FCreationClassName stored False;
    /// <summary>
    ///  Descripcion textual del objeto.
    /// </summary>
    property Description:string read FDescription write FDescription stored False;
    /// <summary>
    ///  Identificador unico del puerto serie respecto a otros dispositivos del sistema (por ejemplo COM1).
    /// </summary>
    property DeviceID:string read FDeviceID write FDeviceID stored False;
    /// <summary>
    ///  Si es True, se ha borrado el error notificado en LastErrorCode.
    /// </summary>
    property ErrorCleared:boolean read FErrorCleared write FErrorCleared stored False;
    /// <summary>
    ///  Cadena de forma libre con mas informacion sobre el error de LastErrorCode y acciones correctivas.
    /// </summary>
    property ErrorDescription:string read FErrorDescription write FErrorDescription stored False;
    /// <summary>
    ///  Fecha y hora en que se instalo el objeto. La falta de un valor no indica que no este instalado.
    /// </summary>
    property InstallDate:TDatetime read FInstallDate write FInstallDate stored False;
    /// <summary>
    ///  Ultimo codigo de error notificado por el dispositivo logico.
    /// </summary>
    property LastErrorCode:integer read FLastErrorCode write FLastErrorCode stored False;
    /// <summary>
    ///  Velocidad maxima de baudios, en bits por segundo, soportada por el controlador serie.
    /// </summary>
    property MaxBaudRate:integer read FMaxBaudRate write FMaxBaudRate stored False;
    /// <summary>
    ///  Tamano maximo, en bytes, del bufer de entrada interno del controlador. Un valor de 0 indica
    ///  que el proveedor no impone un maximo.
    /// </summary>
    property MaximumInputBufferSize:integer read FMaximumInputBufferSize write FMaximumInputBufferSize stored False;
    /// <summary>
    ///  Tamano maximo, en bytes, del bufer de salida interno del controlador. Un valor de 0 indica
    ///  que el proveedor no impone un maximo.
    /// </summary>
    property MaximumOutputBufferSize:integer read FMaximumOutputBufferSize write FMaximumOutputBufferSize stored False;
    /// <summary>
    ///  Numero maximo de entidades direccionables directamente que soporta el controlador.
    ///  El valor 0 indica que el numero es desconocido.
    /// </summary>
    property MaxNumberControlled:integer read FMaxNumberControlled write FMaxNumberControlled stored False;
    /// <summary>
    ///  Etiqueta por la que se conoce el objeto.
    /// </summary>
    property Name:string read FName write FName stored False;
    /// <summary>
    ///  Si es True, el sistema operativo detecto automaticamente las instancias de esta clase.
    /// </summary>
    property OSAutoDiscovered:boolean read FOSAutoDiscovered write FOSAutoDiscovered stored False;
    /// <summary>
    ///  Identificador de dispositivo Plug and Play del dispositivo logico. Ejemplo: "*PNP030b".
    /// </summary>
    property PNPDeviceID:string read FPNPDeviceID write FPNPDeviceID stored False;
    /// <summary>
    ///  La propiedad de matriz PowerManagementCapabilities contiene las funcionalidades relacionadas
    ///  con la energia del dispositivo logico.
    /// </summary>
    property PowerManagementCapabilitiesAsString:string read FPowerManagementCapabilitiesAsString write FPowerManagementCapabilitiesAsString stored False;
    /// <summary>
    ///  Si es True, el dispositivo se puede administrar con energia (suspension, etc.). No indica que
    ///  las funciones de administracion de energia esten habilitadas actualmente.
    /// </summary>
    property PowerManagementSupported:boolean read FPowerManagementSupported write FPowerManagementSupported stored False;
    /// <summary>
    ///  Protocolo utilizado por el controlador para acceder a los dispositivos controlados
    ///  (PCI, ISA, RS232, USB, etc.).
    /// </summary>
    property ProtocolSupported:integer read FProtocolSupported write FProtocolSupported stored False;
    /// <summary>
    ///  Tipo de proveedor de comunicaciones. Valores: "Dispositivo fax", "Protocolo LAT",
    ///  "Dispositivo modem", "Puente de red", "Puerto paralelo", "Puerto serie RS232",
    ///  "Puerto RS422", "Puerto RS423", "Puerto RS449", "Dispositivo de escaner",
    ///  "TCP/IP TelNet", "X.25", "Sin especificar".
    /// </summary>
    property ProviderType:string read FProviderType write FProviderType stored False;
    /// <summary>
    ///  Si es True, se puede cambiar la velocidad de baudios de este puerto serie.
    /// </summary>
    property SettableBaudRate:boolean read FSettableBaudRate write FSettableBaudRate stored False;
    /// <summary>
    ///  Si es True, se pueden establecer los bits de datos de este puerto serie.
    /// </summary>
    property SettableDataBits:boolean read FSettableDataBits write FSettableDataBits stored False;
    /// <summary>
    ///  Si es True, se puede establecer el control de flujo de este puerto serie.
    /// </summary>
    property SettableFlowControl:boolean read FSettableFlowControl write FSettableFlowControl stored False;
    /// <summary>
    ///  Si es True, se puede establecer la paridad de este puerto serie.
    /// </summary>
    property SettableParity:boolean read FSettableParity write FSettableParity stored False;
    /// <summary>
    ///  Si es True, se puede establecer la comprobacion de paridad de este puerto serie
    ///  (si se admite la comprobacion de paridad).
    /// </summary>
    property SettableParityCheck:boolean read FSettableParityCheck write FSettableParityCheck stored False;
    /// <summary>
    ///  Si es True, se puede establecer la deteccion de senal de linea recibida (RLSD)
    ///  en este puerto serie (si se admite RLSD).
    /// </summary>
    property SettableRLSD:boolean read FSettableRLSD write FSettableRLSD stored False;
    /// <summary>
    ///  Si es True, se pueden establecer los bits de parada de este puerto serie.
    /// </summary>
    property SettableStopBits:boolean read FSettableStopBits write FSettableStopBits stored False;
    /// <summary>
    ///  Estado actual del objeto. Valores posibles:
    ///  OK, Error, Degradado, Desconocido, Error previo, Inicio, Detener, Servicio,
    ///  Estresado, NonRecover, Sin contacto, Lost Comm.
    /// </summary>
    property Status:string read FStatus write FStatus stored False;
    /// <summary>
    ///  Estado del dispositivo logico. Si no aplica, se usa el valor 5 (no aplicable).
    /// </summary>
    property StatusInfo:integer read FStatusInfo write FStatusInfo stored False;
    /// <summary>
    ///  Si es True, se admite el modo de 16 bits en este puerto serie.
    /// </summary>
    property Supports16BitMode:boolean read FSupports16BitMode write FSupports16BitMode stored False;
    /// <summary>
    ///  Si es True, se admiten las senales DTR (terminal de datos preparado) y DSR (equipo de datos preparado).
    /// </summary>
    property SupportsDTRDSR:boolean read FSupportsDTRDSR write FSupportsDTRDSR stored False;
    /// <summary>
    ///  Si es True, se admiten tiempos de espera transcurridos (total de tiempo entre transmisiones).
    /// </summary>
    property SupportsElapsedTimeouts:boolean read FSupportsElapsedTimeouts write FSupportsElapsedTimeouts stored False;
    /// <summary>
    ///  Si es True, se admiten tiempos de espera de intervalo (tiempo entre la llegada de cada fragmento de datos).
    /// </summary>
    property SupportsIntTimeouts:boolean read FSupportsIntTimeouts write FSupportsIntTimeouts stored False;
    /// <summary>
    ///  Si es True, se admite la comprobacion de paridad en este puerto serie.
    /// </summary>
    property SupportsParityCheck:boolean read FSupportsParityCheck write FSupportsParityCheck stored False;
    /// <summary>
    ///  Si es True, se admite la deteccion de senal de linea recibida (RLSD) en este puerto serie.
    /// </summary>
    property SupportsRLSD:boolean read FSupportsRLSD write FSupportsRLSD stored False;
    /// <summary>
    ///  Si es True, se admiten las senales RTS (listo para enviar) y CTS (listo para transmitir).
    /// </summary>
    property SupportsRTSCTS:boolean read FSupportsRTSCTS write FSupportsRTSCTS stored False;
    /// <summary>
    ///  Si es True, se admiten caracteres de control del puerto serie (EofChar, ErrorChar, BreakChar,
    ///  EventChar, XonChar y XoffChar). Indican eventos en lugar de datos.
    /// </summary>
    property SupportsSpecialCharacters:boolean read FSupportsSpecialCharacters write FSupportsSpecialCharacters stored False;
    /// <summary>
    ///  Si es True, se admite el control de flujo XON/XOFF en este puerto serie.
    /// </summary>
    property SupportsXOnXOff:boolean read FSupportsXOnXOff write FSupportsXOnXOff stored False;
    /// <summary>
    ///  Si es True, el proveedor de comunicaciones admite la configuracion del control de flujo XON/XOFF.
    /// </summary>
    property SupportsXOnXOffSet:boolean read FSupportsXOnXOffSet write FSupportsXOnXOffSet stored False;
    /// <summary>
    ///  Valor de la propiedad CreationClassName del equipo de ambito.
    /// </summary>
    property SystemCreationClassName:string read FSystemCreationClassName write FSystemCreationClassName stored False;
    /// <summary>
    ///  Nombre del sistema de ambito.
    /// </summary>
    property SystemName:string read FSystemName write FSystemName stored False;
    /// <summary>
    ///  Fecha y hora en que este controlador se reinicializo por ultima vez.
    /// </summary>
    property TimeOfLastReset:TDatetime read FTimeOfLastReset write FTimeOfLastReset stored False;
  end;

  {%InterfaceClass WMIClass%}
  /// <summary>
  ///  La clase Win32_SerialPort representa un puerto serie en un sistema informatico
  ///  que ejecuta Windows.
  /// </summary>
  TSerialPortInfo = class(TWMIBase)
  private
    FSerialPortProperties: TSerialPortProperties;
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
    // propiedades del puerto serie
    property SerialPortProperties:TSerialPortProperties read FSerialPortProperties write FSerialPortProperties;
  end;


// Constantes para la propiedad Availability
const
  ENUM_STRING_AVAILABILITY_00 = 'Otros';
  ENUM_STRING_AVAILABILITY_01 = 'Desconocido';
  ENUM_STRING_AVAILABILITY_02 = 'Corriente/potencia completa';
  ENUM_STRING_AVAILABILITY_03 = 'Advertencia';
  ENUM_STRING_AVAILABILITY_04 = 'En prueba';
  ENUM_STRING_AVAILABILITY_05 = 'No aplicable';
  ENUM_STRING_AVAILABILITY_06 = 'Apagar';
  ENUM_STRING_AVAILABILITY_07 = 'Off Line';
  ENUM_STRING_AVAILABILITY_08 = 'Off Duty';
  ENUM_STRING_AVAILABILITY_09 = 'Degradado';
  ENUM_STRING_AVAILABILITY_10 = 'No instalado';
  ENUM_STRING_AVAILABILITY_11 = 'Error de instalacion';
  ENUM_STRING_AVAILABILITY_12 = 'Ahorro de energia: desconocido';
  ENUM_STRING_AVAILABILITY_13 = 'Ahorro de energia: modo de bajo consumo';
  ENUM_STRING_AVAILABILITY_14 = 'Ahorro de energia: en espera';
  ENUM_STRING_AVAILABILITY_15 = 'Ciclo de alimentacion';
  ENUM_STRING_AVAILABILITY_16 = 'Ahorro de energia: advertencia';
  ENUM_STRING_AVAILABILITY_17 = 'En pausa';
  ENUM_STRING_AVAILABILITY_18 = 'No listo';
  ENUM_STRING_AVAILABILITY_19 = 'Sin configurar';
  ENUM_STRING_AVAILABILITY_20 = 'Silenciado';

// Constantes para la propiedad Capabilities
const
  ENUM_STRING_CAPABILITIES_00 = 'Otros';
  ENUM_STRING_CAPABILITIES_01 = 'Desconocido';
  ENUM_STRING_CAPABILITIES_02 = 'XT/AT compatible';
  ENUM_STRING_CAPABILITIES_03 = '16450 Compatible';
  ENUM_STRING_CAPABILITIES_04 = '16550 Compatible';
  ENUM_STRING_CAPABILITIES_05 = '16550A Compatible';
  ENUM_STRING_CAPABILITIES_06 = '8251 Compatible';
  ENUM_STRING_CAPABILITIES_07 = '8251FIFO compatible';

// Constantes para la propiedad ConfigManagerErrorCode
const
  ENUM_STRING_CONFIGMANAGERERRORCODE_00 = 'Este dispositivo funciona correctamente.';
  ENUM_STRING_CONFIGMANAGERERRORCODE_01 = 'Este dispositivo no esta configurado correctamente.';
  ENUM_STRING_CONFIGMANAGERERRORCODE_02 = 'Windows no puede cargar el controlador para este dispositivo.';
  ENUM_STRING_CONFIGMANAGERERRORCODE_03 = 'El controlador de este dispositivo puede estar danado o el sistema tiene poca memoria u otros recursos.';
  ENUM_STRING_CONFIGMANAGERERRORCODE_04 = 'Este dispositivo no funciona correctamente. Uno de sus controladores o el registro podrian estar danados.';
  ENUM_STRING_CONFIGMANAGERERRORCODE_05 = 'El controlador de este dispositivo necesita un recurso que Windows no puede administrar.';
  ENUM_STRING_CONFIGMANAGERERRORCODE_06 = 'La configuracion de arranque de este dispositivo entra en conflicto con otros dispositivos.';
  ENUM_STRING_CONFIGMANAGERERRORCODE_07 = 'No se puede filtrar.';
  ENUM_STRING_CONFIGMANAGERERRORCODE_08 = 'Falta el cargador de controladores para el dispositivo.';
  ENUM_STRING_CONFIGMANAGERERRORCODE_09 = 'Este dispositivo no funciona correctamente porque el firmware de control informa incorrectamente de los recursos del dispositivo.';
  ENUM_STRING_CONFIGMANAGERERRORCODE_10 = 'Este dispositivo no se puede iniciar.';
  ENUM_STRING_CONFIGMANAGERERRORCODE_11 = 'Error en este dispositivo.';
  ENUM_STRING_CONFIGMANAGERERRORCODE_12 = 'Este dispositivo no encuentra suficientes recursos libres que pueda usar.';
  ENUM_STRING_CONFIGMANAGERERRORCODE_13 = 'Windows no puede comprobar los recursos de este dispositivo.';
  ENUM_STRING_CONFIGMANAGERERRORCODE_14 = 'Este dispositivo no puede funcionar correctamente hasta que reinicie el equipo.';
  ENUM_STRING_CONFIGMANAGERERRORCODE_15 = 'Este dispositivo no funciona correctamente porque probablemente haya un problema de volver a enumerar.';
  ENUM_STRING_CONFIGMANAGERERRORCODE_16 = 'Windows no puede identificar todos los recursos que usa este dispositivo.';
  ENUM_STRING_CONFIGMANAGERERRORCODE_17 = 'Este dispositivo solicita un tipo de recurso desconocido.';
  ENUM_STRING_CONFIGMANAGERERRORCODE_18 = 'Vuelva a instalar los controladores de este dispositivo.';
  ENUM_STRING_CONFIGMANAGERERRORCODE_19 = 'Error al usar el cargador de VxD.';
  ENUM_STRING_CONFIGMANAGERERRORCODE_20 = 'Es posible que el registro este danado.';
  ENUM_STRING_CONFIGMANAGERERRORCODE_21 = 'Error del sistema: intente cambiar el controlador de este dispositivo. Si eso no funciona, consulte la documentacion de hardware. Windows esta quitando este dispositivo.';
  ENUM_STRING_CONFIGMANAGERERRORCODE_22 = 'Este dispositivo esta deshabilitado.';
  ENUM_STRING_CONFIGMANAGERERRORCODE_23 = 'Error del sistema: intente cambiar el controlador de este dispositivo. Si eso no funciona, consulte la documentacion de hardware.';
  ENUM_STRING_CONFIGMANAGERERRORCODE_24 = 'Este dispositivo no esta presente, no funciona correctamente o no tiene instalados todos sus controladores.';
  ENUM_STRING_CONFIGMANAGERERRORCODE_25 = 'Windows sigue configurando este dispositivo.';
  ENUM_STRING_CONFIGMANAGERERRORCODE_26 = 'Windows sigue configurando este dispositivo.';
  ENUM_STRING_CONFIGMANAGERERRORCODE_27 = 'Este dispositivo no tiene una configuracion de registro valida.';
  ENUM_STRING_CONFIGMANAGERERRORCODE_28 = 'Los controladores de este dispositivo no estan instalados.';
  ENUM_STRING_CONFIGMANAGERERRORCODE_29 = 'Este dispositivo esta deshabilitado porque el firmware del dispositivo no le ha dado los recursos necesarios.';
  ENUM_STRING_CONFIGMANAGERERRORCODE_30 = 'Este dispositivo usa un recurso de solicitud de interrupcion (IRQ) que usa otro dispositivo.';
  ENUM_STRING_CONFIGMANAGERERRORCODE_31 = 'Este dispositivo no funciona correctamente porque Windows no puede cargar los controladores necesarios.';

// Constantes para la propiedad PowerManagementCapabilities
const
  ENUM_STRING_POWERMANAGEMENTCAPABILITIES_00 = 'Desconocido';
  ENUM_STRING_POWERMANAGEMENTCAPABILITIES_01 = 'No compatible';
  ENUM_STRING_POWERMANAGEMENTCAPABILITIES_02 = 'Deshabilitado';
  ENUM_STRING_POWERMANAGEMENTCAPABILITIES_03 = 'Habilitado';
  ENUM_STRING_POWERMANAGEMENTCAPABILITIES_04 = 'Modos de ahorro de energia introducidos automaticamente';
  ENUM_STRING_POWERMANAGEMENTCAPABILITIES_05 = 'Power State Settable';
  ENUM_STRING_POWERMANAGEMENTCAPABILITIES_06 = 'Power Cycling Supported';
  ENUM_STRING_POWERMANAGEMENTCAPABILITIES_07 = 'Encendido con tiempo admitido';

// Constantes para la propiedad ProtocolSupported
const
  ENUM_STRING_PROTOCOLSUPPORTED_00 = 'Otros';
  ENUM_STRING_PROTOCOLSUPPORTED_01 = 'Desconocido';
  ENUM_STRING_PROTOCOLSUPPORTED_02 = 'EISA';
  ENUM_STRING_PROTOCOLSUPPORTED_03 = 'ISA';
  ENUM_STRING_PROTOCOLSUPPORTED_04 = 'PCI';
  ENUM_STRING_PROTOCOLSUPPORTED_05 = 'ATA/ATAPI';
  ENUM_STRING_PROTOCOLSUPPORTED_06 = 'Diskette flexible';
  ENUM_STRING_PROTOCOLSUPPORTED_07 = '1496';
  ENUM_STRING_PROTOCOLSUPPORTED_08 = 'Interfaz paralela SCSI';
  ENUM_STRING_PROTOCOLSUPPORTED_09 = 'Protocolo de canal de fibra SCSI';
  ENUM_STRING_PROTOCOLSUPPORTED_10 = 'Protocolo de bus serie SCSI';
  ENUM_STRING_PROTOCOLSUPPORTED_11 = 'Protocolo de bus serie SCSI-2 (1394)';
  ENUM_STRING_PROTOCOLSUPPORTED_12 = 'Arquitectura de almacenamiento serie SCSI';
  ENUM_STRING_PROTOCOLSUPPORTED_13 = 'VESA';
  ENUM_STRING_PROTOCOLSUPPORTED_14 = 'PCMCIA';
  ENUM_STRING_PROTOCOLSUPPORTED_15 = 'Bus serie universal';
  ENUM_STRING_PROTOCOLSUPPORTED_16 = 'Protocolo paralelo';
  ENUM_STRING_PROTOCOLSUPPORTED_17 = 'ESCON';
  ENUM_STRING_PROTOCOLSUPPORTED_18 = 'Diagnostico';
  ENUM_STRING_PROTOCOLSUPPORTED_19 = 'I2C';
  ENUM_STRING_PROTOCOLSUPPORTED_20 = 'Potencia';
  ENUM_STRING_PROTOCOLSUPPORTED_21 = 'HIPPI';
  ENUM_STRING_PROTOCOLSUPPORTED_22 = 'MultiBus';
  ENUM_STRING_PROTOCOLSUPPORTED_23 = 'VME';
  ENUM_STRING_PROTOCOLSUPPORTED_24 = 'IPI';
  ENUM_STRING_PROTOCOLSUPPORTED_25 = 'IEEE-488';
  ENUM_STRING_PROTOCOLSUPPORTED_26 = 'RS232';
  ENUM_STRING_PROTOCOLSUPPORTED_27 = 'IEEE 802.3 10BASE5';
  ENUM_STRING_PROTOCOLSUPPORTED_28 = 'IEEE 802.3 10BASE2';
  ENUM_STRING_PROTOCOLSUPPORTED_29 = 'IEEE 802.3 1BASE5';
  ENUM_STRING_PROTOCOLSUPPORTED_30 = 'IEEE 802.3 10BROAD36';
  ENUM_STRING_PROTOCOLSUPPORTED_31 = 'IEEE 802.3 100BASEVG';
  ENUM_STRING_PROTOCOLSUPPORTED_32 = 'Anillo de token IEEE 802.5';
  ENUM_STRING_PROTOCOLSUPPORTED_33 = 'ANSI X3T9.5 FDDI';
  ENUM_STRING_PROTOCOLSUPPORTED_34 = 'MCA';
  ENUM_STRING_PROTOCOLSUPPORTED_35 = 'ESDI';
  ENUM_STRING_PROTOCOLSUPPORTED_36 = 'IDE';
  ENUM_STRING_PROTOCOLSUPPORTED_37 = 'CMD';
  ENUM_STRING_PROTOCOLSUPPORTED_38 = 'ST506';
  ENUM_STRING_PROTOCOLSUPPORTED_39 = 'DSSI';
  ENUM_STRING_PROTOCOLSUPPORTED_40 = 'QIC2';
  ENUM_STRING_PROTOCOLSUPPORTED_41 = 'ATA/IDE mejorado';
  ENUM_STRING_PROTOCOLSUPPORTED_42 = 'AGP';
  ENUM_STRING_PROTOCOLSUPPORTED_43 = 'TWIRP (infrarrojo bidireccional)';
  ENUM_STRING_PROTOCOLSUPPORTED_44 = 'FIR (infrarrojo rapido)';
  ENUM_STRING_PROTOCOLSUPPORTED_45 = 'SIR (infrarrojo serie)';
  ENUM_STRING_PROTOCOLSUPPORTED_46 = 'IrBus';

// Constantes para la propiedad ProviderType
const
  ENUM_STRING_PROVIDERTYPE_00 = 'Dispositivo fax';
  ENUM_STRING_PROVIDERTYPE_01 = 'Protocolo LAT';
  ENUM_STRING_PROVIDERTYPE_02 = 'Dispositivo modem';
  ENUM_STRING_PROVIDERTYPE_03 = 'Puente de red';
  ENUM_STRING_PROVIDERTYPE_04 = 'Puerto paralelo';
  ENUM_STRING_PROVIDERTYPE_05 = 'Puerto serie RS232';
  ENUM_STRING_PROVIDERTYPE_06 = 'Puerto RS422';
  ENUM_STRING_PROVIDERTYPE_07 = 'Puerto RS423';
  ENUM_STRING_PROVIDERTYPE_08 = 'Puerto RS449';
  ENUM_STRING_PROVIDERTYPE_09 = 'Dispositivo de escaner';
  ENUM_STRING_PROVIDERTYPE_10 = 'TCP/IP TelNet';
  ENUM_STRING_PROVIDERTYPE_11 = 'X.25';
  ENUM_STRING_PROVIDERTYPE_12 = 'Sin especificar';

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

// Constantes para la propiedad StatusInfo
const
  ENUM_STRING_STATUSINFO_00 = 'Otros';
  ENUM_STRING_STATUSINFO_01 = 'Desconocido';
  ENUM_STRING_STATUSINFO_02 = 'Habilitado';
  ENUM_STRING_STATUSINFO_03 = 'Deshabilitado';
  ENUM_STRING_STATUSINFO_04 = 'No aplicable';

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
procedure TSerialPortInfo.ClearProps;
begin
  Self.SerialPortProperties.FAvailability := 0;
  Self.SerialPortProperties.FBinary := False;
  Self.SerialPortProperties.FCapabilitiesCount := 0;
  Self.SerialPortProperties.FCapabilitiesAsString := EmptyStr;
  SetLength(SerialPortProperties.FCapabilities, 0);
  Self.SerialPortProperties.FCapabilityDescriptionsCount := 0;
  Self.SerialPortProperties.FCapabilityDescriptionsAsString := EmptyStr;
  SetLength(SerialPortProperties.FCapabilityDescriptions, 0);
  Self.SerialPortProperties.FCaption := EmptyStr;
  Self.SerialPortProperties.FConfigManagerErrorCode := 0;
  Self.SerialPortProperties.FConfigManagerUserConfig := False;
  Self.SerialPortProperties.FCreationClassName := EmptyStr;
  Self.SerialPortProperties.FDescription := EmptyStr;
  Self.SerialPortProperties.FDeviceID := EmptyStr;
  Self.SerialPortProperties.FErrorCleared := False;
  Self.SerialPortProperties.FErrorDescription := EmptyStr;
  Self.SerialPortProperties.FInstallDate := 0;
  Self.SerialPortProperties.FLastErrorCode := 0;
  Self.SerialPortProperties.FMaxBaudRate := 0;
  Self.SerialPortProperties.FMaximumInputBufferSize := 0;
  Self.SerialPortProperties.FMaximumOutputBufferSize := 0;
  Self.SerialPortProperties.FMaxNumberControlled := 0;
  Self.SerialPortProperties.FName := EmptyStr;
  Self.SerialPortProperties.FOSAutoDiscovered := False;
  Self.SerialPortProperties.FPNPDeviceID := EmptyStr;
  Self.SerialPortProperties.FPowerManagementCapabilitiesCount := 0;
  Self.SerialPortProperties.FPowerManagementCapabilitiesAsString := EmptyStr;
  SetLength(SerialPortProperties.FPowerManagementCapabilities, 0);
  Self.SerialPortProperties.FPowerManagementSupported := False;
  Self.SerialPortProperties.FProtocolSupported := 0;
  Self.SerialPortProperties.FProviderType := EmptyStr;
  Self.SerialPortProperties.FSettableBaudRate := False;
  Self.SerialPortProperties.FSettableDataBits := False;
  Self.SerialPortProperties.FSettableFlowControl := False;
  Self.SerialPortProperties.FSettableParity := False;
  Self.SerialPortProperties.FSettableParityCheck := False;
  Self.SerialPortProperties.FSettableRLSD := False;
  Self.SerialPortProperties.FSettableStopBits := False;
  Self.SerialPortProperties.FStatus := EmptyStr;
  Self.SerialPortProperties.FStatusInfo := 0;
  Self.SerialPortProperties.FSupports16BitMode := False;
  Self.SerialPortProperties.FSupportsDTRDSR := False;
  Self.SerialPortProperties.FSupportsElapsedTimeouts := False;
  Self.SerialPortProperties.FSupportsIntTimeouts := False;
  Self.SerialPortProperties.FSupportsParityCheck := False;
  Self.SerialPortProperties.FSupportsRLSD := False;
  Self.SerialPortProperties.FSupportsRTSCTS := False;
  Self.SerialPortProperties.FSupportsSpecialCharacters := False;
  Self.SerialPortProperties.FSupportsXOnXOff := False;
  Self.SerialPortProperties.FSupportsXOnXOffSet := False;
  Self.SerialPortProperties.FSystemCreationClassName := EmptyStr;
  Self.SerialPortProperties.FSystemName := EmptyStr;
  Self.SerialPortProperties.FTimeOfLastReset := 0;
end;

//: Constructor del componente
constructor TSerialPortInfo.Create(AOwner: TComponent);
begin
  inherited;
  Self.FSerialPortProperties := TSerialPortProperties.Create();
  Self.MSDNHelp := 'https://learn.microsoft.com/es-es/windows/win32/cimwin32prov/win32-serialport';
end;

//: destructor del componente
destructor TSerialPortInfo.Destroy();
begin
  // liberar
  FreeAndNil(Self.FSerialPortProperties);
  inherited;
end;

//: Obtener la clase
function TSerialPortInfo.GetWMIClass(): string;
begin
  Result := 'Win32_SerialPort'
end;

//: Obtener Root
function TSerialPortInfo.GetWMIRoot(): string;
begin
  Result := '';
end;

//: Procedimiento de activacion
procedure TSerialPortInfo.SetActive(const Value: Boolean);
begin
  // metodo heredado
  inherited;
end;

// Acceso a los elementos de la propiedad <Capabilities>
function TSerialPortProperties.GetCapabilities(index: integer):integer;
begin
  if (index >= Self.FCapabilitiesCount) then begin
    Index := Self.FCapabilitiesCount - 1;
  end;
  Result := Self.FCapabilities[index];
end;

// Acceso a los elementos de la propiedad <CapabilityDescriptions>
function TSerialPortProperties.GetCapabilityDescriptions(index: integer):string;
begin
  if (index >= Self.FCapabilityDescriptionsCount) then begin
    Index := Self.FCapabilityDescriptionsCount - 1;
  end;
  Result := Self.FCapabilityDescriptions[index];
end;

// Acceso a los elementos de la propiedad <PowerManagementCapabilities>
function TSerialPortProperties.GetPowerManagementCapabilities(index: integer):integer;
begin
  if (index >= Self.FPowerManagementCapabilitiesCount) then begin
    Index := Self.FPowerManagementCapabilitiesCount - 1;
  end;
  Result := Self.FPowerManagementCapabilities[index];
end;


//: Rellenar las propiedades del componente.
procedure TSerialPortInfo.FillProperties(AIndex: integer);
var
  v:     variant;
  vNull: boolean;
  vp:    TSerialPortProperties;
begin
  // Llamar al heredado (importante)
  inherited;
  // Rellenar propiedades...
  vp := SerialPortProperties;

  GetWMIPropertyValue(Self, 'Availability', v, vNull);
  vp.FAvailability := VariantIntegerValue(v, vNull);

  GetWMIPropertyValue(Self, 'Binary', v, vNull);
  vp.FBinary := VariantBooleanValue(v, vNull);

  GetWMIPropertyValue(Self, 'Capabilities', v, vNull);
  vp.FCapabilitiesAsString := VariantStrValue(v, vNull);
  StringToArrayInteger(vp.FCapabilitiesAsString, vp.FCapabilities);
  vp.FCapabilitiesCount := Length(vp.FCapabilities);

  GetWMIPropertyValue(Self, 'CapabilityDescriptions', v, vNull);
  vp.FCapabilityDescriptionsAsString := VariantStrValue(v, vNull);
  StringToArrayString(vp.FCapabilityDescriptionsAsString, vp.FCapabilityDescriptions);
  vp.FCapabilityDescriptionsCount := Length(vp.FCapabilityDescriptions);

  GetWMIPropertyValue(Self, 'Caption', v, vNull);
  vp.FCaption := VariantStrValue(v, vNull);

  GetWMIPropertyValue(Self, 'ConfigManagerErrorCode', v, vNull);
  vp.FConfigManagerErrorCode := VariantIntegerValue(v, vNull);

  GetWMIPropertyValue(Self, 'ConfigManagerUserConfig', v, vNull);
  vp.FConfigManagerUserConfig := VariantBooleanValue(v, vNull);

  GetWMIPropertyValue(Self, 'CreationClassName', v, vNull);
  vp.FCreationClassName := VariantStrValue(v, vNull);

  GetWMIPropertyValue(Self, 'Description', v, vNull);
  vp.FDescription := VariantStrValue(v, vNull);

  GetWMIPropertyValue(Self, 'DeviceID', v, vNull);
  vp.FDeviceID := VariantStrValue(v, vNull);

  GetWMIPropertyValue(Self, 'ErrorCleared', v, vNull);
  vp.FErrorCleared := VariantBooleanValue(v, vNull);

  GetWMIPropertyValue(Self, 'ErrorDescription', v, vNull);
  vp.FErrorDescription := VariantStrValue(v, vNull);

  GetWMIPropertyValue(Self, 'InstallDate', v, vNull);
  vp.FInstallDate := VariantDateTimeValue(v, vNull);

  GetWMIPropertyValue(Self, 'LastErrorCode', v, vNull);
  vp.FLastErrorCode := VariantIntegerValue(v, vNull);

  GetWMIPropertyValue(Self, 'MaxBaudRate', v, vNull);
  vp.FMaxBaudRate := VariantIntegerValue(v, vNull);

  GetWMIPropertyValue(Self, 'MaximumInputBufferSize', v, vNull);
  vp.FMaximumInputBufferSize := VariantIntegerValue(v, vNull);

  GetWMIPropertyValue(Self, 'MaximumOutputBufferSize', v, vNull);
  vp.FMaximumOutputBufferSize := VariantIntegerValue(v, vNull);

  GetWMIPropertyValue(Self, 'MaxNumberControlled', v, vNull);
  vp.FMaxNumberControlled := VariantIntegerValue(v, vNull);

  GetWMIPropertyValue(Self, 'Name', v, vNull);
  vp.FName := VariantStrValue(v, vNull);

  GetWMIPropertyValue(Self, 'OSAutoDiscovered', v, vNull);
  vp.FOSAutoDiscovered := VariantBooleanValue(v, vNull);

  GetWMIPropertyValue(Self, 'PNPDeviceID', v, vNull);
  vp.FPNPDeviceID := VariantStrValue(v, vNull);

  GetWMIPropertyValue(Self, 'PowerManagementCapabilities', v, vNull);
  vp.FPowerManagementCapabilitiesAsString := VariantStrValue(v, vNull);
  StringToArrayInteger(vp.FPowerManagementCapabilitiesAsString, vp.FPowerManagementCapabilities);
  vp.FPowerManagementCapabilitiesCount := Length(vp.FPowerManagementCapabilities);

  GetWMIPropertyValue(Self, 'PowerManagementSupported', v, vNull);
  vp.FPowerManagementSupported := VariantBooleanValue(v, vNull);

  GetWMIPropertyValue(Self, 'ProtocolSupported', v, vNull);
  vp.FProtocolSupported := VariantIntegerValue(v, vNull);

  GetWMIPropertyValue(Self, 'ProviderType', v, vNull);
  vp.FProviderType := VariantStrValue(v, vNull);

  GetWMIPropertyValue(Self, 'SettableBaudRate', v, vNull);
  vp.FSettableBaudRate := VariantBooleanValue(v, vNull);

  GetWMIPropertyValue(Self, 'SettableDataBits', v, vNull);
  vp.FSettableDataBits := VariantBooleanValue(v, vNull);

  GetWMIPropertyValue(Self, 'SettableFlowControl', v, vNull);
  vp.FSettableFlowControl := VariantBooleanValue(v, vNull);

  GetWMIPropertyValue(Self, 'SettableParity', v, vNull);
  vp.FSettableParity := VariantBooleanValue(v, vNull);

  GetWMIPropertyValue(Self, 'SettableParityCheck', v, vNull);
  vp.FSettableParityCheck := VariantBooleanValue(v, vNull);

  GetWMIPropertyValue(Self, 'SettableRLSD', v, vNull);
  vp.FSettableRLSD := VariantBooleanValue(v, vNull);

  GetWMIPropertyValue(Self, 'SettableStopBits', v, vNull);
  vp.FSettableStopBits := VariantBooleanValue(v, vNull);

  GetWMIPropertyValue(Self, 'Status', v, vNull);
  vp.FStatus := VariantStrValue(v, vNull);

  GetWMIPropertyValue(Self, 'StatusInfo', v, vNull);
  vp.FStatusInfo := VariantIntegerValue(v, vNull);

  GetWMIPropertyValue(Self, 'Supports16BitMode', v, vNull);
  vp.FSupports16BitMode := VariantBooleanValue(v, vNull);

  GetWMIPropertyValue(Self, 'SupportsDTRDSR', v, vNull);
  vp.FSupportsDTRDSR := VariantBooleanValue(v, vNull);

  GetWMIPropertyValue(Self, 'SupportsElapsedTimeouts', v, vNull);
  vp.FSupportsElapsedTimeouts := VariantBooleanValue(v, vNull);

  GetWMIPropertyValue(Self, 'SupportsIntTimeouts', v, vNull);
  vp.FSupportsIntTimeouts := VariantBooleanValue(v, vNull);

  GetWMIPropertyValue(Self, 'SupportsParityCheck', v, vNull);
  vp.FSupportsParityCheck := VariantBooleanValue(v, vNull);

  GetWMIPropertyValue(Self, 'SupportsRLSD', v, vNull);
  vp.FSupportsRLSD := VariantBooleanValue(v, vNull);

  GetWMIPropertyValue(Self, 'SupportsRTSCTS', v, vNull);
  vp.FSupportsRTSCTS := VariantBooleanValue(v, vNull);

  GetWMIPropertyValue(Self, 'SupportsSpecialCharacters', v, vNull);
  vp.FSupportsSpecialCharacters := VariantBooleanValue(v, vNull);

  GetWMIPropertyValue(Self, 'SupportsXOnXOff', v, vNull);
  vp.FSupportsXOnXOff := VariantBooleanValue(v, vNull);

  GetWMIPropertyValue(Self, 'SupportsXOnXOffSet', v, vNull);
  vp.FSupportsXOnXOffSet := VariantBooleanValue(v, vNull);

  GetWMIPropertyValue(Self, 'SystemCreationClassName', v, vNull);
  vp.FSystemCreationClassName := VariantStrValue(v, vNull);

  GetWMIPropertyValue(Self, 'SystemName', v, vNull);
  vp.FSystemName := VariantStrValue(v, vNull);

  GetWMIPropertyValue(Self, 'TimeOfLastReset', v, vNull);
  vp.FTimeOfLastReset := VariantDateTimeValue(v, vNull);
end;


// Obtener la propiedad como string
function TSerialPortProperties.GetAllAvailabilityAsString(index:integer):string;
begin
  case index of
    00: Result := ENUM_STRING_AVAILABILITY_00;
    01: Result := ENUM_STRING_AVAILABILITY_01;
    02: Result := ENUM_STRING_AVAILABILITY_02;
    03: Result := ENUM_STRING_AVAILABILITY_03;
    04: Result := ENUM_STRING_AVAILABILITY_04;
    05: Result := ENUM_STRING_AVAILABILITY_05;
    06: Result := ENUM_STRING_AVAILABILITY_06;
    07: Result := ENUM_STRING_AVAILABILITY_07;
    08: Result := ENUM_STRING_AVAILABILITY_08;
    09: Result := ENUM_STRING_AVAILABILITY_09;
    10: Result := ENUM_STRING_AVAILABILITY_10;
    11: Result := ENUM_STRING_AVAILABILITY_11;
    12: Result := ENUM_STRING_AVAILABILITY_12;
    13: Result := ENUM_STRING_AVAILABILITY_13;
    14: Result := ENUM_STRING_AVAILABILITY_14;
    15: Result := ENUM_STRING_AVAILABILITY_15;
    16: Result := ENUM_STRING_AVAILABILITY_16;
    17: Result := ENUM_STRING_AVAILABILITY_17;
    18: Result := ENUM_STRING_AVAILABILITY_18;
    19: Result := ENUM_STRING_AVAILABILITY_19;
    20: Result := ENUM_STRING_AVAILABILITY_20;
  else
    Result := STR_EMPTY;
  end;
end;

// Obtener la propiedad como string
function TSerialPortProperties.GetAllCapabilitiesAsString(index:integer):string;
begin
  case index of
    00: Result := ENUM_STRING_CAPABILITIES_00;
    01: Result := ENUM_STRING_CAPABILITIES_01;
    02: Result := ENUM_STRING_CAPABILITIES_02;
    03: Result := ENUM_STRING_CAPABILITIES_03;
    04: Result := ENUM_STRING_CAPABILITIES_04;
    05: Result := ENUM_STRING_CAPABILITIES_05;
    06: Result := ENUM_STRING_CAPABILITIES_06;
    07: Result := ENUM_STRING_CAPABILITIES_07;
  else
    Result := STR_EMPTY;
  end;
end;

// Obtener la propiedad como string
function TSerialPortProperties.GetAllConfigManagerErrorCodeAsString(index:integer):string;
begin
  case index of
    00: Result := ENUM_STRING_CONFIGMANAGERERRORCODE_00;
    01: Result := ENUM_STRING_CONFIGMANAGERERRORCODE_01;
    02: Result := ENUM_STRING_CONFIGMANAGERERRORCODE_02;
    03: Result := ENUM_STRING_CONFIGMANAGERERRORCODE_03;
    04: Result := ENUM_STRING_CONFIGMANAGERERRORCODE_04;
    05: Result := ENUM_STRING_CONFIGMANAGERERRORCODE_05;
    06: Result := ENUM_STRING_CONFIGMANAGERERRORCODE_06;
    07: Result := ENUM_STRING_CONFIGMANAGERERRORCODE_07;
    08: Result := ENUM_STRING_CONFIGMANAGERERRORCODE_08;
    09: Result := ENUM_STRING_CONFIGMANAGERERRORCODE_09;
    10: Result := ENUM_STRING_CONFIGMANAGERERRORCODE_10;
    11: Result := ENUM_STRING_CONFIGMANAGERERRORCODE_11;
    12: Result := ENUM_STRING_CONFIGMANAGERERRORCODE_12;
    13: Result := ENUM_STRING_CONFIGMANAGERERRORCODE_13;
    14: Result := ENUM_STRING_CONFIGMANAGERERRORCODE_14;
    15: Result := ENUM_STRING_CONFIGMANAGERERRORCODE_15;
    16: Result := ENUM_STRING_CONFIGMANAGERERRORCODE_16;
    17: Result := ENUM_STRING_CONFIGMANAGERERRORCODE_17;
    18: Result := ENUM_STRING_CONFIGMANAGERERRORCODE_18;
    19: Result := ENUM_STRING_CONFIGMANAGERERRORCODE_19;
    20: Result := ENUM_STRING_CONFIGMANAGERERRORCODE_20;
    21: Result := ENUM_STRING_CONFIGMANAGERERRORCODE_21;
    22: Result := ENUM_STRING_CONFIGMANAGERERRORCODE_22;
    23: Result := ENUM_STRING_CONFIGMANAGERERRORCODE_23;
    24: Result := ENUM_STRING_CONFIGMANAGERERRORCODE_24;
    25: Result := ENUM_STRING_CONFIGMANAGERERRORCODE_25;
    26: Result := ENUM_STRING_CONFIGMANAGERERRORCODE_26;
    27: Result := ENUM_STRING_CONFIGMANAGERERRORCODE_27;
    28: Result := ENUM_STRING_CONFIGMANAGERERRORCODE_28;
    29: Result := ENUM_STRING_CONFIGMANAGERERRORCODE_29;
    30: Result := ENUM_STRING_CONFIGMANAGERERRORCODE_30;
    31: Result := ENUM_STRING_CONFIGMANAGERERRORCODE_31;
  else
    Result := STR_EMPTY;
  end;
end;

// Obtener la propiedad como string
function TSerialPortProperties.GetAllPowerManagementCapabilitiesAsString(index:integer):string;
begin
  case index of
    00: Result := ENUM_STRING_POWERMANAGEMENTCAPABILITIES_00;
    01: Result := ENUM_STRING_POWERMANAGEMENTCAPABILITIES_01;
    02: Result := ENUM_STRING_POWERMANAGEMENTCAPABILITIES_02;
    03: Result := ENUM_STRING_POWERMANAGEMENTCAPABILITIES_03;
    04: Result := ENUM_STRING_POWERMANAGEMENTCAPABILITIES_04;
    05: Result := ENUM_STRING_POWERMANAGEMENTCAPABILITIES_05;
    06: Result := ENUM_STRING_POWERMANAGEMENTCAPABILITIES_06;
    07: Result := ENUM_STRING_POWERMANAGEMENTCAPABILITIES_07;
  else
    Result := STR_EMPTY;
  end;
end;

// Obtener la propiedad como string
function TSerialPortProperties.GetAllProtocolSupportedAsString(index:integer):string;
begin
  case index of
    00: Result := ENUM_STRING_PROTOCOLSUPPORTED_00;
    01: Result := ENUM_STRING_PROTOCOLSUPPORTED_01;
    02: Result := ENUM_STRING_PROTOCOLSUPPORTED_02;
    03: Result := ENUM_STRING_PROTOCOLSUPPORTED_03;
    04: Result := ENUM_STRING_PROTOCOLSUPPORTED_04;
    05: Result := ENUM_STRING_PROTOCOLSUPPORTED_05;
    06: Result := ENUM_STRING_PROTOCOLSUPPORTED_06;
    07: Result := ENUM_STRING_PROTOCOLSUPPORTED_07;
    08: Result := ENUM_STRING_PROTOCOLSUPPORTED_08;
    09: Result := ENUM_STRING_PROTOCOLSUPPORTED_09;
    10: Result := ENUM_STRING_PROTOCOLSUPPORTED_10;
    11: Result := ENUM_STRING_PROTOCOLSUPPORTED_11;
    12: Result := ENUM_STRING_PROTOCOLSUPPORTED_12;
    13: Result := ENUM_STRING_PROTOCOLSUPPORTED_13;
    14: Result := ENUM_STRING_PROTOCOLSUPPORTED_14;
    15: Result := ENUM_STRING_PROTOCOLSUPPORTED_15;
    16: Result := ENUM_STRING_PROTOCOLSUPPORTED_16;
    17: Result := ENUM_STRING_PROTOCOLSUPPORTED_17;
    18: Result := ENUM_STRING_PROTOCOLSUPPORTED_18;
    19: Result := ENUM_STRING_PROTOCOLSUPPORTED_19;
    20: Result := ENUM_STRING_PROTOCOLSUPPORTED_20;
    21: Result := ENUM_STRING_PROTOCOLSUPPORTED_21;
    22: Result := ENUM_STRING_PROTOCOLSUPPORTED_22;
    23: Result := ENUM_STRING_PROTOCOLSUPPORTED_23;
    24: Result := ENUM_STRING_PROTOCOLSUPPORTED_24;
    25: Result := ENUM_STRING_PROTOCOLSUPPORTED_25;
    26: Result := ENUM_STRING_PROTOCOLSUPPORTED_26;
    27: Result := ENUM_STRING_PROTOCOLSUPPORTED_27;
    28: Result := ENUM_STRING_PROTOCOLSUPPORTED_28;
    29: Result := ENUM_STRING_PROTOCOLSUPPORTED_29;
    30: Result := ENUM_STRING_PROTOCOLSUPPORTED_30;
    31: Result := ENUM_STRING_PROTOCOLSUPPORTED_31;
    32: Result := ENUM_STRING_PROTOCOLSUPPORTED_32;
    33: Result := ENUM_STRING_PROTOCOLSUPPORTED_33;
    34: Result := ENUM_STRING_PROTOCOLSUPPORTED_34;
    35: Result := ENUM_STRING_PROTOCOLSUPPORTED_35;
    36: Result := ENUM_STRING_PROTOCOLSUPPORTED_36;
    37: Result := ENUM_STRING_PROTOCOLSUPPORTED_37;
    38: Result := ENUM_STRING_PROTOCOLSUPPORTED_38;
    39: Result := ENUM_STRING_PROTOCOLSUPPORTED_39;
    40: Result := ENUM_STRING_PROTOCOLSUPPORTED_40;
    41: Result := ENUM_STRING_PROTOCOLSUPPORTED_41;
    42: Result := ENUM_STRING_PROTOCOLSUPPORTED_42;
    43: Result := ENUM_STRING_PROTOCOLSUPPORTED_43;
    44: Result := ENUM_STRING_PROTOCOLSUPPORTED_44;
    45: Result := ENUM_STRING_PROTOCOLSUPPORTED_45;
    46: Result := ENUM_STRING_PROTOCOLSUPPORTED_46;
  else
    Result := STR_EMPTY;
  end;
end;

// Obtener la propiedad como string
function TSerialPortProperties.GetAllProviderTypeAsString(index:integer):string;
begin
  case index of
    00: Result := ENUM_STRING_PROVIDERTYPE_00;
    01: Result := ENUM_STRING_PROVIDERTYPE_01;
    02: Result := ENUM_STRING_PROVIDERTYPE_02;
    03: Result := ENUM_STRING_PROVIDERTYPE_03;
    04: Result := ENUM_STRING_PROVIDERTYPE_04;
    05: Result := ENUM_STRING_PROVIDERTYPE_05;
    06: Result := ENUM_STRING_PROVIDERTYPE_06;
    07: Result := ENUM_STRING_PROVIDERTYPE_07;
    08: Result := ENUM_STRING_PROVIDERTYPE_08;
    09: Result := ENUM_STRING_PROVIDERTYPE_09;
    10: Result := ENUM_STRING_PROVIDERTYPE_10;
    11: Result := ENUM_STRING_PROVIDERTYPE_11;
    12: Result := ENUM_STRING_PROVIDERTYPE_12;
  else
    Result := STR_EMPTY;
  end;
end;

// Obtener la propiedad como string
function TSerialPortProperties.GetAllStatusAsString(index:integer):string;
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

// Obtener la propiedad como string
function TSerialPortProperties.GetAllStatusInfoAsString(index:integer):string;
begin
  case index of
    00: Result := ENUM_STRING_STATUSINFO_00;
    01: Result := ENUM_STRING_STATUSINFO_01;
    02: Result := ENUM_STRING_STATUSINFO_02;
    03: Result := ENUM_STRING_STATUSINFO_03;
    04: Result := ENUM_STRING_STATUSINFO_04;
  else
    Result := STR_EMPTY;
  end;
end;


// Obtener n. de elementos de la propiedad como string
function TSerialPortProperties.GetAllAvailabilityCount:integer;
begin
  Result := 21
end;

// Obtener n. de elementos de la propiedad como string
function TSerialPortProperties.GetAllCapabilitiesCount:integer;
begin
  Result := 8
end;

// Obtener n. de elementos de la propiedad como string
function TSerialPortProperties.GetAllConfigManagerErrorCodeCount:integer;
begin
  Result := 32
end;

// Obtener n. de elementos de la propiedad como string
function TSerialPortProperties.GetAllPowerManagementCapabilitiesCount:integer;
begin
  Result := 8
end;

// Obtener n. de elementos de la propiedad como string
function TSerialPortProperties.GetAllProtocolSupportedCount:integer;
begin
  Result := 47
end;

// Obtener n. de elementos de la propiedad como string
function TSerialPortProperties.GetAllProviderTypeCount:integer;
begin
  Result := 13
end;

// Obtener n. de elementos de la propiedad como string
function TSerialPortProperties.GetAllStatusCount:integer;
begin
  Result := 12
end;

// Obtener n. de elementos de la propiedad como string
function TSerialPortProperties.GetAllStatusInfoCount:integer;
begin
  Result := 5
end;


end.
