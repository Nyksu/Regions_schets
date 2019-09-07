unit New_out_schet;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, DBCtrls, Buttons, Db, DBClient, Mask, ToolEdit,
  Grids, DBGrids, DBTables, Get_str, StrUtils, Prn_schet;

type
  Tfr_new_out_schet = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    rg_plat_tip: TRadioGroup;
    gr_in_schets: TDBGrid;
    ed_data: TDateEdit;
    gr_for_use: TDBGrid;
    cds_plat: TClientDataSet;
    cds_in_schets: TClientDataSet;
    cds_for_set: TClientDataSet;
    bt_add: TBitBtn;
    bt_remove: TBitBtn;
    ds_plat: TDataSource;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ds_in_schets: TDataSource;
    ds_for_set: TDataSource;
    bt_plat_search: TBitBtn;
    bt_exit: TBitBtn;
    bt_reg_ok: TBitBtn;
    ed_plat: TDBLookupComboBox;
    Label5: TLabel;
    lb_sum: TLabel;
    lb_filtr: TLabel;
    procedure bt_plat_searchClick(Sender: TObject);
    procedure bt_exitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rg_plat_tipClick(Sender: TObject);
    procedure ds_platDataChange(Sender: TObject; Field: TField);
    procedure bt_addClick(Sender: TObject);
    procedure bt_removeClick(Sender: TObject);
    procedure bt_reg_okClick(Sender: TObject);
  private
    procedure RescanPlat;
    procedure RescanSchets;
    procedure CalcSumm;
    { Private declarations }
  public
    { Public declarations }
  end;

Procedure New_oun_schet;

var
  fr_new_out_schet: Tfr_new_out_schet;
  st_find_plat : string;
  sm_accept : real;

implementation

Uses MainDM;

{$R *.DFM}

Procedure New_oun_schet;
Begin
  st_find_plat:='';
  try
    try
      fr_new_out_schet:=Tfr_new_out_schet.Create(Application);
      fr_new_out_schet.ShowModal;
    finally
      fr_new_out_schet.free;
    end;
  except
  end;
end;

procedure Tfr_new_out_schet.bt_plat_searchClick(Sender: TObject);
begin
   st_find_plat:=Get_Str_Par('Быстрый поиск плательщика','Введите наименование плательщика',
                             'Можете испльзовать знаки % и _ вместо'+#13+
                             'нескольких и одного символа, соответственно.',st_find_plat);
   RescanPlat;
end;

procedure Tfr_new_out_schet.bt_exitClick(Sender: TObject);
begin
  fr_new_out_schet.Close;
end;

procedure Tfr_new_out_schet.FormCreate(Sender: TObject);
begin
  ed_data.Date:=date;
  RescanPlat;
end;

procedure Tfr_new_out_schet.RescanPlat;
var
  res,par_val,par_name,par : variant;
Begin
  cds_plat.Active:=false;
  If st_find_plat='' Then lb_filtr.Visible:=false Else lb_filtr.Visible:=true;
  Case rg_plat_tip.ItemIndex of
     0 : par_val:=VarArrayOf([200,200,st_find_plat]);
     1 : par_val:=VarArrayOf([500,500,st_find_plat]);
  end;
  par_name:=VarArrayOf(['type_s','type_po',':nam']);
  par:=VarArrayOf([par_name,par_val]);
  res:=DM.GetData(3081,par);
  cds_plat.Data:=res;
  ed_plat.KeyValue:=cds_plat.FieldByName('id').Value;
  CalcSumm;
  //cds_plat.Last;
end;

procedure Tfr_new_out_schet.rg_plat_tipClick(Sender: TObject);
begin
  RescanPlat;
end;

procedure Tfr_new_out_schet.RescanSchets;
var
  res,par_val,par_name,par : variant;
Begin
  cds_in_schets.Active:=false;
  cds_for_set.Active:=false;
  par_val:=VarArrayOf([cds_plat.FieldByName('id').Value]);
  par_name:=VarArrayOf(['plat']);
  par:=VarArrayOf([par_name,par_val]);
  res:=DM.GetData(3060,par);
  cds_in_schets.Data:=res;
  cds_for_set.Data:=res;
  cds_for_set.EmptyDataSet;
end;

procedure Tfr_new_out_schet.ds_platDataChange(Sender: TObject;
  Field: TField);
begin
  RescanSchets;
end;

procedure Tfr_new_out_schet.bt_addClick(Sender: TObject);
begin
  If (not cds_in_schets.Active)or(cds_in_schets.RecordCount<=0) Then Exit;
  cds_for_set.InsertRecord([cds_in_schets.Fields.Fields[0].Value,
                            cds_in_schets.Fields.Fields[1].Value,
                            cds_in_schets.Fields.Fields[2].Value,
                            cds_in_schets.Fields.Fields[3].Value,
                            cds_in_schets.Fields.Fields[4].Value,
                            cds_in_schets.Fields.Fields[5].Value,
                            cds_in_schets.Fields.Fields[6].Value,
                            cds_in_schets.Fields.Fields[7].Value,
                            cds_in_schets.Fields.Fields[8].Value]);
  cds_in_schets.Delete;
  CalcSumm;
end;

procedure Tfr_new_out_schet.bt_removeClick(Sender: TObject);
begin
  If (not cds_for_set.Active)or(cds_for_set.RecordCount<=0) Then Exit;
  cds_in_schets.InsertRecord([cds_for_set.Fields.Fields[0].Value,
                            cds_for_set.Fields.Fields[1].Value,
                            cds_for_set.Fields.Fields[2].Value,
                            cds_for_set.Fields.Fields[3].Value,
                            cds_for_set.Fields.Fields[4].Value,
                            cds_for_set.Fields.Fields[5].Value,
                            cds_for_set.Fields.Fields[6].Value,
                            cds_for_set.Fields.Fields[7].Value,
                            cds_for_set.Fields.Fields[8].Value]);
  cds_for_set.Delete;
  CalcSumm;
end;

procedure Tfr_new_out_schet.CalcSumm;
Begin
  lb_sum.Caption:='0 руб.';
  If (not cds_for_set.Active)or(cds_for_set.RecordCount<=0) Then Exit;
  cds_for_set.First;
  sm_accept:=0;
  While not cds_for_set.EOF Do Begin
      sm_accept:=sm_accept+cds_for_set.FieldByName('dolg').AsFloat;
      cds_for_set.Next;
  end;
  lb_sum.Caption:=FloatToStr(sm_accept)+' руб.';
end;

procedure Tfr_new_out_schet.bt_reg_okClick(Sender: TObject);
var
  dt,kom_id,Params,p_n,p_v : variant;
  s_su,pl,dtt,kom : string;
  nom_scheta,name_scheta : integer;
begin
  If not cds_for_set.Active Then Exit;
  If cds_for_set.RecordCount<1 Then Exit;
  dt:=cds_for_set.Data;
  s_su:=FloatToStr(sm_accept);
  s_su:=ReplaceStr(s_su,'.',',');
  pl:=cds_plat.FieldByName('short_name').AsString;
  dtt:=DateToStr(ed_data.Date);
  nom_scheta:=0;
  kom:=Get_Str_Par('Коментарий','Вставка','Вставте (при необходимости) коментарий'
                  +#13+'и нажмите <Ok>.','');
  kom_id:=null;
  DM.StartTrans;
  If kom>'' Then Begin //Вставка коментария в базу
  end;
  //Вставка исходящего счета
  nom_scheta:=DM.GetNextID;
  name_scheta:=DM.GetID(0);
  p_n:=VarArrayOf(['id','id_urp','date','summa','id_kom','nom']);
  p_v:=VarArrayOf([nom_scheta,Integer(ed_plat.KeyValue),ed_data.Date,sm_accept,
                   kom_id,IntToStr(name_scheta)]);
  Params:=VarArrayOf([p_n,p_v]);
  try
   DM.DoOperation(3143,false,Params);
  Except
   DM.Rollback;
   Raise;
   Exit;
  end;
  //Вставка коннектов с реестрами
  cds_for_set.first;
  p_n:=VarArrayOf(['id_sch','id_reestr']);
  While not cds_for_set.EOF Do Begin
     p_v:=VarArrayOf([nom_scheta,cds_for_set.FieldByName('id_reestr').AsInteger]);
     Params:=VarArrayOf([p_n,p_v]);
     try
       DM.DoOperation(3144,false,Params);
     Except
       DM.Rollback;
       Raise;
       Exit;
     end;
     cds_for_set.Next;
  end;
  DM.Commit;
  MessageDlg('Счет № '+IntToStr(name_scheta)+
             ' сохранен! Вставте бумагу для печати счета!',mtInformation,[mbOk],0);
  Schet_prn(dt,name_scheta,dtt,s_su,pl);
  fr_new_out_schet.Close;
end;

end.
