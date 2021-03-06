inherited frmCadEstoque: TfrmCadEstoque
  Caption = 'Estoque'
  ClientHeight = 119
  ExplicitLeft = 8
  ExplicitHeight = 147
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel [0]
    Left = 8
    Top = 71
    Width = 39
    Height = 13
    CustomHint = BalloonHint1
    Caption = 'Estoque'
  end
  inherited btFechar: TBitBtn
    Left = 490
    Top = 86
    TabOrder = 2
    ExplicitLeft = 490
    ExplicitTop = 86
  end
  object Panel1: TPanel [2]
    Left = 0
    Top = 0
    Width = 603
    Height = 65
    CustomHint = BalloonHint1
    Align = alTop
    BevelInner = bvLowered
    Color = clInfoBk
    ParentBackground = False
    TabOrder = 3
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 33
      Height = 13
      CustomHint = BalloonHint1
      Caption = 'C'#243'digo'
    end
    object Label2: TLabel
      Left = 96
      Top = 8
      Width = 38
      Height = 13
      CustomHint = BalloonHint1
      Caption = 'Produto'
    end
    object Label3: TLabel
      Left = 490
      Top = 8
      Width = 27
      Height = 13
      CustomHint = BalloonHint1
      Caption = 'Pre'#231'o'
    end
    object dbCodigo: TDBEdit
      Left = 8
      Top = 27
      Width = 82
      Height = 21
      CustomHint = BalloonHint1
      TabStop = False
      Color = clBtnFace
      DataField = 'PRE_CODIGO'
      DataSource = dsPrecos
      ReadOnly = True
      TabOrder = 0
    end
    object dbProduto: TDBEdit
      Left = 96
      Top = 27
      Width = 388
      Height = 21
      CustomHint = BalloonHint1
      TabStop = False
      Color = clBtnFace
      DataField = 'PRE_DESCRICAO'
      DataSource = dsPrecos
      ReadOnly = True
      TabOrder = 1
    end
    object dbPreco: TDBEdit
      Left = 490
      Top = 27
      Width = 105
      Height = 21
      CustomHint = BalloonHint1
      TabStop = False
      Color = clBtnFace
      DataField = 'PRE_PRECO'
      DataSource = dsPrecos
      ReadOnly = True
      TabOrder = 2
    end
  end
  object dbEstoque: TDBEdit [3]
    Left = 8
    Top = 90
    Width = 105
    Height = 21
    Hint = 'Digite a quantidade inicial'
    CustomHint = BalloonHint1
    DataField = 'EST_QUANTIDADE'
    DataSource = dsMovimento
    TabOrder = 0
  end
  object btGravar: TBitBtn [4]
    Left = 379
    Top = 86
    Width = 105
    Height = 25
    Hint = 'Gravar entrada no estoque'
    CustomHint = BalloonHint1
    Caption = '&Gravar'
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF000955A1000857A6000557AA000655A7000954
      A0000954A000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF000872DD000362C300006CDB000877E700117DEA000877E7000069
      DD00005DC7000654A5000654A500FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF000F6BC9000872DD003E99F50091C4F900D6E9FD00EEF7FF00E4F1FF00B0D4
      FB0059A5F5000570E500035AB7000B509500FF00FF00FF00FF00FF00FF001278
      E000127CE80070B4F900F6FAFE00FFFFFF00EEF6FD00D3E6FB00E2EEFD00FFFF
      FF00FFFFFF00AED2FA000E78ED00025AB6000653A200FF00FF00FF00FF001278
      E0006DB2F900FEFEFF00F4F9FE0077B6F6003391F000B5D5F9001B7FEA004693
      EE00C9E0FA00FFFFFF00B0D5FA000970E6000653A200FF00FF000B70D5003695
      F400E8F3FE00FFFFFF004FA3F6001F88F200D4E7FC00FFFFFF00489BEF000065
      E6000E74E800C9E1FA00FFFFFF0058A5F500005EC7000858AB00137AE30071B5
      FB00FFFFFF00B2D7FC00469FF700DEEEFD00FDFEFE00E0EEFD00A1CCF8000173
      E900006AE7004294ED00FFFFFF00B3D7FB00016BDE000858AB001F85EC00A2CF
      FD00FFFFFF0071B7FD00ACD4FD00FAFCFF0066AFF8003F9AF500E2EFFD002D8E
      F0000075EB000575E900E2EEFC00E6F3FF000E7BE900065AB0002F8FF100B7DA
      FD00FFFFFF006BB4FF003C9DFE004FA5FB001D8AF8001484F500A0CDFB0084BD
      F800067AEF000374EB00D4E8FB00F0F8FF001A82EC00055CB5003693F000B8DA
      FE00FFFFFF008EC6FF002391FF002E95FE002B93FC00218CF9002D92F7009ACA
      FB001D86F2001D86F000F3F8FE00D9EBFE00117DE900095CB2002689ED00AFD6
      FD00FFFFFF00E1F0FF003499FF002F96FF003399FF002E94FD00218CF90050A4
      F900419BF7007DBBF800FFFFFF0099C9FA000773E1000958AB00FF00FF003994
      F000F1F8FF00FFFFFF00ADD6FF003499FF002592FF002893FF00238FFC001788
      FA006FB4FA00F4FAFF00F5FAFE0049A0F700076ACE00FF00FF00FF00FF003994
      F000CDE6FF00F6FAFF00FFFFFF00E0EFFF008DC6FF006EB6FE0079BBFF00B6DA
      FE00FFFFFF00FFFFFF0078B9F900137BE600076ACE00FF00FF00FF00FF00FF00
      FF0064ACF600D4EAFF00F9FCFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00E7F3FE0077B8FA001D85ED000D6DD000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00459AF000A7D2FC00D8ECFF00E2F1FF00E4F1FE00D1E7FE009DCD
      FD004DA2F700177FE800177FE800FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF003B94F00061ABF60065ADF700489EF4002286
      EC00127AE400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    TabOrder = 1
    OnClick = btGravarClick
  end
  inherited BalloonHint1: TBalloonHint
    Left = 384
    Top = 8
  end
  inherited dsMovimento: TDataSource
    DataSet = dmCadastros.qyEstoque
    Left = 192
    Top = 8
  end
  object dsPrecos: TDataSource
    DataSet = dmCadastros.qyPrecos
    Left = 304
    Top = 32
  end
end
