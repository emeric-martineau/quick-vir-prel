object CSV: TCSV
  Left = 245
  Top = 171
  BorderStyle = bsToolWindow
  Caption = 'S'#233'parateur de champs'
  ClientHeight = 87
  ClientWidth = 351
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
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 338
    Height = 13
    Caption = 
      'S'#233'lectionnez le caract'#232'res de s'#233'parateur de champs pour le fichi' +
      'er CSV'
  end
  object SeparateurList: TComboBox
    Left = 8
    Top = 24
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 0
    OnChange = SeparateurListChange
    Items.Strings = (
      'Tabulation'
      'Virgule'
      'Point-virgule'
      '#'
      '@'
      'Autre...')
  end
  object OK: TButton
    Left = 8
    Top = 56
    Width = 75
    Height = 25
    Caption = '&OK'
    ModalResult = 1
    TabOrder = 1
  end
  object Separateur: TEdit
    Left = 160
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 2
    Visible = False
  end
  object Button1: TButton
    Left = 272
    Top = 56
    Width = 75
    Height = 25
    Cancel = True
    Caption = '&Annuler'
    ModalResult = 2
    TabOrder = 3
  end
end
