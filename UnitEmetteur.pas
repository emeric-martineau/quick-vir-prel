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
unit UnitEmetteur;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, UnitAjoutEmetteur;

type
  TEmetteur = class(TForm)
    Panel1: TPanel;
    Ajouter: TButton;
    Modifier: TButton;
    Supprimer: TButton;
    Emetteur_ListView1: TListView;
    Fermer: TButton;
    procedure AjouterClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Emetteur_ListView1ColumnClick(Sender: TObject; Column: TListColumn);
    procedure SupprimerClick(Sender: TObject);
    procedure Emetteur_ListView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Emetteur_ListView1Enter(Sender: TObject);
    procedure ModifierClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Déclarations privées }
    procedure ListerEmetteur ;
    procedure SupprimerLigne ;
  public
    { Déclarations publiques }
  end;

var
  Emetteur: TEmetteur;

implementation

uses Unit1;

{$R *.dfm}

procedure TEmetteur.AjouterClick(Sender: TObject);
begin
    Form1.EmetteurAjout1Click(Sender) ;
    ListerEmetteur ;
end;

procedure TEmetteur.FormCreate(Sender: TObject);
begin
    ListerEmetteur ;

    Form1.GetListViewColumnWidth(Emetteur_ListView1) ;
    Form1.GetWindowProperties(Self) ;
end;

procedure TEmetteur.ListerEmetteur ;
Var i : Integer ;
    ListItem : TListItem;
begin
    // Vide la liste
    Emetteur_ListView1.Clear ;

    // Bloque le rafraichisement
    Emetteur_ListView1.Items.BeginUpdate ;

    For i := 0 to Form1.ListeEmetteurRaisonSociale.Count - 1 do
    begin
        ListItem := Emetteur_ListView1.Items.Add ;

        ListItem.Caption := Form1.ListeEmetteurRaisonSociale.Strings[i] ;
        ListItem.SubItems.Add(Form1.ListeEmetteurNomBanque.Strings[i]) ;
        ListItem.SubItems.Add(Form1.ListeEmetteurRIB.Strings[i]) ;
        ListItem.SubItems.Add(Form1.ListeEmetteurNumeroVirement.Strings[i]) ;
        ListItem.SubItems.Add(Form1.ListeEmetteurNumeroPrelevement.Strings[i]) ;                        
    end ;

    // Débloque le rafraichisement
    Emetteur_ListView1.Items.EndUpdate ;
end ;

{$J+}
procedure TEmetteur.Emetteur_ListView1ColumnClick(Sender: TObject;
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

procedure TEmetteur.SupprimerClick(Sender: TObject);
begin
    if Application.MessageBox('Êtes-vous sûr de vouloir supprimer les lignes sélectionnées ?', 'Suppression', MB_YESNO + MB_ICONQUESTION) = ID_YES
    then begin
        SupprimerLigne ;
    end ;
end;

procedure TEmetteur.Emetteur_ListView1KeyDown(Sender: TObject; var Key: Word;
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
procedure TEmetteur.SupprimerLigne ;
Var oldIndex : Integer ;
    i : Integer ;
    Index : Integer ;
begin
    oldIndex := Emetteur_ListView1.ItemIndex ;

    // S'il y a des éléments sélectionnés
    if Emetteur_ListView1.SelCount > 0
    then begin
        i := 0 ;

        repeat
            if Emetteur_ListView1.Items[i].Selected = True
            then begin
                // Supprimer des listes de TForm1 et de la base de registre
                //Index := Form1.ListeEmetteurRaisonSociale.IndexOf(ListView1.Items.Item[i].Caption) ;
                Index := Form1.ListeEmetteurRIB.IndexOf(Emetteur_ListView1.Items.Item[i].SubItems.Strings[1]) ;

                Form1.ListeEmetteurRaisonSociale.Delete(Index);
                Form1.ListeEmetteurRIB.Delete(Index);
                Form1.ListeEmetteurNumeroVirement.Delete(Index);
                Form1.ListeEmetteurNumeroPrelevement.Delete(Index);
                Form1.ListeEmetteurNomBanque.Delete(Index);

                Form1.MiseAjourRegistreEmetteur ;

                Emetteur_ListView1.Items.Delete(i) ;
            end
            else begin
                i := i + 1 ;
            end ;
        until i = Emetteur_ListView1.Items.Count ;
    end ;

    // Resélectionne la liste
    if Emetteur_ListView1.Items.Count <> 0
    then begin
        if oldIndex < Emetteur_ListView1.Items.Count - 1
        then begin
            Emetteur_ListView1.ItemIndex := oldIndex ;
        end
        else begin
            Emetteur_ListView1.ItemIndex := Emetteur_ListView1.Items.Count - 1 ;
        end ;

        Emetteur_ListView1.SetFocus ;
    end ;
end;

procedure TEmetteur.Emetteur_ListView1Enter(Sender: TObject);
begin
    if Emetteur_ListView1.ItemIndex <> -1
    then begin
        Modifier.Enabled := True ;
        Supprimer.Enabled := True ;
    end
    else begin
        Modifier.Enabled := False ;
        Supprimer.Enabled := False ;
    end ;
end;

procedure TEmetteur.ModifierClick(Sender: TObject);
Var AjoutEmetteur : TAjoutEmetteur ;
    Index : Integer ;
begin
    if Emetteur_ListView1.ItemIndex <> -1
    then begin
        AjoutEmetteur := TAjoutEmetteur.Create(Self) ;
        AjoutEmetteur.Caption := 'Modification d''un émetteur' ;
        AjoutEmetteur.OldRIB := Emetteur_ListView1.Items.Item[Emetteur_ListView1.ItemIndex].SubItems.Strings[1] ;

        AjoutEmetteur.Emetteur_RaisonSociale.Text := Emetteur_ListView1.Items.Item[Emetteur_ListView1.ItemIndex].Caption ;
        AjoutEmetteur.Emetteur_Banque.Text := Emetteur_ListView1.Items.Item[Emetteur_ListView1.ItemIndex].SubItems.Strings[0] ;
        AjoutEmetteur.Emetteur_RIB.Text := Emetteur_ListView1.Items.Item[Emetteur_ListView1.ItemIndex].SubItems.Strings[1] ;
        AjoutEmetteur.Emetteur_NumVirement.Text := Emetteur_ListView1.Items.Item[Emetteur_ListView1.ItemIndex].SubItems.Strings[2] ;
        AjoutEmetteur.Emetteur_NumPrelevement.Text := Emetteur_ListView1.Items.Item[Emetteur_ListView1.ItemIndex].SubItems.Strings[3] ;

         // Ajouter à la liste si mrOK
        if AjoutEmetteur.ShowModal = mrOK
        then begin
            Index := Form1.ListeEmetteurRIB.IndexOf(Emetteur_ListView1.Items.Item[Emetteur_ListView1.ItemIndex].SubItems.Strings[1]) ;

            Form1.ListeEmetteurRaisonSociale[Index] := AjoutEmetteur.Emetteur_RaisonSociale.Text ;
            Form1.ListeEmetteurRIB[Index] := AjoutEmetteur.Emetteur_RIB.Text ;
            Form1.ListeEmetteurNumeroVirement[Index] := AjoutEmetteur.Emetteur_NumVirement.Text ;
            Form1.ListeEmetteurNumeroPrelevement[Index] := AjoutEmetteur.Emetteur_NumPrelevement.Text ;
            Form1.ListeEmetteurNomBanque[Index] := AjoutEmetteur.Emetteur_Banque.Text ;

            Emetteur_ListView1.Items.Item[Emetteur_ListView1.ItemIndex].Caption := AjoutEmetteur.Emetteur_RaisonSociale.Text ;
            Emetteur_ListView1.Items.Item[Emetteur_ListView1.ItemIndex].SubItems.Strings[0] := AjoutEmetteur.Emetteur_Banque.Text ;
            Emetteur_ListView1.Items.Item[Emetteur_ListView1.ItemIndex].SubItems.Strings[1] := AjoutEmetteur.Emetteur_RIB.Text ;
            Emetteur_ListView1.Items.Item[Emetteur_ListView1.ItemIndex].SubItems.Strings[2] := AjoutEmetteur.Emetteur_NumVirement.Text ;
            Emetteur_ListView1.Items.Item[Emetteur_ListView1.ItemIndex].SubItems.Strings[3] := AjoutEmetteur.Emetteur_NumPrelevement.Text ;

            Form1.SauveEmetteurRegistre(Index, AjoutEmetteur.Emetteur_RaisonSociale.Text, AjoutEmetteur.Emetteur_RIB.Text, AjoutEmetteur.Emetteur_NumVirement.Text, AjoutEmetteur.Emetteur_NumPrelevement.Text, AjoutEmetteur.Emetteur_Banque.Text, False) ;
        end ;

        AjoutEmetteur.Free ;
    end ;
end;

procedure TEmetteur.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Form1.SetListViewColumnWidth(Emetteur_ListView1) ;
    Form1.SetWindowProperties(Self) ;
end;

end.
