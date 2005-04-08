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
unit apropos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ShellAPI;

type
  TFeuilleApropos = class(TForm)
    OK: TButton;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Label7Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FeuilleApropos: TFeuilleApropos;

implementation

{$R *.dfm}

procedure TFeuilleApropos.FormCreate(Sender: TObject);
var
  Handle   : DWord;
  Info     : Pointer;
  InfoData : Pointer;
  InfoSize : LongInt;
  DataLen  : UInt;
  LangPtr  : Pointer;
  InfoType : string;
  i        : integer;
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
                    Label1.Caption := Label1.Caption + strPas(InfoData) ;
            end ;
        finally
            FreeMem(Info, InfoSize);
        end;
    end ;
end;

procedure TFeuilleApropos.Label7Click(Sender: TObject);
begin
    ShellExecute(Handle, 'OPEN', PChar(TLabel(Sender).Caption),'','',SW_SHOWNORMAL);
end;

end.
