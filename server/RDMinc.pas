//11a
const
arExecute = 1;
class procedure TOtherAreaRDM.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
begin
  if Register then
  begin
    inherited UpdateRegistry(Register, ClassID, ProgID);
    EnableSocketTransport(ClassID);
    EnableWebTransport(ClassID);
  end else
  begin
    DisableSocketTransport(ClassID);
    DisableWebTransport(ClassID);
    inherited UpdateRegistry(Register, ClassID, ProgID);
  end;
end;

procedure TOtherAreaRDM.RDMServerCreate(Sender: TObject);
begin
DB.Open;
UserID:=0;
UserName:='';
IsAdmin:=False;
TransCount:=0;
LogProcedure:=nil;
OperationParams:=null;
OperationResult:=null;
Debug:=False;
OnCreateProc;
LastOperationError:='';
end;

procedure TOtherAreaRDM.RDMServerDestroy(Sender: TObject);
begin
DB.Close;
OnDestroyProc;
end;

procedure TOtherAreaRDM.Login(UserName, Password: OleVariant);
const
  sel = 'select id, not_active, is_admin from users where name=''%s'' and password ';
var
   PwdStr:string;
begin
   qTemp.SQl.Clear;
   if VarToStr(Password)='' then PwdStr:='is null'
   else PwdStr:='=''%s'' ';
   qTemp.SQL.Add(Format(Sel+PwdStr,[VarToStr(UserName),VarToStr(Password)]));
   qTemp.Open;
   try
      if qTemp.RecordCount=0 then raise Exception.Create('Неверное имя пользователя или пароль.');
      if qTemp.Fields[1].asInteger=1 then raise Exception.Create('Не действующее сейчас имя пользователя.');
      UserID:=qTemp.Fields[0].asInteger;
      IsAdmin:=qTemp.Fields[2].asInteger=1;
      Self.UserName:=VarAsType(UserName,varString);
      WriteLog('');
      WriteLog(Format('Подключение пользователя "%s".',[Self.UserName]));
   finally
      qTemp.Close;
   end;
end;

procedure TOtherAreaRDM.Logout;
begin

   DB.CloseDataSets;
   UserID:=0;
   WriteLog(Format('Отключение пользователя "%s".',[UserName]));
   UserName:='';
   IsAdmin:=False;
end;

function TOtherAreaRDM.CheckUserLogin(DoException:boolean=True):boolean;
const
  ErrorMessage='Не санкционированный доступ.';
begin
Result:=UserID<>0;
if not Result then begin
 WriteLog(ErrorMessage);
 if DoException then raise Exception.Create(ErrorMessage);
end;
end;

procedure TOtherAreaRDM.SetLogProcedure(prog : TLogProc);
begin
LogProcedure:=prog;
end;

procedure TOtherAreaRDM.WriteLog(ss:string);
begin
if Assigned(LogProcedure) then LogProcedure(ss);
end;

procedure TOtherAreaRDM.CheckSQLRight(ID : integer);
const
 RightSQL='select r.assigned, 1 as orderfield '+
          'from implement i, user_right4sql r ,user_roles u '+
          'where i.id=%d and u.user_id=%d and u.role_id=r.user_id '+
          'and i.id=r.sql_id '+
          'union '+
          'select r.assigned, 2 as orderfield '+
          'from implement i, user_right r, user_roles u '+
          'where i.id=%d and u.user_id=%d and u.role_id=r.user_id '+
          'and i.app_id=r.app_id  '+
          'order by 2,1 desc';
 ErrorMessage2='Нет прав на эту операцию.';
var
   sql:string;
begin
   sql:=RightSQL;
   qTemp.SQl.Clear;
   qTemp.SQL.Add(Format(sql,[ID,UserID,ID,UserID]));
   qTemp.Open;
   try
      if (qTemp.RecordCount=0) or
         (qTemp.Fields[0].asInteger and arExecute=0) then Raise Exception.Create(ErrorMessage2);
   finally
      qTemp.Close;
   end;
end;

procedure TOtherAreaRDM.StartTransaction;
begin
CheckUserLogin;
if TransCount=0 then DB.StartTransaction;
Inc(TransCount);
end;

procedure TOtherAreaRDM.Commit;
begin
CheckUserLogin;
if TransCount=0 then Raise Exception.Create('Commit');
if TransCount>0 then begin
   Dec(TransCount);
   if TransCount=0 then DB.Commit;
end;
end;

procedure TOtherAreaRDM.Rollback;
begin
CheckUserLogin;
if TransCount=0 then Raise Exception.Create('Rollback');
if TransCount>0 then begin
   Dec(TransCount);
   if TransCount=0 then DB.Rollback;
end;
end;


function TOtherAreaRDM.DoOperation(ID: Integer; IsOperation: WordBool;
  Params: OleVariant): OleVariant;
begin
   Result:=null;
   CheckUserLogin;
   StartTransaction;
   try
      if IsOperation then Result:=InternalDoOperation(ID,Params)
      else Result:=InternalDoSQL(ID,Params);
      Commit;
      LastOperationError:='';
   except
      on E:Exception do begin
         Rollback;
         LogError(E.Message);
         LastOperationError:=E.Message;
         raise Exception.Create(E.Message);
      end;
   end;
end;

function TOtherAreaRDM.OperationError: OleVariant;
begin
CheckUserLogin;
Result:=LastOperationError;
end;

function TOtherAreaRDM.InternalDoOperation(ID: Integer; Params: OleVariant): OleVariant;
var
  i:integer;
begin
   Result:=null;
   try
      for i:=0 to OperationList.ActionCount-1 do begin
         if OperationList.Actions[i].Tag=ID then begin
            OperationParams:=Params;
            OperationList.Actions[i].Execute;
            Result:=OperationResult;
         end;
      end;
   finally
      OperationParams:=null;
      OperationResult:=null;
   end;
end;

function TOtherAreaRDM.InternalDoSQL(ID: Integer; Params: OleVariant): OleVariant;
const
   sql='select sql from implement where id=%d';
   ErrorMessage1='Неверный код операции (реализации).';
   ErrorMessage2='Не совпадает кол-во параметров.';
   ErrorMessage3='Недопустимый тип параметра.';
   errBadMacroType='Недопустимый тип значения макро подстановки.';
   errParamNotDefined='Параметр %s не определен.';
   errBadMasterCount='Неверное кол-во основных параметров.';

var
   ssql,Pname:string;
   i,ps,pe,cnt:integer;
   VType:Integer;
   FType:TFieldType;
   Param:TParam;
   tmp:TStringList;
begin
CheckSQLRight(ID);
FType:=ftUnknown;
Result:=null;
qTemp.Params.Clear;
qTemp.ParamCheck:=False;
tmp:=TStringList.Create;
try

   //get sql text-------------------------------------------------
   qTemp.SQl.Clear;
   qTemp.SQL.Add(Format(sql,[ID]));
   qTemp.Open;
   try
      if qTemp.RecordCount=0 then Raise Exception.Create(ErrorMessage1);
      ssql:=qTemp.Fields[0].asString;
   finally
      qTemp.Close;
   end;
   //check params count----------------
   if not VarIsNull(Params) then begin
      //провер кол-во параметров
      cnt:=VarArrayHighBound(Params,1)+1;
      if (cnt<2)or(cnt>3) then raise Exception.Create(errBadMasterCount);
      // совпадает ли кол-во параметров
      if VarArrayHighBound(Params[0],1)<>VarArrayHighBound(Params[1],1) then
                                                Raise Exception.Create(ErrorMessage2);
      //удаление указанных строк
      if (cnt=3) then begin
         tmp.Text:=ssql;
         cnt:=VarArrayHighBound(Params[2],1);
         for i:=0 to cnt do
            if (tmp.Count-1)>=Params[2][i] then tmp.Strings[Params[2][i]]:=' ';
         ssql:=tmp.Text;
      end;
      //Подстановка макросов------
      cnt:=VarArrayHighBound(Params[0],1);
      for i:=0 to cnt do begin
         if String(Params[0][i])[1]=':' then begin //is macro
            VType:=VarType(Params[1][i]);
            if (VType<>varString)and
               (VType<>varOleStr)then Raise Exception.Create(errBadMacroType);
               ssql:=ReplaceStr(ssql,Params[0][i]+':',Params[1][i]);
         end;
      end;
      //create params----------------------------------------------
      ps:=Pos(':',ssql);
      while ps<>0 do begin
         //get param name
         pe:=ps+1;
         PName:=ExtractSubstr(ssql,pe,[':']);
         //search name in array
         i:=0;
         while (i<=cnt)and (Pname<>Params[0][i]) do Inc(i);
         if (i<=cnt) then begin //param found-----------
            //Replace param name to ?------------------------
            Delete(ssql,ps,pe-ps);
            Insert('?', ssql,ps);
            //prepare query.Params-----------------------
            VType:=VarType(Params[1][i]);
            case VType of     //type translate
                   varNull: FType:=ftInteger ;
               varSmallint: FType:=ftSmallint ;
                varInteger: FType:=ftInteger ;
                 varSingle: FType:=ftFloat ;
                 varDouble: FType:=ftFloat ;
               varCurrency: FType:=ftCurrency ;
                   varDate: FType:=ftDateTime ;
                varBoolean: FType:=ftBoolean ;
                varVariant: FType:=ftBlob ;
                 varString: FType:=ftString ;
                 varOleStr: FType:=ftString ;
                       else raise Exception.Create(ErrorMessage3);
            end;
            Param:=TParam.Create(nil);
            Param.DataType:=FType;
            Param.Value:=Params[1][i];
            qTemp.Params.AddParam(Param);
         end
         else raise exception.CreateFmt(errParamNotDefined,[PName]);

         ps:=Pos(':',ssql);
      end;
   end;//if not VarIsNull(Params)
   qTemp.SQL.Clear;
   qTemp.SQL.Add(ssql);
   //if select get data else execute sql------------------------
   DelBSpace(ssql);
   if UpperCase(Copy(ssql,1,6))='SELECT' then begin
      cTemp.Open;
      try
         if (cTemp.RecordCount>1) or
            (cTemp.FieldDefs.Count>1) or
            Select_Always_Return_Dataset then Result:=cTemp.Data
         else Result:=cTemp.Fields[0].Value;
      finally
        cTemp.Close;
      end;
   end
   else begin
      qTemp.ExecSQL;
      LogExecutedSQL(ssql);
   end;
finally
   tmp.Free;
   qTemp.ParamCheck:=True;
   qTemp.Params.Clear;
end;
end;

procedure TOtherAreaRDM.LogExecutedSQL(sql: string);
begin
WriteLog('Пользователь: '+UserName+
         ' Время: '+DateToStr(Date)+' '+TimeToStr(Time)+#13#10+
         'Команда '+sql+#13#10'--------------------------------------------');
end;

procedure TOtherAreaRDM.LogError(err: string);
begin
if Debug then ShowMessage(Err);
WriteLog('Пользователь: '+UserName+
         ' Время: '+DateToStr(Date)+' '+TimeToStr(Time)+#13#10+
         'Ошибка '+err+#13#10'--------------------------------------------');
end;

procedure TOtherAreaRDM.CheckLogin(DataSet: TDataSet);
begin
CheckUserLogin;
end;

procedure TOtherAreaRDM.LogSQL(ModifySQL: String);
begin
LogExecutedSQL(ModifySQL);
end;

function TOtherAreaRDM.GetNextID: Integer;
const
  sel='SELECT %s.NEXTVAL FROM DUAL';
var
 gen_name:string;
begin
  CheckUserLogin;
  with qTemp do begin
     if Default_Generator='' then gen_name:='G_SINGLE_ID'
     else gen_name:=Default_Generator;
     SQL.Clear;
     SQL.Add(Format(sel,[gen_name]));
     Open;
     try
        Result:=Fields[0].asInteger;
     finally
        Close;
     end;
  end;
end;



function TOtherAreaRDM.ExecutionPosible(IDs: OleVariant): WordBool;
var
i,hi:integer;
begin
CheckUserLogin;
Result:=False;
case VarType(IDs) of
   varEmpty,
   varNull:exit;
   varInteger:begin
                 try
                    CheckSQLRight(IDs);
                 except
                    exit;
                 end;
              end;
         else begin
                 hi:=VarArrayHighBound(IDs,1);
                 for i:=0 to hi do begin
                    try
                       CheckSQLRight(IDs[i]);
                    except
                       exit;
                    end;
                 end;
              end;
end;
Result:=True;
end;

procedure TOtherAreaRDM.Ping;
begin

end;

procedure TOtherAreaRDM.qTempAfterOpen(DataSet: TDataSet);
begin
try
qTemp.FieldByName('ID').ProviderFlags:=[pfInUpdate,pfInWhere,pfInKey];
except
end;
end;
