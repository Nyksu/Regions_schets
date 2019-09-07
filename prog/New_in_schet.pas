unit New_in_schet;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Db, DBClient, ComCtrls, DBCtrls, Mask,
  ToolEdit;

type
  Tfr_new_in_schet = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    bt_reg_ok: TBitBtn;
    bt_reg_cancel: TBitBtn;
    lb_date: TLabel;
    cds_urpers: TClientDataSet;
    ed_nomer: TEdit;
    rg_type_urpers: TRadioGroup;
    ed_urpers: TDBLookupComboBox;
    mem_koment: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ds_urpers: TDataSource;
    ed_dat_schet: TDateEdit;
    procedure FormCreate(Sender: TObject);
    procedure rg_type_urpersClick(Sender: TObject);
    procedure bt_reg_cancelClick(Sender: TObject);
    procedure bt_reg_okClick(Sender: TObject);
  private
    { Private declarations }
    procedure reset_urpers;
  public
    { Public declarations }
  end;

Procedure New_schet_in;

var
  fr_new_in_schet: Tfr_new_in_schet;

implementation

Uses MainDM,In_schets;

{$R *.DFM}

Procedure New_schet_in;
Begin
  Screen.Cursor:=crHourGlass;
  try
    try
      fr_new_in_schet:=Tfr_new_in_schet.Create(Application);
      Screen.Cursor:=crDefault;
      fr_new_in_schet.ShowModal;
    finally
      Screen.Cursor:=crDefault;
      fr_new_in_schet.Free;
    end;
  except
  end;
end;


procedure Tfr_new_in_schet.reset_urpers;
var
  res,par_val,par_name,par : variant;
Begin
  {If cds_urpers.Active Then Begin
  end;}
  cds_urpers.Active:=false;
  Case rg_type_urpers.ItemIndex of
     0 : par_val:=VarArrayOf([200,299]);
     1 : par_val:=VarArrayOf([300,399]);
     2 : par_val:=VarArrayOf([400,499]);
  end;
  par_name:=VarArrayOf(['type_s','type_po']);
  par:=VarArrayOf([par_name,par_val]);
  res:=DM.GetData(86,par);
  cds_urpers.Data:=res;
end;


procedure Tfr_new_in_schet.FormCreate(Sender: TObject);
begin
   reset_urpers;
   lb_date.Caption:='Сегодня '+DateToStr(date);
   ed_dat_schet.Date:=date-4;
end;

procedure Tfr_new_in_schet.rg_type_urpersClick(Sender: TObject);
begin
  reset_urpers;
end;

procedure Tfr_new_in_schet.bt_reg_cancelClick(Sender: TObject);
begin
  fr_new_in_schet.Close;
end;

procedure Tfr_new_in_schet.bt_reg_okClick(Sender: TObject);
var
  ful_param,par_names,par_val : variant;
  id,id_k : integer;
begin
  id_k:=0;
  If (ed_nomer.Text='')or VarIsNull(ed_urpers.KeyValue) Then Exit;
  If mem_koment.Lines.Text='' Then Begin
     ful_param:=VarArrayCreate([1,3],varVariant);
     ful_param[1]:=1;
     ful_param[2]:=VarArrayOf([6]);
     id:=DM.GetNextID;
     par_names:=VarArrayOf([':id',':urp',':nom','date',':koment']);
     par_val:=VarArrayOf([IntToStr(id),IntToStr(ed_urpers.KeyValue),
                          ed_nomer.Text,ed_dat_schet.Date,'null']);
     ful_param[3]:=VarArrayOf([par_names,par_val]);
  end
  Else Begin
     ful_param:=VarArrayCreate([1,4],varVariant);
     ful_param[1]:=2;
     ful_param[2]:=VarArrayOf([5,6]);
     id:=DM.GetNextID;
     id_k:=id;
     par_names:=VarArrayOf([':id','koment']);
     par_val:=VarArrayOf([IntToStr(id),mem_koment.Lines.Text]);
     ful_param[3]:=VarArrayOf([par_names,par_val]);
     id:=DM.GetNextID;
     par_names:=VarArrayOf([':id',':urp',':nom','date',':koment']);
     par_val:=VarArrayOf([IntToStr(id),IntToStr(ed_urpers.KeyValue),
                        ed_nomer.Text,ed_dat_schet.Date,IntToStr(id_k)]);
     ful_param[4]:=VarArrayOf([par_names,par_val]);
  end;
  DM.DoOperation(4,true,ful_param);
  fr_schets_in.ReScan;
  fr_schets_in.cds_schets_in.Locate('id',VarArrayOf([id]),[loCaseInsensitive]);
  fr_new_in_schet.Close;
end;

end.
