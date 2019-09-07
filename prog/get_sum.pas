unit get_sum;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons;

type
  Tfr_get_summ = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    ed_summ: TEdit;
    bt_save: TBitBtn;
    bt_exit: TBitBtn;
    procedure bt_exitClick(Sender: TObject);
    procedure bt_saveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

Function GetSumm(var sum : real;shap,podp : string) : boolean;

var
  fr_get_summ: Tfr_get_summ;
  summa : real;
  sos : boolean;
  shp, pdp : string;

implementation

{$R *.DFM}

Function GetSumm(var sum : real;shap,podp : string) : boolean;
Begin
  sos:=false;
  summa:=sum;
  shp:=shap;
  pdp:=podp;
  try
    try
      fr_get_summ:=Tfr_get_summ.Create(Application);
      fr_get_summ.ShowModal;
    finally
      fr_get_summ.Free;
      If sos Then sum:=summa;
      Result:=sos;
    end;
  except
  end;
end;

procedure Tfr_get_summ.bt_exitClick(Sender: TObject);
begin
  fr_get_summ.Close;
end;

procedure Tfr_get_summ.bt_saveClick(Sender: TObject);
var
  co : integer;
  ch : real;
begin
  Val(ed_summ.text,ch,co);
  If co<>0 Then Begin
     ShowMessage('Некорректная сумма !!!!');
     ed_summ.SetFocus;
     Exit;
  end;
  summa:=ch;
  sos:=true;
  fr_get_summ.Close;
end;

procedure Tfr_get_summ.FormCreate(Sender: TObject);
begin
  Caption:=shp;
  Panel2.Caption:=pdp;
  ed_summ.text:=FloatToStr(summa);
end;

end.
