object dmTmpConexao: TdmTmpConexao
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 479
  Width = 741
  object database: TSDDatabase
    LoginPrompt = False
    DatabaseName = 'Template'
    KeepConnection = False
    Params.Strings = (
      'USER NAME=SYSDBA'
      'PASSWORD=masterkey'
      'SQL DIALECT=3')
    RemoteDatabase = 'localhost:c:\MParty\db\firebird\dados.fdb'
    ServerType = stFirebird
    SessionName = 'Default'
    Left = 40
    Top = 16
  end
  object QGeraCodigo: TSDQuery
    DatabaseName = 'template'
    Options = []
    SessionName = 'Default'
    Left = 176
    Top = 16
  end
  object QTemp: TSDQuery
    DatabaseName = 'template'
    Options = []
    SessionName = 'Default'
    Left = 256
    Top = 16
  end
end
