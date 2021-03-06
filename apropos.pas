{*******************************************************************************
 * Copyright MARTINEAU Emeric. Tous droits r?serv?.
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
  Dialogs, StdCtrls, ExtCtrls, ShellAPI, jpeg;

type
  TFeuilleApropos = class(TForm)
    Shape1: TShape;
    OK: TButton;
    Label7: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure Label7Click(Sender: TObject);
  private
    { D?clarations priv?es }
  public
    { D?clarations publiques }
  end;

var
  FeuilleApropos: TFeuilleApropos;

implementation

uses Unit1;

{$R *.dfm}

procedure TFeuilleApropos.FormCreate(Sender: TObject);
begin
    Label1.Caption := Label1.Caption + Form1.GetVersionProgram ;
end;

procedure TFeuilleApropos.Label7Click(Sender: TObject);
begin
    Form1.VisiterlesiteWebdeQuickVirPrel1Click(Sender) ;
end;

end.
