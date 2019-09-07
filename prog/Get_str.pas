unit Get_str;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons;

type
  Tfr_get_str = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    bt_ok: TBitBtn;
    Label1: TLabel;
    Edit1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function Get_Str_Par(Okno,Shapka,Koment,Def : string):string;

var
  fr_get_str: Tfr_get_str;
  r_str,okn,shp,kom : string;

implementation

{$R *.DFM}

function Get_Str_Par(Okno,Shapka,Koment,Def : string):string;
Begin
  r_str:=def;
  okn:=okno;
  shp:=shapka;
  kom:=Koment;
  try
    try
      fr_get_str:=Tfr_get_str.Create(Application);
      fr_get_str.ShowModal;
    finally
      Result:=r_str;
      fr_get_str.Free;
    end;
  except
  end;
end;

procedure Tfr_get_str.FormCreate(Sender: TObject);
begin
  Edit1.Lines.Text:=r_str;
  Caption:=okn;
  Panel2.Caption:=shp;
  Label1.Caption:=kom;
end;

procedure Tfr_get_str.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  r_str:=Edit1.Lines.Text;
end;

end.
