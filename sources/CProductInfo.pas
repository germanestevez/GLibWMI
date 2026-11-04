{
TProductInfo Component Version 3.4 - Suite GLibWMI
Copyright (©) 2024,  by Germán Estévez (Neftalí)

Las instancias de esta clase representan productos instalados por MSI. Por lo general, un producto suele 
estar correlacionado con un solo paquete de instalación.


Utilización/Usage:
(ES) Basta con "soltar" el componente y activarlo.
(EN) Place the component in the form and active it.

MSDN Info:
https://docs.microsoft.com/en-us/windows/win32/cimwin32prov/win32-product

=========================================================================
IMPORTANTE PROGRAMADORES: Por favor, si tienes comentarios, mejoras, ampliaciones,
errores y/o cualquier otro tipo de sugerencia envíame un mail a:
german_ral@hotmail.com

IMPORTANT PROGRAMMERS: please, if you have comments, improvements, enlargements,
errors and/or any another type of suggestion send a mail to:
german_ral@hotmail.com
=========================================================================

@author Germán Estévez (Neftalí)
@web    http://neftali.clubDelphi.com
@cat    Package GLibWMI
}
unit CProductInfo;

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
  TProductProperties = class(TPersistent)
  private
    {%PrivateClassVars PropertiesClass%}
    FAssignmentType:integer;
    FCaption:string;
    FDescription:string;
    FHelpLink:string;
    FHelpTelephone:string;
    FIdentifyingNumber:string;
    FInstallDate:string;
    FInstallDate2:TDatetime;
    FInstallLocation:string;
    FInstallSource:string;
    FInstallState:integer;
    FLanguage:string;
    FLocalPackage:string;
    FName:string;
    FPackageCache:string;
    FPackageCode:string;
    FPackageName:string;
    FProductID:string;
    FRegCompany:string;
    FRegOwner:string;
    FSKUNumber:string;
    FTransforms:string;
    FURLInfoAbout:string;
    FURLUpdateInfo:string;
    FVendor:string;
    FVersion:string;
    FWordCount:integer;

  private
    {%PrivateGetMethods PropertiesClass%}

  public
    {%PublicGetMethods PropertiesClass%}
    // Obtener la propiedad <AssignmentType> como string
    function GetAllAssignmentTypeAsString(index:integer):string;
    // Obtener el número de elementos disponibles de la propiedad <AssignmentType>
    function GetAllAssignmentTypeCount:integer;
    // Obtener la propiedad <InstallState> como string
    function GetAllInstallStateAsString(index:integer):string;
    // Obtener el número de elementos disponibles de la propiedad <InstallState>
    function GetAllInstallStateCount:integer;

    {%PublicArrayMethods PropertiesClass%}

  published
    {%PublishedProperties PropertiesClass%}
    /// <summary>
    ///  Tipo de asignación del producto. Ver las constantes ENUM_STRING_ASSIGNMENTTYPE. No disponible en Windows Server 2003.
    /// </summary>
    property AssignmentType:integer read FAssignmentType write FAssignmentType stored False;
    /// <summary>
    ///  Descripción breve del producto en una sola línea.
    /// </summary>
    property Caption:string read FCaption write FCaption stored False;
    /// <summary>
    ///  Descripción del producto.
    /// </summary>
    property Description:string read FDescription write FDescription stored False;
    /// <summary>
    ///  Dirección URL de la información de ayuda del producto.
    /// </summary>
    property HelpLink:string read FHelpLink write FHelpLink stored False;
    /// <summary>
    ///  Número de teléfono de ayuda del producto.
    /// </summary>
    property HelpTelephone:string read FHelpTelephone write FHelpTelephone stored False;
    /// <summary>
    ///  Identificación del producto, como el número de serie en software, una fecha de anulación en un chip de 
    ///  hardware o un número de proyecto (para productos no comerciales).
    /// </summary>
    property IdentifyingNumber:string read FIdentifyingNumber write FIdentifyingNumber stored False;
    /// <summary>
    ///  Fecha de instalación en formato de cadena. Propiedad obsoleta: use InstallDate2.
    /// </summary>
    property InstallDate:string read FInstallDate write FInstallDate stored False;
    /// <summary>
    ///  Fecha de instalación del producto.
    /// </summary>
    property InstallDate2:TDatetime read FInstallDate2 write FInstallDate2 stored False;
    /// <summary>
    ///  Ubicación del producto instalado.
    /// </summary>
    property InstallLocation:string read FInstallLocation write FInstallLocation stored False;
    /// <summary>
    ///  Directorio de origen desde el que se instaló el producto.
    /// </summary>
    property InstallSource:string read FInstallSource write FInstallSource stored False;
    /// <summary>
    ///  Estado de instalación del producto. Ver las constantes ENUM_STRING_INSTALLSTATE. Valores: -6 Configuración incorrecta,
    ///  -2 Argumento no válido, -1 Paquete desconocido, 1 Anunciado, 2 Ausente, 5 Instalado.
    /// </summary>
    property InstallState:integer read FInstallState write FInstallState stored False;
    /// <summary>
    ///  Idioma del producto. Lista de identificadores de idioma separados por comas.
    /// </summary>
    property Language:string read FLanguage write FLanguage stored False;
    /// <summary>
    ///  Ruta del paquete de instalación almacenado en el equipo local.
    /// </summary>
    property LocalPackage:string read FLocalPackage write FLocalPackage stored False;
    /// <summary>
    ///  Nombre del producto.
    /// </summary>
    property Name:string read FName write FName stored False;
    /// <summary>
    ///  Ruta de la caché de paquetes donde se almacena el paquete de instalación.
    /// </summary>
    property PackageCache:string read FPackageCache write FPackageCache stored False;
    /// <summary>
    ///  Identificador GUID del paquete de instalación (PackageCode).
    /// </summary>
    property PackageCode:string read FPackageCode write FPackageCode stored False;
    /// <summary>
    ///  Nombre del paquete de instalación.
    /// </summary>
    property PackageName:string read FPackageName write FPackageName stored False;
    /// <summary>
    ///  Identificador del producto asignado por el proveedor.
    /// </summary>
    property ProductID:string read FProductID write FProductID stored False;
    /// <summary>
    ///  Empresa a la que está registrado el producto.
    /// </summary>
    property RegCompany:string read FRegCompany write FRegCompany stored False;
    /// <summary>
    ///  Propietario registrado del producto.
    /// </summary>
    property RegOwner:string read FRegOwner write FRegOwner stored False;
    /// <summary>
    ///  Número de referencia comercial (SKU) del producto.
    /// </summary>
    property SKUNumber:string read FSKUNumber write FSKUNumber stored False;
    /// <summary>
    ///  Transformaciones (archivos .mst) aplicadas a la instalación del producto.
    /// </summary>
    property Transforms:string read FTransforms write FTransforms stored False;
    /// <summary>
    ///  URL con información adicional sobre el producto.
    /// </summary>
    property URLInfoAbout:string read FURLInfoAbout write FURLInfoAbout stored False;
    /// <summary>
    ///  URL con información de actualizaciones del producto.
    /// </summary>
    property URLUpdateInfo:string read FURLUpdateInfo write FURLUpdateInfo stored False;
    /// <summary>
    ///  Nombre del proveedor del producto o entidad expendedora del producto (el fabricante, distribuidor, OEM, 
    ///  etc). Se corresponde con la propiedad Vendor en el objeto del producto en el estándar de intercambio 
    ///  de soluciones DMTF.
    /// </summary>
    property Vendor:string read FVendor write FVendor stored False;
    /// <summary>
    ///  Información de versión del producto. Corresponde a la propiedad Version del objeto Product en el estándar 
    ///  de intercambio de soluciones DMTF.
    /// </summary>
    property Version:string read FVersion write FVersion stored False;
    /// <summary>
    ///  Recuento de palabras del paquete de instalación.
    /// </summary>
    property WordCount:integer read FWordCount write FWordCount stored False;
  end;

  {%InterfaceClass WMIClass%}
  /// <summary>
  ///  Las instancias de esta clase representan productos instalados por MSI. Por lo general, un producto suele 
  ///  estar correlacionado con un solo paquete de instalación.
  /// </summary>
  TProductInfo = class(TWMIBase)
  private
    FProductProperties: TProductProperties;
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

    {%InterfaceClassErrorcontrol WMIClass%}
    // Obtener <ErrorControl=Resultado> como string (0=Correcto)
    function GetErrorControlAsString(FErrorControl:integer):string; 

    {%InterfacePublicMethods WMIClass%}
    /// <summary>
    ///  Este método instalará un Win32_Product asociado usando el paquete de instalación proporcionado con PackageLocation 
    ///  y todas los opciones de línea de comandos que se proporcionan. El método puede devolver los siguientes 
    ///  valores:
    ///  0 - Correcto.
    ///  2147549445 - Error de servidor RPC. 
    ///  Otros - Para obtener información sobre otros 
    ///  valores enteros distintos de los que se muestran en la lista anterior, consulte la documentación de códigos 
    ///  de error devueltos por el API de Windows Installer y los códigos de error de Win32.
    /// </summary>
    function Install(AInstanceProp:string; AInstanceValue:Variant;
      aAllUsers:boolean;
      aOptions:string;
      aPackageLocation:string):integer;
    /// <summary>
    ///  Este método volverá a instalar una instancia asociada de Win32_Product usando el modo de reinstalación 
    ///  especificado. El método puede devolver los siguientes valores:
    ///  0 - Correcto.
    ///  2147549445 - Error de servidor RPC.
    ///  Otros - Para obtener información sobre otros valores enteros distintos de los que se muestran en 
    ///  la lista anterior, consulte la documentación de códigos de error devueltos por el API de Windows Installer 
    ///  y los códigos de error de Win32.
    /// </summary>
    function Reinstall(AInstanceProp:string; AInstanceValue:Variant;
      aReinstallMode:integer):integer;
    /// <summary>
    ///  Este método actualizará un Win32_Product asociado usando el paquete de instalación proporcionado con 
    ///  PackageLocation y todas los opciones de línea de comandos que se proporcionan. El método puede devolver 
    ///  los siguientes valores:
    ///  0 - Correcto.
    ///  2147549445 - Error de servidor RPC. 
    ///  Otros - Para obtener información 
    ///  sobre otros valores enteros distintos de los que se muestran en la lista anterior, consulte la documentación 
    ///  de códigos de error devueltos por el API de Windows Installer y los códigos de error de Win32.
    /// </summary>
    function Upgrade(AInstanceProp:string; AInstanceValue:Variant;
      aOptions:string;
      aPackageLocation:string):integer;
    /// <summary>
    ///  Este método desinstalará la instancia asociada de Win32_Product. El método puede devolver los siguientes 
    ///  valores:
    ///  0 - Correcto.
    ///  2147549445 - Error de servidor RPC. 
    ///  Otros - Para obtener información sobre otros 
    ///  valores enteros distintos de los que se muestran en la lista anterior, consulte la documentación de códigos 
    ///  de error devueltos por el API de Windows Installer y los códigos de error de Win32.
    /// </summary>
    function Uninstall(AInstanceProp:string; AInstanceValue:Variant):integer;
  published
    {%InterfacePublishedPart WMIClass%}
    // propiedades de la Product
    property ProductProperties:TProductProperties read   FProductProperties write FProductProperties;
  end;


// Constantes para la propiedad AssignmentType
const 
  ENUM_STRING_ASSIGNMENTTYPE_00 = 'Por usuario';
  ENUM_STRING_ASSIGNMENTTYPE_01 = 'Por equipo';

// Constantes para la propiedad InstallState
const 
  ENUM_STRING_INSTALLSTATE_00 = 'Configuración incorrecta';
  ENUM_STRING_INSTALLSTATE_01 = 'Argumento no válido';
  ENUM_STRING_INSTALLSTATE_02 = 'Paquete desconocido';
  ENUM_STRING_INSTALLSTATE_03 = 'Anunciado';
  ENUM_STRING_INSTALLSTATE_04 = 'Ausente';
  ENUM_STRING_INSTALLSTATE_05 = 'Instalado';

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
procedure TProductInfo.ClearProps;
begin
  Self.ProductProperties.FAssignmentType := 0;
  Self.ProductProperties.FCaption := EmptyStr;
  Self.ProductProperties.FDescription := EmptyStr;
  Self.ProductProperties.FHelpLink := EmptyStr;
  Self.ProductProperties.FHelpTelephone := EmptyStr;
  Self.ProductProperties.FIdentifyingNumber := EmptyStr;
  Self.ProductProperties.FInstallDate := EmptyStr;
  Self.ProductProperties.FInstallDate2 := 0;
  Self.ProductProperties.FInstallLocation := EmptyStr;
  Self.ProductProperties.FInstallSource := EmptyStr;
  Self.ProductProperties.FInstallState := 0;
  Self.ProductProperties.FLanguage := EmptyStr;
  Self.ProductProperties.FLocalPackage := EmptyStr;
  Self.ProductProperties.FName := EmptyStr;
  Self.ProductProperties.FPackageCache := EmptyStr;
  Self.ProductProperties.FPackageCode := EmptyStr;
  Self.ProductProperties.FPackageName := EmptyStr;
  Self.ProductProperties.FProductID := EmptyStr;
  Self.ProductProperties.FRegCompany := EmptyStr;
  Self.ProductProperties.FRegOwner := EmptyStr;
  Self.ProductProperties.FSKUNumber := EmptyStr;
  Self.ProductProperties.FTransforms := EmptyStr;
  Self.ProductProperties.FURLInfoAbout := EmptyStr;
  Self.ProductProperties.FURLUpdateInfo := EmptyStr;
  Self.ProductProperties.FVendor := EmptyStr;
  Self.ProductProperties.FVersion := EmptyStr;
  Self.ProductProperties.FWordCount := 0;
end;

//: Constructor del componente
constructor TProductInfo.Create(AOwner: TComponent);
begin
  inherited;
  Self.FProductProperties := TProductProperties.Create();
  Self.MSDNHelp := 'https://docs.microsoft.com/en-us/windows/win32/cimwin32prov/win32-product';
end;

//: destructor del componente
destructor TProductInfo.Destroy();
begin
  // liberar
  FreeAndNil(Self.FProductProperties);
  inherited;
end;

//: Obtener la clase
function TProductInfo.GetWMIClass(): string;
begin
  Result := 'Win32_Product'
end;

//: Obtener Root
function TProductInfo.GetWMIRoot(): string;
begin
  Result := '';
end;

//: Procedmiento de activación
procedure TProductInfo.SetActive(const Value: Boolean);
begin
  // método heredado
  inherited;
end;


//: Rellenar las propiedades del componente.
procedure TProductInfo.FillProperties(AIndex: integer);
var
  v:     variant;
  vNull: boolean;
  vp:    TProductProperties;
begin
  // Llamar al heredado (importante)
  inherited;
  // Rellenar propiedades...
  vp := ProductProperties;

  GetWMIPropertyValue(Self, 'AssignmentType', v, vNull);
  vp.FAssignmentType := VariantIntegerValue(v, vNull);

  GetWMIPropertyValue(Self, 'Caption', v, vNull);
  vp.FCaption := VariantStrValue(v, vNull);

  GetWMIPropertyValue(Self, 'Description', v, vNull);
  vp.FDescription := VariantStrValue(v, vNull);

  GetWMIPropertyValue(Self, 'HelpLink', v, vNull);
  vp.FHelpLink := VariantStrValue(v, vNull);

  GetWMIPropertyValue(Self, 'HelpTelephone', v, vNull);
  vp.FHelpTelephone := VariantStrValue(v, vNull);

  GetWMIPropertyValue(Self, 'IdentifyingNumber', v, vNull);
  vp.FIdentifyingNumber := VariantStrValue(v, vNull);

  GetWMIPropertyValue(Self, 'InstallDate', v, vNull);
  vp.FInstallDate := VariantStrValue(v, vNull);

  GetWMIPropertyValue(Self, 'InstallDate2', v, vNull);
  vp.FInstallDate2 := VariantDateTimeValue(v, vNull);

  GetWMIPropertyValue(Self, 'InstallLocation', v, vNull);
  vp.FInstallLocation := VariantStrValue(v, vNull);

  GetWMIPropertyValue(Self, 'InstallSource', v, vNull);
  vp.FInstallSource := VariantStrValue(v, vNull);

  GetWMIPropertyValue(Self, 'InstallState', v, vNull);
  vp.FInstallState := VariantIntegerValue(v, vNull);

  GetWMIPropertyValue(Self, 'Language', v, vNull);
  vp.FLanguage := VariantStrValue(v, vNull);

  GetWMIPropertyValue(Self, 'LocalPackage', v, vNull);
  vp.FLocalPackage := VariantStrValue(v, vNull);

  GetWMIPropertyValue(Self, 'Name', v, vNull);
  vp.FName := VariantStrValue(v, vNull);

  GetWMIPropertyValue(Self, 'PackageCache', v, vNull);
  vp.FPackageCache := VariantStrValue(v, vNull);

  GetWMIPropertyValue(Self, 'PackageCode', v, vNull);
  vp.FPackageCode := VariantStrValue(v, vNull);

  GetWMIPropertyValue(Self, 'PackageName', v, vNull);
  vp.FPackageName := VariantStrValue(v, vNull);

  GetWMIPropertyValue(Self, 'ProductID', v, vNull);
  vp.FProductID := VariantStrValue(v, vNull);

  GetWMIPropertyValue(Self, 'RegCompany', v, vNull);
  vp.FRegCompany := VariantStrValue(v, vNull);

  GetWMIPropertyValue(Self, 'RegOwner', v, vNull);
  vp.FRegOwner := VariantStrValue(v, vNull);

  GetWMIPropertyValue(Self, 'SKUNumber', v, vNull);
  vp.FSKUNumber := VariantStrValue(v, vNull);

  GetWMIPropertyValue(Self, 'Transforms', v, vNull);
  vp.FTransforms := VariantStrValue(v, vNull);

  GetWMIPropertyValue(Self, 'URLInfoAbout', v, vNull);
  vp.FURLInfoAbout := VariantStrValue(v, vNull);

  GetWMIPropertyValue(Self, 'URLUpdateInfo', v, vNull);
  vp.FURLUpdateInfo := VariantStrValue(v, vNull);

  GetWMIPropertyValue(Self, 'Vendor', v, vNull);
  vp.FVendor := VariantStrValue(v, vNull);

  GetWMIPropertyValue(Self, 'Version', v, vNull);
  vp.FVersion := VariantStrValue(v, vNull);

  GetWMIPropertyValue(Self, 'WordCount', v, vNull);
  vp.FWordCount := VariantIntegerValue(v, vNull);
end;


// Obtener la propiedad como string
function TProductProperties.GetAllAssignmentTypeAsString(index:integer):string;
begin
  case index of
    00: Result := ENUM_STRING_ASSIGNMENTTYPE_00;
    01: Result := ENUM_STRING_ASSIGNMENTTYPE_01;
  else
    Result := STR_EMPTY;
  end;
end;

// Obtener la propiedad como string
function TProductProperties.GetAllInstallStateAsString(index:integer):string;
begin
  case index of
    00: Result := ENUM_STRING_INSTALLSTATE_00;
    01: Result := ENUM_STRING_INSTALLSTATE_01;
    02: Result := ENUM_STRING_INSTALLSTATE_02;
    03: Result := ENUM_STRING_INSTALLSTATE_03;
    04: Result := ENUM_STRING_INSTALLSTATE_04;
    05: Result := ENUM_STRING_INSTALLSTATE_05;
  else
    Result := STR_EMPTY;
  end;
end;


// Obtener núm. de elementos de la propiedad como string
function TProductProperties.GetAllAssignmentTypeCount:integer;
begin
  Result := 2
end;

// Obtener núm. de elementos de la propiedad como string
function TProductProperties.GetAllInstallStateCount:integer;
begin
  Result := 6
end;

// Obtiene el resultado de ejecutar un método como string 
function TProductInfo.GetErrorControlAsString(FErrorControl:integer): string; 
begin
   case FErrorControl of
     0: Result := 'Correcto';
     Integer($80010105): Result := 'Error del servidor RPC';
     else
      Result := 'Otros';
    end;
end;

function TProductInfo.Install(AInstanceProp:string; AInstanceValue:Variant;
      aAllUsers:boolean;
      aOptions:string;
      aPackageLocation:string):integer;
var
  arr:TArrVariant;
  v:variant;
begin
  SetLength(arr, 3);
  arr[0] := aAllUsers;
  arr[1] := aOptions;
  arr[2] := aPackageLocation;
  // Ejecutar el proceso
  ExecuteClassMethod(Self, AInstanceProp, AInstanceValue,
    'Install',
    ['AllUsers', 'Options', 'PackageLocation'],
    arr,
    [ptIn, ptIn, ptIn],
    [wbemCIMTypeBoolean, wbemCIMTypeString, wbemCIMTypeString],
    v);
  Result := v;
end;

function TProductInfo.Reinstall(AInstanceProp:string; AInstanceValue:Variant;
      aReinstallMode:integer):integer;
var
  arr:TArrVariant;
  v:variant;
begin
  SetLength(arr, 1);
  arr[0] := aReinstallMode;
  // Ejecutar el proceso
  ExecuteClassMethod(Self, AInstanceProp, AInstanceValue,
    'Reinstall',
    ['ReinstallMode'],
    arr,
    [ptIn],
    [wbemCIMTypeUint32],
    v);
  Result := v;
end;

function TProductInfo.Upgrade(AInstanceProp:string; AInstanceValue:Variant;
      aOptions:string;
      aPackageLocation:string):integer;
var
  arr:TArrVariant;
  v:variant;
begin
  SetLength(arr, 2);
  arr[0] := aOptions;
  arr[1] := aPackageLocation;
  // Ejecutar el proceso
  ExecuteClassMethod(Self, AInstanceProp, AInstanceValue,
    'Upgrade',
    ['Options', 'PackageLocation'],
    arr,
    [ptIn, ptIn],
    [wbemCIMTypeString, wbemCIMTypeString],
    v);
  Result := v;
end;

function TProductInfo.Uninstall(AInstanceProp:string; AInstanceValue:Variant):integer;
var
  arr:TArrVariant;
  v:variant;
begin
  SetLength(arr, 0);
  // Ejecutar el proceso
  ExecuteClassMethod(Self, AInstanceProp, AInstanceValue,
    'Uninstall',
    [],
    arr,
    [],
    [],
    v);
  Result := v;
end;

end.
