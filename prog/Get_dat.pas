unit Get_dat;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Mask, ToolEdit;

type
  Tfr_get_dat = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    bt_save: TBitBtn;
    bt_exit: TBitBtn;
    ed_dat: TDateEdit;
    procedure FormCreate(Sender: TObject);
    procedure bt_saveClick(Sender: TObject);
    procedure bt_exitClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

Function GetDat(var dt : TDateTime;shap,podp : string) : boolean;

var
  fr_get_dat: Tfr_get_dat;
  dtt : TDateTime;
  sos : boolean;
  shp, pdp : string;

implementation

{$R *.DFM}

Function GetDat(var dt : TDateTime;shap,podp : string) : boolean;
Begin
  sos:=false;
  dtt:=dt;
  shp:=shap;
  pdp:=podp;
  try
    try
      fr_get_dat:=Tfr_get_dat.Create(Application);
      fr_get_dat.ShowModal;
    finally
      fr_get_dat.Free;
      If sos Then dt:=dtt;
      Result:=sos;
    end;
  except
  end;
end;

procedure Tfr_get_dat.FormCreate(Sender: TObject);
begin
  Caption:=shp;
  Panel2.Caption:=pdp;
  ed_dat.date:=dtt;
end;

procedure Tfr_get_dat.bt_saveClick(Sender: TObject);
begin
  dtt:=ed_dat.date;
  sos:=true;
  Close;
end;

procedure Tfr_get_dat.bt_exitClick(Sender: TObject);
begin
  Close;
end;

end.
