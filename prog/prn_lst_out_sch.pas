unit prn_lst_out_sch;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBClient, Qrctrls, QuickRpt, ExtCtrls;

type
  Tfr_prn_lst_out_sch = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    lb_gashenie: TQRLabel;
    QRBand2: TQRBand;
    QRShape1: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRBand3: TQRBand;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel8: TQRLabel;
    QRShape12: TQRShape;
    QRBand4: TQRBand;
    QRSysData2: TQRSysData;
    QRSysData3: TQRSysData;
    QRBand5: TQRBand;
    QRLabel9: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel12: TQRLabel;
    QRSysData1: TQRSysData;
    cds_schets_out: TClientDataSet;
    QRLabel13: TQRLabel;
    QRExpr3: TQRExpr;
    QRLabel14: TQRLabel;
    QRExpr4: TQRExpr;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

Procedure Prn_Out_Schets_lst(is_fool : boolean;cds : variant;flt : string);

var
  fr_prn_lst_out_sch: Tfr_prn_lst_out_sch;
  fool_is : boolean;
  cds_data : variant;
  fl : string;

implementation

{$R *.DFM}

Procedure Prn_Out_Schets_lst(is_fool : boolean;cds : variant;flt : string);
Begin
  cds_data:=cds;
  fool_is:=is_fool;
  fl:=flt;
  try
    try
      fr_prn_lst_Out_sch:=Tfr_prn_lst_Out_sch.Create(Application);
      fr_prn_lst_Out_sch.QuickRep1.Preview;
    finally
      fr_prn_lst_Out_sch.free;
    end;
  except
  end;
end;

procedure Tfr_prn_lst_out_sch.FormCreate(Sender: TObject);
begin
  If fool_is Then lb_gashenie.Caption:='(погашеные)';
  cds_schets_out.data:=cds_data;
  If fl<>'' Then Begin
     cds_schets_out.Filter:=fl;
     cds_schets_out.Filtered:=true;
  end;
end;

end.
