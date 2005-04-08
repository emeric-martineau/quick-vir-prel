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
unit UnitUpdateThread;

interface

uses
  Classes, WinSock, SysUtils, StdCtrls ;

type
  TFoundUpdateVersion = class(TThread)
  private
    { Déclarations privées }
    procedure OnTerminateProcedure(Sender : TObject) ;
  protected
    procedure Execute; override;
  public
    currentVersion : String ;
    NewVersion : Boolean ;
    proc : procedure of Object ;
    constructor Create(Suspended : Boolean) ;
  end;

implementation

{ Important : les méthodes et propriétés des objets de la VCL ou CLX peuvent uniquement être
  utilisées dans une méthode appelée avec Synchronize. Par exemple,

      Synchronize(UpdateCaption);

  UpdateCaption ayant l''apparence suivante :

    procedure FoundUpdateVersion.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

{ FoundUpdateVersion }
constructor TFoundUpdateVersion.Create(Suspended : Boolean) ;
begin
  FreeOnTerminate := True ;
  inherited Create(Suspended) ;
  OnTerminate := OnTerminateProcedure ;
  NewVersion := False ;
end ;

procedure TFoundUpdateVersion.OnTerminateProcedure(Sender : TObject) ;
begin
  if @proc <> nil
  then
      proc ;
end ;

procedure TFoundUpdateVersion.Execute;
type
  TArrayPInAddr = array [0..10] of PInAddr;
  PArrayPInAddr = ^TArrayPInAddr;

Var Buffer      : array[0..254] of char ;
    WSAData     : TWSADATA ;
    sock        : TSOCKET ;
    sin         : TSOCKADDR ;
    i, j        : Integer ;
    tmp         : String[255] ;
    len         : Integer ;
    phe         : PHostEnt;
    pptr        : PArrayPInAddr;
    AdrIpString : String ;
    donnees     : TMemo ; // On utilise un memo car c'est plus facile, il fait automatiquement les lignes

    function CompString(S1, S2 : String) : Boolean ;
    Var max, i : Integer ;
    begin
        S1 := lowercase(S1);
        S2 := lowercase(S2);

        Result := False ;

        if Length(S1) > Length(S2)
        then
            max := Length(S2)
        else
            max := Length(S1) ;

        for i := 1 to max do
        begin
            Result := true ;

            if S1[i] <> S2[i]
            then begin
                Result := False ;
                break ;
            end ;
        end ;

    end ;
begin
  { Placez le code du thread ici }
    donnees := TMemo.Create(nil) ;
    donnees.Visible := False ;
    donnees.Parent := nil ;
    donnees.WordWrap := false ;

    // Construit la requête à émettre
    tmp := 'GET /quickvirprel/lastdownload.php HTTP/1.0' + #10 ;
    tmp := tmp + 'Accept: */*' + #10 ;
    tmp := tmp + 'Accept-Encoding: deflate' + #10 ;
    tmp := tmp + 'Host: php4php.free.fr' + #10 ;
    tmp := tmp + 'Connection: Close' + #10 + #13 + #10 + #13 ;

    // Initialise le WinSock version 2
    WSAStartup(word(2), WSAData) ;

    // Récupère les informations sur l'adresse
    phe := GetHostByName('php4php.free.fr') ;

    if phe <> nil
    then begin
        // Récupère l'adresse IP
        pptr := PArrayPInAddr(phe^.h_addr_list);
        i := 0;
        AdrIpString := '' ;

        while pptr^[i]<>nil do
        begin
            AdrIpString := StrPas(inet_ntoa(pptr^[i]^));
            Inc(i);
        end;

        // Créer un socket TCP
        sock := socket(AF_INET, SOCK_STREAM, 0) ;

        // Paramètre la connection
        sin.sin_addr.S_addr := inet_addr(PChar(AdrIpString) );
        sin.sin_family := AF_INET ;
        sin.sin_port := htons(80) ;

        // Créer la commande
        for i := 0 to length(tmp) do
        begin
            Buffer[i] := tmp[i + 1] ;
        end ;

        // Se connecte
        connect(sock, sin, sizeof(sin)) ;

        // Envoie la requête
        send(sock, Buffer, length(tmp), 0);

        // Récupère les données
        repeat
            len := recv(sock, Buffer, 255, 0) ;

            tmp := '' ;

            For i := 0 to len - 1 do
                tmp := tmp + Buffer[i] ;

            donnees.Lines.Add(tmp) ;
        until len <= 0 ;

        // ferme le socket
        closesocket(sock);

    end ;

    WSACleanup ;

    // Annalyse les données reçues
    for i := 0 to donnees.Lines.Count - 1 do
    begin
        if CompString('Location:', donnees.Lines[i]) = True
        then begin
            tmp := donnees.Lines[i] ;

            for j := 1 to length(tmp) do
            begin
                if tmp[j] = '/'
                then
                    tmp[j] := '\' ;
            end ;

            tmp := ExtractFileName(tmp) ;
            tmp := tmp[5] + tmp[6] + tmp[7] + tmp[8] + tmp[9] + tmp[10] + tmp[11] ;

            break ;
        end ;
    end ;

    if tmp <> currentVersion
    then begin
        NewVersion := true ;
        currentVersion := tmp ;
    end ;
end;

end.
