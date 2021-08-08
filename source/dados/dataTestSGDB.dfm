object dmTestSGDB: TdmTestSGDB
  OldCreateOrder = False
  Height = 479
  Width = 741
  object Conexao: TSDDatabase
    LoginPrompt = False
    DatabaseName = 'Conexao'
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
end
