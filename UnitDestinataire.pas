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
unit UnitDestinataire;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, UnitAjouterDestinataire;

type
  TDestinataire = class(TForm)
    Panel1: TPanel;
    Ajouter: TButton;
    Modifier: TButton;
    Supprimer: TButton;
    Destinataire_ListView1: TListView;
    Fermer: TButton;
    procedure AjouterClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Destinataire_ListView1ColumnClick(Sender: TObject; Column: TListColumn);
    procedure SupprimerClick(Sender: TObject);
    procedure Destinataire_ListView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Destinataire_ListView1Enter(Sender: TObject);
    procedure ModifierClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Déclarations privées }
    procedure ListerDestinataire ;
    procedure SupprimerLigne ;
  public
    { Déclarations publiques }
  end;

var
  Destinataire: TDestinataire;

implementation

uses Unit1;

{$R *.dfm}

procedure TDestinataire.AjouterClick(Sender: TObject);
begin
    Form1.Ajouter2Click(Sender) ;
    ListerDestinataire ;
end;

procedure TDestinataire.FormCreate(Sender: TObject);
begin
    ListerDestinataire ;

    Form1.GetListViewColumnWidth(Destinataire_ListView1) ;
    Form1.GetWindowProperties(Self) ;    
end;

procedure TDestinataire.ListerDestinataire ;
Var i : Integer ;
    ListItem : TListItem;
begin
    // Vide la liste
    Destinataire_ListView1.Clear ;

    // Bloque le rafraichisement
    Destinataire_ListView1.Items.BeginUpdate ;

    For i := 0 to Form1.ListeDestinataireRaisonSociale.Count - 1 do
    begin
        ListItem := Destinataire_ListView1.Items.Add ;

        ListItem.Caption := Form1.ListeDestinataireRaisonSociale.Strings[i] ;
        ListItem.SubItems.Add(Form1.ListeDestinataireNomBanque.Strings[i]) ;
        ListItem.SubItems.Add(Form1.ListeDestinataireRIB.Strings[i]) ;
    end ;

    // Débloque le rafraichisement
    Destinataire_ListView1.Items.EndUpdate ;
end ;

{$J+}
procedure TDestinataire.Destinataire_ListView1ColumnClick(Sender: TObject;
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
    if Colonne = Column.ID
    then
        OrdreCroissant := not OrdreCroissant
    else
        OrdreCroissant := True ;

    { Mémorise la colone }
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
        NumSubItem := Column.ID - 1;

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

procedure TDestinataire.SupprimerClick(Sender: TObject);
begin
    if Application.MessageBox('Êtes-vous sûr de vouloir supprimer les lignes sélectionnées ?', 'Suppression', MB_YESNO + MB_ICONQUESTION) = ID_YES
    then begin
        SupprimerLigne ;
    end ;
end;

procedure TDestinataire.Destinataire_ListView1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key = VK_DELETE
    then
        SupprimerClick(Sender)
    else if Key = VK_INSERT
    then
        AjouterClick(Sender) ;
end;

{*******************************************************************************
 * Supprime un élément de la liste
 ******************************************************************************}
 {$O-}
procedure TDestinataire.SupprimerLigne ;
Var oldIndex : Integer ;
    i : Integer ;
    Index : Integer ;
begin
    oldIndex := Destinataire_ListView1.ItemIndex ;

    // S'il y a des éléments sélectionnés
    if Destinataire_ListView1.SelCount > 0
    then begin
        i := 0 ;

        repeat
            if Destinataire_ListView1.Items[i].Selected = True
            then begin
                // Supprimer des listes de TForm1 et de la base de registre
                //Index := Form1.ListeDestinataireRaisonSociale.IndexOf(Destinataire_ListView1.Items.Item[i].Caption) ;
                Index := Form1.ListeDestinataireRIB.IndexOf(Destinataire_ListView1.Items.Item[i].SubItems.Strings[1]) ;

                Form1.ListeDestinataireRaisonSociale.Delete(Index);
                Form1.ListeDestinataireRIB.Delete(Index);
                Form1.ListeDestinataireNomBanque.Delete(Index);

                Form1.MiseAjourRegistreDestinataire ;

                Destinataire_ListView1.Items.Delete(i) ;                
            end
            else begin
                i := i + 1 ;
            end ;
        until i = Destinataire_ListView1.Items.Count ;
    end ;

    // Resélectionne la liste
    if Destinataire_ListView1.Items.Count <> 0
    then begin
        if oldIndex < Destinataire_ListView1.Items.Count - 1
        then begin
            Destinataire_ListView1.ItemIndex := oldIndex ;
        end
        else begin
            Destinataire_ListView1.ItemIndex := Destinataire_ListView1.Items.Count - 1 ;
        end ;

        Destinataire_ListView1.SetFocus ;
    end ;
end;

procedure TDestinataire.Destinataire_ListView1Enter(Sender: TObject);
begin
    if Destinataire_ListView1.ItemIndex <> -1
    then begin
        Modifier.Enabled := True ;
        Supprimer.Enabled := True ;
    end
    else begin
        Modifier.Enabled := False ;
        Supprimer.Enabled := False ;
    end ;
end;

procedure TDestinataire.ModifierClick(Sender: TObject);
Var AjoutDestinataire : TAjoutDestinataire ;
    Index : Integer ;
begin
    if Destinataire_ListView1.ItemIndex <> -1
    then begin
        AjoutDestinataire := TAjoutDestinataire.Create(Self) ;
        AjoutDestinataire.Caption := 'Modification d''un émetteur' ;

        AjoutDestinataire.Destinataire_RaisonSociale.Text := Destinataire_ListView1.Items.Item[Destinataire_ListView1.ItemIndex].Caption ;
        AjoutDestinataire.Destinataire_Banque.Text := Destinataire_ListView1.Items.Item[Destinataire_ListView1.ItemIndex].SubItems.Strings[0] ;
        AjoutDestinataire.Destinataire_RIB.Text := Destinataire_ListView1.Items.Item[Destinataire_ListView1.ItemIndex].SubItems.Strings[1] ;

         // Ajouter à la liste si mrOK
        if AjoutDestinataire.ShowModal = mrOK
        then begin
            Index := Form1.ListeDestinataireRIB.IndexOf(Destinataire_ListView1.Items.Item[Destinataire_ListView1.ItemIndex].SubItems.Strings[1]) ;

            Form1.ListeDestinataireRaisonSociale[Index] := AjoutDestinataire.Destinataire_RaisonSociale.Text ;
            Form1.ListeDestinataireRIB[Index] := AjoutDestinataire.Destinataire_RIB.Text ;
            Form1.ListeDestinataireNomBanque[Index] := AjoutDestinataire.Destinataire_Banque.Text ;

            Destinataire_ListView1.Items.Item[Destinataire_ListView1.ItemIndex].Caption := AjoutDestinataire.Destinataire_RaisonSociale.Text ;
            Destinataire_ListView1.Items.Item[Destinataire_ListView1.ItemIndex].SubItems.Strings[0] := AjoutDestinataire.Destinataire_Banque.Text ;
            Destinataire_ListView1.Items.Item[Destinataire_ListView1.ItemIndex].SubItems.Strings[1] := AjoutDestinataire.Destinataire_RIB.Text ;

            Form1.SauveDestinataireRegistre(Index, AjoutDestinataire.Destinataire_RaisonSociale.Text, AjoutDestinataire.Destinataire_RIB.Text, AjoutDestinataire.Destinataire_Banque.Text, False) ;
        end ;

        AjoutDestinataire.Free ;
    end ;
end;

procedure TDestinataire.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Form1.SetListViewColumnWidth(Destinataire_ListView1) ;
    Form1.SetWindowProperties(Self) ;
end;

end.
