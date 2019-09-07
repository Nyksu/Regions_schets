program Import_urpers_relax;

uses
  Forms,
  main1 in 'main1.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
