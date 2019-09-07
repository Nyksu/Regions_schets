unit RDM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComServ, ComObj, VCLCom, StdVcl,  DataBkr, DBClient, terr_srv_TLB,
  DBTables, Provider, Db, ActnList, x_prov;

type
  TLogProc = procedure(ss : string);

  TOtherAreaRDM = class(TRemoteDataModule,  IOtherAreaRDM)
    DB: TDatabase;
    qTemp: TQuery;
    cTemp: TClientDataSet;
    OperationList: TActionList;
    pTemp: TxProvider;
    Insert_in_schet: TAction;
    Del_in_schet: TAction;
    qr_Ins_coment: TQuery;
    pr_reestr: TxProvider;
    Change_reestr: TAction;
    q_sumSchIn_upd: TQuery;
    Vozvrat_in: TAction;
    q_reestr: TQuery;
    q_saldo_in: TQuery;
    pr_saldo_in: TxProvider;
    Show_saldo_in: TAction;
    q_saldo_inID_URPERS: TIntegerField;
    q_saldo_inS_IN_NULL: TFloatField;
    q_saldo_inS_OUT_NULL: TFloatField;
    q_saldo_inPL_PP_IN: TFloatField;
    q_saldo_inPL_PP_OUT: TFloatField;
    q_saldo_inPL_TP_IN: TFloatField;
    q_saldo_inPL_TP_OUT: TFloatField;
    q_saldo_inV_PP_IN: TFloatField;
    q_saldo_inV_PP_OUT: TFloatField;
    q_saldo_inV_TP_IN: TFloatField;
    q_saldo_inV_TP_OUT: TFloatField;
    q_saldo_inSCH_PP_IN: TFloatField;
    q_saldo_inSCH_PP_OUT: TFloatField;
    q_saldo_inSCH_TP_IN: TFloatField;
    q_saldo_inSCH_TP_OUT: TFloatField;
    stp_tmp: TStoredProc;
    q_regions: TQuery;
    q_regionsID: TIntegerField;
    q_regionsAREA_ID: TIntegerField;
    q_regionsREG_NAME_ID: TIntegerField;
    q_regionsSHORT_NAME: TStringField;
    q_regionsREG_NAME: TStringField;
    q_regionsAREA_NAME: TStringField;
    pr_regions: TxProvider;
    q_regionsCEL_NOM: TStringField;
    q_regionsCEL_NOM_TOP: TStringField;
    q_regionsCOD: TSmallintField;
    procedure RDMServerCreate(Sender: TObject);
    procedure RDMServerDestroy(Sender: TObject);
    procedure CheckLogin(DataSet: TDataSet);
    procedure LogSQL(ModifySQL: String);
    procedure Insert_in_schetExecute(Sender: TObject);
    procedure Change_reestrExecute(Sender: TObject);
    procedure Vozvrat_inExecute(Sender: TObject);
    procedure pr_reestrGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure qTempAfterOpen(DataSet: TDataSet);
    procedure Show_saldo_inExecute(Sender: TObject);
    procedure pr_saldo_inBeforeApplyUpdates(Sender: TObject;
      var OwnerData: OleVariant);
    procedure DisplaySQL(ModifySQL, ErrMessage: String);
    procedure pr_saldo_inGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure pr_regionsGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure pr_regionsBeforeApplyUpdates(Sender: TObject;
      var OwnerData: OleVariant);
    procedure pr_regionsErrorExecSQL(ModifySQL, ErrMessage: String);
  private
    { Private declarations }
    //------------ не изменять----------------v11
    TransCount : integer;
    LogProcedure : TLogProc;
    OperationParams : OleVariant;
    OperationResult : OleVariant;
    Debug:boolean;
    Select_Always_Return_Dataset :Boolean;
    Default_Generator:string;
    LastOperationError:string;
    function InternalDoOperation(ID: Integer; Params: OleVariant): OleVariant;
    function InternalDoSQL(ID: Integer; Params: OleVariant): OleVariant;
    procedure OnCreateProc;
    procedure OnDestroyProc;
    //----------------------------------------

    //----------------------------------------
  public
    { Public declarations }
    //------------ не изменять----------------
    function CheckUserLogin(DoException:boolean=True):boolean;
    procedure SetLogProcedure(prog : TLogProc);
    procedure WriteLog(ss:string);
    procedure LogExecutedSQL(sql: string);
    procedure LogError(err: string);
    procedure CheckSQLRight(ID : integer);
    //----------------------------------------

    //----------------------------------------
  protected
    //------------ не изменять----------------
    UserID : Integer;
    UserName : string;
    IsAdmin : Boolean;
    class procedure UpdateRegistry(Register: Boolean; const ClassID, ProgID: string); override;
    procedure Login(UserName, Password: OleVariant); safecall;
    procedure Logout; safecall;
    procedure StartTransaction; safecall;
    procedure Commit; safecall;
    procedure Rollback; safecall;
    function DoOperation(ID: Integer; IsOperation: WordBool;
      Params: OleVariant): OleVariant; safecall;
    function GetNextID: Integer; safecall;
    procedure Ping; safecall;
    function OperationError: OleVariant; safecall;
    function ExecutionPosible(IDs: OleVariant): WordBool; safecall;
    //----------------------------------------
    function GetUserDefID(namgen: OleVariant): Integer; safecall;
    function Get_Result_from_proc(params: OleVariant): OleVariant; safecall;
  end;

var
  OtherAreaRDM: TOtherAreaRDM;

implementation
uses strutils;

{$R *.DFM}
{$I RDMinc.pas}

procedure TOtherAreaRDM.OnCreateProc;
begin
Debug:=False; // True - Сервер выдает сообщения из исключений на экран

Select_Always_Return_Dataset:=False; //True - DoOperation( Int, False , Variant)
                                     //       возвращает dataset даже если select
                                     //       возвращает 1 поле и 1 запись
Default_Generator:='';   //Присвоить имя свего генератора если нужно
end;

procedure TOtherAreaRDM.OnDestroyProc;
begin

end;

{+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++}


procedure TOtherAreaRDM.Insert_in_schetExecute(Sender: TObject);
var {Универсальная операция по заполнению нескольких таблиц без возврата}
 ii,i,c : integer;
begin
 {OperationParams[1] - число SQL, OperationParams[2] - массив сод. номера SQL
  OperationParams[3], OperationParams[4]...  параметры для SQL}
 For ii:=3 To OperationParams[1]+2 Do begin
    DoOperation(OperationParams[2][ii-3],false,OperationParams[ii])
 end;
end;

procedure TOtherAreaRDM.Change_reestrExecute(Sender: TObject);
begin
   Case OperationParams[1] of
     0 : q_reestr.ParamByName('id').AsInteger:=OperationParams[2];
         {параметр [2] передает ID реестра если [1]=0}
     1 : q_reestr.ParamByName('id').AsInteger:=0;
   end;
end;

procedure TOtherAreaRDM.Vozvrat_inExecute(Sender: TObject);
var
  ful_param,sql_par,par_names : variant;
  n1,n2 : integer;
  n3 : real;
begin
  Case OperationParams[0] of
     0 : Begin //Вставка
           par_names:=VarArrayOf(['id','reestr','sum']); //1-IDреестра,2-сумма,3-IDсчета
           sql_par:=VarArrayOf([GetNextID,OperationParams[1],OperationParams[2]]);
           ful_param:=VarArrayOf([par_names,sql_par]);
           DoOperation(1607,false,ful_param);
           par_names:=VarArrayOf(['reestr','delta']);
           sql_par:=VarArrayOf([OperationParams[1],OperationParams[2]]);
           ful_param:=VarArrayOf([par_names,sql_par]);
           DoOperation(1608,false,ful_param);
           par_names:=VarArrayOf(['sch','delta']);
           sql_par:=VarArrayOf([OperationParams[3],-OperationParams[2]]);
           ful_param:=VarArrayOf([par_names,sql_par]);
           DoOperation(1610,false,ful_param);
         end;
     1 : Begin //Удаление
           par_names:=VarArrayOf(['id']);  //1-IDвозврата,2-IDреестра,3-сумма,4-IDсчета
           sql_par:=VarArrayOf([OperationParams[1]]);
           ful_param:=VarArrayOf([par_names,sql_par]);
           DoOperation(1611,false,ful_param);
           par_names:=VarArrayOf(['reestr','delta']);
           sql_par:=VarArrayOf([OperationParams[2],-OperationParams[3]]);
           ful_param:=VarArrayOf([par_names,sql_par]);
           DoOperation(1608,false,ful_param);
           par_names:=VarArrayOf(['sch','delta']);
           sql_par:=VarArrayOf([OperationParams[4],OperationParams[3]]);
           ful_param:=VarArrayOf([par_names,sql_par]);
           DoOperation(1610,false,ful_param);
         end;
  end;
end;

function TOtherAreaRDM.GetUserDefID(namgen: OleVariant): Integer;
const
  sel='SELECT %s.NEXTVAL FROM DUAL';
begin
  CheckUserLogin;
  with qTemp do begin
     SQL.Clear;
     SQL.Add(format(sel,[namgen]));
     Open;
     try
        Result:=Fields[0].asInteger;
     finally
        Close;
     end;
  end;
end;

procedure TOtherAreaRDM.pr_reestrGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
TableName:='REESTR_SCHETS';
end;


procedure TOtherAreaRDM.Show_saldo_inExecute(Sender: TObject);
begin
  q_saldo_in.ParamByName('id').AsInteger:=OperationParams[0];
end;

procedure TOtherAreaRDM.pr_saldo_inBeforeApplyUpdates(Sender: TObject;
  var OwnerData: OleVariant);
begin
  CheckSQLRight(3603);
end;

procedure TOtherAreaRDM.DisplaySQL(ModifySQL,
  ErrMessage: String);
begin
  ShowMessage(ModifySQL+' ОШИБКА!!! '+ErrMessage);
end;

procedure TOtherAreaRDM.pr_saldo_inGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
  TableName:='SALDO_IN';
end;

function TOtherAreaRDM.Get_Result_from_proc(
  params: OleVariant): OleVariant;
var
  res : variant;
  ii : integer;
begin
  CheckUserLogin;
  CheckSQLRight(params[3]);//Проверка прав на SQL
  stp_tmp.StoredProcName:=params[0]; //Название хранимой процедуры
  stp_tmp.prepare;
  res:=VarArrayCreate([0,VarArrayHighBound(params[2],1)],varVariant);
  For ii:=0 To VarArrayHighBound(params[1],1) Do //Входящие параметры
    stp_tmp.Params[ii].Value:=params[1][ii];
  try
   stp_tmp.ExecProc;
   For ii:=0 To VarArrayHighBound(params[2],1) Do
       res[ii]:=stp_tmp.ParamByName(params[2][ii]).Value;
   Result:=res; //Возвращаемые параметры хранимой процедуры
  except
    Result:=null;
  end;
end;

procedure TOtherAreaRDM.pr_regionsGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
  TableName:='REGIONS';
end;

procedure TOtherAreaRDM.pr_regionsBeforeApplyUpdates(Sender: TObject;
  var OwnerData: OleVariant);
begin
  CheckSQLRight(3761);
end;

procedure TOtherAreaRDM.pr_regionsErrorExecSQL(ModifySQL,
  ErrMessage: String);
begin
  ShowMessage(ModifySQL+' ОШИБКА!!! '+ErrMessage);
end;

initialization
  TComponentFactory.Create(ComServer, TOtherAreaRDM,
    Class_OtherAreaRDM, ciMultiInstance, tmApartment);
end.
