{*******************************************************************************
 * Copyright MARTINEAU Emeric. Tous droits r�serv�.
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
 *       - pouvoir r�duire en systray [inutile]
 *       - popup menu sur liste [inutile]
 *       - Drag&Drop aussi int�grer la liste de ce qui se trouve dans le fichier [annul�]
 *       - multi modification [annul�]
 *
 *
 *
 *
 *       Version 2.1
 *       - Demander si on veut imprimer lorsqu'on a enregistrer un fichier (Configurable)
 *       - Pouvoir r�initialiser la config par d�faut
 *       - pouvoir r�initiliser les param�tres par la lignes de commandes ou pouvoir lancer le panneau de configuration 
 *       - Exportation HTML, XHTML, XML, CVS, Excel, Word, Texte (comme l'impression)
 *       - Export/Import Emetteur, Destinataire dans un fichier ini pour pouvoir balader les infos
 *       - configuration de la barre d'outil
 *       - pouvoir configurer la v�rification d'�metteur pr�sent dans la base de registre au d�marrage
 *       - pouvoir configurer o� sont enregistrer les informations Emetteur/Destinataire :
 *             Information propre � chaque utilisateur (HKCU)
 *             Information commun � tous les utilisateurs de cet ordinateur (HKLM)
 *       - m�moriser taille et position des fen�tres (pouvoir configurer que non)
 *       - M�moriser taille des colones
 *       - faire un outil pour calculer les clefs RIB
 *       - possibilit� de charger un �metteur autre � partir d'un �metteur connu
 *       - g�rer un apper�u avant impression
 *       - pouvoir afficher une grille ListView1.GridLines := TRue ;
 *       - ListView1.HotTrak & HotTrackStyles, ListView1.FullDrag
 *       - D�sactiver v�rifiaction RIB
 * 
 *
 *       Version 1.4
 *       - Faire une version en r�seau
 *}
{
    A FAIRE :
              - Supprimer : g�rer les multi-lignes et demander confirmation [OK]
              - G�rer l'ajout d'une ligne avec contr�le clef RIB [OK]
              - Nouveau : v�rifier que le fichier � �t� enregistrer avant de tout effacer [OK]
              - Quitter : v�rifier que le fichier � �t� enregistrer avant de quitter et enregistrer les donn�es RIB �metteur s'il le souhaite [OK]
              - D�marrage relire les infos dans la base de registre [OK]
              - Monter [ABANDONNE]
              - Descendre [ABANDONNE]
              - pouvoir effacer les infos dans la base de registres [OK]
              - gestion des caract�res interdits [OK]
              - Montant, v�rifier la saisie ##############.##   (14+2) [OK]
              - contr�ler la taille de champs saisie [OK]
              - Enregistrer* : noter que le fichier � �t� enregistrer   (attention r�f �mission seule�ent pour pr�l�vement) [OK]
              - Convertir en majuscule les saisie [OK]
              - A propos de : faire la boite de dialogue [OK]

              V1.0
              - Modifier : ne g�rer qu'une ligne [OK]
              - Si double clique sur une ligne, modifie [OK]
              - recharger les infos de la base de registre [OK]
              - ajouter l'extention si pas mis � la main [OK]
              - S�lectionner le mois et le jour en cours au d�marrage de l'application [OK]
              - Trier la liste en cliquant sur le titre de colone [OK]
              - R�solution du bug Supp [OK]
              - contr�ler la taille de champs saisie -> lorsqu'on fait un coller [OK]
              - optimiser [OK]
              - Lignes -> Copier, Couper, Coller [OK]
              - R�initialiser la police [OK]
              - Fichier -> Imprimer
              - Cr�er un menu Aide, avec licence, et apropos de ...

              V2.0
              - Refaire la boite de dialogue A propos de ...
              - Modifier l'impression pour avoir des saut de ligne avant et apr�s le tableau
              - Renommer menu Divers par Outils
              - Changer l'icone du programme par les clefs
              - nouvelle barre d'outil
              - N'avoir plus qu'un menu enregistrer, mais en type de fichier, dans la boite de dialogue permettre de choisir
                l'un des trois type.
              - Enregistrer sous donc m�moriser le nom, le type d'op�ration  
              - Modif et activation d�sactivation bouton et menu enregistrer
              - Am�lioration des activations/d�sactivation des menus
              - Correction du bug quand double clique quand la liste est vide.
              - Amm�lioration de la pr�sentation de la barre d'outil
              - Utilisation de la propri�t� DefaultExt de la Boite de dialogue e sauvegarde
             - Modifier la MessageBox qui signale qu'il y a des modif et que le fichier n'a pas �t� enregistr�.
               Boutons : oui, non, annuler
                         Oui : Affiche la boite d'enregistrement
                         Non : fait l'action voulu
                         Annuler : annule tout
             - Ajouter/Modifier ligne v�rifier montant
             - Quand une erreur survient lors de l'enregistrement, modif est mis � true. Mettre � false
             - Dans la Caption de la feuille mettre le nom du fichier
             - Ajout du menu Aide -> Visitez le site web de QuickVirPrel
             - Menu Aide -> Historique de versions
             - Trie des colones dans la listes Emetteur
             - Afficher un assistant si pas de destinataire existant au d�marrage
             - Correction du bug de calcule de la clef RIB
             - V�rifier lors de l'ajout d'un �metteur qu'il n'existe pas (par le RIB)
             - M�morisation de plusieurs �metteurs -> bouton autre
             - Fichier -> Ouvrir
             - Ouvrir avec fichier en param�tre
             - Drag&Drop ouvre le ou les fichier(s)
             - gestion liste des destinataires
             - historique des versions
             - v�rification d'une nouvelle version disponible
             - alignement � droite des chiffre
             - suppression de l'obligation de saisir un n� de virement et des r�f�rences
             - ajouter ,00 si pas de virgule pour meilleur lisibilit�
             - Enregistrement des tailles des colonnes
             - correction d'un bug qui tronquait la premi�re lettre de chaque ligne
             - m�moriser taille fen�tre
             - correction d'un bug qui emp�chait les fen�tres de se d�truire
             - rajout du signe euro sur les lignes du fichiers
    A TERMINER :

}
unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, DateUtils, ExtCtrls, Buttons, Mask, Menus, Registry,
  apropos, AddModLine, ToolWin, ImgList, Printers, ShellAPI, UnitLicence, UnitAjoutEmetteur,
  UnitEmetteur, StrUtils, UnitAjouterDestinataire, UnitDestinataire, UnitUpDate ;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    Fichier1: TMenuItem;
    Lignes1: TMenuItem;
    Divres1: TMenuItem;
    Nouveau1: TMenuItem;
    Enregistrer1: TMenuItem;
    N2: TMenuItem;
    Quitter1: TMenuItem;
    Supprimer1: TMenuItem;
    Modifier1: TMenuItem;
    Aproposde1: TMenuItem;
    ListView1: TListView;
    N4: TMenuItem;
    outslectionner1: TMenuItem;
    Inverserlaslection1: TMenuItem;
    SaveDialog1: TSaveDialog;
    Ajouter1: TMenuItem;
    ToolBar1: TToolBar;
    Enregistrer: TToolButton;
    ToolButton2: TToolButton;
    NouvelleLigne: TToolButton;
    EditerLigne: TToolButton;
    SupprimerLigne: TToolButton;
    N3: TMenuItem;
    Copier1: TMenuItem;
    Couper1: TMenuItem;
    Coller1: TMenuItem;
    ToolButton6: TToolButton;
    Copier: TToolButton;
    Coller: TToolButton;
    Couper: TToolButton;
    N6: TMenuItem;
    Imprimer1: TMenuItem;
    PrintDialog1: TPrintDialog;
    PrinterSetupDialog1: TPrinterSetupDialog;
    Configurerlimpression1: TMenuItem;
    Configurerpolicedimpression1: TMenuItem;
    FontDialog1: TFontDialog;
    Rinitialiserlapolicedimpression1: TMenuItem;
    Aide1: TMenuItem;
    Licence1: TMenuItem;
    N8: TMenuItem;
    Nouveau: TToolButton;
    Ouvrir: TToolButton;
    Imprimer: TToolButton;
    ToolButton11: TToolButton;
    ImageList2: TImageList;
    Police: TToolButton;
    Enregistrersous1: TMenuItem;
    Emetteur1: TMenuItem;
    Ajout1: TMenuItem;
    Modifier2: TMenuItem;
    Supprimer2: TMenuItem;
    VisiterlesiteWebdeQuickVirPrel1: TMenuItem;
    Historiquedesversions1: TMenuItem;
    N1: TMenuItem;
    Panel1: TPanel;
    Panel2: TPanel;
    Label9: TLabel;
    RefferenceEmission: TEdit;
    Label10: TLabel;
    ComboBox1: TComboBox;
    Label11: TLabel;
    ComboBox2: TComboBox;
    Label12: TLabel;
    ComboBox3: TComboBox;
    ListeEmetteurComboBox: TComboBox;
    Label1: TLabel;
    ConfigurerEmetteurAutre: TButton;
    OpenDialog1: TOpenDialog;
    Ouvrir1: TMenuItem;
    Destinataire1: TMenuItem;
    Ajouter2: TMenuItem;
    Modifier3: TMenuItem;
    Supprimer3: TMenuItem;
    Vrifiersinouvelleversiondisponibl1: TMenuItem;
    procedure ajouterClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure Supprimer1Click(Sender: TObject);
    procedure Lignes1Click(Sender: TObject);
    procedure outslectionner1Click(Sender: TObject);
    procedure Inverserlaslection1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Quitter1Click(Sender: TObject);
    procedure Nouveau1Click(Sender: TObject);
    procedure Emetteur_RaisonSocialeKeyPress(Sender: TObject;
      var Key: Char);
    procedure Enregistrer1Click(Sender: TObject);
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
    procedure Enregistrersous1Click(Sender: TObject);
    procedure EmetteurAjout1Click(Sender: TObject);
    procedure VisiterlesiteWebdeQuickVirPrel1Click(Sender: TObject);
    procedure Historiquedesversions1Click(Sender: TObject);
    procedure EmetteurModifier2Click(Sender: TObject);
    procedure Panel1Resize(Sender: TObject);
    procedure ListeEmetteurComboBoxChange(Sender: TObject);
    procedure ConfigurerEmetteurAutreClick(Sender: TObject);
    procedure Ouvrir1Click(Sender: TObject);
    procedure Ajouter2Click(Sender: TObject);
    procedure Modifier3Click(Sender: TObject);
    procedure Vrifiersinouvelleversiondisponibl1Click(Sender: TObject);
//    procedure OnMessage(var Msg: tagMSG; var Handled: Boolean);
  private
    { D�clarations priv�es }
    Modif : Boolean ;
    SaveDialogExitState : Boolean ;
    EmetteurRaisonSocialeAutre : String ;
    EmetteurRIBAutre : String ;
    EmetteurNumeroAutre : String ;
//    OldWindowProc: TWndMethod;
    function ExtraireClefRIB(RIB : String) : ShortInt ;
    function CalculerClefRIB(RIB : String) : ShortInt ;
    function Valeur(Caractere : Char) : Char ;
    function StrNCopyNWithValeur(debut : Integer; fin : integer; chaine : String) : String ;
    function Save(Ligne1 : String; Ligne2 : String; Ligne3 : String; Ref : String) : Integer ;
    procedure LoadRegistry ;
    function Completer(Texte : String; longueur : Integer) : String ;
    procedure Supprimer ;
    procedure LireEmetteur ;
    procedure Wizard ;
    procedure SetModif(Valeur : Boolean) ;
    procedure EnregistrerLeFichier ;
    procedure MiseAJourListeEmetteurComboBox ;
    function StrNCopyN(debut, fin : Integer; texte : String) : String ;
    function ExtraireLigne(ligne : String) : Boolean ;
    function ExtrairePremiereLigne(ligne : String) : Boolean ;
    function ExtraireLigneDestinataire(ligne : String) : Boolean ;
    procedure OuvrirUnFichier ;
    procedure LireDestinataire ;
    function NouveauFichier : Boolean ;
//    Procedure NewWindowProc(var Msg: TMessage);
//    procedure NewResizedProc(var msg:TMessage); message WM_SIZE;
  public
    { D�clarations publiques }
    // Emetteur
    ListeEmetteurRaisonSociale : TStringList ;
    ListeEmetteurRIB : TStringList ;
    ListeEmetteurNumeroVirement : TStringList ;
    ListeEmetteurNumeroPrelevement : TStringList ;
    ListeEmetteurNomBanque : TStringList ;
    // Destinataire
    ListeDestinataireRaisonSociale : TStringList ;
    ListeDestinataireRIB : TStringList ;
    ListeDestinataireNomBanque : TStringList ;
    // Fonctions
    function CheckRIB(RIB : String) : Boolean ;
    function CheckVirgule(chaine : string) : boolean ;
    procedure MiseAjourRegistreEmetteur ;
    procedure MiseAjourRegistreDestinataire ;    
    procedure SauveEmetteurRegistre(Num : Integer; RaisonSocial : String; RIB : String; NumVirement : String; NumPrelevement : String; NomBanque : String; UpdateNB : boolean) ;
    procedure SauveDestinataireRegistre(Num : Integer; RaisonSocial : String; RIB : String; NomBanque : String; UpdateNB : boolean) ;
    procedure WMDropFiles(var Msg: TWMDropFiles); message WM_DROPFILES;
    function  GetVersionProgram : String ;
    procedure GetListViewColumnWidth(ListView : TListView) ;
    procedure SetListViewColumnWidth(ListView : TListView) ;
    procedure SetWindowProperties(Fenetre : TForm) ;
    procedure GetWindowProperties(Fenetre : TForm) ;
  end;

var
  Form1: TForm1;

Const
  TEXTE_SAUVEGARDE_AVANT : PChar = 'Vous n''avez pas enregistr� les modifications ! Souhaitez-vous les enregistrer ?' ;
  TITRE_SAUVEGARDE_AVANT : PChar = 'Modification' ;
  OPTION_SAUVEGARDE_AVANT : Integer = MB_YESNOCANCEL + MB_ICONWARNING ;
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
        SetModif(True) ;
    end ;

    AjouterModifierLigne.Free ;
end;

{*******************************************************************************
 * Cr�ation de la fen�tre
 ******************************************************************************}
procedure TForm1.FormCreate(Sender: TObject);
Var i : Word ;
    CurYear : Word ;
    temp : String ;
begin
    // Charge l'icone de la main de Windows plut�t que de delphi
    Screen.Cursors[crHandPoint] := LoadCursor(0, IDC_HAND);

    // Liste les ann�es possibles � partir de l'ann�e en cours
    CurYear := CurrentYear ;

    For i := CurYear to CurYear + 9 do
    begin
        ComboBox3.Items.Add(IntToStr(i)) ;
    end ;

    ComboBox3.ItemIndex := 0 ;

    // S�lectionne le mois
    ComboBox2.ItemIndex := MonthOf(Now) - 1 ;

    // S�lectionne le mois
    ComboBox1.ItemIndex := DayOf(Now) - 1 ;

    // Pas de modif effectu�
    SetModif(False) ;

    LoadRegistry ;

    // Simule une suppression pour d�sactiver certains �l�ments
    Supprimer ;

    // Initialise la variable
    SaveDialogExitState := True ;

    // Lit les �metteur enregistr�
    LireEmetteur ;

    // Lit les �metteur enregistr�
    LireDestinataire ;

    // Met � jour la liste des �metteurs dans la combobox
    MiseAJourListeEmetteurComboBox ;

    // Si on � un param�tre, c'est qu'on doit ouvrir un fichier
    case ParamCount of
        0 : ;
        1 : begin//ParamStr(1)
                temp := ParamStr(1) ;

                if FileExists(temp)
                then begin
                    OpenDialog1.FileName := temp ;
                    OuvrirUnFichier ;
                end
                else
                    Application.MessageBox(PChar('Le fichier ' + temp + ' est introuvable.'), 'Erreur d''ouverture de fichier', MB_OK + MB_ICONERROR) ;
            end ;
        else
            Application.MessageBox('Trop de param�tre en ligne de commande.' + #13 + #10 + 'QuickVirPrel.exe <le fichier � ouvrir>.', 'Erreur de ligne de commande', MB_OK + MB_ICONERROR) ;
    end ;

    // Indique que l'on peut faire du drag&drop sur la feuille
    DragAcceptFiles(Self.Handle,true);

    GetListViewColumnWidth(ListView1) ;

    GetWindowProperties(Self) ;

(*
    Application.OnMessage := OnMessage;

    // Sauvegarde la WndProc actuelle du DBGrid1.
    OldWindowProc := WindowProc;
    // Affecte une nouvelle proc�dure de fen�tre.
    WindowProc := NewWindowProc;
*)
end;

{*******************************************************************************
 * Si on change de mois ou d'ann�e
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

    // Cr�er la liste des jours
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
    if Application.MessageBox('�tes-vous s�r de vouloir supprimer les lignes s�lectionn�es ?', 'Suppression', MB_YESNO + MB_ICONQUESTION) = ID_YES
    then begin
        Supprimer ;
    end ;
end;

{*******************************************************************************
 * Supprime un �l�ment de la liste
 ******************************************************************************}
procedure TForm1.Supprimer ;
Var oldIndex : Integer ;
    i : Integer ;
begin
    oldIndex := ListView1.ItemIndex ;

    // S'il y a des �l�ments s�lectionn�s
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

    // Res�lectionne la liste
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
        SupprimerLigne.Enabled := False ;
        EditerLigne.Enabled := False ;
        Copier.Enabled := False ;
        Couper.Enabled := False ;
        ListView1.ItemIndex := -1 ;
    end ;
end;

{*******************************************************************************
 * Active ou d�sactive le menu supprimer
 ******************************************************************************}
procedure TForm1.Lignes1Click(Sender: TObject);
begin
    if ListView1.ItemIndex <> -1
    then begin
        Supprimer1.Enabled := True ;
        Modifier1.Enabled := True ;
        Copier1.Enabled := True ;
        Couper1.Enabled := True ;
    end
    else begin
        Supprimer1.Enabled := False ;
        Modifier1.Enabled := False ;
        Copier1.Enabled := False ;
        Couper1.Enabled := False ;
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
 * S�lectionne toute la liste
 ******************************************************************************}
procedure TForm1.outslectionner1Click(Sender: TObject);
begin
    ListView1.SelectAll ;
    ListView1.SetFocus ;
end;

{*******************************************************************************
 * Inverse la s�lection
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
 * V�rifie la validit� du rib
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
    a,d,e : Integer ;
    c : Int64 ;
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
 * Copie les parties du RIB en convertissant leur �quivalant en lettre
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
         case Application.MessageBox(TEXTE_SAUVEGARDE_AVANT, TITRE_SAUVEGARDE_AVANT, OPTION_SAUVEGARDE_AVANT) of
             ID_CANCEL : CanClose := False ;
             ID_YES : begin
                          Enregistrer1Click(Sender) ;
                          CanClose := SaveDialogExitState ;
                      end ;
         end ;
    end ;

    if CanClose = True
    then begin
        SetListViewColumnWidth(ListView1) ;
        SetWindowProperties(Self) ;
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
begin
    NouveauFichier ;
end;

{*******************************************************************************
 * Nouveau fichier
 ******************************************************************************}
function TForm1.NouveauFichier : Boolean ;
    procedure nouveauInterne ;
    begin
        ListView1.Clear ;
        SetModif(False) ;
        Form1.Caption := 'QuickVirPrel [Sans nom]' ;
    end ;
begin
    Result := True ;
    
    if Modif = True
    then begin
         case Application.MessageBox(TEXTE_SAUVEGARDE_AVANT, TITRE_SAUVEGARDE_AVANT, OPTION_SAUVEGARDE_AVANT) of
             ID_NO : nouveauInterne ;
             ID_YES : Enregistrer1Click(Self) ;
             else
                 Result := False ; 
         end ;
    end
    else begin
        nouveauInterne ;
    end ;
end;

{*******************************************************************************
 * V�rifie les donn�es saisies
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
 * Regarde s'il y a d�j� une virgule
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
 * Enregistre les donn�es
 ******************************************************************************}
function TForm1.Save(Ligne1 : String; Ligne2 : String; Ligne3 : String; Ref : String) : Integer ;
Var Fichier : TextFile ;
    Banque, Guichet, Compte : String ;
    i : Integer ;
    Total : Extended ;
    RS, RIB : String ;

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
    Result := -1 ;

    if ListeEmetteurComboBox.Text = 'Autre...'
    then begin
        RIB := EmetteurRIBAutre ;
        RS := EmetteurRaisonSocialeAutre ;
    end
    else begin
        RIB := ListeEmetteurComboBox.Text ;
        RS := ListeEmetteurRaisonSociale.Strings[ListeEmetteurRIB.IndexOf(StrNCopyN(1, 26, RIB))] ;
    end ;

    Banque := StrNCopyNWithValeur(1, 5, RIB) ;
    Guichet := StrNCopyNWithValeur(7, 11, RIB) ;
    Compte := StrNCopyNWithValeur(13, 23, RIB) ;

    Total := 0 ;

    FileMode := fmOpenWrite ;
    AssignFile(Fichier, SaveDialog1.FileName); { Fichier s�lectionn� dans la bo�te de dialogue }
    Rewrite(Fichier);

    try
        // Premi�re ligne
        WriteLn(Fichier, Ligne1 + '        ' + Ref + '       ' + DateAFB +
                Completer(RS, 24) +
                Completer(RefferenceEmission.Text, 11) + '               E     ' +
                Guichet + Compte + '                                               ' +
                Banque + '      ') ;

        // Lignes
        For i := 0 to ListView1.Items.Count -1 do
        begin
            Banque := StrNCopyNWithValeur(1, 5, ListView1.Items[i].SubItems[0]) ;
            Guichet := StrNCopyNWithValeur(7, 11, ListView1.Items[i].SubItems[0]) ;
            Compte := StrNCopyNWithValeur(13, 23, ListView1.Items[i].SubItems[0]) ;

            Total := Total + StrToFloat(ListView1.Items[i].SubItems[2]) ;

            WriteLn(Fichier, Ligne2 + '        ' + Ref + Completer(ListView1.Items[i].SubItems[3], 12) + Completer(ListView1.Items[i].Caption ,24) + Completer(ListView1.Items[i].SubItems[1], 20) + '      E     ' + Guichet + Compte + CompleterMontant(ListView1.Items[i].SubItems[2]) + Completer(ListView1.Items[i].SubItems[4], 31) + Banque + '      ') ;
        end ;

        // Avant derni�re ligne
        WriteLn(Fichier, Ligne3 + '        ' + Ref + '                                                                                    ' + CompleterMontant(FloatToStr(Total)) + '                                          ') ;
        Result := 0;
    finally
        CloseFile(Fichier);
    end ;
end ;

{*******************************************************************************
 * Enregistre Pr�l�vement
 ******************************************************************************}
procedure TForm1.Enregistrer1Click(Sender: TObject);
begin
    if SaveDialog1.FileName = 'Sans nom.txt'
    then
        Enregistrersous1Click(Sender)
    else
        EnregistrerLeFichier ;
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
 * Focus donner � ListView1
 ******************************************************************************}
procedure TForm1.ListView1Enter(Sender: TObject);
begin
    if TListView(Sender).ItemIndex <> -1
    then begin
        EditerLigne.Enabled := True ;
        SupprimerLigne.Enabled := True ;
        Copier.Enabled := True ;
        Couper.Enabled := True ;
        Copier1.Enabled := True ;
        Couper1.Enabled := True ;
    end
    else begin
        EditerLigne.Enabled := False ;
        SupprimerLigne.Enabled := False ;
        Copier.Enabled := False ;
        Couper.Enabled := False ;
        Copier1.Enabled := False ;
        Couper1.Enabled := False ;
    end ;
end;

{*******************************************************************************
 * ListView1 perd le focus
 ******************************************************************************}
procedure TForm1.ListView1Exit(Sender: TObject);
begin
    SupprimerLigne.Enabled := False ;
    EditerLigne.Enabled := False ;
    Copier.Enabled := False ;
    Couper.Enabled := False ;
    Copier1.Enabled := False ;
    Couper1.Enabled := False ;
end;

procedure TForm1.Modifier1Click(Sender: TObject);
Var AjouterModifierLigne : TAjouterModifierLigne ;
begin
    if ListView1.ItemIndex <> -1
    then begin
        AjouterModifierLigne := TAjouterModifierLigne.Create(Self) ;
        AjouterModifierLigne.ajouter.Caption := 'Modifier l''op�ration' ;

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

            SetModif(True) ;
        end ;
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
Const Colonne : Integer = -1 ;           { Colone de la derni�re fois }
      OrdreCroissant : Boolean = True ; { Odre croissant }
var i, j, NumSubItem : Integer ;
    temp : TListItems ;
    ListItem: TListItem;
    NewListView : TListView ;
    Found : Boolean ;
    Condition : Boolean ;

    { Recopie tous les sous-items et leurs propri�t�s }
    procedure CopieSubItem(Sender : TListView; ListItem: TListItem; i : Integer) ;
    Var k : Integer ;
    begin
        { Copie les sous items }
        For k := 0 to Sender.Items.Item[i].SubItems.Count - 1 do
        begin
            with Sender.Items.Item[i] do
            begin
                { Copie tout les �lements de configurations }
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
    { Si on clique sur la m�me colone, on inverse l'ordre }
    if Colonne = (Column.ID - 6)
    then
        OrdreCroissant := not OrdreCroissant
    else
        OrdreCroissant := True ;

    { M�morise la colone }
    Colonne := Column.ID - 6 ;

    { Cr�er une liste view }
    NewListView := TListView.Create(Self) ;
    NewListView.Visible := False ;

    { L'affecte � la feuille courante }
    NewListView.Parent := Self;
    { On m�morise s'il y a les case � cocher car lors de la recopie elles
      apparaissent sans qu'on leur demande quelque chose }
    NewListView.Checkboxes := (Sender as TListView).Checkboxes ;

    { Cr�er une liste }
    temp := TListItems.Create(NewListView) ;

    {** On trie la premi�re colone **}
    if Column.ID = 6
    then begin
        { Pour chaque �lement de la liste qu'on doit trier }
        For i := 0 to (Sender as TListView).Items.Count - 1 do
        begin
            { Indique qu'on n'a pas trouver de position pour l'occurence en
              cours }
            Found := False ;

            { On la trie par rapport � la nouvelle liste }
            For j := 0 to temp.Count -1 do
            begin
                {** Si l'�l�ment se situe avant **}

                { Ci-dessous la condition quand on est en ordre croissant }
                Condition := (Sender as TListView).Items.Item[i].Caption < temp.Item[j].Caption ;

                { Si on veut l'ordre d�croissant, on inverse la condition }
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
                    { On sort de la boucle pour ne pas r�p�ter l'�l�ment }
                    Break ;
                end ;
            end ;

            if Found = False
            { Sinon on le copie apr�s }
            then begin
                { Copie l'item principale }
                ListItem := temp.Add ;
                ListItem.Caption := (Sender as TListView).Items.Item[i].Caption ;

                CopieSubItem((Sender as TListView), ListItem, i) ;
            end ;
        end ;
    end
    else begin
       { M�morise la colone dans une variable �vitant ainsi de recalculer a
         chaque fois et gagnant donc du temps en ex�cution }
        NumSubItem := Column.ID - 6 ;

        { Pour chaque �lement de la liste qu'on doit trier }
        For i := 0 to (Sender as TListView).Items.Count - 1 do
        begin
            { Indique qu'on n'a pas trouver de position pour l'occurence en
              cours }
            Found := False ;

            { On la trie par rapport � la nouvelle liste }
            For j := 0 to temp.Count -1 do
            begin
                Condition := (Sender as TListView).Items.Item[i].SubItems.Strings[NumSubItem] < temp.Item[j].SubItems.Strings[NumSubItem] ;

                { Si on veut l'ordre d�croissant, on inverse la condition }
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
                    { On sort de la boucle pour ne pas r�p�ter l'�l�ment }
                    Break ;
                end ;
            end ;

            if Found = False
            { Sinon on le copie apr�s }
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
 * V�rifie la longeur
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
 * Appele les proc�dure en fonction des touches press�es
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
 * Copie les �l�ments s�lectionn�s
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

    // S�lectionne tout le texte
    Memo.SelectAll ;
    // Copie le texte dans le presse papier
    Memo.CopyToClipboard ;
    // D�tuit l'objet
    Memo.Free ;
end;

{*******************************************************************************
 * Colle les �l�ments du presse papier
 ******************************************************************************}
procedure TForm1.Coller1Click(Sender: TObject);
Var Memo : TMemo ;
    i    : Integer ;
    ListItem : TListItem ;

    procedure Erreur ;
    begin
        Application.MessageBox('Les donn�es du presse papier sont invalides.', 'Erreur', MB_OK + MB_ICONERROR) ;
    end ;
begin
    Memo := TMemo.Create(Self);
    Memo.Visible := False ;
    Memo.WordWrap := False ;
    Memo.Parent := Self ;

    // Colle le texte du presse papier
    Memo.PasteFromClipboard ;

    // Contr�le la validit� des donn�es
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

    // D�tuit l'objet
    Memo.Free ;
end;

{*******************************************************************************
 * Coupe les �l�ments du presse papier
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
            { Lancer au d�marrage de l'ordi }
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
        { Lancer au d�marrage de l'ordi }
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
        Printer.Title := 'Impression d''�mision - QuickVirPrel' ;
        AssignPrn(PrintText) ;
        Rewrite(PrintText) ;
        Printer.Canvas.Font := FontDialog1.Font ;

        WriteLn(PrintText, ListeEmetteurRaisonSociale.Strings[ListeEmetteurRIB.IndexOf(StrNCopyN(1, 26, ListeEmetteurComboBox.Text))]);
        WriteLn(PrintText, 'R�f�rence du lot : ' + RefferenceEmission.Text);
        WriteLn(PrintText, 'Imprimer le ' + DateToStr(Date) + ' et pr�sent� le ' + DateVirement) ;
        WriteLn(PrintText, 'RIB d''�mission : ' + StrNCopyN(1, 26, ListeEmetteurComboBox.Text)) ;
        WriteLn(PrintText, '') ;

        Total := 0 ;

        PrintLine(PrintText) ;
        WriteLn(PrintText, '| Nom                      | RIB                        | R�f�rence    | Libell�                         | Montant           |') ;
        PrintLine(PrintText) ;

        For i := 0 to ListView1.Items.Count -1 do
        begin
            WriteLn(PrintText, '| ' + Completer(ListView1.Items[i].Caption ,24) + ' | ' + ListView1.Items[i].SubItems[0] + ' | ' + Completer(ListView1.Items[i].SubItems[3], 12) + ' | ' + Completer(ListView1.Items[i].SubItems[4], 31) + ' | ' + CompleterMontant(ListView1.Items[i].SubItems[2]) + ' |') ;
            PrintLine(PrintText) ;
            Total := Total + StrToFloat(ListView1.Items[i].SubItems[2]) ;
        end ;

        WriteLn(PrintText, '') ;
        WriteLn(PrintText, IntToStr(ListView1.Items.Count) + ' enregistrement(s) pour un montant total de ' + FloatToStr(Total) + ' euro(s).');

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
    Licence.Free ;
end;

{*******************************************************************************
 * D�finit la variable Modif
 ******************************************************************************}
procedure TForm1.SetModif(Valeur : Boolean) ;
begin
    Modif := Valeur ;
    Enregistrer.Enabled := Valeur ;
    Enregistrer1.Enabled := Valeur ;
end ;

{*******************************************************************************
 * Menu enregistrer
 ******************************************************************************}
procedure TForm1.Enregistrersous1Click(Sender: TObject);
begin
    SaveDialogExitState := SaveDialog1.Execute ;
    
    if SaveDialogExitState
    then begin
        Form1.Caption := 'QuickVirPrel [' + ExtractFileName(SaveDialog1.FileName) + ']' ;
        Enregistrer1Click(Sender) ;
    end ;
end ;

{*******************************************************************************
 * Enregistre le fichier
 ******************************************************************************}
procedure Tform1.EnregistrerLeFichier ;
Var resultat : Integer ;
    tmp,ref : String ;
begin
    resultat := -1 ;

    case SaveDialog1.FilterIndex of
        1 : begin
                tmp := RefferenceEmission.Text ;
                RefferenceEmission.Text := '' ;

                if ListeEmetteurComboBox.Text = 'Autre...'
                then
                    ref := EmetteurNumeroAutre
                else
                    ref := ListeEmetteurNumeroVirement.Strings[ListeEmetteurRIB.IndexOf(StrNCopyN(1, 26, ListeEmetteurComboBox.Text))] ;

                resultat := Save('0302', '0602', '0802', ref) ;
                RefferenceEmission.Text := tmp ;
            end ;
        2 : resultat := Save('0308', '0608', '0808', ListeEmetteurNumeroPrelevement.Strings[ListeEmetteurRIB.IndexOf(StrNCopyN(1, 26, ListeEmetteurComboBox.Text))]) ;
        3 : resultat := Save('0385', '0685', '0885', ListeEmetteurNumeroPrelevement.Strings[ListeEmetteurRIB.IndexOf(StrNCopyN(1, 26, ListeEmetteurComboBox.Text))]) ;
    end ;

    case Resultat of
        -1 : Application.MessageBox('Une erreur est survenue lors de l''enregistrement.', 'Erreur', MB_OK + MB_ICONERROR) ;
         0 : SetModif(False) ;
    end ;
end;

{*******************************************************************************
 * Affiche la fen�tre de Wizard
 ******************************************************************************}
procedure TForm1.Wizard ;
begin
    Application.MessageBox('Aucun �metteur n''a �t� configur�. Veuillez en saisir un avant de continer.', 'Premier lancement', MB_OK + MB_ICONINFORMATION) ;
    EmetteurAjout1Click(Self) ;
end ;

{*******************************************************************************
 * Lit la liste des �metteurs
 ******************************************************************************}
procedure Tform1.LireEmetteur ;
Var Registre : TRegistry ;
    i, Nb : Integer ;
    tmp : String ;
begin
    Registre := TRegistry.Create ;

    ListeEmetteurRaisonSociale := TStringList.Create ;
    ListeEmetteurRIB := TStringList.Create ;
    ListeEmetteurNumeroVirement := TStringList.Create ;
    ListeEmetteurNumeroPrelevement := TStringList.Create ;
    ListeEmetteurNomBanque := TStringList.Create ;


    try
        { Lancer au d�marrage de l'ordi }
        Registre.RootKey := HKEY_CURRENT_USER ;

        Registre.OpenKey(CHEMIN_REGISTRE + '\Emetteur', True) ;

        if Registre.ValueExists('NB_Emetteur')
        then begin
            Nb := Registre.ReadInteger('NB_Emetteur') ;

            if Nb > 0
            then begin
                For i := 0 to Nb - 1 do
                begin
                    tmp := IntToStr(i) ;
                    ListeEmetteurRIB.Add(Registre.ReadString(tmp + '_RIB')) ;
                    ListeEmetteurNumeroVirement.Add(Registre.ReadString(tmp + '_NumeroVirement')) ;
                    ListeEmetteurNumeroPrelevement.Add(Registre.ReadString(tmp + '_NumeroPrelevement')) ;
                    ListeEmetteurNomBanque.Add(Registre.ReadString(tmp + '_NomBanque')) ;
                    ListeEmetteurRaisonSociale.Add(Registre.ReadString(tmp + '_RaisonSocial')) ;
                end ;
            end
            else
                // Lancer le Wizard
                Wizard ;
        end
        else
            // Lancer le Wizard
            Wizard ;

        Registre.CloseKey ;
    finally
        Registre.Free ;
    end ;
end ;

{*******************************************************************************
 * Lance le site web
 ******************************************************************************}
procedure TForm1.VisiterlesiteWebdeQuickVirPrel1Click(Sender: TObject);
begin
    ShellExecute(Handle, 'OPEN', 'http://php4php.free.fr/quickvirprel/','','',SW_SHOWNORMAL);
end;

{*******************************************************************************
 * Lance le site web
 ******************************************************************************}
procedure TForm1.Historiquedesversions1Click(Sender: TObject);
begin
    ShellExecute(Handle, 'OPEN', PCHar(ExtractFileDir(Application.ExeName) + '\historique.txt'),'','',SW_SHOWNORMAL);
end;

{*******************************************************************************
 * Enregistre un emetteur dans la base de registre
 ******************************************************************************}
procedure TForm1.SauveEmetteurRegistre(Num : Integer; RaisonSocial : String; RIB : String; NumVirement : String; NumPrelevement : String; NomBanque : String; UpdateNB : boolean) ;
Var Registre : TRegistry ;
    tmp : String ;
begin
    Registre := TRegistry.Create ;
    tmp := IntToStr(Num) ;

    try
        { Lancer au d�marrage de l'ordi }
        Registre.RootKey := HKEY_CURRENT_USER ;

        Registre.OpenKey(CHEMIN_REGISTRE + '\Emetteur', True) ;

        Registre.WriteString(tmp + '_RaisonSocial', RaisonSocial) ;
        Registre.WriteString(tmp + '_RIB', RIB) ;
        Registre.WriteString(tmp + '_NumeroVirement', NumVirement) ;
        Registre.WriteString(tmp + '_NumeroPrelevement', NumPrelevement) ;
        Registre.WriteString(tmp + '_NomBanque', NomBanque) ;

        if UpdateNB
        then
            Registre.WriteInteger('NB_Emetteur', Num + 1);

        Registre.CloseKey ;
    finally
        Registre.Free ;
    end ;
end ;

{*******************************************************************************
 * Ajoute un �metteur
 ******************************************************************************}
procedure TForm1.EmetteurAjout1Click(Sender: TObject);
Var AjoutEmetteur : TAjoutEmetteur ;
begin
    AjoutEmetteur := TAjoutEmetteur.Create(Self) ;

    // Si la fen�tre n'est pas visible on l'affiche
    if not Visible
    then
        Show ;

     // Ajouter � la liste si mrOK
    if AjoutEmetteur.ShowModal = mrOK
    then begin
        ListeEmetteurRaisonSociale.Add(AjoutEmetteur.Emetteur_RaisonSociale.Text) ;
        ListeEmetteurRIB.Add(AjoutEmetteur.Emetteur_RIB.Text) ;
        ListeEmetteurNumeroVirement.Add(AjoutEmetteur.Emetteur_NumVirement.Text) ;
        ListeEmetteurNumeroPrelevement.Add(AjoutEmetteur.Emetteur_NumPrelevement.Text) ;
        ListeEmetteurNomBanque.Add(AjoutEmetteur.Emetteur_Banque.Text) ;

        // Enregistrement dans la base de registre
        // Fonction avec valeur du rang et toutes les autres valeurs
        SauveEmetteurRegistre(ListeEmetteurRaisonSociale.Count - 1, AjoutEmetteur.Emetteur_RaisonSociale.Text, AjoutEmetteur.Emetteur_RIB.Text, AjoutEmetteur.Emetteur_NumVirement.Text, AjoutEmetteur.Emetteur_NumPrelevement.Text, AjoutEmetteur.Emetteur_Banque.Text, True) ;
        MiseAJourListeEmetteurComboBox ;
    end ;

    AjoutEmetteur.Free ;
end;

{*******************************************************************************
 * Afficha la liste des �metteur
 ******************************************************************************}
procedure TForm1.EmetteurModifier2Click(Sender: TObject);
Var Emetteur : TEmetteur ;
begin
    Emetteur := TEmetteur.Create(Self);
    Emetteur.ShowModal ;
    MiseAJourListeEmetteurComboBox ;
    Emetteur.Free ;
end;

{*******************************************************************************
 * Met � jour la liste des Emetteurs
 ******************************************************************************}
procedure TForm1.MiseAjourRegistreEmetteur ;
Var Registre : TRegistry ;
    Nb, i : Integer ;
    tmp : string ;
begin
    for i := 0 to ListeEmetteurRaisonSociale.Count - 1 do
    begin
        SauveEmetteurRegistre(i, ListeEmetteurRaisonSociale.Strings[i], ListeEmetteurRIB.Strings[i], ListeEmetteurNumeroVirement.Strings[i], ListeEmetteurNumeroPrelevement.Strings[i], ListeEmetteurNomBanque.Strings[i], False) ;
    end ;

    Registre := TRegistry.Create ;

    try
        { Lancer au d�marrage de l'ordi }
        Registre.RootKey := HKEY_CURRENT_USER ;

        Registre.OpenKey(CHEMIN_REGISTRE + '\Emetteur', True) ;

        if Registre.ValueExists('NB_Emetteur')
        then begin
            Nb := Registre.ReadInteger('NB_Emetteur') ;

            // S'il y a moins de valeur � enregistrer que ce qui se trouve dans
            // la base de registre, on supprimer les clefs restantes
            if Nb > ListeEmetteurRaisonSociale.Count
            then begin
                for i := ListeEmetteurRaisonSociale.Count to Nb do
                begin
                    tmp := IntToStr(i) ;
                    Registre.DeleteValue(tmp + '_RaisonSocial') ;
                    Registre.DeleteValue(tmp + '_RIB') ;
                    Registre.DeleteValue(tmp + '_NumeroVirement') ;
                    Registre.DeleteValue(tmp + '_NumeroPrelevement') ;
                    Registre.DeleteValue(tmp + '_NomBanque') ;
                end ;
            end ;
        end ;

        Registre.WriteInteger('NB_Emetteur', ListeEmetteurRaisonSociale.Count) ;

        Registre.CloseKey ;
    finally
        Registre.Free ;
    end ;
end ;

{*******************************************************************************
 * Met � jour la liste des Emetteurs de la combo box
 ******************************************************************************}
procedure TForm1.MiseAJourListeEmetteurComboBox ;
Var i, OldIndex : Integer ;
begin
    OldIndex := ListeEmetteurComboBox.ItemIndex ;

    ListeEmetteurComboBox.Items.Clear ;

    For i:= 0 to ListeEmetteurRaisonSociale.Count - 1 do
    begin
        ListeEmetteurComboBox.Items.Add(ListeEmetteurRIB.Strings[i] + ' / ' + ListeEmetteurRaisonSociale.Strings[i] + ' / ' + ListeEmetteurNomBanque.Strings[i]) ;
    end ;

    ListeEmetteurComboBox.Items.Add('Autre...') ;

    if (OldIndex <= ListeEmetteurComboBox.Items.Count) and (OldIndex <> -1)
    then
        ListeEmetteurComboBox.ItemIndex := OldIndex
    else
        ListeEmetteurComboBox.ItemIndex := 0 ;
end ;

{*******************************************************************************
 * Copy une chaine de caract�re
 ******************************************************************************}
function TForm1.StrNCopyN(debut, fin : Integer; texte : String) : String ;
Var i : Integer ;
begin
    Result := '' ;

    if fin > length(texte)
    then
        fin := length(texte) - 1;

    For i := debut to fin do
        Result := Result + texte[i] ;
end ;

{*******************************************************************************
 * redimenssione la liste des �metteurs
 ******************************************************************************}
procedure TForm1.Panel1Resize(Sender: TObject);
begin
    if ConfigurerEmetteurAutre.Visible = True
    then begin
        ConfigurerEmetteurAutre.Left := Panel1.ClientWidth - ConfigurerEmetteurAutre.Width - 5 ;
        ListeEmetteurComboBox.Width := Panel1.ClientWidth - ConfigurerEmetteurAutre.Width - ListeEmetteurComboBox.Left - 10 ;
    end
    else
        ListeEmetteurComboBox.width := Panel1.ClientWidth -  ListeEmetteurComboBox.Left - 5;
end;

{*******************************************************************************
 * Fait apparaitre ou disparaitre le bouton configurer
 ******************************************************************************}
procedure TForm1.ListeEmetteurComboBoxChange(Sender: TObject);
begin
    if TComboBox(Sender).Text = 'Autre...'
    then begin
        ConfigurerEmetteurAutre.Left := Panel1.ClientWidth - ConfigurerEmetteurAutre.Width - 5 ;
        ListeEmetteurComboBox.Width := Panel1.ClientWidth - ConfigurerEmetteurAutre.Width - ListeEmetteurComboBox.Left - 10 ;
        ConfigurerEmetteurAutre.Enabled := True ;
        ConfigurerEmetteurAutre.Visible := True ;
    end
    else begin
        ListeEmetteurComboBox.Width := Panel1.ClientWidth - ListeEmetteurComboBox.Left ;
        ConfigurerEmetteurAutre.Enabled := False ;
        ConfigurerEmetteurAutre.Visible := False ;
    end ;
end;

{*******************************************************************************
 * Affiche la fen�tre pour configurer l'�metteur autre
 ******************************************************************************}
procedure TForm1.ConfigurerEmetteurAutreClick(Sender: TObject);
Var AjoutEmetteur : TAjoutEmetteur ;
begin
    AjoutEmetteur := TAjoutEmetteur.Create(Self) ;

    AjoutEmetteur.Emetteur_RaisonSociale.Text := EmetteurRaisonSocialeAutre ;
    AjoutEmetteur.Emetteur_RIB.Text := EmetteurRIBAutre ;
    AjoutEmetteur.Emetteur_NumPrelevement.Text := EmetteurNumeroAutre ;

    AjoutEmetteur.Label3.Visible := False ;
    AjoutEmetteur.Emetteur_NumVirement.Visible := False ;
    AjoutEmetteur.Label4.Visible := False ;
    AjoutEmetteur.Emetteur_Banque.Visible := False ;
    AjoutEmetteur.Label2.Caption := 'N� Emetteur' ;
    AjoutEmetteur.Caption := 'Configuration de l''�metteur' ;

    if AjoutEmetteur.ShowModal = mrOK
    then begin
        EmetteurRaisonSocialeAutre := AjoutEmetteur.Emetteur_RaisonSociale.Text ;
        EmetteurRIBAutre := AjoutEmetteur.Emetteur_RIB.Text ;
        EmetteurNumeroAutre := AjoutEmetteur.Emetteur_NumPrelevement.Text ;
    end ;

    AjoutEmetteur.Free ;

end;

{*******************************************************************************
 * Extrait la premi�re ligne de donn�es
 ******************************************************************************}
function TForm1.ExtrairePremiereLigne(ligne : String) : Boolean ;
Var temp, temp2 : String ;
    Annee1,Annee2 : Integer ;
    Compte, Guichet, Banque : String ;
begin
    Result := False ;
    
    temp := StrNCopyN(3, 12, ligne) ;
    if (temp = '08        ') or (temp = '02        ') or (temp = '85        ')
    then begin
        // Param�tre le type de fichier
        SaveDialog1.FilterIndex := AnsiIndexStr(ligne[3] + ligne[4], ['02', '08', '85']) + 1 ;

        // Num�ro Emetteur
        EmetteurNumeroAutre := StrNCopyN(13, 18, ligne) ;
        
        // Date d'envoie
        // Jour
        ComboBox1.ItemIndex := StrToInt(StrNCopyN(26, 27, ligne)) - 1 ;
        // Mois
        ComboBox2.ItemIndex := StrToInt(StrNCopyN(28, 29, ligne)) - 1 ;
        // Ann�e
        temp := IntToStr(CurrentYear) ;
        Annee1 := StrToInt(temp[4]) ;
        Annee2 := StrToInt(StrNCopyN(30, 30, ligne)) ;

        if Annee1 > Annee2
        then
            Annee2 := Annee2 + 10 ;

        ComboBox3.ItemIndex := Annee2 - Annee1 ;

        // Raison social
        EmetteurRaisonSocialeAutre := TrimRight(StrNCopyN(31, 54, ligne)) ;

        // RIB
        Guichet := StrNCopyN(87, 91, ligne) ;
        Compte := StrNCopyN(92, 102, ligne) ;
        Banque := StrNCopyN(150, 154, ligne) ;

        temp := Banque + '-' + Guichet + '-' + Compte + '-' ;
        temp2 := IntToStr(CalculerClefRIB(temp + '00')) ;

        if length(temp2) = 1
        then
            temp2 := '0' + temp2 ;

        EmetteurRIBAutre := temp + temp2 ;

        // R�f�rence �mission
        RefferenceEmission.Text := StrNCopyN(55, 66, ligne) ;

        Result := True ;
    end
    else
        Application.MessageBox('Erreur sur l''ent�te de la premi�re ligne.', 'Erreur', MB_OK + MB_ICONERROR) ;
end ;

{*******************************************************************************
 * Extrait la ligne de donn�es
 ******************************************************************************}
function TForm1.ExtraireLigne(ligne : String) : Boolean ;
begin
    Result := False ;

    if length(ligne) = 160
    then begin
        case AnsiIndexStr(ligne[1] + ligne[2], ['03', '06', '08']) of
            0 : Result := ExtrairePremiereLigne(ligne) ;
            1 : Result := ExtraireLigneDestinataire(ligne) ;
            2 : Result := True ;// derniere ligne
        end ;
    end
    else
        Application.MessageBox('Lignes trop grandes dans le fichier !', 'Erreur', MB_OK + MB_ICONERROR) ;
end ;

{*******************************************************************************
 * Extrait la ligne de donn�es contenant les op�rations
 ******************************************************************************}
function TForm1.ExtraireLigneDestinataire(ligne : String) : Boolean ;
Var temp, temp2 : String ;
    Compte, Guichet, Banque : String ;
    ListItem : TListItem ;
begin
    Result := False ;
    
    temp := StrNCopyN(3, 12, ligne) ;
    if (temp = '08        ') or (temp = '02        ') or (temp = '85        ')
    then begin
        ListItem := ListView1.Items.Add ;

        ListItem.Caption := TrimRight(StrNCopyN(31, 54, ligne)) ;      // Raison sociale

        // RIB
        Guichet := StrNCopyN(87, 91, ligne) ;
        Compte := StrNCopyN(92, 102, ligne) ;
        Banque := StrNCopyN(150, 154, ligne) ;

        temp := Banque + '-' + Guichet + '-' + Compte + '-' ;
        temp2 := IntToStr(CalculerClefRIB(temp + '00')) ;

        if length(temp2) = 1
        then
            temp2 := '0' + temp2 ;

        ListItem.SubItems.Add(temp + temp2) ;   // RIB
        ListItem.SubItems.Add(TrimRight(StrNCopyN(55, 74, ligne))) ; // Banque

        // Ajoute la virgule
        temp := StrNCopyN(103, 118, ligne) ;
        temp := temp + temp[16] ;
        temp[15] := temp[14] ;
        temp[15] := ',' ;

        // Permet de se d�barraer des 0 devant
        temp := FloatToStr(StrToFloat(temp)) ;

        if not Form1.CheckVirgule(temp)
        then
            temp := temp + ',00' ;

        ListItem.SubItems.Add(temp) ;   // Montant

        ListItem.SubItems.Add(TrimRight(StrNCopyN(19, 30, ligne))) ;  // r�f�rence
        ListItem.SubItems.Add(TrimRight(StrNCopyN(119, 149, ligne))) ;  // libell�

        Result := True ;
    end
    else
        Application.MessageBox('Erreur dans une ligne du fichier.', 'Erreur', MB_OK + MB_ICONERROR) ;    
end ;

{*******************************************************************************
 * Ouvre un fichier � partir du menu et de la barre d'outil
 ******************************************************************************}
procedure TForm1.Ouvrir1Click(Sender: TObject);
begin
    if NouveauFichier
    then
        if Opendialog1.Execute
        then
            OuvrirUnFichier ;
end;

{*******************************************************************************
 * Ouvre un fichier
 ******************************************************************************}
procedure TForm1.OuvrirUnFichier ;
Var Fichier : TextFile ;
    Buffer : String ;
begin
    Caption := 'QuickVirPrel [' + ExtractFileName(OpenDialog1.FileName) + ']' ;
    
    try
        FileMode := fmOpenRead  ;
        AssignFile(Fichier, OpenDialog1.FileName); { Fichier s�lectionn� dans la bo�te de dialogue }
        Reset(Fichier);

        // Lecture de la premi�re ligne
        while not Eof(Fichier) do
        begin
            ReadLn(Fichier, Buffer) ;

            if ExtraireLigne(Buffer) = False
            then
                break ;
        end ;
    finally
        CloseFile(Fichier) ;
    end ;

    SaveDialog1.FileName := OpenDialog1.FileName ;
    ListeEmetteurComboBox.ItemIndex := ListeEmetteurComboBox.Items.Count - 1 ;
    ListeEmetteurComboBoxChange(ListeEmetteurComboBox) ;
end ;

{*******************************************************************************
 * Lit la liste des destinataires
 ******************************************************************************}
procedure Tform1.LireDestinataire ;
Var Registre : TRegistry ;
    i, Nb : Integer ;
    tmp : String ;
begin
    Registre := TRegistry.Create ;

    ListeDestinataireRaisonSociale := TStringList.Create ;
    ListeDestinataireRIB := TStringList.Create ;
    ListeDestinataireNomBanque := TStringList.Create ;

    try
        { Lancer au d�marrage de l'ordi }
        Registre.RootKey := HKEY_CURRENT_USER ;

        Registre.OpenKey(CHEMIN_REGISTRE + '\Destinataire', True) ;

        if Registre.ValueExists('NB_Destinataire')
        then begin
            Nb := Registre.ReadInteger('NB_Destinataire') ;

            if Nb > 0
            then begin
                For i := 0 to Nb - 1 do
                begin
                    tmp := IntToStr(i) ;
                    ListeDestinataireRIB.Add(Registre.ReadString(tmp + '_RIB')) ;
                    ListeDestinataireNomBanque.Add(Registre.ReadString(tmp + '_NomBanque')) ;
                    ListeDestinataireRaisonSociale.Add(Registre.ReadString(tmp + '_RaisonSocial')) ;
                end ;
            end ;
        end ;

        Registre.CloseKey ;
    finally
        Registre.Free ;
    end ;
end ;

{******************************************************************************
 * Proc�dure appel�e quand on drop quelque chose
 ******************************************************************************}
procedure TForm1.WMDropFiles(var Msg: TWMDropFiles);
var
  NombreDeFichiers,i:integer;
  NomDuFichier:array[0..MAX_PATH] of char;
  reponse : Integer ;

  procedure OuvrirLeFichierDragAndDrop(var Msg: TWMDropFiles; NomDuFichier : array of char; len : Integer) ;
  begin
      if DragQueryFile(Msg.Drop, 0, NomDuFichier, len) > 0
      then begin
          if NouveauFichier
          then begin
              OpenDialog1.FileName := String(NomDuFichier) ;
              OuvrirUnFichier ;
          end ;
      end ;
  end ;
  
begin
  try
    // r�cup�ration du nombre de fichiers
    NombreDeFichiers := DragQueryFile(Msg.Drop, $FFFFFFFF, NomDuFichier,
                                      sizeof(NomDuFichier));

    if NombreDeFichiers = 1
    then begin
        OuvrirLeFichierDragAndDrop(Msg, NomDuFichier, sizeof(NomDuFichier)) ;
    end
    else if NombreDeFichiers > 1
    then begin
        reponse := Application.MessageBox('Vous avez fait gliss� plusieurs fichiers. Souhaitez-vous tous les ouvrir ?' + #10 + #13 +
                                  'Cliquez sur Oui pour tous les ouvrir dans des dans des instances de programme diff�rentes.' + #10 + #13 +
                                  'Cliquez sur Non pour ouvrir le premier fichier.' + #10 + #13 +
                                  'Cliquez sur Annuler pour annuler l''op�ration.', 'Drag&Drop', MB_YESNOCANCEL + MB_ICONQUESTION) ;
       case reponse of
            ID_YES : begin
                        OuvrirLeFichierDragAndDrop(Msg, NomDuFichier, sizeof(NomDuFichier)) ;

                        // Lance une nouvelle session pour chaque fichier
                        for i := 1 to NombreDeFichiers - 1 do
                        begin
                          // r�cup�ration du nom du fichier }
                          if DragQueryFile(Msg.Drop, i, NomDuFichier, sizeof(NomDuFichier)) > 0
                          then begin
                              ShellExecute(Handle, 'OPEN', PChar(Application.ExeName), NomDuFichier,'',SW_SHOWNORMAL);
                          end ;
                        end;
                    end ;
            ID_NO : OuvrirLeFichierDragAndDrop(Msg, NomDuFichier, sizeof(NomDuFichier)) ;
        end ;
    end ;
  finally
    DragFinish(Msg.Drop);
  end;
end;

{*******************************************************************************
 * Enregistre un destinataire dans la base de registre
 ******************************************************************************}
procedure TForm1.SauveDestinataireRegistre(Num : Integer; RaisonSocial : String; RIB : String; NomBanque : String; UpdateNB : boolean) ;
Var Registre : TRegistry ;
    tmp : String ;
begin
    Registre := TRegistry.Create ;
    tmp := IntToStr(Num) ;

    try
        { Lancer au d�marrage de l'ordi }
        Registre.RootKey := HKEY_CURRENT_USER ;

        Registre.OpenKey(CHEMIN_REGISTRE + '\Destinataire', True) ;

        Registre.WriteString(tmp + '_RaisonSocial', RaisonSocial) ;
        Registre.WriteString(tmp + '_RIB', RIB) ;
        Registre.WriteString(tmp + '_NomBanque', NomBanque) ;

        if UpdateNB
        then
            Registre.WriteInteger('NB_Destinataire', Num + 1);

        Registre.CloseKey ;
    finally
        Registre.Free ;
    end ;
end ;

{*******************************************************************************
 * Met � jour la liste des Destinataires
 ******************************************************************************}
procedure TForm1.MiseAjourRegistreDestinataire ;
Var Registre : TRegistry ;
    Nb, i : Integer ;
    tmp : string ;
begin
    for i := 0 to ListeDestinataireRaisonSociale.Count - 1 do
    begin
        SauveDestinataireRegistre(i, ListeDestinataireRaisonSociale.Strings[i], ListeDestinataireRIB.Strings[i], ListeDestinataireNomBanque.Strings[i], False) ;
    end ;

    Registre := TRegistry.Create ;

    try
        { Lancer au d�marrage de l'ordi }
        Registre.RootKey := HKEY_CURRENT_USER ;

        Registre.OpenKey(CHEMIN_REGISTRE + '\Destinataire', True) ;

        if Registre.ValueExists('NB_Destinataire')
        then begin
            Nb := Registre.ReadInteger('NB_Destinataire') ;

            // S'il y a moins de valeur � enregistrer que ce qui se trouve dans
            // la base de registre, on supprimer les clefs restantes
            if Nb > ListeDestinataireRaisonSociale.Count
            then begin
                for i := ListeDestinataireRaisonSociale.Count to Nb do
                begin
                    tmp := IntToStr(i) ;
                    Registre.DeleteValue(tmp + '_RaisonSocial') ;
                    Registre.DeleteValue(tmp + '_RIB') ;
                    Registre.DeleteValue(tmp + '_NomBanque') ;
                end ;
            end ;
        end ;

        Registre.WriteInteger('NB_Destinataire', ListeDestinataireRaisonSociale.Count) ;

        Registre.CloseKey ;
    finally
        Registre.Free ;
    end ;
end ;

{*******************************************************************************
 * Ajoute un destinataire
 ******************************************************************************}
procedure TForm1.Ajouter2Click(Sender: TObject);
Var AjoutDestinataire : TAjoutDestinataire ;
begin
    AjoutDestinataire := TAjoutDestinataire.Create(Self) ;

    if AjoutDestinataire.ShowModal = mrOK
    then begin
        // Destinataire
        ListeDestinataireRaisonSociale.Add(AjoutDestinataire.Destinataire_RaisonSociale.Text) ;
        ListeDestinataireRIB.Add(AjoutDestinataire.Destinataire_RIB.Text)  ;
        ListeDestinataireNomBanque.Add(AjoutDestinataire.Destinataire_Banque.Text) ;

        // Enregistrement dans la base de registre
        // Fonction avec valeur du rang et toutes les autres valeurs
        SauveDestinataireRegistre(ListeDestinataireRaisonSociale.Count - 1, AjoutDestinataire.Destinataire_RaisonSociale.Text, AjoutDestinataire.Destinataire_RIB.Text, AjoutDestinataire.Destinataire_Banque.Text, True) ;
    end ;

    AjoutDestinataire.Free ;
end;

{*******************************************************************************
 * Afficha la liste des destinataire
 ******************************************************************************}
procedure TForm1.Modifier3Click(Sender: TObject);
Var Destinataire : TDestinataire ;
begin
    Destinataire := TDestinataire.Create(Self);
    Destinataire.ShowModal ;
    Destinataire.Free ;
end;

{*******************************************************************************
 * Retroune la version actuelle du programme
 ******************************************************************************}
function TForm1.GetVersionProgram : String ;
var
  Handle   : DWord;
  Info     : Pointer;
  InfoData : Pointer;
  InfoSize : LongInt;
  DataLen  : UInt;
  InfoType : string;
begin
    { Demande de la taille n�cessaire pour stocker les infos de Version}
    InfoSize := GetFileVersionInfoSize(PChar(Application.ExeName), Handle);
    if (InfoSize > 0)
    then begin
        { R�servation de la m�moire n�cessaire}
        GetMem(Info, InfoSize);

        try
            if GetFileVersionInfo(PChar(Application.ExeName), Handle, InfoSize, Info)
            then begin
                InfoType := '\StringFileInfo\040C04E4\ProductVersion' ;

                {
                if VerQueryValue(Info,'\VarFileInfo\Translation',LangPtr, DataLen) then
                InfoType:=Format('\StringFileInfo\%0.4x%0.4x\%s'#0,[LoWord(LongInt(LangPtr^)),
                                        HiWord(LongInt(LangPtr^)), InfoType]);
                }

                if VerQueryValue(Info,@InfoType[1],InfoData,Datalen)
                then
                    Result := strPas(InfoData) ;
            end ;
        finally
            FreeMem(Info, InfoSize);
        end;
    end ;
end;

{*******************************************************************************
 * V�rifie si nouvelle version de QuickVirPrel disponible
 ******************************************************************************}
procedure TForm1.Vrifiersinouvelleversiondisponibl1Click(Sender: TObject);
var Update : TUpdate ;
begin
   Update := TUpdate.Create(Self) ;
   Update.ShowModal ;
   Update.Free ;
end;

{*******************************************************************************
 * R�cup�re les tailles des en�tes des listes.
 ******************************************************************************}
procedure TForm1.GetListViewColumnWidth(ListView : TListView) ;
Var Registre : TRegistry ;
    i : Integer ;
    nb : Integer ;
begin
    Registre := TRegistry.Create ;

    try
        Registre.RootKey := HKEY_CURRENT_USER ;
        Registre.OpenKey(CHEMIN_REGISTRE + '\' + ListView.Name, True) ;

        nb := ListView.Columns.Count - 1 ;

        for i := 0 to nb do
        begin
            if Registre.ValueExists(ListView.Columns.Items[i].Caption)
            then
                ListView.Columns.Items[i].Width := Registre.ReadInteger(ListView.Columns.Items[i].Caption) ;
        end ;

    finally
        Registre.Free ;
    end ;
end ;

{*******************************************************************************
 * Sauvegarde les tailles des en�tes des listes.
 ******************************************************************************}
procedure TForm1.SetListViewColumnWidth(ListView : TListView) ;
Var Registre : TRegistry ;
    i : Integer ;
    nb : Integer ;
begin
    Registre := TRegistry.Create ;

    try
        Registre.RootKey := HKEY_CURRENT_USER ;
        Registre.OpenKey(CHEMIN_REGISTRE + '\' + ListView.Name, True) ;

        nb := ListView.Columns.Count - 1 ;

        for i := 0 to nb do
        begin
            Registre.WriteInteger(ListView.Columns.Items[i].Caption, ListView.Columns.Items[i].Width) ;
        end ;

    finally
        Registre.Free ;
    end ;
end ;

{*******************************************************************************
 * Sauvegarde les tailles des en�tes des listes.
 ******************************************************************************}
procedure TForm1.SetWindowProperties(Fenetre : TForm) ;
Var Registre : TRegistry ;
begin
    Registre := TRegistry.Create ;

    try
        Registre.RootKey := HKEY_CURRENT_USER ;
        Registre.OpenKey(CHEMIN_REGISTRE + '\' + Fenetre.Name, True) ;

        if Fenetre.WindowState = wsMaximized
        then begin
            Registre.WriteInteger('WindowState', 1) ;
        end
        else begin
            Registre.WriteInteger('WindowState', 0) ;

            Registre.WriteInteger('Width', Fenetre.Width) ;
            Registre.WriteInteger('Height', Fenetre.Height) ;

            if Fenetre.Position <> poMainFormCenter
            then begin
                Registre.WriteInteger('Top', Fenetre.Top) ;
                Registre.WriteInteger('Left', Fenetre.Left) ;
            end ;
            //poDesktopCenter
        end ;


    finally
        Registre.Free ;
    end ;
end ;

{*******************************************************************************
 * Sauvegarde les tailles des en�tes des listes.
 ******************************************************************************}
procedure TForm1.GetWindowProperties(Fenetre : TForm) ;
Var Registre : TRegistry ;
begin
    Registre := TRegistry.Create ;

    try
        Registre.RootKey := HKEY_CURRENT_USER ;
        Registre.OpenKey(CHEMIN_REGISTRE + '\' + Fenetre.Name, True) ;


        if Registre.ValueExists('Width')
        then begin
            Fenetre.Width := Registre.ReadInteger('Width') ;

            // si fen�tre plus gande que l'�cran, prend la taille de l'�cran
            if Fenetre.Width > Screen.Width
            then
                Fenetre.Width := Screen.Width ;
        end ;

        if Registre.ValueExists('Height')
        then begin
            Fenetre.Height := Registre.ReadInteger('Height') ;

            // si fen�tre plus gande que l'�cran, prend la taille de l'�cran
            if Fenetre.Height > Screen.Height
            then
                Fenetre.Height := Screen.Height ;
        end ;

        if Registre.ValueExists('Top')
        then begin
            Fenetre.Top := Registre.ReadInteger('Top') ;

            // si fen�ter en dehors de l'�cran
            if Fenetre.Top >= Screen.Height
            then
                Fenetre.Top := 0 ;
        end ;

        if Registre.ValueExists('Left')
        then begin
            Fenetre.Left := Registre.ReadInteger('Left') ;

            // si fen�ter en dehors de l'�cran
            if Fenetre.Left >= Screen.Width
            then
                Fenetre.Left := 0 ;
        end ;


        if Registre.ValueExists('WindowState')
        then begin
            if Registre.ReadInteger('WindowState') <> 0
            then begin
                 SendMessage(Self.Handle, WM_SYSCOMMAND, SC_MAXIMIZE, 0) ;
            end ;
        end ;

    finally
        Registre.Free ;
    end ;
end ;
(*
procedure TForm1.OnMessage(var Msg: tagMSG; var Handled: Boolean);
begin
{
    if (Msg.Message = WM_SYSCOMMAND ) and (Msg.wParam = SC_MAXIMIZE)
    then
            ShowMessage('Vive Delphi!');
}
    if (Msg.Message = WM_SIZE)
    then
            ShowMessage('Size');

end;

procedure TForm1.NewWindowProc(var Msg: TMessage);
begin
  //.Interception de l'�v�nement WM_SIZE
  if (Msg.Msg = WM_SIZE) and (Msg.WParam = SIZE_RESTORED)
  then begin
       Caption := 'restauration' ;
  end
  else
       Caption := '' ;

  //.Traitement normal des autres message.
  OldWindowProc(Msg);
end;

procedure TForm1.NewResizedProc(var msg:TMessage);
begin
  if (Msg.Msg = WM_SIZE) and (Msg.WParam = SIZE_RESTORED)
  then begin
       Caption := 'restauration' ;

  end
  else
       Caption := '' ;


    inherited;
end ;
*)
end.
