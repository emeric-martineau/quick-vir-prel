object Form1: TForm1
  Left = 198
  Top = 114
  Width = 640
  Height = 614
  Caption = 'QuickVirPrel'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 632
    Height = 233
    Align = alTop
    Caption = ' Emetteur : '
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 24
      Width = 75
      Height = 13
      Caption = 'Raison sociale :'
    end
    object Label9: TLabel
      Left = 8
      Top = 180
      Width = 116
      Height = 13
      Caption = 'R'#233'f'#233'rence de l'#39#233'misson :'
    end
    object Label10: TLabel
      Left = 8
      Top = 205
      Width = 154
      Height = 13
      Caption = 'Date de pr'#233'sentation souhait'#233'e :'
    end
    object Label11: TLabel
      Left = 203
      Top = 205
      Width = 7
      Height = 13
      Caption = '/'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label12: TLabel
      Left = 315
      Top = 205
      Width = 7
      Height = 13
      Caption = '/'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Emetteur_RaisonSociale: TEdit
      Left = 88
      Top = 21
      Width = 241
      Height = 21
      TabOrder = 0
      Text = 'Emetteur_RaisonSociale'
      OnKeyPress = Emetteur_RaisonSocialeKeyPress
    end
    object GroupBox3: TGroupBox
      Left = 8
      Top = 48
      Width = 537
      Height = 121
      Caption = ' RIB : '
      TabOrder = 1
      object Label2: TLabel
        Left = 8
        Top = 24
        Width = 124
        Height = 13
        Caption = 'N'#176' Emetteur pr'#233'l'#233'vement :'
        Transparent = True
      end
      object Label3: TLabel
        Left = 8
        Top = 48
        Width = 106
        Height = 13
        Caption = 'N'#176' Emetteur virement :'
        Transparent = True
      end
      object Label4: TLabel
        Left = 8
        Top = 74
        Width = 67
        Height = 13
        Caption = 'Nom banque :'
        Transparent = True
      end
      object Label5: TLabel
        Left = 272
        Top = 24
        Width = 165
        Height = 13
        Caption = 'RIB (banque-guichet-compte-clef) :'
        Transparent = True
      end
      object Emetteur_Banque: TEdit
        Left = 144
        Top = 69
        Width = 121
        Height = 21
        TabOrder = 0
        Text = 'Emetteur_Banque'
        OnKeyPress = Emetteur_RaisonSocialeKeyPress
      end
      object SouvenirEmetteur: TCheckBox
        Left = 8
        Top = 96
        Width = 225
        Height = 17
        Caption = 'Se souvenir des informations de l'#39#233'metteur'
        TabOrder = 1
        OnClick = SouvenirEmetteurClick
      end
      object Emetteur_RIB: TMaskEdit
        Left = 272
        Top = 40
        Width = 189
        Height = 21
        EditMask = '!00000\-00000\->AAAAAAAAAAA<\-00;1;_'
        MaxLength = 26
        TabOrder = 2
        Text = '     -     -           -  '
      end
      object Emetteur_NumPrelevement: TMaskEdit
        Left = 144
        Top = 21
        Width = 118
        Height = 21
        EditMask = '000000;1; '
        MaxLength = 6
        TabOrder = 3
        Text = '      '
      end
      object Emetteur_NumVirement: TMaskEdit
        Left = 144
        Top = 45
        Width = 120
        Height = 21
        EditMask = '000000;1; '
        MaxLength = 6
        TabOrder = 4
        Text = '      '
      end
    end
    object RefferenceEmission: TEdit
      Left = 126
      Top = 177
      Width = 121
      Height = 21
      TabOrder = 2
      OnKeyPress = Emetteur_RaisonSocialeKeyPress
    end
    object ComboBox1: TComboBox
      Left = 160
      Top = 201
      Width = 41
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 3
      Text = '01'
      Items.Strings = (
        '01'
        '02'
        '03'
        '04'
        '05'
        '06'
        '07'
        '08'
        '09'
        '10'
        '11'
        '12'
        '13'
        '14'
        '15'
        '16'
        '17'
        '18'
        '19'
        '20'
        '21'
        '22'
        '23'
        '24'
        '25'
        '26'
        '27'
        '28'
        '29'
        '30'
        '31')
    end
    object ComboBox2: TComboBox
      Left = 212
      Top = 201
      Width = 101
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 4
      Text = 'Janvier (01)'
      OnChange = ComboBox2Change
      Items.Strings = (
        'Janvier (01)'
        'F'#233'vrier (02)'
        'Mars (03)'
        'Avril (04)'
        'Mai (05)'
        'Juin (06)'
        'Juillet (07)'
        'Ao'#251't (08)'
        'Septembre (09)'
        'Octobre (10)'
        'Novembre (11)'
        'D'#233'cembre (12)')
    end
    object ComboBox3: TComboBox
      Left = 324
      Top = 201
      Width = 77
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 5
      OnChange = ComboBox2Change
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 407
    Width = 632
    Height = 153
    Align = alBottom
    Caption = ' Destinataire : '
    TabOrder = 1
    object Label13: TLabel
      Left = 8
      Top = 24
      Width = 75
      Height = 13
      Caption = 'Raison sociale :'
    end
    object Label14: TLabel
      Left = 8
      Top = 56
      Width = 111
      Height = 13
      Caption = 'Montant de l'#39'op'#233'ration :'
    end
    object Label15: TLabel
      Left = 8
      Top = 104
      Width = 56
      Height = 13
      Caption = 'R'#233'f'#233'rence :'
    end
    object Label21: TLabel
      Left = 8
      Top = 128
      Width = 36
      Height = 13
      Caption = 'Libell'#233' :'
    end
    object Label6: TLabel
      Left = 8
      Top = 82
      Width = 67
      Height = 13
      Caption = 'Nom banque :'
      Transparent = True
    end
    object Label7: TLabel
      Left = 352
      Top = 56
      Width = 165
      Height = 13
      Caption = 'RIB (banque-guichet-compte-clef) :'
      Transparent = True
    end
    object ajouter: TButton
      Left = 432
      Top = 123
      Width = 113
      Height = 25
      Caption = 'Ajouter l'#39'op'#233'ration'
      TabOrder = 0
      OnClick = ajouterClick
    end
    object Destinataire_RaisonSociale: TEdit
      Left = 88
      Top = 21
      Width = 241
      Height = 21
      TabOrder = 1
      Text = 'Destinataire_RaisonSociale'
      OnKeyPress = Emetteur_RaisonSocialeKeyPress
    end
    object Destinataire_Montant: TEdit
      Left = 144
      Top = 53
      Width = 121
      Height = 21
      TabOrder = 2
      Text = 'Destinataire_Montant'
      OnKeyPress = Destinataire_MontantKeyPress
    end
    object Destinataire_Reference: TEdit
      Left = 144
      Top = 101
      Width = 201
      Height = 21
      TabOrder = 3
      Text = 'Destinataire_Reference'
      OnKeyPress = Emetteur_RaisonSocialeKeyPress
    end
    object Destinataire_Libelle: TEdit
      Left = 144
      Top = 125
      Width = 201
      Height = 21
      TabOrder = 4
      Text = 'Destinataire_Libelle'
      OnKeyPress = Emetteur_RaisonSocialeKeyPress
    end
    object Destinataire_Banque: TEdit
      Left = 144
      Top = 77
      Width = 121
      Height = 21
      TabOrder = 5
      Text = 'Destinataire_Banque'
      OnKeyPress = Emetteur_RaisonSocialeKeyPress
    end
    object Destinataire_RIB: TMaskEdit
      Left = 352
      Top = 72
      Width = 189
      Height = 21
      EditMask = '!00000\-00000\->AAAAAAAAAAA<\-00;1;_'
      MaxLength = 26
      TabOrder = 6
      Text = '     -     -           -  '
    end
  end
  object ListView1: TListView
    Left = 0
    Top = 233
    Width = 632
    Height = 174
    Align = alClient
    Columns = <
      item
        Caption = 'Raison social du destinataire'
        Width = 150
      end
      item
        Caption = 'RIB'
        Width = 150
      end
      item
        Caption = 'Banque destinataire'
        Width = 100
      end
      item
        Caption = 'Montant'
        Width = 100
      end
      item
        Caption = 'R'#233'f'#233'rence'
        Width = 150
      end
      item
        Caption = 'Lib'#233'll'#233
        Width = 150
      end>
    Items.Data = {
      530000000100000000000000FFFFFFFFFFFFFFFF050000000000000008666768
      6668666768066466676766680635343634353607686A6B686A6B680635362B37
      383906747975757969FFFFFFFFFFFFFFFFFFFF}
    MultiSelect = True
    ReadOnly = True
    RowSelect = True
    TabOrder = 2
    ViewStyle = vsReport
  end
  object MainMenu1: TMainMenu
    Left = 304
    Top = 296
    object Fichier1: TMenuItem
      Caption = '&Fichier'
      object Nouveau1: TMenuItem
        Caption = '&Nouveau'
        ShortCut = 16462
        OnClick = Nouveau1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Enregistrerprlvement1: TMenuItem
        Caption = 'Enregistrer &pr'#233'l'#232'vement'
        ShortCut = 16464
        OnClick = Enregistrerprlvement1Click
      end
      object Enregistrerprlvementacclr1: TMenuItem
        Caption = 'Enregistrer pr'#233'l'#232'vement &acc'#233'l'#233'r'#233
        ShortCut = 16449
        OnClick = Enregistrerprlvementacclr1Click
      end
      object Enregistrervirement1: TMenuItem
        Caption = 'Enregistrer &virement'
        OnClick = Enregistrervirement1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Quitter1: TMenuItem
        Caption = '&Quitter'
        OnClick = Quitter1Click
      end
    end
    object Lignes1: TMenuItem
      Caption = '&Lignes'
      OnClick = Lignes1Click
      object Supprimer1: TMenuItem
        Caption = '&Supprimer'
        ShortCut = 16467
        OnClick = Supprimer1Click
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object outslectionner1: TMenuItem
        Caption = '&Tout s'#233'lectionner'
        OnClick = outslectionner1Click
      end
      object Inverserlaslection1: TMenuItem
        Caption = '&Inverser la s'#233'lection'
        OnClick = Inverserlaslection1Click
      end
    end
    object Divres1: TMenuItem
      Caption = '&Divers'
      object Effacerlesinformationsinscritentdanslabasederegistre1: TMenuItem
        Caption = 'Effacer les informations m'#233'moris'#233'es de l'#39#233'metteur'
        OnClick = Effacerlesinformationsinscritentdanslabasederegistre1Click
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object Aproposde1: TMenuItem
        Caption = '&A propos de...'
        OnClick = Aproposde1Click
      end
    end
  end
  object SaveDialog1: TSaveDialog
    Filter = 'Fichier texte|*.txt'
    Left = 224
    Top = 288
  end
end
