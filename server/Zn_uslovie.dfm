object fr_uslovie_zn: Tfr_uslovie_zn
  Left = 754
  Top = 186
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'УСЛОВИЕ'
  ClientHeight = 353
  ClientWidth = 255
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 255
    Height = 309
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 253
      Height = 20
      Align = alTop
      Caption = 'Выбирите вариант условия (знака)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object rg_znak: TRadioGroup
      Left = 34
      Top = 32
      Width = 187
      Height = 261
      ItemIndex = 5
      Items.Strings = (
        'Больше >'
        'Меньше <'
        'Больше или равно >='
        'Меньше или равно <='
        'Неравно <>'
        'Равно ='
        'Примерно ~ (для строк)'
        'Между вкл.'
        'Между не вкл.')
      TabOrder = 1
    end
  end
  object Button1: TButton
    Left = 96
    Top = 320
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Выбрать'
    Default = True
    TabOrder = 1
    OnClick = Button1Click
  end
end
