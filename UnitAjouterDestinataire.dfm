object AjoutDestinataire: TAjoutDestinataire
  Left = 244
  Top = 153
  BorderStyle = bsDialog
  Caption = 'Ajouter un destinataire'
  ClientHeight = 127
  ClientWidth = 388
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label13: TLabel
    Left = 8
    Top = 8
    Width = 75
    Height = 13
    Caption = 'Raison sociale :'
  end
  object Label6: TLabel
    Left = 8
    Top = 34
    Width = 67
    Height = 13
    Caption = 'Nom banque :'
    Transparent = True
  end
  object Label7: TLabel
    Left = 8
    Top = 56
    Width = 165
    Height = 13
    Caption = 'RIB (banque-guichet-compte-clef) :'
    Transparent = True
  end
  object Destinataire_RaisonSociale: TEdit
    Left = 144
    Top = 5
    Width = 239
    Height = 21
    TabOrder = 0
    OnChange = Destinataire_RaisonSocialeChange
    OnKeyPress = Destinataire_RaisonSocialeKeyPress
  end
  object Destinataire_Banque: TEdit
    Left = 144
    Top = 29
    Width = 119
    Height = 21
    TabOrder = 1
    OnKeyPress = Destinataire_RaisonSocialeKeyPress
  end
  object Destinataire_RIB: TMaskEdit
    Left = 8
    Top = 72
    Width = 189
    Height = 21
    EditMask = '!00000\-00000\->AAAAAAAAAAA<\-00;1;_'
    MaxLength = 26
    TabOrder = 2
    Text = '     -     -           -  '
  end
  object ajouter: TButton
    Left = 8
    Top = 99
    Width = 81
    Height = 25
    Caption = 'Ajouter'
    Default = True
    TabOrder = 3
    OnClick = ajouterClick
  end
  object Button1: TButton
    Left = 304
    Top = 96
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Annuler'
    ModalResult = 2
    TabOrder = 4
  end
end
