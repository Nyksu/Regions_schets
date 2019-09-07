unit intra_act;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, Spin, ExtCtrls, Mask, ToolEdit, Buttons, Grids,
  DBGrids, Db, DBClient, Get_Sum;

type
  Tfr_intra_act = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    ed_nom: TSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    ed_plat: TDBLookupComboBox;
    Label4: TLabel;
    ed_dat: TDateEdit;
    DBGrid1: TDBGrid;
    bt_exit: TBitBtn;
    bt_save: TBitBtn;
    ds_schets: TDataSource;
    cds_schets: TClientDataSet;
    cds_plat: TClientDataSet;
    ds_plat: TDataSource;
    Label5: TLabel;
    procedure bt_exitClick(Sender: TObject);
    procedure bt_saveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ds_platDataChange(Sender: TObject; Field: TField);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    procedure reset_schets;
    procedure reset_plat;
    { Private declarations }
  public
    { Public declarations }
  end;

Procedure AddAct;

var
  fr_intra_act: Tfr_intra_act;

implementation

Uses MainDM;

{$R *.DFM}

Procedure AddAct;
Begin
   try
     try
       fr_intra_act:=Tfr_intra_act.Create(Application);
       fr_intra_act.ShowModal;
     finally
       fr_intra_act.Free;
     end;
   except
   end;
end;

procedure Tfr_intra_act.bt_exitClick(Sender: TObject);
begin
  Close;
end;

procedure Tfr_intra_act.bt_saveClick(Sender: TObject);
var
  id_acts : integer;
  par_name,par_val,par,p_n,p_v : variant;
  sm : real;
begin
  id_acts:=DM.GetNextID;
  sm:=0;
  If not cds_plat.Active Then Exit;
  If not cds_schets.Active Then Begin
    MessageDlg('Не выбран счет!',mtError,[mbOK],0);
    Exit;
  end;
  If cds_schets.RecordCount<=0 Then Begin
    MessageDlg('Не выбран счет!',mtError,[mbOK],0);
    Exit;
  end;
  cds_schets.first;
  While not cds_schets.EOF Do Begin
    sm:=sm+cds_schets.FieldByName('sm').AsFloat;
    cds_schets.Next;
  end;
  If sm<=0 Then Begin
    MessageDlg('Нет ни одной суммы зачета по счетам!',mtError,[mbOK],0);
    Exit;
  end;
  DM.StartTrans;
  try
    par_name:=VarArrayOf(['id','nom','dat','sm','sm_us']);
    par_val:=VarArrayOf([id_acts,ed_nom.value,ed_dat.date,sm,0]);
    par:=VarArrayOf([par_name,par_val]);
    DM.DoOperation(3508,false,par);
    cds_schets.first;
    par_name:=VarArrayOf(['id_act','id_s','sm']);
    p_n:=VarArrayOf(['d_sum','id_r']);
    While not cds_schets.EOF Do Begin
      par_val:=VarArrayOf([id_acts,cds_schets.FieldByName('id').AsInteger,
                           cds_schets.FieldByName('sm').AsFloat]);
      par:=VarArrayOf([par_name,par_val]);
      if cds_schets.FieldByName('sm').AsFloat>0 Then Begin
         DM.DoOperation(3509,false,par);
         p_v:=VarArrayOf([cds_schets.FieldByName('sm').AsFloat,
                          cds_schets.FieldByName('id').AsInteger]);
         par:=VarArrayOf([p_n,p_v]);
         DM.DoOperation(3380,false,par);
      end;
      cds_schets.Next;
    end;
  except
     DM.Rollback;
     MessageDlg('Неожиданный сбой!!! Попробуйте еще раз...',mtError,[mbOK],0);
     Raise;
   end;
   DM.Commit;
   ShowMessage('Зачет зарегистрирован!!');
  Close;
end;

procedure Tfr_intra_act.reset_schets;
var
  res,par_val,par_name,par : variant;
Begin
  cds_schets.Active:=false;
  par_val:=VarArrayOf([cds_plat.FieldByName('id').AsInteger]);
  par_name:=VarArrayOf(['id_plat']);
  par:=VarArrayOf([par_name,par_val]);
  res:=DM.GetData(3280,par);
  cds_schets.Data:=res;
end;

procedure Tfr_intra_act.reset_plat;
var
  res,par_val,par_name,par : variant;
Begin
  cds_plat.Active:=false;
  par_val:=VarArrayOf([500,599]);
  par_name:=VarArrayOf(['type_s','type_po']);
  par:=VarArrayOf([par_name,par_val]);
  res:=DM.GetData(86,par);
  cds_plat.Data:=res;
end;

procedure Tfr_intra_act.FormCreate(Sender: TObject);
begin
  reset_plat;
  ed_dat.date:=date;
  ed_nom.value:=DM.GetID(1);
end;

procedure Tfr_intra_act.ds_platDataChange(Sender: TObject; Field: TField);
begin
  reset_schets;
end;

procedure Tfr_intra_act.DBGrid1DblClick(Sender: TObject);
var
 sum : real;
begin
   If not cds_schets.Active Then Exit;
   If cds_schets.RecordCount<1 Then Exit;
   sum:=cds_schets.FieldByName('dolg').AsFloat;
   If GetSumm(sum,'Cумма зачета','Введите сумму по счету') Then
     If sum<=cds_schets.FieldByName('dolg').AsFloat Then Begin
      cds_schets.Edit;
      cds_schets.FieldByName('sm').AsFloat:=sum;
      cds_schets.Post;
   end;
end;

end.
