unit prn_schet;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, jpeg, QuickRpt, ExtCtrls, Db, DBClient, formula;

type
  Tfr_schet_prn = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRShape1: TQRShape;
    mem_recvisits: TQRMemo;
    QRShape2: TQRShape;
    QRImage1: TQRImage;
    QRMemo1: TQRMemo;
    lb_nom_schet: TQRLabel;
    lb_ot: TQRLabel;
    lb_plat: TQRLabel;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    QRBand4: TQRBand;
    QRBand5: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    cds_report: TClientDataSet;
    QRLabel5: TQRLabel;
    QRShape11: TQRShape;
    lb_summa: TQRLabel;
    QRShape12: TQRShape;
    QRLabel6: TQRLabel;
    mem_sum: TQRMemo;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel11: TQRLabel;
    lb_nom_sch2: TQRLabel;
    QRShape13: TQRShape;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

Procedure Schet_prn(dat : variant;nom_sch:integer;dats,s_sum,plat : string);

var
  fr_schet_prn: Tfr_schet_prn;
  ddd : variant;
  n_s : integer;
  dt,s_s,plt : string;

implementation

{$R *.DFM}

Procedure Schet_prn(dat : variant;nom_sch:integer;dats,s_sum,plat : string);
var
 cnt : integer;
Begin
  ddd:=dat;
  n_s:=nom_sch;
  dt:=dats;
  s_s:=s_sum;
  plt:=plat;
  try
    try
      fr_schet_prn:=Tfr_schet_prn.Create(Application);
      fr_schet_prn.QuickRep1.Preview;
      //fr_schet_prn.QuickRep1.Print;
    finally
      for cnt := (Screen.FormCount - 1) downto 0 do
            with Screen.Forms[cnt] do
               if (ClassName = 'TQRStandardPreview') then Free;
      fr_schet_prn.Free;
    end;
  except
  end;
end;


procedure Tfr_schet_prn.FormCreate(Sender: TObject);
var
ii : integer;
begin
   cds_report.Data:=ddd;
   ii:=cds_report.RecordCount;
   lb_nom_schet.Caption:='СЧЕТ № '+IntToStr(n_s);
   lb_ot.Caption:='от '+dt+' г.';
   lb_plat.Caption:='Плательщик: '+plt;
   lb_nom_sch2.Caption:=lb_nom_schet.Caption+'  '+lb_ot.Caption;
   lb_summa.Caption:=s_s+' руб.';
   mem_sum.Lines.Text:=SumToStr(s_s,true);
end;

end.
