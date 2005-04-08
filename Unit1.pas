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
 *       - Fichier -> Exporter (en CVS, excel...)
 *       - Lignes -> Copier, Couper, Coller
 *       - Sélectionner le mois et le jour en cours au démarrage de l'application
 *       - Trier la liste en cliquant sur le titre de colone
 *       - Fichier -> Ouvrir
 *       - contrôler la taille de champs saisie -> lorsqu'on fait un coller
 *       - ajouter l'extention si pas mis à la main
 *       - recharger les infos de la base de registre
 *       - pouvoir réduire en systray
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
              - Modifier : ne gérer qu'une ligne
              - Si double clique sur une ligne, modifie

    A TERMINER :

}
unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, DateUtils, ExtCtrls, Buttons, Mask, Menus, Registry,
  apropos ;

type
  TForm1 = class(TForm)
    ajouter: TButton;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Emetteur_RaisonSociale: TEdit;
    GroupBox3: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Emetteur_Banque: TEdit;
    Label9: TLabel;
    RefferenceEmission: TEdit;
    Label10: TLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    Label11: TLabel;
    Label12: TLabel;
    SouvenirEmetteur: TCheckBox;
    Label13: TLabel;
    Destinataire_RaisonSociale: TEdit;
    Label14: TLabel;
    Destinataire_Montant: TEdit;
    Label15: TLabel;
    Destinataire_Reference: TEdit;
    Label21: TLabel;
    Destinataire_Libelle: TEdit;
    Emetteur_RIB: TMaskEdit;
    Label5: TLabel;
    Label6: TLabel;
    Destinataire_Banque: TEdit;
    Label7: TLabel;
    Destinataire_RIB: TMaskEdit;
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
    Aproposde1: TMenuItem;
    ListView1: TListView;
    N4: TMenuItem;
    outslectionner1: TMenuItem;
    Inverserlaslection1: TMenuItem;
    N5: TMenuItem;
    Effacerlesinformationsinscritentdanslabasederegistre1: TMenuItem;
    Emetteur_NumPrelevement: TMaskEdit;
    Emetteur_NumVirement: TMaskEdit;
    SaveDialog1: TSaveDialog;
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
    procedure Destinataire_MontantKeyPress(Sender: TObject; var Key: Char);
    procedure Enregistrerprlvement1Click(Sender: TObject);
    procedure Enregistrerprlvementacclr1Click(Sender: TObject);
    procedure Enregistrervirement1Click(Sender: TObject);
    procedure Aproposde1Click(Sender: TObject);
  private
    { Déclarations privées }
    Modif : Boolean ;
    function CheckRIB(RIB : String) : Boolean ;
    function ExtraireClefRIB(RIB : String) : ShortInt ;
    function CalculerClefRIB(RIB : String) : ShortInt ;
    function Valeur(Caractere : Char) : Char ;
    function StrNCopyNWithValeur(debut : Integer; fin : integer; chaine : String) : String ;
    procedure Save(Ligne1 : String; Ligne2 : String; Ligne3 : String; Ref : String) ;
    function CheckVirgule(chaine : string) : boolean ;
  public
    { Déclarations publiques }
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
begin
    if CheckRIB(Destinataire_RIB.Text)
    then begin
        oldIndex := ListView1.ItemIndex ;

        ListItem := ListView1.Items.Add ;

        ListItem.Caption := Destinataire_RaisonSociale.Text ;
        ListItem.SubItems.Add(Destinataire_RIB.Text) ;
        ListItem.SubItems.Add(Destinataire_Banque.Text) ;
        ListItem.SubItems.Add(Destinataire_Montant.Text) ;
        ListItem.SubItems.Add(Destinataire_Reference.Text) ;
        ListItem.SubItems.Add(Destinataire_Libelle.Text) ;

        ListView1.ItemIndex := oldIndex ;
        ListView1.SetFocus ;

        // Indique qu'il y a eu modification
        Modif := True ;

        // Réinitialise les divers éléments laissés tel quel pour la programmation
        Destinataire_RaisonSociale.Text := '' ;
        Destinataire_RIB.Text := '' ;
        Destinataire_Banque.Text := '' ;
        Destinataire_Montant.Text := '' ;
        Destinataire_Reference.Text := '' ;
        Destinataire_Libelle.Text := '' ;
    end
    else begin
        Application.MessageBox('La clef RIB du destinataire que vous tentez d''ajouter est erronée. Vérifier la.', 'Erreur clef RIB', MB_OK + MB_ICONERROR) ;
    end ;
end;

{*******************************************************************************
 * Création de la fenêtre
 ******************************************************************************}
procedure TForm1.FormCreate(Sender: TObject);
Var i : Word ;
    CurYear : Word ;
    Registre : TRegistry ;    
begin
    // Liste les années possibles à partir de l'année en cours
    CurYear := CurrentYear ;

    For i := CurYear to CurYear + 9 do
    begin
        ComboBox3.Items.Add(IntToStr(i)) ;
    end ;

    ComboBox3.ItemIndex := 0 ;

    // Réinitialise les divers éléments laissés tel quel pour la programmation
    Destinataire_RaisonSociale.Text := '' ;
    Destinataire_RIB.Text := '' ;
    Destinataire_Banque.Text := '' ;
    Destinataire_Montant.Text := '' ;
    Destinataire_Reference.Text := '' ;
    Destinataire_Libelle.Text := '' ;

    // Pas de modif effectué
    Modif := False ;

    Registre := TRegistry.Create ;

    try
        { Lancer au démarrage de l'ordi }
        Registre.RootKey := HKEY_CURRENT_USER ;
        Registre.OpenKey(CHEMIN_REGISTRE, True) ;

        Emetteur_RaisonSociale.Text := Registre.ReadString('Emetteur_RaisonSociale');
        Emetteur_NumPrelevement.Text := Registre.ReadString('Emetteur_NumPrelevement');
        Emetteur_NumVirement.Text := Registre.ReadString('Emetteur_NumVirement');
        Emetteur_Banque.Text := Registre.ReadString('Emetteur_Banque');
        Emetteur_RIB.Text := Registre.ReadString('Emetteur_RIB');

        Registre.CloseKey ;
    finally
        Registre.Free ;
    end ;

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
 * Supprime un élément de la liste
 ******************************************************************************}
procedure TForm1.Supprimer1Click(Sender: TObject);
Var oldIndex : Integer ;
    i : Integer ;
begin
    if Application.MessageBox('Êtes-vous sûr de vouloir supprimer les lignes sélectionnées ?', 'Suppression', MB_YESNO + MB_ICONQUESTION) = ID_YES
    then begin
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
        end ;
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
    end
    else begin
        Supprimer1.Enabled := False ;
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
    if (Caractere = '0') or (Caractere = '1') or (Caractere = '2') or (Caractere = '3')
       or (Caractere = '4') or (Caractere = '5') or (Caractere = '6') or (Caractere = '7')
       or (Caractere = '8') or (Caractere = '9')
    then begin
         Result := Caractere ;
    end
    else if (Caractere = 'A') or (Caractere = 'J')
    then begin
        Result := '1' ;
    end
    else if (Caractere = 'B') or (Caractere = 'K') or (Caractere = 'S')
    then begin
        Result := '2' ;
    end
    else if (Caractere = 'C') or (Caractere = 'L') or (Caractere = 'T')
    then begin
        Result := '3'
    end
    else if (Caractere = 'D') or (Caractere = 'M') or (Caractere = 'U')
    then begin
        Result := '4' ;
    end
    else if (Caractere = 'E') or (Caractere = 'N') or (Caractere = 'V')
    then begin
        Result := '5' ;
    end
    else if (Caractere = 'F') or (Caractere = 'O') or (Caractere = 'W')
    then begin
        Result := '6' ;
    end
    else if (Caractere = 'G') or (Caractere = 'P') or (Caractere = 'X')
    then begin
        Result := '7' ;
    end
    else if (Caractere = 'H') or (Caractere = 'Q') or (Caractere = 'Y')
    then begin
        Result := '8' ;
    end
    else if (Caractere = 'I') or (Caractere = 'R') or (Caractere = 'Z')
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

        // Réinitialise les divers éléments laissés tel quel pour la programmation
        Destinataire_RaisonSociale.Text := '' ;
        Destinataire_RIB.Text := '' ;
        Destinataire_Banque.Text := '' ;
        Destinataire_Montant.Text := '' ;
        Destinataire_Reference.Text := '' ;
        Destinataire_Libelle.Text := '' ;

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

        if ((Key >= 'A') and (Key <= 'Z')) or ((Key >= '0') and (Key <= '9')) or
           (Key = '*') or (Key = '(') or (Key = ')') or (Key = '.') or (Key = ',') or
           (Key = '/') or (Key = '+') or (Key = '-') or (Key = ' ')
        then begin
        end
        else
            Key := #0 ;

        if TEdit(Sender).SelLength = 0
        then begin
             if (TEdit(Sender).Name = 'Emetteur_RaisonSociale') and (Length(Emetteur_RaisonSociale.Text) >= 24)
             then begin
                 Key := #0 ;
             end
             else if (TEdit(Sender).Name = 'Destinataire_RaisonSociale') and (Length(Destinataire_RaisonSociale.Text) >= 24)
             then begin
                 Key := #0 ;
             end
             else if (TEdit(Sender).Name = 'Destinataire_Banque') and (Length(Destinataire_Banque.Text) >= 20)
             then begin
                 Key := #0 ;
             end
             else if (TEdit(Sender).Name = 'Destinataire_Reference') and (Length(Destinataire_Reference.Text) >= 12)
             then begin
                 Key := #0 ;
             end
             else if (TEdit(Sender).Name = 'Destinataire_Libelle') and (Length(Destinataire_Libelle.Text) >= 31)
             then begin
                 Key := #0 ;
             end
             else if (TEdit(Sender).Name = 'RefferenceEmission') and (Length(RefferenceEmission.Text) >= 11)
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
 * Vérifie les données saisies
 ******************************************************************************}
procedure TForm1.Destinataire_MontantKeyPress(Sender: TObject;
  var Key: Char);
Const virgule : boolean = False ;

    // Indique si on a deux chiffre après la virgule
    function CheckMoreDataAfterVirgule : boolean ;
    var i, j : Integer ;
        virgule : boolean ;
        nbData : integer ;
    begin
        nbData := 0 ;
        Virgule := False ;
        j := Length(Destinataire_Montant.Text) ;

        For i:= 1 to j do
        begin
            if Destinataire_Montant.Text[i] = ','
            then
                Virgule := True ;

            if Virgule
            then
                nbData := nbData + 1 ;
        end ;

        Result := (nbData < 3) ;
    end ;

begin
    if Key > #31
    then begin
        if ((Key >= '0') and (Key <= '9')) or (Key = '.') or (Key = ',')
        then begin
            if (Key = '.') or (Key = ',')
            then begin
                if (Length(Destinataire_Montant.Text) > 0)
                then
                    Key := ','
                else
                    Key := #0 ;

                if CheckVirgule(Destinataire_Montant.Text)
                then
                    Key := #0 ;    
            end ;
        end
        else
            Key := #0 ;

        if TEdit(Sender).SelLength = 0
        then begin
            // Vérifie la longueur du texte
            if CheckVirgule(Destinataire_Montant.Text) and (Length(Destinataire_Montant.Text) = 17)
            then
                Key := #0 ;

            if (not CheckVirgule(Destinataire_Montant.Text)) and (Length(Destinataire_Montant.Text) = 16)
            then
                Key := #0 ;

            if not CheckMoreDataAfterVirgule
            then
                Key := #0 ;
        end ;
    end ;
end;

{*******************************************************************************
 * Enregistre les données
 ******************************************************************************}
procedure TForm1.Save(Ligne1 : String; Ligne2 : String; Ligne3 : String; Ref : String) ;
Var Fichier : TextFile ;
    Banque, Guichet, Compte : String ;
    i : Integer ;
    Total : Extended ;

    Function Completer(Texte : String; longueur : Integer) : String ;
    Var i : Integer ;
    begin
        Result := Texte ;

        For i := Length(Texte) to longueur - 1 do
        begin
            Result := Result + ' ' ;
        end ;
    end ;

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
            Banque := StrNCopyNWithValeur(1, 5, Emetteur_RIB.Text) ;
            Guichet := StrNCopyNWithValeur(7, 11, Emetteur_RIB.Text) ;
            Compte := StrNCopyNWithValeur(13, 23, Emetteur_RIB.Text) ;

            Total := 0 ;

            FileMode := fmOpenWrite ;
            AssignFile(Fichier, SaveDialog1.FileName); { Fichier sélectionné dans la boîte de dialogue }
            Rewrite(Fichier);

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

            CloseFile(Fichier);
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

procedure TForm1.Aproposde1Click(Sender: TObject);
Var Fiche : TFeuilleApropos ;
begin
    Fiche := TFeuilleApropos.Create(Self) ;
    Fiche.ShowModal ;
    Fiche.Destroy ;
end;

end.
