object fr_get_list_id: Tfr_get_list_id
  Left = 210
  Top = 268
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'fr_get_list_id'
  ClientHeight = 422
  ClientWidth = 636
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
    Top = 382
    Width = 636
    Height = 40
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 1
    object BitBtn3: TBitBtn
      Left = 518
      Top = 8
      Width = 107
      Height = 25
      Caption = 'Установить'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = BitBtn3Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 636
    Height = 382
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 88
      Top = 158
      Width = 124
      Height = 13
      Caption = 'Быстрый поиск  ---->'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object gr_in_list: TDBGrid
      Left = 10
      Top = 30
      Width = 613
      Height = 120
      DataSource = ds_in_list
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = bt_addClick
      Columns = <
        item
          Expanded = False
          FieldName = 'name'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = 'Наименование'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 575
          Visible = True
        end>
    end
    object pn_in_name: TPanel
      Left = 1
      Top = 1
      Width = 634
      Height = 20
      Align = alTop
      Caption = 'pn_in_name'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    object pn_out_name: TPanel
      Left = 1
      Top = 216
      Width = 634
      Height = 20
      Caption = 'pn_out_name'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
    object bt_add: TBitBtn
      Left = 194
      Top = 182
      Width = 105
      Height = 25
      Caption = 'Добавить'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = bt_addClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        33333333333FFF3333333333339993333333333333888F333333333333999333
        3333333333888F3333333333339993333333333333888F333333333333999333
        3333333FFF888FFFFF3333999999999993333388888888888F33339999999999
        93333388888888888F3333999999999993333388888888888333333333999333
        3333333333888F3333333333339993333333333333888F333333333333999333
        3333333333888F33333333333399933333333333338883333333333333333333
        3333333333333333333333333333333333333333333333333333}
      Margin = 6
      NumGlyphs = 2
      Spacing = -1
    end
    object bt_del: TBitBtn
      Left = 322
      Top = 182
      Width = 109
      Height = 25
      Caption = 'Убрать'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnClick = bt_delClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333FFFFFFFFFFF3333CCCCCCCCCCC3333388888888888F3333CCCCCCCCCC
        C3333388888888888F3333CCCCCCCCCCC3333388888888888333333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      Margin = 6
      NumGlyphs = 2
      Spacing = -1
    end
    object gr_out_list: TDBGrid
      Left = 10
      Top = 250
      Width = 613
      Height = 120
      DataSource = ds_out_list
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 6
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = bt_delClick
      Columns = <
        item
          Expanded = False
          FieldName = 'name'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = 'Наименование'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 575
          Visible = True
        end>
    end
    object ed_search_str: TEdit
      Left = 220
      Top = 154
      Width = 403
      Height = 21
      TabOrder = 1
      OnKeyPress = ed_search_strKeyPress
    end
  end
  object cds_in_list: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'name'
    Params = <>
    Left = 224
    Top = 80
  end
  object cds_out_list: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'name'
    Params = <>
    Left = 230
    Top = 290
  end
  object ds_in_list: TDataSource
    DataSet = cds_in_list
    Left = 262
    Top = 82
  end
  object ds_out_list: TDataSource
    DataSet = cds_out_list
    Left = 264
    Top = 290
  end
end
