unit Reestrs_schets;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, ExtCtrls, Buttons, Db, DBClient, Ask_dlg, DBCtrls,
  New_reestr, get_sum, del_vozvrat;

type
  Tfr_reestrs = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    lb_sch_nom: TLabel;
    Label2: TLabel;
    lb_sch_dat: TLabel;
    Label4: TLabel;
    lb_sch_poluch: TLabel;
    DBGrid1: TDBGrid;
    bt_new: TBitBtn;
    bt_edit: TBitBtn;
    bt_vos: TBitBtn;
    bt_vos_back: TBitBtn;
    bt_del: TBitBtn;
    bt_exit: TBitBtn;
    cds_reestrs: TClientDataSet;
    ds_reestrs: TDataSource;
    DBMemo1: TDBMemo;
    Label1: TLabel;
    cds_koment: TClientDataSet;
    ds_koment: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure bt_exitClick(Sender: TObject);
    procedure bt_delClick(Sender: TObject);
    procedure bt_newClick(Sender: TObject);
    procedure bt_editClick(Sender: TObject);
    procedure bt_vosClick(Sender: TObject);
    procedure bt_vos_backClick(Sender: TObject);
  private
    procedure ReScan;
    { Private declarations }
  public
    { Public declarations }
  end;

procedure StartReestr(s_id : integer; nom_sch, dat_sch, poluch : string);

var
  fr_reestrs: Tfr_reestrs;
  id_s : integer;
  d_s, n_s, pol : string;

implementation

Uses MainDM;

{$R *.DFM}

procedure StartReestr(s_id : integer; nom_sch, dat_sch, poluch : string);
Begin
  id_s:=s_id;
  d_s:=dat_sch;
  n_s:=nom_sch;
  pol:=poluch;
  try
     try
        fr_reestrs:=Tfr_reestrs.Create(Application);
        fr_reestrs.ShowModal;
     finally
        fr_reestrs.free;
     end;
  except
  end;
end;

Procedure Tfr_reestrs.ReScan;
var
  res,param,par_names,par_val : variant;
begin
  Screen.Cursor:=crHourglass;
  try
    try
        If cds_reestrs.Active Then cds_reestrs.DeleteIndex('ind1');
        cds_reestrs.Active:=false;
        cds_koment.Active:=false;
        par_val:=VarArrayOf([id_s]);
        par_names:=VarArrayOf(['id_schet']);
        param:=VarArrayOf([par_names,par_val]);
        res:=DM.GetData(1530,param);
        cds_reestrs.Data:=res;
        cds_reestrs.AddIndex('ind1', 'short_name', [ixCaseInsensitive],'','',0);
        cds_reestrs.IndexName:='ind1';
        res:=DM.GetData(1531,param);
        cds_koment.Data:=res;
    finally
        Screen.Cursor:=crDefault;
    end;
  except
  end;
end;

procedure Tfr_reestrs.FormCreate(Sender: TObject);
begin
  lb_sch_dat.Caption:=d_s;
  lb_sch_nom.Caption:=n_s;
  lb_sch_poluch.Caption:=pol;
  ReScan;
end;

procedure Tfr_reestrs.bt_exitClick(Sender: TObject);
begin
  fr_reestrs.Close;
end;

procedure Tfr_reestrs.bt_delClick(Sender: TObject);
var
  ful_param,par_names,par_val : variant;
  id,id_k : integer;
begin
  If Get_Answer('ВНИМАНИЕ !!! УДАЛЕНИЕ РЕЕСТРА !!!',
                'Вы действительно хотите удалить реестр ?!',false) Then
     If cds_reestrs.Active Then Begin
        If cds_reestrs.FieldByName('sum_in').AsFloat<>0 Then Exit;
        id:=cds_reestrs.FieldByName('id').AsInteger;
        If VarIsNull(cds_reestrs.FieldByName('coment_id').Value) Then Begin
          ful_param:=VarArrayCreate([1,4],varVariant);
          ful_param[1]:=2;
          ful_param[2]:=VarArrayOf([1539,1545]);
          par_names:=VarArrayOf(['id']);
          par_val:=VarArrayOf([id]);
          ful_param[3]:=VarArrayOf([par_names,par_val]);
          par_names:=VarArrayOf(['id','delta','vozvrat']);
          par_val:=VarArrayOf([IntToStr(id_s),-cds_reestrs.FieldByName('summa').AsFloat,
                               cds_reestrs.FieldByName('sum_return').AsFloat]);
          ful_param[4]:=VarArrayOf([par_names,par_val]);
        end
        Else Begin
          id_k:=cds_reestrs.FieldByName('coment_id').AsInteger;
          ful_param:=VarArrayCreate([1,5],varVariant);
          ful_param[1]:=3;
          ful_param[2]:=VarArrayOf([1539,103,1545]);
          par_names:=VarArrayOf(['id']);
          par_val:=VarArrayOf([IntToStr(id_k)]);
          ful_param[4]:=VarArrayOf([par_names,par_val]);
          par_val:=VarArrayOf([IntToStr(id)]);
          ful_param[3]:=VarArrayOf([par_names,par_val]);
          par_names:=VarArrayOf(['id','delta']);
          par_val:=VarArrayOf([IntToStr(id_s),-cds_reestrs.FieldByName('summa').AsFloat]);
          ful_param[5]:=VarArrayOf([par_names,par_val]);
        end;
        DM.DoOperation(101,true,ful_param);
        ReScan;
     end;
end;

procedure Tfr_reestrs.bt_newClick(Sender: TObject);
var
  pr : variant;
begin
   pr:=VarArrayCreate([0,3],varVariant);
   pr[0]:=id_s;
   pr[1]:=1;
   StartNewReestr(pr);
   ReScan;
end;

procedure Tfr_reestrs.bt_editClick(Sender: TObject);
var
  pr : variant;
begin
   pr:=VarArrayCreate([0,3],varVariant);
   pr[0]:=id_s;
   pr[1]:=0;
   pr[2]:=cds_reestrs.FieldByName('id').AsInteger;
   If cds_koment.FieldByName('coment').AsString>'' Then
           pr[3]:=cds_koment.FieldByName('coment').AsString
   Else pr[3]:='';
   StartNewReestr(pr);
   ReScan;
end;

procedure Tfr_reestrs.bt_vosClick(Sender: TObject);
var
  sum,sum_ost : real;
  param : variant;
begin
  sum:=0;
 If cds_reestrs.FieldByName('id').AsInteger>0 Then
  If GetSumm(sum,'Зачет возврата по реестру','Введите сумму возврата') Then Begin
    sum_ost:=cds_reestrs.FieldByName('summa').AsFloat-cds_reestrs.FieldByName('sum_return').AsFloat;
    If (sum=0)or(sum>sum_ost) Then Begin
     ShowMessage('Некорректная сумма !!!!');
     Exit;
    end;
    //процедура занесения в базу изменений
    param:=VarArrayOf([0,cds_reestrs.FieldByName('id').AsInteger,sum,id_s]);
    DM.DoOperation(1603,true,param);
    ReScan;
  end;
end;                                                    

procedure Tfr_reestrs.bt_vos_backClick(Sender: TObject);
var
  id_v : integer;
  sum : real;
  param : variant;
begin
   If cds_reestrs.FieldByName('id').AsInteger>0 Then
     If DelVosvrat(id_v, cds_reestrs.FieldByName('id').AsInteger,0,sum) Then Begin
       param:=VarArrayOf([1,id_v,cds_reestrs.FieldByName('id').AsInteger,sum,id_s]);
       DM.DoOperation(1603,true,param);
       ReScan;
     end;
end;

end.
