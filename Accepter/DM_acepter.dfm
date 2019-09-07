object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 196
  Top = 257
  Height = 480
  Width = 696
  object Server: TSocketConnection
    ServerGUID = '{62750143-594F-11D3-B5A4-0050BAA13180}'
    ServerName = 'terr_srv.OtherAreaRDM'
    AfterConnect = ServerAfterConnect
    AfterDisconnect = ServerAfterDisconnect
    Left = 16
    Top = 8
  end
  object ObjectBroker: TxObjectBroker
    GarbagedPortOnly = True
    NoServerMessage = 'Сервер не найден'
    Left = 72
    Top = 8
  end
  object Pinger: TxObjectPing
    Interval = 300000
    RemoteServer = Server
    Left = 18
    Top = 60
  end
  object cds_tmp: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 40
    Top = 124
  end
  object ODBC_connection: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDASQL.1;Persist Security Info=False;Data Source=Come_' +
      'in_reestr;Connect Timeout=600;Extended Properties="DSN=Come_in_r' +
      'eestr;DBQ=D:\TEMP_DATABASE;DefaultDir=D:\TEMP_DATABASE;DriverId=' +
      '277;FIL=dBase IV;MaxBufferSize=2048;PageTimeout=600;";Locale Ide' +
      'ntifier=1049;Initial Catalog=D:\TEMP_DATABASE'
    ConnectionTimeout = 600
    LoginPrompt = False
    Left = 180
    Top = 16
  end
  object ODBC_q_default: TADOQuery
    Connection = ODBC_connection
    Parameters = <>
    Left = 182
    Top = 76
  end
  object dlg_open_r_lpu: TOpenDialog
    DefaultExt = 'dbf'
    Filter = 'DBF files|*.dbf'
    Title = 'Открыть реестр'
    Left = 278
    Top = 24
  end
end
