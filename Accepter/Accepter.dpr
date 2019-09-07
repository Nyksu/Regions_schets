program Accepter;

uses
  Forms,
  MainFace in 'MainFace.pas' {MainForm},
  DM_acepter in 'DM_acepter.pas' {DM: TDataModule},
  PswdForm in 'PswdForm.pas' {PasswordForm},
  progress_window in 'progress_window.pas' {fr_progress},
  get_db_list in '..\prog\get_db_list.pas' {fr_db_list},
  Get_str in '..\prog\Get_str.pas' {fr_get_str};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TDM, DM);
  try
    ConnectToServer;
    Application.Run;
  except
  end;
end.
