unit spr_saldo_in;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, ExtCtrls, Grids, DBGrids, Db, DBClient, Buttons,
  sum_saldo;

type
  Tfr_saldo_in = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    RadioGroup1: TRadioGroup;
    ed_S_IN_NULL: TDBEdit;
    ed_S_OUT_NULL: TDBEdit;
    ed_PL_PP_IN: TDBEdit;
    ed_PL_PP_OUT: TDBEdit;
    ed_PL_TP_IN: TDBEdit;
    ed_PL_TP_OUT: TDBEdit;
    ed_V_PP_IN: TDBEdit;
    ed_V_PP_OUT: TDBEdit;
    ed_V_TP_IN: TDBEdit;
    ed_SCH_PP_IN: TDBEdit;
    ed_SCH_PP_OUT: TDBEdit;
    ed_SCH_TP_IN: TDBEdit;
    ed_SCH_TP_OUT: TDBEdit;
    ed_V_TP_OUT: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    cds_urp: TClientDataSet;
    cds_saldo: TClientDataSet;
    ds_urp: TDataSource;
    ds_saldo: TDataSource;
    bt_save: TBitBtn;
    bt_exit: TBitBtn;
    bt_indeksation: TBitBtn;
    bt_sum: TBitBtn;
    procedure bt_exitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure ds_urpDataChange(Sender: TObject; Field: TField);
    procedure bt_saveClick(Sender: TObject);
    procedure bt_indeksationClick(Sender: TObject);
    procedure bt_sumClick(Sender: TObject);
  private
    procedure Rescan_Urp;
    procedure Rescan_Saldo;
    { Private declarations }
  public
    { Public declarations }
  end;

Procedure CreateSaldo;

var
  fr_saldo_in: Tfr_saldo_in;

implementation

Uses MainDM;

{$R *.DFM}

Procedure CreateSaldo;
Begin
  try
    try
      fr_saldo_in:=Tfr_saldo_in.Create(Application);
      fr_saldo_in.ShowModal;
    finally
      fr_saldo_in.free;
    end;
  except
  end;
end;

procedure Tfr_saldo_in.Rescan_Saldo;
var
  par : variant;
Begin
  cds_saldo.Active:=false;
  If cds_urp.RecordCount<1 Then Exit;
  par:=VarArrayOf([cds_urp.FieldByName('id').AsInteger]);
  DM.DoOperation(3583,true,par);
  cds_saldo.Active:=true;
end;

procedure Tfr_saldo_in.Rescan_Urp;
var
  res,par_val,par_name,par : variant;
Begin
  cds_urp.Active:=false;
  Case RadioGroup1.ItemIndex Of
      0 : par_val:=VarArrayOf([200,299]);
      1 : par_val:=VarArrayOf([300,399]);
      2 : par_val:=VarArrayOf([500,599]);
      3 : par_val:=VarArrayOf([400,499]);
  end;
  par_name:=VarArrayOf(['type_s','type_po']);
  par:=VarArrayOf([par_name,par_val]);
  res:=DM.GetData(86,par);
  cds_urp.Data:=res;
end;


procedure Tfr_saldo_in.bt_exitClick(Sender: TObject);
begin
  Close;
end;

procedure Tfr_saldo_in.FormCreate(Sender: TObject);
begin
  Rescan_Urp;
end;

procedure Tfr_saldo_in.RadioGroup1Click(Sender: TObject);
begin
  Rescan_Urp;
end;

procedure Tfr_saldo_in.ds_urpDataChange(Sender: TObject; Field: TField);
begin
  Rescan_Saldo;
end;

procedure Tfr_saldo_in.bt_saveClick(Sender: TObject);
begin
  try
   If cds_urp.RecordCount<1 Then Exit;
   cds_saldo.ApplyUpdates(-1);
  except
   cds_saldo.CancelUpdates;
   raise;
  end;
end;

procedure Tfr_saldo_in.bt_indeksationClick(Sender: TObject);
begin
  DM.DoOperation(3640,false,null);
end;

procedure Tfr_saldo_in.bt_sumClick(Sender: TObject);
begin
  ShowSumSaldo(RadioGroup1.ItemIndex);
end;

end.
