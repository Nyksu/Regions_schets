unit sum_saldo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Db, DBClient, Mask, DBCtrls;

type
  Tfr_sum_saldo = class(TForm)
    Label1: TLabel;
    ed_S_IN_NULL: TDBEdit;
    Label2: TLabel;
    ed_S_OUT_NULL: TDBEdit;
    Label3: TLabel;
    ed_PL_PP_IN: TDBEdit;
    Label4: TLabel;
    ed_PL_PP_OUT: TDBEdit;
    Label5: TLabel;
    ed_PL_TP_IN: TDBEdit;
    Label6: TLabel;
    ed_PL_TP_OUT: TDBEdit;
    Label7: TLabel;
    ed_V_PP_IN: TDBEdit;
    Label8: TLabel;
    ed_V_PP_OUT: TDBEdit;
    Label9: TLabel;
    ed_V_TP_IN: TDBEdit;
    Label10: TLabel;
    ed_V_TP_OUT: TDBEdit;
    Label11: TLabel;
    ed_SCH_PP_IN: TDBEdit;
    Label12: TLabel;
    ed_SCH_PP_OUT: TDBEdit;
    Label13: TLabel;
    ed_SCH_TP_IN: TDBEdit;
    Label14: TLabel;
    ed_SCH_TP_OUT: TDBEdit;
    ds_saldo: TDataSource;
    cds_saldo: TClientDataSet;
    bt_exit: TBitBtn;
    procedure bt_exitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure ShowSumSaldo(tp : integer);

var
  fr_sum_saldo: Tfr_sum_saldo;
  tp_pred : integer;

implementation

Uses MainDM;

{$R *.DFM}

procedure ShowSumSaldo(tp : integer);
Begin
  tp_pred:=tp;
  try
     try
       fr_sum_saldo:=Tfr_sum_saldo.Create(Application);
       fr_sum_saldo.ShowModal;
     finally
       fr_sum_saldo.free;
     end;
  except
  end;
end;

procedure Tfr_sum_saldo.bt_exitClick(Sender: TObject);
begin
  Close;
end;

procedure Tfr_sum_saldo.FormCreate(Sender: TObject);
var
  res,par_val,par_name,par : variant;
Begin
  Case tp_pred Of
      0 : par_val:=VarArrayOf([200,299]);
      1 : par_val:=VarArrayOf([300,399]);
      2 : par_val:=VarArrayOf([500,599]);
      3 : par_val:=VarArrayOf([400,499]);
  end;
  par_name:=VarArrayOf(['type_s','type_po']);
  par:=VarArrayOf([par_name,par_val]);
  res:=DM.GetData(3662,par);
  cds_saldo.Data:=res;
end;

end.
