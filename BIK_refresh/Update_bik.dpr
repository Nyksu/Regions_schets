program Update_bik;

uses
  Forms,
  Fase_update in 'Fase_update.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
