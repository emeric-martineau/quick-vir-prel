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
unit UnitCalculeClefRIB;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask;

type
  TCalculeClefRIB = class(TForm)
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    Button1: TButton;
    Label2: TLabel;
    ClefRIB: TLabel;
    procedure MaskEdit1Change(Sender: TObject);
  private
    { D?clarations priv?es }
  public
    { D?clarations publiques }
  end;

var
  CalculeClefRIB: TCalculeClefRIB;

implementation

uses Unit1;

{$R *.dfm}

procedure TCalculeClefRIB.MaskEdit1Change(Sender: TObject);
begin
    ClefRIB.Caption :=  IntToStr(Form1.CalculerClefRIB(TEdit(Sender).Text)) ;
end;

end.
