inherited dmCadastros: TdmCadastros
  OldCreateOrder = True
  inherited database: TSDDatabase
    DatabaseName = 'Cadastros'
    SessionName = 'SessaoCadastros_1'
  end
  inherited QGeraCodigo: TSDQuery
    SessionName = 'SessaoCadastros_1'
    Left = 224
  end
  inherited QTemp: TSDQuery
    DatabaseName = 'cadastros'
    SessionName = 'SessaoCadastros_1'
    Left = 304
  end
  object qyUsuarios: TSDQuery
    DatabaseName = 'cadastros'
    Options = []
    SessionName = 'SessaoCadastros_1'
    OnUpdateError = qyUsuariosUpdateError
    AfterInsert = qyUsuariosAfterInsert
    BeforePost = qyUsuariosBeforePost
    AfterPost = qyUsuariosAfterPost
    BeforeDelete = qyUsuariosBeforeDelete
    AfterDelete = qyUsuariosAfterDelete
    OnPostError = qyUsuariosPostError
    SQL.Strings = (
      'select usu_codigo, usu_nome, usu_senha, usu_ativo from usuarios')
    UpdateObject = updUsuarios
    Left = 256
    Top = 384
    object qyUsuariosUSU_CODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'USU_CODIGO'
      Required = True
    end
    object qyUsuariosUSU_NOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'USU_NOME'
      Required = True
    end
    object qyUsuariosUSU_SENHA: TStringField
      DisplayLabel = 'Senha'
      FieldName = 'USU_SENHA'
      Required = True
    end
    object qyUsuariosUSU_ATIVO: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'USU_ATIVO'
      Required = True
      Visible = False
      Size = 1
    end
  end
  object SessaoCadastros: TSDSession
    Active = True
    AutoSessionName = True
    Left = 128
    Top = 16
  end
  object updUsuarios: TSDUpdateSQL
    RefreshSQL.Strings = (
      'select USU_CODIGO, USU_NOME, USU_SENHA, USU_ATIVO'#13#10'from usuarios'
      'where'
      '  USU_CODIGO = :OLD_USU_CODIGO')
    ModifySQL.Strings = (
      'update usuarios'
      'set'
      '  USU_CODIGO = :USU_CODIGO,'
      '  USU_NOME = :USU_NOME,'
      '  USU_SENHA = :USU_SENHA,'
      '  USU_ATIVO = :USU_ATIVO'
      'where'
      '  USU_CODIGO = :OLD_USU_CODIGO')
    InsertSQL.Strings = (
      'insert into usuarios'
      '  (USU_CODIGO, USU_NOME, USU_SENHA, USU_ATIVO)'
      'values'
      '  (:USU_CODIGO, :USU_NOME, :USU_SENHA, :USU_ATIVO)')
    DeleteSQL.Strings = (
      'delete from usuarios'
      'where'
      '  USU_CODIGO = :OLD_USU_CODIGO')
    Left = 336
    Top = 384
  end
  object qyCaixas: TSDQuery
    DatabaseName = 'cadastros'
    Options = []
    SessionName = 'SessaoCadastros_1'
    OnUpdateError = qyCaixasUpdateError
    AfterInsert = qyCaixasAfterInsert
    BeforePost = qyCaixasBeforePost
    AfterPost = qyCaixasAfterPost
    BeforeDelete = qyCaixasBeforeDelete
    AfterDelete = qyCaixasAfterDelete
    OnPostError = qyCaixasPostError
    SQL.Strings = (
      'SELECT'
      'CAI_CODIGO, CAI_NOME, CAI_SENHA, CAI_ATIVO'
      ' FROM CAIXAS')
    UpdateObject = updCaixas
    Left = 40
    Top = 88
    object qyCaixasCAI_CODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CAI_CODIGO'
      Required = True
      DisplayFormat = '00000'
    end
    object qyCaixasCAI_NOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'CAI_NOME'
      Required = True
      Size = 35
    end
    object qyCaixasCAI_SENHA: TStringField
      DisplayLabel = 'Senha'
      FieldName = 'CAI_SENHA'
      Required = True
      Visible = False
    end
    object qyCaixasCAI_ATIVO: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'CAI_ATIVO'
      Required = True
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object qyFestas: TSDQuery
    DatabaseName = 'cadastros'
    Options = []
    SessionName = 'SessaoCadastros_1'
    OnUpdateError = qyFestasUpdateError
    AfterInsert = qyFestasAfterInsert
    BeforePost = qyFestasBeforePost
    AfterPost = qyFestasAfterPost
    BeforeDelete = qyFestasBeforeDelete
    AfterDelete = qyFestasAfterDelete
    SQL.Strings = (
      'SELECT * FROM FESTAS')
    UpdateObject = updFestas
    Left = 40
    Top = 192
    object qyFestasFES_CODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'FES_CODIGO'
      Required = True
    end
    object qyFestasFES_ANO: TIntegerField
      DisplayLabel = 'Ano'
      FieldName = 'FES_ANO'
      Required = True
    end
    object qyFestasFES_DATAINIC: TDateTimeField
      DisplayLabel = 'Data inicial'
      DisplayWidth = 10
      FieldName = 'FES_DATAINIC'
      Required = True
      DisplayFormat = 'dd/MM/yyyy'
    end
    object qyFestasFES_DATAFINAL: TDateTimeField
      DisplayLabel = 'Data final'
      DisplayWidth = 10
      FieldName = 'FES_DATAFINAL'
      Required = True
      DisplayFormat = 'dd/MM/yyyy'
    end
    object qyFestasFES_STATUS: TStringField
      DisplayLabel = 'Status'
      FieldName = 'FES_STATUS'
      Required = True
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object qyCaixaTot: TSDQuery
    DatabaseName = 'cadastros'
    Options = []
    SessionName = 'SessaoCadastros_1'
    OnUpdateError = qyCaixaTotUpdateError
    AfterInsert = qyCaixaTotAfterInsert
    BeforePost = qyCaixaTotBeforePost
    AfterPost = qyCaixaTotAfterPost
    BeforeDelete = qyCaixaTotBeforeDelete
    AfterDelete = qyCaixaTotAfterDelete
    OnPostError = qyCaixaTotPostError
    SQL.Strings = (
      'SELECT'
      
        'T.FES_CODIGO, F.FES_ANO, T.LOC_CODIGO, L.LOC_DESCRICAO, T.CAI_CO' +
        'DIGO, C.CAI_NOME,'
      
        'T.CXT_DATA, T.CXT_TROCOINIC, T.CXT_TOTRETIR, T.CXT_TOTALVEND,T.C' +
        'XT_VLRTROCOS,'
      
        'T.CXT_VLRTOTAL, T.CXT_VLRFECHAMENTO, T.CXT_VLRDIFERENCA, T.CXT_V' +
        'LRLUCRO, T.CXT_STATUS'
      'FROM CAIXATOT T, FESTAS F, LOCAIS L, CAIXAS C'
      'WHERE T.FES_CODIGO = F.FES_CODIGO'
      'AND T.LOC_CODIGO = L.LOC_CODIGO'
      'AND T.CAI_CODIGO = C.CAI_CODIGO')
    UpdateObject = updCaixaTot
    Left = 264
    Top = 88
    object qyCaixaTotFES_CODIGO: TIntegerField
      DisplayLabel = 'C'#243'd. Festa'
      FieldName = 'FES_CODIGO'
      Required = True
      Visible = False
    end
    object qyCaixaTotFES_ANO: TIntegerField
      DisplayLabel = 'Ano'
      FieldName = 'FES_ANO'
      Visible = False
    end
    object qyCaixaTotLOC_CODIGO: TIntegerField
      DisplayLabel = 'C'#243'd. Local'
      FieldName = 'LOC_CODIGO'
      Required = True
      Visible = False
    end
    object qyCaixaTotLOC_DESCRICAO: TStringField
      DisplayLabel = 'Local'
      FieldName = 'LOC_DESCRICAO'
      Visible = False
      Size = 35
    end
    object qyCaixaTotCAI_CODIGO: TIntegerField
      DisplayLabel = 'C'#243'd. Caixa'
      FieldName = 'CAI_CODIGO'
      Required = True
      Visible = False
    end
    object qyCaixaTotCAI_NOME: TStringField
      DisplayLabel = 'Caixa'
      FieldName = 'CAI_NOME'
      Size = 35
    end
    object qyCaixaTotCXT_DATA: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 10
      FieldName = 'CXT_DATA'
      Required = True
      DisplayFormat = 'dd/MM/yyyy'
      EditMask = '!99/99/0000;1;_'
    end
    object qyCaixaTotCXT_TROCOINIC: TFloatField
      DisplayLabel = 'Troco inic.'
      FieldName = 'CXT_TROCOINIC'
      Required = True
      DisplayFormat = '#,###,###,###,##0.00'
    end
    object qyCaixaTotCXT_VLRTROCOS: TFloatField
      DisplayLabel = 'Trocos'
      FieldName = 'CXT_VLRTROCOS'
      Required = True
      DisplayFormat = '#,###,###,###,##0.00'
    end
    object qyCaixaTotCXT_TOTRETIR: TFloatField
      DisplayLabel = 'Tot. retirada'
      FieldName = 'CXT_TOTRETIR'
      Required = True
      DisplayFormat = '#,###,###,###,##0.00'
    end
    object qyCaixaTotCXT_TOTALVEND: TFloatField
      DisplayLabel = 'Total vendido'
      FieldName = 'CXT_TOTALVEND'
      Required = True
      DisplayFormat = '#,###,###,###,##0.00'
    end
    object qyCaixaTotCXT_VLRTOTAL: TFloatField
      DisplayLabel = 'Valor total'
      FieldName = 'CXT_VLRTOTAL'
      Required = True
      DisplayFormat = '#,###,###,###,##0.00'
    end
    object qyCaixaTotCXT_VLRFECHAMENTO: TFloatField
      DisplayLabel = 'Vlr. Fechamento'
      FieldName = 'CXT_VLRFECHAMENTO'
      Required = True
      DisplayFormat = '#,###,###,###,##0.00'
    end
    object qyCaixaTotCXT_VLRDIFERENCA: TFloatField
      DisplayLabel = 'Vlr. Diferen'#231'a'
      FieldName = 'CXT_VLRDIFERENCA'
      Required = True
      DisplayFormat = '#,###,###,###,##0.00'
    end
    object qyCaixaTotCXT_VLRLUCRO: TFloatField
      DisplayLabel = 'Vlr. Lucro'
      FieldName = 'CXT_VLRLUCRO'
      Required = True
      DisplayFormat = '#,###,###,###,##0.00'
    end
    object qyCaixaTotCXT_STATUS: TStringField
      DisplayLabel = 'Status'
      FieldName = 'CXT_STATUS'
      Required = True
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object qyLocais: TSDQuery
    DatabaseName = 'cadastros'
    Options = []
    SessionName = 'SessaoCadastros_1'
    OnUpdateError = qyLocaisUpdateError
    AfterInsert = qyLocaisAfterInsert
    BeforePost = qyLocaisBeforePost
    AfterPost = qyLocaisAfterPost
    BeforeDelete = qyLocaisBeforeDelete
    AfterDelete = qyLocaisAfterDelete
    OnPostError = qyLocaisPostError
    SQL.Strings = (
      'SELECT * FROM LOCAIS')
    UpdateObject = updLocais
    Left = 456
    Top = 88
    object qyLocaisLOC_CODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'LOC_CODIGO'
      Required = True
      DisplayFormat = '00000'
    end
    object qyLocaisLOC_DESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'LOC_DESCRICAO'
      Required = True
      Size = 35
    end
  end
  object qyPrecos: TSDQuery
    DatabaseName = 'cadastros'
    Options = []
    SessionName = 'SessaoCadastros_1'
    OnUpdateError = qyPrecosUpdateError
    AfterInsert = qyPrecosAfterInsert
    BeforePost = qyPrecosBeforePost
    AfterPost = qyPrecosAfterPost
    BeforeDelete = qyPrecosBeforeDelete
    AfterDelete = qyPrecosAfterDelete
    OnPostError = qyPrecosPostError
    SQL.Strings = (
      'SELECT * FROM PRECOS')
    UpdateObject = updPrecos
    Left = 48
    Top = 376
    object qyPrecosPRE_CODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'PRE_CODIGO'
      Required = True
      DisplayFormat = '00000'
    end
    object qyPrecosPRE_DESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'PRE_DESCRICAO'
      Required = True
      Size = 35
    end
    object qyPrecosPRE_PRECO: TFloatField
      DisplayLabel = 'Pre'#231'o'
      FieldName = 'PRE_PRECO'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
    object qyPrecosPRE_STATUS: TStringField
      DisplayLabel = 'Status'
      FieldName = 'PRE_STATUS'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object updCaixas: TSDUpdateSQL
    RefreshSQL.Strings = (
      'select CAI_CODIGO, CAI_NOME, CAI_SENHA, CAI_ATIVO'
      'from CAIXAS'
      'where'
      '  CAI_CODIGO = :OLD_CAI_CODIGO')
    ModifySQL.Strings = (
      'update CAIXAS'
      'set'
      '  CAI_CODIGO = :CAI_CODIGO,'
      '  CAI_NOME = :CAI_NOME,'
      '  CAI_SENHA = :CAI_SENHA,'
      '  CAI_ATIVO = :CAI_ATIVO'
      'where'
      '  CAI_CODIGO = :OLD_CAI_CODIGO')
    InsertSQL.Strings = (
      'insert into CAIXAS'
      '  (CAI_CODIGO, CAI_NOME, CAI_SENHA, CAI_ATIVO)'
      'values'
      '  (:CAI_CODIGO, :CAI_NOME, :CAI_SENHA, :CAI_ATIVO)')
    DeleteSQL.Strings = (
      'delete from CAIXAS'
      'where'
      '  CAI_CODIGO = :OLD_CAI_CODIGO')
    Left = 128
    Top = 88
  end
  object updCaixaTot: TSDUpdateSQL
    RefreshSQL.Strings = (
      
        'select FES_CODIGO, LOC_CODIGO, CAI_CODIGO, CXT_DATA, CXT_TROCOIN' +
        'IC, CXT_TOTRETIR, CXT_VLRTROCOS, CXT_TOTALVEND, CXT_VLRTOTAL, CX' +
        'T_VLRFECHAMENTO, CXT_VLRDIFERENCA, CXT_VLRLUCRO, CXT_STATUS'#13#10'fro' +
        'm CAIXATOT'
      'where'
      '  FES_CODIGO = :OLD_FES_CODIGO and'
      '  LOC_CODIGO = :OLD_LOC_CODIGO and'
      '  CAI_CODIGO = :OLD_CAI_CODIGO and'
      '  CXT_DATA = :OLD_CXT_DATA')
    ModifySQL.Strings = (
      'update CAIXATOT'
      'set'
      '  FES_CODIGO = :FES_CODIGO,'
      '  LOC_CODIGO = :LOC_CODIGO,'
      '  CAI_CODIGO = :CAI_CODIGO,'
      '  CXT_DATA = :CXT_DATA,'
      '  CXT_TROCOINIC = :CXT_TROCOINIC,'
      '  CXT_TOTRETIR = :CXT_TOTRETIR,'
      '  CXT_VLRTROCOS = :CXT_VLRTROCOS,'
      '  CXT_TOTALVEND = :CXT_TOTALVEND,'
      '  CXT_VLRTOTAL = :CXT_VLRTOTAL,'
      '  CXT_VLRFECHAMENTO = :CXT_VLRFECHAMENTO,'
      '  CXT_VLRDIFERENCA = :CXT_VLRDIFERENCA,'
      '  CXT_VLRLUCRO = :CXT_VLRLUCRO,'
      '  CXT_STATUS = :CXT_STATUS'
      'where'
      '  FES_CODIGO = :OLD_FES_CODIGO and'
      '  LOC_CODIGO = :OLD_LOC_CODIGO and'
      '  CAI_CODIGO = :OLD_CAI_CODIGO and'
      '  CXT_DATA = :OLD_CXT_DATA')
    InsertSQL.Strings = (
      'insert into CAIXATOT'
      
        '  (FES_CODIGO, LOC_CODIGO, CAI_CODIGO, CXT_DATA, CXT_TROCOINIC, ' +
        'CXT_TOTRETIR, CXT_VLRTROCOS, CXT_TOTALVEND, CXT_VLRTOTAL, CXT_VL' +
        'RFECHAMENTO, CXT_VLRDIFERENCA, CXT_VLRLUCRO, CXT_STATUS)'
      'values'
      
        '  (:FES_CODIGO, :LOC_CODIGO, :CAI_CODIGO, :CXT_DATA, :CXT_TROCOI' +
        'NIC, :CXT_TOTRETIR, :CXT_VLRTROCOS, :CXT_TOTALVEND, :CXT_VLRTOTA' +
        'L, :CXT_VLRFECHAMENTO, :CXT_VLRDIFERENCA, :CXT_VLRLUCRO, :CXT_ST' +
        'ATUS)')
    DeleteSQL.Strings = (
      'delete from CAIXATOT'
      'where'
      '  FES_CODIGO = :OLD_FES_CODIGO and'
      '  LOC_CODIGO = :OLD_LOC_CODIGO and'
      '  CAI_CODIGO = :OLD_CAI_CODIGO and'
      '  CXT_DATA = :OLD_CXT_DATA')
    Left = 336
    Top = 88
  end
  object updFestas: TSDUpdateSQL
    RefreshSQL.Strings = (
      
        'select FES_CODIGO, FES_ANO, FES_DATAINIC, FES_DATAFINAL, FES_STA' +
        'TUS'#13#10'from FESTAS'
      'where'
      '  FES_CODIGO = :OLD_FES_CODIGO')
    ModifySQL.Strings = (
      'update FESTAS'
      'set'
      '  FES_CODIGO = :FES_CODIGO,'
      '  FES_ANO = :FES_ANO,'
      '  FES_DATAINIC = :FES_DATAINIC,'
      '  FES_DATAFINAL = :FES_DATAFINAL,'
      '  FES_STATUS = :FES_STATUS'
      'where'
      '  FES_CODIGO = :OLD_FES_CODIGO')
    InsertSQL.Strings = (
      'insert into FESTAS'
      '  (FES_CODIGO, FES_ANO, FES_DATAINIC, FES_DATAFINAL, FES_STATUS)'
      'values'
      
        '  (:FES_CODIGO, :FES_ANO, :FES_DATAINIC, :FES_DATAFINAL, :FES_ST' +
        'ATUS)')
    DeleteSQL.Strings = (
      'delete from FESTAS'
      'where'
      '  FES_CODIGO = :OLD_FES_CODIGO')
    Left = 120
    Top = 192
  end
  object updLocais: TSDUpdateSQL
    RefreshSQL.Strings = (
      'select LOC_CODIGO, LOC_DESCRICAO'#13#10'from LOCAIS'
      'where'
      '  LOC_CODIGO = :OLD_LOC_CODIGO')
    ModifySQL.Strings = (
      'update LOCAIS'
      'set'
      '  LOC_CODIGO = :LOC_CODIGO,'
      '  LOC_DESCRICAO = :LOC_DESCRICAO'
      'where'
      '  LOC_CODIGO = :OLD_LOC_CODIGO')
    InsertSQL.Strings = (
      'insert into LOCAIS'
      '  (LOC_CODIGO, LOC_DESCRICAO)'
      'values'
      '  (:LOC_CODIGO, :LOC_DESCRICAO)')
    DeleteSQL.Strings = (
      'delete from LOCAIS'
      'where'
      '  LOC_CODIGO = :OLD_LOC_CODIGO')
    Left = 528
    Top = 88
  end
  object updPrecos: TSDUpdateSQL
    RefreshSQL.Strings = (
      
        'select PRE_CODIGO, PRE_DESCRICAO, PRE_PRECO, PRE_STATUS'#13#10'from PR' +
        'ECOS'
      'where'
      '  PRE_CODIGO = :OLD_PRE_CODIGO')
    ModifySQL.Strings = (
      'update PRECOS'
      'set'
      '  PRE_CODIGO = :PRE_CODIGO,'
      '  PRE_DESCRICAO = :PRE_DESCRICAO,'
      '  PRE_PRECO = :PRE_PRECO,'
      '  PRE_STATUS = :PRE_STATUS'
      'where'
      '  PRE_CODIGO = :OLD_PRE_CODIGO')
    InsertSQL.Strings = (
      'insert into PRECOS'
      '  (PRE_CODIGO, PRE_DESCRICAO, PRE_PRECO, PRE_STATUS)'
      'values'
      '  (:PRE_CODIGO, :PRE_DESCRICAO, :PRE_PRECO, :PRE_STATUS)')
    DeleteSQL.Strings = (
      'delete from PRECOS'
      'where'
      '  PRE_CODIGO = :OLD_PRE_CODIGO')
    Left = 128
    Top = 376
  end
  object qyMovHist: TSDQuery
    DatabaseName = 'cadastros'
    Options = []
    SessionName = 'SessaoCadastros_1'
    OnUpdateError = qyMovHistUpdateError
    AfterInsert = qyMovHistAfterInsert
    BeforePost = qyMovHistBeforePost
    AfterPost = qyMovHistAfterPost
    BeforeDelete = qyMovHistBeforeDelete
    AfterDelete = qyMovHistAfterDelete
    OnPostError = qyMovHistPostError
    SQL.Strings = (
      'SELECT'
      
        'M.MVH_CODIGO, M.FES_CODIGO, M.LOC_CODIGO, M.CAI_CODIGO, M.CXT_DA' +
        'TA,'
      
        'M.MVH_TOTAL, MVH_PAGO, MVH_TROCO, M.MVH_TRANSACAO, M.MVH_DTHR, M' +
        '.MVH_FINALIZADO'
      'FROM MOVHIST M')
    UpdateObject = updMovHist
    Left = 40
    Top = 296
    object qyMovHistMVH_CODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'MVH_CODIGO'
      Required = True
      Visible = False
      DisplayFormat = '000,000'
    end
    object qyMovHistFES_CODIGO: TIntegerField
      DisplayLabel = 'C'#243'd. Festa'
      FieldName = 'FES_CODIGO'
      Required = True
      Visible = False
    end
    object qyMovHistLOC_CODIGO: TIntegerField
      DisplayLabel = 'C'#243'd. Local'
      FieldName = 'LOC_CODIGO'
      Required = True
      Visible = False
    end
    object qyMovHistCAI_CODIGO: TIntegerField
      DisplayLabel = 'C'#243'd. Caixa'
      FieldName = 'CAI_CODIGO'
      Required = True
      Visible = False
    end
    object qyMovHistCXT_DATA: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 10
      FieldName = 'CXT_DATA'
      Required = True
      DisplayFormat = 'dd/MM/yyyy'
    end
    object qyMovHistMVH_TOTAL: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'MVH_TOTAL'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
    object qyMovHistMVH_PAGO: TFloatField
      DisplayLabel = 'Pago'
      FieldName = 'MVH_PAGO'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
    object qyMovHistMVH_TROCO: TFloatField
      DisplayLabel = 'Troco'
      FieldName = 'MVH_TROCO'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
    object qyMovHistMVH_TRANSACAO: TStringField
      DisplayLabel = 'Transa'#231#227'o'
      FieldName = 'MVH_TRANSACAO'
      FixedChar = True
      Size = 10
    end
    object qyMovHistMVH_DTHR: TDateTimeField
      DisplayLabel = 'Dt/Hr'
      FieldName = 'MVH_DTHR'
    end
    object qyMovHistMVH_FINALIZADO: TStringField
      DisplayLabel = 'Finalizado'
      FieldName = 'MVH_FINALIZADO'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object updMovHist: TSDUpdateSQL
    RefreshSQL.Strings = (
      
        'select MVH_CODIGO, FES_CODIGO, LOC_CODIGO, CAI_CODIGO, CXT_DATA,' +
        ' MVH_TOTAL, MVH_PAGO, MVH_TROCO, MVH_TRANSACAO, MVH_DTHR, MVH_FI' +
        'NALIZADO'#13#10'from MOVHIST'
      'where'
      '  MVH_CODIGO = :OLD_MVH_CODIGO and'
      '  FES_CODIGO = :OLD_FES_CODIGO and'
      '  LOC_CODIGO = :OLD_LOC_CODIGO and'
      '  CAI_CODIGO = :OLD_CAI_CODIGO and'
      '  CXT_DATA = :OLD_CXT_DATA')
    ModifySQL.Strings = (
      'update MOVHIST'
      'set'
      '  MVH_CODIGO = :MVH_CODIGO,'
      '  FES_CODIGO = :FES_CODIGO,'
      '  LOC_CODIGO = :LOC_CODIGO,'
      '  CAI_CODIGO = :CAI_CODIGO,'
      '  CXT_DATA = :CXT_DATA,'
      '  MVH_TOTAL = :MVH_TOTAL,'
      '  MVH_PAGO = :MVH_PAGO,'
      '  MVH_TROCO = :MVH_TROCO,'
      '  MVH_TRANSACAO = :MVH_TRANSACAO,'
      '  MVH_DTHR = :MVH_DTHR,'
      '  MVH_FINALIZADO = :MVH_FINALIZADO'
      'where'
      '  MVH_CODIGO = :OLD_MVH_CODIGO and'
      '  FES_CODIGO = :OLD_FES_CODIGO and'
      '  LOC_CODIGO = :OLD_LOC_CODIGO and'
      '  CAI_CODIGO = :OLD_CAI_CODIGO and'
      '  CXT_DATA = :OLD_CXT_DATA')
    InsertSQL.Strings = (
      'insert into MOVHIST'
      
        '  (MVH_CODIGO, FES_CODIGO, LOC_CODIGO, CAI_CODIGO, CXT_DATA, MVH' +
        '_TOTAL, MVH_PAGO, MVH_TROCO, MVH_TRANSACAO, MVH_DTHR, MVH_FINALI' +
        'ZADO)'
      'values'
      
        '  (:MVH_CODIGO, :FES_CODIGO, :LOC_CODIGO, :CAI_CODIGO, :CXT_DATA' +
        ', :MVH_TOTAL, :MVH_PAGO, :MVH_TROCO, :MVH_TRANSACAO, :MVH_DTHR, ' +
        ':MVH_FINALIZADO)')
    DeleteSQL.Strings = (
      'delete from MOVHIST'
      'where'
      '  MVH_CODIGO = :OLD_MVH_CODIGO and'
      '  FES_CODIGO = :OLD_FES_CODIGO and'
      '  LOC_CODIGO = :OLD_LOC_CODIGO and'
      '  CAI_CODIGO = :OLD_CAI_CODIGO and'
      '  CXT_DATA = :OLD_CXT_DATA')
    Left = 128
    Top = 296
  end
  object qyFestasDatas: TSDQuery
    DatabaseName = 'cadastros'
    Options = []
    SessionName = 'SessaoCadastros_1'
    OnUpdateError = qyFestasDatasUpdateError
    AfterInsert = qyFestasDatasAfterInsert
    BeforePost = qyFestasDatasBeforePost
    AfterPost = qyFestasDatasAfterPost
    BeforeDelete = qyFestasDatasBeforeDelete
    AfterDelete = qyFestasDatasAfterDelete
    OnPostError = qyFestasDatasPostError
    SQL.Strings = (
      'SELECT FES_CODIGO, FES_DATA FROM FESTASDATAS')
    UpdateObject = updFestasDatas
    Left = 264
    Top = 192
    object qyFestasDatasFES_CODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'FES_CODIGO'
      Required = True
    end
    object qyFestasDatasFES_DATA: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 10
      FieldName = 'FES_DATA'
      Required = True
      DisplayFormat = 'dd/MM/yyyy'
      EditMask = '!99/99/0000;1;_'
    end
  end
  object updFestasDatas: TSDUpdateSQL
    RefreshSQL.Strings = (
      'select FES_CODIGO, FES_DATA'#13#10'from FESTASDATAS'
      'where'
      '  FES_CODIGO = :OLD_FES_CODIGO and'
      '  FES_DATA = :OLD_FES_DATA')
    ModifySQL.Strings = (
      'update FESTASDATAS'
      'set'
      '  FES_CODIGO = :FES_CODIGO,'
      '  FES_DATA = :FES_DATA'
      'where'
      '  FES_CODIGO = :OLD_FES_CODIGO and'
      '  FES_DATA = :OLD_FES_DATA')
    InsertSQL.Strings = (
      'insert into FESTASDATAS'
      '  (FES_CODIGO, FES_DATA)'
      'values'
      '  (:FES_CODIGO, :FES_DATA)')
    DeleteSQL.Strings = (
      'delete from FESTASDATAS'
      'where'
      '  FES_CODIGO = :OLD_FES_CODIGO and'
      '  FES_DATA = :OLD_FES_DATA')
    Left = 336
    Top = 192
  end
  object qyItensVend: TSDQuery
    DatabaseName = 'cadastros'
    Options = []
    SessionName = 'SessaoCadastros_1'
    OnUpdateError = qyItensVendUpdateError
    BeforePost = qyItensVendBeforePost
    AfterPost = qyItensVendAfterPost
    BeforeDelete = qyItensVendBeforeDelete
    AfterDelete = qyItensVendAfterDelete
    OnPostError = qyItensVendPostError
    SQL.Strings = (
      'SELECT'
      
        'I.ITV_CODIGO, I.MVH_CODIGO, I.FES_CODIGO, I.CAI_CODIGO, I.LOC_CO' +
        'DIGO, I.PRE_CODIGO, P.PRE_DESCRICAO, I.ITV_QUANTIDADE, I.ITV_UNI' +
        'TARIO, I.ITV_TOTAL'
      'FROM ITENSVEND I, PRECOS P'
      'WHERE I.PRE_CODIGO = P.PRE_CODIGO'
      'AND I.MVH_CODIGO = 0'
      '')
    UpdateObject = updItensVend
    Left = 456
    Top = 200
    object qyItensVendITV_CODIGO: TIntegerField
      DisplayLabel = 'Item'
      FieldName = 'ITV_CODIGO'
      Required = True
    end
    object qyItensVendMVH_CODIGO: TIntegerField
      DisplayLabel = 'Venda'
      FieldName = 'MVH_CODIGO'
      Required = True
      Visible = False
    end
    object qyItensVendFES_CODIGO: TIntegerField
      DisplayLabel = 'Festa'
      FieldName = 'FES_CODIGO'
      Required = True
      Visible = False
    end
    object qyItensVendCAI_CODIGO: TIntegerField
      DisplayLabel = 'Caixa'
      FieldName = 'CAI_CODIGO'
      Required = True
      Visible = False
    end
    object qyItensVendLOC_CODIGO: TIntegerField
      DisplayLabel = 'Local'
      FieldName = 'LOC_CODIGO'
      Required = True
      Visible = False
    end
    object qyItensVendPRE_CODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'PRE_CODIGO'
      Required = True
      DisplayFormat = '000,000'
    end
    object qyItensVendPRE_DESCRICAO: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'PRE_DESCRICAO'
      Required = True
      Size = 35
    end
    object qyItensVendITV_QUANTIDADE: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'ITV_QUANTIDADE'
      Required = True
    end
    object qyItensVendITV_UNITARIO: TFloatField
      DisplayLabel = 'Vlr. Unit'#225'rio'
      FieldName = 'ITV_UNITARIO'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
    object qyItensVendITV_TOTAL: TFloatField
      DisplayLabel = 'Vlr. Total'
      FieldName = 'ITV_TOTAL'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
  end
  object updItensVend: TSDUpdateSQL
    RefreshSQL.Strings = (
      
        'select ITV_CODIGO, MVH_CODIGO, FES_CODIGO, CAI_CODIGO, LOC_CODIG' +
        'O, PRE_CODIGO, ITV_QUANTIDADE, ITV_UNITARIO, ITV_TOTAL'#13#10'from ITE' +
        'NSVEND'
      'where'
      '  ITV_CODIGO = :OLD_ITV_CODIGO')
    ModifySQL.Strings = (
      'update ITENSVEND'
      'set'
      '  ITV_CODIGO = :ITV_CODIGO,'
      '  MVH_CODIGO = :MVH_CODIGO,'
      '  FES_CODIGO = :FES_CODIGO,'
      '  CAI_CODIGO = :CAI_CODIGO,'
      '  LOC_CODIGO = :LOC_CODIGO,'
      '  PRE_CODIGO = :PRE_CODIGO,'
      '  ITV_QUANTIDADE = :ITV_QUANTIDADE,'
      '  ITV_UNITARIO = :ITV_UNITARIO,'
      '  ITV_TOTAL = :ITV_TOTAL'
      'where'
      '  ITV_CODIGO = :OLD_ITV_CODIGO')
    InsertSQL.Strings = (
      'insert into ITENSVEND'
      
        '  (ITV_CODIGO, MVH_CODIGO, FES_CODIGO, CAI_CODIGO, LOC_CODIGO, P' +
        'RE_CODIGO, ITV_QUANTIDADE, ITV_UNITARIO, ITV_TOTAL)'
      'values'
      
        '  (:ITV_CODIGO, :MVH_CODIGO, :FES_CODIGO, :CAI_CODIGO, :LOC_CODI' +
        'GO, :PRE_CODIGO, :ITV_QUANTIDADE, :ITV_UNITARIO, :ITV_TOTAL)')
    DeleteSQL.Strings = (
      'delete from ITENSVEND'
      'where'
      '  ITV_CODIGO = :OLD_ITV_CODIGO')
    Left = 536
    Top = 200
  end
  object qyEstoque: TSDQuery
    DatabaseName = 'cadastros'
    Options = []
    SessionName = 'SessaoCadastros_1'
    OnUpdateError = qyEstoqueUpdateError
    BeforePost = qyEstoqueBeforePost
    AfterPost = qyEstoqueAfterPost
    BeforeDelete = qyEstoqueBeforeDelete
    AfterDelete = qyEstoqueAfterDelete
    OnPostError = qyEstoquePostError
    SQL.Strings = (
      'SELECT EST_CODIGO, PRE_CODIGO, EST_QUANTIDADE'
      'FROM ESTOQUE')
    UpdateObject = updEstoque
    Left = 240
    Top = 296
    object qyEstoqueEST_CODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'EST_CODIGO'
      Required = True
      Visible = False
    end
    object qyEstoquePRE_CODIGO: TIntegerField
      DisplayLabel = 'C'#243'd. Produto'
      FieldName = 'PRE_CODIGO'
      Required = True
      Visible = False
    end
    object qyEstoqueEST_QUANTIDADE: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'EST_QUANTIDADE'
      Required = True
    end
  end
  object updEstoque: TSDUpdateSQL
    RefreshSQL.Strings = (
      'select EST_CODIGO, PRE_CODIGO, EST_QUANTIDADE'
      'from ESTOQUE'
      'where'
      '  EST_CODIGO = :OLD_EST_CODIGO')
    ModifySQL.Strings = (
      'update ESTOQUE'
      'set'
      '  EST_CODIGO = :EST_CODIGO,'
      '  PRE_CODIGO = :PRE_CODIGO,'
      '  EST_QUANTIDADE = :EST_QUANTIDADE'
      'where'
      '  EST_CODIGO = :OLD_EST_CODIGO')
    InsertSQL.Strings = (
      'insert into ESTOQUE'
      '  (EST_CODIGO, PRE_CODIGO, EST_QUANTIDADE)'
      'values'
      '  (:EST_CODIGO, :PRE_CODIGO, :EST_QUANTIDADE)')
    DeleteSQL.Strings = (
      'delete from ESTOQUE'
      'where'
      '  EST_CODIGO = :OLD_EST_CODIGO')
    Left = 328
    Top = 296
  end
  object qySistema: TSDQuery
    DatabaseName = 'cadastros'
    Options = []
    SessionName = 'SessaoCadastros_1'
    OnUpdateError = qySistemaUpdateError
    BeforePost = qySistemaBeforePost
    AfterPost = qySistemaAfterPost
    BeforeDelete = qySistemaBeforeDelete
    AfterDelete = qySistemaAfterDelete
    OnPostError = qySistemaPostError
    SQL.Strings = (
      'SELECT  SIS_CODIGO, SIS_ID, SIS_SERIAL, SIS_VALIDATE'
      'FROM '
      'SISTEMA')
    UpdateObject = updSistema
    Left = 392
    Top = 16
    object qySistemaSIS_CODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'SIS_CODIGO'
      Required = True
    end
    object qySistemaSIS_ID: TStringField
      DisplayLabel = 'Serial'
      FieldName = 'SIS_ID'
      FixedChar = True
      Size = 10
    end
    object qySistemaSIS_SERIAL: TStringField
      DisplayLabel = 'Serial'
      FieldName = 'SIS_SERIAL'
      Size = 30
    end
    object qySistemaSIS_VALIDATE: TDateTimeField
      DisplayLabel = 'Validade'
      FieldName = 'SIS_VALIDATE'
    end
  end
  object updSistema: TSDUpdateSQL
    RefreshSQL.Strings = (
      
        'select SIS_CODIGO, SIS_ID, SIS_SERIAL, SIS_VALIDATE'#13#10'from SISTEM' +
        'A'
      'where'
      '  SIS_CODIGO = :OLD_SIS_CODIGO')
    ModifySQL.Strings = (
      'update SISTEMA'
      'set'
      '  SIS_CODIGO = :SIS_CODIGO,'
      '  SIS_ID = :SIS_ID,'
      '  SIS_SERIAL = :SIS_SERIAL,'
      '  SIS_VALIDATE = :SIS_VALIDATE'
      'where'
      '  SIS_CODIGO = :OLD_SIS_CODIGO')
    InsertSQL.Strings = (
      'insert into SISTEMA'
      '  (SIS_CODIGO, SIS_ID, SIS_SERIAL, SIS_VALIDATE)'
      'values'
      '  (:SIS_CODIGO, :SIS_ID, :SIS_SERIAL, :SIS_VALIDATE)')
    DeleteSQL.Strings = (
      'delete from SISTEMA'
      'where'
      '  SIS_CODIGO = :OLD_SIS_CODIGO')
    Left = 472
    Top = 16
  end
end
