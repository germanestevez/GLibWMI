{
TBaseBoardInfo Component Version 3.4 - Suite GLibWMI
Copyright (c) 2024,  by German Estevez (Neftali)

La clase Win32_BaseBoard representa los atributos de una placa base (tarjeta madre)
o de una placa de sistema instalada en el equipo.


Utilizacion/Usage:
(ES) Basta con "soltar" el componente y activarlo.
(EN) Place the component in the form and active it.

MSDN Info:
https://learn.microsoft.com/es-es/windows/win32/cimwin32prov/win32-baseboard

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
unit CBaseBoardInfo;

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
  TBaseBoardProperties = class(TPersistent)
  private
    {%PrivateClassVars PropertiesClass%}
    FCaption:string;
    FConfigOptions:TArrString;
    FConfigOptionsCount:integer;
    FConfigOptionsAsString:string;
    FCreationClassName:string;
    FDepth:double;
    FDescription:string;
    FHeight:double;
    FHostingBoard:boolean;
    FHotSwappable:boolean;
    FInstallDate:TDatetime;
    FManufacturer:string;
    FModel:string;
    FName:string;
    FOtherIdentifyingInfo:string;
    FPartNumber:string;
    FPoweredOn:boolean;
    FProduct:string;
    FRemovable:boolean;
    FReplaceable:boolean;
    FRequirementsDescription:string;
    FRequiresDaughterBoard:boolean;
    FSerialNumber:string;
    FSKU:string;
    FSlotLayout:string;
    FSpecialRequirements:string;
    FStatus:string;
    FTag:string;
    FVersion:string;
    FWeight:double;
    FWidth:double;

  private
    {%PrivateGetMethods PropertiesClass%}
    function GetConfigOptions(index: integer):string;

  public
    {%PublicGetMethods PropertiesClass%}
    // Obtener la propiedad <Status> como string
    function GetAllStatusAsString(index:integer):string;
    // Obtener el numero de elementos disponibles de la propiedad <Status>
    function GetAllStatusCount:integer;

    {%PublicArrayMethods PropertiesClass%}
    property ConfigOptions[index:integer]:string read GetConfigOptions;
    property ConfigOptionsCount:integer read FConfigOptionsCount stored False;

  published
    {%PublishedProperties PropertiesClass%}
    /// <summary>
    ///  La propiedad Caption contiene un nombre corto con el que se conoce el objeto.
    /// </summary>
    property Caption:string read FCaption write FCaption stored False;
    /// <summary>
    ///  La propiedad de matriz ConfigOptions contiene una lista de cadenas que describen
    ///  las opciones de configuracion de la placa base (jumpers, interruptores, etc.).
    /// </summary>
    property ConfigOptionsAsString:string read FConfigOptionsAsString write FConfigOptionsAsString stored False;
    /// <summary>
    ///  La propiedad CreationClassName indica el nombre de la clase o subclase usada en la
    ///  creacion de una instancia del objeto.
    /// </summary>
    property CreationClassName:string read FCreationClassName write FCreationClassName stored False;
    /// <summary>
    ///  La propiedad Depth indica la profundidad de la placa base, en pulgadas.
    /// </summary>
    property Depth:double read FDepth write FDepth stored False;
    /// <summary>
    ///  La propiedad Description contiene una descripcion del objeto.
    /// </summary>
    property Description:string read FDescription write FDescription stored False;
    /// <summary>
    ///  La propiedad Height indica la altura de la placa base, en pulgadas.
    /// </summary>
    property Height:double read FHeight write FHeight stored False;
    /// <summary>
    ///  La propiedad HostingBoard indica si la placa es una placa de soporte (hosting board),
    ///  es decir, si puede alojar otras placas.
    /// </summary>
    property HostingBoard:boolean read FHostingBoard write FHostingBoard stored False;
    /// <summary>
    ///  La propiedad HotSwappable indica si la placa puede sustituirse en caliente
    ///  (con el sistema en funcionamiento).
    /// </summary>
    property HotSwappable:boolean read FHotSwappable write FHotSwappable stored False;
    /// <summary>
    ///  La propiedad InstallDate indica la fecha en que se instalo el objeto.
    /// </summary>
    property InstallDate:TDatetime read FInstallDate write FInstallDate stored False;
    /// <summary>
    ///  La propiedad Manufacturer contiene el nombre del fabricante de la placa base.
    /// </summary>
    property Manufacturer:string read FManufacturer write FManufacturer stored False;
    /// <summary>
    ///  La propiedad Model contiene el modelo de la placa base definido por el fabricante.
    /// </summary>
    property Model:string read FModel write FModel stored False;
    /// <summary>
    ///  La propiedad Name contiene el nombre por el que se conoce el objeto.
    /// </summary>
    property Name:string read FName write FName stored False;
    /// <summary>
    ///  La propiedad OtherIdentifyingInfo contiene informacion adicional que identifica
    ///  la placa base.
    /// </summary>
    property OtherIdentifyingInfo:string read FOtherIdentifyingInfo write FOtherIdentifyingInfo stored False;
    /// <summary>
    ///  La propiedad PartNumber contiene el numero de parte asignado por el fabricante.
    /// </summary>
    property PartNumber:string read FPartNumber write FPartNumber stored False;
    /// <summary>
    ///  La propiedad PoweredOn indica si la placa base esta alimentada (encendida).
    /// </summary>
    property PoweredOn:boolean read FPoweredOn write FPoweredOn stored False;
    /// <summary>
    ///  La propiedad Product contiene el nombre del producto asignado a la placa base.
    /// </summary>
    property Product:string read FProduct write FProduct stored False;
    /// <summary>
    ///  La propiedad Removable indica si la placa base puede extraerse del sistema.
    /// </summary>
    property Removable:boolean read FRemovable write FRemovable stored False;
    /// <summary>
    ///  La propiedad Replaceable indica si la placa base puede sustituirse por otra.
    /// </summary>
    property Replaceable:boolean read FReplaceable write FReplaceable stored False;
    /// <summary>
    ///  La propiedad RequirementsDescription contiene una descripcion de los requisitos
    ///  que debe cumplir la placa base.
    /// </summary>
    property RequirementsDescription:string read FRequirementsDescription write FRequirementsDescription stored False;
    /// <summary>
    ///  La propiedad RequiresDaughterBoard indica si la placa necesita una placa hija
    ///  (daughter board) para funcionar.
    /// </summary>
    property RequiresDaughterBoard:boolean read FRequiresDaughterBoard write FRequiresDaughterBoard stored False;
    /// <summary>
    ///  La propiedad SerialNumber contiene el numero de serie asignado por el fabricante.
    /// </summary>
    property SerialNumber:string read FSerialNumber write FSerialNumber stored False;
    /// <summary>
    ///  La propiedad SKU contiene el numero de referencia (SKU) del producto.
    /// </summary>
    property SKU:string read FSKU write FSKU stored False;
    /// <summary>
    ///  La propiedad SlotLayout describe la disposicion de los slots (ranuras) de la placa base.
    /// </summary>
    property SlotLayout:string read FSlotLayout write FSlotLayout stored False;
    /// <summary>
    ///  La propiedad SpecialRequirements contiene requisitos especiales de la placa base.
    /// </summary>
    property SpecialRequirements:string read FSpecialRequirements write FSpecialRequirements stored False;
    /// <summary>
    ///  La propiedad Status indica el estado actual del objeto. Valores posibles:
    ///  OK, Error, Degradado, Desconocido, Error previo, Inicio, Detener, Servicio,
    ///  Estresado, NonRecover, Sin contacto, Lost Comm.
    /// </summary>
    property Status:string read FStatus write FStatus stored False;
    /// <summary>
    ///  La propiedad Tag contiene una etiqueta identificativa de la placa base.
    /// </summary>
    property Tag:string read FTag write FTag stored False;
    /// <summary>
    ///  La propiedad Version contiene la version de la placa base definida por el fabricante.
    /// </summary>
    property Version:string read FVersion write FVersion stored False;
    /// <summary>
    ///  La propiedad Weight indica el peso de la placa base, en libras.
    /// </summary>
    property Weight:double read FWeight write FWeight stored False;
    /// <summary>
    ///  La propiedad Width indica la anchura de la placa base, en pulgadas.
    /// </summary>
    property Width:double read FWidth write FWidth stored False;
  end;

  {%InterfaceClass WMIClass%}
  /// <summary>
  ///  La clase Win32_BaseBoard representa los atributos de una placa base (tarjeta madre)
  ///  o de una placa de sistema instalada en el equipo.
  /// </summary>
  TBaseBoardInfo = class(TWMIBase)
  private
    FBaseBoardProperties: TBaseBoardProperties;
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
    // propiedades de la placa base
    property BaseBoardProperties:TBaseBoardProperties read FBaseBoardProperties write FBaseBoardProperties;
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
procedure TBaseBoardInfo.ClearProps;
begin
  Self.BaseBoardProperties.FCaption := EmptyStr;
  Self.BaseBoardProperties.FConfigOptionsCount := 0;
  Self.BaseBoardProperties.FConfigOptionsAsString := EmptyStr;
  SetLength(BaseBoardProperties.FConfigOptions, 0);
  Self.BaseBoardProperties.FCreationClassName := EmptyStr;
  Self.BaseBoardProperties.FDepth := 0;
  Self.BaseBoardProperties.FDescription := EmptyStr;
  Self.BaseBoardProperties.FHeight := 0;
  Self.BaseBoardProperties.FHostingBoard := False;
  Self.BaseBoardProperties.FHotSwappable := False;
  Self.BaseBoardProperties.FInstallDate := 0;
  Self.BaseBoardProperties.FManufacturer := EmptyStr;
  Self.BaseBoardProperties.FModel := EmptyStr;
  Self.BaseBoardProperties.FName := EmptyStr;
  Self.BaseBoardProperties.FOtherIdentifyingInfo := EmptyStr;
  Self.BaseBoardProperties.FPartNumber := EmptyStr;
  Self.BaseBoardProperties.FPoweredOn := False;
  Self.BaseBoardProperties.FProduct := EmptyStr;
  Self.BaseBoardProperties.FRemovable := False;
  Self.BaseBoardProperties.FReplaceable := False;
  Self.BaseBoardProperties.FRequirementsDescription := EmptyStr;
  Self.BaseBoardProperties.FRequiresDaughterBoard := False;
  Self.BaseBoardProperties.FSerialNumber := EmptyStr;
  Self.BaseBoardProperties.FSKU := EmptyStr;
  Self.BaseBoardProperties.FSlotLayout := EmptyStr;
  Self.BaseBoardProperties.FSpecialRequirements := EmptyStr;
  Self.BaseBoardProperties.FStatus := EmptyStr;
  Self.BaseBoardProperties.FTag := EmptyStr;
  Self.BaseBoardProperties.FVersion := EmptyStr;
  Self.BaseBoardProperties.FWeight := 0;
  Self.BaseBoardProperties.FWidth := 0;
end;

//: Constructor del componente
constructor TBaseBoardInfo.Create(AOwner: TComponent);
begin
  inherited;
  Self.FBaseBoardProperties := TBaseBoardProperties.Create();
  Self.MSDNHelp := 'https://learn.microsoft.com/es-es/windows/win32/cimwin32prov/win32-baseboard';
end;

//: destructor del componente
destructor TBaseBoardInfo.Destroy();
begin
  // liberar
  FreeAndNil(Self.FBaseBoardProperties);
  inherited;
end;

//: Obtener la clase
function TBaseBoardInfo.GetWMIClass(): string;
begin
  Result := 'Win32_BaseBoard'
end;

//: Obtener Root
function TBaseBoardInfo.GetWMIRoot(): string;
begin
  Result := '';
end;

//: Procedimiento de activacion
procedure TBaseBoardInfo.SetActive(const Value: Boolean);
begin
  // metodo heredado
  inherited;
end;

// Acceso a los elementos de la propiedad <ConfigOptions>
function TBaseBoardProperties.GetConfigOptions(index: integer):string;
begin
  if (index >= Self.FConfigOptionsCount) then begin
    Index := Self.FConfigOptionsCount - 1;
  end;
  Result := Self.FConfigOptions[index];
end;


//: Rellenar las propiedades del componente.
procedure TBaseBoardInfo.FillProperties(AIndex: integer);
var
  v:     variant;
  vNull: boolean;
  vp:    TBaseBoardProperties;
begin
  // Llamar al heredado (importante)
  inherited;
  // Rellenar propiedades...
  vp := BaseBoardProperties;

  GetWMIPropertyValue(Self, 'Caption', v, vNull);
  vp.FCaption := VariantStrValue(v, vNull);

  GetWMIPropertyValue(Self, 'ConfigOptions', v, vNull);
  vp.FConfigOptionsAsString := VariantStrValue(v, vNull);
  StringToArrayString(vp.FConfigOptionsAsString, vp.FConfigOptions);
  vp.FConfigOptionsCount := Length(vp.FConfigOptions);

  GetWMIPropertyValue(Self, 'CreationClassName', v, vNull);
  vp.FCreationClassName := VariantStrValue(v, vNull);

  GetWMIPropertyValue(Self, 'Depth', v, vNull);
  vp.FDepth := VariantDoubleValue(v, vNull);

  GetWMIPropertyValue(Self, 'Description', v, vNull);
  vp.FDescription := VariantStrValue(v, vNull);

  GetWMIPropertyValue(Self, 'Height', v, vNull);
  vp.FHeight := VariantDoubleValue(v, vNull);

  GetWMIPropertyValue(Self, 'HostingBoard', v, vNull);
  vp.FHostingBoard := VariantBooleanValue(v, vNull);

  GetWMIPropertyValue(Self, 'HotSwappable', v, vNull);
  vp.FHotSwappable := VariantBooleanValue(v, vNull);

  GetWMIPropertyValue(Self, 'InstallDate', v, vNull);
  vp.FInstallDate := VariantDateTimeValue(v, vNull);

  GetWMIPropertyValue(Self, 'Manufacturer', v, vNull);
  vp.FManufacturer := VariantStrValue(v, vNull);

  GetWMIPropertyValue(Self, 'Model', v, vNull);
  vp.FModel := VariantStrValue(v, vNull);

  GetWMIPropertyValue(Self, 'Name', v, vNull);
  vp.FName := VariantStrValue(v, vNull);

  GetWMIPropertyValue(Self, 'OtherIdentifyingInfo', v, vNull);
  vp.FOtherIdentifyingInfo := VariantStrValue(v, vNull);

  GetWMIPropertyValue(Self, 'PartNumber', v, vNull);
  vp.FPartNumber := VariantStrValue(v, vNull);

  GetWMIPropertyValue(Self, 'PoweredOn', v, vNull);
  vp.FPoweredOn := VariantBooleanValue(v, vNull);

  GetWMIPropertyValue(Self, 'Product', v, vNull);
  vp.FProduct := VariantStrValue(v, vNull);

  GetWMIPropertyValue(Self, 'Removable', v, vNull);
  vp.FRemovable := VariantBooleanValue(v, vNull);

  GetWMIPropertyValue(Self, 'Replaceable', v, vNull);
  vp.FReplaceable := VariantBooleanValue(v, vNull);

  GetWMIPropertyValue(Self, 'RequirementsDescription', v, vNull);
  vp.FRequirementsDescription := VariantStrValue(v, vNull);

  GetWMIPropertyValue(Self, 'RequiresDaughterBoard', v, vNull);
  vp.FRequiresDaughterBoard := VariantBooleanValue(v, vNull);

  GetWMIPropertyValue(Self, 'SerialNumber', v, vNull);
  vp.FSerialNumber := VariantStrValue(v, vNull);

  GetWMIPropertyValue(Self, 'SKU', v, vNull);
  vp.FSKU := VariantStrValue(v, vNull);

  GetWMIPropertyValue(Self, 'SlotLayout', v, vNull);
  vp.FSlotLayout := VariantStrValue(v, vNull);

  GetWMIPropertyValue(Self, 'SpecialRequirements', v, vNull);
  vp.FSpecialRequirements := VariantStrValue(v, vNull);

  GetWMIPropertyValue(Self, 'Status', v, vNull);
  vp.FStatus := VariantStrValue(v, vNull);

  GetWMIPropertyValue(Self, 'Tag', v, vNull);
  vp.FTag := VariantStrValue(v, vNull);

  GetWMIPropertyValue(Self, 'Version', v, vNull);
  vp.FVersion := VariantStrValue(v, vNull);

  GetWMIPropertyValue(Self, 'Weight', v, vNull);
  vp.FWeight := VariantDoubleValue(v, vNull);

  GetWMIPropertyValue(Self, 'Width', v, vNull);
  vp.FWidth := VariantDoubleValue(v, vNull);
end;


// Obtener la propiedad como string
function TBaseBoardProperties.GetAllStatusAsString(index:integer):string;
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
function TBaseBoardProperties.GetAllStatusCount:integer;
begin
  Result := 12
end;


end.
