unit Mask_filtr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, CheckLst, ExtCtrls, Buttons;

type
  Tfr_filtr_mask = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    Panel2: TPanel;
    chls_filtr: TCheckListBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure chls_filtrClickCheck(Sender: TObject);
  private
    procedure ChangeParam;
    { Private declarations }
  public
    { Public declarations }
  end;

Function Get_filtr_mask(var par:variant):boolean;

var
  fr_filtr_mask: Tfr_filtr_mask;
  rr : boolean;
  pp : variant;
  sets : boolean;
  kvo : integer;

implementation

{$R *.DFM}

Function Get_filtr_mask(var par:variant):boolean;
Begin
   rr:=false;
   pp:=par;
   sets:=true;
   try
     try
       fr_filtr_mask:=Tfr_filtr_mask.Create(Application);
       fr_filtr_mask.ShowModal;
     finally
       Result:=rr;
       par:=pp;
       fr_filtr_mask.free;
     end;
   except
   end;
end;

procedure Tfr_filtr_mask.BitBtn1Click(Sender: TObject);
begin
   rr:=true;
   Close;
end;

procedure Tfr_filtr_mask.ChangeParam;
var
  ii : integer;
Begin
  If not sets Then Begin
     For ii:=0 To kvo Do pp[ii]:=chls_filtr.Checked[ii];
  end;
end;

procedure Tfr_filtr_mask.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure Tfr_filtr_mask.FormCreate(Sender: TObject);
var
  nam, val : variant;
  ii : integer;
begin
  nam:=pp[0];
  val:=pp[1];
  pp:=val;
  kvo:=VarArrayHighBound(nam,1);
  For ii:=0 To kvo Do Begin
      chls_filtr.Items.Add(nam[ii]);
      chls_filtr.Checked[ii]:=val[ii];
  end;
  sets:=false;
end;

procedure Tfr_filtr_mask.chls_filtrClickCheck(Sender: TObject);
begin
   ChangeParam;
end;

end.
