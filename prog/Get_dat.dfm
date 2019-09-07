object fr_get_dat: Tfr_get_dat
  Left = 634
  Top = 549
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'fr_get_dat'
  ClientHeight = 117
  ClientWidth = 342
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 342
    Height = 77
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 340
      Height = 20
      Align = alTop
      Caption = 'Введите дату'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object ed_dat: TDateEdit
      Left = 56
      Top = 36
      Width = 235
      Height = 27
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 1
    end
  end
  object bt_save: TBitBtn
    Left = 10
    Top = 88
    Width = 109
    Height = 25
    Caption = 'Сохранить'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = bt_saveClick
  end
  object bt_exit: TBitBtn
    Left = 242
    Top = 88
    Width = 91
    Height = 25
    Caption = 'Отменить'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = bt_exitClick
  end
end
