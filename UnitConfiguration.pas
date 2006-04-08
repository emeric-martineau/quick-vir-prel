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
unit UnitConfiguration;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Registry;

type
  TConfiguration = class(TForm)
    Button1: TButton;
    Button2: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    ImpressionEnregistrement: TComboBox;
    CheckEmetteurStart: TCheckBox;
    DisabledRIB: TCheckBox;
    Label2: TLabel;
    NbRecentFileConfig: TEdit;
    UpDown1: TUpDown;
    ResetRecentFile: TButton;
    GridLines: TCheckBox;
    Flat: TCheckBox;
    ShowCaption: TCheckBox;
    List: TCheckBox;
    HotTrack: TCheckBox;
    HandPoint: TCheckBox;
    UnderlineCold: TCheckBox;
    UnderlineHot: TCheckBox;
    ResetConfig: TButton;
    AddEuroOnEachLigne: TCheckBox;
    procedure ShowCaptionClick(Sender: TObject);
    procedure HotTrackClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ResetRecentFileClick(Sender: TObject);
    procedure ResetConfigClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Configuration: TConfiguration;

implementation

{$R *.dfm}

uses
    Unit1 ;

procedure TConfiguration.ShowCaptionClick(Sender: TObject);
begin
    List.Enabled := ShowCaption.Checked ;

    if ((not ShowCaption.Checked) and Form1.ToolBar1.ShowCaptions)
    then
        Application.MessageBox('Pour que les boutons reprennent leurs tailles d''origines, il faut redémarrer l''application.','Attention', MB_OK + MB_ICONWARNING)
end;

procedure TConfiguration.HotTrackClick(Sender: TObject);
begin
    HandPoint.Enabled := HotTrack.Checked ;
    UnderlineCold.Enabled := HotTrack.Checked ;
    UnderlineHot.Enabled := HotTrack.Checked ;
end;

procedure TConfiguration.Button1Click(Sender: TObject);
Var Registre : TRegistry ;
begin
    Registre := TRegistry.Create ;

    try
        Registre.RootKey := HKEY_CURRENT_USER ;
        Registre.OpenKey(CHEMIN_REGISTRE + '\config', True) ;

        Registre.WriteInteger('PrintFileWhenSave', ImpressionEnregistrement.ItemIndex) ;

        Registre.WriteBool('CheckEmetteurStart', CheckEmetteurStart.Checked);

        Registre.WriteBool('DisabledRIBChek', DisabledRIB.Checked);

        Registre.WriteBool('ShowGridLines', GridLines.Checked);

        Registre.WriteBool('ToolBarButtonFlat', Flat.Checked) ;

        Registre.WriteBool('ToolBarShowCaption', ShowCaption.Checked) ;

        Registre.WriteBool('ToolBarList', List.Checked) ;

        Registre.WriteBool('HotTrack', HotTrack.Checked) ;

        Registre.WriteBool('HandPoint', HandPoint.Checked) ;

        Registre.WriteBool('UnderLineCold', UnderLineCold.Checked) ;

        Registre.WriteBool('UnderLineHot', UnderLineHot.Checked) ;

        Registre.WriteBool('AddEuroOnEachLigne', AddEuroOnEachLigne.Checked) ;

        Registre.CloseKey ;
    finally
        Registre.Free ;
    end ;

    Form1.RecentFiles.SetMaxNumberFiles(StrToInt(NbRecentFileConfig.Text)) ;

    Close ;
end;

procedure TConfiguration.FormCreate(Sender: TObject);
Var Registre : TRegistry ;
begin
    Registre := TRegistry.Create ;

    try
        Registre.RootKey := HKEY_CURRENT_USER ;
        Registre.OpenKey(CHEMIN_REGISTRE + '\config', True) ;

        if Registre.ValueExists('PrintFileWhenSave')
        then
            ImpressionEnregistrement.ItemIndex := Registre.ReadInteger('PrintFileWhenSave') ;

        if Registre.ValueExists('CheckEmetteurStart')
        then
            CheckEmetteurStart.Checked := Registre.ReadBool('CheckEmetteurStart');

        if Registre.ValueExists('DisabledRIBChek')
        then
            DisabledRIB.Checked := Registre.ReadBool('DisabledRIBChek') ;

        if Registre.ValueExists('ShowGridLines')
        then
            GridLines.Checked := Registre.ReadBool('ShowGridLines');

        if Registre.ValueExists('ToolBarButtonFlat')
        then
            Flat.Checked := Registre.ReadBool('ToolBarButtonFlat') ;

        if Registre.ValueExists('ToolBarShowCaption')
        then
            ShowCaption.Checked := Registre.ReadBool('ToolBarShowCaption') ;

        if Registre.ValueExists('ToolBarList')
        then
            List.Checked := Registre.ReadBool('ToolBarList') ;

        if Registre.ValueExists('HotTrack')
        then
            HotTrack.Checked := Registre.ReadBool('HotTrack') ;

        if Registre.ValueExists('HotPoint')
        then
            HandPoint.Checked := Registre.ReadBool('HandPoint') ;

        if Registre.ValueExists('UnderLineCold')
        then
            UnderLineCold.Checked := Registre.ReadBool('UnderLineCold') ;

        if Registre.ValueExists('UnderLineHot')
        then
            UnderLineHot.Checked := Registre.ReadBool('UnderLineHot') ;

        if Registre.ValueExists('UnderLineHot')
        then
            AddEuroOnEachLigne.Checked := Registre.ReadBool('AddEuroOnEachLigne') ;

        Registre.CloseKey ;
    finally
        Registre.Free ;
    end ;

    UpDown1.Position := Form1.RecentFiles.GetMaxNumberFiles ;
end;

procedure TConfiguration.ResetRecentFileClick(Sender: TObject);
begin
    if Application.MessageBox('Êtes-vous sûr de vouloir effacer la liste des fichiers récents ?', 'Question', MB_YESNO + MB_ICONQUESTION) = IDYES
    then
        Form1.RecentFiles.ClearList ;
end;

procedure TConfiguration.ResetConfigClick(Sender: TObject);
begin
    Form1.ResetConfig ;
end;

end.
