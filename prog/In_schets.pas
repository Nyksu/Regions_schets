unit In_schets;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, RXDBCtrl, ExtCtrls, Db, DBClient, StdCtrls, Buttons,
  DBCtrls, New_in_schet, Ask_dlg, Reestrs_schets, Mask_filtr, Zn_uslovie,
  Get_str, get_sum, get_dat, get_db_list, prn_lst_in_sch;

type
  Tfr_schets_in = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    RxDBGrid1: TRxDBGrid;
    cds_schets_in: TClientDataSet;
    ds_schets_in: TDataSource;
    bt_reg_schet_in: TBitBtn;
    Label1: TLabel;
    DBText1: TDBText;
    bt_reestrs: TBitBtn;
    DBMemo1: TDBMemo;
    Label2: TLabel;
    cds_koment: TClientDataSet;
    ds_koment: TDataSource;
    RadioGroup1: TRadioGroup;
    bt_del_schet: TBitBtn;
    bt_exit: TBitBtn;
    Label3: TLabel;
    DBText2: TDBText;
    lb_filtr: TLabel;
    bt_filtr: TBitBtn;
    bt_prn_list: TBitBtn;
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure bt_reg_schet_inClick(Sender: TObject);
    procedure bt_del_schetClick(Sender: TObject);
    procedure bt_reestrsClick(Sender: TObject);
    procedure bt_exitClick(Sender: TObject);
    procedure bt_filtrClick(Sender: TObject);
    procedure bt_prn_listClick(Sender: TObject);
  private
    id_state : integer;
    pr_f_name : variant;
    pr_f_val : variant;
    pr_f_tip : variant;
    pr_f_chk : variant;
    pr_f_fnam : variant;
    Procedure OnFilfer(p : variant);
    { Private declarations }
  public
    procedure ReScan;
    { Public declarations }
  end;

Procedure Start_in_schets;

var
  fr_schets_in: Tfr_schets_in;

implementation

uses MainDM;

{$R *.DFM}

Procedure Tfr_schets_in.ReScan;
var
  res : variant;
begin
  Case RadioGroup1.ItemIndex of
     0 : Begin
          Screen.Cursor:=crHourglass;
          try
           try
           Panel2.Caption:='Не погашеные счета';
           //If cds_schets_in.Active Then cds_schets_in.DeleteIndex('ind1');
           cds_schets_in.Active:=false;
           cds_koment.Active:=false;
           res:=DM.GetData(22,null);
           cds_schets_in.Data:=res;
           //cds_schets_in.AddIndex('ind1', 'short_name;date_schet', [ixCaseInsensitive],'','',0);
           //cds_schets_in.IndexName:='ind1';
           res:=DM.GetData(23,null);
           cds_koment.Data:=res;
           If id_state>0 Then
                cds_schets_in.locate('id',id_state,[loCaseInsensitive])
           Else id_state:=cds_schets_in.FieldByName('id').AsInteger;
           finally
             Screen.Cursor:=crDefault;
           end;
          except
          end;
         end;
     1 : Begin
          Screen.Cursor:=crHourglass;
          try
           try
           Panel2.Caption:='Погашеные счета';
           //If cds_schets_in.Active Then cds_schets_in.DeleteIndex('ind1');
           cds_schets_in.Active:=false;
           cds_koment.Active:=false;
           res:=DM.GetData(82,null);
           cds_schets_in.Data:=res;
           //cds_schets_in.AddIndex('ind1', 'short_name;date_schet', [ixCaseInsensitive],'','',0);
           //cds_schets_in.IndexName:='ind1';
           cds_schets_in.Last;
           res:=DM.GetData(83,null);
           cds_koment.Data:=res;
           If id_state>0 Then
                cds_schets_in.locate('id',VarArrayOf([id_state]),[loCaseInsensitive])
           Else id_state:=cds_schets_in.FieldByName('id').AsInteger;
           finally
             Screen.Cursor:=crDefault;
           end;
          except
          end;
         end;
  end;
end;

Procedure Start_in_schets;
Begin
  try
    try
     fr_schets_in:=Tfr_schets_in.Create(Application);
     fr_schets_in.ShowModal;
    finally
     fr_schets_in.Free;
    end;
  except
  end;
end;

procedure Tfr_schets_in.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  //If
end;

procedure Tfr_schets_in.FormCreate(Sender: TObject);
{var
  res : variant;}
begin
   // If fr_schets_in.Top<124 Then fr_schets_in.Top:=124;
   {res:=DM.GetData(22,null);
   cds_schets_in.Data:=res;
   cds_schets_in.AddIndex('ind1', 'short_name;date_schet', [ixCaseInsensitive],'','',0);
   cds_schets_in.IndexName:='ind1';
   res:=DM.GetData(23,null);
   cds_koment.Data:=res;}
   id_state:=0;
   //0 Номер счета, 1 Дата выписки, 2 Предъявитель, 3 Сумма
   pr_f_name:=VarArrayCreate([0, 3], varVariant);
   pr_f_val:=VarArrayCreate([0, 3], varVariant);
   pr_f_tip:=VarArrayCreate([0, 3], varVariant);
   pr_f_chk:=VarArrayCreate([0, 3], varVariant);
   pr_f_fnam:=VarArrayCreate([0, 3], varVariant);
   pr_f_name[0]:='Номер счета';
   pr_f_name[1]:='Дата выписки';
   pr_f_name[2]:='Предъявитель';
   pr_f_name[3]:='Сумма';
   pr_f_val[0]:='';
   pr_f_val[1]:=StrToDate('01.01.2000');
   pr_f_val[2]:=0;
   pr_f_val[3]:=0.0;
   pr_f_tip[0]:=1; // 0 - число, 1 - строка, 3-список
   pr_f_tip[1]:=0;
   pr_f_tip[2]:=3;
   pr_f_tip[3]:=0;
   pr_f_chk[0]:=false;
   pr_f_chk[1]:=false;
   pr_f_chk[2]:=false;
   pr_f_chk[3]:=false;
   pr_f_fnam[0]:='nomer';
   pr_f_fnam[1]:='date_schet';
   pr_f_fnam[2]:='urpers_id';
   pr_f_fnam[3]:='sum_schet';
   ReScan;
end;

procedure Tfr_schets_in.RadioGroup1Click(Sender: TObject);
begin
  id_state:=0;
  ReScan;
end;

procedure Tfr_schets_in.bt_reg_schet_inClick(Sender: TObject);
begin
   fr_schets_in.Visible:=false;
   try
    New_schet_in;
   finally
    fr_schets_in.Visible:=true;
   end;
   id_state:=cds_schets_in.FieldByName('id').AsInteger;
   //ReScan;
end;

procedure Tfr_schets_in.bt_del_schetClick(Sender: TObject);
var
  ful_param,par_names,par_val : variant;
  id,id_k : integer;
begin
  If Get_Answer('ВНИМАНИЕ !!! УДАЛЕНИЕ СЧЕТА !!!',
                'Вы действительно хотите удалить счет ?!',false) Then
     If cds_schets_in.Active Then Begin
        If cds_schets_in.FieldByName('sum_schet').AsFloat<>0 Then Begin
           ShowMessage('Сначала необходимо удалить реестры по счету!!!');
           Exit;
        end;
        id:=cds_schets_in.FieldByName('id').AsInteger;
        If VarIsNull(cds_schets_in.FieldByName('coment_id').Value) Then Begin
          ful_param:=VarArrayCreate([1,3],varVariant);
          ful_param[1]:=1;
          ful_param[2]:=VarArrayOf([102]);
          par_names:=VarArrayOf([':id']);
          par_val:=VarArrayOf([IntToStr(id)]);
          ful_param[3]:=VarArrayOf([par_names,par_val]);
        end
        Else Begin
          id_k:=cds_schets_in.FieldByName('coment_id').AsInteger;
          ful_param:=VarArrayCreate([1,4],varVariant);
          ful_param[1]:=2;
          ful_param[2]:=VarArrayOf([102,103]);
          par_names:=VarArrayOf([':id']);
          par_val:=VarArrayOf([IntToStr(id_k)]);
          ful_param[4]:=VarArrayOf([par_names,par_val]);
          par_val:=VarArrayOf([IntToStr(id)]);
          ful_param[3]:=VarArrayOf([par_names,par_val]);
        end;
        DM.DoOperation(101,true,ful_param);
        id_state:=0;
        ReScan;
     end;
end;

procedure Tfr_schets_in.bt_reestrsClick(Sender: TObject);
begin
  If cds_schets_in.FieldByName('id').AsInteger>0 Then Begin end Else Exit;
  fr_schets_in.Visible:=false;
  try
    StartReestr(cds_schets_in.FieldByName('id').AsInteger,
                cds_schets_in.FieldByName('nomer').AsString,
                cds_schets_in.FieldByName('date_schet').AsString,
                cds_schets_in.FieldByName('short_name').AsString);
  finally
    fr_schets_in.Visible:=true;
  end;
  id_state:=cds_schets_in.FieldByName('id').AsInteger;
  ReScan;
end;

procedure Tfr_schets_in.bt_exitClick(Sender: TObject);
begin
  fr_schets_in.Close;
end;

procedure Tfr_schets_in.bt_filtrClick(Sender: TObject);
var
  par : variant;
begin
   par:=VarArrayCreate([0, 1], varVariant);
   par[0]:=pr_f_name;
   par[1]:=pr_f_chk;
   If Get_filtr_mask(par) Then OnFilfer(par);
end;

Procedure Tfr_schets_in.OnFilfer(p : variant);
var
 ii,rrs : integer;
 stat_f : boolean;
 str_f,znachek,ss : string;
 dd : TDateTime;
 rr : real;
 dan_spr,par,par_val,par_name,pp : variant;
Begin
  If (pr_f_chk[0]<>p[0])or(pr_f_chk[1]<>p[1])or(pr_f_chk[2]<>p[2])or(pr_f_chk[3]<>p[3])
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
                 2 : Begin  //Предъявитель
                       par_val:=VarArrayOf([200,499]);
                       par_name:=VarArrayOf(['type_s','type_po']);
                       par:=VarArrayOf([par_name,par_val]);
                       dan_spr:=DM.GetData(86,par);
                       Get_Znak(pr_f_tip[ii],znachek);
                       pp:=null;
                       par_val:=VarArrayOf(['id',pr_f_val[ii]]);
                       pp:=GetDBList('Параметры фильтра',
                                     'Выбирите Предъявителя счета',
                                     'id','short_name',
                                     'Для быстрого поиска предъявителя введите часть его наименования',
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
            end;
         end;
     lb_filtr.Visible:=stat_f;
     cds_schets_in.filtered:=false;
     cds_schets_in.filter:=str_f;
     cds_schets_in.filtered:=stat_f;
     //ShowMessage(str_f);
  end;
end;

procedure Tfr_schets_in.bt_prn_listClick(Sender: TObject);
var
  fol : boolean;
begin
  Case RadioGroup1.ItemIndex of
    0 : fol:=false;
    1 : fol:=true;
  end;
  If cds_schets_in.Filtered Then
               Prn_In_Schets_lst(fol,cds_schets_in.data,cds_schets_in.Filter)
  Else Prn_In_Schets_lst(fol,cds_schets_in.data,'');
end;

end.
