unit new_plat_in;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, StdCtrls, Buttons, Spin, DBCtrls, Grids, DBGrids, Db,
  DBClient, Get_Sum, Bank_rekv, Mask, ToolEdit;

type
  Tfr_plat_in_new = class(TForm)
    Panel1: TPanel;
    PageControl1: TPageControl;
    ts_rekv: TTabSheet;
    ts_schet: TTabSheet;
    bt_next: TBitBtn;
    Panel2: TPanel;
    ed_nom_plat: TSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ed_plat: TDBLookupComboBox;
    Label6: TLabel;
    ed_koment: TMemo;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    cds_plat: TClientDataSet;
    cds_schets: TClientDataSet;
    ds_plat: TDataSource;
    ds_schets: TDataSource;
    bt_back: TBitBtn;
    bt_exit: TBitBtn;
    Label5: TLabel;
    ed_dat_plat: TDateEdit;
    ed_bank_dat: TDateEdit;
    procedure PageControl1Changing(Sender: TObject;
      var AllowChange: Boolean);
    procedure bt_exitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure bt_backClick(Sender: TObject);
    procedure bt_nextClick(Sender: TObject);
    procedure ds_platDataChange(Sender: TObject; Field: TField);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    procedure reset_plat;
    procedure reset_schets;
    procedure clear_all;
    { Private declarations }
  public
    { Public declarations }
  end;

Procedure Add_plat_in;

var
  fr_plat_in_new: Tfr_plat_in_new;

implementation

Uses MainDM;

{$R *.DFM}

Procedure Add_plat_in;
Begin
  try
    try
      fr_plat_in_new:=Tfr_plat_in_new.Create(Application);
      fr_plat_in_new.ShowModal;
    finally
      fr_plat_in_new.Free;
    end;
  except
  end;
end;

procedure Tfr_plat_in_new.reset_plat;
var
  res,par_val,par_name,par : variant;
Begin
  screen.Cursor:=crHourGlass;
  try
  cds_plat.Active:=false;
  If RadioButton1.Checked Then par_val:=VarArrayOf([500,599])
  Else par_val:=VarArrayOf([200,299]);
  par_name:=VarArrayOf(['type_s','type_po']);
  par:=VarArrayOf([par_name,par_val]);
  res:=DM.GetData(86,par);
  cds_plat.Data:=res;
  finally
   screen.Cursor:=crDefault;
  end;
end;

procedure Tfr_plat_in_new.reset_schets;
var
  res,par_val,par_name,par : variant;
Begin
  screen.Cursor:=crHourGlass;
  try
  cds_schets.Active:=false;
  par_val:=VarArrayOf([cds_plat.FieldByName('id').AsInteger]);
  par_name:=VarArrayOf(['id_plat']);
  par:=VarArrayOf([par_name,par_val]);
  res:=DM.GetData(3280,par);
  cds_schets.Data:=res;
  finally
   screen.Cursor:=crDefault;
  end;
end;

procedure Tfr_plat_in_new.PageControl1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange:=false;
end;

procedure Tfr_plat_in_new.bt_exitClick(Sender: TObject);
begin
  fr_plat_in_new.Close;
end;

procedure Tfr_plat_in_new.FormCreate(Sender: TObject);
begin
  reset_plat;
  reset_schets;
  ed_dat_plat.date:=date-3;
  ed_bank_dat.date:=date;
end;

procedure Tfr_plat_in_new.RadioButton1Click(Sender: TObject);
begin
  reset_plat;
end;

procedure Tfr_plat_in_new.bt_backClick(Sender: TObject);
begin
  PageControl1.ActivePage:=ts_rekv;
  bt_back.Enabled:=false;
end;

procedure Tfr_plat_in_new.bt_nextClick(Sender: TObject);
var
  par_val,par_name,par,res : variant;
  next_nom, id_plat, id_pol, id_reestr : integer;
  nasn, nom_sch : string;
  summa, sum_pl : real;
  rs_pol, ks_pol, bik_pol, inn_pol, bank_pol, bn_gor_pol, nm_pol : string;
  id_sch_pol, ii : integer;
  date_schet,sst : string;
  n_sch, sum_reestr, id_reest : TstringList;
begin
  If PageControl1.ActivePage.PageIndex=0 Then Begin
     If ed_nom_plat.Value<=0 Then Begin
        MessageDlg('Введите номер платежного поручения!!',mtError,[mbOk],0);
        ed_nom_plat.SetFocus;
        Exit;
     end;
     If (VarIsNull(ed_plat.KeyValue))or(ed_plat.KeyValue=0) Then Begin
        MessageDlg('Выбирите плательщика!!',mtError,[mbOk],0);
        ed_plat.SetFocus;
        Exit;
     end;
     PageControl1.ActivePage:=ts_schet;
     bt_back.Enabled:=true;
  end
  Else Begin
   If not cds_schets.Active Then Exit;
   If cds_schets.RecordCount<1 Then Exit;
   If VarIsNull(cds_schets.Delta) Then Begin
     MessageDlg('Не занесено ни одного платежа!!',mtError,[mbOk],0);
     MessageDlg('Внесите платежи по счета и повторите операцию!!',mtInformation,[mbOk],0);
     Exit;
   end;
   cds_schets.First;
   summa:=0;
   //Получаем реквизиты банка плательщика
   //Получаем реквизиты банка ТФОМСа
   id_pol:=DM.GetData(3470,null);
   res:=GetBankRecv(id_pol,0,'ТФОМС Тюменской области');
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

   n_sch:=TstringList.Create;
   sum_reestr:=TstringList.Create;
   cds_schets.first;

   While not cds_schets.EOF Do Begin
     If cds_schets.FieldByName('sm').AsFloat>0 Then Begin
       sum_pl:=cds_schets.FieldByName('sm').AsFloat;
       summa:=summa+sum_pl;
       id_reestr:=cds_schets.FieldByName('id').AsInteger;
       n_sch.Add(IntToStr(id_reestr));
       sum_reestr.Add(FloatToStr(sum_pl));
     end;
     cds_schets.Next;
   end;

   If summa<=0 Then Begin
     MessageDlg('Нет ни одного платежа!!!',mtError,[mbOK],0);
     Exit;
   end;

   DM.StartTrans;
   try

   {********** Вставка платежки в таблицу ***********}

   id_plat:=DM.GetNextID;
   par_name:=VarArrayOf(['id','nom','dat_p','dat_b','plat',':sch_plat','pol',
                         'sum','vid','nasn','sch_pol']);
   par_val:=VarArrayOf([id_plat, ed_nom_plat.Value, ed_dat_plat.date, ed_bank_dat.date,
                        ed_plat.KeyValue, 'null', id_pol, summa, 0, '', id_sch_pol]);
   par:=VarArrayOf([par_name,par_val]);
   DM.DoOperation(3241,false,par);

   {********** Заполнение таблицы связи входящих платежек и заполнение
               платежей по счетам ***********}

   For ii:=0 To n_sch.Count-1 Do Begin
       par_name:=VarArrayOf(['id_plat',':id_r',':sum']);
       par_val:=VarArrayOf([id_plat,n_sch.Strings[ii],sum_reestr.Strings[ii]]);
       par:=VarArrayOf([par_name,par_val]);
       DM.DoOperation(3381,false,par);
       par_name:=VarArrayOf([':d_sum',':id_r']);
       par_val:=VarArrayOf([sum_reestr.Strings[ii],n_sch.Strings[ii]]);
       par:=VarArrayOf([par_name,par_val]);
       DM.DoOperation(3380,false,par);
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
end;

procedure Tfr_plat_in_new.ds_platDataChange(Sender: TObject;
  Field: TField);
begin
  reset_schets;
end;

procedure Tfr_plat_in_new.DBGrid1DblClick(Sender: TObject);
var
 sum : real;
begin
   If not cds_schets.Active Then Exit;
   If cds_schets.RecordCount<1 Then Exit;
   sum:=cds_schets.FieldByName('dolg').AsFloat;
   If GetSumm(sum,'Входящая сумма','Введите сумму по счету') Then
     If sum<=cds_schets.FieldByName('dolg').AsFloat Then Begin
      cds_schets.Edit;
      cds_schets.FieldByName('sm').AsFloat:=sum;
      cds_schets.Post;
   end;
end;

procedure Tfr_plat_in_new.clear_all;
Begin
  PageControl1.ActivePage:=ts_rekv;
  bt_back.Enabled:=false;
  ed_nom_plat.Value:=0;
  ed_dat_plat.date:=date-3;
  ed_bank_dat.date:=date;
  RadioButton1.Checked:=true;
  reset_plat;
end;

end.
