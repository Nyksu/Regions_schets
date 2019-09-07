unit terr_srv_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// PASTLWTR : $Revision:   1.88.1.0.1.0  $
// File generated on 16.06.2000 15:31:55 from Type Library described below.

// ************************************************************************ //
// Type Lib: C:\Borland\Rab\Depl5\Regions_schets\server\terr_srv.tlb (1)
// IID\LCID: {62750140-594F-11D3-B5A4-0050BAA13180}\0
// Helpfile: 
// DepndLst: 
//   (1) v1.0 Midas, (C:\WINDOWS\SYSTEM\MIDAS.DLL)
//   (2) v2.0 stdole, (C:\WINDOWS\SYSTEM\STDOLE2.TLB)
//   (3) v4.0 StdVCL, (C:\WINDOWS\SYSTEM\STDVCL40.DLL)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
interface

uses Windows, ActiveX, Classes, Graphics, OleServer, OleCtrls, StdVCL, 
  MIDAS;

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  terr_srvMajorVersion = 1;
  terr_srvMinorVersion = 0;

  LIBID_terr_srv: TGUID = '{62750140-594F-11D3-B5A4-0050BAA13180}';

  IID_IOtherAreaRDM: TGUID = '{62750141-594F-11D3-B5A4-0050BAA13180}';
  CLASS_OtherAreaRDM: TGUID = '{62750143-594F-11D3-B5A4-0050BAA13180}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IOtherAreaRDM = interface;
  IOtherAreaRDMDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  OtherAreaRDM = IOtherAreaRDM;


// *********************************************************************//
// Interface: IOtherAreaRDM
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {62750141-594F-11D3-B5A4-0050BAA13180}
// *********************************************************************//
  IOtherAreaRDM = interface(IAppServer)
    ['{62750141-594F-11D3-B5A4-0050BAA13180}']
    procedure Login(UserName: OleVariant; Password: OleVariant); safecall;
    procedure Logout; safecall;
    function  DoOperation(ID: Integer; IsOperation: WordBool; Params: OleVariant): OleVariant; safecall;
    procedure StartTransaction; safecall;
    procedure Commit; safecall;
    procedure Rollback; safecall;
    function  GetNextID: Integer; safecall;
    procedure Ping; safecall;
    function  GetUserDefID(namgen: OleVariant): Integer; safecall;
    function  OperationError: OleVariant; safecall;
    function  ExecutionPosible(IDs: OleVariant): WordBool; safecall;
    function  Get_Result_from_proc(params: OleVariant): OleVariant; safecall;
  end;

// *********************************************************************//
// DispIntf:  IOtherAreaRDMDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {62750141-594F-11D3-B5A4-0050BAA13180}
// *********************************************************************//
  IOtherAreaRDMDisp = dispinterface
    ['{62750141-594F-11D3-B5A4-0050BAA13180}']
    procedure Login(UserName: OleVariant; Password: OleVariant); dispid 1;
    procedure Logout; dispid 2;
    function  DoOperation(ID: Integer; IsOperation: WordBool; Params: OleVariant): OleVariant; dispid 3;
    procedure StartTransaction; dispid 5;
    procedure Commit; dispid 6;
    procedure Rollback; dispid 7;
    function  GetNextID: Integer; dispid 4;
    procedure Ping; dispid 8;
    function  GetUserDefID(namgen: OleVariant): Integer; dispid 10;
    function  OperationError: OleVariant; dispid 9;
    function  ExecutionPosible(IDs: OleVariant): WordBool; dispid 11;
    function  Get_Result_from_proc(params: OleVariant): OleVariant; dispid 12;
    function  AS_ApplyUpdates(const ProviderName: WideString; Delta: OleVariant; 
                              MaxErrors: Integer; out ErrorCount: Integer; var OwnerData: OleVariant): OleVariant; dispid 20000000;
    function  AS_GetRecords(const ProviderName: WideString; Count: Integer; out RecsOut: Integer; 
                            Options: Integer; const CommandText: WideString; 
                            var Params: OleVariant; var OwnerData: OleVariant): OleVariant; dispid 20000001;
    function  AS_DataRequest(const ProviderName: WideString; Data: OleVariant): OleVariant; dispid 20000002;
    function  AS_GetProviderNames: OleVariant; dispid 20000003;
    function  AS_GetParams(const ProviderName: WideString; var OwnerData: OleVariant): OleVariant; dispid 20000004;
    function  AS_RowRequest(const ProviderName: WideString; Row: OleVariant; RequestType: Integer; 
                            var OwnerData: OleVariant): OleVariant; dispid 20000005;
    procedure AS_Execute(const ProviderName: WideString; const CommandText: WideString; 
                         var Params: OleVariant; var OwnerData: OleVariant); dispid 20000006;
  end;

// *********************************************************************//
// The Class CoOtherAreaRDM provides a Create and CreateRemote method to          
// create instances of the default interface IOtherAreaRDM exposed by              
// the CoClass OtherAreaRDM. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoOtherAreaRDM = class
    class function Create: IOtherAreaRDM;
    class function CreateRemote(const MachineName: string): IOtherAreaRDM;
  end;

implementation

uses ComObj;

class function CoOtherAreaRDM.Create: IOtherAreaRDM;
begin
  Result := CreateComObject(CLASS_OtherAreaRDM) as IOtherAreaRDM;
end;

class function CoOtherAreaRDM.CreateRemote(const MachineName: string): IOtherAreaRDM;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_OtherAreaRDM) as IOtherAreaRDM;
end;

end.
