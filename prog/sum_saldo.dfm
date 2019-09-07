object fr_sum_saldo: Tfr_sum_saldo
  Left = 269
  Top = 107
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = '—уммарные цифры сальдо и коректировачных сумм'
  ClientHeight = 450
  ClientWidth = 501
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
  object Label1: TLabel
    Left = 96
    Top = 34
    Width = 250
    Height = 13
    Alignment = taRightJustify
    Caption = '—јЋ№ƒќ по полученным счетам на начало года :'
  end
  object Label2: TLabel
    Left = 75
    Top = 59
    Width = 271
    Height = 13
    Alignment = taRightJustify
    Caption = '—јЋ№ƒќ по предъ€вленным счетам на начало года :'
  end
  object Label3: TLabel
    Left = 14
    Top = 83
    Width = 332
    Height = 13
    Alignment = taRightJustify
    Caption = 'ѕолучено средств по предъ€вленным счетам за прош. периоды :'
  end
  object Label4: TLabel
    Left = 16
    Top = 108
    Width = 330
    Height = 13
    Alignment = taRightJustify
    Caption = 'ѕеречислено средств по полученным счетам за прош. периоды :'
  end
  object Label5: TLabel
    Left = 31
    Top = 132
    Width = 315
    Height = 13
    Alignment = taRightJustify
    Caption = 'ѕолучено средств по предъ€вленным счетам за тек. период :'
  end
  object Label6: TLabel
    Left = 33
    Top = 157
    Width = 313
    Height = 13
    Alignment = taRightJustify
    Caption = 'ѕеречислено средств по полученным счетам за тек. период :'
  end
  object Label7: TLabel
    Left = 80
    Top = 182
    Width = 266
    Height = 13
    Alignment = taRightJustify
    Caption = 'ќтказано по пришедшим счетам за прош. периоды :'
  end
  object Label8: TLabel
    Left = 57
    Top = 206
    Width = 289
    Height = 13
    Alignment = taRightJustify
    Caption = 'ќтказано по предъ€вленным счетам за прош. периоды :'
  end
  object Label9: TLabel
    Left = 97
    Top = 231
    Width = 249
    Height = 13
    Alignment = taRightJustify
    Caption = 'ќтказано по пришедшим счетам за тек. период :'
  end
  object Label10: TLabel
    Left = 74
    Top = 256
    Width = 272
    Height = 13
    Alignment = taRightJustify
    Caption = 'ќтказано по предъ€вленным счетам за тек. период :'
  end
  object Label11: TLabel
    Left = 109
    Top = 280
    Width = 237
    Height = 13
    Alignment = taRightJustify
    Caption = 'ѕолучено счетов на оплату за прош. периоды :'
  end
  object Label12: TLabel
    Left = 88
    Top = 305
    Width = 258
    Height = 13
    Alignment = taRightJustify
    Caption = 'ѕредъ€влено счетов на оплату за прош. периоды :'
  end
  object Label13: TLabel
    Left = 126
    Top = 329
    Width = 220
    Height = 13
    Alignment = taRightJustify
    Caption = 'ѕолучено счетов на оплату за тек. период :'
  end
  object Label14: TLabel
    Left = 105
    Top = 354
    Width = 241
    Height = 13
    Alignment = taRightJustify
    Caption = 'ѕредъ€влено счетов на оплату за тек. период :'
  end
  object ed_S_IN_NULL: TDBEdit
    Left = 359
    Top = 30
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
    ReadOnly = True
    TabOrder = 0
  end
  object ed_S_OUT_NULL: TDBEdit
    Left = 359
    Top = 55
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
    ReadOnly = True
    TabOrder = 1
  end
  object ed_PL_PP_IN: TDBEdit
    Left = 359
    Top = 79
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
    ReadOnly = True
    TabOrder = 2
  end
  object ed_PL_PP_OUT: TDBEdit
    Left = 359
    Top = 104
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
    ReadOnly = True
    TabOrder = 3
  end
  object ed_PL_TP_IN: TDBEdit
    Left = 359
    Top = 128
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
    ReadOnly = True
    TabOrder = 4
  end
  object ed_PL_TP_OUT: TDBEdit
    Left = 359
    Top = 153
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
    ReadOnly = True
    TabOrder = 5
  end
  object ed_V_PP_IN: TDBEdit
    Left = 359
    Top = 178
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
    ReadOnly = True
    TabOrder = 6
  end
  object ed_V_PP_OUT: TDBEdit
    Left = 359
    Top = 202
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
    ReadOnly = True
    TabOrder = 7
  end
  object ed_V_TP_IN: TDBEdit
    Left = 359
    Top = 227
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
    ReadOnly = True
    TabOrder = 8
  end
  object ed_V_TP_OUT: TDBEdit
    Left = 359
    Top = 252
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
    ReadOnly = True
    TabOrder = 9
  end
  object ed_SCH_PP_IN: TDBEdit
    Left = 359
    Top = 276
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
    ReadOnly = True
    TabOrder = 10
  end
  object ed_SCH_PP_OUT: TDBEdit
    Left = 359
    Top = 301
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
    ReadOnly = True
    TabOrder = 11
  end
  object ed_SCH_TP_IN: TDBEdit
    Left = 359
    Top = 325
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
    ReadOnly = True
    TabOrder = 12
  end
  object ed_SCH_TP_OUT: TDBEdit
    Left = 359
    Top = 350
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
    ReadOnly = True
    TabOrder = 13
  end
  object bt_exit: TBitBtn
    Left = 220
    Top = 413
    Width = 75
    Height = 25
    Caption = '¬џ’ќƒ'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 14
    OnClick = bt_exitClick
  end
  object ds_saldo: TDataSource
    DataSet = cds_saldo
    Left = 8
    Top = 16
  end
  object cds_saldo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pr_saldo_in'
    RemoteServer = DM.Server
    Left = 60
    Top = 10
  end
end
