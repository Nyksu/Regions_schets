object FormAddUrpers: TFormAddUrpers
  Left = 311
  Top = 211
  BorderStyle = bsDialog
  Caption = 'Добавить плательщика'
  ClientHeight = 436
  ClientWidth = 691
  Color = clAppWorkSpace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 395
    Width = 691
    Height = 41
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 0
    object BitBtnExit: TBitBtn
      Left = 584
      Top = 8
      Width = 97
      Height = 25
      Caption = '&Отменить'
      ModalResult = 2
      TabOrder = 0
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
        F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
        000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
        338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
        45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
        3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
        F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
        000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
        338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
        4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
        8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
        333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
        0000}
      NumGlyphs = 2
    end
    object BitBtnAdd: TBitBtn
      Left = 16
      Top = 8
      Width = 105
      Height = 25
      Caption = '&Сохранить'
      TabOrder = 1
      OnClick = BitBtnAddClick
      Glyph.Data = {
        CE070000424DCE07000000000000360000002800000024000000120000000100
        1800000000009807000000000000000000000000000000000000007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F007F7F007F7F007F7F007F7FFFFFFF007F7F007F7F007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
        7F7F00007F0000007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F7F7F7FFFFFFF
        007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
        7F007F7F007F7F007F7F7F0000007F00007F007F0000007F7F007F7F007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
        7F7F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F7F0000007F00007F00007F0000
        7F007F0000007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
        007F7F007F7F007F7F7F7F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F000000
        7F00007F00007F00007F00007F00007F007F0000007F7F007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F007F7F007F7F007F7F007F
        7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F007F7F7F0000007F00007F00007F0000FF00007F00007F00007F00007F00
        7F0000007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFF
        FF007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F7F7F7FFFFFFF007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F007F00007F00007F0000FF00007F7F
        00FF00007F00007F00007F007F0000007F7F007F7F007F7F007F7F007F7F007F
        7F007F7F007F7F7F7F7FFFFFFF007F7F7F7F7F007F7F7F7F7FFFFFFF007F7F00
        7F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F007F7F00FF00
        007F0000FF00007F7F007F7F007F7F00FF00007F00007F00007F007F0000007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF7F7F7F007F7F00
        7F7F007F7F7F7F7FFFFFFF007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F00FF00007F7F007F7F007F7F007F7F007F7F00FF
        00007F00007F00007F007F0000007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F7F7F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F
        7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
        7F007F7F007F7F007F7F007F7F00FF00007F00007F00007F007F0000007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
        007F7F7F7F7FFFFFFF007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00FF0000
        7F00007F00007F007F0000007F7F007F7F007F7F007F7F007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F7F7F
        7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F007F7F007F7F007F7F00FF00007F00007F00007F007F0000007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
        7F7F7F7FFFFFFF007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00FF00007F00
        007F00007F007F0000007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
        7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F7F7F7FFF
        FFFF007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
        007F7F007F7F007F7F00FF00007F00007F007F0000007F7F007F7F007F7F007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F
        7F7FFFFFFF007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00FF00007F00007F
        00007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF7F7F7F007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
        7F007F7F007F7F00FF00007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F
        007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F}
      NumGlyphs = 2
    end
    object BitBtnResetAll: TBitBtn
      Left = 205
      Top = 8
      Width = 129
      Height = 25
      Caption = '&Очистить все'
      TabOrder = 2
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
        3333333777333777FF33339993707399933333773337F3777FF3399933000339
        9933377333777F3377F3399333707333993337733337333337FF993333333333
        399377F33333F333377F993333303333399377F33337FF333373993333707333
        333377F333777F333333993333101333333377F333777F3FFFFF993333000399
        999377FF33777F77777F3993330003399993373FF3777F37777F399933000333
        99933773FF777F3F777F339993707399999333773F373F77777F333999999999
        3393333777333777337333333999993333333333377777333333}
      NumGlyphs = 2
    end
    object BitBtnReset: TBitBtn
      Left = 395
      Top = 8
      Width = 105
      Height = 25
      Caption = '&Очистить'
      TabOrder = 3
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
        555557777F777555F55500000000555055557777777755F75555005500055055
        555577F5777F57555555005550055555555577FF577F5FF55555500550050055
        5555577FF77577FF555555005050110555555577F757777FF555555505099910
        555555FF75777777FF555005550999910555577F5F77777775F5500505509990
        3055577F75F77777575F55005055090B030555775755777575755555555550B0
        B03055555F555757575755550555550B0B335555755555757555555555555550
        BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
        50BB555555555555575F555555555555550B5555555555555575}
      NumGlyphs = 2
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 81
    Width = 691
    Height = 314
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 1
    object PageControlUrpers: TPageControl
      Left = 1
      Top = 1
      Width = 689
      Height = 312
      ActivePage = TabSheetBank
      Align = alClient
      TabOrder = 0
      object TabSheetUR: TTabSheet
        Caption = '&Основные данные'
        object LabelFULLNAME: TLabel
          Left = 6
          Top = 142
          Width = 76
          Height = 13
          Caption = 'Наименование'
          FocusControl = MaskEditName
        end
        object LabelShort_Name: TLabel
          Left = 6
          Top = 165
          Width = 69
          Height = 13
          Caption = 'Наим. кратко'
          FocusControl = MaskEditShort_Name
        end
        object LabelBOSSNAME: TLabel
          Left = 6
          Top = 198
          Width = 71
          Height = 13
          Caption = 'Руководитель'
          FocusControl = MaskEditBOSSNAME
        end
        object LabelBUHNAME: TLabel
          Left = 6
          Top = 228
          Width = 66
          Height = 13
          Caption = 'Гл.Бухгалтер'
          FocusControl = MaskEditBUHNAME
        end
        object LabelBOSSTEL: TLabel
          Left = 374
          Top = 198
          Width = 45
          Height = 13
          Caption = 'Телефон'
          FocusControl = MaskEditBOSSTEL
        end
        object LabelBUHTEL: TLabel
          Left = 374
          Top = 228
          Width = 45
          Height = 13
          Caption = 'Телефон'
          FocusControl = MaskEditBUHTEL
        end
        object GroupBoxIndSP: TGroupBox
          Left = 0
          Top = 0
          Width = 681
          Height = 129
          Align = alTop
          Caption = '[Индентификаторы]'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object LabelOPF: TLabel
            Left = 15
            Top = 17
            Width = 56
            Height = 13
            Caption = 'Орг.форма'
            FocusControl = RxDBLookupComboOPF
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LabelOKONH: TLabel
            Left = 336
            Top = 17
            Width = 38
            Height = 13
            Caption = 'ОКОНХ'
            FocusControl = ComboEditOKONH
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LabelSOOGU: TLabel
            Left = 15
            Top = 58
            Width = 37
            Height = 13
            Caption = 'СООГУ'
            FocusControl = RxDBLookupComboSOOGU
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label5: TLabel
            Left = 336
            Top = 58
            Width = 116
            Height = 13
            Caption = 'Форма собственности'
            FocusControl = ComboEditOWNER_FORM
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label8: TLabel
            Left = 15
            Top = 106
            Width = 24
            Height = 13
            Caption = 'ИНН'
            FocusControl = MaskEditINN
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LabelOKPO: TLabel
            Left = 284
            Top = 106
            Width = 31
            Height = 13
            Caption = 'ОКПО'
            FocusControl = MaskEditOKPO
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object ComboEditOKONH: TComboEdit
            Left = 336
            Top = 33
            Width = 240
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333300000000
              0000333377777777777733330FFFFFFFFFF033337F3FFF3F3FF733330F000F0F
              00F033337F777373773733330FFFFFFFFFF033337F3FF3FF3FF733330F00F00F
              00F033337F773773773733330FFFFFFFFFF033337FF3333FF3F7333300FFFF00
              F0F03333773FF377F7373330FB00F0F0FFF0333733773737F3F7330FB0BF0FB0
              F0F0337337337337373730FBFBF0FB0FFFF037F333373373333730BFBF0FB0FF
              FFF037F3337337333FF700FBFBFB0FFF000077F333337FF37777E0BFBFB000FF
              0FF077FF3337773F7F37EE0BFB0BFB0F0F03777FF3733F737F73EEE0BFBF00FF
              00337777FFFF77FF7733EEEE0000000003337777777777777333}
            NumGlyphs = 2
            ParentFont = False
            TabOrder = 0
            OnButtonClick = ComboEditOKONHButtonClick
          end
          object ComboEditOWNER_FORM: TComboEdit
            Left = 336
            Top = 73
            Width = 240
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333300000000
              0000333377777777777733330FFFFFFFFFF033337F3FFF3F3FF733330F000F0F
              00F033337F777373773733330FFFFFFFFFF033337F3FF3FF3FF733330F00F00F
              00F033337F773773773733330FFFFFFFFFF033337FF3333FF3F7333300FFFF00
              F0F03333773FF377F7373330FB00F0F0FFF0333733773737F3F7330FB0BF0FB0
              F0F0337337337337373730FBFBF0FB0FFFF037F333373373333730BFBF0FB0FF
              FFF037F3337337333FF700FBFBFB0FFF000077F333337FF37777E0BFBFB000FF
              0FF077FF3337773F7F37EE0BFB0BFB0F0F03777FF3733F737F73EEE0BFBF00FF
              00337777FFFF77FF7733EEEE0000000003337777777777777333}
            NumGlyphs = 2
            ParentFont = False
            TabOrder = 1
            OnButtonClick = ComboEditOWNER_FORMButtonClick
          end
          object RxDBLookupComboOPF: TRxDBLookupCombo
            Left = 15
            Top = 33
            Width = 241
            Height = 21
            DropDownCount = 8
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            LookupField = 'NAME'
            LookupDisplay = 'NAME'
            LookupSource = DataSourceOPF
            ParentFont = False
            TabOrder = 2
          end
          object RxDBLookupComboSOOGU: TRxDBLookupCombo
            Left = 15
            Top = 73
            Width = 241
            Height = 21
            DropDownCount = 8
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            LookupField = 'NAME'
            LookupDisplay = 'NAME'
            LookupSource = DataSourceSOOGU
            ParentFont = False
            TabOrder = 3
          end
          object MaskEditINN: TMaskEdit
            Left = 50
            Top = 102
            Width = 207
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            MaxLength = 25
            ParentFont = False
            TabOrder = 4
          end
          object MaskEditOKPO: TMaskEdit
            Left = 336
            Top = 102
            Width = 207
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            MaxLength = 12
            ParentFont = False
            TabOrder = 5
          end
        end
        object MaskEditName: TMaskEdit
          Left = 91
          Top = 138
          Width = 566
          Height = 21
          MaxLength = 200
          TabOrder = 1
        end
        object MaskEditShort_Name: TMaskEdit
          Left = 91
          Top = 162
          Width = 566
          Height = 21
          MaxLength = 80
          TabOrder = 2
        end
        object MaskEditBOSSNAME: TMaskEdit
          Left = 90
          Top = 195
          Width = 271
          Height = 21
          MaxLength = 40
          TabOrder = 3
        end
        object MaskEditBUHNAME: TMaskEdit
          Left = 90
          Top = 223
          Width = 271
          Height = 21
          MaxLength = 40
          TabOrder = 4
        end
        object MaskEditBUHTEL: TMaskEdit
          Left = 434
          Top = 219
          Width = 223
          Height = 21
          MaxLength = 20
          TabOrder = 5
        end
        object MaskEditBOSSTEL: TMaskEdit
          Left = 434
          Top = 195
          Width = 223
          Height = 21
          MaxLength = 20
          TabOrder = 6
        end
      end
      object TabSheetAdditional: TTabSheet
        Caption = 'Дополнительно'
        ImageIndex = 7
        object Label9: TLabel
          Left = 152
          Top = -36
          Width = 30
          Height = 13
          Caption = 'TREG'
          FocusControl = EditTREG
        end
        object Label10: TLabel
          Left = 188
          Top = -36
          Width = 35
          Height = 13
          Caption = 'FDATE'
          FocusControl = EditFDATE
        end
        object EditTREG: TDBEdit
          Left = 152
          Top = -21
          Width = 20
          Height = 21
          DataField = 'TREG'
          Enabled = False
          TabOrder = 0
        end
        object EditFDATE: TDBEdit
          Left = 188
          Top = -21
          Width = 120
          Height = 21
          DataField = 'FDATE'
          Enabled = False
          TabOrder = 1
        end
        object GroupBoxUchet: TGroupBox
          Left = 0
          Top = 0
          Width = 681
          Height = 73
          Align = alTop
          Caption = '[Постановка на учет]'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          object LabelFDATE: TLabel
            Left = 14
            Top = 20
            Width = 94
            Height = 13
            Caption = 'Поставлен на учет'
            FocusControl = DateEditFDATE
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LabelTREG: TLabel
            Left = 206
            Top = 20
            Width = 86
            Height = 13
            Caption = 'Тип регистрации'
            FocusControl = MaskEditTREG
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LabelDCLOSE: TLabel
            Left = 118
            Top = 20
            Width = 63
            Height = 13
            Caption = 'Снят с учета'
            FocusControl = DateEditDCLOSE
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LabelQCLOSE: TLabel
            Left = 300
            Top = 20
            Width = 139
            Height = 13
            Caption = 'Куда перешел ( отделение )'
            FocusControl = MaskEditQCLOSE
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LabelRCLOSE: TLabel
            Left = 446
            Top = 20
            Width = 106
            Height = 13
            Caption = 'Причина ликвидации'
            FocusControl = MaskEditRCLOSE
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LabelLACT: TLabel
            Left = 558
            Top = 20
            Width = 108
            Height = 13
            Caption = 'Ликвидационный акт'
            FocusControl = MaskEditLACT
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object DateEditFDATE: TDateEdit
            Left = 14
            Top = 36
            Width = 94
            Height = 21
            DirectInput = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            NumGlyphs = 2
            ParentFont = False
            YearDigits = dyFour
            TabOrder = 0
          end
          object MaskEditTREG: TMaskEdit
            Left = 206
            Top = 36
            Width = 86
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            MaxLength = 1
            ParentFont = False
            TabOrder = 1
          end
          object DateEditDCLOSE: TDateEdit
            Left = 118
            Top = 36
            Width = 81
            Height = 21
            DirectInput = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            NumGlyphs = 2
            ParentFont = False
            YearDigits = dyFour
            TabOrder = 2
          end
          object MaskEditQCLOSE: TMaskEdit
            Left = 300
            Top = 36
            Width = 141
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            MaxLength = 2
            ParentFont = False
            TabOrder = 3
          end
          object MaskEditRCLOSE: TMaskEdit
            Left = 446
            Top = 36
            Width = 106
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            MaxLength = 1
            ParentFont = False
            TabOrder = 4
          end
          object MaskEditLACT: TMaskEdit
            Left = 558
            Top = 36
            Width = 108
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            MaxLength = 5
            ParentFont = False
            TabOrder = 5
          end
        end
        object GroupBoxAdress: TGroupBox
          Left = 0
          Top = 73
          Width = 681
          Height = 106
          Align = alClient
          Caption = '[Юридический адрес]'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          object LabelREGION: TLabel
            Left = 12
            Top = 20
            Width = 31
            Height = 13
            Caption = 'Район'
            FocusControl = MaskEditREGION
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LabelSTREET: TLabel
            Left = 287
            Top = 20
            Width = 32
            Height = 13
            Caption = 'Улица'
            FocusControl = MaskEditSTREET
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LabelIND: TLabel
            Left = 628
            Top = 20
            Width = 38
            Height = 13
            Caption = 'Индекс'
            FocusControl = MaskEditIND
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LabelCITY: TLabel
            Left = 55
            Top = 20
            Width = 30
            Height = 13
            Caption = 'Город'
            FocusControl = MaskEditCITY
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LabelADDRESS: TLabel
            Left = 458
            Top = 20
            Width = 23
            Height = 13
            Caption = 'Дом'
            FocusControl = MaskEditADDRESS
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LabelRCITY: TLabel
            Left = 200
            Top = 20
            Width = 69
            Height = 13
            Caption = 'Район города'
            FocusControl = MaskEditRCITY
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LabelFADDR: TLabel
            Left = 12
            Top = 60
            Width = 102
            Height = 13
            Caption = 'Фактический адрес'
            FocusControl = MaskEditFADDR
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object MaskEditIND: TMaskEdit
            Left = 628
            Top = 36
            Width = 45
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            MaxLength = 6
            ParentFont = False
            TabOrder = 0
          end
          object MaskEditCITY: TMaskEdit
            Left = 55
            Top = 36
            Width = 138
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            MaxLength = 15
            ParentFont = False
            TabOrder = 1
          end
          object MaskEditREGION: TMaskEdit
            Left = 12
            Top = 36
            Width = 37
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            MaxLength = 2
            ParentFont = False
            TabOrder = 2
          end
          object MaskEditRCITY: TMaskEdit
            Left = 200
            Top = 36
            Width = 82
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            MaxLength = 2
            ParentFont = False
            TabOrder = 3
          end
          object MaskEditADDRESS: TMaskEdit
            Left = 458
            Top = 36
            Width = 165
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            MaxLength = 20
            ParentFont = False
            TabOrder = 4
          end
          object MaskEditSTREET: TMaskEdit
            Left = 287
            Top = 36
            Width = 165
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            MaxLength = 20
            ParentFont = False
            TabOrder = 5
          end
          object MaskEditFADDR: TMaskEdit
            Left = 12
            Top = 76
            Width = 661
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            MaxLength = 60
            ParentFont = False
            TabOrder = 6
          end
        end
        object GroupBox1: TGroupBox
          Left = 0
          Top = 179
          Width = 681
          Height = 105
          Align = alBottom
          Caption = '[Порчее]'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
          object LabelDGOSREG: TLabel
            Left = 14
            Top = 20
            Width = 85
            Height = 13
            Caption = 'Гос регистрация'
            FocusControl = DateEditDGOSREG
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LabelOTV: TLabel
            Left = 596
            Top = 60
            Width = 79
            Height = 13
            Caption = 'Ответственный'
            FocusControl = MaskEditOTV
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LabelNGOSREG: TLabel
            Left = 222
            Top = 20
            Width = 126
            Height = 13
            Caption = 'Регистрационный номер'
            FocusControl = MaskEditNGOSREG
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LabelDDOSNEW: TLabel
            Left = 114
            Top = 20
            Width = 90
            Height = 13
            Caption = 'Перерегистрации'
            FocusControl = DateEditDDOSNEW
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LabelASSC: TLabel
            Left = 368
            Top = 20
            Width = 127
            Height = 13
            Caption = 'Код страховой компании'
            FocusControl = MaskEditASSC
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LabelFROMOTD: TLabel
            Left = 595
            Top = 20
            Width = 77
            Height = 13
            Caption = 'Откуда прибыл'
            FocusControl = MaskEditFROMOTD
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LabelCONCURWS: TLabel
            Left = 368
            Top = 60
            Width = 140
            Height = 13
            Caption = 'Количество совместителей'
            FocusControl = MaskEditCONCURWS
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LabelNWORKERS: TLabel
            Left = 222
            Top = 60
            Width = 125
            Height = 13
            Caption = 'Количество работающих'
            FocusControl = MaskEditNWORKERS
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LabelMDATE1: TLabel
            Left = 14
            Top = 60
            Width = 157
            Height = 13
            Caption = 'Число месяца уплаты взносов'
            FocusControl = MaskEditMDATE1
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LabelKATEG: TLabel
            Left = 519
            Top = 20
            Width = 53
            Height = 13
            Caption = 'Категория'
            FocusControl = MaskEditKATEG
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object DateEditDGOSREG: TDateEdit
            Left = 14
            Top = 36
            Width = 85
            Height = 21
            DirectInput = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            NumGlyphs = 2
            ParentFont = False
            YearDigits = dyFour
            TabOrder = 0
          end
          object DateEditDDOSNEW: TDateEdit
            Left = 114
            Top = 36
            Width = 90
            Height = 21
            DirectInput = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            NumGlyphs = 2
            ParentFont = False
            YearDigits = dyFour
            TabOrder = 1
          end
          object MaskEditNGOSREG: TMaskEdit
            Left = 222
            Top = 36
            Width = 126
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            MaxLength = 10
            ParentFont = False
            TabOrder = 2
          end
          object MaskEditOTV: TMaskEdit
            Left = 596
            Top = 76
            Width = 79
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            MaxLength = 3
            ParentFont = False
            TabOrder = 3
          end
          object MaskEditASSC: TMaskEdit
            Left = 368
            Top = 36
            Width = 127
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            MaxLength = 3
            ParentFont = False
            TabOrder = 4
          end
          object MaskEditKATEG: TMaskEdit
            Left = 519
            Top = 36
            Width = 53
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            MaxLength = 2
            ParentFont = False
            TabOrder = 5
          end
          object MaskEditFROMOTD: TMaskEdit
            Left = 595
            Top = 36
            Width = 77
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            MaxLength = 2
            ParentFont = False
            TabOrder = 6
          end
          object MaskEditMDATE1: TMaskEdit
            Left = 14
            Top = 76
            Width = 157
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            MaxLength = 2
            ParentFont = False
            TabOrder = 7
            Text = '0'
          end
          object MaskEditNWORKERS: TMaskEdit
            Left = 222
            Top = 76
            Width = 126
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            MaxLength = 2
            ParentFont = False
            TabOrder = 8
            Text = '0'
          end
          object MaskEditCONCURWS: TMaskEdit
            Left = 368
            Top = 76
            Width = 140
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            MaxLength = 2
            ParentFont = False
            TabOrder = 9
            Text = '0'
          end
        end
      end
      object TabSheetPH: TTabSheet
        Caption = 'Предприниматели'
        ImageIndex = 1
        object GroupBoxPass: TGroupBox
          Left = 0
          Top = 0
          Width = 681
          Height = 73
          Caption = '[Паспортные данные]'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object LabelPASPNUM: TLabel
            Left = 95
            Top = 14
            Width = 34
            Height = 13
            Caption = '&Номер'
            FocusControl = MaskEditPASPNUM
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LabelPASPSER: TLabel
            Left = 13
            Top = 14
            Width = 31
            Height = 13
            Caption = '&Серия'
            FocusControl = MaskEditPASPSER
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LabelPASPVYD: TLabel
            Left = 193
            Top = 14
            Width = 56
            Height = 13
            Caption = '&Кем выдан'
            FocusControl = MaskEditPASPVYD
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LabelPASPDAT: TLabel
            Left = 585
            Top = 14
            Width = 66
            Height = 13
            Caption = '&Дата выдачи'
            FocusControl = DateEditPASPDAT
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object MaskEditPASPSER: TMaskEdit
            Left = 13
            Top = 32
            Width = 57
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            MaxLength = 8
            ParentFont = False
            TabOrder = 0
          end
          object MaskEditPASPNUM: TMaskEdit
            Left = 94
            Top = 32
            Width = 83
            Height = 21
            Anchors = [akTop, akRight]
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object MaskEditPASPVYD: TMaskEdit
            Left = 192
            Top = 32
            Width = 369
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            MaxLength = 30
            ParentFont = False
            TabOrder = 2
          end
          object DateEditPASPDAT: TDateEdit
            Left = 588
            Top = 32
            Width = 81
            Height = 21
            DirectInput = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            NumGlyphs = 2
            ParentFont = False
            YearDigits = dyFour
            TabOrder = 3
          end
        end
        object GroupBoxSvid: TGroupBox
          Left = -1
          Top = 73
          Width = 305
          Height = 113
          Caption = '[Свидетельство на право деятельности]'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          object LabelSVIDNUM: TLabel
            Left = 156
            Top = 16
            Width = 34
            Height = 13
            Caption = 'Номер'
            FocusControl = MaskEditSVIDNUM
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LabelSVIDSER: TLabel
            Left = 12
            Top = 16
            Width = 31
            Height = 13
            Caption = 'Серия'
            FocusControl = MaskEditSVIDSER
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LabelSVIDDAT: TLabel
            Left = 12
            Top = 64
            Width = 66
            Height = 13
            Caption = 'Дата выдачи'
            FocusControl = DateEditSVIDDAT
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LabelSVIDSROK: TLabel
            Left = 156
            Top = 64
            Width = 75
            Height = 13
            Caption = 'Срок действия'
            FocusControl = MaskEditSVIDSROK
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object MaskEditSVIDNUM: TMaskEdit
            Left = 158
            Top = 32
            Width = 123
            Height = 21
            EditMask = '000000000000000;1;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            MaxLength = 15
            ParentFont = False
            TabOrder = 0
            Text = '000000000000000'
          end
          object MaskEditSVIDSER: TMaskEdit
            Left = 13
            Top = 32
            Width = 124
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            MaxLength = 15
            ParentFont = False
            TabOrder = 1
          end
          object MaskEditSVIDSROK: TMaskEdit
            Left = 158
            Top = 83
            Width = 79
            Height = 21
            EditMask = '0000;1;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            MaxLength = 4
            ParentFont = False
            TabOrder = 2
            Text = '0000'
          end
          object DateEditSVIDDAT: TDateEdit
            Left = 13
            Top = 80
            Width = 81
            Height = 21
            DirectInput = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            NumGlyphs = 2
            ParentFont = False
            YearDigits = dyFour
            TabOrder = 3
          end
        end
        object GroupBoxAddon: TGroupBox
          Left = 311
          Top = 73
          Width = 369
          Height = 113
          Caption = '[Дополнительно]'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          object LabelGNICOD: TLabel
            Left = 14
            Top = 18
            Width = 47
            Height = 13
            Caption = 'ГНИ Код '
            FocusControl = MaskEditGNICOD
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LabelGNIKF: TLabel
            Left = 133
            Top = 18
            Width = 48
            Height = 13
            Caption = 'ГНИ дата'
            FocusControl = MaskEditGNIKF
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LabelVKLREE: TLabel
            Left = 242
            Top = 18
            Width = 91
            Height = 13
            Caption = 'Включен в реестр'
            FocusControl = MaskEditVKLREE
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LabelREASISKL: TLabel
            Left = 15
            Top = 66
            Width = 110
            Height = 13
            Caption = 'Исключен из реестра'
            FocusControl = MaskEditREASISKL
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LabelGZ: TLabel
            Left = 142
            Top = 66
            Width = 89
            Height = 13
            Caption = 'Финансирование'
            FocusControl = MaskEditGZ
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LabelVP: TLabel
            Left = 243
            Top = 66
            Width = 48
            Height = 13
            Caption = 'Госзаказ'
            FocusControl = MaskEditVP
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object MaskEditGNICOD: TMaskEdit
            Left = 14
            Top = 32
            Width = 83
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object MaskEditGNIKF: TMaskEdit
            Left = 133
            Top = 32
            Width = 83
            Height = 21
            EditMask = '000;1;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            MaxLength = 3
            ParentFont = False
            TabOrder = 1
            Text = '000'
          end
          object MaskEditVKLREE: TMaskEdit
            Left = 243
            Top = 32
            Width = 83
            Height = 21
            EditMask = '000;1;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            MaxLength = 3
            ParentFont = False
            TabOrder = 2
            Text = '000'
          end
          object MaskEditREASISKL: TMaskEdit
            Left = 15
            Top = 84
            Width = 83
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            MaxLength = 3
            ParentFont = False
            TabOrder = 3
          end
          object MaskEditVP: TMaskEdit
            Left = 243
            Top = 84
            Width = 83
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            MaxLength = 1
            ParentFont = False
            TabOrder = 4
          end
          object MaskEditGZ: TMaskEdit
            Left = 142
            Top = 84
            Width = 83
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            MaxLength = 1
            ParentFont = False
            TabOrder = 5
          end
        end
        object GroupBoxRem: TGroupBox
          Left = 1
          Top = 188
          Width = 680
          Height = 89
          Caption = '[Примечание]'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          object MemoPHRem: TMemo
            Left = 2
            Top = 15
            Width = 676
            Height = 72
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ScrollBars = ssVertical
            TabOrder = 0
          end
        end
      end
      object TabSheetRem: TTabSheet
        Caption = 'Комментарий'
        ImageIndex = 2
        object GroupBoxNalog: TGroupBox
          Left = 504
          Top = 0
          Width = 177
          Height = 284
          Align = alRight
          Caption = '[Налоги]'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object LabelU136: TLabel
            Left = 10
            Top = 30
            Width = 143
            Height = 13
            Caption = 'Пр-н перерасч. по указу 136'
            FocusControl = MaskEditU136
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LabelP61: TLabel
            Left = 10
            Top = 86
            Width = 148
            Height = 13
            Caption = 'Сложены .ф.санк. по прик.61'
            FocusControl = MaskEditP61
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LabelINTAX: TLabel
            Left = 10
            Top = 148
            Width = 154
            Height = 13
            Caption = 'Перешел на вмененный налог'
            FocusControl = MaskEditINTAX
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LabelDINTAX: TLabel
            Left = 10
            Top = 210
            Width = 149
            Height = 13
            Caption = 'Дата п-хода на единый налог'
            FocusControl = DateEditDINTAX
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object MaskEditU136: TMaskEdit
            Left = 10
            Top = 49
            Width = 89
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            MaxLength = 1
            ParentFont = False
            TabOrder = 0
          end
          object MaskEditP61: TMaskEdit
            Left = 10
            Top = 105
            Width = 89
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            MaxLength = 1
            ParentFont = False
            TabOrder = 1
          end
          object MaskEditINTAX: TMaskEdit
            Left = 10
            Top = 169
            Width = 89
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            MaxLength = 1
            ParentFont = False
            TabOrder = 2
          end
          object DateEditDINTAX: TDateEdit
            Left = 10
            Top = 232
            Width = 81
            Height = 21
            DirectInput = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            NumGlyphs = 2
            ParentFont = False
            YearDigits = dyFour
            TabOrder = 3
          end
        end
        object GroupBoxBankrot: TGroupBox
          Left = 0
          Top = 184
          Width = 503
          Height = 99
          Caption = '[Банкротство]'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          object LabelBANKROT: TLabel
            Left = 37
            Top = 28
            Width = 102
            Height = 13
            Caption = 'Признан банкротом'
            FocusControl = DateEditBANKROT
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LabelFENIX: TLabel
            Left = 189
            Top = 28
            Width = 156
            Height = 13
            Caption = 'Прекращен пр-сс банкротства'
            FocusControl = DateEditFENIX
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LabelRCODE: TLabel
            Left = 355
            Top = 28
            Width = 65
            Height = 13
            Caption = 'Код причины'
            FocusControl = MaskEditRCODE
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object MaskEditRCODE: TMaskEdit
            Left = 355
            Top = 48
            Width = 89
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            MaxLength = 9
            ParentFont = False
            TabOrder = 0
          end
          object DateEditBANKROT: TDateEdit
            Left = 37
            Top = 48
            Width = 81
            Height = 21
            DirectInput = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            NumGlyphs = 2
            ParentFont = False
            YearDigits = dyFour
            TabOrder = 1
          end
          object DateEditFENIX: TDateEdit
            Left = 189
            Top = 48
            Width = 81
            Height = 21
            DirectInput = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            NumGlyphs = 2
            ParentFont = False
            YearDigits = dyFour
            TabOrder = 2
          end
        end
        object GroupBoxMoreDate: TGroupBox
          Left = 0
          Top = 0
          Width = 502
          Height = 186
          Caption = '[Замечательные даты]'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          object LabelVU: TLabel
            Left = 34
            Top = 39
            Width = 107
            Height = 13
            Caption = 'Внешнее управление'
            FocusControl = DateEditVU
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LabelKR: TLabel
            Left = 192
            Top = 39
            Width = 111
            Height = 13
            Caption = 'Собрание кредиторов'
            FocusControl = DateEditKR
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LabelPEACE: TLabel
            Left = 192
            Top = 100
            Width = 139
            Height = 13
            Caption = 'Заключено "мировое" согл'
            FocusControl = DateEditPEACE
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LabelDEADSOUL: TLabel
            Left = 34
            Top = 100
            Width = 124
            Height = 13
            Caption = 'Признан мертвой душой'
            FocusControl = DateEditDEADSOUL
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LabelLOOK: TLabel
            Left = 348
            Top = 39
            Width = 108
            Height = 13
            Caption = 'Введено наблюдение'
            FocusControl = DateEditLOOK
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object DateEditVU: TDateEdit
            Left = 35
            Top = 57
            Width = 81
            Height = 21
            DirectInput = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            NumGlyphs = 2
            ParentFont = False
            YearDigits = dyFour
            TabOrder = 0
          end
          object DateEditKR: TDateEdit
            Left = 192
            Top = 57
            Width = 81
            Height = 21
            DirectInput = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            NumGlyphs = 2
            ParentFont = False
            YearDigits = dyFour
            TabOrder = 1
          end
          object DateEditLOOK: TDateEdit
            Left = 348
            Top = 57
            Width = 81
            Height = 21
            DirectInput = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            NumGlyphs = 2
            ParentFont = False
            YearDigits = dyFour
            TabOrder = 2
          end
          object DateEditDEADSOUL: TDateEdit
            Left = 34
            Top = 120
            Width = 81
            Height = 21
            DirectInput = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            NumGlyphs = 2
            ParentFont = False
            YearDigits = dyFour
            TabOrder = 3
          end
          object DateEditPEACE: TDateEdit
            Left = 192
            Top = 120
            Width = 81
            Height = 21
            DirectInput = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            NumGlyphs = 2
            ParentFont = False
            YearDigits = dyFour
            TabOrder = 4
          end
        end
      end
      object TabSheetRS: TTabSheet
        Caption = 'Расчетные счета'
        ImageIndex = 3
        object LabelBank: TLabel
          Left = 174
          Top = 6
          Width = 28
          Height = 13
          Caption = '&Банк '
          FocusControl = ComboEditBank
        end
        object LabeRS: TLabel
          Left = 8
          Top = 6
          Width = 83
          Height = 13
          Caption = '&Раcчетный счет '
          FocusControl = MaskEditRS
        end
        object RxDBGridRS: TRxDBGrid
          Left = 0
          Top = 80
          Width = 681
          Height = 204
          Align = alBottom
          DataSource = DataSourceRS
          Options = [dgTitles, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
        end
        object BitBtnAddRS: TBitBtn
          Left = 576
          Top = 8
          Width = 99
          Height = 25
          Caption = 'Добавить'
          TabOrder = 1
          OnClick = BitBtnAddRSClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
            300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
            330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
            333377F3337777773F3FE0FBFBFBFBFB039977F33FFFFFFF7377E0BF00000000
            339977FF777777773377000BFB03333333337773FF733333333F333000333333
            3300333777333333337733333333333333003333333333333377333333333333
            333333333333333333FF33333333333330003333333333333777333333333333
            3000333333333333377733333333333333333333333333333333}
          NumGlyphs = 2
        end
        object BitBtnRemove: TBitBtn
          Left = 576
          Top = 48
          Width = 97
          Height = 25
          Caption = 'Удалить'
          TabOrder = 2
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            0400000000006801000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            333333333333333333333333000033338833333333333333333F333333333333
            0000333911833333983333333388F333333F3333000033391118333911833333
            38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
            911118111118333338F3338F833338F3000033333911111111833333338F3338
            3333F8330000333333911111183333333338F333333F83330000333333311111
            8333333333338F3333383333000033333339111183333333333338F333833333
            00003333339111118333333333333833338F3333000033333911181118333333
            33338333338F333300003333911183911183333333383338F338F33300003333
            9118333911183333338F33838F338F33000033333913333391113333338FF833
            38F338F300003333333333333919333333388333338FFF830000333333333333
            3333333333333333333888330000333333333333333333333333333333333333
            0000}
          NumGlyphs = 2
        end
        object CheckBoxRSActive: TCheckBox
          Left = 8
          Top = 56
          Width = 121
          Height = 17
          Caption = 'Существующий'
          Checked = True
          State = cbChecked
          TabOrder = 3
        end
        object MaskEditRS: TMaskEdit
          Left = 8
          Top = 24
          Width = 139
          Height = 21
          EditMask = '00000000000000000000;1;_'
          MaxLength = 20
          TabOrder = 4
          Text = '00000000000000000000'
        end
        object ComboEditBank: TComboEdit
          Left = 174
          Top = 24
          Width = 377
          Height = 21
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333300000000
            0000333377777777777733330FFFFFFFFFF033337F3FFF3F3FF733330F000F0F
            00F033337F777373773733330FFFFFFFFFF033337F3FF3FF3FF733330F00F00F
            00F033337F773773773733330FFFFFFFFFF033337FF3333FF3F7333300FFFF00
            F0F03333773FF377F7373330FB00F0F0FFF0333733773737F3F7330FB0BF0FB0
            F0F0337337337337373730FBFBF0FB0FFFF037F333373373333730BFBF0FB0FF
            FFF037F3337337333FF700FBFBFB0FFF000077F333337FF37777E0BFBFB000FF
            0FF077FF3337773F7F37EE0BFB0BFB0F0F03777FF3733F737F73EEE0BFBF00FF
            00337777FFFF77FF7733EEEE0000000003337777777777777333}
          NumGlyphs = 2
          TabOrder = 5
          OnButtonClick = ComboEditBankButtonClick
        end
      end
      object TabSheetBank: TTabSheet
        Caption = 'Банк плательщика'
        ImageIndex = 4
        OnShow = TabSheetBankShow
        object GroupBox4: TGroupBox
          Left = 0
          Top = 0
          Width = 681
          Height = 120
          Align = alClient
          Caption = '[Условия отбора]'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object PageControlFilterBank: TPageControl
            Left = 2
            Top = 15
            Width = 677
            Height = 103
            ActivePage = TabSheetBankBik
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object TabSheeSetup: TTabSheet
              Caption = 'Установки'
              ImageIndex = 10
              TabVisible = False
              object CheckBoxType: TCheckBox
                Left = 24
                Top = 8
                Width = 97
                Height = 17
                Caption = 'Тип'
                TabOrder = 0
                OnClick = CheckBoxTypeClick
              end
              object CheckBoxName: TCheckBox
                Left = 24
                Top = 32
                Width = 97
                Height = 17
                Caption = 'Название'
                TabOrder = 1
                OnClick = CheckBoxTypeClick
              end
              object CheckBox9: TCheckBox
                Left = 24
                Top = 56
                Width = 97
                Height = 17
                Caption = 'Корр.счет'
                TabOrder = 2
                OnClick = CheckBoxTypeClick
              end
              object CheckBox10: TCheckBox
                Left = 152
                Top = 8
                Width = 97
                Height = 17
                Caption = 'БИК'
                TabOrder = 3
                OnClick = CheckBoxTypeClick
              end
              object CheckBox11: TCheckBox
                Left = 152
                Top = 32
                Width = 97
                Height = 17
                Caption = 'МФО'
                TabOrder = 4
                OnClick = CheckBoxTypeClick
              end
              object CheckBox12: TCheckBox
                Left = 152
                Top = 56
                Width = 97
                Height = 17
                Caption = 'ОКПО'
                TabOrder = 5
                OnClick = CheckBoxTypeClick
              end
              object CheckBox13: TCheckBox
                Left = 288
                Top = 8
                Width = 97
                Height = 17
                Caption = 'Бик РКЦ'
                TabOrder = 6
                OnClick = CheckBoxTypeClick
              end
              object CheckBox14: TCheckBox
                Left = 288
                Top = 32
                Width = 97
                Height = 17
                Caption = 'Индекс'
                TabOrder = 7
                OnClick = CheckBoxTypeClick
              end
              object CheckBoxCity: TCheckBox
                Left = 288
                Top = 56
                Width = 121
                Height = 17
                Caption = 'Населенный пункт'
                TabOrder = 8
                OnClick = CheckBoxTypeClick
              end
              object CheckBoxAddr: TCheckBox
                Left = 432
                Top = 8
                Width = 97
                Height = 17
                Caption = 'Адрес'
                TabOrder = 9
                OnClick = CheckBoxTypeClick
              end
            end
            object TabSheetBankType: TTabSheet
              Caption = 'Тип'
              object RxDBLookupComboBankType: TRxDBLookupCombo
                Left = 16
                Top = 16
                Width = 329
                Height = 21
                DropDownCount = 8
                LookupField = 'NAME'
                LookupSource = DataSourceBankType
                TabOrder = 0
              end
              object CheckBoxActiveType: TCheckBox
                Left = 16
                Top = 48
                Width = 97
                Height = 17
                Caption = 'Установть'
                TabOrder = 1
                OnClick = CheckBoxActiveTypeClick
              end
            end
            object TabSheetBankName: TTabSheet
              Caption = 'Название'
              ImageIndex = 1
              object ComboBoxBankName: TComboBox
                Left = 8
                Top = 14
                Width = 97
                Height = 21
                ItemHeight = 13
                TabOrder = 0
                Text = 'Начинается'
                Items.Strings = (
                  'Начинается'
                  'Включает'
                  'Оканчивается')
              end
              object MaskEditBankName: TMaskEdit
                Left = 112
                Top = 14
                Width = 337
                Height = 21
                MaxLength = 40
                TabOrder = 1
              end
              object CheckBoxBankName: TCheckBox
                Left = 8
                Top = 50
                Width = 137
                Height = 17
                Caption = 'Учет регистра'
                TabOrder = 2
              end
              object CheckBoxActiveName: TCheckBox
                Left = 128
                Top = 48
                Width = 97
                Height = 17
                Caption = 'Установть'
                TabOrder = 3
              end
            end
            object TabSheetBankKS: TTabSheet
              Caption = 'Корр.счет'
              ImageIndex = 2
              object CheckBox2: TCheckBox
                Left = 16
                Top = 48
                Width = 97
                Height = 17
                Caption = 'Установть'
                TabOrder = 0
              end
            end
            object TabSheetBankBik: TTabSheet
              Caption = 'БИК'
              ImageIndex = 3
              object CheckBoxBIC: TCheckBox
                Left = 16
                Top = 48
                Width = 97
                Height = 17
                Caption = 'Установть'
                TabOrder = 0
              end
              object EditBIC: TEdit
                Left = 40
                Top = 16
                Width = 193
                Height = 21
                TabOrder = 1
              end
            end
            object TabSheetBankMfo: TTabSheet
              Caption = 'МФО'
              ImageIndex = 4
              object CheckBox4: TCheckBox
                Left = 16
                Top = 48
                Width = 97
                Height = 17
                Caption = 'Установть'
                TabOrder = 0
              end
            end
            object TabSheetBankOKPO: TTabSheet
              Caption = 'ОКПО'
              ImageIndex = 5
              object CheckBox5: TCheckBox
                Left = 16
                Top = 48
                Width = 97
                Height = 17
                Caption = 'Установть'
                TabOrder = 0
              end
            end
            object TabSheetBankRKMFO: TTabSheet
              Caption = 'Бик РКЦ'
              ImageIndex = 6
              object CheckBox6: TCheckBox
                Left = 16
                Top = 48
                Width = 97
                Height = 17
                Caption = 'Установть'
                TabOrder = 0
              end
            end
            object TabSheetBankInd: TTabSheet
              Caption = 'Индекс'
              ImageIndex = 7
              object CheckBox7: TCheckBox
                Left = 16
                Top = 48
                Width = 97
                Height = 17
                Caption = 'Установть'
                TabOrder = 0
              end
            end
            object TabSheetBankCity: TTabSheet
              Caption = 'Населенный пункт'
              ImageIndex = 8
              object ComboBoxBankCity: TComboBox
                Left = 8
                Top = 14
                Width = 97
                Height = 21
                ItemHeight = 13
                TabOrder = 0
                Text = 'Начинается'
                Items.Strings = (
                  'Начинается'
                  'Включает'
                  'Оканчивается')
              end
              object MaskEditBankCity: TMaskEdit
                Left = 112
                Top = 14
                Width = 337
                Height = 21
                MaxLength = 40
                TabOrder = 1
              end
              object CheckBoxBankCity: TCheckBox
                Left = 8
                Top = 50
                Width = 137
                Height = 17
                Caption = 'Учет регистра'
                TabOrder = 2
              end
              object CheckBoxActiveCity: TCheckBox
                Left = 120
                Top = 48
                Width = 97
                Height = 17
                Caption = 'Установть'
                TabOrder = 3
              end
            end
            object TabSheetBankAddr: TTabSheet
              Caption = 'Адрес'
              ImageIndex = 9
              object ComboBoxBankAddr: TComboBox
                Left = 8
                Top = 14
                Width = 97
                Height = 21
                ItemHeight = 13
                TabOrder = 0
                Text = 'Начинается'
                Items.Strings = (
                  'Начинается'
                  'Включает'
                  'Оканчивается')
              end
              object MaskEditBankAddr: TMaskEdit
                Left = 112
                Top = 14
                Width = 337
                Height = 21
                MaxLength = 40
                TabOrder = 1
              end
              object CheckBoxBankAddr: TCheckBox
                Left = 8
                Top = 50
                Width = 137
                Height = 17
                Caption = 'Учет регистра'
                TabOrder = 2
              end
              object CheckBoxActiveAddr: TCheckBox
                Left = 120
                Top = 48
                Width = 97
                Height = 17
                Caption = 'Установть'
                TabOrder = 3
              end
            end
          end
          object BitBtnSetBankFilter: TBitBtn
            Left = 568
            Top = 48
            Width = 99
            Height = 25
            Caption = 'Установить'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnClick = BitBtnSetBankFilterClick
            Glyph.Data = {
              CE070000424DCE07000000000000360000002800000024000000120000000100
              1800000000009807000000000000000000000000000000000000007F7F007F7F
              007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
              7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
              7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
              007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
              7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
              7F7F007F7F007F7F007F7F007F7FFFFFFF007F7F007F7F007F7F007F7F007F7F
              007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
              7F7F00007F0000007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
              7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F7F7F7FFFFFFF
              007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
              7F007F7F007F7F007F7F7F0000007F00007F007F0000007F7F007F7F007F7F00
              7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
              7F7F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F
              7F007F7F007F7F007F7F007F7F007F7F007F7F7F0000007F00007F00007F0000
              7F007F0000007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
              007F7F007F7F007F7F7F7F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F
              7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F000000
              7F00007F00007F00007F00007F00007F007F0000007F7F007F7F007F7F007F7F
              007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F007F7F007F7F007F7F007F
              7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F00
              7F7F007F7F7F0000007F00007F00007F0000FF00007F00007F00007F00007F00
              7F0000007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFF
              FF007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F7F7F7FFFFFFF007F7F00
              7F7F007F7F007F7F007F7F007F7F007F7F007F00007F00007F0000FF00007F7F
              00FF00007F00007F00007F007F0000007F7F007F7F007F7F007F7F007F7F007F
              7F007F7F007F7F7F7F7FFFFFFF007F7F7F7F7F007F7F7F7F7FFFFFFF007F7F00
              7F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F007F7F00FF00
              007F0000FF00007F7F007F7F007F7F00FF00007F00007F00007F007F0000007F
              7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF7F7F7F007F7F00
              7F7F007F7F7F7F7FFFFFFF007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F
              007F7F007F7F007F7F007F7F00FF00007F7F007F7F007F7F007F7F007F7F00FF
              00007F00007F00007F007F0000007F7F007F7F007F7F007F7F007F7F007F7F00
              7F7F7F7F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F
              7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
              7F007F7F007F7F007F7F007F7F00FF00007F00007F00007F007F0000007F7F00
              7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
              007F7F7F7F7FFFFFFF007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F
              7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00FF0000
              7F00007F00007F007F0000007F7F007F7F007F7F007F7F007F7F007F7F007F7F
              007F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F7F7F
              7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
              7F7F007F7F007F7F007F7F00FF00007F00007F00007F007F0000007F7F007F7F
              007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
              7F7F7F7FFFFFFF007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F00
              7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00FF00007F00
              007F00007F007F0000007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
              7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F7F7F7FFF
              FFFF007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
              007F7F007F7F007F7F00FF00007F00007F007F0000007F7F007F7F007F7F007F
              7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F
              7F7FFFFFFF007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F
              007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00FF00007F00007F
              00007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
              7F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF7F7F7F007F7F007F7F007F7F
              007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
              7F007F7F007F7F00FF00007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
              7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F
              007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
              7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
              7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
              007F7F007F7F007F7F007F7F007F7F007F7F}
            NumGlyphs = 2
          end
          object BitBtnSelect: TBitBtn
            Left = 568
            Top = 79
            Width = 99
            Height = 25
            Caption = '&Выбрать'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            OnClick = BitBtnSelectClick
          end
        end
        object GroupBoxBank: TGroupBox
          Left = 0
          Top = 120
          Width = 681
          Height = 164
          Align = alBottom
          Caption = '[Результат]'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          object RxDBGrid1: TRxDBGrid
            Left = 2
            Top = 15
            Width = 677
            Height = 147
            Align = alClient
            DataSource = DataSourceBank
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Options = [dgTitles, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            OnDblClick = BitBtnSelectClick
          end
        end
      end
      object TabSheetOKONH: TTabSheet
        Caption = 'Справочник ОКОНХ'
        ImageIndex = 5
        object DBTreeViewOKONH: TDBTreeView
          Left = 0
          Top = 0
          Width = 681
          Height = 284
          Align = alClient
          AutoExpand = True
          HotTrack = True
          Indent = 19
          ReadOnly = True
          RowSelect = True
          TabOrder = 0
          OnDblClick = DBTreeViewOKONHDblClick
          BuildTreeOnDemand = True
          KeyField = 'ID'
          ChildrenField = 'UP_ID'
          DisplayField = 'NAME'
          DataSource = DataSourceOKONH
        end
      end
      object TabSheetOWNER_FORM: TTabSheet
        Caption = 'Формы собственности'
        ImageIndex = 6
        object DBTreeViewOWNER_FORM: TDBTreeView
          Left = 0
          Top = 0
          Width = 681
          Height = 284
          Align = alClient
          AutoExpand = True
          HotTrack = True
          Indent = 19
          ReadOnly = True
          RowSelect = True
          TabOrder = 0
          OnDblClick = DBTreeViewOWNER_FORMDblClick
          BuildTreeOnDemand = True
          KeyField = 'ID'
          ChildrenField = 'MASTER_ID'
          DisplayField = 'NAME'
          DataSource = DataSourceOWNER_FORM
        end
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 691
    Height = 81
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 2
    object GroupBoxArea: TGroupBox
      Left = 8
      Top = 3
      Width = 249
      Height = 70
      Caption = '[Регион]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object RxDBLookupComboAreas: TRxDBLookupCombo
        Left = 10
        Top = 17
        Width = 230
        Height = 20
        DropDownCount = 8
        EscapeClear = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        IndexSwitch = False
        LookupField = 'NAME'
        LookupSource = DataSourceAreas
        ParentFont = False
        TabOrder = 0
      end
    end
    object GroupBoxType: TGroupBox
      Left = 264
      Top = 3
      Width = 225
      Height = 70
      Caption = '[Тип предприятия]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object RxDBLookupType: TRxDBLookupCombo
        Left = 16
        Top = 28
        Width = 201
        Height = 20
        DropDownCount = 8
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        LookupField = 'NAME'
        LookupSource = DataSourceType
        ParentFont = False
        TabOrder = 0
        OnCloseUp = RxDBLookupTypeChange
      end
    end
    object GroupBoxCode: TGroupBox
      Left = 494
      Top = 3
      Width = 193
      Height = 70
      Caption = '[Код предприятия]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      object MaskEditCode: TMaskEdit
        Left = 18
        Top = 27
        Width = 87
        Height = 21
        EditMask = '00\-00000;1;_'
        MaxLength = 8
        TabOrder = 0
        Text = '00-00000'
      end
    end
  end
  object RxDBLookupComboAreaEnd: TRxDBLookupCombo
    Left = 18
    Top = 46
    Width = 230
    Height = 20
    DropDownCount = 8
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    IndexSwitch = False
    LookupField = 'NAME'
    LookupDisplay = 'NAME'
    LookupSource = DataSourceAreaEnd
    ParentFont = False
    TabOrder = 3
  end
  object ClientDataSetAreas: TClientDataSet
    Aggregates = <>
    Params = <>
    AfterScroll = ClientDataSetAreasAfterScroll
    Left = 96
    Top = 8
    object ClientDataSetAreasID: TIntegerField
      FieldName = 'ID'
      Origin = 'ORACLE_I.AREA_VIEW.ID'
      Visible = False
    end
    object ClientDataSetAreasCODE: TStringField
      DisplayLabel = 'Код'
      FieldName = 'CODE'
      Origin = 'ORACLE_I.AREA_VIEW.CODE'
      Size = 12
    end
    object ClientDataSetAreasNAME: TStringField
      DisplayLabel = 'Название'
      FieldName = 'NAME'
      Origin = 'ORACLE_I.AREA_VIEW.NAME'
      Size = 62
    end
    object ClientDataSetAreasMASTER_ID: TIntegerField
      FieldName = 'MASTER_ID'
      Origin = 'ORACLE_I.AREA_VIEW.MASTER_ID'
      Visible = False
    end
  end
  object DataSourceAreas: TDataSource
    DataSet = ClientDataSetAreas
    Left = 136
    Top = 8
  end
  object ClientDataSetAreaEnd: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 96
    Top = 40
    object IntegerField1: TIntegerField
      FieldName = 'ID'
      Origin = 'ORACLE_I.AREA_VIEW.ID'
      Visible = False
    end
    object StringField1: TStringField
      DisplayLabel = 'Код'
      FieldName = 'CODE'
      Origin = 'ORACLE_I.AREA_VIEW.CODE'
      Size = 12
    end
    object StringField2: TStringField
      DisplayLabel = 'Название'
      FieldName = 'NAME'
      Origin = 'ORACLE_I.AREA_VIEW.NAME'
      Size = 62
    end
    object IntegerField2: TIntegerField
      FieldName = 'MASTER_ID'
      Origin = 'ORACLE_I.AREA_VIEW.MASTER_ID'
      Visible = False
    end
  end
  object DataSourceAreaEnd: TDataSource
    DataSet = ClientDataSetAreaEnd
    Left = 136
    Top = 40
  end
  object ClientDataSetType: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 312
    Top = 43
    object ClientDataSetTypeID: TIntegerField
      FieldName = 'ID'
      Origin = 'URPERS_TYPE.ID'
      Visible = False
    end
    object ClientDataSetTypeNAME: TStringField
      FieldName = 'NAME'
      Origin = 'URPERS_TYPE.NAME'
      Size = 40
    end
  end
  object DataSourceType: TDataSource
    DataSet = ClientDataSetType
    Left = 349
    Top = 42
  end
  object DataSourceRS: TDataSource
    DataSet = ClientDataSetDataRS
    Left = 645
    Top = 10
  end
  object DataSourceBank: TDataSource
    DataSet = ClientDataSetBank
    Left = 646
    Top = 43
  end
  object ClientDataSetBank: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 614
    Top = 43
  end
  object ClientDataSetBankType: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 509
    Top = 42
  end
  object DataSourceBankType: TDataSource
    DataSet = ClientDataSetBankType
    Left = 541
    Top = 42
  end
  object ClientDataSetOKONH: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 389
    Top = 42
    object ClientDataSetOKONHID: TIntegerField
      FieldName = 'ID'
      Origin = 'ORACLE_I.OKONH.ID'
    end
    object ClientDataSetOKONHNAME: TStringField
      FieldName = 'NAME'
      Origin = 'ORACLE_I.OKONH.NAME'
      Size = 40
    end
    object ClientDataSetOKONHUP_ID: TIntegerField
      FieldName = 'UP_ID'
      Origin = 'ORACLE_I.OKONH.UP_ID'
    end
    object ClientDataSetOKONHCODE: TStringField
      FieldName = 'CODE'
      Origin = 'ORACLE_I.OKONH.CODE'
      Size = 5
    end
  end
  object DataSourceOKONH: TDataSource
    DataSet = ClientDataSetOKONH
    Left = 421
    Top = 42
  end
  object ClientDataSetOPF: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 16
    Top = 16
    object ClientDataSetOPFID: TIntegerField
      FieldName = 'ID'
      Origin = 'ORACLE_I.OPF.ID'
    end
    object ClientDataSetOPFNAME: TStringField
      FieldName = 'NAME'
      Origin = 'ORACLE_I.OPF.NAME'
      Size = 50
    end
    object ClientDataSetOPFCODE: TStringField
      FieldName = 'CODE'
      Origin = 'ORACLE_I.OPF.CODE'
      Size = 2
    end
  end
  object DataSourceOPF: TDataSource
    DataSet = ClientDataSetOPF
    Left = 49
    Top = 16
  end
  object ClientDataSetOWNER_FORM: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 16
    Top = 48
    object ClientDataSetOWNER_FORMID: TIntegerField
      FieldName = 'ID'
      Origin = 'ORACLE_I.OWNER_FORM.ID'
    end
    object ClientDataSetOWNER_FORMNAME: TStringField
      FieldName = 'NAME'
      Origin = 'ORACLE_I.OWNER_FORM.NAME'
      Size = 50
    end
    object ClientDataSetOWNER_FORMCODE: TStringField
      FieldName = 'CODE'
      Origin = 'ORACLE_I.OWNER_FORM.CODE'
      Size = 2
    end
    object ClientDataSetOWNER_FORMMASTER_ID: TIntegerField
      FieldName = 'MASTER_ID'
      Origin = 'ORACLE_I.OWNER_FORM.MASTER_ID'
    end
  end
  object DataSourceOWNER_FORM: TDataSource
    DataSet = ClientDataSetOWNER_FORM
    Left = 48
    Top = 49
  end
  object DataSourceSOOGU: TDataSource
    DataSet = ClientDataSetSOOGU
    Left = 245
    Top = 34
  end
  object ClientDataSetSOOGU: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 205
    Top = 34
    object ClientDataSetSOOGUID: TIntegerField
      FieldName = 'ID'
      Origin = 'ORACLE_I.SOOGU.ID'
    end
    object ClientDataSetSOOGUCODE: TStringField
      FieldName = 'CODE'
      Origin = 'ORACLE_I.SOOGU.CODE'
      Size = 5
    end
    object ClientDataSetSOOGUNAME: TStringField
      FieldName = 'NAME'
      Origin = 'ORACLE_I.SOOGU.NAME'
      Size = 40
    end
    object ClientDataSetSOOGUNAMECIS: TStringField
      FieldName = 'NAMECIS'
      Origin = 'ORACLE_I.SOOGU.NAMECIS'
      Size = 60
    end
    object ClientDataSetSOOGUFULLNAME: TStringField
      FieldName = 'FULLNAME'
      Origin = 'ORACLE_I.SOOGU.FULLNAME'
      Size = 240
    end
    object ClientDataSetSOOGUFULLNAMC: TStringField
      FieldName = 'FULLNAMC'
      Origin = 'ORACLE_I.SOOGU.FULLNAMC'
      Size = 240
    end
    object ClientDataSetSOOGUNOSHORT: TSmallintField
      FieldName = 'NOSHORT'
      Origin = 'ORACLE_I.SOOGU.NOSHORT'
    end
    object ClientDataSetSOOGUANNUL: TDateTimeField
      FieldName = 'ANNUL'
      Origin = 'ORACLE_I.SOOGU.ANNUL'
    end
  end
  object ClientDataSetDataRS: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 613
    Top = 10
    Data = {
      760000009619E0BD01000000180000000500000000000300000076000642616E
      6B494404000100000000000842616E6B4E616D65010049000000010005574944
      544802000200C800025253010049000000010005574944544802000200140005
      5374617465040001000000000002494404000100000000000000}
    object ClientDataSetDataRSBankID: TIntegerField
      FieldName = 'BankID'
      Visible = False
    end
    object ClientDataSetDataRSBankName: TStringField
      DisplayLabel = 'Название Банка'
      DisplayWidth = 81
      FieldName = 'BankName'
      Size = 200
    end
    object ClientDataSetDataRSRS: TStringField
      DisplayLabel = 'Расчетный счет'
      FieldName = 'RS'
    end
    object ClientDataSetDataRSState: TIntegerField
      FieldName = 'State'
      Visible = False
    end
    object ClientDataSetDataRSStateView: TStringField
      DisplayLabel = 'Состояние'
      FieldKind = fkCalculated
      FieldName = 'StateView'
      Size = 5
      Calculated = True
    end
    object ClientDataSetDataRSID: TIntegerField
      FieldName = 'ID'
      Visible = False
    end
  end
  object ClientDataSetSearch: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 536
    Top = 403
  end
end
