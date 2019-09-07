unit Fase_update;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, Grids, DBGrids;

type
  TForm1 = class(TForm)
    Database1: TDatabase;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    bt_export: TButton;
    bt_exit: TButton;
    q_ins: TQuery;
    q_up: TQuery;
    Table1: TQuery;
    fl_VKEY: TStringField;
    fl_REAL: TStringField;
    fl_PZN: TStringField;
    fl_UER: TStringField;
    fl_RGN: TStringField;
    fl_IND: TStringField;
    fl_TNP: TStringField;
    fl_NNP: TStringField;
    fl_ADR: TStringField;
    fl_RKC: TStringField;
    fl_NAMEP: TStringField;
    fl_NAMEN: TStringField;
    fl_NEWNUM: TStringField;
    fl_NEWKS: TStringField;
    fl_PERMFO: TStringField;
    fl_SROK: TStringField;
    fl_AT1: TStringField;
    fl_AT2: TStringField;
    fl_TELEF: TStringField;
    fl_REGN: TStringField;
    fl_OKPO: TStringField;
    fl_DT_IZM: TDateField;
    fl_P: TStringField;
    fl_CKS: TStringField;
    fl_KSNP: TStringField;
    procedure bt_exitClick(Sender: TObject);
    procedure bt_exportClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.bt_exitClick(Sender: TObject);
begin
  Close;
end;

procedure TForm1.bt_exportClick(Sender: TObject);
begin
  Table1.first;
  While not Table1.EOF Do Begin
  {:vkey, :real, :pzn, :uer, :rgn, :ind, :tnp, :nnp, :adr, :rkc, :namep,
  :namen, :newnum, :newks,
  :permfo, :srok, :at1, :at2, :telef, :regn, :okpo, :dt_izm, :p, :cks, :ksnp}
    try
      q_ins.ParamByName('vkey').AsString:=fl_vkey.Value;
      q_ins.ParamByName('real').AsString:=fl_real.Value;
      q_ins.ParamByName('pzn').AsString:=fl_pzn.Value;
      q_ins.ParamByName('uer').AsString:=fl_uer.Value;
      q_ins.ParamByName('rgn').AsString:=fl_rgn.Value;
      q_ins.ParamByName('ind').AsString:=fl_ind.Value;
      q_ins.ParamByName('tnp').AsString:=fl_tnp.Value;
      q_ins.ParamByName('nnp').AsString:=fl_nnp.Value;
      q_ins.ParamByName('adr').AsString:=fl_adr.Value;
      q_ins.ParamByName('rkc').AsString:=fl_rkc.Value;
      q_ins.ParamByName('namep').AsString:=fl_namep.Value;
      q_ins.ParamByName('namen').AsString:=fl_namen.Value;
      q_ins.ParamByName('newnum').AsString:=fl_newnum.Value;
      q_ins.ParamByName('newks').AsString:=fl_newks.Value;
      q_ins.ParamByName('permfo').AsString:=fl_permfo.Value;
      q_ins.ParamByName('srok').AsString:=fl_srok.Value;
      q_ins.ParamByName('at1').AsString:=fl_at1.Value;
      q_ins.ParamByName('at2').AsString:=fl_at2.Value;
      q_ins.ParamByName('telef').AsString:=fl_telef.Value;
      q_ins.ParamByName('regn').AsString:=fl_regn.Value;
      q_ins.ParamByName('okpo').AsString:=fl_okpo.Value;
      q_ins.ParamByName('dt_izm').AsDateTime:=fl_dt_izm.Value;
      q_ins.ParamByName('p').AsString:=fl_p.Value;
      q_ins.ParamByName('cks').AsString:=fl_cks.Value;
      q_ins.ParamByName('ksnp').AsString:=fl_ksnp.Value;
      Database1.StartTransaction;
      q_ins.ExecSQL;
    except
      q_up.ParamByName('vkey').AsString:=fl_vkey.Value;
      q_up.ParamByName('real').AsString:=fl_real.Value;
      q_up.ParamByName('pzn').AsString:=fl_pzn.Value;
      q_up.ParamByName('uer').AsString:=fl_uer.Value;
      q_up.ParamByName('rgn').AsString:=fl_rgn.Value;
      q_up.ParamByName('ind').AsString:=fl_ind.Value;
      q_up.ParamByName('tnp').AsString:=fl_tnp.Value;
      q_up.ParamByName('nnp').AsString:=fl_nnp.Value;
      q_up.ParamByName('adr').AsString:=fl_adr.Value;
      q_up.ParamByName('rkc').AsString:=fl_rkc.Value;
      q_up.ParamByName('namep').AsString:=fl_namep.Value;
      q_up.ParamByName('namen').AsString:=fl_namen.Value;
      q_up.ParamByName('newnum').AsString:=fl_newnum.Value;
      q_up.ParamByName('newks').AsString:=fl_newks.Value;
      q_up.ParamByName('permfo').AsString:=fl_permfo.Value;
      q_up.ParamByName('srok').AsString:=fl_srok.Value;
      q_up.ParamByName('at1').AsString:=fl_at1.Value;
      q_up.ParamByName('at2').AsString:=fl_at2.Value;
      q_up.ParamByName('telef').AsString:=fl_telef.Value;
      q_up.ParamByName('regn').AsString:=fl_regn.Value;
      q_up.ParamByName('okpo').AsString:=fl_okpo.Value;
      q_up.ParamByName('dt_izm').AsDateTime:=fl_dt_izm.Value;
      q_up.ParamByName('p').AsString:=fl_p.Value;
      q_up.ParamByName('cks').AsString:=fl_cks.Value;
      q_up.ParamByName('ksnp').AsString:=fl_ksnp.Value;
      q_up.ExecSQL;
    end;
    Database1.Commit;
    Table1.Next;
  end;
end;

end.
