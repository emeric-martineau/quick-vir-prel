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
unit UnitAjoutEmetteur;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, StdCtrls;

type
  TAjoutEmetteur = class(TForm)
    Label1: TLabel;
    Emetteur_RaisonSociale: TEdit;
    Label2: TLabel;
    Emetteur_NumPrelevement: TMaskEdit;
    Label3: TLabel;
    Emetteur_NumVirement: TMaskEdit;
    Label4: TLabel;
    Emetteur_Banque: TEdit;
    Label5: TLabel;
    Emetteur_RIB: TMaskEdit;
    Button1: TButton;
    Button2: TButton;
    procedure Emetteur_BanqueKeyPress(Sender: TObject; var Key: Char);
    procedure Emetteur_RaisonSocialeChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
    OldRIB : String ;
  end;

var
  AjoutEmetteur: TAjoutEmetteur;

implementation

uses Unit1;

{$R *.dfm}

{*******************************************************************************
 * Vérifie les données saisies
 ******************************************************************************}
procedure TAjoutEmetteur.Emetteur_BanqueKeyPress(Sender: TObject;
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
 * Vérifie la longeur
 ******************************************************************************}
procedure TAjoutEmetteur.Emetteur_RaisonSocialeChange(Sender: TObject);
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
 * Valide l'ajout de l'émetteur
 ******************************************************************************}
procedure TAjoutEmetteur.Button1Click(Sender: TObject);
    procedure MessageErreur(Texte : PChar) ;
    begin
        Application.MessageBox(Texte, 'Erreur', MB_OK + MB_ICONERROR) ;
    end ;
begin
    if (Form1.DisabledRIBChek) or (Form1.CheckRIB(Emetteur_RIB.Text))
    then begin
        if Emetteur_RaisonSociale.Text <> ''
        then
            if Emetteur_NumPrelevement.Text <> '      '
            then
//                if (Emetteur_NumVirement.Text <> '      ') or (Emetteur_NumVirement.Visible = False)
//                then
                    if (Emetteur_Banque.Text <> '') or (Emetteur_Banque.Visible = False)
                    then
                        if (Form1.ListeEmetteurRIB.IndexOf(Emetteur_RIB.Text) = -1) or ((Form1.ListeEmetteurRIB.IndexOf(Emetteur_RIB.Text) <> -1) and (OldRIB = Emetteur_RIB.Text)) or (Emetteur_NumVirement.Visible = False)
                        then
                            Self.ModalResult := mrOK
                        else  begin
                            MessageErreur('Le RIB saisi est déjà enregistré. Vous ne pouvez pas saisir plusieur fois le même RIB.') ;
                            Emetteur_RIB.SetFocus ;
                        end
                    else begin
                        MessageErreur('Veuillez saisir un nom de banque.') ;
                        Emetteur_Banque.SetFocus ;
                    end
//                else begin
//                    MessageErreur('Veuillez saisir un numéro de virement.') ;
//                    Emetteur_NumVirement.SetFocus ;
//                end
            else begin
                MessageErreur('Veuillez saisir un numéro de prélévement.') ;
                Emetteur_NumPrelevement.SetFocus ;
            end
        else begin
            MessageErreur('Veuillez saisir une raison sociale.') ;
            Emetteur_RaisonSociale.SetFocus ;
        end ;
    end
    else begin
        MessageErreur('La clef RIB que vous tentez d''ajouter est erronée. Vérifier la.') ;
        Emetteur_RIB.SetFocus ;
    end ;
end;

{*******************************************************************************
 * Met la fenêtre au premier plan
 ******************************************************************************}
procedure TAjoutEmetteur.FormShow(Sender: TObject);
begin
    SetForegroundWindow(Handle) ;
end;

procedure TAjoutEmetteur.FormCreate(Sender: TObject);
begin
    OldRIB := '' ;
end;

end.
