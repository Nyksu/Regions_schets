object Form1: TForm1
  Left = 196
  Top = 106
  Width = 696
  Height = 480
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 110
    Top = 6
    Width = 569
    Height = 120
    DataSource = ds_sours
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DBGrid2: TDBGrid
    Left = 112
    Top = 160
    Width = 569
    Height = 75
    DataSource = ds_bank
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object bt_start: TButton
    Left = 112
    Top = 252
    Width = 75
    Height = 25
    Caption = 'Start'
    TabOrder = 2
    OnClick = bt_startClick
  end
  object DB: TDatabase
    AliasName = 'oracle_i'
    Connected = True
    DatabaseName = '01'
    LoginPrompt = False
    Params.Strings = (
      'USER NAME=zb'
      'password=manager')
    SessionName = 'Default'
    Left = 8
    Top = 14
  end
  object q_sours: TQuery
    Active = True
    DatabaseName = '01'
    SQL.Strings = (
      'Select * from slcoags')
    Left = 14
    Top = 60
  end
  object q_bank: TQuery
    DatabaseName = '01'
    SQL.Strings = (
      
        'Select /*+ALL_ROWS*/  t3.id, t1.rs, t2.name as bank_name, t2.ks,' +
        ' t2.bik, t2.city, '
      't3.inn, t3.short_name'
      'from urpers_rs t1, bank t2, urp_view t3'
      'where'
      't1.state=0'
      'and t1.bank_id=t2.id'
      'and t1.urpers_id=t3.id'
      'and t2.bik=:bik'
      'and t1.rs=:rs')
    Left = 12
    Top = 98
    ParamData = <
      item
        DataType = ftString
        Name = 'bik'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'rs'
        ParamType = ptUnknown
      end>
  end
  object q_set_name: TQuery
    DatabaseName = '01'
    SQL.Strings = (
      'Update urpers_ur'
      'set name=Upper(:nam),'
      'fullname=Upper(:nam2)'
      'where'
      'id=:id'
      'and name=To_char(id)')
    Left = 14
    Top = 306
    ParamData = <
      item
        DataType = ftString
        Name = 'nam'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'nam2'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptUnknown
      end>
  end
  object q_set_inn: TQuery
    DatabaseName = '01'
    SQL.Strings = (
      'Update urpers_ur'
      'set inn=:inn'
      'where'
      'id=:id'
      'and inn is null')
    Left = 14
    Top = 342
    ParamData = <
      item
        DataType = ftString
        Name = 'inn'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptUnknown
      end>
  end
  object ds_sours: TDataSource
    DataSet = q_sours
    OnDataChange = ds_soursDataChange
    Left = 56
    Top = 60
  end
  object ds_bank: TDataSource
    DataSet = q_bank
    Left = 54
    Top = 98
  end
end
