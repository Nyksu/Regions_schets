unit PLAT_OUT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, DBCtrls, StdCtrls, ExtCtrls, Buttons, Db, DBClient, Ask_chislo,
  Menus, Bank_rekv, Mask, ToolEdit;

type
  Tfr_plat_out = class(TForm)
    Panel1: TPanel;
    ed_summ: TEdit;
    Label1: TLabel;
    ed_poluch: TDBLookupComboBox;
    Label2: TLabel;
    gr_restrs: TDBGrid;
    Label4: TLabel;
    bt_save: TBitBtn;
    bt_exit: TBitBtn;
    cds_poluchatel: TClientDataSet;
    cds_reestrs: TClientDataSet;
    ds_reestrs: TDataSource;
    ds_poluchatel: TDataSource;
    rg_type_urpers: TRadioGroup;
    pm_reestrs: TPopupMenu;
    N1: TMenuItem;
    rg_tip_platega: TRadioGroup;
    ed_date: TDateEdit;
    Label5: TLabel;
    Label3: TLabel;
    ed_srok_plat: TDateEdit;
    Label6: TLabel;
    ed_bank_date: TDateEdit;
    Label7: TLabel;
    procedure rg_type_urpersClick(Sender: TObject);
    procedure ds_poluchatelDataChange(Sender: TObject; Field: TField);
    procedure bt_exitClick(Sender: TObject);
    procedure gr_restrsDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bt_saveClick(Sender: TObject);
  private
    garant : boolean;
    sum_ost : real;
    procedure clear_all;
    procedure reset_urpers;
    procedure reset_reestrs;
    { Private declarations }
  public
    { Public declarations }
  end;


Procedure Out_plat;

var
  fr_plat_out: Tfr_plat_out;

implementation

Uses MainDM;

{$R *.DFM}

Procedure Out_plat;
Begin
   try
     try
       fr_plat_out:=Tfr_plat_out.Create(Application);
       fr_plat_out.ShowModal;
     finally
       fr_plat_out.Free;
     end;
   except
   end;
end;

procedure Tfr_plat_out.reset_urpers;
var
  res,par_val,par_name,par : variant;
Begin
  cds_poluchatel.Active:=false;
  Case rg_type_urpers.ItemIndex of
     0 : par_val:=VarArrayOf([200,299]);
     1 : par_val:=VarArrayOf([300,399]);
     2 : par_val:=VarArrayOf([400,499]);
  end;
  par_name:=VarArrayOf(['type_s','type_po']);
  par:=VarArrayOf([par_name,par_val]);
  res:=DM.GetData(86,par);
  cds_poluchatel.Data:=res;
end;

procedure Tfr_plat_out.reset_reestrs;
var
  res,par_val,par_name,par : variant;
Begin
  If not cds_poluchatel.active Then Exit;
  If cds_poluchatel.FieldByName('id').AsInteger>0 Then Begin
    cds_reestrs.Active:=false;
    par_val:=VarArrayOf([cds_poluchatel.FieldByName('id').AsInteger]);
    par_name:=VarArrayOf(['urpers']);
    par:=VarArrayOf([par_name,par_val]);
    res:=DM.GetData(3001,par);
    cds_reestrs.Data:=res;
  end;
end;


procedure Tfr_plat_out.rg_type_urpersClick(Sender: TObject);
begin
   reset_urpers;
end;

procedure Tfr_plat_out.ds_poluchatelDataChange(Sender: TObject;
  Field: TField);
begin
  reset_reestrs;
end;

procedure Tfr_plat_out.bt_exitClick(Sender: TObject);
begin
  fr_plat_out.Close;
end;

procedure Tfr_plat_out.gr_restrsDblClick(Sender: TObject);
var
  ch,plateg : real;
begin
   If not cds_reestrs.Active Then Exit;
   If cds_reestrs.RecordCount<=0 Then Exit;
   plateg:=cds_reestrs.FieldByName('plateg').AsFloat;
   ch:=Ask_real('Платеж по реестру','',plateg);
   If ch<0 Then Exit;
   If garant Then Begin
      try
       sum_ost:=StrToFloat(ed_summ.text);
      except
       MessageDlg('Неверные данные в числовых полях!!',mtWarning,[mbOK],0);
       Exit;
      end;
      ed_summ.Enabled:=false;
      rg_type_urpers.Enabled:=false;
      garant:=false;
   end;
   If StrToFloat(ed_summ.text)>0 Then
    If ch>sum_ost Then Begin
       MessageDlg('Сумма превышает ограниченную сумму!!',mtWarning,[mbOK],0);
       Exit;
    end;
   If ch>cds_reestrs.FieldByName('dolg').AsFloat Then Begin
       MessageDlg('Сумма превышает сумму реестра!!',mtWarning,[mbOK],0);
       Exit;
   end;
   cds_reestrs.Edit;
   cds_reestrs.FieldByName('plateg').AsFloat:=ch;
   cds_reestrs.post;
   sum_ost:=sum_ost-ch;
end;

procedure Tfr_plat_out.FormCreate(Sender: TObject);
begin
  garant:=true;
  reset_urpers;
  ed_date.date:=date;
  ed_srok_plat.date:=date;
  ed_bank_date.date:=date;
end;

procedure Tfr_plat_out.bt_saveClick(Sender: TObject);
var
  res,par_val,par_name,par : variant;
  next_nom, id_pp, id_plat, id_pol, id_reestr : integer;
  nasn, nom_sch : string;
  summa, sum_pl : real;
  rs_pol, ks_pol, bik_pol, inn_pol, bank_pol, bn_gor_pol, nm_pol : string;
  id_sch_pol : integer;
  rs_pl, ks_pl, bik_pl, inn_pl, bank_pl, bn_gor_pl, nm_pl : string;
  id_sch_pl, ii : integer;
  date_schet,sst : string;
  n_sch, sum_reestr, id_reest : TstringList;
begin
   If not cds_reestrs.Active Then Exit;
   If cds_reestrs.RecordCount<1 Then Exit;
   nasn:='За медуслуги по счету: ';
   cds_reestrs.First;
   summa:=0;
   res:=DM.GetData(3184,null);
   If VarIsNull(res) Then next_nom:=1 Else next_nom:=res;
   next_nom:=Round(Ask_real('Номер платежного поручения','',next_nom));
   //Получаем реквизиты банка получателя
   id_pol:=cds_poluchatel.FieldByName('id').AsInteger;
   res:=GetBankRecv(id_pol,0,cds_poluchatel.FieldByName('short_name').AsString);
   If VarIsNull(res) Then Begin
     MessageDlg('Платеж отменен!!!',mtError,[mbOK],0);
     Exit;
   end;
   id_sch_pol:=res[0];
   bank_pol:=res[1];
   rs_pol:=res[2];
   ks_pol:=res[3];
   bik_pol:=res[4];
   inn_pol:=res[5];
   bn_gor_pol:=res[6];
   nm_pol:=res[7];
   nm_pol:='ИНН:'+inn_pol+' '+nm_pol;
   bank_pol:=bank_pol+' '+bn_gor_pol;

   //Получаем реквизиты банка ТФОМСа
   id_plat:=DM.GetData(3470,null);
   res:=GetBankRecv(id_plat,1,'ТФОМС Тюменской области');
   If VarIsNull(res) Then Begin
     MessageDlg('Платеж отменен!!!',mtError,[mbOK],0);
     Exit;
   end;
   id_sch_pl:=res[0];
   bank_pl:=res[1];
   rs_pl:=res[2];
   ks_pl:=res[3];
   bik_pl:=res[4];
   inn_pl:=res[5];
   bn_gor_pl:=res[6];
   nm_pl:=res[7];
   nm_pl:='ИНН:'+inn_pl+' '+nm_pl;
   bank_pl:=bank_pl+' '+bn_gor_pl;

   n_sch:=TstringList.Create;
   sum_reestr:=TstringList.Create;
   id_reest:=TstringList.Create;

   While not cds_reestrs.EOF Do Begin
     If cds_reestrs.FieldByName('plateg').AsFloat>0 Then Begin
       sum_pl:=cds_reestrs.FieldByName('plateg').AsFloat;
       summa:=summa+sum_pl;
       nom_sch:=cds_reestrs.FieldByName('nomer').AsString;
       id_reestr:=cds_reestrs.FieldByName('id').AsInteger;
       date_schet:=DateToStr(cds_reestrs.FieldByName('date_schet').AsDateTime);
       n_sch.Add('№ '+nom_sch+' от '+date_schet);
       sum_reestr.Add(FloatToStr(sum_pl));
       id_reest.Add(IntToStr(id_reestr));
     end;
     cds_reestrs.Next;
   end;

   If summa<=0 Then Begin
     MessageDlg('Нет ни одного платежа!!!',mtError,[mbOK],0);
     Exit;
   end;

   sum_pl:=0;
   ii:=0;
   While ii<=n_sch.Count-1 Do Begin
      sst:=n_sch.Strings[ii];
      While sst=n_sch.Strings[ii] Do Begin
        sum_pl:=sum_pl+StrToFloat(sum_reestr.Strings[ii]);
        Inc(ii);
        If ii>n_sch.Count-1 Then Break;
      end;
      nasn:=nasn+sst+' ('+FloatToStr(sum_pl)+'руб.), ';
      sum_pl:=0;
   end;
   If Length(nasn)>238 Then Begin
      Delete(nasn,239,Length(nasn)-238);
      nasn:=nasn+'...';
   end;
   nasn:=nasn+' НДС нет.';

   DM.StartTrans;
   try

   {********** Вставка платежки в таблицу ***********}

   id_pp:=DM.GetNextID;
   par_name:=VarArrayOf(['id','nom','dat_p','dat_b','plat','sch_plat','pol',
                         'sum','vid','nasn','sch_pol']);
   par_val:=VarArrayOf([id_pp,next_nom,ed_date.date,ed_bank_date.date,id_plat,id_sch_pl,id_pol,
                        summa,rg_tip_platega.itemindex,nasn,id_sch_pol]);
   par:=VarArrayOf([par_name,par_val]);
   DM.DoOperation(3241,false,par);

   {********** Заполнение таблицы связи исходящих платежек и заполнение
               платежей по реестрам ***********}

   For ii:=0 To n_sch.Count-1 Do Begin
       par_name:=VarArrayOf(['id_plat',':id_r',':sum']);
       par_val:=VarArrayOf([id_pp,id_reest.Strings[ii],sum_reestr.Strings[ii]]);
       par:=VarArrayOf([par_name,par_val]);
       DM.DoOperation(3260,false,par);
       par_name:=VarArrayOf([':d_sum',':id_r']);
       par_val:=VarArrayOf([sum_reestr.Strings[ii],id_reest.Strings[ii]]);
       par:=VarArrayOf([par_name,par_val]);
       DM.DoOperation(3261,false,par);
   end;
   except
     DM.Rollback;
     MessageDlg('Неожиданный сбой!!! Попробуйте еще раз...',mtError,[mbOK],0);
     Exit;
   end;
   DM.Commit;
   ShowMessage('Платеж зарегистрирован!!');
   clear_all;
end;

procedure Tfr_plat_out.clear_all;
Begin
  rg_type_urpers.ItemIndex:=0;
  ed_summ.text:='0';
  ed_date.date:=date;
  ed_srok_plat.date:=date;
  rg_tip_platega.ItemIndex:=0;
  ed_summ.Enabled:=true;
  rg_type_urpers.Enabled:=true;
  garant:=true;
  reset_urpers;
end;

end.
