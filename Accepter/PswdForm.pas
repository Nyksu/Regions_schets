unit PswdForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TPasswordForm = class(TForm)
    eName: TEdit;
    ePassword: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    bbOk: TBitBtn;
    BitBtn2: TBitBtn;
    procedure bbOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    RetryCount:integer;
  public
    { Public declarations }
  end;
procedure ConnectToServer;
var
  PasswordForm: TPasswordForm;

implementation

uses  DM_acepter;

{$R *.DFM}
procedure ConnectToServer;
begin
 if not DM.Server.Connected then Application.Terminate;
 PasswordForm:=TPasswordForm.Create(Nil);
 try
    LoadKeyboardLayout('00000419', KLF_ACTIVATE);
    if PasswordForm.ShowModal<>mrOk then Application.Terminate;;
 finally
    PasswordForm.Free;
 end;
end;

procedure TPasswordForm.bbOkClick(Sender: TObject);
begin
try
   //if Date>36253 then abort;
   Dm.Login(eName.Text,ePassword.Text);
   Modalresult:=mrOk;
except
   on E:Exception do begin
   MessageDlg(E.Message,mtError,[mbOk],0);
   //ShowMessage(E.Message);
   Inc(RetryCount);
   if RetryCount=3 then ModalResult:=mrCancel;
   end;
end;
end;

procedure TPasswordForm.FormCreate(Sender: TObject);
begin
RetryCount:=0;
end;

end.
