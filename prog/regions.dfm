object fr_regions: Tfr_regions
  Left = 450
  Top = 99
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Распределение фондов по регионам.'
  ClientHeight = 474
  ClientWidth = 335
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 335
    Height = 435
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 12
      Top = 206
      Width = 75
      Height = 13
      Caption = 'Территория:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 16
      Top = 316
      Width = 47
      Height = 13
      Caption = 'Регион:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 10
      Top = 372
      Width = 49
      Height = 13
      Caption = '№ строки'
    end
    object Label4: TLabel
      Left = 142
      Top = 374
      Width = 117
      Height = 13
      Caption = 'Номер строки раздела'
    end
    object Label5: TLabel
      Left = 184
      Top = 406
      Width = 74
      Height = 13
      Caption = 'Код територии'
    end
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 333
      Height = 20
      Align = alTop
      Caption = 'Территориальные фонды.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object DBGrid1: TDBGrid
      Left = 8
      Top = 28
      Width = 319
      Height = 171
      DataSource = ds_regions
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
          Title.Caption = 'Наименование фонда'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 285
          Visible = True
        end>
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 10
      Top = 330
      Width = 315
      Height = 21
      DataField = 'reg_name_id'
      DataSource = ds_regions
      KeyField = 'id'
      ListField = 'name'
      ListSource = ds_reg_name
      TabOrder = 2
    end
    object DBLookupListBox1: TDBLookupListBox
      Left = 10
      Top = 220
      Width = 317
      Height = 95
      DataField = 'area_id'
      DataSource = ds_regions
      KeyField = 'id'
      ListField = 'name'
      ListSource = ds_area
      TabOrder = 3
    end
    object DBEdit1: TDBEdit
      Left = 62
      Top = 368
      Width = 63
      Height = 21
      DataField = 'cel_nom'
      DataSource = ds_regions
      TabOrder = 4
    end
    object DBEdit2: TDBEdit
      Left = 264
      Top = 370
      Width = 61
      Height = 21
      DataField = 'cel_nom_top'
      DataSource = ds_regions
      TabOrder = 5
    end
    object DBEdit3: TDBEdit
      Left = 264
      Top = 402
      Width = 61
      Height = 21
      DataField = 'COD'
      DataSource = ds_regions
      TabOrder = 6
    end
  end
  object bt_close: TButton
    Left = 4
    Top = 444
    Width = 75
    Height = 25
    Caption = 'Выход'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = bt_closeClick
  end
  object DBNavigator1: TDBNavigator
    Left = 130
    Top = 448
    Width = 200
    Height = 21
    DataSource = ds_regions
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
    TabOrder = 2
  end
  object bt_update: TButton
    Left = 96
    Top = 450
    Width = 21
    Height = 19
    Caption = 'Up'
    TabOrder = 3
    OnClick = bt_updateClick
  end
  object cds_regions: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pr_regions'
    RemoteServer = DM.Server
    Left = 122
    Top = 98
  end
  object cds_area: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 112
    Top = 266
  end
  object cds_reg_name: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 244
    Top = 340
  end
  object ds_regions: TDataSource
    DataSet = cds_regions
    Left = 166
    Top = 108
  end
  object ds_area: TDataSource
    DataSet = cds_area
    Left = 150
    Top = 270
  end
  object ds_reg_name: TDataSource
    DataSet = cds_reg_name
    Left = 212
    Top = 340
  end
end
