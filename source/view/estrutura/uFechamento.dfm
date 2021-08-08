inherited frmFechamento: TfrmFechamento
  Caption = 'Fechamento de caixa'
  ClientHeight = 193
  ClientWidth = 525
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  ExplicitWidth = 531
  ExplicitHeight = 222
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 8
    Top = 8
    Width = 27
    Height = 13
    CustomHint = BalloonHint1
    Caption = 'Caixa'
    FocusControl = dbCaixa
  end
  object Label2: TLabel [1]
    Left = 268
    Top = 8
    Width = 24
    Height = 13
    CustomHint = BalloonHint1
    Caption = 'Local'
    FocusControl = dbLocal
  end
  object Label3: TLabel [2]
    Left = 8
    Top = 56
    Width = 49
    Height = 13
    CustomHint = BalloonHint1
    Caption = 'Troco inic.'
    FocusControl = dbTrocoInic
  end
  object Label4: TLabel [3]
    Left = 111
    Top = 56
    Width = 66
    Height = 13
    CustomHint = BalloonHint1
    Caption = 'Tot. retiradas'
    FocusControl = dbTotRetir
  end
  object Label5: TLabel [4]
    Left = 214
    Top = 56
    Width = 32
    Height = 13
    CustomHint = BalloonHint1
    Caption = 'Trocos'
    FocusControl = dbTrocos
  end
  object Label6: TLabel [5]
    Left = 317
    Top = 56
    Width = 65
    Height = 13
    CustomHint = BalloonHint1
    Caption = 'Total vendido'
    FocusControl = dbTotVend
  end
  object Label7: TLabel [6]
    Left = 420
    Top = 56
    Width = 49
    Height = 13
    CustomHint = BalloonHint1
    Caption = 'Valor total'
    FocusControl = dbVlrTotal
  end
  object Label8: TLabel [7]
    Left = 8
    Top = 104
    Width = 78
    Height = 13
    CustomHint = BalloonHint1
    Caption = 'Vlr. Fechamento'
    FocusControl = dbVlrFechamento
  end
  object Label9: TLabel [8]
    Left = 111
    Top = 104
    Width = 65
    Height = 13
    CustomHint = BalloonHint1
    Caption = 'Vlr. Diferen'#231'a'
    FocusControl = dbVlrDif
  end
  object Label10: TLabel [9]
    Left = 214
    Top = 104
    Width = 45
    Height = 13
    CustomHint = BalloonHint1
    Caption = 'Vlr. Lucro'
    FocusControl = dbVlrLucro
  end
  inherited btFechar: TBitBtn
    Left = 412
    Top = 160
    TabOrder = 2
    ExplicitLeft = 412
    ExplicitTop = 160
  end
  object dbCaixa: TDBEdit [11]
    Left = 8
    Top = 23
    Width = 254
    Height = 21
    Hint = 'Caixa'
    CustomHint = BalloonHint1
    TabStop = False
    Color = clBtnFace
    DataField = 'CAI_NOME'
    DataSource = dsFechamento
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 3
  end
  object dbLocal: TDBEdit [12]
    Left = 268
    Top = 23
    Width = 249
    Height = 21
    Hint = 'Local'
    CustomHint = BalloonHint1
    TabStop = False
    Color = clBtnFace
    DataField = 'LOC_DESCRICAO'
    DataSource = dsFechamento
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 4
  end
  object dbTrocoInic: TDBEdit [13]
    Left = 8
    Top = 72
    Width = 97
    Height = 21
    Hint = 'Troco inicial'
    CustomHint = BalloonHint1
    TabStop = False
    Color = clBtnFace
    DataField = 'CXT_TROCOINIC'
    DataSource = dsFechamento
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 5
  end
  object dbTotRetir: TDBEdit [14]
    Left = 111
    Top = 72
    Width = 97
    Height = 21
    Hint = 'Total de retiradas'
    CustomHint = BalloonHint1
    TabStop = False
    Color = clBtnFace
    DataField = 'CXT_TOTRETIR'
    DataSource = dsFechamento
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 6
  end
  object dbTrocos: TDBEdit [15]
    Left = 214
    Top = 72
    Width = 97
    Height = 21
    Hint = 'Total de trocos enviados'
    CustomHint = BalloonHint1
    TabStop = False
    Color = clBtnFace
    DataField = 'CXT_VLRTROCOS'
    DataSource = dsFechamento
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 7
  end
  object dbTotVend: TDBEdit [16]
    Left = 317
    Top = 72
    Width = 97
    Height = 21
    Hint = 'Valor total vendido'
    CustomHint = BalloonHint1
    TabStop = False
    Color = clBtnFace
    DataField = 'CXT_TOTALVEND'
    DataSource = dsFechamento
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 8
  end
  object dbVlrTotal: TDBEdit [17]
    Left = 420
    Top = 72
    Width = 97
    Height = 21
    Hint = 'Valor total do caixa'
    CustomHint = BalloonHint1
    TabStop = False
    Color = clBtnFace
    DataField = 'CXT_VLRTOTAL'
    DataSource = dsFechamento
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 9
  end
  object dbVlrFechamento: TDBEdit [18]
    Left = 8
    Top = 147
    Width = 97
    Height = 21
    Hint = 'Valor do fechamento'
    CustomHint = BalloonHint1
    Color = clMoneyGreen
    DataField = 'CXT_VLRFECHAMENTO'
    DataSource = dsFechamento
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    Visible = False
    OnExit = dbVlrFechamentoExit
    OnKeyPress = dbVlrFechamentoKeyPress
  end
  object dbVlrDif: TDBEdit [19]
    Left = 111
    Top = 120
    Width = 97
    Height = 21
    CustomHint = BalloonHint1
    TabStop = False
    Color = clBtnFace
    DataField = 'CXT_VLRDIFERENCA'
    DataSource = dsFechamento
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 10
  end
  object dbVlrLucro: TDBEdit [20]
    Left = 214
    Top = 120
    Width = 97
    Height = 21
    CustomHint = BalloonHint1
    TabStop = False
    Color = clBtnFace
    DataField = 'CXT_VLRLUCRO'
    DataSource = dsFechamento
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 11
  end
  object btGravar: TBitBtn [21]
    Left = 297
    Top = 160
    Width = 105
    Height = 25
    Hint = 'Executa fechamento de caixa'
    CustomHint = BalloonHint1
    ParentCustomHint = False
    Caption = 'Gravar'
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FF0955A10857A60557AA0655A70954A00954A0FF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0872DD0362C3006CDB0877E711
      7DEA0877E70069DD005DC70654A50654A5FF00FFFF00FFFF00FFFF00FFFF00FF
      0F6BC90872DD3E99F591C4F9D6E9FDEEF7FFE4F1FFB0D4FB59A5F50570E5035A
      B70B5095FF00FFFF00FFFF00FF1278E0127CE870B4F9F6FAFEFFFFFFEEF6FDD3
      E6FBE2EEFDFFFFFFFFFFFFAED2FA0E78ED025AB60653A2FF00FFFF00FF1278E0
      6DB2F9FEFEFFF4F9FE77B6F63391F0B5D5F91B7FEA4693EEC9E0FAFFFFFFB0D5
      FA0970E60653A2FF00FF0B70D53695F4E8F3FEFFFFFF4FA3F61F88F2D4E7FCFF
      FFFF489BEF0065E60E74E8C9E1FAFFFFFF58A5F5005EC70858AB137AE371B5FB
      FFFFFFB2D7FC469FF7DEEEFDFDFEFEE0EEFDA1CCF80173E9006AE74294EDFFFF
      FFB3D7FB016BDE0858AB1F85ECA2CFFDFFFFFF71B7FDACD4FDFAFCFF66AFF83F
      9AF5E2EFFD2D8EF00075EB0575E9E2EEFCE6F3FF0E7BE9065AB02F8FF1B7DAFD
      FFFFFF6BB4FF3C9DFE4FA5FB1D8AF81484F5A0CDFB84BDF8067AEF0374EBD4E8
      FBF0F8FF1A82EC055CB53693F0B8DAFEFFFFFF8EC6FF2391FF2E95FE2B93FC21
      8CF92D92F79ACAFB1D86F21D86F0F3F8FED9EBFE117DE9095CB22689EDAFD6FD
      FFFFFFE1F0FF3499FF2F96FF3399FF2E94FD218CF950A4F9419BF77DBBF8FFFF
      FF99C9FA0773E10958ABFF00FF3994F0F1F8FFFFFFFFADD6FF3499FF2592FF28
      93FF238FFC1788FA6FB4FAF4FAFFF5FAFE49A0F7076ACEFF00FFFF00FF3994F0
      CDE6FFF6FAFFFFFFFFE0EFFF8DC6FF6EB6FE79BBFFB6DAFEFFFFFFFFFFFF78B9
      F9137BE6076ACEFF00FFFF00FFFF00FF64ACF6D4EAFFF9FCFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFE7F3FE77B8FA1D85ED0D6DD0FF00FFFF00FFFF00FFFF00FF
      FF00FF459AF0A7D2FCD8ECFFE2F1FFE4F1FED1E7FE9DCDFD4DA2F7177FE8177F
      E8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF3B94F061ABF665
      ADF7489EF42286EC127AE4FF00FFFF00FFFF00FFFF00FFFF00FF}
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = btGravarClick
  end
  object edVlrFechamento: TEdit [22]
    Left = 8
    Top = 120
    Width = 97
    Height = 21
    CustomHint = BalloonHint1
    Alignment = taRightJustify
    TabOrder = 12
    Text = 'edVlrFechamento'
    OnExit = edVlrFechamentoExit
    OnKeyPress = edVlrFechamentoKeyPress
  end
  inherited BalloonHint1: TBalloonHint
    Left = 168
    Top = 0
  end
  object dsFechamento: TDataSource
    DataSet = dmCadastros.qyCaixaTot
    Left = 96
    Top = 8
  end
end
