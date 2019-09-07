unit Bank_rekv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, Grids, DBGrids, ExtCtrls, Db, DBClient;

type
  Tfr_recvisits = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    Label3: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    bt_exit: TBitBtn;
    cds_rs: TClientDataSet;
    ds_rs: TDataSource;
    lb_plat_pol: TLabel;
    lb_name: TLabel;
    Label5: TLabel;
    DBText4: TDBText;
    procedure FormCreate(Sender: TObject);
    procedure bt_exitClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

Function GetBankRecv(id_urp,pl_pol : integer;im : string) : variant;

var
  fr_recvisits: Tfr_recvisits;

implementation

Uses MainDM;

var
kto, imia : string;
id_p : integer;
rrs : variant;

{$R *.DFM}

Function GetBankRecv(id_urp,pl_pol : integer;im : string) : variant;
Begin
  id_p:=id_urp;
  Case pl_pol of
     0 : kto:='Получатель';
     1 : kto:='Плательщик';
     2 : kto:='Предприятие';
  end;
  imia:=im;
  rrs:=null;
  try
    try
      fr_recvisits:=Tfr_recvisits.Create(Application);
      fr_recvisits.ShowModal;
    finally
      Result:=rrs;
      fr_recvisits.Free;
    end;
  except
  end;
end;

procedure Tfr_recvisits.FormCreate(Sender: TObject);
var
  res,par_val,par_name,par : variant;
begin
  If kto='Предприятие' Then Begin
     Panel2.Caption:='';
     bt_exit.Caption:='Выход';
  end;
  lb_plat_pol.Caption:=kto;
  lb_name.Caption:=imia;
  par_val:=VarArrayOf([id_p]);
  par_name:=VarArrayOf(['urp']);
  par:=VarArrayOf([par_name,par_val]);
  res:=DM.GetData(3202,par);
  cds_rs.data:=res;
end;

procedure Tfr_recvisits.bt_exitClick(Sender: TObject);
begin
  If (not(cds_rs.EOF))and(cds_rs.RecordCount>0) Then Begin
     rrs:=VarArrayOf([cds_rs.FieldByName('id').AsInteger,
                      cds_rs.FieldByName('bank_name').AsString,
                      cds_rs.FieldByName('rs').AsString,
                      cds_rs.FieldByName('ks').AsString,
                      cds_rs.FieldByName('bik').AsString,
                      cds_rs.FieldByName('inn').AsString,
                      cds_rs.FieldByName('city').AsString,
                      cds_rs.FieldByName('short_name').AsString]);
  end;
  fr_recvisits.Close;
end;

end.
