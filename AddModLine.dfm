object AjouterModifierLigne: TAjouterModifierLigne
  Left = 347
  Top = 184
  BorderStyle = bsDialog
  Caption = 'Ligne'
  ClientHeight = 218
  ClientWidth = 387
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label13: TLabel
    Left = 8
    Top = 8
    Width = 75
    Height = 13
    Caption = 'Raison sociale :'
  end
  object Label14: TLabel
    Left = 8
    Top = 40
    Width = 111
    Height = 13
    Caption = 'Montant de l'#39'op'#233'ration :'
  end
  object Label6: TLabel
    Left = 8
    Top = 66
    Width = 67
    Height = 13
    Caption = 'Nom banque :'
    Transparent = True
  end
  object Label15: TLabel
    Left = 8
    Top = 88
    Width = 56
    Height = 13
    Caption = 'R'#233'f'#233'rence :'
  end
  object Label21: TLabel
    Left = 8
    Top = 112
    Width = 36
    Height = 13
    Caption = 'Libell'#233' :'
  end
  object Label7: TLabel
    Left = 8
    Top = 136
    Width = 165
    Height = 13
    Caption = 'RIB (banque-guichet-compte-clef) :'
    Transparent = True
  end
  object Destinataire_RaisonSociale: TEdit
    Left = 144
    Top = 5
    Width = 240
    Height = 21
    TabOrder = 0
    OnChange = Destinataire_RaisonSocialeChange
    OnKeyPress = Destinataire_RaisonSocialeKeyPress
  end
  object Destinataire_Montant: TEdit
    Left = 144
    Top = 37
    Width = 120
    Height = 21
    TabOrder = 1
    OnKeyPress = Destinataire_MontantKeyPress
  end
  object Destinataire_Banque: TEdit
    Left = 144
    Top = 61
    Width = 120
    Height = 21
    TabOrder = 2
    OnChange = Destinataire_RaisonSocialeChange
    OnKeyPress = Destinataire_RaisonSocialeKeyPress
  end
  object Destinataire_Reference: TEdit
    Left = 144
    Top = 85
    Width = 200
    Height = 21
    TabOrder = 3
    OnChange = Destinataire_RaisonSocialeChange
    OnKeyPress = Destinataire_RaisonSocialeKeyPress
  end
  object Destinataire_Libelle: TEdit
    Left = 144
    Top = 109
    Width = 200
    Height = 21
    TabOrder = 4
    OnChange = Destinataire_RaisonSocialeChange
    OnKeyPress = Destinataire_RaisonSocialeKeyPress
  end
  object Destinataire_RIB: TMaskEdit
    Left = 8
    Top = 152
    Width = 189
    Height = 21
    EditMask = '!00000\-00000\->AAAAAAAAAAA<\-00;1;_'
    MaxLength = 26
    TabOrder = 5
    Text = '     -     -           -  '
  end
  object ajouter: TButton
    Left = 8
    Top = 187
    Width = 113
    Height = 25
    Caption = 'Ajouter l'#39'op'#233'ration'
    Default = True
    TabOrder = 6
    OnClick = ajouterClick
  end
  object Button1: TButton
    Left = 304
    Top = 184
    Width = 75
    Height = 25
    Caption = 'Annuler'
    ModalResult = 2
    TabOrder = 7
  end
  object ChargerDestinataireBouton: TButton
    Left = 144
    Top = 187
    Width = 137
    Height = 25
    Caption = 'Charger un destinataire'
    TabOrder = 8
    OnClick = ChargerDestinataireBoutonClick
  end
end
