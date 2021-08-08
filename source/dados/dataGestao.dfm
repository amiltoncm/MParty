inherited dmGestao: TdmGestao
  OldCreateOrder = True
  inherited database: TSDDatabase
    DatabaseName = 'Gestao'
    SessionName = 'SessaoGestao_5'
  end
  inherited QGeraCodigo: TSDQuery
    SessionName = 'SessaoGestao_5'
  end
  inherited QTemp: TSDQuery
    SessionName = 'SessaoGestao_5'
  end
  object SessaoGestao: TSDSession
    Active = True
    AutoSessionName = True
    Left = 104
    Top = 16
  end
end
