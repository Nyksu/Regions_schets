unit Ask_chislo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RXCtrls, StdCtrls, RXSpin, Buttons;

type
  Tfr_get_chislo = class(TForm)
    bt_ok: TBitBtn;
    bt_quit: TBitBtn;
    lb_coment: TRxLabel;
    ed_chislo: TEdit;
    procedure bt_okClick(Sender: TObject);
    procedure bt_quitClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


function Ask_real(zg,koment :string;def : real):real;

var
  fr_get_chislo: Tfr_get_chislo;
  Res : real;
  def_val : real;

implementation

{$R *.DFM}

function Ask_real(zg,koment :string;def : real):real;
Begin
  res:=-1;
  def_val:=def;
  try
    try
      fr_get_chislo:=Tfr_get_chislo.Create(Application);
      fr_get_chislo.ed_chislo.text:=FloatToStr(def);
      fr_get_chislo.Caption:=zg;
      fr_get_chislo.lb_coment.Caption:=koment;
      fr_get_chislo.ShowModal;
    finally
      Result:=res;
      fr_get_chislo.free;
    end;
  except
  end;
end;



procedure Tfr_get_chislo.bt_okClick(Sender: TObject);
begin
  try
    Res:=StrToFloat(ed_chislo.text);
  except
    MessageDlg('Неверное число!', mtError, [mbOk], 0);
    ed_chislo.SetFocus;
    Exit;
  end;
  fr_get_chislo.Close;
end;

procedure Tfr_get_chislo.bt_quitClick(Sender: TObject);
begin
  fr_get_chislo.Close;
end;

procedure Tfr_get_chislo.FormActivate(Sender: TObject);
begin
   ed_chislo.SetFocus;
end;

end.
