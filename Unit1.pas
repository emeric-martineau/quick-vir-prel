{*******************************************************************************
 * Copyright MARTINEAU Emeric. Tous droits réservé.
 *
 * This program is free software; you can redistribute it and/or modify it under
 * the terms of the GNU General Public License as published by the Free Software
 * Foundation; either version 2 of the License, or (at your option) any later
 * version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along with
 * this program; if not, write to the Free Software Foundation, Inc., 59 Temple
 * Place, Suite 330, Boston, MA 02111-1307 USA
 *
 ******************************************************************************}
{*
 * TODO :
 *       - Fichier -> Imprimer
 *       - Créer un menu Aide, avec licence, et apropos de ...
 *       - pouvoir réduire en systray [inutile]
 *       - popup menu sur liste [inutile]
 *
 *
 *       Version 1.2
 *       - N'avoir plus qu'un menu enregistrer, mais en type de fichier, dans la boite de dialogue permettre de choisir
 *         l'un des trois type.
 *       - Modifier la MessageBox qui signale qu'il y a des modif et que le fichier n'a pas été enregistré.
 *         Boutons : oui, non, annuler
 *                   Oui : Affiche la boite d'enregistrement
 *                   Non : fait l'action voulu
 *                   Annuler : annule tout  
 *       - Changer l'icone du programme par les clefs
 *       - Refaire la boite de dialogue A propos de ...
 *       - nouvelle barre d'outil
 *       - configuration barre d'outil
 *       - Mémorisation de plusieurs destinataire
 *       - Fichier -> Ouvrir
 *       - Ouvrir avec fichier en paramètre
 *       - Drag&Drop ouvre le fichier
 *       - Drag&Drop aussi intégrer la liste de ce qui se trouve dans le fichier
 *       - multi modification
 *       - Fichier -> Exporter (en CVS, excel...)
 *       - gérer un apperçu avant impression
 *}
{
    A FAIRE :
              - Supprimer : gérer les multi-lignes et demander confirmation [OK]
              - Gérer l'ajout d'une ligne avec contrôle clef RIB [OK]
              - Nouveau : vérifier que le fichier à été enregistrer avant de tout effacer [OK]
              - Quitter : vérifier que le fichier à été enregistrer avant de quitter et enregistrer les données RIB émetteur s'il le souhaite [OK]
              - Démarrage relire les infos dans la base de registre [OK]
              - Monter [ABANDONNE]
              - Descendre [ABANDONNE]
              - pouvoir effacer les infos dans la base de registres [OK]
              - gestion des caractères interdits [OK]
              - Montant, vérifier la saisie ##############.##   (14+2) [OK]
              - contrôler la taille de champs saisie [OK]
              - Enregistrer* : noter que le fichier à été enregistrer   (attention réf émission seuleùent pour prélévement) [OK]
              - Convertir en majuscule les saisie [OK]
              - A propos de : faire la boite de dialogue [OK]

              V1.1
              - Modifier : ne gérer qu'une ligne [OK]
              - Si double clique sur une ligne, modifie [OK]
              - recharger les infos de la base de registre [OK]
              - ajouter l'extention si pas mis à la main [OK]
              - Sélectionner le mois et le jour en cours au démarrage de l'application [OK]
              - Trier la liste en cliquant sur le titre de colone [OK]
              - Résolution du bug Supp [OK]
              - contrôler la taille de champs saisie -> lorsqu'on fait un coller [OK]
              - optimiser [OK]
              - Lignes -> Copier, Couper, Coller [OK]
              - Réinitialiser la police [OK]

    A TERMINER :

}
unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, DateUtils, ExtCtrls, Buttons, Mask, Menus, Registry,
  apropos, AddModLine, ToolWin, ImgList, Printers, ShellAPI, UnitLicence ;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    Fichier1: TMenuItem;
    Lignes1: TMenuItem;
    Divres1: TMenuItem;
    Nouveau1: TMenuItem;
    N1: TMenuItem;
    Enregistrerprlvement1: TMenuItem;
    Enregistrerprlvementacclr1: TMenuItem;
    Enregistrervirement1: TMenuItem;
    N2: TMenuItem;
    Quitter1: TMenuItem;
    Supprimer1: TMenuItem;
    Modifier1: TMenuItem;
    Aproposde1: TMenuItem;
    ListView1: TListView;
    N4: TMenuItem;
    outslectionner1: TMenuItem;
    Inverserlaslection1: TMenuItem;
    Effacerlesinformationsinscritentdanslabasederegistre1: TMenuItem;
    SaveDialog1: TSaveDialog;
    Ajouter1: TMenuItem;
    ToolBar1: TToolBar;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Emetteur_RaisonSociale: TEdit;
    GroupBox3: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Emetteur_Banque: TEdit;
    SouvenirEmetteur: TCheckBox;
    Emetteur_RIB: TMaskEdit;
    Emetteur_NumPrelevement: TMaskEdit;
    Emetteur_NumVirement: TMaskEdit;
    RefferenceEmission: TEdit;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ImageList1: TImageList;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    PopupMenu1: TPopupMenu;
    Enregistrerprlvement2: TMenuItem;
    Enregistrerprlvementacclr2: TMenuItem;
    Enregistrervirement2: TMenuItem;
    Rechargerlesinformationsmmorisesdelmetteur1: TMenuItem;
    N3: TMenuItem;
    Copier1: TMenuItem;
    Couper1: TMenuItem;
    Coller1: TMenuItem;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    N6: TMenuItem;
    Imprimer1: TMenuItem;
    PrintDialog1: TPrintDialog;
    PrinterSetupDialog1: TPrinterSetupDialog;
    Configurerlimpression1: TMenuItem;
    Configurerpolicedimpression1: TMenuItem;
    FontDialog1: TFontDialog;
    N7: TMenuItem;
    Rinitialiserlapolicedimpression1: TMenuItem;
    Aide1: TMenuItem;
    Licence1: TMenuItem;
    N8: TMenuItem;
    procedure ajouterClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure Supprimer1Click(Sender: TObject);
    procedure Lignes1Click(Sender: TObject);
    procedure SouvenirEmetteurClick(Sender: TObject);
    procedure outslectionner1Click(Sender: TObject);
    procedure Inverserlaslection1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Quitter1Click(Sender: TObject);
    procedure Nouveau1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Effacerlesinformationsinscritentdanslabasederegistre1Click(
      Sender: TObject);
    procedure Emetteur_RaisonSocialeKeyPress(Sender: TObject;
      var Key: Char);
    procedure Enregistrerprlvement1Click(Sender: TObject);
    procedure Enregistrerprlvementacclr1Click(Sender: TObject);
    procedure Enregistrervirement1Click(Sender: TObject);
    procedure Aproposde1Click(Sender: TObject);
    procedure ListView1Enter(Sender: TObject);
    procedure ListView1Exit(Sender: TObject);
    procedure Modifier1Click(Sender: TObject);
    procedure Rechargerlesinformationsmmorisesdelmetteur1Click(
      Sender: TObject);
    procedure ListView1ColumnClick(Sender: TObject; Column: TListColumn);
    procedure Emetteur_RaisonSocialeChange(Sender: TObject);
    procedure ListView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Copier1Click(Sender: TObject);
    procedure Coller1Click(Sender: TObject);
    procedure Couper1Click(Sender: TObject);
    procedure Imprimer1Click(Sender: TObject);
    procedure Configurerlimpression1Click(Sender: TObject);
    procedure Configurerpolicedimpression1Click(Sender: TObject);
    procedure Rinitialiserlapolicedimpression1Click(Sender: TObject);
    procedure Licence1Click(Sender: TObject);
  private
    { Déclarations privées }
    Modif : Boolean ;
    function ExtraireClefRIB(RIB : String) : ShortInt ;
    function CalculerClefRIB(RIB : String) : ShortInt ;
    function Valeur(Caractere : Char) : Char ;
    function StrNCopyNWithValeur(debut : Integer; fin : integer; chaine : String) : String ;
    procedure Save(Ligne1 : String; Ligne2 : String; Ligne3 : String; Ref : String) ;
    procedure LoadRegistry ;
    function Completer(Texte : String; longueur : Integer) : String ;
    procedure Supprimer ;        
  public
    { Déclarations publiques }
    function CheckRIB(RIB : String) : Boolean ;
    function CheckVirgule(chaine : string) : boolean ;
  end;

var
  Form1: TForm1;

Const
  TEXTE_SAUVEGARDE_AVANT : PChar = 'Vous n''avez pas enregistré les modifications ! Souhaitez-vous les enregistrer ?' ;
  TITRE_SAUVEGARDE_AVANT : PChar = 'Modification' ;
  OPTION_SAUVEGARDE_AVANT : Integer = MB_YESNO + MB_ICONQUESTION ;
  CHEMIN_REGISTRE = 'Software\QuickVirPrel' ;
implementation

{$R *.dfm}

{*******************************************************************************
 * Ajoute la ligne
 ******************************************************************************}
procedure TForm1.ajouterClick(Sender: TObject);
var ListItem : TListItem;
    oldIndex : Integer ;
    AjouterModifierLigne : TAjouterModifierLigne ;
begin
    AjouterModifierLigne := TAjouterModifierLigne.Create(Self) ;

    if AjouterModifierLigne.ShowModal = mrOK
    then begin
        oldIndex := ListView1.ItemIndex ;

        ListItem := ListView1.Items.Add ;

        ListItem.Caption := AjouterModifierLigne.Destinataire_RaisonSociale.Text ;
        ListItem.SubItems.Add(AjouterModifierLigne.Destinataire_RIB.Text) ;
        ListItem.SubItems.Add(AjouterModifierLigne.Destinataire_Banque.Text) ;
        ListItem.SubItems.Add(AjouterModifierLigne.Destinataire_Montant.Text) ;
        ListItem.SubItems.Add(AjouterModifierLigne.Destinataire_Reference.Text) ;
        ListItem.SubItems.Add(AjouterModifierLigne.Destinataire_Libelle.Text) ;

        ListView1.ItemIndex := oldIndex ;
        ListView1.SetFocus ;

        // Indique qu'il y a eu modification
        Modif := True ;
    end ;
end;

{*******************************************************************************
 * Création de la fenêtre
 ******************************************************************************}
procedure TForm1.FormCreate(Sender: TObject);
Var i : Word ;
    CurYear : Word ;
begin
    // Liste les années possibles à partir de l'année en cours
    CurYear := CurrentYear ;

    For i := CurYear to CurYear + 9 do
    begin
        ComboBox3.Items.Add(IntToStr(i)) ;
    end ;

    ComboBox3.ItemIndex := 0 ;

    // Sélectionne le mois
    ComboBox2.ItemIndex := MonthOf(Now) - 1 ;

    // Sélectionne le mois
    ComboBox1.ItemIndex := DayOf(Now) - 1 ;

    // Pas de modif effectué
    Modif := False ;

    LoadRegistry ;
end;

{*******************************************************************************
 * Si on change de mois ou d'année
 ******************************************************************************}
procedure TForm1.ComboBox2Change(Sender: TObject);
Var i : Word ;
    numDay : Word ;
    temp : String ;
    oldIndex : Integer ;
begin
    numDay := DaysInMonth((EncodeDate(StrToInt(ComboBox3.Items[ComboBox3.ItemIndex]), ComboBox2.ItemIndex + 1, 1))) ;

    // Sauvegarde l'ancien index
    oldIndex := ComboBox1.ItemIndex ;

    // Efface la liste des jours
    ComboBox1.Items.Clear ;

    // Créer la liste des jours
    For i := 1 to numDay do
    begin
        temp := IntToStr(i) ;

        if Length(temp) < 2
        then begin
            temp := '0' + temp ;
        end ;

        ComboBox1.Items.Add(temp) ;
    end ;

    // REstaure l'ancien index
    if ComboBox1.Items.Count >= (oldIndex + 1)
    then begin
        ComboBox1.ItemIndex := oldIndex ;
    end
    else begin
        ComboBox1.ItemIndex := ComboBox1.Items.Count - 1 ;
    end ;
end;

{*******************************************************************************
 * Menu supprimer
 ******************************************************************************}
procedure TForm1.Supprimer1Click(Sender: TObject);
begin
    if Application.MessageBox('Êtes-vous sûr de vouloir supprimer les lignes sélectionnées ?', 'Suppression', MB_YESNO + MB_ICONQUESTION) = ID_YES
    then begin
        Supprimer ;
    end ;
end;

{*******************************************************************************
 * Supprime un élément de la liste
 ******************************************************************************}
procedure TForm1.Supprimer ;
Var oldIndex : Integer ;
    i : Integer ;
begin
    oldIndex := ListView1.ItemIndex ;

    // S'il y a des éléments sélectionnés
    if ListView1.SelCount > 0
    then begin
        i := 0 ;

        repeat
            if ListView1.Items[i].Selected = True
            then begin
                ListView1.Items.Delete(i) ;
            end
            else begin
                i := i + 1 ;
            end ;
        until i = ListView1.Items.Count ;
    end ;

    // Resélectionne la liste
    if ListView1.Items.Count <> 0
    then begin
        if oldIndex < ListView1.Items.Count - 1
        then begin
            ListView1.ItemIndex := oldIndex ;
        end
        else begin
            ListView1.ItemIndex := ListView1.Items.Count - 1 ;
        end ;

        ListView1.SetFocus ;
    end
    else begin
        ToolButton5.Enabled := False ;
        ToolButton4.Enabled := False ;
        ToolButton7.Enabled := False ;
        ToolButton9.Enabled := False ;
    end ;
end;

{*******************************************************************************
 * Active ou désactive le menu supprimer
 ******************************************************************************}
procedure TForm1.Lignes1Click(Sender: TObject);
begin
    if ListView1.ItemIndex <> -1
    then begin
        Supprimer1.Enabled := True ;
        Modifier1.Enabled := True ;
    end
    else begin
        Supprimer1.Enabled := False ;
        Modifier1.Enabled := False ;
    end ;

    if ListView1.Items.Count > 0
    then begin
        outslectionner1.Enabled := True ;
        Inverserlaslection1.Enabled := True ;
    end
    else begin
        outslectionner1.Enabled := False ;
        Inverserlaslection1.Enabled := False ;    
    end ;
end;

{*******************************************************************************
 * Affiche un message d'avertissement si on coche se souvenir des infos
 ******************************************************************************}
procedure TForm1.SouvenirEmetteurClick(Sender: TObject);
begin
    if SouvenirEmetteur.Checked = True
    then
        Application.MessageBox('Les informations bancaires de l''émetteur sont enregistrées dans la base de registre. Si la sécurité est mal définie, quelqu''un pourra y accèder.', 'Attention', MB_OK + MB_ICONWARNING) ;
end;

{*******************************************************************************
 * Sélectionne toute la liste
 ******************************************************************************}
procedure TForm1.outslectionner1Click(Sender: TObject);
begin
    ListView1.SelectAll ;
    ListView1.SetFocus ;
end;

{*******************************************************************************
 * Inverse la sélection
 ******************************************************************************}
procedure TForm1.Inverserlaslection1Click(Sender: TObject);
Var i : Integer ;
begin
    if ListView1.Items.Count > 0
    then begin
        For i := 0 to ListView1.Items.Count - 1 do
        begin
            if ListView1.Items[i].Selected
            then begin
                ListView1.Items[i].Selected := False ;
            end
            else begin
                ListView1.Items[i].Selected := True ;
            end ;
        end ;

        ListView1.SetFocus ;
    end ;
end;

{*******************************************************************************
 * Vérifie la validité du rib
 ******************************************************************************}
function TForm1.CheckRIB(RIB : String) : Boolean ;
var temp, temp1 : ShortInt ;
begin
    temp := ExtraireClefRIB(RIB) ;
    temp1 := CalculerClefRIB(RIB) ;

    Result := (temp = temp1) ;
end ;

{*******************************************************************************
 * Extrait la clef du RIB
 ******************************************************************************}
function TForm1.ExtraireClefRIB(RIB : String) : ShortInt ;
begin
  try
    Result := StrToInt(RIB[25] + RIB[26]) ;
  except
    on E: EConvertError do
      Result := 0 ;
  end ;

end ;

{*******************************************************************************
 * Calcule la clef du RIB
 ******************************************************************************}
function TForm1.CalculerClefRIB(RIB : String) : ShortInt ;
Var Banque, Guichet : Integer ;
    Compte : Int64 ;
    a,c,d,e : Integer ;
begin
    Banque := StrToInt(StrNCopyNWithValeur(1, 5, RIB)) ;
    Guichet := StrToInt(StrNCopyNWithValeur(7, 11, RIB)) ;
    Compte := StrToInt64(StrNCopyNWithValeur(13, 23, RIB)) ;

    a := Banque * 8 ;
    Banque := a div 97 ;
    Banque := a - (Banque * 97) ;
    d := Guichet * 15 ;
    Guichet := d div 97 ;
    Guichet := 97 - (d - (Guichet * 97)) ;
    c := 3 * Compte ;
    Compte := c div 97 ;
    Compte := 97 - (c - (Compte * 97)) ;
    d := Banque + Guichet + Compte ;
    e := d div 97 ;
    Result := d - (e * 97) ;

    if Result = 0
    then
        Result := 97 ;
end ;

{*******************************************************************************
 * Copie les parties du RIB en convertissant leur équivalant en lettre
 ******************************************************************************}
function TForm1.StrNCopyNWithValeur(debut : Integer; fin : integer; chaine : String) : String ;
Var i : Integer ;
begin
    Result := '' ;

    For i := debut to fin do
    begin
        Result := Result + Valeur(chaine[i]) ;
    end ;
end ;

{*******************************************************************************
 * Donne la valeur du caract_res
 ******************************************************************************}
function TForm1.Valeur(Caractere : Char) : Char ;
begin
    if (Caractere in ['0'..'9'])
    then begin
         Result := Caractere ;
    end
    else if (Caractere in ['A', 'J'])
    then begin
        Result := '1' ;
    end
    else if (Caractere in ['B', 'K', 'S'])
    then begin
        Result := '2' ;
    end
    else if (Caractere in ['C', 'L', 'T'])
    then begin
        Result := '3'
    end
    else if (Caractere in ['D', 'M', 'U'])
    then begin
        Result := '4' ;
    end
    else if (Caractere in ['E', 'N', 'V'])
    then begin
        Result := '5' ;
    end
    else if (Caractere in ['F', 'O', 'W'])
    then begin
        Result := '6' ;
    end
    else if (Caractere in ['G', 'P', 'X'])
    then begin
        Result := '7' ;
    end
    else if (Caractere in ['H', 'Q', 'Y'])
    then begin
        Result := '8' ;
    end
    else if (Caractere in ['I', 'R', 'Z'])
    then begin
        Result := '9' ;
    end
    else begin
        Result := '0' ;
    end ;
end ;

{*******************************************************************************
 * Si ferme l'application
 ******************************************************************************}
procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
    if Modif = True
    then begin
         if Application.MessageBox(TEXTE_SAUVEGARDE_AVANT, TITRE_SAUVEGARDE_AVANT, OPTION_SAUVEGARDE_AVANT) = ID_YES
         then begin
             CanClose := False ;
         end ;
    end ;
end;

{*******************************************************************************
 * Quitte le programme
 ******************************************************************************}
procedure TForm1.Quitter1Click(Sender: TObject);
begin
    Close ;
end;

{*******************************************************************************
 * Si on clique sur nouveau
 ******************************************************************************}
procedure TForm1.Nouveau1Click(Sender: TObject);

    procedure nouveauInterne ;
    begin
        ListView1.Clear ;
        Modif := False ;
    end ;
begin
    if Modif = True
    then begin
         if Application.MessageBox(TEXTE_SAUVEGARDE_AVANT, TITRE_SAUVEGARDE_AVANT, OPTION_SAUVEGARDE_AVANT) = ID_NO
         then begin
             nouveauInterne ;
         end ;
    end
    else begin
        nouveauInterne ;
    end ;

end;

{*******************************************************************************
 * Enregistre les informations si voulue
 ******************************************************************************}
procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
Var Registre : TRegistry ;
begin
    if SouvenirEmetteur.Checked
    then begin
        Registre := TRegistry.Create ;

        try
            { Lancer au démarrage de l'ordi }
            Registre.RootKey := HKEY_CURRENT_USER ;
            Registre.OpenKey(CHEMIN_REGISTRE, True) ;

            Registre.WriteString('Emetteur_RaisonSociale', Emetteur_RaisonSociale.Text);
            Registre.WriteString('Emetteur_NumPrelevement', Emetteur_NumPrelevement.Text);
            Registre.WriteString('Emetteur_NumVirement', Emetteur_NumVirement.Text);
            Registre.WriteString('Emetteur_Banque', Emetteur_Banque.Text);
            Registre.WriteString('Emetteur_RIB', Emetteur_RIB.Text);

            Registre.CloseKey ;
        finally
            Registre.Free ;
        end ;
    end ;
end;

{*******************************************************************************
 * Efface les infos dans la base de registre
 ******************************************************************************}
procedure TForm1.Effacerlesinformationsinscritentdanslabasederegistre1Click(
  Sender: TObject);
Var Registre : TRegistry ;
begin
    Registre := TRegistry.Create ;

    try
        { Lancer au démarrage de l'ordi }
        Registre.RootKey := HKEY_CURRENT_USER ;
        Registre.OpenKey(CHEMIN_REGISTRE, True) ;

        Registre.DeleteValue('Emetteur_RaisonSociale');
        Registre.DeleteValue('Emetteur_NumPrelevement');
        Registre.DeleteValue('Emetteur_NumVirement');
        Registre.DeleteValue('Emetteur_Banque');
        Registre.DeleteValue('Emetteur_RIB');

        Registre.CloseKey ;
    finally
        Registre.Free ;
    end ;
end;

{*******************************************************************************
 * Vérifie les données saisies
 ******************************************************************************}
procedure TForm1.Emetteur_RaisonSocialeKeyPress(Sender: TObject;
  var Key: Char);
Var temp : String ;
begin
    if Key > #31
    then begin
        temp := UpperCase(Key) ;
        Key := temp[1] ;

        if not (Key in ['A'..'Z', '0'..'9', '*', '(', ')', '.', ',', '/', '+', '-', ' '])
        then
            Key := #0 ;

        if TEdit(Sender).SelLength = 0
        then begin
             if (TEdit(Sender).Name = 'Emetteur_RaisonSociale') and (Length(TEdit(Sender).Text) >= 24)
             then begin
                 Key := #0 ;
             end
             else if (TEdit(Sender).Name = 'RefferenceEmission') and (Length(TEdit(Sender).Text) >= 11)
             then begin
                 Key := #0 ;
             end ;
         end ;
    end ;
end;

{*******************************************************************************
 * Regarde s'il y a déjà une virgule
 ******************************************************************************}
function TForm1.CheckVirgule(chaine : String) : boolean ;
var i, j : Integer ;
begin
    Result := False ;
    j := Length(Chaine) ;

    For i:= 1 to j do
    begin
        if Chaine[i] = ','
        then
            Result := True ;
    end ;
end ;

{*******************************************************************************
 * Enregistre les données
 ******************************************************************************}
procedure TForm1.Save(Ligne1 : String; Ligne2 : String; Ligne3 : String; Ref : String) ;
Var Fichier : TextFile ;
    Banque, Guichet, Compte : String ;
    i : Integer ;
    Total : Extended ;

    function DateAFB : String ;
    Var temp : String ;
    begin
        Result := ComboBox1.Text ;

        temp := IntToStr(ComboBox2.ItemIndex + 1) ;

        if Length(temp) < 2
        then begin
            temp := '0' + temp ;
        end ;

        Result := Result + temp ;

        Result := Result + ComboBox3.Text[4] ; 
    end ;

    Function CompleterMontant(Texte : String) : String ;
    Var i : Integer ;
    begin
        if not CheckVirgule(Texte)
        then
            Texte := Texte + ',00' ;

        Result := '' ;

        For i := 1 to 17 - Length(Texte) do
        begin
            Result := Result + '0' ;
        end ;

        For i := 1 to Length(Texte) do
        begin
            if Texte[i] <> ','
            then
                Result := Result + Texte[i] ;
        end ;

    end ;

Begin
    if CheckRIB(Emetteur_RIB.Text)
    then begin
        if SaveDialog1.Execute
        then begin
            // Vérifie si l'extention est mise
            if ExtractFileExt(SaveDialog1.FileName) = ''
            then
                SaveDialog1.FileName := SaveDialog1.FileName + '.txt' ;

            Banque := StrNCopyNWithValeur(1, 5, Emetteur_RIB.Text) ;
            Guichet := StrNCopyNWithValeur(7, 11, Emetteur_RIB.Text) ;
            Compte := StrNCopyNWithValeur(13, 23, Emetteur_RIB.Text) ;

            Total := 0 ;

            FileMode := fmOpenWrite ;
            AssignFile(Fichier, SaveDialog1.FileName); { Fichier sélectionné dans la boîte de dialogue }
            Rewrite(Fichier);

            try
                // Première ligne
                WriteLn(Fichier, Ligne1 + '        ' + Ref + '       ' + DateAFB + Completer(Emetteur_RaisonSociale.Text, 24) + Completer(RefferenceEmission.Text, 11) + '               E     ' + Guichet + Compte + '                                               ' + Banque + '      ') ;

                // Lignes
                For i := 0 to ListView1.Items.Count -1 do
                begin
                    Banque := StrNCopyNWithValeur(1, 5, ListView1.Items[i].SubItems[0]) ;
                    Guichet := StrNCopyNWithValeur(7, 11, ListView1.Items[i].SubItems[0]) ;
                    Compte := StrNCopyNWithValeur(13, 23, ListView1.Items[i].SubItems[0]) ;

                    Total := Total + StrToFloat(ListView1.Items[i].SubItems[2]) ;

                    WriteLn(Fichier, Ligne2 + '        ' + Ref + Completer(ListView1.Items[i].SubItems[3], 12) + Completer(ListView1.Items[i].Caption ,24) + Completer(ListView1.Items[i].SubItems[1], 20) + '            ' + Guichet + Compte + CompleterMontant(ListView1.Items[i].SubItems[2]) + Completer(ListView1.Items[i].SubItems[4], 31) + Banque + '      ') ;
                end ;

                // Avant dernière ligne
                WriteLn(Fichier, Ligne3 + '        ' + Ref + '                                                                                    ' + CompleterMontant(FloatToStr(Total)) + '                                          ') ;
            finally
                CloseFile(Fichier);
            end ;            
        end ;
    end
    else
        Application.MessageBox('La clef RIB de l''émetteur que vous tentez d''ajouter est erronée. Vérifier la.', 'Erreur clef RIB', MB_OK + MB_ICONERROR) ;
end ;

{*******************************************************************************
 * Enregistre Prélévement
 ******************************************************************************}
procedure TForm1.Enregistrerprlvement1Click(Sender: TObject);
begin
    Save('0308', '0608', '0808', Emetteur_NumPrelevement.Text) ;
    Modif := False ;
end;

{*******************************************************************************
 * Enregistre Prélévement accéléré
 ******************************************************************************}
procedure TForm1.Enregistrerprlvementacclr1Click(Sender: TObject);
begin
    Save('0385', '0685', '0885', Emetteur_NumPrelevement.Text) ;
    Modif := False ;
end;

{*******************************************************************************
 * Enregistre Virement
 ******************************************************************************}
procedure TForm1.Enregistrervirement1Click(Sender: TObject);
Var temp : String ;
begin
    // Il n'y a pas la référence en virement
    temp := RefferenceEmission.Text ;
    RefferenceEmission.Text := '' ;

    Save('0302', '0602', '0802', Emetteur_NumVirement.Text) ;
    Modif := False ;

    RefferenceEmission.Text := temp ;
end;

{*******************************************************************************
 * A propos de ...
 ******************************************************************************}
procedure TForm1.Aproposde1Click(Sender: TObject);
Var Fiche : TFeuilleApropos ;
begin
    Fiche := TFeuilleApropos.Create(Self) ;
    Fiche.ShowModal ;
    Fiche.Free ;
end;

{*******************************************************************************
 * Focus donner à ListView1
 ******************************************************************************}
procedure TForm1.ListView1Enter(Sender: TObject);
begin
    if TListView(Sender).ItemIndex <> -1
    then begin
        ToolButton5.Enabled := True ;
        ToolButton4.Enabled := True ;
        ToolButton7.Enabled := True ;
        ToolButton9.Enabled := True ;
        Copier1.Enabled := True ;
        Couper1.Enabled := True ;
    end
    else begin
        ToolButton5.Enabled := False ;
        ToolButton4.Enabled := False ;
        ToolButton7.Enabled := False ;
        ToolButton9.Enabled := False ;
        Copier1.Enabled := False ;
        Couper1.Enabled := False ;
    end ;
end;

{*******************************************************************************
 * ListView1 perd le focus
 ******************************************************************************}
procedure TForm1.ListView1Exit(Sender: TObject);
begin
    ToolButton5.Enabled := False ;
    ToolButton4.Enabled := False ;
    ToolButton7.Enabled := False ;
    ToolButton9.Enabled := False ;
    Copier1.Enabled := False ;
    Couper1.Enabled := False ;
end;

procedure TForm1.Modifier1Click(Sender: TObject);
Var AjouterModifierLigne : TAjouterModifierLigne ;
begin
    AjouterModifierLigne := TAjouterModifierLigne.Create(Self) ;
    AjouterModifierLigne.ajouter.Caption := 'Modifier l''opération' ;

    AjouterModifierLigne.Destinataire_RaisonSociale.Text := ListView1.Items[ListView1.ItemIndex].Caption ;
    AjouterModifierLigne.Destinataire_RIB.Text := ListView1.Items[ListView1.ItemIndex].SubItems[0] ;
    AjouterModifierLigne.Destinataire_Banque.Text := ListView1.Items[ListView1.ItemIndex].SubItems[1] ;
    AjouterModifierLigne.Destinataire_Montant.Text := ListView1.Items[ListView1.ItemIndex].SubItems[2] ;
    AjouterModifierLigne.Destinataire_Reference.Text := ListView1.Items[ListView1.ItemIndex].SubItems[3] ;
    AjouterModifierLigne.Destinataire_Libelle.Text := ListView1.Items[ListView1.ItemIndex].SubItems[4] ;

    if AjouterModifierLigne.ShowModal = mrOK
    then begin
        ListView1.Items[ListView1.ItemIndex].Caption := AjouterModifierLigne.Destinataire_RaisonSociale.Text ;
        ListView1.Items[ListView1.ItemIndex].SubItems[0] := AjouterModifierLigne.Destinataire_RIB.Text ;
        ListView1.Items[ListView1.ItemIndex].SubItems[1] := AjouterModifierLigne.Destinataire_Banque.Text ;
        ListView1.Items[ListView1.ItemIndex].SubItems[2] := AjouterModifierLigne.Destinataire_Montant.Text ;
        ListView1.Items[ListView1.ItemIndex].SubItems[3] := AjouterModifierLigne.Destinataire_Reference.Text ;
        ListView1.Items[ListView1.ItemIndex].SubItems[4] := AjouterModifierLigne.Destinataire_Libelle.Text ;

        Modif := True ;
    end ;
end;

{*******************************************************************************
 * Charge les infos de la base de registre
 ******************************************************************************}
procedure TForm1.LoadRegistry ;
Var Registre : TRegistry ;
    Style : Integer ;
begin
    Registre := TRegistry.Create ;

    try
        Registre.RootKey := HKEY_CURRENT_USER ;
        Registre.OpenKey(CHEMIN_REGISTRE, True) ;

        Emetteur_RaisonSociale.Text := Registre.ReadString('Emetteur_RaisonSociale');
        Emetteur_NumPrelevement.Text := Registre.ReadString('Emetteur_NumPrelevement');
        Emetteur_NumVirement.Text := Registre.ReadString('Emetteur_NumVirement');
        Emetteur_Banque.Text := Registre.ReadString('Emetteur_Banque');
        Emetteur_RIB.Text := Registre.ReadString('Emetteur_RIB');

        if Registre.ValueExists('Font_Charset')
        then
            FontDialog1.Font.Charset := Registre.ReadInteger('Font_Charset') ;

        if Registre.ValueExists('Font_Color')
        then
            FontDialog1.Font.Color := Registre.ReadInteger('Font_Color') ;

        if Registre.ValueExists('Font_Height')
        then
            FontDialog1.Font.Height := Registre.ReadInteger('Font_Height') ;

        if Registre.ValueExists('Font_Name')
        then
            FontDialog1.Font.Name := Registre.ReadString('Font_Name') ;

        if Registre.ValueExists('Font_Pitch')
        then begin
            case Registre.ReadInteger('Font_Pitch')  of
                1 : FontDialog1.Font.Pitch := fpFixed ;
                2 : FontDialog1.Font.Pitch := fpVariable ;
                else
                    FontDialog1.Font.Pitch := fpDefault ;
            end ;
        end ;

        if Registre.ValueExists('Font_Size')
        then
            FontDialog1.Font.Size := Registre.ReadInteger('Font_Size') ;

            if Registre.ValueExists('Font_Charset')
            then begin
            Style := Registre.ReadInteger('Font_Style') ;
            FontDialog1.Font.Style := [] ;

            if (Style and 2) <> 0
            then
                FontDialog1.Font.Style :=  FontDialog1.Font.Style + [fsBold];

            if (Style and 4) <> 0
            then
                FontDialog1.Font.Style :=  FontDialog1.Font.Style + [fsItalic];

            if (Style and 8) <> 0
            then
                FontDialog1.Font.Style :=  FontDialog1.Font.Style + [fsUnderline];

            if (Style and 16) <> 0
            then
                FontDialog1.Font.Style :=  FontDialog1.Font.Style + [fsStrikeOut];
        end ;

        Registre.CloseKey ;
    finally
        Registre.Free ;
    end ;
end ;

{*******************************************************************************
 * Charge les infos de la base de registre
 ******************************************************************************}
procedure TForm1.Rechargerlesinformationsmmorisesdelmetteur1Click(
  Sender: TObject);
begin
    LoadRegistry ;
end;

{$J+}
procedure TForm1.ListView1ColumnClick(Sender: TObject;
  Column: TListColumn);
Const Colonne : Integer = -1 ;           { Colone de la dernière fois }
      OrdreCroissant : Boolean = True ; { Odre croissant }
var i, j, NumSubItem : Integer ;
    temp : TListItems ;
    ListItem: TListItem;
    NewListView : TListView ;
    Found : Boolean ;
    Condition : Boolean ;

    { Recopie tous les sous-items et leurs propriétés }
    procedure CopieSubItem(Sender : TListView; ListItem: TListItem; i : Integer) ;
    Var k : Integer ;
    begin
        { Copie les sous items }
        For k := 0 to Sender.Items.Item[i].SubItems.Count - 1 do
        begin
            with Sender.Items.Item[i] do
            begin
                { Copie tout les élements de configurations }
                ListItem.SubItems.Add(SubItems[k]);

                ListItem.Cut := Cut ;
                ListItem.Data := Data ;
                ListItem.DropTarget := DropTarget ;
                ListItem.Focused := Focused ;
                ListItem.Indent := Indent ;
                ListItem.Left := Left ;
                ListItem.OverlayIndex := OverlayIndex ;
                ListItem.Selected := Selected ;
                ListItem.StateIndex := StateIndex ;
                ListItem.Top := Top ;
            end ;
        end ;
    end ;
begin
    { Si on clique sur la même colone, on inverse l'ordre }
    if Colonne = (Column.ID - 6)
    then
        OrdreCroissant := not OrdreCroissant
    else
        OrdreCroissant := True ;

    { Mémorise la colone }
    Colonne := Column.ID - 6 ;

    { Créer une liste view }
    NewListView := TListView.Create(Self) ;
    NewListView.Visible := False ;

    { L'affecte à la feuille courante }
    NewListView.Parent := Self;
    { On mémorise s'il y a les case à cocher car lors de la recopie elles
      apparaissent sans qu'on leur demande quelque chose }
    NewListView.Checkboxes := (Sender as TListView).Checkboxes ;

    { Créer une liste }
    temp := TListItems.Create(NewListView) ;

    {** On trie la première colone **}
    if Column.ID = 6
    then begin
        { Pour chaque élement de la liste qu'on doit trier }
        For i := 0 to (Sender as TListView).Items.Count - 1 do
        begin
            { Indique qu'on n'a pas trouver de position pour l'occurence en
              cours }
            Found := False ;

            { On la trie par rapport à la nouvelle liste }
            For j := 0 to temp.Count -1 do
            begin
                {** Si l'élément se situe avant **}

                { Ci-dessous la condition quand on est en ordre croissant }
                Condition := (Sender as TListView).Items.Item[i].Caption < temp.Item[j].Caption ;

                { Si on veut l'ordre décroissant, on inverse la condition }
                if OrdreCroissant = False
                then
                    Condition := not Condition ;

                if Condition
                then begin
                    { Copie l'item principale }
                    ListItem := temp.Insert(j) ;
                    ListItem.Caption := (Sender as TListView).Items.Item[i].Caption ;

                    CopieSubItem((Sender as TListView), ListItem, i) ;

                    Found := True ;
                    { On sort de la boucle pour ne pas répéter l'élément }
                    Break ;
                end ;
            end ;

            if Found = False
            { Sinon on le copie après }
            then begin
                { Copie l'item principale }
                ListItem := temp.Add ;
                ListItem.Caption := (Sender as TListView).Items.Item[i].Caption ;

                CopieSubItem((Sender as TListView), ListItem, i) ;
            end ;
        end ;
    end
    else begin
       { Mémorise la colone dans une variable évitant ainsi de recalculer a
         chaque fois et gagnant donc du temps en exécution }
        NumSubItem := Column.ID - 6 ;

        { Pour chaque élement de la liste qu'on doit trier }
        For i := 0 to (Sender as TListView).Items.Count - 1 do
        begin
            { Indique qu'on n'a pas trouver de position pour l'occurence en
              cours }
            Found := False ;

            { On la trie par rapport à la nouvelle liste }
            For j := 0 to temp.Count -1 do
            begin
                Condition := (Sender as TListView).Items.Item[i].SubItems.Strings[NumSubItem] < temp.Item[j].SubItems.Strings[NumSubItem] ;

                { Si on veut l'ordre décroissant, on inverse la condition }
                if OrdreCroissant = False
                then
                    Condition := not Condition ;

                if Condition
                then begin
                    { Copie l'item principale }
                    ListItem := temp.Insert(j) ;
                    ListItem.Caption := (Sender as TListView).Items.Item[i].Caption ;

                    CopieSubItem((Sender as TListView), ListItem, i) ;

                    Found := True ;
                    { On sort de la boucle pour ne pas répéter l'élément }
                    Break ;
                end ;
            end ;

            if Found = False
            { Sinon on le copie après }
            then begin
                { Copie l'item principale }
                ListItem := temp.Add ;
                ListItem.Caption := (Sender as TListView).Items.Item[i].Caption ;

                CopieSubItem((Sender as TListView), ListItem, i) ;
            end ;
        end ;
    end ;

    (Sender as TListView).Items.BeginUpdate ;

    (Sender as TListView).Items := NewListView.Items ;
    (Sender as TListView).Checkboxes := NewListView.Checkboxes ;

    (Sender as TListView).Items.EndUpdate ;
end;
{$J-}

{*******************************************************************************
 * Vérifie la longeur
 ******************************************************************************}
procedure TForm1.Emetteur_RaisonSocialeChange(Sender: TObject);
Var len : Integer ;
    i : Integer ;
    temp : String ;
begin
    Len := 0 ;
    Temp := '' ;

    if (TEdit(Sender).Name = 'Emetteur_RaisonSociale')
    then begin
        Len := 24 ;
    end
    else if (TEdit(Sender).Name = 'RefferenceEmission')
    then begin
        Len := 11 ;
    end ;

    if Length(TEdit(Sender).Text) > Len
    then begin
        For i := 1 to Len do
        begin
            temp := temp + TEdit(Sender).Text[i] ;
        end ;

        TEdit(Sender).Text := temp ;
    end ;
end;

{*******************************************************************************
 * Appele les procédure en fonction des touches pressées
 ******************************************************************************}
procedure TForm1.ListView1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key = VK_DELETE
    then
        Supprimer1Click(Sender)
    else if Key = VK_INSERT
    then
        AjouterClick(Sender) ;

end;

{*******************************************************************************
 * Complete par des espaces
 ******************************************************************************}
function TForm1.Completer(Texte : String; longueur : Integer) : String ;
Var i : Integer ;
begin
    Result := Texte ;

    For i := Length(Texte) to longueur - 1 do
    begin
        Result := Result + ' ' ;
    end ;
end ;

{*******************************************************************************
 * Copie les éléments sélectionnés
 ******************************************************************************}
procedure TForm1.Copier1Click(Sender: TObject);
Var Memo : TMemo ;
    i    : Integer ;
begin
    Memo := TMemo.Create(Self);
    Memo.Visible := False ;
    Memo.Parent := Self ;

    For i:= 0 to ListView1.Items.Count - 1 do
    begin
        if ListView1.Items[i].Selected
        then
            Memo.Lines.Add(Completer(ListView1.Items[i].Caption ,24) + ListView1.Items[i].SubItems[0] +
                           Completer(ListView1.Items[i].SubItems[1], 20) + Completer(ListView1.Items[i].SubItems[2], 17) +
                           Completer(ListView1.Items[i].SubItems[3], 12) + Completer(ListView1.Items[i].SubItems[4], 31)) ;
    end ;

    // Sélectionne tout le texte
    Memo.SelectAll ;
    // Copie le texte dans le presse papier
    Memo.CopyToClipboard ;
    // Détuit l'objet
    Memo.Free ;
end;

{*******************************************************************************
 * Colle les éléments du presse papier
 ******************************************************************************}
procedure TForm1.Coller1Click(Sender: TObject);
Var Memo : TMemo ;
    i    : Integer ;
    ListItem : TListItem ;

    function StrNCopyN(debut, fin : Integer; texte : String) : String ;
    Var i : Integer ;
    begin
        Result := '' ;

        For i := debut to fin do
            Result := Result + texte[i] ;
    end ;

    procedure Erreur ;
    begin
        Application.MessageBox('Les données du presse papier sont invalides.', 'Erreur', MB_OK + MB_ICONERROR) ;
    end ;
begin
    Memo := TMemo.Create(Self);
    Memo.Visible := False ;
    Memo.WordWrap := False ;
    Memo.Parent := Self ;

    // Colle le texte du presse papier
    Memo.PasteFromClipboard ;

    // Contrôle la validité des données
    For i := 0 to Memo.Lines.Count - 1 do
    begin
        if Length(Memo.Lines[i]) = 130
        then begin
            ListItem := ListView1.Items.Add ;

            ListItem.Caption := TrimRight(StrNCopyN(1, 24, Memo.Lines[i])) ;
            ListItem.SubItems.Add(TrimRight(StrNCopyN(25, 50, Memo.Lines[i]))) ;
            ListItem.SubItems.Add(TrimRight(StrNCopyN(51, 70, Memo.Lines[i]))) ;
            ListItem.SubItems.Add(TrimRight(StrNCopyN(71, 87, Memo.Lines[i]))) ;
            ListItem.SubItems.Add(TrimRight(StrNCopyN(88, 99, Memo.Lines[i]))) ;
            ListItem.SubItems.Add(TrimRight(StrNCopyN(100, 130, Memo.Lines[i]))) ;
            ListView1.SetFocus ;

        end
        else begin
            Erreur ;
            Break ;
        end ;
    end ;

    // Détuit l'objet
    Memo.Free ;
end;

{*******************************************************************************
 * Coupe les éléments du presse papier
 ******************************************************************************}
procedure TForm1.Couper1Click(Sender: TObject);
begin
    Copier1Click(Sender) ;
    Supprimer ;
end;

{*******************************************************************************
 * Configurer l'impression
 ******************************************************************************}
procedure TForm1.Configurerlimpression1Click(Sender: TObject);
begin
    PrinterSetupDialog1.Execute ;
end;

{*******************************************************************************
 * Configurer la police d'impression
 ******************************************************************************}
procedure TForm1.Configurerpolicedimpression1Click(Sender: TObject);
Var Registre : TRegistry ;
    Pitch : Integer ;
    Style : Integer ;
begin
    if FontDialog1.Execute
    then begin
        Registre := TRegistry.Create ;

        try
            { Lancer au démarrage de l'ordi }
            Registre.RootKey := HKEY_CURRENT_USER ;
            Registre.OpenKey(CHEMIN_REGISTRE, True) ;

            Registre.WriteInteger('Font_Charset', FontDialog1.Font.Charset) ;
            Registre.WriteInteger('Font_Color', FontDialog1.Font.Color) ;
            Registre.WriteInteger('Font_Height', FontDialog1.Font.Height) ;
            Registre.WriteString('Font_Name', FontDialog1.Font.Name) ;

            case FontDialog1.Font.Pitch of
                fpFixed : Pitch := 1 ;
                fpVariable : Pitch := 2 ;
                else
                    Pitch := 0 ;
            end ;

            Registre.WriteInteger('Font_Pitch', Pitch) ;
            Registre.WriteInteger('Font_Size', FontDialog1.Font.Size) ;

            Style := 0 ;

            if fsBold in FontDialog1.Font.Style
            then
                Style := Style + 2 ;

            if fsItalic in FontDialog1.Font.Style
            then
                Style := Style + 4 ;

            if fsUnderline in FontDialog1.Font.Style
            then
                Style := Style + 8 ;

            if fsStrikeOut in FontDialog1.Font.Style
            then
                Style := Style + 16 ;

            Registre.WriteInteger('Font_Style', Style) ;
        finally
            Registre.Free ;
        end ;
    end ;
end;

{*******************************************************************************
 * Configurer la police d'impression
 ******************************************************************************}
procedure TForm1.Rinitialiserlapolicedimpression1Click(Sender: TObject);
Var Registre : TRegistry ;
begin
    FontDialog1.Free ;

    FontDialog1 := TFontDialog.Create(Self);

    Registre := TRegistry.Create ;

    try
        { Lancer au démarrage de l'ordi }
        Registre.RootKey := HKEY_CURRENT_USER ;
        Registre.OpenKey(CHEMIN_REGISTRE, True) ;

        Registre.DeleteValue('Font_Charset');
        Registre.DeleteValue('Font_Color');
        Registre.DeleteValue('Font_Height');
        Registre.DeleteValue('Font_Name');
        Registre.DeleteValue('Font_Pitch');
        Registre.DeleteValue('Font_Size');
        Registre.DeleteValue('Font_Style');

        Registre.CloseKey ;
    finally
        Registre.Free ;
    end ;
end;

{*******************************************************************************
 * Imprime le fichier
 ******************************************************************************}
procedure TForm1.Imprimer1Click(Sender: TObject);
Var PrintText : System.Text ;
    Total : Extended ;    
i : Integer ;

    function DateVirement
     : String ;
    Var temp : String ;
    begin
        Result := ComboBox1.Text ;

        temp := IntToStr(ComboBox2.ItemIndex + 1) ;

        if Length(temp) < 2
        then begin
            temp := '0' + temp ;
        end ;

        Result := Result + '/' + temp ;

        Result := Result + '/' + ComboBox3.Text ; 
    end ;

    procedure PrintLine(var PrintText : System.Text) ;
    begin
        WriteLn(PrintText, '+--------------------------+----------------------------+--------------+---------------------------------+-------------------+') ;
    end ;

    Function CompleterMontant(Texte : String) : String ;
    Var i : Integer ;
    begin
        if not CheckVirgule(Texte)
        then
            Texte := Texte + ',00' ;

        Result := '' ;

        For i := 1 to 17 - Length(Texte) do
        begin
            Result := Result + ' ' ;
        end ;

        For i := 1 to Length(Texte) do
        begin
            Result := Result + Texte[i] ;
        end ;

    end ;
begin
    if PrintDialog1.Execute
    then begin
        Printer.Title := 'Impression d''émision - QuickVirPrel' ;
        AssignPrn(PrintText) ;
        Rewrite(PrintText) ;
        Printer.Canvas.Font := FontDialog1.Font ;

        WriteLn(PrintText, Emetteur_RaisonSociale.Text);
        WriteLn(PrintText, 'Référence du lot : ' + RefferenceEmission.Text);
        WriteLn(PrintText, 'Imprimer le ' + DateToStr(Date) + ' et présenté le ' + DateVirement) ;
        WriteLn(PrintText, 'RIB d''émission' + Emetteur_RIB.Text) ;

        Total := 0 ;

        PrintLine(PrintText) ;
        WriteLn(PrintText, '| Nom                      | RIB                        | Référence    | Libellé                         | Montant           |') ;
        PrintLine(PrintText) ;

        For i := 0 to ListView1.Items.Count -1 do
        begin
            WriteLn(PrintText, '| ' + Completer(ListView1.Items[i].Caption ,24) + ' | ' + ListView1.Items[i].SubItems[0] + ' | ' + Completer(ListView1.Items[i].SubItems[3], 12) + ' | ' + Completer(ListView1.Items[i].SubItems[4], 31) + ' | ' + CompleterMontant(ListView1.Items[i].SubItems[2]) + ' |') ;
            PrintLine(PrintText) ;
            Total := Total + StrToFloat(ListView1.Items[i].SubItems[2]) ;
        end ;
        
        WriteLn(PrintText, IntToStr(ListView1.Items.Count) + ' enregistrement(s) pour un montant total de ' + FloatToStr(Total) + 'euro(s).');

        CloseFile(PrintText) ;
    end ;
end;

{*******************************************************************************
 * Affiche la licence
 ******************************************************************************}
procedure TForm1.Licence1Click(Sender: TObject);
Var Licence : TLicence ;
begin
    Licence := TLicence.Create(Self) ;
    Licence.ShowModal ;
end;

end.
