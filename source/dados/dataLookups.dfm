inherited dmLookups: TdmLookups
  OldCreateOrder = True
  inherited database: TSDDatabase
    Connected = True
    DatabaseName = 'Lookups'
  end
  object lkCaixas: TSDQuery
    DatabaseName = 'lookups'
    Options = []
    SQL.Strings = (
      'SELECT * FROM CAIXAS'
      'ORDER BY CAI_NOME')
    Left = 40
    Top = 96
    object lkCaixasCAI_NOME: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 35
      FieldName = 'CAI_NOME'
      Required = True
      Size = 35
    end
    object lkCaixasCAI_CODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 10
      FieldName = 'CAI_CODIGO'
      Required = True
    end
  end
  object lkLocais: TSDQuery
    DatabaseName = 'lookups'
    Options = []
    SQL.Strings = (
      'SELECT * FROM LOCAIS'
      'ORDER BY LOC_DESCRICAO')
    Left = 168
    Top = 96
    object lkLocaisLOC_DESCRICAO: TStringField
      DisplayLabel = 'Local'
      DisplayWidth = 35
      FieldName = 'LOC_DESCRICAO'
      Required = True
      Size = 35
    end
    object lkLocaisLOC_CODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 10
      FieldName = 'LOC_CODIGO'
      Required = True
    end
  end
  object lkCaixaLocal: TSDQuery
    DatabaseName = 'lookups'
    Options = []
    Active = True
    SQL.Strings = (
      
        'SELECT C.CAI_CODIGO, C.CAI_NOME, T.CXT_DATA, T.FES_CODIGO, T.LOC' +
        '_CODIGO, L.LOC_DESCRICAO'
      'FROM CAIXAS C, CAIXATOT T, LOCAIS L'
      'WHERE C.CAI_CODIGO = T.CAI_CODIGO'
      'AND T.LOC_CODIGO = L.LOC_CODIGO'
      'AND T.CXT_STATUS = '#39'A'#39
      'ORDER BY C.CAI_NOME')
    Left = 40
    Top = 176
    object lkCaixaLocalCAI_NOME: TStringField
      DisplayLabel = 'Caixa'
      DisplayWidth = 35
      FieldName = 'CAI_NOME'
      Required = True
      Size = 35
    end
    object lkCaixaLocalLOC_DESCRICAO: TStringField
      DisplayLabel = 'Local'
      DisplayWidth = 35
      FieldName = 'LOC_DESCRICAO'
      Required = True
      Size = 35
    end
    object lkCaixaLocalCXT_DATA: TDateTimeField
      DisplayLabel = 'Data Abertura'
      DisplayWidth = 18
      FieldName = 'CXT_DATA'
      Required = True
    end
    object lkCaixaLocalCAI_CODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 10
      FieldName = 'CAI_CODIGO'
      Required = True
      Visible = False
    end
    object lkCaixaLocalFES_CODIGO: TIntegerField
      DisplayLabel = 'C'#243'd. Festa'
      FieldName = 'FES_CODIGO'
      Required = True
      Visible = False
    end
    object lkCaixaLocalLOC_CODIGO: TIntegerField
      DisplayLabel = 'C'#243'd. Local'
      FieldName = 'LOC_CODIGO'
      Required = True
      Visible = False
    end
  end
  object lkFestas: TSDQuery
    DatabaseName = 'lookups'
    Options = []
    SQL.Strings = (
      'SELECT FES_ANO, FES_DATAINIC, FES_DATAFINAL, FES_CODIGO'
      'FROM FESTAS'
      'ORDER BY FES_ANO ')
    Left = 176
    Top = 176
    object lkFestasFES_ANO: TIntegerField
      DisplayLabel = 'Ano'
      DisplayWidth = 10
      FieldName = 'FES_ANO'
      Required = True
    end
    object lkFestasFES_DATAINIC: TDateTimeField
      DisplayLabel = 'Data inic.'
      DisplayWidth = 10
      FieldName = 'FES_DATAINIC'
      Required = True
      DisplayFormat = 'dd/MM/yyyy'
      EditMask = '!99/99/0000;1;_'
    end
    object lkFestasFES_DATAFINAL: TDateTimeField
      DisplayLabel = 'Data final'
      DisplayWidth = 10
      FieldName = 'FES_DATAFINAL'
      Required = True
      DisplayFormat = 'dd/MM/yyyy'
      EditMask = '!99/99/0000;1;_'
    end
    object lkFestasFES_CODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 10
      FieldName = 'FES_CODIGO'
      Required = True
      DisplayFormat = '00000'
    end
  end
end
