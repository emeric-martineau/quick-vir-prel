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
 * Unit� qui g�re les fichiers r�cents. Attention, quand on d�truit l'objet, les
 * fichier sont enregistr�s.
 *
 * Bubule le 21/02/2002
 * Bubule le 26/06/2005 - ajout de la proc�dure ClearList
 *}
unit UnitFichiersRecents;

interface

uses Windows, Messages, Classes, Registry, SysUtils ;

type
  TRecentFiles = class
  private
      FilesName : TStrings ;
      MaxNumber: Integer ;
      RootKey  : HKEY ;
      Chemin   : String ;
      FUnique  : Boolean ;
      procedure LitFichierRecent ;
      procedure SetUnique(me : Boolean) ;
  public
      constructor Create(Key : HKEY; Path : String) ;
      destructor Free ;
      procedure Add(NomFichier : string) ;
      function Give(index : integer) : string;
      procedure Delete(NomFichier : String) ;
      function Count : integer ;
      procedure SetMaxNumberFiles(i : integer) ;
      function GetMaxNumberFiles : integer ;
      procedure ClearList ;

      procedure Write ;
      { Indique s'il peut ou non y avoir plusieurs fois le m�me fichier.
        True ->non. Par defauf � True }
      property unique : Boolean
          read FUnique write SetUnique ;
  end ;

Const
    FR_KEY    : String = '\RecentFiles' ;
    FR_NB     : String = 'NombreFichierRecentMax' ;
    FR_FR_KEY : String = '\RecentFiles' ;
    MAX_NUM   : Integer = 255 ; { Nombre max de fichiers enregistr�s }

implementation

{******************************************************************************
 * Consructeur
 ******************************************************************************}
constructor TRecentFiles.Create(Key : HKEY; Path : String) ;
Var Registre : TRegistry ;
begin
    FUnique := True ; 

    { Cr�er l'objet FileName }
    FilesName := TStringList.Create ;

    { Creer la l'objet registre }
    Registre := TRegistry.Create() ;
    Registre.RootKey := Key ;

    { HKEY_LOCAL_MACHINE, ... }
    RootKey := Key ;
    { \software\... }
    Chemin := Path ;

    if not Registre.OpenKey(Chemin + FR_KEY, True)
    then
        Free
    else begin
        { Lit le nombre maxi de fichier recent }
        if Registre.ValueExists(FR_NB)
        then begin
            MaxNumber := Registre.ReadInteger(FR_NB) ;
            LitFichierRecent ;
        end
        else
            SetMaxNumberFiles(5) ;
    end ;

    Registre.Free ;    
end ;

{******************************************************************************
 * Destructeur
 ******************************************************************************}
destructor TRecentFiles.Free ;
begin
    { Enregistre les donn�es }
    Write ;

    FilesName.Free ;
end ;

{******************************************************************************
 * Ajouter un fichier � la fin de la liste. Si la liste est compl�te, le
 * premier �l�ment est supprimer et la liste est d�cal�e vers le haut.
 ******************************************************************************}
procedure TRecentFiles.Add(NomFichier : string) ;
Var i : Integer ;
begin
    { V�rifie si n�cesaire si le fichier est pr�sent }
    if (FUnique = True)
    then
        if FilesName.IndexOf(NomFichier) <> -1
        then
            { Le fichier est pr�sent }
            Exit ;

    if (FilesName.Count = MaxNumber)
    then begin
        { on applique la r�gle du 1 = 2 :-}
        { -2 car on ne fait pas le dernier }
        For i := 0 to MaxNumber - 2 do
            FilesName[i] := FilesName[i + 1] ;

        FilesName.Delete(MaxNumber - 1) ;
    end ;

    FilesName.Add(NomFichier) ;

    Self.Write ;
end ;

{******************************************************************************
 * Supprimer l'entr�e correspondant au nom du fichier.
 ******************************************************************************}
procedure TRecentFiles.Delete(NomFichier : String) ;
Var i : Integer ;
begin
    i := FilesName.IndexOf(NomFichier) ;

    if (i <> -1)
    then begin
        FilesName.Delete(i) ;
        Self.Write ;
    end ;
end;

{******************************************************************************
 * Donne le nombre de fichiers r�cents
 ******************************************************************************}
function TRecentFiles.Count : Integer ;
begin
        Result := FilesName.Count ;
end ;

{******************************************************************************
 * Donne la fichier correspondant � l'index.
 ******************************************************************************}
function TRecentFiles.Give(index : integer) : string ;
begin
    if (index <= FilesName.Count)
    then begin
        Result := FilesName[index - 1] ;
    end
    else
        Result := '' ;
end ;

{******************************************************************************
 * Configure le nombre maxi de fichiers r�cents
 ******************************************************************************}
procedure TRecentFiles.SetMaxNumberFiles(i : integer) ;
Var  Registre : TRegistry ;
     j : Integer ;
begin
    { Creer la l'objet registre }
    Registre := TRegistry.Create() ;
    Registre.RootKey := RootKey ;

    Registre.OpenKey(Chemin + FR_KEY, True) ;

    Registre.WriteInteger(FR_NB, i);

    // Si on diminue la liste
    if MaxNumber > i
    then begin
        For j := i to MaxNumber - 1 do
            FilesName.Delete(i) ;

        Self.Write ;
    end ;

    MaxNumber := i ;

    Registre.Free ;
end ;

{******************************************************************************
 * Donne le nombre maxi de fichiers r�cents
 ******************************************************************************}
function TRecentFiles.GetMaxNumberFiles : integer ;
begin
    Result := MaxNumber ;
end ;

{******************************************************************************
 * Procedure qui lit les fichies r�cents
 ******************************************************************************}
procedure TRecentFiles.LitFichierRecent ;
Var  Registre : TRegistry ;
     i : Integer ;
begin

    { Creer la l'objet registre }
    Registre := TRegistry.Create() ;
    Registre.RootKey := RootKey ;

    Registre.OpenKey(Chemin + FR_FR_KEY, True) ;

    For i := 0 to MaxNumber - 1 do
    begin
        if Registre.ValueExists(IntToStr(i))
        then
            FilesName.Add(Registre.ReadString(IntToStr(i)))
        else
            break ;

    end ;

    Registre.Free ;
end ;

{******************************************************************************
 * Procedure qui �crit les fichiers dans la base de registre
 ******************************************************************************}
procedure TRecentFiles.Write ;
Var Registre : TRegistry ;
    i : Integer ;
begin
    { Creer la l'objet registre }
    Registre := TRegistry.Create() ;
    Registre.RootKey := RootKey ;

    Registre.OpenKey(Chemin + FR_FR_KEY, True) ;

    { Supprimer toutes les clefs existantes }
    For i := 0 to MAX_NUM do
        if Registre.ValueExists(IntToStr(i))
        then
            Registre.DeleteValue(IntToStr(i))
        else
            break ;

    { Enregistre les valeurs }
    For i := 0 to FilesName.Count - 1 do
        Registre.WriteString(IntToStr(i), FilesName[i]) ;

    Registre.Free ;
end ;

procedure TRecentFiles.SetUnique(me : Boolean) ;
begin
    FUnique := me ;
end ;

{******************************************************************************
 * Procedure qui �crit supprime la liste de fichiers
 ******************************************************************************}
procedure TRecentFiles.ClearList ;
Var Registre : TRegistry ;
    i : Integer ;
begin
    { Creer la l'objet registre }
    Registre := TRegistry.Create() ;
    Registre.RootKey := RootKey ;

    Registre.OpenKey(Chemin + FR_FR_KEY, True) ;

    { Supprimer toutes les clefs existantes }
    For i := 0 to MAX_NUM do
        if Registre.ValueExists(IntToStr(i))
        then
            Registre.DeleteValue(IntToStr(i))
        else
            break ;

    Registre.Free ;

    FilesName.Clear ;            
end ;

end.
