inherited dmConfig: TdmConfig
  OldCreateOrder = True
  inherited database: TSDDatabase
    DatabaseName = 'Config'
    SessionName = 'SessaoConfig_3'
  end
  inherited QGeraCodigo: TSDQuery
    SessionName = 'SessaoConfig_3'
  end
  inherited QTemp: TSDQuery
    SessionName = 'SessaoConfig_3'
  end
  object qyEmpresa: TSDQuery
    DatabaseName = 'config'
    Options = []
    SessionName = 'SessaoConfig_3'
    SQL.Strings = (
      'select'
      'EMP_CODIGO, EMP_RAZAO, EMP_CNPJ, EMP_IE, EMP_IMUN,'
      
        'EMP_LOGRADOURO, EMP_NUMERO, EMP_COMPLEMENTO, EMP_BAIRRO, EMP_CID' +
        'ADE,'
      'EMP_UF, EMP_CEP, EMP_FONE, EMP_EMAIL, EMP_HOMEPAGE'
      'from empresa'
      ' '
      ' ')
    UpdateObject = updEmpresa
    Left = 344
    Top = 16
    object qyEmpresaEMP_CODIGO: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'EMP_CODIGO'
      Required = True
    end
    object qyEmpresaEMP_RAZAO: TStringField
      DisplayLabel = 'Raz'#227'o Social'
      FieldName = 'EMP_RAZAO'
      Required = True
      Size = 50
    end
    object qyEmpresaEMP_CNPJ: TStringField
      DisplayLabel = 'CNPJ'
      FieldName = 'EMP_CNPJ'
      Required = True
      Size = 18
    end
    object qyEmpresaEMP_IE: TStringField
      DisplayLabel = 'Insc. Est.'
      FieldName = 'EMP_IE'
      Required = True
      Size = 15
    end
    object qyEmpresaEMP_IMUN: TStringField
      DisplayLabel = 'Insc. Mun.'
      FieldName = 'EMP_IMUN'
      Required = True
      Size = 10
    end
    object qyEmpresaEMP_LOGRADOURO: TStringField
      DisplayLabel = 'Logradouro'
      FieldName = 'EMP_LOGRADOURO'
      Required = True
      Size = 50
    end
    object qyEmpresaEMP_NUMERO: TIntegerField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'EMP_NUMERO'
      Required = True
    end
    object qyEmpresaEMP_COMPLEMENTO: TStringField
      DisplayLabel = 'Complemento'
      FieldName = 'EMP_COMPLEMENTO'
      Size = 15
    end
    object qyEmpresaEMP_BAIRRO: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'EMP_BAIRRO'
      Required = True
      Size = 30
    end
    object qyEmpresaEMP_CIDADE: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'EMP_CIDADE'
      Required = True
      Size = 50
    end
    object qyEmpresaEMP_UF: TStringField
      DisplayLabel = 'UF'
      FieldName = 'EMP_UF'
      Required = True
      Size = 2
    end
    object qyEmpresaEMP_CEP: TStringField
      DisplayLabel = 'CEP'
      FieldName = 'EMP_CEP'
      Required = True
      Size = 9
    end
    object qyEmpresaEMP_FONE: TStringField
      DisplayLabel = 'Fone'
      FieldName = 'EMP_FONE'
      Required = True
      Size = 15
    end
    object qyEmpresaEMP_EMAIL: TStringField
      DisplayLabel = 'e-mail'
      FieldName = 'EMP_EMAIL'
      Required = True
      Size = 50
    end
    object qyEmpresaEMP_HOMEPAGE: TStringField
      DisplayLabel = 'Home Page'
      FieldName = 'EMP_HOMEPAGE'
      Size = 50
    end
  end
  object updEmpresa: TSDUpdateSQL
    RefreshSQL.Strings = (
      
        'select EMP_CODIGO, EMP_RAZAO, EMP_CNPJ, EMP_IE, EMP_IMUN, EMP_LO' +
        'GRADOURO, EMP_NUMERO, EMP_COMPLEMENTO, EMP_BAIRRO, EMP_CIDADE, E' +
        'MP_UF, EMP_CEP, EMP_FONE, EMP_EMAIL, EMP_HOMEPAGE'#13#10'from empresa'
      'where'
      '  EMP_CODIGO = :OLD_EMP_CODIGO')
    ModifySQL.Strings = (
      'update empresa'
      'set'
      '  EMP_CODIGO = :EMP_CODIGO,'
      '  EMP_RAZAO = :EMP_RAZAO,'
      '  EMP_CNPJ = :EMP_CNPJ,'
      '  EMP_IE = :EMP_IE,'
      '  EMP_IMUN = :EMP_IMUN,'
      '  EMP_LOGRADOURO = :EMP_LOGRADOURO,'
      '  EMP_NUMERO = :EMP_NUMERO,'
      '  EMP_COMPLEMENTO = :EMP_COMPLEMENTO,'
      '  EMP_BAIRRO = :EMP_BAIRRO,'
      '  EMP_CIDADE = :EMP_CIDADE,'
      '  EMP_UF = :EMP_UF,'
      '  EMP_CEP = :EMP_CEP,'
      '  EMP_FONE = :EMP_FONE,'
      '  EMP_EMAIL = :EMP_EMAIL,'
      '  EMP_HOMEPAGE = :EMP_HOMEPAGE'
      'where'
      '  EMP_CODIGO = :OLD_EMP_CODIGO')
    InsertSQL.Strings = (
      'insert into empresa'
      
        '  (EMP_CODIGO, EMP_RAZAO, EMP_CNPJ, EMP_IE, EMP_IMUN, EMP_LOGRAD' +
        'OURO, EMP_NUMERO, EMP_COMPLEMENTO, EMP_BAIRRO, EMP_CIDADE, EMP_U' +
        'F, EMP_CEP, EMP_FONE, EMP_EMAIL, EMP_HOMEPAGE)'
      'values'
      
        '  (:EMP_CODIGO, :EMP_RAZAO, :EMP_CNPJ, :EMP_IE, :EMP_IMUN, :EMP_' +
        'LOGRADOURO, :EMP_NUMERO, :EMP_COMPLEMENTO, :EMP_BAIRRO, :EMP_CID' +
        'ADE, :EMP_UF, :EMP_CEP, :EMP_FONE, :EMP_EMAIL, :EMP_HOMEPAGE)')
    DeleteSQL.Strings = (
      'delete from empresa'
      'where'
      '  EMP_CODIGO = :OLD_EMP_CODIGO')
    Left = 416
    Top = 16
  end
  object qyConfig: TSDQuery
    DatabaseName = 'config'
    Options = []
    SessionName = 'SessaoConfig_3'
    SQL.Strings = (
      'select'
      'cfg_codigo, cfg_codcidadepadrao, cfg_versao'
      'from'
      'config')
    UpdateObject = updConfig
    Left = 56
    Top = 96
    object qyConfigCFG_CODIGO: TIntegerField
      FieldName = 'CFG_CODIGO'
      Required = True
    end
    object qyConfigCFG_CODCIDADEPADRAO: TIntegerField
      FieldName = 'CFG_CODCIDADEPADRAO'
      Required = True
    end
    object qyConfigCFG_VERSAO: TStringField
      FieldName = 'CFG_VERSAO'
      Required = True
      Size = 10
    end
  end
  object updConfig: TSDUpdateSQL
    Left = 144
    Top = 96
  end
  object SessaoConfig: TSDSession
    Active = True
    AutoSessionName = True
    Left = 104
    Top = 16
  end
end
