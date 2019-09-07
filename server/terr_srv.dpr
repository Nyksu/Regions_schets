program terr_srv;

uses
  Forms,
  MForm in 'MForm.pas' {MainForm},
  terr_srv_TLB in 'terr_srv_TLB.pas',
  RDM in 'RDM.pas' {OtherAreaRDM: TRemoteDataModule} {OtherAreaRDM: CoClass};

{$R *.TLB}

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
