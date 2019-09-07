object fr_show_urp: Tfr_show_urp
  Left = 248
  Top = 225
  Width = 711
  Height = 480
  Caption = 'Справочник предприятий'
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
    Top = 364
    Width = 703
    Height = 89
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 0
    object RadioGroup1: TRadioGroup
      Left = 1
      Top = 1
      Width = 701
      Height = 52
      Align = alTop
      Caption = 'Тип предприятия'
      Columns = 5
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'ТФОМС Тюм обл'
        'Фонды'
        'СМО'
        'ЛПУ своей тер.'
        'ЛПУ др.')
      ParentFont = False
      TabOrder = 0
      OnClick = RadioGroup1Click
    end
    object bt_edit: TBitBtn
      Left = 6
      Top = 58
      Width = 153
      Height = 25
      Caption = 'Редактировать'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = bt_editClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
        000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
        00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
        F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
        0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
        FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
        FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
        0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
        00333377737FFFFF773333303300000003333337337777777333}
      Margin = 6
      NumGlyphs = 2
      Spacing = -1
    end
    object bt_exit: TBitBtn
      Left = 612
      Top = 58
      Width = 85
      Height = 25
      Caption = 'Выход'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = bt_exitClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
        03333377777777777F333301BBBBBBBB033333773F3333337F3333011BBBBBBB
        0333337F73F333337F33330111BBBBBB0333337F373F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337FF3337F33330111B0BBBB
        0333337F337733337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F3F7F33337F333301E10BBBBB0333337F7F7F33337F333301EE0BBBBB
        0333337F777FFFFF7F3333000000000003333377777777777333}
      Margin = 6
      NumGlyphs = 2
      Spacing = -1
    end
    object bt_add: TBitBtn
      Left = 178
      Top = 58
      Width = 121
      Height = 25
      Caption = 'Добавить'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
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
    object ch_show_all: TCheckBox
      Left = 320
      Top = 62
      Width = 97
      Height = 17
      Caption = 'Показать все'
      TabOrder = 4
      OnClick = ch_show_allClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 703
    Height = 364
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 1
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 701
      Height = 20
      Align = alTop
      Caption = 'Предприятия - субъекты ОМС'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object lb_flt_is: TLabel
        Left = 8
        Top = 2
        Width = 10
        Height = 16
        Caption = 'F'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
    end
    object DBGrid1: TDBGrid
      Left = 1
      Top = 21
      Width = 701
      Height = 299
      Align = alClient
      DataSource = ds_urp
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      PopupMenu = pp_menu1
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
          Width = 400
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'inn'
          Title.Alignment = taCenter
          Title.Caption = 'ИНН'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'ind'
          Title.Alignment = taCenter
          Title.Caption = 'Индекс'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'city'
          Title.Alignment = taCenter
          Title.Caption = 'Город'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -13
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'faddr'
          Title.Alignment = taCenter
          Title.Caption = 'Адрес'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'last_change'
          Title.Alignment = taCenter
          Title.Caption = 'Дата изменения'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Visible = True
        end>
    end
    object Panel4: TPanel
      Left = 1
      Top = 320
      Width = 701
      Height = 43
      Align = alBottom
      TabOrder = 2
      object Label1: TLabel
        Left = 252
        Top = 16
        Width = 91
        Height = 13
        Caption = '<---- Поиск по :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object ed_name: TEdit
        Left = 8
        Top = 12
        Width = 237
        Height = 21
        TabOrder = 0
        OnKeyPress = ed_nameKeyPress
      end
      object rb_nam: TRadioButton
        Left = 350
        Top = 6
        Width = 119
        Height = 17
        Caption = 'Наименованию'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        TabStop = True
      end
      object rb_inn: TRadioButton
        Left = 350
        Top = 24
        Width = 101
        Height = 17
        Caption = 'ИНН'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
    end
  end
  object cds_urp: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 270
    Top = 208
  end
  object ds_urp: TDataSource
    DataSet = cds_urp
    Left = 306
    Top = 210
  end
  object pp_menu1: TPopupMenu
    Left = 132
    Top = 142
    object n_rekv: TMenuItem
      Caption = 'Показать банковские реквизиты'
      ShortCut = 8306
      OnClick = n_rekvClick
    end
  end
end
