object fr_saldo_in: Tfr_saldo_in
  Left = 201
  Top = 150
  BorderStyle = bsSingle
  Caption = 'Справочник входящего сальдо'
  ClientHeight = 493
  ClientWidth = 771
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
    Width = 771
    Height = 453
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 382
      Top = 108
      Width = 250
      Height = 13
      Alignment = taRightJustify
      Caption = 'САЛЬДО по полученным счетам на начало года :'
    end
    object Label2: TLabel
      Left = 361
      Top = 133
      Width = 271
      Height = 13
      Alignment = taRightJustify
      Caption = 'САЛЬДО по предъявленным счетам на начало года :'
    end
    object Label3: TLabel
      Left = 300
      Top = 157
      Width = 332
      Height = 13
      Alignment = taRightJustify
      Caption = 'Получено средств по предъявленным счетам за прош. периоды :'
    end
    object Label4: TLabel
      Left = 302
      Top = 182
      Width = 330
      Height = 13
      Alignment = taRightJustify
      Caption = 'Перечислено средств по полученным счетам за прош. периоды :'
    end
    object Label5: TLabel
      Left = 317
      Top = 206
      Width = 315
      Height = 13
      Alignment = taRightJustify
      Caption = 'Получено средств по предъявленным счетам за тек. период :'
    end
    object Label6: TLabel
      Left = 319
      Top = 231
      Width = 313
      Height = 13
      Alignment = taRightJustify
      Caption = 'Перечислено средств по полученным счетам за тек. период :'
    end
    object Label7: TLabel
      Left = 366
      Top = 256
      Width = 266
      Height = 13
      Alignment = taRightJustify
      Caption = 'Отказано по пришедшим счетам за прош. периоды :'
    end
    object Label8: TLabel
      Left = 343
      Top = 280
      Width = 289
      Height = 13
      Alignment = taRightJustify
      Caption = 'Отказано по предъявленным счетам за прош. периоды :'
    end
    object Label9: TLabel
      Left = 383
      Top = 305
      Width = 249
      Height = 13
      Alignment = taRightJustify
      Caption = 'Отказано по пришедшим счетам за тек. период :'
    end
    object Label10: TLabel
      Left = 360
      Top = 330
      Width = 272
      Height = 13
      Alignment = taRightJustify
      Caption = 'Отказано по предъявленным счетам за тек. период :'
    end
    object Label11: TLabel
      Left = 395
      Top = 354
      Width = 237
      Height = 13
      Alignment = taRightJustify
      Caption = 'Получено счетов на оплату за прош. периоды :'
    end
    object Label12: TLabel
      Left = 374
      Top = 379
      Width = 258
      Height = 13
      Alignment = taRightJustify
      Caption = 'Предъявлено счетов на оплату за прош. периоды :'
    end
    object Label13: TLabel
      Left = 412
      Top = 403
      Width = 220
      Height = 13
      Alignment = taRightJustify
      Caption = 'Получено счетов на оплату за тек. период :'
    end
    object Label14: TLabel
      Left = 391
      Top = 428
      Width = 241
      Height = 13
      Alignment = taRightJustify
      Caption = 'Предъявлено счетов на оплату за тек. период :'
    end
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 769
      Height = 20
      Align = alTop
      Caption = 'Входящее сальдо и корректировочные суммы'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object DBGrid1: TDBGrid
      Left = 8
      Top = 118
      Width = 285
      Height = 327
      DataSource = ds_urp
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'short_name'
          Title.Alignment = taCenter
          Title.Caption = 'Наименование'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -13
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Visible = True
        end>
    end
    object RadioGroup1: TRadioGroup
      Left = 8
      Top = 26
      Width = 121
      Height = 87
      Caption = 'Тип предприятия : '
      ItemIndex = 0
      Items.Strings = (
        'Фонды'
        'ЛПУ др. тер.'
        'МСО'
        'ЛПУ св. тер.')
      TabOrder = 2
      OnClick = RadioGroup1Click
    end
    object ed_S_IN_NULL: TDBEdit
      Left = 644
      Top = 104
      Width = 121
      Height = 21
      DataField = 'S_IN_NULL'
      DataSource = ds_saldo
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
    object ed_S_OUT_NULL: TDBEdit
      Left = 644
      Top = 129
      Width = 121
      Height = 21
      DataField = 'S_OUT_NULL'
      DataSource = ds_saldo
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
    end
    object ed_PL_PP_IN: TDBEdit
      Left = 644
      Top = 153
      Width = 121
      Height = 21
      DataField = 'PL_PP_IN'
      DataSource = ds_saldo
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
    end
    object ed_PL_PP_OUT: TDBEdit
      Left = 644
      Top = 178
      Width = 121
      Height = 21
      DataField = 'PL_PP_OUT'
      DataSource = ds_saldo
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
    end
    object ed_PL_TP_IN: TDBEdit
      Left = 644
      Top = 202
      Width = 121
      Height = 21
      DataField = 'PL_TP_IN'
      DataSource = ds_saldo
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
    end
    object ed_PL_TP_OUT: TDBEdit
      Left = 644
      Top = 227
      Width = 121
      Height = 21
      DataField = 'PL_TP_OUT'
      DataSource = ds_saldo
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
    end
    object ed_V_PP_IN: TDBEdit
      Left = 644
      Top = 252
      Width = 121
      Height = 21
      DataField = 'V_PP_IN'
      DataSource = ds_saldo
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 9
    end
    object ed_V_PP_OUT: TDBEdit
      Left = 644
      Top = 276
      Width = 121
      Height = 21
      DataField = 'V_PP_OUT'
      DataSource = ds_saldo
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 10
    end
    object ed_V_TP_IN: TDBEdit
      Left = 644
      Top = 301
      Width = 121
      Height = 21
      DataField = 'V_TP_IN'
      DataSource = ds_saldo
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 11
    end
    object ed_V_TP_OUT: TDBEdit
      Left = 644
      Top = 326
      Width = 121
      Height = 21
      DataField = 'V_TP_OUT'
      DataSource = ds_saldo
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 12
    end
    object ed_SCH_PP_IN: TDBEdit
      Left = 644
      Top = 350
      Width = 121
      Height = 21
      DataField = 'SCH_PP_IN'
      DataSource = ds_saldo
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 13
    end
    object ed_SCH_PP_OUT: TDBEdit
      Left = 644
      Top = 375
      Width = 121
      Height = 21
      DataField = 'SCH_PP_OUT'
      DataSource = ds_saldo
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 14
    end
    object ed_SCH_TP_IN: TDBEdit
      Left = 644
      Top = 399
      Width = 121
      Height = 21
      DataField = 'SCH_TP_IN'
      DataSource = ds_saldo
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 15
    end
    object ed_SCH_TP_OUT: TDBEdit
      Left = 644
      Top = 424
      Width = 121
      Height = 21
      DataField = 'SCH_TP_OUT'
      DataSource = ds_saldo
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 16
    end
    object bt_save: TBitBtn
      Left = 556
      Top = 68
      Width = 209
      Height = 25
      Caption = 'Сохранить изменения'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 17
      OnClick = bt_saveClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333FFFFFFFFFFFFF33000077777770033377777777777773F000007888888
        00037F3337F3FF37F37F00000780088800037F3337F77F37F37F000007800888
        00037F3337F77FF7F37F00000788888800037F3337777777337F000000000000
        00037F3FFFFFFFFFFF7F00000000000000037F77777777777F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF07037F7F33333333777F000FFFFFFFFF
        0003737FFFFFFFFF7F7330099999999900333777777777777733}
      Margin = 6
      NumGlyphs = 2
      Spacing = -1
    end
    object bt_sum: TBitBtn
      Left = 614
      Top = 30
      Width = 149
      Height = 21
      Caption = 'Суммарные цифры'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 18
      OnClick = bt_sumClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333333333333333333FFFFFFFFFFF33330000000000
        03333377777777777F33333003333330033333377FF333377F33333300333333
        0333333377FF33337F3333333003333303333333377FF3337333333333003333
        333333333377FF3333333333333003333333333333377FF33333333333330033
        3333333333337733333333333330033333333333333773333333333333003333
        33333333337733333F3333333003333303333333377333337F33333300333333
        03333333773333337F33333003333330033333377FFFFFF77F33330000000000
        0333337777777777733333333333333333333333333333333333}
      Margin = 6
      NumGlyphs = 2
      Spacing = -1
    end
  end
  object bt_exit: TBitBtn
    Left = 690
    Top = 462
    Width = 75
    Height = 25
    Caption = 'ВЫХОД'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = bt_exitClick
  end
  object bt_indeksation: TBitBtn
    Left = 4
    Top = 472
    Width = 293
    Height = 17
    Caption = 'Первичная инициализация новых участников'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = bt_indeksationClick
  end
  object cds_urp: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 84
    Top = 172
  end
  object cds_saldo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pr_saldo_in'
    RemoteServer = DM.Server
    Left = 708
    Top = 62
  end
  object ds_urp: TDataSource
    DataSet = cds_urp
    OnDataChange = ds_urpDataChange
    Left = 128
    Top = 166
  end
  object ds_saldo: TDataSource
    DataSet = cds_saldo
    Left = 656
    Top = 68
  end
end
