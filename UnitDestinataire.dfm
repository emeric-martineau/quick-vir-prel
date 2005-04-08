object Destinataire: TDestinataire
  Left = 318
  Top = 135
  Width = 338
  Height = 352
  Caption = 'Destinataire'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 292
    Width = 330
    Height = 26
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object Ajouter: TButton
      Left = 0
      Top = 1
      Width = 75
      Height = 25
      Caption = 'Ajouter'
      TabOrder = 1
      OnClick = AjouterClick
    end
    object Modifier: TButton
      Left = 80
      Top = 1
      Width = 75
      Height = 25
      Caption = 'Modifier'
      Enabled = False
      TabOrder = 2
      OnClick = ModifierClick
    end
    object Supprimer: TButton
      Left = 160
      Top = 1
      Width = 75
      Height = 25
      Caption = 'Supprimer'
      Enabled = False
      TabOrder = 3
      OnClick = SupprimerClick
    end
    object Fermer: TButton
      Left = 256
      Top = 1
      Width = 75
      Height = 25
      Caption = 'Fermer'
      Default = True
      ModalResult = 2
      TabOrder = 0
    end
  end
  object Destinataire_ListView1: TListView
    Left = 0
    Top = 0
    Width = 330
    Height = 292
    Align = alClient
    Columns = <
      item
        Caption = 'Raison social'
        Width = 75
      end
      item
        Caption = 'Banque'
      end
      item
        Caption = 'RIB'
        Width = 100
      end>
    HideSelection = False
    MultiSelect = True
    ReadOnly = True
    TabOrder = 1
    ViewStyle = vsReport
    OnClick = Destinataire_ListView1Enter
    OnColumnClick = Destinataire_ListView1ColumnClick
    OnDblClick = ModifierClick
    OnEnter = Destinataire_ListView1Enter
    OnExit = Destinataire_ListView1Enter
    OnKeyDown = Destinataire_ListView1KeyDown
  end
end
