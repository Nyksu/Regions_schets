object Form1: TForm1
  Left = 291
  Top = 284
  Width = 696
  Height = 378
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 688
    Height = 179
    Align = alTop
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object bt_export: TButton
    Left = 8
    Top = 192
    Width = 75
    Height = 25
    Caption = 'Экспорт'
    TabOrder = 1
    OnClick = bt_exportClick
  end
  object bt_exit: TButton
    Left = 6
    Top = 320
    Width = 75
    Height = 25
    Caption = 'Выход'
    TabOrder = 2
    OnClick = bt_exitClick
  end
  object Database1: TDatabase
    AliasName = 'oracle_i'
    Connected = True
    DatabaseName = 'A_Ora'
    LoginPrompt = False
    Params.Strings = (
      'USER NAME=zb'
      'password=manager')
    SessionName = 'Default'
    Left = 8
    Top = 12
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 96
    Top = 16
  end
  object q_ins: TQuery
    DatabaseName = 'A_Ora'
    SQL.Strings = (
      'Insert  into bnkseek'
      'Values('
      
        ':vkey, :real, :pzn, :uer, :rgn, :ind, :tnp, :nnp, :adr, :rkc, :n' +
        'amep, :namen, :newnum, :newks,'
      
        ':permfo, :srok, :at1, :at2, :telef, :regn, :okpo, :dt_izm, :p, :' +
        'cks, :ksnp'
      ')')
    Left = 86
    Top = 186
    ParamData = <
      item
        DataType = ftString
        Name = 'vkey'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'real'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pzn'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'uer'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'rgn'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ind'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'tnp'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'nnp'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'adr'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'rkc'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'namep'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'namen'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'newnum'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'newks'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'permfo'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'srok'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'at1'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'at2'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'telef'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'regn'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'okpo'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'dt_izm'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'p'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'cks'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ksnp'
        ParamType = ptUnknown
      end>
  end
  object q_up: TQuery
    DatabaseName = 'A_Ora'
    SQL.Strings = (
      'Update  bnkseek'
      'set '
      'real=:real, '
      'pzn=:pzn, '
      'uer=:uer, '
      'rgn=:rgn, '
      'ind=:ind, '
      'tnp=:tnp, '
      'nnp=:nnp, '
      'adr=:adr, '
      'rkc=:rkc, '
      'namep=:namep, '
      'namen=:namen, '
      'newnum=:newnum, '
      'newks=:newks,'
      'permfo=:permfo, '
      'srok=:srok, '
      'at1=:at1, '
      'at2=:at2, '
      'telef=:telef, '
      'regn=:regn, '
      'okpo=:okpo, '
      'dt_izm=:dt_izm, '
      'p=:p, '
      'cks=:cks, '
      'ksnp=:ksnp'
      'where'
      'vkey=:vkey')
    Left = 88
    Top = 220
    ParamData = <
      item
        DataType = ftString
        Name = 'real'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pzn'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'uer'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'rgn'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ind'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'tnp'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'nnp'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'adr'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'rkc'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'namep'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'namen'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'newnum'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'newks'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'permfo'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'srok'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'at1'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'at2'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'telef'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'regn'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'okpo'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'dt_izm'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'p'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'cks'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ksnp'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'vkey'
        ParamType = ptUnknown
      end>
  end
  object Table1: TQuery
    Active = True
    DatabaseName = 'Temp'
    SQL.Strings = (
      'Select * from BNKSEEK')
    Left = 62
    Top = 56
    object fl_VKEY: TStringField
      FieldName = 'VKEY'
      Origin = 'TEMP."BNKSEEK.DBF".VKEY'
      Size = 8
    end
    object fl_REAL: TStringField
      FieldName = 'REAL'
      Origin = 'TEMP."BNKSEEK.DBF".REAL'
      Size = 4
    end
    object fl_PZN: TStringField
      FieldName = 'PZN'
      Origin = 'TEMP."BNKSEEK.DBF".PZN'
      Size = 2
    end
    object fl_UER: TStringField
      FieldName = 'UER'
      Origin = 'TEMP."BNKSEEK.DBF".UER'
      Size = 1
    end
    object fl_RGN: TStringField
      FieldName = 'RGN'
      Origin = 'TEMP."BNKSEEK.DBF".RGN'
      Size = 2
    end
    object fl_IND: TStringField
      FieldName = 'IND'
      Origin = 'TEMP."BNKSEEK.DBF".IND'
      Size = 6
    end
    object fl_TNP: TStringField
      FieldName = 'TNP'
      Origin = 'TEMP."BNKSEEK.DBF".TNP'
      Size = 1
    end
    object fl_NNP: TStringField
      FieldName = 'NNP'
      Origin = 'TEMP."BNKSEEK.DBF".NNP'
      Size = 25
    end
    object fl_ADR: TStringField
      FieldName = 'ADR'
      Origin = 'TEMP."BNKSEEK.DBF".ADR'
      Size = 30
    end
    object fl_RKC: TStringField
      FieldName = 'RKC'
      Origin = 'TEMP."BNKSEEK.DBF".RKC'
      Size = 9
    end
    object fl_NAMEP: TStringField
      FieldName = 'NAMEP'
      Origin = 'TEMP."BNKSEEK.DBF".NAMEP'
      Size = 40
    end
    object fl_NAMEN: TStringField
      FieldName = 'NAMEN'
      Origin = 'TEMP."BNKSEEK.DBF".NAMEN'
      Size = 18
    end
    object fl_NEWNUM: TStringField
      FieldName = 'NEWNUM'
      Origin = 'TEMP."BNKSEEK.DBF".NEWNUM'
      Size = 9
    end
    object fl_NEWKS: TStringField
      FieldName = 'NEWKS'
      Origin = 'TEMP."BNKSEEK.DBF".NEWKS'
      Size = 9
    end
    object fl_PERMFO: TStringField
      FieldName = 'PERMFO'
      Origin = 'TEMP."BNKSEEK.DBF".PERMFO'
      Size = 6
    end
    object fl_SROK: TStringField
      FieldName = 'SROK'
      Origin = 'TEMP."BNKSEEK.DBF".SROK'
      Size = 2
    end
    object fl_AT1: TStringField
      FieldName = 'AT1'
      Origin = 'TEMP."BNKSEEK.DBF".AT1'
      Size = 7
    end
    object fl_AT2: TStringField
      FieldName = 'AT2'
      Origin = 'TEMP."BNKSEEK.DBF".AT2'
      Size = 7
    end
    object fl_TELEF: TStringField
      FieldName = 'TELEF'
      Origin = 'TEMP."BNKSEEK.DBF".TELEF'
      Size = 25
    end
    object fl_REGN: TStringField
      FieldName = 'REGN'
      Origin = 'TEMP."BNKSEEK.DBF".REGN'
      Size = 9
    end
    object fl_OKPO: TStringField
      FieldName = 'OKPO'
      Origin = 'TEMP."BNKSEEK.DBF".OKPO'
      Size = 8
    end
    object fl_DT_IZM: TDateField
      FieldName = 'DT_IZM'
      Origin = 'TEMP."BNKSEEK.DBF".DT_IZM'
    end
    object fl_P: TStringField
      FieldName = 'P'
      Origin = 'TEMP."BNKSEEK.DBF".P'
      Size = 1
    end
    object fl_CKS: TStringField
      FieldName = 'CKS'
      Origin = 'TEMP."BNKSEEK.DBF".CKS'
      Size = 6
    end
    object fl_KSNP: TStringField
      FieldName = 'KSNP'
      Origin = 'TEMP."BNKSEEK.DBF".KSNP'
    end
  end
end
