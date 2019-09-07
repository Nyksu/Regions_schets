unit Out_schets;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids, RXDBCtrl, ExtCtrls, DBCtrls, Db,
  DBClient, New_out_schet, Prn_schet, StrUtils, Ask_dlg, del_vozvrat, get_sum,
  Get_str, Mask_filtr, Zn_uslovie, get_dat, get_db_list, prn_lst_out_sch,
  Get_list_id;

type
  Tfr_schets_out = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    RxDBGrid1: TRxDBGrid;
    bt_exit: TBitBtn;
    bt_reg_schet_in: TBitBtn;
    bt_del_schet: TBitBtn;
    RadioGroup1: TRadioGroup;
    DBMemo1: TDBMemo;
    Label2: TLabel;
    cds_koment: TClientDataSet;
    ds_koment: TDataSource;
    ds_schets_out: TDataSource;
    cds_schets_out: TClientDataSet;
    bt_prn: TBitBtn;
    lb_filtr: TLabel;
    bt_filtr: TBitBtn;
    bt_vos: TBitBtn;
    bt_vos_back: TBitBtn;
    bt_prn_list: TBitBtn;
    procedure bt_exitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure ds_schets_outDataChange(Sender: TObject; Field: TField);
    procedure bt_reg_schet_inClick(Sender: TObject);
    procedure bt_del_schetClick(Sender: TObject);
    procedure bt_prnClick(Sender: TObject);
    procedure bt_vosClick(Sender: TObject);
    procedure bt_vos_backClick(Sender: TObject);
    procedure bt_filtrClick(Sender: TObject);
    procedure bt_prn_listClick(Sender: TObject);
  private
    pr_f_name : variant;
    pr_f_val : variant;
    pr_f_tip : variant;
    pr_f_chk : variant;
    pr_f_fnam : variant;
    Procedure OnFilfer(p : variant);
    procedure RescanSchets;
    procedure RescanComent;
    { Private declarations }
  public
    { Public declarations }
  end;


Procedure ShowSchetsOut;

var
  fr_schets_out: Tfr_schets_out;

implementation

Uses MainDM;

{$R *.DFM}

Procedure ShowSchetsOut;
Begin
  try
    try
      fr_schets_out:=Tfr_schets_out.Create(Application);
      fr_schets_out.ShowModal;
    finally
      fr_schets_out.Free;
    end;
  except
  end;
end;

procedure Tfr_schets_out.bt_exitClick(Sender: TObject);
begin
   fr_schets_out.Close;
end;

procedure Tfr_schets_out.RescanSchets;
var
  res : variant;
begin
  Screen.Cursor:=crHourglass;
  try
    try
      If cds_schets_out.Active Then cds_schets_out.DeleteIndex('ind1');
      cds_schets_out.Active:=false;
      Case RadioGroup1.ItemIndex of
         0 : Begin
               res:=DM.GetData(3067,null);
               Panel2.Caption:='Не погашеные счета';
             end;
         1 : Begin
               res:=DM.GetData(3068,null);
               Panel2.Caption:='Погашеные счета';
             end;
      end;
      cds_schets_out.Data:=res;
      cds_schets_out.AddIndex('ind1', 'short_name;date_schet', [ixCaseInsensitive],'','',0);
      cds_schets_out.IndexName:='ind1';
    finally
      Screen.Cursor:=crDefault;
    end;
  except
  end;
end;

procedure Tfr_schets_out.RescanComent;
var
  params_n, params_v : variant;
Begin
   If (cds_schets_out.Active) and (cds_schets_out.FieldByName('id').AsInteger>0) Then
   Begin
     params_n:=VarArrayOf(['kod']);
     params_v:=VarArrayOf([cds_schets_out.FieldByName('coment_id').AsInteger]);
   end;
end;

procedure Tfr_schets_out.FormCreate(Sender: TObject);
begin
   //0 Номер счета, 1 Дата выписки, 2 Плательщик, 3 Сумма, 4 Получатель
   pr_f_name:=VarArrayCreate([0, 5], varVariant);
   pr_f_val:=VarArrayCreate([0, 5], varVariant);
   pr_f_tip:=VarArrayCreate([0, 5], varVariant);
   pr_f_chk:=VarArrayCreate([0, 5], varVariant);
   pr_f_fnam:=VarArrayCreate([0, 5], varVariant);
   pr_f_name[0]:='Номер счета';
   pr_f_name[1]:='Дата выписки';
   pr_f_name[2]:='Плательщик';
   pr_f_name[3]:='Сумма';
   pr_f_name[4]:='Получатель';
   pr_f_name[5]:='Номер входящего счета';
   pr_f_val[0]:='';
   pr_f_val[1]:=StrToDate('01.01.2000');
   pr_f_val[2]:=0;
   pr_f_val[3]:=0.0;
   pr_f_val[4]:=null;
   pr_f_val[5]:='';
   pr_f_tip[0]:=1; // 0 - число, 1 - строка, 3-список
   pr_f_tip[1]:=0;
   pr_f_tip[2]:=3;
   pr_f_tip[3]:=0;
   pr_f_tip[4]:=3;
   pr_f_tip[5]:=1;
   pr_f_chk[0]:=false;
   pr_f_chk[1]:=false;
   pr_f_chk[2]:=false;
   pr_f_chk[3]:=false;
   pr_f_chk[4]:=false;
   pr_f_chk[5]:=false;
   pr_f_fnam[0]:='nomer';
   pr_f_fnam[1]:='date_schet';
   pr_f_fnam[2]:='mso_id';
   pr_f_fnam[3]:='summa';
   pr_f_fnam[4]:='id';
   pr_f_fnam[5]:='id';
   RescanSchets;
end;

procedure Tfr_schets_out.RadioGroup1Click(Sender: TObject);
begin
  RescanSchets;
end;

procedure Tfr_schets_out.ds_schets_outDataChange(Sender: TObject;
  Field: TField);
begin
  RescanComent;
end;

procedure Tfr_schets_out.bt_reg_schet_inClick(Sender: TObject);
begin
  New_oun_schet;
  RescanSchets;
end;

procedure Tfr_schets_out.bt_del_schetClick(Sender: TObject);
var
  ful_param,par_names,par_val : variant;
  id,id_k : integer;
begin
  If Get_Answer('ВНИМАНИЕ !!! УДАЛЕНИЕ СЧЕТА !!!',
                'Вы действительно хотите удалить счет ?!',false) Then
     If cds_schets_out.Active Then Begin
        id:=cds_schets_out.FieldByName('id').AsInteger;
        If VarIsNull(cds_schets_out.FieldByName('coment_id').Value) Then Begin
          ful_param:=VarArrayCreate([1,3],varVariant);
          ful_param[1]:=1;
          ful_param[2]:=VarArrayOf([3161]);
          par_names:=VarArrayOf([':id']);
          par_val:=VarArrayOf([IntToStr(id)]);
          ful_param[3]:=VarArrayOf([par_names,par_val]);
        end
        Else Begin
          id_k:=cds_schets_out.FieldByName('coment_id').AsInteger;
          ful_param:=VarArrayCreate([1,4],varVariant);
          ful_param[1]:=2;
          ful_param[2]:=VarArrayOf([3161,103]);
          par_names:=VarArrayOf([':id']);
          par_val:=VarArrayOf([IntToStr(id_k)]);
          ful_param[4]:=VarArrayOf([par_names,par_val]);
          par_val:=VarArrayOf([IntToStr(id)]);
          ful_param[3]:=VarArrayOf([par_names,par_val]);
        end;
        DM.DoOperation(101,true,ful_param);
        RescanSchets;
     end;
end;

procedure Tfr_schets_out.bt_prnClick(Sender: TObject);
var
  dt,par_val,par_name,par : variant;
  s_su : string;
begin
   If not cds_schets_out.Active Then Exit;
   If cds_schets_out.RecordCount<=0 Then Exit;
   par_val:=VarArrayOf([cds_schets_out.FieldByName('id').Value]);
   par_name:=VarArrayOf(['id']);
   par:=VarArrayOf([par_name,par_val]);
   dt:=DM.GetData(3620,par);
   s_su:=FloatToStr(cds_schets_out.FieldByName('summa').AsFloat);
   s_su:=ReplaceStr(s_su,'.',',');
   Schet_prn(dt,cds_schets_out.FieldByName('nomer').AsInteger,
             DateToStr(cds_schets_out.FieldByName('date_schet').AsDateTime),
             s_su,cds_schets_out.FieldByName('short_name').AsString);
end;

procedure Tfr_schets_out.bt_vosClick(Sender: TObject);
var
  sum,sum_ost : real;
  par,par_val,par_nam : variant;
  n_id : integer;
  rr : boolean;
begin
 sum:=0;
 If cds_schets_out.FieldByName('id').AsInteger>0 Then Begin
    rr:=GetSumm(sum,'Зачет возврата по счету','Введите сумму возврата');
    //процедура занесения в базу изменений
    par_nam:=VarArrayOf(['id_s','sum','id_vz']);
    n_id:=DM.GetNextID;
    par_val:=VarArrayOf([cds_schets_out.FieldByName('id').AsInteger,sum,n_id]);
    par:=VarArrayOf([par_nam,par_val]);
    If (rr)and(sum<>0) Then Begin
     DM.StartTrans;
     try
     DM.DoOperation(3476,false,par);
     except
       DM.Rollback;
       Raise;
       Exit;
     end;
     DM.Commit;
     RescanSchets;
    end;
  end;
end;

procedure Tfr_schets_out.bt_vos_backClick(Sender: TObject);
var
  id_v : integer;
  sum : real;
  param,par_val,par_nam : variant;
begin
   If cds_schets_out.FieldByName('id').AsInteger>0 Then
     If DelVosvrat(id_v, cds_schets_out.FieldByName('id').AsInteger,1,sum) Then Begin
       par_nam:=VarArrayOf(['id_vz']);
       par_val:=VarArrayOf([id_v]);
       param:=VarArrayOf([par_nam,par_val]);
       DM.StartTrans;
       try
         DM.DoOperation(3481,false,param);
       except
         DM.Rollback;
         Raise;
         Exit;
       end;
       DM.Commit;
       RescanSchets;
     end;
end;

procedure Tfr_schets_out.bt_filtrClick(Sender: TObject);
var
  par : variant;
begin
   par:=VarArrayCreate([0, 1], varVariant);
   par[0]:=pr_f_name;
   par[1]:=pr_f_chk;
   If Get_filtr_mask(par) Then OnFilfer(par);
end;

Procedure Tfr_schets_out.OnFilfer(p : variant);
var
 ii,rrs : integer;
 stat_f : boolean;
 str_f,znachek,ss : string;
 dd : TDateTime;
 rr : real;
 dan_spr,par,par_val,par_name,pp : variant;
Begin
  If (pr_f_chk[0]<>p[0])or(pr_f_chk[1]<>p[1])or(pr_f_chk[2]<>p[2])or(pr_f_chk[3]<>p[3])
      or(pr_f_chk[4]<>p[4])or(pr_f_chk[5]<>p[5])
    Then Begin
     stat_f:=false;
     pr_f_chk:=p;
     str_f:='';
     For ii:=0 To VarArrayHighBound(pr_f_chk,1) Do
         If p[ii] Then Begin     //pr_f_tip 0 - число, 1 - строка, 3-список
            ShowMessage('Выбор знака для условия: '+pr_f_name[ii]);
            If stat_f Then str_f:=str_f+' and ' Else  stat_f:=true;
            Case ii of
                 0 : Begin  //Номер счета
                       Get_Znak(pr_f_tip[ii],znachek);
                       ss:='';
                       ss:=Get_Str_Par('Параметры филтра',pr_f_name[ii]
                                                 ,'Введите номер счета:',pr_f_val[ii]);
                       pr_f_val[ii]:=ss;
                       str_f:=str_f+pr_f_fnam[ii]+' '+znachek+' '+#39+pr_f_val[ii];
                       If znachek='like' Then str_f:=str_f+'%';
                       str_f:=str_f+#39;
                     end;
                 1 : Begin  //Дата выписки
                       rrs:=Get_Znak(pr_f_tip[ii],znachek);
                       If rrs>5 Then Begin
                          dd:=pr_f_val[ii];
                          GetDat(dd,'Параметры филтра','Введите начальную дату:');
                          pr_f_val[ii]:=dd;
                          str_f:=str_f+pr_f_fnam[ii]+' '+znachek+' '+#39+DateToStr(pr_f_val[ii])+#39;
                          GetDat(dd,'Параметры филтра','Введите конечную дату:');
                          pr_f_val[ii]:=dd;
                          str_f:=str_f+' and ';
                          If znachek='>' Then znachek:='<' Else znachek:='<=';
                          str_f:=str_f+pr_f_fnam[ii]+' '+znachek+' '+#39+DateToStr(pr_f_val[ii])+#39;
                       end
                       Else Begin
                          dd:=pr_f_val[ii];
                          GetDat(dd,'Параметры филтра','Введите дату:');
                          pr_f_val[ii]:=dd;
                          str_f:=str_f+pr_f_fnam[ii]+' '+znachek+' '+#39+DateToStr(pr_f_val[ii])+#39;
                       end;
                     end;
                 2 : Begin  //Плательщик
                       par_val:=VarArrayOf([200,299,500,599]);
                       par_name:=VarArrayOf(['type_s','type_po','type_s1','type_po1']);
                       par:=VarArrayOf([par_name,par_val]);
                       dan_spr:=DM.GetData(1544,par);
                       Get_Znak(pr_f_tip[ii],znachek);
                       pp:=null;
                       par_val:=VarArrayOf(['id',pr_f_val[ii]]);
                       pp:=GetDBList('Параметры филтра',
                                     'Выбирите Плательщика по счета',
                                     'id','short_name',
                                     'Для быстрого поиска плательщика введите часть его наименования',
                                     par_val,dan_spr);
                       If not VarIsNull(pp) Then Begin
                          pr_f_val[ii]:=pp;
                       end
                       Else Begin
                          pr_f_val[ii]:=0;
                       end;
                       str_f:=str_f+pr_f_fnam[ii]+' '+znachek+' '+IntToStr(pr_f_val[ii]);
                     end;
                 3 : Begin  //Сумма
                       rrs:=Get_Znak(pr_f_tip[ii],znachek);
                       If rrs>5 Then Begin
                         rr:=pr_f_val[ii];
                         GetSumm(rr,'Параметры филтра','Введите мин. сумму счета:');
                         pr_f_val[ii]:=rr;
                         str_f:=str_f+pr_f_fnam[ii]+' '+znachek+' '+FloatToStr(pr_f_val[ii]);
                         GetSumm(rr,'Параметры филтра','Введите макс. сумму счета:');
                         pr_f_val[ii]:=rr;
                         str_f:=str_f+' and ';
                         If znachek='>' Then znachek:='<' Else znachek:='<=';
                         str_f:=str_f+pr_f_fnam[ii]+' '+znachek+' '+FloatToStr(pr_f_val[ii]);
                       end
                       Else Begin
                         GetSumm(rr,'Параметры филтра','Введите сумму счета:');
                         pr_f_val[ii]:=rr;
                         str_f:=str_f+pr_f_fnam[ii]+' '+znachek+' '+FloatToStr(pr_f_val[ii]);
                       end;
                     end;
                 4 : Begin  //Получатель
                       par_val:=VarArrayOf([200,499]);
                       par_name:=VarArrayOf(['type_s','type_po']);
                       par:=VarArrayOf([par_name,par_val]);
                       dan_spr:=DM.GetData(3661,par);
                       Get_Znak(pr_f_tip[ii],znachek);
                       pp:=null;
                       par_val:=VarArrayOf(['id',pr_f_val[ii]]);
                       pp:=Get_id_list(dan_spr,'Выбирите Предъявителей по счетам',
                                     'Список доступрных предъявителей',
                                     'Список выбранных предъявителей');
                       pr_f_val[ii]:=pp;
                       If not VarIsNull(pp) Then Begin
                          pp:=DM.DbIdToInStr(pp);
                          par_val:=VarArrayOf([String(pp)]);
                          par_name:=VarArrayOf([':ids']);
                          par:=VarArrayOf([par_name,par_val]);
                          dan_spr:=DM.GetData(3660,par);
                          pp:=DM.DbIdToInStr(dan_spr);
                          If pp='' Then Begin
                            str_f:=str_f+pr_f_fnam[ii]+' is null';
                          end
                          Else begin
                             If  znachek='=' Then str_f:=str_f+pr_f_fnam[ii]
                             Else str_f:=str_f+'not '+pr_f_fnam[ii];
                             str_f:=str_f+' in ('+String(pp)+')';
                          end;
                       end
                       Else Begin
                          str_f:=str_f+pr_f_fnam[ii]+' is null';
                       end;
                       pr_f_val[ii]:=null;
                     end;
                 5 : Begin  //Номер входящего счета
                       Get_Znak(pr_f_tip[ii],znachek);
                       ss:='';
                       ss:=Get_Str_Par('Параметры филтра',pr_f_name[ii]
                                                 ,'Введите номер вход. счета:',pr_f_val[ii]);
                       pr_f_val[ii]:=ss;
                       ss:=znachek+' '+#39+pr_f_val[ii];
                       If znachek='like' Then ss:=ss+'%';
                       ss:=ss+#39;
                       par_val:=VarArrayOf([ss]);
                       par_name:=VarArrayOf([':uslov']);
                       par:=VarArrayOf([par_name,par_val]);
                       dan_spr:=DM.GetData(3680,par);
                       pp:=DM.DbIdToInStr(dan_spr);
                       If  znachek='like' Then znachek:='=';
                       If pp='' Then Begin
                         str_f:=str_f+pr_f_fnam[ii]+' is null';
                       end
                       Else begin
                             If  znachek='=' Then str_f:=str_f+pr_f_fnam[ii]
                             Else str_f:=str_f+'not '+pr_f_fnam[ii];
                             str_f:=str_f+' in ('+String(pp)+')';
                       end;
                     end;
            end;
         end;
     lb_filtr.Visible:=stat_f;
     cds_schets_out.filtered:=false;
     cds_schets_out.filter:=str_f;
     cds_schets_out.filtered:=stat_f;
     //ShowMessage(str_f);
  end;
end;

procedure Tfr_schets_out.bt_prn_listClick(Sender: TObject);
var
  fol : boolean;
begin
  Case RadioGroup1.ItemIndex of
    0 : fol:=false;
    1 : fol:=true;
  end;
  If cds_schets_out.Filtered Then
               Prn_Out_Schets_lst(fol,cds_schets_out.data,cds_schets_out.Filter)
  Else Prn_Out_Schets_lst(fol,cds_schets_out.data,'');
end;

end.
