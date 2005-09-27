object Update: TUpdate
  Left = 198
  Top = 107
  BorderIcons = []
  BorderStyle = bsToolWindow
  Caption = 'Mise '#224' jour'
  ClientHeight = 70
  ClientWidth = 359
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 212
    Height = 13
    Caption = 'Recherche d'#39'une nouvelle version en cous...'
    Transparent = True
  end
  object Button1: TButton
    Left = 280
    Top = 40
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Annuler'
    ModalResult = 2
    TabOrder = 0
    OnClick = Button1Click
  end
end
