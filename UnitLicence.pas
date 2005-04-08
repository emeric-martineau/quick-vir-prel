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
unit UnitLicence;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls;

type
  TLicence = class(TForm)
    RichEdit1: TRichEdit;
    Panel1: TPanel;
    Fermer: TButton;
    procedure FormCreate(Sender: TObject);
    procedure RichEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Licence: TLicence;

implementation

{$R *.dfm}

procedure TLicence.FormCreate(Sender: TObject);
begin
    RichEdit1.Lines.LoadFromFile(ExtractFileDir(Application.ExeName) + '\licence.rtf');
end;

procedure TLicence.RichEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (ssShift in Shift) and (ssAlt in Shift) and (ssCtrl in Shift)
    then begin
        RichEdit1.Lines.Clear ;
        RichEdit1.Font.Color := clBlack ;
        RichEdit1.Font.Style := [] ;        
        RichEdit1.Lines.Add('QuickVirprel sur une idée de Michel MARTINEAU');
        RichEdit1.Lines.Add('Développeur : Emeric MARTINEAU');
        RichEdit1.Lines.Add('') ;
        RichEdit1.Lines.Add('Remerciements à tous les gens qui partagent leurs connaissances à travers les sites Internet comme :') ;
        RichEdit1.Lines.Add('Developper.net') ;
        RichEdit1.Lines.Add('Delphifr.com, CodeSource.fr, cppfrance.com') ;
        RichEdit1.Lines.Add('sheep-team.org') ;
        RichEdit1.Lines.Add('guill.net') ;
        RichEdit1.Lines.Add('') ;
        RichEdit1.Lines.Add('Pourquoi ce logiciel n''est pas en GPL ?') ;
        RichEdit1.Lines.Add('Parce que pour une fois je n''en n''avais pas envie.') ;
    end ;
end;

end.
