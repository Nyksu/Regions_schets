unit Acts;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Mask, ToolEdit, Grids, DBGrids, ComCtrls,
  Db, DBClient, intra_act, Ask_dlg;

type
  Tfr_acts = class(TForm)
    Panel1: TPanel;
    bt_exit: TBitBtn;
    ed_dat_s: TDateEdit;
    Label1: TLabel;
    PageControl1: TPageControl;
    ts_intra: TTabSheet;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    cds_intra: TClientDataSet;
    ds_intra: TDataSource;
    Panel2: TPanel;
    lb_flt_state: TLabel;
    bt_intra_add: TBitBtn;
    bt_intra_del: TBitBtn;
    procedure bt_exitClick(Sender: TObject);
    procedure PageControl1Changing(Sender: TObject;
      var AllowChange: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure ed_dat_sChange(Sender: TObject);
    procedure bt_intra_addClick(Sender: TObject);
    procedure bt_intra_delClick(Sender: TObject);
  private
    procedure RescanActs;
    { Private declarations }
  public
    { Public declarations }
  end;

Procedure ActsView;

var
  fr_acts: Tfr_acts;

implementation

Uses MainDM;

{$R *.DFM}

Procedure ActsView;
Begin
  try
    try
      fr_acts:=Tfr_acts.Create(Application);
      fr_acts.ShowModal;
    finally
      fr_acts.free;
    end;
  except
  end;
end;

procedure Tfr_acts.bt_exitClick(Sender: TObject);
begin
  Close;
end;

procedure Tfr_acts.PageControl1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange:=false;
end;

procedure Tfr_acts.FormCreate(Sender: TObject);
begin
  ed_dat_s.Date:=date-30;
  RescanActs;
end;

procedure Tfr_acts.RescanActs;
var
  par_val,par_name,par,res : variant;
Begin
  par_name:=VarArrayOf(['date']);
  par_val:=VarArrayOf([ed_dat_s.Date]);
  par:=VarArrayOf([par_name,par_val]);
  res:=DM.GetData(3465,par);
  If not VarIsNull(res) Then Begin
     cds_intra.active:=false;
     cds_intra.data:=res;
  end;
end;

procedure Tfr_acts.ed_dat_sChange(Sender: TObject);
begin
  RescanActs;
end;

procedure Tfr_acts.bt_intra_addClick(Sender: TObject);
begin
  AddAct;
  RescanActs;
end;

procedure Tfr_acts.bt_intra_delClick(Sender: TObject);
var
  id_acts : integer;
  par_name,par_val,par : variant;
begin
   If Get_Answer('ВНИМАНИЕ !!! УДАЛЕНИЕ АКТА ЗАЧЕТА !!!',
                'Вы действительно хотите удалить акт зачета?!',false) Then
      If cds_intra.RecordCount>0 Then Begin
         id_acts:=cds_intra.FieldByName('id').AsInteger;
         par_name:=VarArrayOf(['id_act']);
         par_val:=VarArrayOf([id_acts]);
         par:=VarArrayOf([par_name,par_val]);
         DM.StartTrans;
         try
         DM.DoOperation(3510,false,par);
         except
           DM.Rollback;
           MessageDlg('Неожиданный сбой!!! Попробуйте еще раз...',mtError,[mbOK],0);
           Raise;
         end;
         DM.Commit;
         RescanActs;
      end;
end;

end.
