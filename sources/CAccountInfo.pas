{
TAccountInfo Component Version 3.4 - Suite GLibWMI
Copyright (c) 2024,  by German Estevez (Neftali)

La clase Win32_Account contiene informacion sobre las cuentas de usuario y las cuentas de grupo
conocidas para el sistema informatico que ejecuta Windows.


Utilizacion/Usage:
(ES) Basta con "soltar" el componente y activarlo.
(EN) Place the component in the form and active it.

MSDN Info:
https://learn.microsoft.com/es-es/windows/win32/cimwin32prov/win32-account

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
unit CAccountInfo;

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
  TAccountProperties = class(TPersistent)
  private
    {%PrivateClassVars PropertiesClass%}
    FCaption:string;
    FDescription:string;
    FDomain:string;
    FInstallDate:TDatetime;
    FLocalAccount:boolean;
    FName:string;
    FSID:string;
    FSIDType:integer;
    FStatus:string;

  public
    {%PublicGetMethods PropertiesClass%}
    // Obtener la propiedad <SIDType> como string
    function GetAllSIDTypeAsString(index:integer):string;
    // Obtener el numero de elementos disponibles de la propiedad <SIDType>
    function GetAllSIDTypeCount:integer;
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
    ///  La propiedad Description contiene una descripcion textual del objeto.
    /// </summary>
    property Description:string read FDescription write FDescription stored False;
    /// <summary>
    ///  La propiedad Domain contiene el nombre del dominio de Windows al que pertenece el grupo o usuario.
    ///  Ejemplo: "NA-SALES".
    /// </summary>
    property Domain:string read FDomain write FDomain stored False;
    /// <summary>
    ///  La propiedad InstallDate indica cuando se instalo el objeto. La falta de un valor no indica
    ///  que el objeto no este instalado.
    /// </summary>
    property InstallDate:TDatetime read FInstallDate write FInstallDate stored False;
    /// <summary>
    ///  La propiedad LocalAccount indica si la cuenta se define en el equipo local (True).
    /// </summary>
    property LocalAccount:boolean read FLocalAccount write FLocalAccount stored False;
    /// <summary>
    ///  La propiedad Name contiene el nombre de la cuenta del sistema de Windows en el dominio
    ///  indicado por la propiedad Domain.
    /// </summary>
    property Name:string read FName write FName stored False;
    /// <summary>
    ///  La propiedad SID contiene el identificador de seguridad (SID) de la cuenta. Cada cuenta tiene
    ///  un SID unico emitido por una autoridad (como un dominio de Windows).
    /// </summary>
    property SID:string read FSID write FSID stored False;
    /// <summary>
    ///  La propiedad SIDType indica el tipo de identificador de seguridad (SID). Valores posibles:
    ///  SidTypeUser (1), SidTypeGroup (2), SidTypeDomain (3), SidTypeAlias (4), SidTypeWellKnownGroup (5),
    ///  SidTypeDeletedAccount (6), SidTypeInvalid (7), SidTypeUnknown (8), SidTypeComputer (9).
    /// </summary>
    property SIDType:integer read FSIDType write FSIDType stored False;
    /// <summary>
    ///  La propiedad Status indica el estado actual del objeto. Valores posibles:
    ///  OK, Error, Degradado, Desconocido, Error previo, Inicio, Detener, Servicio,
    ///  Estresado, NonRecover, Sin contacto, Lost Comm.
    /// </summary>
    property Status:string read FStatus write FStatus stored False;
  end;

  {%InterfaceClass WMIClass%}
  /// <summary>
  ///  La clase Win32_Account contiene informacion sobre las cuentas de usuario y las cuentas de grupo
  ///  conocidas para el sistema informatico que ejecuta Windows.
  /// </summary>
  TAccountInfo = class(TWMIBase)
  private
    FAccountProperties: TAccountProperties;
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
    // propiedades de la cuenta
    property AccountProperties:TAccountProperties read FAccountProperties write FAccountProperties;
  end;


// Constantes para la propiedad SIDType
const
  ENUM_STRING_SIDTYPE_00 = 'Usuario';
  ENUM_STRING_SIDTYPE_01 = 'Grupo';
  ENUM_STRING_SIDTYPE_02 = 'Dominio';
  ENUM_STRING_SIDTYPE_03 = 'Alias';
  ENUM_STRING_SIDTYPE_04 = 'Grupo conocido';
  ENUM_STRING_SIDTYPE_05 = 'Cuenta eliminada';
  ENUM_STRING_SIDTYPE_06 = 'No valido';
  ENUM_STRING_SIDTYPE_07 = 'Desconocido';
  ENUM_STRING_SIDTYPE_08 = 'Equipo';

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
procedure TAccountInfo.ClearProps;
begin
  Self.AccountProperties.FCaption := EmptyStr;
  Self.AccountProperties.FDescription := EmptyStr;
  Self.AccountProperties.FDomain := EmptyStr;
  Self.AccountProperties.FInstallDate := 0;
  Self.AccountProperties.FLocalAccount := False;
  Self.AccountProperties.FName := EmptyStr;
  Self.AccountProperties.FSID := EmptyStr;
  Self.AccountProperties.FSIDType := 0;
  Self.AccountProperties.FStatus := EmptyStr;
end;

//: Constructor del componente
constructor TAccountInfo.Create(AOwner: TComponent);
begin
  inherited;
  Self.FAccountProperties := TAccountProperties.Create();
  Self.MSDNHelp := 'https://learn.microsoft.com/es-es/windows/win32/cimwin32prov/win32-account';
end;

//: destructor del componente
destructor TAccountInfo.Destroy();
begin
  // liberar
  FreeAndNil(Self.FAccountProperties);
  inherited;
end;

//: Obtener la clase
function TAccountInfo.GetWMIClass(): string;
begin
  Result := 'Win32_Account'
end;

//: Obtener Root
function TAccountInfo.GetWMIRoot(): string;
begin
  Result := '';
end;

//: Procedimiento de activacion
procedure TAccountInfo.SetActive(const Value: Boolean);
begin
  // metodo heredado
  inherited;
end;

//: Rellenar las propiedades del componente.
procedure TAccountInfo.FillProperties(AIndex: integer);
var
  v:     variant;
  vNull: boolean;
  vp:    TAccountProperties;
begin
  // Llamar al heredado (importante)
  inherited;
  // Rellenar propiedades...
  vp := AccountProperties;

  GetWMIPropertyValue(Self, 'Caption', v, vNull);
  vp.FCaption := VariantStrValue(v, vNull);

  GetWMIPropertyValue(Self, 'Description', v, vNull);
  vp.FDescription := VariantStrValue(v, vNull);

  GetWMIPropertyValue(Self, 'Domain', v, vNull);
  vp.FDomain := VariantStrValue(v, vNull);

  GetWMIPropertyValue(Self, 'InstallDate', v, vNull);
  vp.FInstallDate := VariantDateTimeValue(v, vNull);

  GetWMIPropertyValue(Self, 'LocalAccount', v, vNull);
  vp.FLocalAccount := VariantBooleanValue(v, vNull);

  GetWMIPropertyValue(Self, 'Name', v, vNull);
  vp.FName := VariantStrValue(v, vNull);

  GetWMIPropertyValue(Self, 'SID', v, vNull);
  vp.FSID := VariantStrValue(v, vNull);

  GetWMIPropertyValue(Self, 'SIDType', v, vNull);
  vp.FSIDType := VariantIntegerValue(v, vNull);

  GetWMIPropertyValue(Self, 'Status', v, vNull);
  vp.FStatus := VariantStrValue(v, vNull);
end;

// Obtener la propiedad como string
function TAccountProperties.GetAllSIDTypeAsString(index:integer):string;
begin
  case index of
    00: Result := ENUM_STRING_SIDTYPE_00;
    01: Result := ENUM_STRING_SIDTYPE_01;
    02: Result := ENUM_STRING_SIDTYPE_02;
    03: Result := ENUM_STRING_SIDTYPE_03;
    04: Result := ENUM_STRING_SIDTYPE_04;
    05: Result := ENUM_STRING_SIDTYPE_05;
    06: Result := ENUM_STRING_SIDTYPE_06;
    07: Result := ENUM_STRING_SIDTYPE_07;
    08: Result := ENUM_STRING_SIDTYPE_08;
  else
    Result := STR_EMPTY;
  end;
end;

// Obtener n. de elementos de la propiedad como string
function TAccountProperties.GetAllSIDTypeCount:integer;
begin
  Result := 9
end;

// Obtener la propiedad como string
function TAccountProperties.GetAllStatusAsString(index:integer):string;
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
function TAccountProperties.GetAllStatusCount:integer;
begin
  Result := 12
end;


end.
