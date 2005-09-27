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
unit UnitAjouterDestinataire;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask;

type
  TAjoutDestinataire = class(TForm)
    Label13: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Destinataire_RaisonSociale: TEdit;
    Destinataire_Banque: TEdit;
    Destinataire_RIB: TMaskEdit;
    ajouter: TButton;
    Button1: TButton;
    procedure Destinataire_RaisonSocialeChange(Sender: TObject);
    procedure Destinataire_RaisonSocialeKeyPress(Sender: TObject;
      var Key: Char);
    procedure ajouterClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  AjoutDestinataire: TAjoutDestinataire;

implementation

uses Unit1;

{$R *.dfm}

procedure TAjoutDestinataire.Destinataire_RaisonSocialeChange(
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

procedure TAjoutDestinataire.Destinataire_RaisonSocialeKeyPress(
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
             end ;
         end ;
    end ;
end;

procedure TAjoutDestinataire.ajouterClick(Sender: TObject);
    procedure MessageErreur(Texte : PChar) ;
    begin
        Application.MessageBox(Texte, 'Erreur', MB_OK + MB_ICONERROR) ;
    end ;
begin
    if  (Form1.DisabledRIBChek) or  (Form1.CheckRIB(Destinataire_RIB.Text))
    then begin
        if Destinataire_RaisonSociale.Text <> ''
        then
            if Destinataire_Banque.Text <> ''
            then
                Self.ModalResult := mrOK
            else begin
                MessageErreur('Veuillez saisir un nom de banque.') ;
                Destinataire_Banque.SetFocus ;
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
end;

end.
