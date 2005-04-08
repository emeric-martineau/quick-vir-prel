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
unit UnitUpDate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, UnitUpdateThread ;

type
  TUpdate = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
    procedure Fin ;
  end;

var
  Update: TUpdate;
  FoundUpdateVersion : TFoundUpdateVersion ;
implementation

uses Unit1;

{$R *.dfm}

procedure TUpdate.Button1Click(Sender: TObject);
begin
    Close ;
end;

procedure TUpdate.Fin ;
begin
    if FoundUpdateVersion.NewVersion
    then begin
        Label1.Caption := 'Une nouvelle version est disponible' ;
        Button1.Caption := 'OK' ;
    end ;
end ;

procedure TUpdate.FormShow(Sender: TObject);
begin
    FoundUpdateVersion := TFoundUpdateVersion.Create(True) ;
    FoundUpdateVersion.currentVersion := Form1.GetVersionProgram ;
    FoundUpdateVersion.proc := Fin ;
    FoundUpdateVersion.Suspended := False ;
end;

end.
