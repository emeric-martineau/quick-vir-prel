[Setup]
AppName=QuickVirPrel
AppVerName=QuickVirPrel 2.0
DefaultDirName={pf}\QuickVirPrel
DefaultGroupName=QuickVirPrel
UninstallDisplayIcon={uninstallexe}
LicenseFile=licence.rtf
WizardImageFile=WizModernImage-IS.bmp
WizardSmallImageFile=WizModernSmallImage-IS.bmp
LanguageDetectionMethod=none

[Languages]
Name: "fr"; MessagesFile: "compiler:French.isl"

[Files]
Source: "project1.exe"; DestDir: "{app}"; DestName: "QuickVirPrel.exe"
Source: "licence.rtf"; DestDir: "{app}"
Source: "historique.txt"; DestDir: "{app}"

[Icons]
Name: "{group}\QuickVirPrel"; Filename: "{app}\QuickVirPrel.exe"; WorkingDir: "{app}"
Name: "{group}\Licence"; Filename: "{app}\licence.rtf"; WorkingDir: "{app}"
Name: "{group}\Désinstallation de QuickVirPrel"; Filename: "{uninstallexe}"


[Registry]
Root: HKCU; Subkey: "Software\QuickVirPrel"; Flags: uninsdeletekey

