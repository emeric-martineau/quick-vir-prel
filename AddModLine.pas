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
unit AddModLine;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, UnitDestinataire ;

type
  TAjouterModifierLigne = class(TForm)
    Label13: TLabel;
    Destinataire_RaisonSociale: TEdit;
    Label14: TLabel;
    Destinataire_Montant: TEdit;
    Label6: TLabel;
    Destinataire_Banque: TEdit;
    Label15: TLabel;
    Destinataire_Reference: TEdit;
    Label21: TLabel;
    Destinataire_Libelle: TEdit;
    Destinataire_RIB: TMaskEdit;
    Label7: TLabel;
    ajouter: TButton;
    Button1: TButton;
    ChargerDestinataireBouton: TButton;
    procedure ajouterClick(Sender: TObject);
    procedure Destinataire_RaisonSocialeKeyPress(Sender: TObject;
      var Key: Char);
    procedure Destinataire_MontantKeyPress(Sender: TObject; var Key: Char);
    procedure Destinataire_RaisonSocialeChange(Sender: TObject);
    procedure ChargerDestinataireBoutonClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  AjouterModifierLigne: TAjouterModifierLigne;

implementation

uses Unit1;

{$R *.dfm}

procedure TAjouterModifierLigne.ajouterClick(Sender: TObject);
    procedure MessageErreur(Texte : PChar) ;
    begin
        Application.MessageBox(Texte, 'Erreur', MB_OK + MB_ICONERROR) ;
    end ;
begin
    if (Form1.DisabledRIBChek) or (Form1.CheckRIB(Destinataire_RIB.Text))
    then begin
        if Destinataire_RaisonSociale.Text <> ''
        then
            if Destinataire_Montant.Text <> ''
            then
                if StrToFloat(Destinataire_Montant.Text) <> 0
                then
                    if Destinataire_Banque.Text <> ''
                    then
//                        if Destinataire_Reference.Text <> ''
//                        then
//                            if Destinataire_Libelle.Text <> ''
//                            then
                                Self.ModalResult := mrOK
//                            else begin
//                                MessageErreur('Veuillez saisir un libellé.') ;
//                                Destinataire_Libelle.SetFocus ;
//                            end
//                        else begin
//                            MessageErreur('Veuillez saisir une référence.') ;
//                            Destinataire_Reference.SetFocus ;
//                        end
                    else begin
                        MessageErreur('Veuillez saisir un nom de banque.') ;
                        Destinataire_Banque.SetFocus ;
                    end
                else begin
                    MessageErreur('Veuillez saisir un montant (autre que zéro).') ;
                    Destinataire_Montant.SelectAll ;
                    Destinataire_Montant.SetFocus ;
                end
            else begin
                MessageErreur('Veuillez saisir un montant.') ;
                Destinataire_Montant.SetFocus ;
            end
        else begin
            MessageErreur('Veuillez saisir une raison sociale.') ;
            Destinataire_RaisonSociale.SetFocus ;
        end ;
    end
    else begin
        MessageErreur('La clef RIB du destinataire que vous tentez d''ajouter est erronée. Vérifier la.') ;
        Destinataire_RIB.SetFocus ;
    end ;

    // Ajoute une virgule et 2 0 si y en a pas
    {
    if not Form1.CheckVirgule(Destinataire_Montant.Text)
    then
        Destinataire_Montant.Text := Destinataire_Montant.Text + DecimalSeparator + '00' ;
    }
    // Vérifie qu'il y a bien deux chiffres après la virgule
    Destinataire_Montant.Text := Form1.CheckTwoNumberAfterDecimalSeparator(Destinataire_Montant.Text) ;
end;

{*******************************************************************************
 * Vérifie les données saisies
 ******************************************************************************}
procedure TAjouterModifierLigne.Destinataire_RaisonSocialeKeyPress(
  Sender: TObject; var Key: Char);
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
             if (TEdit(Sender).Name = 'Destinataire_RaisonSociale') and (Length(Destinataire_RaisonSociale.Text) >= 24)
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
             end ;
         end ;
    end ;
end;

{*******************************************************************************
 * Vérifie les données saisies
 ******************************************************************************}
procedure TAjouterModifierLigne.Destinataire_MontantKeyPress(
  Sender: TObject; var Key: Char);
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
            if Destinataire_Montant.Text[i] = DecimalSeparator
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
        if (Key in ['0'..'9', '.', ',', DecimalSeparator])
        then begin
            if (Key in ['.', ',', DecimalSeparator])
            then begin
                if (Length(Destinataire_Montant.Text) > 0)
                then
                    Key := DecimalSeparator
                else
                    Key := #0 ;

                if Form1.CheckVirgule(Destinataire_Montant.Text)
                then
                    Key := #0 ;
            end ;
        end
        else
            Key := #0 ;

        if TEdit(Sender).SelLength = 0
        then begin
            // Vérifie la longueur du texte
            if Form1.CheckVirgule(Destinataire_Montant.Text) and (Length(Destinataire_Montant.Text) = 17)
            then
                Key := #0 ;

            if (not Form1.CheckVirgule(Destinataire_Montant.Text)) and (Length(Destinataire_Montant.Text) = 16)
            then
                Key := #0 ;

            if not CheckMoreDataAfterVirgule
            then
                Key := #0 ;
        end ;
    end ;
end;

{*******************************************************************************
 * Vérifie la longeur
 ******************************************************************************}
procedure TAjouterModifierLigne.Destinataire_RaisonSocialeChange(
  Sender: TObject);
Var len : Integer ;
    i : Integer ;
    temp : String ;
begin
    Len := 0 ;
    Temp := '' ;

    if (TEdit(Sender).Name = 'Destinataire_RaisonSociale')
    then begin
        Len := 24 ;
    end
    else if (TEdit(Sender).Name = 'Destinataire_Banque')
    then begin
        Len := 20 ;
    end
    else if (TEdit(Sender).Name = 'Destinataire_Reference')
    then begin
        Len := 12 ;
    end
    else if (TEdit(Sender).Name = 'Destinataire_Libelle')
    then begin
        Len := 31 ;
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

procedure TAjouterModifierLigne.ChargerDestinataireBoutonClick(
  Sender: TObject);
Var Destinataire : TDestinataire ;
begin
    Destinataire := TDestinataire.Create(Self);
    Destinataire.Supprimer.Visible := False ;
    Destinataire.Modifier.Visible := False ;
    Destinataire.Ajouter.OnClick := nil ;
    Destinataire.Ajouter.ModalResult := mrOK ;

    if (Destinataire.ShowModal = mrOK) and (Destinataire.Destinataire_ListView1.Selected <> nil)
    then begin
        Destinataire_RaisonSociale.Text := Destinataire.Destinataire_ListView1.Selected.Caption ;
        Destinataire_Banque.Text := Destinataire.Destinataire_ListView1.Selected.SubItems[0] ;
        Destinataire_RIB.Text := Destinataire.Destinataire_ListView1.Selected.SubItems[1] ;
    end ;

    Destinataire.Free ;
end;


end.
