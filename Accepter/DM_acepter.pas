unit DM_acepter;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBClient, xPing, MConnect, xBroker, SConnect, registry, inifiles,
  ADODB;

type
  TDM = class(TDataModule)
    Server: TSocketConnection;
    ObjectBroker: TxObjectBroker;
    Pinger: TxObjectPing;
    cds_tmp: TClientDataSet;
    ODBC_connection: TADOConnection;
    ODBC_q_default: TADOQuery;
    dlg_open_r_lpu: TOpenDialog;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure ServerAfterConnect(Sender: TObject);
    procedure ServerAfterDisconnect(Sender: TObject);
  private
    PathINI : string;
    procedure GetINI;
    procedure GetRegINI;
    { Private declarations }
  public
    { Public declarations } 
    procedure Login(UserName, Password: string);
    procedure Logout;
    function DoOperation(ID: Integer; IsOperation: Boolean; Params: OleVariant): OleVariant;
    function GetData(ID: Integer; Params: OleVariant): OleVariant;
    function GetNextID:integer;
    function GetID(id_nom:integer):integer;
    function DbIdToInStr(ddt:OleVariant):string;
    procedure StartTrans;
    procedure Commit;
    procedure Rollback;
    function Get_Res_proc(param : Olevariant) : variant;
  end;

var
  DM: TDM;
  Rep_lst : TStringList;
  dbf_backup_path : string;

implementation
uses unxcrypt;

{$R *.DFM}

procedure TDM.Login(UserName, Password: string);
var
 pwd:string;
begin
if Password='' then pwd:=Password
else pwd:=CreatePassword(Password);
Server.AppServer.Login(UserName, Pwd);
end;

procedure TDM.Logout;
begin
Server.AppServer.Logout;
end;

function TDM.DoOperation(ID: Integer; IsOperation: Boolean; Params: OleVariant): OleVariant;
begin
screen.cursor:=crSQLWait;
try
  Result:=Server.AppServer.DoOperation(id,IsOperation,Params);
finally
screen.cursor:=crDefault;
end;
end;

function TDM.GetData(ID: Integer; Params: OleVariant):OleVariant;
begin
screen.cursor:=crSQLWait;
try
  Result:=Server.AppServer.DoOperation(id,False,Params);
finally
screen.cursor:=crDefault;
end;
end;

function TDM.DbIdToInStr(ddt:OleVariant):string;
var
 ss : string;
 ii : integer;
Begin
  ss:='';
  cds_tmp.data:=ddt;
  cds_tmp.first;
  For ii:=0 To cds_tmp.recordcount-1 Do Begin
      ss:=ss+cds_tmp.FieldByName('id').AsString;
      cds_tmp.next;
      If not cds_tmp.EOF Then ss:=ss+',';
  end;
  Result:=ss;
  cds_tmp.Active:=false;
end;

function TDM.GetNextID:integer;
begin
Result:=Server.AppServer.GetNextID;
end;

function TDM.GetID(id_nom:integer):integer;
var
  g_nam :  string;
begin
  Case id_nom of
    0 : g_nam:='SCHET_OUT_NOM';
    1 : g_nam:='ACTS_ID';
    2 : g_nam:='FILE_ID';
  end;
  Result:=Server.AppServer.GetUserDefID(g_nam);
end;

procedure TDM.StartTrans;
begin
Server.AppServer.StartTransaction;
end;

procedure TDM.Commit;
begin
screen.cursor:=crSQLWait;
try
  Server.AppServer.Commit;
finally
screen.cursor:=crDefault;
end;
end;

procedure TDM.Rollback;
begin
screen.cursor:=crSQLWait;
try
  Server.AppServer.Rollback;
finally
screen.cursor:=crDefault;
end;
end;

function TDM.Get_Res_proc(param : Olevariant) : variant;
Begin
  Result:=Server.AppServer.Get_Result_from_proc(param);
end;

procedure TDM.GetRegINI;
var
 rr : Tregistry;
 ss : TStringList;
 indss : integer;
Begin
  ss:=TstringList.Create;
  rr:=Tregistry.Create;
  rr.RootKey:= HKEY_LOCAL_MACHINE;
  rr.OpenKey('SOFTWARE\TFOMS\Interfinans',true);
  rr.GetValueNames(ss);
  indss:=ss.IndexOf('INIPath');
  If indss>=0 Then Begin
     PathINI:=rr.ReadString(ss.Strings[indss]);
  end
  Else Begin
    rr.WriteString('INIPath','');
    PathINI:='';
  end;
  ss.free;
  rr.free;
end;

procedure TDM.GetINI;
var
  strpar : string;
  local_paht : string;
  inifil : TIniFile;
Begin
  local_paht:=ExtractFilePath(Application.ExeName);
  If PathINI='' Then PathINI:=local_paht;
  inifil:= TIniFile.Create(PathINI+'\interfin.ini');
  With inifil Do Begin
    strpar:=ReadString('Server', 'name', '');
    Server.Host:=strpar;
    If strpar>'' Then Server.ObjectBroker:=nil;
    dbf_backup_path:=ReadString('DBF', 'backup path', ODBC_connection.DefaultDatabase);
    dbf_backup_path:=dbf_backup_path+'\';
  end;
  inifil.free;
end;

procedure TDM.DataModuleCreate(Sender: TObject);
begin
Rep_lst:=TStringList.Create;
Server.Host:='';
{if ParamCount>0 then begin
   Server.Host:=ParamStr(1);
   Server.ObjectBroker:=nil;
end;}
GetRegINI;
GetINI;
 try
   Server.Connected:=True;
 except
   MessageDlg('—ервер не найден (или сеть недоступна) !!',mtError,[mbOk],0);
   Application.Terminate;
 end
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
  Server.Connected:=False;
  Rep_lst.free;
end;

procedure TDM.ServerAfterConnect(Sender: TObject);
begin
  if ObjectBroker.GarbagedPortOnly  then Pinger.Start;
end;

procedure TDM.ServerAfterDisconnect(Sender: TObject);
begin
  Pinger.Stop;
end;

end.
