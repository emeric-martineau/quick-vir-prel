object CalculeClefRIB: TCalculeClefRIB
  Left = 292
  Top = 228
  BorderStyle = bsToolWindow
  Caption = 'Calcule de la clef d'#39'un RIB'
  ClientHeight = 70
  ClientWidth = 239
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
  object Label1: TLabel
    Left = 2
    Top = 2
    Width = 96
    Height = 13
    Caption = 'Num'#233'ro du compte :'
    Transparent = True
  end
  object Label2: TLabel
    Left = 2
    Top = 48
    Width = 45
    Height = 13
    Caption = 'Clef RIB :'
    Transparent = True
  end
  object ClefRIB: TLabel
    Left = 56
    Top = 48
    Width = 5
    Height = 13
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object MaskEdit1: TMaskEdit
    Left = 2
    Top = 16
    Width = 151
    Height = 21
    EditMask = '!00000\-00000\->AAAAAAAAAAA<;1;_'
    MaxLength = 23
    TabOrder = 0
    Text = '     -     -           '
    OnChange = MaskEdit1Change
  end
  object Button1: TButton
    Left = 160
    Top = 40
    Width = 75
    Height = 25
    Cancel = True
    Caption = '&Fermer'
    ModalResult = 2
    TabOrder = 1
  end
end
