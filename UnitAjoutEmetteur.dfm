object AjoutEmetteur: TAjoutEmetteur
  Left = 364
  Top = 227
  BorderStyle = bsDialog
  Caption = 'Ajout d'#39'un '#233'metteur'
  ClientHeight = 167
  ClientWidth = 380
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 75
    Height = 13
    Caption = 'Raison sociale :'
  end
  object Label2: TLabel
    Left = 8
    Top = 32
    Width = 124
    Height = 13
    Caption = 'N'#176' Emetteur pr'#233'l'#233'vement :'
    Transparent = True
  end
  object Label3: TLabel
    Left = 8
    Top = 56
    Width = 106
    Height = 13
    Caption = 'N'#176' Emetteur virement :'
    Transparent = True
  end
  object Label4: TLabel
    Left = 8
    Top = 82
    Width = 67
    Height = 13
    Caption = 'Nom banque :'
    Transparent = True
  end
  object Label5: TLabel
    Left = 7
    Top = 104
    Width = 27
    Height = 13
    Caption = 'RIB  :'
    Transparent = True
  end
  object Emetteur_RaisonSociale: TEdit
    Left = 136
    Top = 5
    Width = 233
    Height = 21
    TabOrder = 0
    OnChange = Emetteur_RaisonSocialeChange
    OnKeyPress = Emetteur_BanqueKeyPress
  end
  object Emetteur_NumPrelevement: TMaskEdit
    Left = 136
    Top = 29
    Width = 116
    Height = 21
    EditMask = '000000;1; '
    MaxLength = 6
    TabOrder = 1
    Text = '      '
  end
  object Emetteur_NumVirement: TMaskEdit
    Left = 136
    Top = 53
    Width = 119
    Height = 21
    EditMask = '000000;1; '
    MaxLength = 6
    TabOrder = 2
    Text = '      '
  end
  object Emetteur_Banque: TEdit
    Left = 136
    Top = 77
    Width = 233
    Height = 21
    TabOrder = 3
    OnKeyPress = Emetteur_BanqueKeyPress
  end
  object Emetteur_RIB: TMaskEdit
    Left = 135
    Top = 104
    Width = 187
    Height = 21
    EditMask = '!00000\-00000\->AAAAAAAAAAA\-AA;1;_'
    MaxLength = 26
    TabOrder = 4
    Text = '     -     -           -  '
  end
  object Button1: TButton
    Left = 8
    Top = 136
    Width = 75
    Height = 25
    Caption = 'Enregistrer'
    Default = True
    TabOrder = 5
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 296
    Top = 136
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Annuler'
    ModalResult = 2
    TabOrder = 6
  end
end
