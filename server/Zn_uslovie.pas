unit Zn_uslovie;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls;

type
  Tfr_uslovie_zn = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    rg_znak: TRadioGroup;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

Function Get_Znak(tip:integer; var zzn : string):integer;

var
  fr_uslovie_zn: Tfr_uslovie_zn;
  tp, z : integer;
  z_n : string;

implementation

{$R *.DFM}

Function Get_Znak(tip:integer; var zzn : string):integer;
Begin
   tp:=tip; // 0 - число, 1 - строка, 3-список
   z:=5;
   z_n:='=';
   try
     try
       fr_uslovie_zn:=Tfr_uslovie_zn.Create(Application);
       fr_uslovie_zn.ShowModal;
     finally
       zzn:=z_n;
       Result:=z;
       fr_uslovie_zn.Free;
     end;
   except
   end;
end;

procedure Tfr_uslovie_zn.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin  // tp = 0 - число, 1 - строка, 3-список
  CanClose:=true;
  Case rg_znak.ItemIndex of
     0,1,2,3,7,8 : If tp<>0 Then CanClose:=false;
               6 : If tp<>1 Then CanClose:=false;
  end;
  If not CanClose Then MessageDlg('Для данного значение это условие не подходит!!',mtError,[mbOk],0);
end;

procedure Tfr_uslovie_zn.Button1Click(Sender: TObject);
begin
  z:=rg_znak.ItemIndex;
  Case z of
     0 : z_n:='>';
     1 : z_n:='<';
     2 : z_n:='>=';
     3 : z_n:='<=';
     4 : z_n:='<>';
     5 : z_n:='=';
     6 : z_n:='like';
     7 : z_n:='>=';
     8 : z_n:='>';
  end;
  Close;
end;

end.
