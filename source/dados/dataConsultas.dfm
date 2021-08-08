inherited dmConsultas: TdmConsultas
  OldCreateOrder = True
  inherited database: TSDDatabase
    DatabaseName = 'Consultas'
    SessionName = 'SessaoConsultas_9'
  end
  inherited QGeraCodigo: TSDQuery
    SessionName = 'SessaoConsultas_9'
  end
  inherited QTemp: TSDQuery
    SessionName = 'SessaoConsultas_9'
  end
  object SessaoConsultas: TSDSession
    Active = True
    AutoSessionName = True
    Left = 104
    Top = 16
  end
  object SQL: TSDQuery
    DatabaseName = 'consultas'
    Options = []
    SessionName = 'SessaoConsultas_9'
    Left = 48
    Top = 128
  end
  object qyVendas: TSDQuery
    DatabaseName = 'consultas'
    Options = []
    SessionName = 'SessaoConsultas_9'
    SQL.Strings = (
      'SELECT '
      'MVH_CODIGO, MVH_TOTAL, MVH_PAGO, MVH_TROCO, MVH_TRANSACAO, '
      'MVH_DTHR '
      'FROM '
      'MOVHIST')
    Left = 160
    Top = 128
    object qyVendasMVH_CODIGO: TIntegerField
      DisplayLabel = 'Venda'
      FieldName = 'MVH_CODIGO'
      Required = True
      DisplayFormat = '000'
    end
    object qyVendasMVH_TOTAL: TFloatField
      DisplayLabel = 'Vlr. Total'
      FieldName = 'MVH_TOTAL'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
    object qyVendasMVH_PAGO: TFloatField
      DisplayLabel = 'Vlr. Pago'
      FieldName = 'MVH_PAGO'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
    object qyVendasMVH_TROCO: TFloatField
      DisplayLabel = 'Vlr. Troco'
      FieldName = 'MVH_TROCO'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
    object qyVendasMVH_TRANSACAO: TStringField
      DisplayLabel = 'Transa'#231#227'o'
      FieldName = 'MVH_TRANSACAO'
      FixedChar = True
      Size = 10
    end
    object qyVendasMVH_DTHR: TDateTimeField
      DisplayLabel = 'Hor'#225'rio'
      FieldName = 'MVH_DTHR'
    end
  end
  object qyItensVenda: TSDQuery
    DatabaseName = 'consultas'
    Options = []
    SessionName = 'SessaoConsultas_9'
    SQL.Strings = (
      'SELECT I.PRE_CODIGO, P.PRE_DESCRICAO, I.ITV_QUANTIDADE,'
      'I.ITV_UNITARIO, I.ITV_TOTAL'
      'FROM'
      'ITENSVEND I, PRECOS P'
      'WHERE I.PRE_CODIGO = P.PRE_CODIGO')
    Left = 256
    Top = 128
    object qyItensVendaPRE_CODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'PRE_CODIGO'
      Required = True
      DisplayFormat = '000'
    end
    object qyItensVendaPRE_DESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'PRE_DESCRICAO'
      Required = True
      Size = 35
    end
    object qyItensVendaITV_QUANTIDADE: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'ITV_QUANTIDADE'
      Required = True
      DisplayFormat = '#,###,###,##0.000'
    end
    object qyItensVendaITV_UNITARIO: TFloatField
      DisplayLabel = 'Vlr. Unit'#225'rio'
      FieldName = 'ITV_UNITARIO'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
    object qyItensVendaITV_TOTAL: TFloatField
      DisplayLabel = 'Vlr. Total'
      FieldName = 'ITV_TOTAL'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
  end
  object qyProdutosVend: TSDQuery
    DatabaseName = 'consultas'
    Options = []
    SessionName = 'SessaoConsultas_9'
    SQL.Strings = (
      'SELECT I.PRE_CODIGO, P.PRE_DESCRICAO, SUM(I.ITV_QUANTIDADE), '
      'I.ITV_UNITARIO, SUM(I.ITV_TOTAL)'
      'FROM ITENSVEND I, PRECOS P'
      'WHERE I.PRE_CODIGO = P.PRE_CODIGO'
      'AND I.FES_CODIGO = 1'
      'AND I.CAI_CODIGO = 1'
      'AND I.LOC_CODIGO = 1'
      'GROUP BY I.PRE_CODIGO, P.PRE_DESCRICAO, I.ITV_UNITARIO'
      'ORDER BY I.PRE_CODIGO')
    Left = 464
    Top = 128
    object qyProdutosVendPRE_CODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'PRE_CODIGO'
      Required = True
      DisplayFormat = '000'
    end
    object qyProdutosVendPRE_DESCRICAO: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'PRE_DESCRICAO'
      Required = True
      Size = 35
    end
    object qyProdutosVendSUM: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'SUM'
      DisplayFormat = '#,###,###,##0.000'
    end
    object qyProdutosVendITV_UNITARIO: TFloatField
      DisplayLabel = 'Vlr. Unit'#225'rio'
      FieldName = 'ITV_UNITARIO'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
    object qyProdutosVendSUM_1: TFloatField
      DisplayLabel = 'Vlr. Total'
      FieldName = 'SUM_1'
      DisplayFormat = '#,###,###,##0.00'
    end
  end
  object qyProdVendFestas: TSDQuery
    DatabaseName = 'consultas'
    Options = []
    SessionName = 'SessaoConsultas_9'
    SQL.Strings = (
      'SELECT I.PRE_CODIGO, P.PRE_DESCRICAO, SUM(I.ITV_QUANTIDADE),'
      'I.ITV_UNITARIO, SUM(I.ITV_TOTAL)'
      'FROM ITENSVEND I, PRECOS P'
      'WHERE I.PRE_CODIGO = P.PRE_CODIGO'
      'AND I.FES_CODIGO = 0'
      'AND I.PRE_CODIGO > 0'
      'GROUP BY I.PRE_CODIGO, P.PRE_DESCRICAO, I.ITV_UNITARIO'
      'ORDER BY I.PRE_CODIGO')
    Left = 464
    Top = 192
    object qyProdVendFestasPRE_CODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'PRE_CODIGO'
      Required = True
    end
    object qyProdVendFestasPRE_DESCRICAO: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'PRE_DESCRICAO'
      Required = True
      Size = 35
    end
    object qyProdVendFestasSUM: TFloatField
      DisplayLabel = 'Tot. Vendido'
      FieldName = 'SUM'
      DisplayFormat = '#,###,###,##0.000'
    end
    object qyProdVendFestasITV_UNITARIO: TFloatField
      DisplayLabel = 'Vlr. Unit'#225'rio'
      FieldName = 'ITV_UNITARIO'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
    object qyProdVendFestasSUM_1: TFloatField
      DisplayLabel = 'Vrl. Total'
      FieldName = 'SUM_1'
      DisplayFormat = '#,###,###,##0.00'
    end
  end
  object qyConsEstoque: TSDQuery
    DatabaseName = 'consultas'
    Options = []
    SessionName = 'SessaoConsultas_9'
    SQL.Strings = (
      'SELECT E.EST_CODIGO, P.PRE_DESCRICAO, E.EST_QUANTIDADE'
      'FROM ESTOQUE E, PRECOS P'
      'WHERE E.PRE_CODIGO = P.PRE_CODIGO')
    Left = 160
    Top = 216
    object qyConsEstoqueEST_CODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'EST_CODIGO'
      Required = True
      DisplayFormat = '000,000'
    end
    object qyConsEstoquePRE_DESCRICAO: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'PRE_DESCRICAO'
      Required = True
      Size = 35
    end
    object qyConsEstoqueEST_QUANTIDADE: TFloatField
      DisplayLabel = 'Estoque'
      FieldName = 'EST_QUANTIDADE'
      Required = True
      DisplayFormat = '#,###,###,##0.000'
    end
  end
end
