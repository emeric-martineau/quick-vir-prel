object Configuration: TConfiguration
  Left = 358
  Top = 261
  BorderStyle = bsDialog
  Caption = 'Configuration'
  ClientHeight = 269
  ClientWidth = 396
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 8
    Top = 240
    Width = 75
    Height = 25
    Caption = '&OK'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 320
    Top = 240
    Width = 75
    Height = 25
    Cancel = True
    Caption = '&Annuler'
    ModalResult = 2
    TabOrder = 1
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 393
    Height = 233
    ActivePage = TabSheet1
    TabIndex = 0
    TabOrder = 2
    object TabSheet1: TTabSheet
      Caption = 'G'#233'n'#233'ral'
      object Label1: TLabel
        Left = 8
        Top = 20
        Width = 147
        Height = 13
        Caption = 'Lorsqu'#39'on enregistre un fichier :'
        Transparent = True
      end
      object Label2: TLabel
        Left = 8
        Top = 115
        Width = 191
        Height = 13
        Caption = 'Nombre de fichiers r'#233'cents '#224' m'#233'moriser :'
        Transparent = True
      end
      object ImpressionEnregistrement: TComboBox
        Left = 160
        Top = 16
        Width = 225
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 1
        TabOrder = 0
        Text = 'Demander si on souhaite imprimer le fichier'
        Items.Strings = (
          'Imprimer le fichier'
          'Demander si on souhaite imprimer le fichier'
          'Ne pas imprimer le fichier')
      end
      object CheckEmetteurStart: TCheckBox
        Left = 8
        Top = 48
        Width = 209
        Height = 17
        Caption = 'V'#233'rifier pr'#233'sence d'#39#233'metteurs configur'#233's'
        Checked = True
        State = cbChecked
        TabOrder = 1
      end
      object DisabledRIB: TCheckBox
        Left = 8
        Top = 80
        Width = 161
        Height = 17
        Caption = 'D'#233'sactiver v'#233'rification du RIB'
        TabOrder = 2
      end
      object NbRecentFileConfig: TEdit
        Left = 200
        Top = 112
        Width = 25
        Height = 21
        TabOrder = 3
        Text = '5'
      end
      object UpDown1: TUpDown
        Left = 225
        Top = 112
        Width = 15
        Height = 21
        Associate = NbRecentFileConfig
        Min = 0
        Position = 5
        TabOrder = 4
        Wrap = False
      end
      object ResetRecentFile: TButton
        Left = 251
        Top = 110
        Width = 102
        Height = 25
        Caption = 'R'#233'initialiser la liste'
        TabOrder = 5
        OnClick = ResetRecentFileClick
      end
      object ResetConfig: TButton
        Left = 96
        Top = 170
        Width = 193
        Height = 25
        Caption = 'R'#233'initialiser configuration par d'#233'faut'
        TabOrder = 6
        OnClick = ResetConfigClick
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Affichage'
      ImageIndex = 1
      object GridLines: TCheckBox
        Left = 8
        Top = 20
        Width = 97
        Height = 17
        Caption = 'Afficher la grille'
        TabOrder = 0
      end
      object Flat: TCheckBox
        Left = 8
        Top = 48
        Width = 169
        Height = 17
        Caption = 'Boutons de la barre d'#39'outils plat'
        Checked = True
        State = cbChecked
        TabOrder = 1
      end
      object ShowCaption: TCheckBox
        Left = 8
        Top = 80
        Width = 233
        Height = 17
        Caption = 'Afficher texte des boutons de la barre d'#39'outils'
        TabOrder = 2
        OnClick = ShowCaptionClick
      end
      object List: TCheckBox
        Left = 24
        Top = 96
        Width = 257
        Height = 17
        Caption = 'Aligner les libell'#233's '#224' droite et les images '#224' gauche'
        Enabled = False
        TabOrder = 3
      end
      object HotTrack: TCheckBox
        Left = 8
        Top = 124
        Width = 353
        Height = 17
        Caption = 
          'Surligner les '#233'l'#233'ment de la liste sous la souris et s'#233'lection au' +
          'tomatique'
        TabOrder = 4
        OnClick = HotTrackClick
      end
      object HandPoint: TCheckBox
        Left = 24
        Top = 140
        Width = 177
        Height = 17
        Caption = 'Remplacer curseur par une main'
        Enabled = False
        TabOrder = 5
      end
      object UnderlineCold: TCheckBox
        Left = 24
        Top = 156
        Width = 137
        Height = 17
        Caption = 'Souligner si s'#233'lectionn'#233
        Enabled = False
        TabOrder = 6
      end
      object UnderlineHot: TCheckBox
        Left = 24
        Top = 172
        Width = 233
        Height = 17
        Caption = 'Souligner '#233'l'#233'ment courant dans la s'#233'lection'
        Enabled = False
        TabOrder = 7
      end
    end
  end
end
