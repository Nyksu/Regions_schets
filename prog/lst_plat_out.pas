unit lst_plat_out;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ToolEdit, Grids, DBGrids, ExtCtrls, Db, DBClient, Buttons,
  PLAT_OUT, new_plat_in, Ask_dlg;

type
  Tfr_lst_plat = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    ed_dat_s: TDateEdit;
    Label1: TLabel;
    rg_plat_type: TRadioGroup;
    cds_plats: TClientDataSet;
    ds_plats: TDataSource;
    bt_exit: TBitBtn;
    bt_plat_out: TBitBtn;
    bt_plat_in: TBitBtn;
    bt_del_plat: TBitBtn;
    DBGrid2: TDBGrid;
    Label2: TLabel;
    cds_schets: TClientDataSet;
    ds_schets: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure bt_exitClick(Sender: TObject);
    procedure rg_plat_typeClick(Sender: TObject);
    procedure ed_dat_sChange(Sender: TObject);
    procedure bt_plat_outClick(Sender: TObject);
    procedure bt_plat_inClick(Sender: TObject);
    procedure bt_del_platClick(Sender: TObject);
    procedure ds_platsDataChange(Sender: TObject; Field: TField);
  private
    procedure RefreshPlats;
    procedure RescanSchets;
    { Private declarations }
  public
    { Public declarations }
  end;

Procedure ListPlat;

var
  fr_lst_plat: Tfr_lst_plat;

implementation

Uses MainDM;

{$R *.DFM}

Procedure ListPlat;
Begin
  try
    try
      fr_lst_plat:=Tfr_lst_plat.Create(Application);
      fr_lst_plat.ShowModal;
    finally
      fr_lst_plat.Free;
    end;
  except
  end;
end;

procedure Tfr_lst_plat.FormCreate(Sender: TObject);
begin
   ed_dat_s.Date:=date-30;
   RefreshPlats;
end;

procedure Tfr_lst_plat.RescanSchets;
var
  res,par_val,par_name,par : variant;
Begin
  cds_schets.Active:=false;
  par_val:=VarArrayOf([cds_plats.FieldByName('id').AsInteger]);
  par_name:=VarArrayOf(['id']);
  par:=VarArrayOf([par_name,par_val]);
  Case rg_plat_type.ItemIndex of
     0 : res:=DM.GetData(3500,par);
     1 : res:=DM.GetData(3501,par);
  end;
  cds_schets.Data:=res;
end;

procedure Tfr_lst_plat.RefreshPlats;
var
  res,par_val,par_name,par : variant;
Begin
  Screen.Cursor:=crHourGlass;
  try
  cds_plats.Active:=false;
  par_val:=VarArrayOf([ed_dat_s.Date]);
  par_name:=VarArrayOf(['dat']);
  par:=VarArrayOf([par_name,par_val]);
  Case rg_plat_type.ItemIndex of
      0 : res:=DM.GetData(3182,par);
      1 : res:=DM.GetData(3183,par);
  end;
  cds_plats.Data:=res;
  Case rg_plat_type.ItemIndex of
      0 : dbGrid1.Columns.Items[3].Title.Caption:='Получатель';
      1 : dbGrid1.Columns.Items[3].Title.Caption:='Плательщик';
  end;
  finally
    screen.Cursor:=crDefault;
  end;
end;

procedure Tfr_lst_plat.bt_exitClick(Sender: TObject);
begin
  fr_lst_plat.Close;
end;

procedure Tfr_lst_plat.rg_plat_typeClick(Sender: TObject);
begin
  RefreshPlats;
end;

procedure Tfr_lst_plat.ed_dat_sChange(Sender: TObject);
begin
  RefreshPlats;
end;

procedure Tfr_lst_plat.bt_plat_outClick(Sender: TObject);
begin
   fr_lst_plat.Visible:=false;
   try
   Out_plat;
   finally
   fr_lst_plat.Visible:=true;
   end;
   RefreshPlats;
end;

procedure Tfr_lst_plat.bt_plat_inClick(Sender: TObject);
begin
   fr_lst_plat.Visible:=false;
   try
   Add_plat_in;
   finally
   fr_lst_plat.Visible:=true;
   end;
   RefreshPlats;
end;

procedure Tfr_lst_plat.bt_del_platClick(Sender: TObject);
var
  par_val,par_name,par : variant;
begin
   If cds_plats.RecordCount<1 Then Exit;
   If Get_Answer('ВНИМАНИЕ !!! УДАЛЕНИЕ ПЛАТЕЖА !!!',
                'Вы действительно хотите удалить платеж ?!',false) Then  Begin
      DM.StartTrans;
      try
       par_name:=VarArrayOf(['id']);
       par_val:=VarArrayOf([cds_plats.FieldByName('id').AsInteger]);
       par:=VarArrayOf([par_name,par_val]);
       DM.DoOperation(3420,false,par);
      except
        DM.Rollback;
        MessageDlg('Неожиданный сбой!!! Попробуйте еще раз...',mtError,[mbOK],0);
        Exit;
      end;
      DM.Commit;
      RefreshPlats;
   end;
end;

procedure Tfr_lst_plat.ds_platsDataChange(Sender: TObject; Field: TField);
begin
  RescanSchets;
end;

end.
