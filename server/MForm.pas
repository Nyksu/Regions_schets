unit MForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Menus, RXShell, StdCtrls, Buttons;

type
  TMainForm = class(TForm)
    Session1: TSession;
    RxTrayIcon1: TRxTrayIcon;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    BitBtn1: TBitBtn;
    procedure N3Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    
  end;

var
  MainForm: TMainForm;

implementation

{$R *.DFM}

procedure TMainForm.N3Click(Sender: TObject);
begin
Close;
end;

procedure TMainForm.N1Click(Sender: TObject);
begin
Show;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
ShortDateFormat:='DD.MM.YYYY';
Application.ShowMainForm:=False;
end;

procedure TMainForm.BitBtn1Click(Sender: TObject);
begin
Hide;
end;

end.
