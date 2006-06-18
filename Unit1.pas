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
 *       - pouvoir réduire en systray [inutile]
 *       - popup menu sur liste [inutile]
 *       - Drag&Drop aussi intégrer la liste de ce qui se trouve dans le fichier [annulé]
 *       - multi modification [annulé]
 *
 *
 *
 *
 *       TODO
 *       - pouvoir configurer où sont enregistrer les informations Emetteur/Destinataire :
 *             Information propre à chaque utilisateur (HKCU)
 *             Information commun à tous les utilisateurs de cet ordinateur (HKLM)
 *       - gérer un apperçu avant impression
 *       - Faire une version en réseau
 *}
{
              V1.0
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
              - Fichier -> Imprimer
              - Créer un menu Aide, avec licence, et apropos de ...

              V2.0
              - Refaire la boite de dialogue A propos de ...
              - Modifier l'impression pour avoir des saut de ligne avant et après le tableau
              - Renommer menu Divers par Outils
              - Changer l'icone du programme par les clefs
              - nouvelle barre d'outil
              - N'avoir plus qu'un menu enregistrer, mais en type de fichier, dans la boite de dialogue permettre de choisir
                l'un des trois type.
              - Enregistrer sous donc mémoriser le nom, le type d'opération
              - Modif et activation désactivation bouton et menu enregistrer
              - Amélioration des activations/désactivation des menus
              - Correction du bug quand double clique quand la liste est vide.
              - Ammélioration de la présentation de la barre d'outil
              - Utilisation de la propriété DefaultExt de la Boite de dialogue e sauvegarde
             - Modifier la MessageBox qui signale qu'il y a des modif et que le fichier n'a pas été enregistré.
               Boutons : oui, non, annuler
                         Oui : Affiche la boite d'enregistrement
                         Non : fait l'action voulu
                         Annuler : annule tout
             - Ajouter/Modifier ligne vérifier montant
             - Quand une erreur survient lors de l'enregistrement, modif est mis à true. Mettre à false
             - Dans la Caption de la feuille mettre le nom du fichier
             - Ajout du menu Aide -> Visitez le site web de QuickVirPrel
             - Menu Aide -> Historique de versions
             - Trie des colones dans la listes Emetteur
             - Afficher un assistant si pas de destinataire existant au démarrage
             - Correction du bug de calcule de la clef RIB
             - Vérifier lors de l'ajout d'un émetteur qu'il n'existe pas (par le RIB)
             - Mémorisation de plusieurs émetteurs -> bouton autre
             - Fichier -> Ouvrir
             - Ouvrir avec fichier en paramètre
             - Drag&Drop ouvre le ou les fichier(s)
             - gestion liste des destinataires
             - historique des versions
             - vérification d'une nouvelle version disponible
             - alignement à droite des chiffre
             - suppression de l'obligation de saisir un n° de virement et des références
             - ajouter ,00 si pas de virgule pour meilleur lisibilité
             - Enregistrement des tailles des colonnes
             - correction d'un bug qui tronquait la première lettre de chaque ligne
             - mémoriser taille fenêtre
             - correction d'un bug qui empêchait les fenêtres de se détruire
             - rajout du signe euro sur les lignes du fichiers

             V2.1
             - ajout d'un utilitaire de calcule de clef RIB,
             - correction d'un bug lors de l'impression en ayant un émetteur non dans la liste,
             - correction d'un bug qui ne prenait pas les bonnes références lors de l'impression,
             - correction à l'ouverture d'un fichier. S'assure que le fichier et chemin existe bien,
             - Exportation HTML, XHTML, XML, CVS, Texte (comme l'impression),
             - Mettre sablier quand nécessaire,
             - Correction d'un bug lors de l'enregistrement des destinataire,
             - Export/Import Emetteur, Destinataire dans un fichier ini pour pouvoir balader les infos,
             - Si appuie sur Echape dans une fenêtre fermer fenêtre,
             - pouvoir afficher une grille ListView1.GridLines := TRue ;
             - ListView1.HotTrak & HotTrackStyles,
             - pouvoir configurer la vérification d'émetteur présent dans la base de registre au démarrage,
             - Désactiver vérifiaction RIB,
             - configuration de la barre d'outil (ToolBar1.Customizable := True, ToolBar1.Flat, ToolBar1.ShowCaptions, ToolBar1.List),
             - Demander si on veut imprimer lorsqu'on a enregistrer un fichier (Configurable),
             - Pouvoir réinitialiser la config par défaut
             - pouvoir réinitiliser les paramètres par la lignes de commandes /resetconfig
             - Mettre sablier quand nécessaire,
             - prise en compte des lignes plus courtes dans le fichier généré par certain programme,
             - amélioration du signalement d'erreur à l'ouverture d'un fichier,

             V2.1.1
             - correction d'un bug de lecture,
             - possibilité d'enlever le signe monnaitaire sur chaque ligne de montant qui pose problème
               pour certaine banque,
             - correction du bug de tri de liste,
             - ajout de l'extention automatiquement lors de l'export,
             - suppresion du nom de fichier dans la boite de dialogue d'enregistrement lorsqu'on créer
               nouveau fichier,

             V2.1.2
             - correction d'un problème de convertion de nombre si le symbole
               décimal était différent de la virgule,
             - correction d'un problème de convertion de clef RIB si elle contenait
               des lettres,
             - correction d'un bug qui ne faisait pas toujours apparaitre le bouton autre...,
             

    A TERMINER :

}
unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, DateUtils, ExtCtrls, Buttons, Mask, Menus, Registry,
  apropos, AddModLine, ToolWin, ImgList, Printers, ShellAPI, UnitLicence, UnitAjoutEmetteur,
  UnitEmetteur, StrUtils, UnitAjouterDestinataire, UnitDestinataire, UnitUpDate,
  UnitCalculeClefRIB, UnitCVS, IniFiles, UnitConfiguration, UnitFichiersRecents ;

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
    CalculedeclefRIB1: TMenuItem;
    N5: TMenuItem;
    Exporter1: TMenuItem;
    raitementencours1: TMenuItem;
    ExporterTexte: TMenuItem;
    HTML1: TMenuItem;
    XHTML1: TMenuItem;
    XML1: TMenuItem;
    CSV1: TMenuItem;
    Listedestinataires1: TMenuItem;
    Listemetteurs1: TMenuItem;
    Importer1: TMenuItem;
    Listedestinataires2: TMenuItem;
    Listemetteurs2: TMenuItem;
    N7: TMenuItem;
    Configuration1: TMenuItem;
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
    procedure CalculedeclefRIB1Click(Sender: TObject);
    procedure ExporterTexteClick(Sender: TObject);
    procedure Listedestinataires1Click(Sender: TObject);
    procedure Listedestinataires2Click(Sender: TObject);
    procedure Configuration1Click(Sender: TObject);
//    procedure OnMessage(var Msg: tagMSG; var Handled: Boolean);
  private
    { Déclarations privées }
    Modif : Boolean ;
    SaveDialogExitState : Boolean ;
    EmetteurRaisonSocialeAutre : String ;
    EmetteurRIBAutre : String ;
    EmetteurNumeroAutre : String ;
    { 0 : Imprimer le fichier
      1 : Demander si on souhaite imprimer le fichier
      2 : Ne pas imprimer le fichier   }
    PrintFileWhenSave : Integer ;
    CheckEmetteurStart : Boolean ;
//    OldWindowProc: TWndMethod;
    function  ExtraireClefRIB(RIB : String) : ShortInt ;
    function  Valeur(Caractere : Char) : Char ;
    function  StrNCopyNWithValeur(debut : Integer; fin : integer; chaine : String) : String ;
    function  Save(Ligne1 : String; Ligne2 : String; Ligne3 : String; Ref : String) : Integer ;
    procedure LoadRegistry ;
    function  Completer(Texte : String; longueur : Integer) : String ;
    procedure Supprimer ;
    procedure LireEmetteur ;
    procedure Wizard ;
    procedure SetModif(Valeur : Boolean) ;
    procedure EnregistrerLeFichier ;
    procedure MiseAJourListeEmetteurComboBox ;
    function  StrNCopyN(debut, fin : Integer; texte : String) : String ;
    function  ExtraireLigne(ligne : String; NumLigne : Integer) : Boolean ;
    function  ExtrairePremiereLigne(ligne : String) : Boolean ;
    function  ExtraireLigneDestinataire(ligne : String) : Boolean ;
    procedure OuvrirUnFichier ;
    procedure LireDestinataire ;
    function  NouveauFichier : Boolean ;
//    Procedure NewWindowProc(var Msg: TMessage);
//    procedure NewResizedProc(var msg:TMessage); message WM_SIZE;
    procedure ExporterEnFichier(var F: Text) ;
    procedure ExporterEnHTML(var F: TextFile; IsXHTML : Boolean);
    function  DateVirement : String ;
    function  CompleterMontant(Texte : String; NoSpace : Boolean) : String ;
    procedure ExporterEnXML(var F: Text) ;
    procedure ExporterEnCSV(var F: TextFile; Separateur : String);
    procedure CreateMenuRecentFile ;
    procedure LoadRecentFile(Sender: TObject);        
  public
    { Déclarations publiques }
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
    DisabledRIBChek : Boolean ;
    RecentFiles : TRecentFiles ;
    AddEuroOnEachLigne : Boolean ;    
    // Fonctions
    function  CheckRIB(RIB : String) : Boolean ;
    function  CheckVirgule(chaine : string) : boolean ;
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
    function  CalculerClefRIB(RIB : String) : ShortInt ;
    procedure ReadConfig ;
    procedure ResetConfig ;
    function  CheckTwoNumberAfterDecimalSeparator(chaine : String) : String ;        
  end;

var
  Form1: TForm1;

Const
  TEXTE_SAUVEGARDE_AVANT : PChar = 'Vous n''avez pas enregistré les modifications ! Souhaitez-vous les enregistrer ?' ;
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
    Screen.Cursor := crHourGlass ;

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

    Screen.Cursor := crDefault ;    
end;

{*******************************************************************************
 * Création de la fenêtre
 ******************************************************************************}
procedure TForm1.FormCreate(Sender: TObject);
Var i : Word ;
    CurYear : Word ;
    temp : String ;
begin
    ReadConfig ;
    
    // Charge l'icone de la main de Windows plutôt que de delphi
    Screen.Cursors[crHandPoint] := LoadCursor(0, IDC_HAND);

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
    SetModif(False) ;

    LoadRegistry ;

    // Simule une suppression pour désactiver certains éléments
    Supprimer ;

    // Initialise la variable
    SaveDialogExitState := True ;

    // Lit les émetteur enregistré
    LireEmetteur ;

    // Lit les émetteur enregistré
    LireDestinataire ;

    // Met à jour la liste des émetteurs dans la combobox
    MiseAJourListeEmetteurComboBox ;

    // Créer l'objet contenant les fichiers récents
    RecentFiles := TRecentFiles.Create(HKEY_CURRENT_USER, CHEMIN_REGISTRE) ;

    // Si on à un paramètre, c'est qu'on doit ouvrir un fichier
    case ParamCount of
        0 : ;
        1 : begin//ParamStr(1)
                temp := ParamStr(1) ;

                if FileExists(temp) and (temp <> '/resetconfig')
                then begin
                    OpenDialog1.FileName := temp ;
                    OuvrirUnFichier ;
                end
                else if (not FileExists(temp)) and (temp = '/resetconfig')
                then begin
                    ResetConfig ;
                end
                else
                    Application.MessageBox(PChar('Le fichier ' + temp + ' est introuvable.'), 'Erreur d''ouverture de fichier', MB_OK + MB_ICONERROR) ;
            end ;
        else
            Application.MessageBox('Trop de paramètre en ligne de commande.' + #13 + #10 + 'QuickVirPrel.exe <le fichier à ouvrir>.', 'Erreur de ligne de commande', MB_OK + MB_ICONERROR) ;
    end ;

    // Indique que l'on peut faire du drag&drop sur la feuille
    DragAcceptFiles(Self.Handle,true);

    // Récupère la config de la listview
    GetListViewColumnWidth(ListView1) ;

    // Récupère les config des fenêtre
    GetWindowProperties(Self) ;

    // Créer le menu des fichiers récents
    CreateMenuRecentFile ;

    // permet de faire apparaitre le bouton autre...
    ListeEmetteurComboBoxChange(ListeEmetteurComboBox) ;
(*
    Application.OnMessage := OnMessage;

    // Sauvegarde la WndProc actuelle du DBGrid1.
    OldWindowProc := WindowProc;
    // Affecte une nouvelle procédure de fenêtre.
    WindowProc := NewWindowProc;
*)
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
        Screen.Cursor := crHourGlass ;

        Supprimer ;

            Screen.Cursor := crDefault ;
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
        SupprimerLigne.Enabled := False ;
        EditerLigne.Enabled := False ;
        Copier.Enabled := False ;
        Couper.Enabled := False ;
        ListView1.ItemIndex := -1 ;
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
    Result := StrToInt(StrNCopyNWithValeur(25, 26, RIB)) ;
  except
    on EConvertError do Result := 0 ;
    on ERangeError  do Result := 0 ;
    else
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
        SaveDialog1.FileName := 'Sans nom.txt' ;
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
        if Chaine[i] = DecimalSeparator
        then
            Result := True ;
    end ;
end ;

{*******************************************************************************
 * Enregistre les données
 ******************************************************************************}
function TForm1.Save(Ligne1 : String; Ligne2 : String; Ligne3 : String; Ref : String) : Integer ;
Var Fichier : TextFile ;
    Banque, Guichet, Compte : String ;
    i : Integer ;
    Total : Extended ;
    RS, RIB : String ;
    tmp : String ;

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

    function CompleterMontantInterne(Texte : String) : String ;
    Var i : Integer ;
    begin
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

    //if ListeEmetteurComboBox.Text = 'Autre...'
    if ConfigurerEmetteurAutre.Visible = True
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
    AssignFile(Fichier, SaveDialog1.FileName); { Fichier sélectionné dans la boîte de dialogue }
    Rewrite(Fichier);

    try
        // Première ligne
        WriteLn(Fichier, Ligne1 + '        ' + Ref + '       ' + DateAFB +
                Completer(RS, 24) +
                Completer(RefferenceEmission.Text, 11) + '               E     ' +
                Guichet + Compte + '                                               ' +
                Banque + '      ') ;

        // Lignes
        For i := 0 to ListView1.Items.Count -1 do
        begin
            // Pose problème pour Le Crédit Lyonnait et La Poste
            //Banque := StrNCopyNWithValeur(1, 5, ListView1.Items[i].SubItems[0]) ;
            //Guichet := StrNCopyNWithValeur(7, 11, ListView1.Items[i].SubItems[0]) ;
            //Compte := StrNCopyNWithValeur(13, 23, ListView1.Items[i].SubItems[0]) ;

            Banque := StrNCopyN(1, 5, ListView1.Items[i].SubItems[0]) ;
            Guichet := StrNCopyN(7, 11, ListView1.Items[i].SubItems[0]) ;
            Compte := StrNCopyN(13, 23, ListView1.Items[i].SubItems[0]) ;

            Total := Total + StrToFloat(ListView1.Items[i].SubItems[2]) ;

            if AddEuroOnEachLigne
            then
                tmp := '      E     '
            else
                tmp := '            ' ;

            WriteLn(Fichier, Ligne2 + '        ' + Ref + Completer(ListView1.Items[i].SubItems[3], 12) + Completer(ListView1.Items[i].Caption ,24) + Completer(ListView1.Items[i].SubItems[1], 20) + tmp + Guichet + Compte + CompleterMontantInterne(ListView1.Items[i].SubItems[2]) + Completer(ListView1.Items[i].SubItems[4], 31) + Banque + '      ') ;
        end ;

        // Permet d'avoir tjs deux chiffres après la virgule
        tmp := CheckTwoNumberAfterDecimalSeparator(FloatToStr(Total)) ;

        // Avant dernière ligne
        WriteLn(Fichier, Ligne3 + '        ' + Ref + '                                                                                    ' + CompleterMontantInterne(tmp) + '                                          ') ;
        Result := 0;
    finally
        CloseFile(Fichier);
    end ;
end ;

{*******************************************************************************
 * Enregistre Prélévement
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
 * Focus donner à ListView1
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

        if Registre.ValueExists('UnderLineHot')
        then
            AddEuroOnEachLigne := Registre.ReadBool('AddEuroOnEachLigne') ;

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
    //if Colonne = (Column.ID - 6)
    if Colonne = Column.ID
    then
        OrdreCroissant := not OrdreCroissant
    else
        OrdreCroissant := True ;

    { Mémorise la colone }
    //Colonne := Column.ID - 6 ;
    Colonne := Column.ID ;

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
    if Column.ID = 0
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
        //NumSubItem := Column.ID - 6 ;
        { -1 car c'est les sous-item or le premier item est 0 alors que son
          numéro Column est 1 }
        NumSubItem := Column.ID - 1 ;

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

begin
    if PrintDialog1.Execute
    then begin
        Printer.Title := 'Impression d''émision - QuickVirPrel' ;
        AssignPrn(PrintText) ;
        Rewrite(PrintText) ;
        Printer.Canvas.Font := FontDialog1.Font ;

        try
            ExporterEnFichier(PrintText) ;
        finally
            CloseFile(PrintText) ;
        end ;
    end ;
end;

{*******************************************************************************
 * Exporte les données de la liste en texte
 ******************************************************************************}
procedure TForm1.ExporterEnFichier(var F: TextFile);
Var Total : Extended ;
    i : Integer ;
    RS, RIB : String ;
    
    procedure PrintLine(var F: TextFile) ;
    begin
        WriteLn(F, '+--------------------------+----------------------------+--------------+---------------------------------+-------------------+') ;
    end ;

begin
    Screen.Cursor := crHourGlass ;
    
    //if ListeEmetteurComboBox.Text = 'Autre...'
    if ConfigurerEmetteurAutre.Visible = True
    then begin
        RS := EmetteurRaisonSocialeAutre ;
        RIB := EmetteurRIBAutre ;
    end
    else begin
        RS := ListeEmetteurRaisonSociale.Strings[ListeEmetteurRIB.IndexOf(StrNCopyN(1, 26, ListeEmetteurComboBox.Text))] ;
        RIB := StrNCopyN(1, 26, ListeEmetteurComboBox.Text) ;
    end ;

    WriteLn(F, RS);

    WriteLn(F, 'Référence du lot : ' + RefferenceEmission.Text);
    WriteLn(F, 'Imprimer le ' + DateToStr(Date) + ' et présenté le ' + DateVirement) ;
    WriteLn(F, 'RIB d''émission : ' + RIB) ;
    WriteLn(F, '') ;

    Total := 0 ;

    PrintLine(F) ;
    WriteLn(F, '| Nom                      | RIB                        | Référence    | Libellé                         | Montant           |') ;
    PrintLine(F) ;

    For i := 0 to ListView1.Items.Count -1 do
    begin
        WriteLn(F, '| ' + Completer(ListView1.Items[i].Caption ,24) + ' | ' + ListView1.Items[i].SubItems[0] + ' | ' + Completer(ListView1.Items[i].SubItems[3], 12) + ' | ' + Completer(ListView1.Items[i].SubItems[4], 31) + ' | ' + CompleterMontant(ListView1.Items[i].SubItems[2], False) + ' |') ;
        PrintLine(F) ;
        Total := Total + StrToFloat(ListView1.Items[i].SubItems[2]) ;
    end ;

    WriteLn(F, '') ;
    WriteLn(F, IntToStr(ListView1.Items.Count) + ' enregistrement(s) pour un montant total de ' + FloatToStr(Total) + ' euro(s).');

    Screen.Cursor := crDefault ;
end ;

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
 * Définit la variable Modif
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
    Screen.Cursor := crHourGlass ;

    resultat := -1 ;

    case SaveDialog1.FilterIndex of
        1 : begin
                tmp := RefferenceEmission.Text ;
                RefferenceEmission.Text := '' ;

                //if ListeEmetteurComboBox.Text = 'Autre...'
                if ConfigurerEmetteurAutre.Visible = True
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

    Screen.Cursor := crDefault ;

    { 0 : Imprimer le fichier
      1 : Demander si on souhaite imprimer le fichier
      2 : Ne pas imprimer le fichier
    }
    case PrintFileWhenSave of
        0 : Imprimer1Click(Self) ;
        1 : if Application.MessageBox('Souhaitez-vous imprimer le bordereau pour la banque ?', 'Question', MB_YESNO + MB_ICONQUESTION) = IDYES
            then
                Imprimer1Click(Self) ;
    end ;

end;

{*******************************************************************************
 * Affiche la fenêtre de Wizard
 ******************************************************************************}
procedure TForm1.Wizard ;
begin
    Application.MessageBox('Aucun émetteur n''a été configuré. Veuillez en saisir un avant de continer.', 'Premier lancement', MB_OK + MB_ICONINFORMATION) ;
    EmetteurAjout1Click(Self) ;
end ;

{*******************************************************************************
 * Lit la liste des émetteurs
 ******************************************************************************}
procedure Tform1.LireEmetteur ;
Var Registre : TRegistry ;
    i, Nb : Integer ;
    tmp : String ;
begin
    Screen.Cursor := crHourGlass ;

    Registre := TRegistry.Create ;

    ListeEmetteurRaisonSociale := TStringList.Create ;
    ListeEmetteurRIB := TStringList.Create ;
    ListeEmetteurNumeroVirement := TStringList.Create ;
    ListeEmetteurNumeroPrelevement := TStringList.Create ;
    ListeEmetteurNomBanque := TStringList.Create ;


    try
        { Lancer au démarrage de l'ordi }
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
                if CheckEmetteurStart
                then
                    Wizard ;
        end
        else
            // Lancer le Wizard
            if CheckEmetteurStart
            then
                Wizard ;

        Registre.CloseKey ;
    finally
        Registre.Free ;
    end ;

    Screen.Cursor := crDefault ;
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
    Screen.Cursor := crHourGlass ;

    Registre := TRegistry.Create ;
    tmp := IntToStr(Num) ;

    try
        { Lancer au démarrage de l'ordi }
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

    Screen.Cursor := crDefault ;    
end ;

{*******************************************************************************
 * Ajoute un émetteur
 ******************************************************************************}
procedure TForm1.EmetteurAjout1Click(Sender: TObject);
Var AjoutEmetteur : TAjoutEmetteur ;
begin
    AjoutEmetteur := TAjoutEmetteur.Create(Self) ;

    // Si la fenêtre n'est pas visible on l'affiche
    if not Visible
    then
        Show ;

     // Ajouter à la liste si mrOK
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
 * Afficha la liste des émetteur
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
 * Met à jour la liste des Emetteurs
 ******************************************************************************}
procedure TForm1.MiseAjourRegistreEmetteur ;
Var Registre : TRegistry ;
    Nb, i : Integer ;
    tmp : string ;
begin
    Screen.Cursor := crHourGlass ;

    for i := 0 to ListeEmetteurRaisonSociale.Count - 1 do
    begin
        SauveEmetteurRegistre(i, ListeEmetteurRaisonSociale.Strings[i], ListeEmetteurRIB.Strings[i], ListeEmetteurNumeroVirement.Strings[i], ListeEmetteurNumeroPrelevement.Strings[i], ListeEmetteurNomBanque.Strings[i], False) ;
    end ;

    Registre := TRegistry.Create ;

    try
        { Lancer au démarrage de l'ordi }
        Registre.RootKey := HKEY_CURRENT_USER ;

        Registre.OpenKey(CHEMIN_REGISTRE + '\Emetteur', True) ;

        if Registre.ValueExists('NB_Emetteur')
        then begin
            Nb := Registre.ReadInteger('NB_Emetteur') ;

            // S'il y a moins de valeur à enregistrer que ce qui se trouve dans
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

    Screen.Cursor := crDefault ;    
end ;

{*******************************************************************************
 * Met à jour la liste des Emetteurs de la combo box
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
 * Copy une chaine de caractère
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
 * redimenssione la liste des émetteurs
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
 * Affiche la fenêtre pour configurer l'émetteur autre
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
    AjoutEmetteur.Label2.Caption := 'N° Emetteur' ;
    AjoutEmetteur.Caption := 'Configuration de l''émetteur' ;

    if AjoutEmetteur.ShowModal = mrOK
    then begin
        EmetteurRaisonSocialeAutre := AjoutEmetteur.Emetteur_RaisonSociale.Text ;
        EmetteurRIBAutre := AjoutEmetteur.Emetteur_RIB.Text ;
        EmetteurNumeroAutre := AjoutEmetteur.Emetteur_NumPrelevement.Text ;
    end ;

    AjoutEmetteur.Free ;

end;

{*******************************************************************************
 * Extrait la première ligne de données
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
        // Paramètre le type de fichier
        SaveDialog1.FilterIndex := AnsiIndexStr(ligne[3] + ligne[4], ['02', '08', '85']) + 1 ;

        // Numéro Emetteur
        EmetteurNumeroAutre := StrNCopyN(13, 18, ligne) ;

        // Date d'envoie
        // Jour
        ComboBox1.ItemIndex := StrToInt(StrNCopyN(26, 27, ligne)) - 1 ;
        // Mois
        ComboBox2.ItemIndex := StrToInt(StrNCopyN(28, 29, ligne)) - 1 ;
        // Année
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

        // Référence émission
        RefferenceEmission.Text := StrNCopyN(55, 66, ligne) ;

        Result := True ;
    end
    else
        Application.MessageBox('Erreur sur l''entête de la première ligne.', 'Erreur', MB_OK + MB_ICONERROR) ;
end ;

{*******************************************************************************
 * Extrait la ligne de données
 ******************************************************************************}
function TForm1.ExtraireLigne(ligne : String; NumLigne : Integer) : Boolean ;
begin
    Result := False ;

    if ligne <> ''
    then begin
        if (length(ligne) > 160)
        then begin
            Application.MessageBox(Pchar('La ligne n°' + IntToStr(NumLigne) + ' est trop grande (supérieur à 160 caractères) dans le fichier !'#10#13'Traitement arrêté.'), 'Erreur', MB_OK + MB_ICONERROR) ;
        end
        else if (length(ligne) < 154)
        then begin
            Application.MessageBox(Pchar('La ligne n°' + IntToStr(NumLigne) + ' est trop petit (inférieur à 154 caractères) dans le fichier !'#10#13'Traitement arrêté.'), 'Erreur', MB_OK + MB_ICONERROR) ;
        end
        else begin
            case AnsiIndexStr(ligne[1] + ligne[2], ['03', '06', '08']) of
                0 : Result := ExtrairePremiereLigne(ligne) ;
                1 : Result := ExtraireLigneDestinataire(ligne) ;
                2 : Result := True ;// derniere ligne
            end ;
        end ;
    end
    else
        Result := True ;
end ;

{*******************************************************************************
 * Extrait la ligne de données contenant les opérations
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
        temp[16] := temp[15] ;
        temp[15] := ',' ;

        
        // Permet de se débarraer des 0 devant
        temp := FloatToStr(StrToFloat(temp)) ;

        ListItem.SubItems.Add(temp) ;   // Montant

        ListItem.SubItems.Add(TrimRight(StrNCopyN(19, 30, ligne))) ;  // référence
        ListItem.SubItems.Add(TrimRight(StrNCopyN(119, 149, ligne))) ;  // libellé

        Result := True ;
    end
    else
        Application.MessageBox('Erreur dans une ligne du fichier.', 'Erreur', MB_OK + MB_ICONERROR) ;    
end ;

{*******************************************************************************
 * Ouvre un fichier à partir du menu et de la barre d'outil
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
    NumLigne : Integer ;
begin
    Screen.Cursor := crHourGlass ;

    RecentFiles.Add(OpenDialog1.FileName) ;
    RecentFiles.Write ;
    CreateMenuRecentFile ;

    Caption := 'QuickVirPrel [' + ExtractFileName(OpenDialog1.FileName) + ']' ;

    try
        FileMode := fmOpenRead  ;
        AssignFile(Fichier, OpenDialog1.FileName); { Fichier sélectionné dans la boîte de dialogue }
        Reset(Fichier);

        NumLigne := 1 ;

        // Lecture de la première ligne
        while not Eof(Fichier) do
        begin
            ReadLn(Fichier, Buffer) ;

            if ExtraireLigne(Buffer, NumLigne) = False
            then
                break ;

            NumLigne := NumLigne + 1 ;
        end ;
    finally
        CloseFile(Fichier) ;
    end ;

    SaveDialog1.FileName := OpenDialog1.FileName ;
    ListeEmetteurComboBox.ItemIndex := ListeEmetteurComboBox.Items.Count - 1 ;
    ListeEmetteurComboBoxChange(ListeEmetteurComboBox) ;

    Screen.Cursor := crDefault ;    
end ;

{*******************************************************************************
 * Lit la liste des destinataires
 ******************************************************************************}
procedure Tform1.LireDestinataire ;
Var Registre : TRegistry ;
    i, Nb : Integer ;
    tmp : String ;
begin
    Screen.Cursor := crHourGlass ;

    Registre := TRegistry.Create ;

    ListeDestinataireRaisonSociale := TStringList.Create ;
    ListeDestinataireRIB := TStringList.Create ;
    ListeDestinataireNomBanque := TStringList.Create ;

    try
        { Lancer au démarrage de l'ordi }
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

    Screen.Cursor := crDefault ;    
end ;

{******************************************************************************
 * Procédure appelée quand on drop quelque chose
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
    // récupération du nombre de fichiers
    NombreDeFichiers := DragQueryFile(Msg.Drop, $FFFFFFFF, NomDuFichier,
                                      sizeof(NomDuFichier));

    if NombreDeFichiers = 1
    then begin
        OuvrirLeFichierDragAndDrop(Msg, NomDuFichier, sizeof(NomDuFichier)) ;
    end
    else if NombreDeFichiers > 1
    then begin
        reponse := Application.MessageBox('Vous avez fait glissé plusieurs fichiers. Souhaitez-vous tous les ouvrir ?' + #10 + #13 +
                                  'Cliquez sur Oui pour tous les ouvrir dans des dans des instances de programme différentes.' + #10 + #13 +
                                  'Cliquez sur Non pour ouvrir le premier fichier.' + #10 + #13 +
                                  'Cliquez sur Annuler pour annuler l''opération.', 'Drag&Drop', MB_YESNOCANCEL + MB_ICONQUESTION) ;
       case reponse of
            ID_YES : begin
                        OuvrirLeFichierDragAndDrop(Msg, NomDuFichier, sizeof(NomDuFichier)) ;

                        // Lance une nouvelle session pour chaque fichier
                        for i := 1 to NombreDeFichiers - 1 do
                        begin
                          // récupération du nom du fichier }
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
        { Lancer au démarrage de l'ordi }
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
 * Met à jour la liste des Destinataires
 ******************************************************************************}
procedure TForm1.MiseAjourRegistreDestinataire ;
Var Registre : TRegistry ;
    Nb, i : Integer ;
    tmp : string ;
begin
    Screen.Cursor := crHourGlass ;

    for i := 0 to ListeDestinataireRaisonSociale.Count - 1 do
    begin
        SauveDestinataireRegistre(i, ListeDestinataireRaisonSociale.Strings[i], ListeDestinataireRIB.Strings[i], ListeDestinataireNomBanque.Strings[i], False) ;
    end ;

    Registre := TRegistry.Create ;

    try
        { Lancer au démarrage de l'ordi }
        Registre.RootKey := HKEY_CURRENT_USER ;

        Registre.OpenKey(CHEMIN_REGISTRE + '\Destinataire', True) ;

        if Registre.ValueExists('NB_Destinataire')
        then begin
            Nb := Registre.ReadInteger('NB_Destinataire') ;

            // S'il y a moins de valeur à enregistrer que ce qui se trouve dans
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

    Screen.Cursor := crDefault ;
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
    { Demande de la taille nécessaire pour stocker les infos de Version}
    InfoSize := GetFileVersionInfoSize(PChar(Application.ExeName), Handle);
    if (InfoSize > 0)
    then begin
        { Réservation de la mémoire nécessaire}
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
 * Vérifie si nouvelle version de QuickVirPrel disponible
 ******************************************************************************}
procedure TForm1.Vrifiersinouvelleversiondisponibl1Click(Sender: TObject);
var Update : TUpdate ;
begin
   Update := TUpdate.Create(Self) ;
   Update.ShowModal ;
   Update.Free ;
end;

{*******************************************************************************
 * Récupère les tailles des enêtes des listes.
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
 * Sauvegarde les tailles des enêtes des listes.
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
 * Sauvegarde les tailles des enêtes des listes.
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
 * Sauvegarde les tailles des enêtes des listes.
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

            // si fenêtre plus gande que l'écran, prend la taille de l'écran
            if Fenetre.Width > Screen.Width
            then
                Fenetre.Width := Screen.Width ;
        end ;

        if Registre.ValueExists('Height')
        then begin
            Fenetre.Height := Registre.ReadInteger('Height') ;

            // si fenêtre plus gande que l'écran, prend la taille de l'écran
            if Fenetre.Height > Screen.Height
            then
                Fenetre.Height := Screen.Height ;
        end ;

        if Registre.ValueExists('Top')
        then begin
            Fenetre.Top := Registre.ReadInteger('Top') ;

            // si fenêter en dehors de l'écran
            if Fenetre.Top >= Screen.Height
            then
                Fenetre.Top := 0 ;
        end ;

        if Registre.ValueExists('Left')
        then begin
            Fenetre.Left := Registre.ReadInteger('Left') ;

            // si fenêter en dehors de l'écran
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
  //.Interception de l'évènement WM_SIZE
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

{*******************************************************************************
 * Affiche l'outil pour calculer la clef RIB
 ******************************************************************************}
procedure TForm1.CalculedeclefRIB1Click(Sender: TObject);
Var Feuille : TCalculeClefRIB ;
begin
    Feuille := TCalculeClefRIB.Create(Self) ;
    Feuille.ShowModal ;
    Feuille.Free ;
end;

{*******************************************************************************
 * Créer la date du virement. Utilisé par les fonctions ExporterEnXXXXXXX
 ******************************************************************************}
function TForm1.DateVirement : String ;
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

{*******************************************************************************
 * Complete le montant par des espaces et ,00.
 * Utilisé par les fonctions ExporterEnXXXXXXX
 ******************************************************************************}
function TForm1.CompleterMontant(Texte : String; NoSpace : Boolean) : String ;
Var i : Integer ;
begin
    Result := '' ;

    if not NoSpace
    then begin
        for i := 1 to 17 - Length(Texte) do
        begin
            Result := Result + ' ' ;
        end ;

        For i := 1 to Length(Texte) do
        begin
            Result := Result + Texte[i] ;
        end ;
    end
    else
        Result := Texte ;
end ;

{*******************************************************************************
 * Exporte les données de la liste en HTML
 ******************************************************************************}
procedure TForm1.ExporterEnHTML(var F: TextFile; IsXHTML : Boolean);
Var Total : Extended ;
    i : Integer ;
    RS, RIB : String ;

begin
    Screen.Cursor := crHourGlass ;

    //if ListeEmetteurComboBox.Text = 'Autre...'
    if ConfigurerEmetteurAutre.Visible = True
    then begin
        RS := EmetteurRaisonSocialeAutre ;
        RIB := EmetteurRIBAutre ;
    end
    else begin
        RS := ListeEmetteurRaisonSociale.Strings[ListeEmetteurRIB.IndexOf(StrNCopyN(1, 26, ListeEmetteurComboBox.Text))] ;
        RIB := StrNCopyN(1, 26, ListeEmetteurComboBox.Text) ;
    end ;

    if IsXHTML
    then begin
        WriteLn(F, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">') ;
        WriteLn(F, '<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fr" lang="fr">') ;
    end
    else
        WriteLn(F, '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">') ;

    WriteLn(F, '<html>');
    WriteLn(F, '<head>') ;
    WriteLn(F, '<title>QuickVirPrel - ' + RS + '</title>') ;
    WriteLn(F, '<body bgcolor="white">') ;

    WriteLn(F, RS + '<br />');
    WriteLn(F, 'Référence du lot : ' + RefferenceEmission.Text + '<br />');
    WriteLn(F, 'Imprimer le ' + DateToStr(Date) + ' et présenté le ' + DateVirement + '<br />') ;
    WriteLn(F, 'RIB d''émission : ' + RIB + '<br /><br />') ;

    Total := 0 ;

    WriteLn(F, '<table width="400" cellspacing="0" cellpadding="0" border="1" align="center">') ;
    WriteLn(F, '<tr><td><strong>Nom</strong></td><td><strong>RIB</strong></td><td><strong>R&eacute;f&eacute;rence</strong></td><td><strong>Libell&eacute;</strong></td></tr>') ;

    For i := 0 to ListView1.Items.Count -1 do
    begin
        WriteLn(F, '<tr><td>' + ListView1.Items[i].Caption + '</td><td>' + ListView1.Items[i].SubItems[0] + '</td><td>' + ListView1.Items[i].SubItems[3] + '</td><td>' + ListView1.Items[i].SubItems[4] + '</td><td>' + CompleterMontant(ListView1.Items[i].SubItems[2], True) + '</td></tr>') ;
        Total := Total + StrToFloat(ListView1.Items[i].SubItems[2]) ;
    end ;

    WriteLn(F, '</table><br />') ;
    WriteLn(F, IntToStr(ListView1.Items.Count) + ' enregistrement(s) pour un montant total de ' + FloatToStr(Total) + ' euro(s).');

    WriteLn(F, '</body></html>') ;

    Screen.Cursor := crDefault ;
end ;

{*******************************************************************************
 * Exporte les données de la liste en XML
 ******************************************************************************}
procedure TForm1.ExporterEnXML(var F: TextFile);
Var Total : Extended ;
    i : Integer ;
    RS, RIB : String ;

begin
    Screen.Cursor := crHourGlass ;

    //if ListeEmetteurComboBox.Text = 'Autre...'
    if ConfigurerEmetteurAutre.Visible = True
    then begin
        RS := EmetteurRaisonSocialeAutre ;
        RIB := EmetteurRIBAutre ;
    end
    else begin
        RS := ListeEmetteurRaisonSociale.Strings[ListeEmetteurRIB.IndexOf(StrNCopyN(1, 26, ListeEmetteurComboBox.Text))] ;
        RIB := StrNCopyN(1, 26, ListeEmetteurComboBox.Text) ;
    end ;

    WriteLn(F, '<?xml version="1.0"?>') ;
    WriteLn(F, '  <quickvirprel>') ;
    WriteLn(F, '    <raison_sociale>' + RS + '</raison_sociale>') ;
    WriteLn(F, '    <reference_lot>' + RefferenceEmission.Text + '</reference_lot>');
    WriteLn(F, '    <date_fichier>' + DateToStr(Date) + '</date_fichier>');
    WriteLn(F, '    <date_presentation>' + DateVirement + '</date_presentation>') ;
    WriteLn(F, '    <rib>' + RIB + '</rib>') ;

    Total := 0 ;

    WriteLn(F, '    <lignes>');

    For i := 0 to ListView1.Items.Count -1 do
    begin
        WriteLn(F, '      <enregistrement>') ;
        WriteLn(F, '        <nom>' + ListView1.Items[i].Caption + '</nom>') ;
        WriteLn(F, '        <rib>' + ListView1.Items[i].SubItems[0] + '</rib>') ;
        WriteLn(F, '        <reference>' + ListView1.Items[i].SubItems[3] + '</reference>');
        WriteLn(F, '        <libelle>' + ListView1.Items[i].SubItems[4] + '</libelle>');
        WriteLn(F, '        <montant>' + CompleterMontant(ListView1.Items[i].SubItems[2], True) + '</montant>') ;
        Total := Total + StrToFloat(ListView1.Items[i].SubItems[2]) ;
        WriteLn(F, '      </enregistrement>') ;
    end ;

    WriteLn(F, '    </lignes>');
    WriteLn(F, '    <nb_enregistrement>' + IntToStr(ListView1.Items.Count) + '</nb_enregistrement>') ;
    WriteLn(F, '    <montant_total>' + FloatToStr(Total) + '</montant_total>') ;
    WriteLn(F, '  </quickvirprel>') ;

    Screen.Cursor := crDefault ;
end ;

{*******************************************************************************
 * Exporte les données de la liste en CSV
 ******************************************************************************}
procedure TForm1.ExporterEnCSV(var F: TextFile; Separateur : String);
Var Total : Extended ;
    i : Integer ;
    RS, RIB : String ;
begin
    Screen.Cursor := crHourGlass ;

    //if ListeEmetteurComboBox.Text = 'Autre...'
    if ConfigurerEmetteurAutre.Visible = True
    then begin
        RS := EmetteurRaisonSocialeAutre ;
        RIB := EmetteurRIBAutre ;
    end
    else begin
        RS := ListeEmetteurRaisonSociale.Strings[ListeEmetteurRIB.IndexOf(StrNCopyN(1, 26, ListeEmetteurComboBox.Text))] ;
        RIB := StrNCopyN(1, 26, ListeEmetteurComboBox.Text) ;
    end ;

    WriteLn(F, RS);

    WriteLn(F, 'Référence du lot : ' + RefferenceEmission.Text);
    WriteLn(F, 'Imprimer le ' + DateToStr(Date) + ' et présenté le ' + DateVirement) ;
    WriteLn(F, 'RIB d''émission : ' + RIB) ;
    WriteLn(F, '') ;

    Total := 0 ;

    WriteLn(F, 'Nom' + Separateur + 'RIB' + Separateur + 'Référence' + Separateur + 'Libellé' + Separateur + 'Montant') ;

    For i := 0 to ListView1.Items.Count -1 do
    begin
        WriteLn(F, ListView1.Items[i].Caption + Separateur + ListView1.Items[i].SubItems[0] + Separateur + ListView1.Items[i].SubItems[3] + Separateur + ListView1.Items[i].SubItems[4] + Separateur + CompleterMontant(ListView1.Items[i].SubItems[2], True)) ;
        Total := Total + StrToFloat(ListView1.Items[i].SubItems[2]) ;
    end ;

    WriteLn(F, '') ;
    WriteLn(F, IntToStr(ListView1.Items.Count) + ' enregistrement(s) pour un montant total de ' + FloatToStr(Total) + ' euro(s).');

    Screen.Cursor := crDefault ;    
end ;

{*******************************************************************************
 * Exporte la liste en cours dans un fichier
 ******************************************************************************}
procedure TForm1.ExporterTexteClick(Sender: TObject);
Var F : TextFile ;
    tmp, tmp1 : String ;
    Feuille : TCSV ;
begin
    tmp := SaveDialog1.Filter ;
    tmp1 := SaveDialog1.DefaultExt ;

    case AnsiIndexStr(TMenuItem(Sender).Name, ['ExporterTexte', 'HTML1', 'XHTML1', 'XML1', 'CSV1']) of
        0 : begin
                SaveDialog1.Filter := 'Fichiers texte (*.txt)|*.txt' ;
            end ;
        1,2 : begin
                SaveDialog1.Filter := 'Fichiers HTML/XHTML (*.htm)|*.htm*' ;
                SaveDialog1.DefaultExt := 'htm' ;
            end ;
        3 : begin
                SaveDialog1.Filter := 'Fichiers XML (*.xml)|*.xml' ;
                SaveDialog1.DefaultExt := 'xml' ;
            end ;
        4 : begin
                SaveDialog1.Filter := 'Fichiers CSV (*.csv)|*.csv' ;
                SaveDialog1.DefaultExt := 'cvs' ;
            end ;
    end ;

    SaveDialog1.FileName := StrNCopyN(1, length(SaveDialog1.FileName) - length(ExtractFileExt(SaveDialog1.FileName)), SaveDialog1.FileName) ;
    SaveDialog1.FileName := SaveDialog1.FileName + '.' + SaveDialog1.DefaultExt ;

    if SaveDialog1.Execute
    then begin
        AssignFile(F, SaveDialog1.FileName) ;
        Rewrite(F) ;
        try
            case AnsiIndexStr(TMenuItem(Sender).Name, ['ExporterTexte', 'HTML1', 'XHTML1', 'XML1', 'CSV1']) of
                0 : ExporterEnFichier(F) ;
                1 : ExporterEnHTML(F, False) ;
                2 : ExporterEnHTML(F, True) ;
                3 : ExporterEnXML(F) ;
                4 : begin
                        Feuille := TCSV.Create(Self) ;
                        if Feuille.ShowModal = mrOK
                        then begin
                            case AnsiIndexStr(Feuille.SeparateurList.Text, ['Virgule', 'Tabulation', 'Point-virgule', 'Autre...']) of
                                0 : Feuille.Separateur.Text := ',' ;
                                1 : Feuille.Separateur.Text := #$09 ;
                                2 : Feuille.Separateur.Text := ';' ;
                                3 : ;
                                else
                                    Feuille.Separateur.Text := Feuille.SeparateurList.Text ;
                            end ;
                            Caption := Feuille.Separateur.Text ;
                            ExporterEnCSV(F, Feuille.Separateur.Text) ;
                        end ;
                        Feuille.Free ;
                    end ;
            end ;
        finally
            CloseFile(F) ;
        end ;
    end ;

    SaveDialog1.Filter := tmp ;
    SaveDialog1.DefaultExt := tmp1 ;

end;

{*******************************************************************************
 * Exporte la liste des destinataires ou émetteurs
 ******************************************************************************}
procedure TForm1.Listedestinataires1Click(Sender: TObject);
Var tmp, tmp1 : String ;
    i, nb : Integer ;
    IsDest : Boolean ;
    ExportIni: TIniFile;
    section : String ;
begin
    tmp := SaveDialog1.Filter ;
    tmp1 := SaveDialog1.DefaultExt ;

    SaveDialog1.Filter := 'Fichiers INI (*.ini)|*.ini' ;
    SaveDialog1.DefaultExt := 'ini' ;

    if SaveDialog1.Execute
    then begin
        DeleteFile(SaveDialog1.FileName) ;

        ExportIni := TIniFile.Create(SaveDialog1.FileName);

        try
            IsDest := (TMenuItem(Sender).Name = 'Listedestinataires1') ;
            if IsDest
            then begin
                nb := ListeDestinataireRaisonSociale.Count ;
                section := 'DESTINATAIRE'
            end
            else begin
                nb := ListeEmetteurRaisonSociale.Count ;
                section := 'EMETTEUR' ;
            end ;

            ExportIni.WriteInteger('General', 'Nombre', nb) ;
            ExportIni.WriteString('General', 'Type', section) ;

            nb := nb - 1 ;

            for i := 0 to nb do
            begin
                section := 'Ligne_' + IntToStr(i) ;
                if IsDest
                then begin
                    ExportIni.WriteString(section, 'RS', ListeDestinataireRaisonSociale.Strings[i]) ;
                    ExportIni.WriteString(section, 'RIB', ListeDestinataireRIB.Strings[i]) ;
                    ExportIni.WriteString(section, 'NB', ListeDestinataireNomBanque.Strings[i]) ;
                end
                else begin
                    ExportIni.WriteString(section, 'RS', ListeEmetteurRaisonSociale.Strings[i]) ;
                    ExportIni.WriteString(section, 'RIB', ListeEmetteurRIB.Strings[i]) ;
                    ExportIni.WriteString(section, 'NB', ListeEmetteurNomBanque.Strings[i]) ;
                    ExportIni.WriteString(section, 'PREL', ListeEmetteurNumeroPrelevement.Strings[i]) ;
                    ExportIni.WriteString(section, 'VIR', ListeEmetteurNumeroVirement.Strings[i]) ;
                end ;
            end ;

        finally
            ExportIni.Free ;
        end ;
    end ;

    SaveDialog1.Filter := tmp ;
    SaveDialog1.DefaultExt := tmp1 ;
end;

{*******************************************************************************
 * Importe la liste des destinataires ou émetteurs
 ******************************************************************************}
procedure TForm1.Listedestinataires2Click(Sender: TObject);
Var tmp, tmp1 : String ;
    i, nb, PosRIB, RepRemplacement : Integer ;
    IsDest : Boolean ;
    ImportIni: TIniFile;
    section : String ;
    error : Boolean ;
    CurrentRIB, CurrentRS, CurrentNomBanque, CurrentPrel, CurrentVir : String ;
begin
    tmp := OpenDialog1.Filter ;
    tmp1 := OpenDialog1.DefaultExt ;

    OpenDialog1.Filter := 'Fichiers INI (*.ini)|*.ini' ;
    OpenDialog1.DefaultExt := 'ini' ;

    if openDialog1.Execute
    then begin
        ImportIni := TIniFile.Create(OpenDialog1.FileName);

        try
            IsDest := (TMenuItem(Sender).Name = 'Listedestinataires2') ;

            if IsDest
            then begin
                if ImportIni.ReadString('General', 'Type', '') <> 'DESTINATAIRE'
                then begin
                    Application.MessageBox('Ce n''est pas un fichier d''import destinataire valide !', 'Erreur', MB_OK + MB_ICONERROR) ;
                    error := True ;
                end
                else
                    error := False ;
            end
            else begin
                if ImportIni.ReadString('General', 'Type', '') <> 'EMETTEUR'
                then begin
                    Application.MessageBox('Ce n''est pas un fichier d''import émetteur valide !', 'Erreur', MB_OK + MB_ICONERROR) ;
                    error := True ;
                end
                else
                    error := False ;
            end ;

            if not error
            then begin
                nb := ImportIni.ReadInteger('General', 'Nombre', 0) - 1 ;

                for i := 0 to nb do
                begin
                    section := 'Ligne_' + IntToStr(i) ;

                    CurrentRIB := ImportIni.ReadString(section, 'RIB', '') ;
                    CurrentRS := ImportIni.ReadString(section, 'RS', '') ;
                    CurrentNomBanque := ImportIni.ReadString(section, 'NB', '') ;
                    CurrentPrel := ImportIni.ReadString(section, 'PREL', '') ;
                    CurrentVir := ImportIni.ReadString(section, 'VIR', '') ;

                    if IsDest
                    then begin
                        PosRIB := ListeDestinataireRIB.IndexOf(CurrentRIB) ;

                        if  (PosRIB > -1)
                        then begin
                            // Il existe déjà un destinataire pour ce RIB
                            RepRemplacement := Application.MessageBox(PChar('Un destinataire existe déjà pour le RIB ''' + CurrentRIB + '''. Voulez-vous le remplacer ?'), 'Attention', MB_YESNO + MB_ICONQUESTION) ;

                            if RepRemplacement = IDYES
                            then begin
                                ListeDestinataireRaisonSociale.Strings[PosRIB] := CurrentRS ;
                                ListeDestinataireRIB.Strings[PosRIB] := CurrentRIB ;
                                ListeDestinataireNomBanque.Strings[PosRIB] := CurrentNomBanque ;
                            end ;
                        end
                        else begin
                            ListeDestinataireRaisonSociale.Add(CurrentRS) ;
                            ListeDestinataireRIB.Add(CurrentRIB) ;
                            ListeDestinataireNomBanque.Add(CurrentNomBanque) ;
                        end ;

                    end
                    else begin
                        PosRIB := ListeEmetteurRIB.IndexOf(CurrentRIB) ;

                        if  (PosRIB > -1)
                        then begin
                            // Il existe déjà un destinataire pour ce RIB
                            RepRemplacement := Application.MessageBox(PChar('Un émetteur existe déjà pour le RIB ''' + CurrentRIB + '''. Voulez-vous le remplacer ?'), 'Attention', MB_YESNO + MB_ICONQUESTION) ;

                            if RepRemplacement = IDYES
                            then begin
                                ListeEmetteurRaisonSociale.Strings[PosRIB] := CurrentRS ;
                                ListeEmetteurRIB.Strings[PosRIB] := CurrentRIB ;
                                ListeEmetteurNomBanque.Strings[PosRIB] := CurrentNomBanque ;
                                ListeEmetteurNumeroPrelevement.Strings[PosRIB] := CurrentPrel ;
                                ListeEmetteurNumeroVirement.Strings[PosRIB] := CurrentVir ;
                            end ;
                        end
                        else begin
                            ListeEmetteurRaisonSociale.Add(CurrentRS) ;
                            ListeEmetteurRIB.Add(CurrentRIB) ;
                            ListeEmetteurNomBanque.Add(CurrentNomBanque) ;
                            ListeEmetteurNumeroPrelevement.Add(CurrentPrel) ;
                            ListeEmetteurNumeroVirement.Add(CurrentVir) ;
                        end ;

                    end ;
                end ;

                // Mise à jour registre
                if IsDest
                then
                    MiseAjourRegistreDestinataire
                else
                    MiseAjourRegistreEmetteur ; 
            end ;
        finally
            ImportIni.Free ;
        end ;
    end ;

    OpenDialog1.Filter := tmp ;
    OpenDialog1.DefaultExt := tmp1 ;
end;

{*******************************************************************************
 * Affiche la fenêtre de configuration
 ******************************************************************************}
procedure TForm1.Configuration1Click(Sender: TObject);
Var Fenetre : TConfiguration ;
begin
    Fenetre := TConfiguration.Create(Self) ;
    Fenetre.ShowModal ;
    Fenetre.Free ;
        
    ReadConfig ;
    CreateMenuRecentFile ;
end;

{*******************************************************************************
 * Lit la config
 ******************************************************************************}
procedure TForm1.ReadConfig ;
Var Registre : TRegistry ;
begin
    Registre := TRegistry.Create ;

    try
        Registre.RootKey := HKEY_CURRENT_USER ;
        Registre.OpenKey(CHEMIN_REGISTRE + '\config', True) ;

        if Registre.ValueExists('PrintFileWhenSave')
        then
            PrintFileWhenSave := Registre.ReadInteger('PrintFileWhenSave')
        else
            PrintFileWhenSave := 1 ;

        if Registre.ValueExists('CheckEmetteurStart')
        then
            CheckEmetteurStart := Registre.ReadBool('CheckEmetteurStart')
        else
            CheckEmetteurStart := True ;


        if Registre.ValueExists('DisabledRIBChek')
        then
            DisabledRIBChek := Registre.ReadBool('DisabledRIBChek')
        else
            DisabledRIBChek := False ;

        if Registre.ValueExists('ShowGridLines')
        then
            ListView1.GridLines := Registre.ReadBool('ShowGridLines');

        if Registre.ValueExists('ToolBarButtonFlat')
        then
            ToolBar1.Flat := Registre.ReadBool('ToolBarButtonFlat') ;

        if Registre.ValueExists('ToolBarShowCaption')
        then
            ToolBar1.ShowCaptions := Registre.ReadBool('ToolBarShowCaption') ;

        if Registre.ValueExists('ToolBarList')
        then
            ToolBar1.List := Registre.ReadBool('ToolBarList') ;

        if Registre.ValueExists('HotTrack')
        then
            ListView1.HotTrack := Registre.ReadBool('HotTrack') ;

        if Registre.ValueExists('HotPoint')
        then
            if Registre.ReadBool('HandPoint')
            then
                ListView1.HotTrackStyles := ListView1.HotTrackStyles + [htHandPoint]  ;

        if Registre.ValueExists('UnderLineCold')
        then
            if Registre.ReadBool('UnderLineCold')
            then
                ListView1.HotTrackStyles := ListView1.HotTrackStyles + [htUnderlineCold	]  ;

        if Registre.ValueExists('UnderLineHot')
        then
            if Registre.ReadBool('UnderLineHot')
            then
                ListView1.HotTrackStyles := ListView1.HotTrackStyles + [htUnderlineHot	]  ;

        Registre.CloseKey ;
    finally
        Registre.Free ;
    end ;
end ;

{******************************************************************************
 * Créer le menu de fichiers récents
 ******************************************************************************}
procedure TForm1.CreateMenuRecentFile ;
Var NewItem: TMenuItem;
    i, nb : Integer ;
begin
    // Si liste existe dèjà
    NewItem := TMenuItem(FindComponent('RecentsFilesSeparated')) ;

    if NewItem <> nil
    then begin
        nb := NewItem.Tag ;
        NewItem.Free ;

        for i := 1 to nb do
        begin
            NewItem := TMenuItem(FindComponent('RC' + IntToStr(i))) ;
            NewItem.Free ;
        end ;
    end ;

    if RecentFiles.Count > 0
    then begin
        nb := RecentFiles.Count ;

        // Création de la barre de séparation
        NewItem := TMenuItem.Create(Self) ;
        NewItem.Name := 'RecentsFilesSeparated' ;
        NewItem.Caption := '-' ;
        NewItem.Tag := nb ;
        Fichier1.Add(NewItem) ;

        For i := 1 to nb do
        begin
            { Menu fichier }
            NewItem := TMenuItem.Create(Self) ;
            NewItem.Name := 'RC' + IntToStr(i) ;
            NewItem.Caption := ExtractFileName(RecentFiles.Give(i)) ;
            NewItem.Hint := RecentFiles.Give(i) ;
            NewItem.OnClick := LoadRecentFile ;
            
            Fichier1.Add(NewItem) ;
        end ;
    end ;
end ;

{******************************************************************************
 * Procédure appelée quand on clique sur un des menus représentant un fichier
 ******************************************************************************}
procedure TForm1.LoadRecentFile(Sender: TObject);
begin
    OpenDialog1.FileName := (Sender as TMenuItem).Hint ;
    OuvrirUnFichier ;    
end ;

{******************************************************************************
 * Procédure qui remet la config à zéro
 ******************************************************************************}
procedure TForm1.ResetConfig ;
Var Registre : TRegistry ;
begin
    if Application.MessageBox('Êtes-vous sûr de vouloir réinitiliser la config ?', 'Question', MB_YESNO + MB_ICONQUESTION) = IDYES
    then begin
        Registre := TRegistry.Create ;

        try
            Registre.RootKey := HKEY_CURRENT_USER ;
            Registre.OpenKey(CHEMIN_REGISTRE, True) ;

            Registre.DeleteKey('config') ;
            Registre.DeleteKey('Destinataire_ListView1') ;
            Registre.DeleteKey('Emetteur_ListView1') ;
            Registre.DeleteKey('Form1') ;
            Registre.DeleteKey('ListView1') ;

            Registre.CloseKey ;

            Registre.OpenKey(CHEMIN_REGISTRE + '\Destinataire', True) ;

            Registre.DeleteValue('Height') ;
            Registre.DeleteValue('Width') ;
            Registre.DeleteValue('Top') ;
            Registre.DeleteValue('Left') ;
            Registre.DeleteValue('WindowState') ;

            Registre.CloseKey ;

            Registre.OpenKey(CHEMIN_REGISTRE + '\Emetteur', True) ;

            Registre.DeleteValue('Height') ;
            Registre.DeleteValue('Width') ;
            Registre.DeleteValue('Top') ;
            Registre.DeleteValue('Left') ;
            Registre.DeleteValue('WindowState') ;

            Registre.CloseKey ;
        finally
            Registre.Free ;
        end ;
    end ;
end ;

{*******************************************************************************
 * Regarde s'il y a deux chiffres après la virgule
 ******************************************************************************}
function TForm1.CheckTwoNumberAfterDecimalSeparator(chaine : String) : String ;
var i, j : Integer ;
begin
    j := Length(Chaine) ;

    For i:= 1 to j do
    begin
        if Chaine[i] = DecimalSeparator
        then
            break ;
    end ;

    case j - i of
        0  : Result := chaine + '00' ;
        1  : Result := chaine + '0' ;
        2  : Result := chaine ;
        -1 : Result := chaine + DecimalSeparator + '00' ;
    end ;
end ;

end.

