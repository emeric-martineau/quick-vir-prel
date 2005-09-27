object Licence: TLicence
  Left = 330
  Top = 126
  Width = 431
  Height = 480
  Caption = 'Licence'
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
  object RichEdit1: TRichEdit
    Left = 0
    Top = 0
    Width = 423
    Height = 419
    Align = alClient
    Ctl3D = True
    Lines.Strings = (
      'Impossible de charger le fichier de licence.'
      
        'V'#233'rifier que le fichier LICENCE.RTF est bien dans le r'#233'pertoire ' +
        'd'#39'installation.'
      'Sinon, vous pouvez lire la licence directement sur le site.')
    ParentCtl3D = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
    OnKeyDown = RichEdit1KeyDown
  end
  object Panel1: TPanel
    Left = 0
    Top = 419
    Width = 423
    Height = 27
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object Fermer: TButton
      Left = 0
      Top = 1
      Width = 75
      Height = 25
      Cancel = True
      Caption = 'Fermer'
      ModalResult = 1
      TabOrder = 0
    end
  end
end
