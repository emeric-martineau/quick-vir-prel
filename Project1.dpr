program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  XPTheme in 'XPTheme.pas',
  apropos in 'apropos.pas' {FeuilleApropos},
  AddModLine in 'AddModLine.pas' {AjouterModifierLigne},
  UnitLicence in 'UnitLicence.pas' {Licence};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'QuickVirPrel';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
