object fr_acts: Tfr_acts
  Left = 303
  Top = 179
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Акты зачета'
  ClientHeight = 399
  ClientWidth = 688
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
    Width = 688
    Height = 365
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 334
      Width = 271
      Height = 16
      Caption = 'Показывать зачеты начиная с даты:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ed_dat_s: TDateEdit
      Left = 286
      Top = 332
      Width = 157
      Height = 21
      NumGlyphs = 2
      TabOrder = 0
      OnChange = ed_dat_sChange
    end
    object PageControl1: TPageControl
      Left = 1
      Top = 21
      Width = 686
      Height = 302
      ActivePage = ts_intra
      Align = alTop
      TabOrder = 1
      OnChanging = PageControl1Changing
      object ts_intra: TTabSheet
        Caption = 'Внутренние зачеты'
        object DBGrid1: TDBGrid
          Left = 0
          Top = 0
          Width = 678
          Height = 239
          Align = alTop
          DataSource = ds_intra
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'act_nomer'
              Title.Alignment = taCenter
              Title.Caption = 'Номер акта зачета'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'act_date'
              Title.Alignment = taCenter
              Title.Caption = 'Дата'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'summa'
              Title.Alignment = taCenter
              Title.Caption = 'Сумма'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'sum_use'
              Title.Alignment = taCenter
              Title.Caption = 'Сумма оприходованная'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'short_name'
              Title.Caption = 'Плательщик'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Visible = True
            end>
        end
        object bt_intra_add: TBitBtn
          Left = 4
          Top = 244
          Width = 107
          Height = 25
          Caption = 'Добавить'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = bt_intra_addClick
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
        object bt_intra_del: TBitBtn
          Left = 118
          Top = 244
          Width = 101
          Height = 25
          Caption = 'Удалить'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          OnClick = bt_intra_delClick
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
      end
      object TabSheet2: TTabSheet
        Caption = 'Внешние зачеты'
        ImageIndex = 1
        object DBGrid2: TDBGrid
          Left = 0
          Top = 0
          Width = 678
          Height = 239
          Align = alTop
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
        end
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 686
      Height = 20
      Align = alTop
      Caption = 'Зачеты с СМО'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      object lb_flt_state: TLabel
        Left = 4
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
  end
  object bt_exit: TBitBtn
    Left = 608
    Top = 372
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'ВЫХОД'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = bt_exitClick
  end
  object cds_intra: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 17
    Top = 257
  end
  object ds_intra: TDataSource
    DataSet = cds_intra
    Left = 49
    Top = 259
  end
end
