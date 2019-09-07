unit ill_men;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, Db, DBClient;

type
  Tfr_ill_men_count = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    lb_ses: TLabel;
    bt_close: TBitBtn;
    cds_ill_men: TClientDataSet;
    ds_ill_men: TDataSource;
    procedure bt_closeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

Procedure GetIllMen(ses_id : integer;ses_name : string);

var
  fr_ill_men_count: Tfr_ill_men_count;
  ses : integer;
  ses_n : string;

implementation

Uses MainDM;

{$R *.DFM}

Procedure GetIllMen(ses_id : integer;ses_name : string);
Begin
  ses:=ses_id;
  ses_n:=ses_name;
  try
    try
      fr_ill_men_count:=Tfr_ill_men_count.Create(Application);
      fr_ill_men_count.ShowModal;
    finally
      fr_ill_men_count.free;
    end;
  except
  end;
end;

procedure Tfr_ill_men_count.bt_closeClick(Sender: TObject);
begin
  Close;
end;

procedure Tfr_ill_men_count.FormCreate(Sender: TObject);
var
  res,par_val,par_name,par : variant;
begin
   lb_ses.caption:=ses_n;
   par_val:=VarArrayOf([ses]);
   par_name:=VarArrayOf(['ses']);
   par:=VarArrayOf([par_name,par_val]);
   res:=DM.GetData(3801,par);
   cds_ill_men.data:=res;
end;

procedure Tfr_ill_men_count.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   If cds_ill_men.active Then cds_ill_men.active:=false;
end;

end.
