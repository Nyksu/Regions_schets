unit del_vozvrat;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, Db, DBClient;

type
  Tfr_del_vozvrat = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    bt_del: TBitBtn;
    bt_exit: TBitBtn;
    ds_vozvr: TDataSource;
    cds_vozvr: TClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure bt_delClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

Function DelVosvrat(var id_vos:integer; reestr,tp : integer;var sum : real) : boolean;

var
  fr_del_vozvrat: Tfr_del_vozvrat;
  res : boolean;
  id,id_r,ttp : integer;
  summa : real;

implementation

Uses MainDM;

{$R *.DFM}

Function DelVosvrat(var id_vos:integer; reestr,tp : integer;var sum : real) : boolean;
Begin
  res:=false;
  id:=0;
  id_r:=reestr;
  summa:=0;
  ttp:=tp;
  try
    try
      fr_del_vozvrat:=Tfr_del_vozvrat.Create(Application);
      fr_del_vozvrat.ShowModal;
    finally
      id_vos:=id;
      sum:=summa;
      Result:=res;
      fr_del_vozvrat.Free;
    end;
  except
  end;
end;

procedure Tfr_del_vozvrat.FormCreate(Sender: TObject);
var
  res,param,par_names,par_val : variant;
begin
  If ttp=1 Then Begin
     Caption:='Возвраты по счету';
  end;
  Screen.Cursor:=crHourglass;
  try
    try
        par_val:=VarArrayOf([id_r]);
        par_names:=VarArrayOf(['reestr']);
        param:=VarArrayOf([par_names,par_val]);
        If ttp=1 Then res:=DM.GetData(3480,param)
        Else res:=DM.GetData(1604,param);
        cds_vozvr.Data:=res;
    finally
        Screen.Cursor:=crDefault;
    end;
  except
  end;
end;

procedure Tfr_del_vozvrat.bt_delClick(Sender: TObject);
begin
   id:=cds_vozvr.FieldByName('id').AsInteger;
   summa:=cds_vozvr.FieldByName('summa').AsFloat;
   res:=true;
   fr_del_vozvrat.Close;
end;

end.
