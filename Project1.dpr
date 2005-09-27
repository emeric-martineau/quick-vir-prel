program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  XPTheme in 'XPTheme.pas',
  apropos in 'apropos.pas' {FeuilleApropos},
  AddModLine in 'AddModLine.pas' {AjouterModifierLigne},
  UnitLicence in 'UnitLicence.pas' {Licence},
  UnitAjoutEmetteur in 'UnitAjoutEmetteur.pas' {AjoutEmetteur},
  UnitEmetteur in 'UnitEmetteur.pas' {Emetteur},
  UnitAjouterDestinataire in 'UnitAjouterDestinataire.pas' {AjoutDestinataire},
  UnitDestinataire in 'UnitDestinataire.pas' {Destinataire},
  UnitUpDate in 'UnitUpDate.pas' {Update},
  UnitUpdateThread in 'UnitUpdateThread.pas',
  UnitCalculeClefRIB in 'UnitCalculeClefRIB.pas' {CalculeClefRIB},
  UnitCVS in 'UnitCVS.pas' {CSV},
  UnitConfiguration in 'UnitConfiguration.pas' {Configuration},
  UnitFichiersRecents in 'UnitFichiersRecents.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'QuickVirPrel';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
