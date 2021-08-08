inherited frmDetCaixa: TfrmDetCaixa
  Caption = 'Detalhes do caixa'
  ClientHeight = 672
  ClientWidth = 999
  OnActivate = FormActivate
  OnKeyPress = FormKeyPress
  ExplicitLeft = -217
  ExplicitTop = -254
  ExplicitWidth = 1005
  ExplicitHeight = 700
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel [0]
    Left = 8
    Top = 112
    Width = 74
    Height = 13
    CustomHint = BalloonHint1
    Caption = 'Movimenta'#231#245'es'
  end
  object Label13: TLabel [1]
    Left = 484
    Top = 112
    Width = 150
    Height = 13
    CustomHint = BalloonHint1
    Caption = 'Produtos da venda selecionada'
  end
  object Label14: TLabel [2]
    Left = 484
    Top = 382
    Width = 238
    Height = 13
    CustomHint = BalloonHint1
    Caption = 'Resumo das vendas (Total de produtos vendidos)'
  end
  inherited btFechar: TBitBtn
    Left = 886
    Top = 639
    ExplicitLeft = 794
    ExplicitTop = 279
  end
  object Panel1: TPanel [4]
    Left = 0
    Top = 0
    Width = 999
    Height = 104
    CustomHint = BalloonHint1
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    ExplicitWidth = 903
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 27
      Height = 13
      CustomHint = BalloonHint1
      Caption = 'Caixa'
      FocusControl = dbCaixa
    end
    object Label2: TLabel
      Left = 287
      Top = 8
      Width = 24
      Height = 13
      CustomHint = BalloonHint1
      Caption = 'Local'
      FocusControl = dbLocal
    end
    object Label3: TLabel
      Left = 566
      Top = 8
      Width = 23
      Height = 13
      CustomHint = BalloonHint1
      Caption = 'Data'
      FocusControl = dbData
    end
    object Label5: TLabel
      Left = 8
      Top = 54
      Width = 74
      Height = 13
      CustomHint = BalloonHint1
      Caption = 'Vlr. Troco inicial'
    end
    object Label6: TLabel
      Left = 119
      Top = 54
      Width = 65
      Height = 13
      CustomHint = BalloonHint1
      Caption = 'Vlr. Retiradas'
    end
    object Label7: TLabel
      Left = 230
      Top = 54
      Width = 51
      Height = 13
      CustomHint = BalloonHint1
      Caption = 'Vlr. Trocos'
    end
    object Label8: TLabel
      Left = 341
      Top = 54
      Width = 82
      Height = 13
      CustomHint = BalloonHint1
      Caption = 'Vlr. dos produtos'
    end
    object Label9: TLabel
      Left = 452
      Top = 54
      Width = 84
      Height = 13
      CustomHint = BalloonHint1
      Caption = 'Vlr. total do caixa'
    end
    object Label10: TLabel
      Left = 563
      Top = 54
      Width = 76
      Height = 13
      CustomHint = BalloonHint1
      Caption = 'Vlr. fechamento'
    end
    object Label11: TLabel
      Left = 674
      Top = 54
      Width = 64
      Height = 13
      CustomHint = BalloonHint1
      Caption = 'Vlr. diferen'#231'a'
    end
    object Label12: TLabel
      Left = 785
      Top = 54
      Width = 71
      Height = 13
      CustomHint = BalloonHint1
      Caption = 'Vlr. lucro bruto'
    end
    object dbCaixa: TDBEdit
      Left = 8
      Top = 27
      Width = 273
      Height = 21
      CustomHint = BalloonHint1
      TabStop = False
      Color = clBtnFace
      DataField = 'CAI_NOME'
      DataSource = dsCaixaTot
      ReadOnly = True
      TabOrder = 0
    end
    object dbLocal: TDBEdit
      Left = 287
      Top = 27
      Width = 273
      Height = 21
      CustomHint = BalloonHint1
      TabStop = False
      Color = clBtnFace
      DataField = 'LOC_DESCRICAO'
      DataSource = dsCaixaTot
      ReadOnly = True
      TabOrder = 1
    end
    object dbData: TDBEdit
      Left = 566
      Top = 27
      Width = 134
      Height = 21
      CustomHint = BalloonHint1
      TabStop = False
      Color = clBtnFace
      DataField = 'CXT_DATA'
      DataSource = dsCaixaTot
      ReadOnly = True
      TabOrder = 2
    end
    object dbTrocoInic: TDBEdit
      Left = 8
      Top = 73
      Width = 105
      Height = 21
      Hint = 'Troco inicial'
      CustomHint = BalloonHint1
      TabStop = False
      Color = clBtnFace
      DataField = 'CXT_TROCOINIC'
      DataSource = dsCaixaTot
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 3
    end
    object dbRetiradas: TDBEdit
      Left = 119
      Top = 73
      Width = 105
      Height = 21
      Hint = 'Valor total das retiradas'
      CustomHint = BalloonHint1
      TabStop = False
      Color = clBtnFace
      DataField = 'CXT_TOTRETIR'
      DataSource = dsCaixaTot
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 4
    end
    object dbTrocos: TDBEdit
      Left = 230
      Top = 73
      Width = 105
      Height = 21
      Hint = 'Valor total dos tickets no caixa'
      CustomHint = BalloonHint1
      TabStop = False
      Color = clBtnFace
      DataField = 'CXT_VLRTROCOS'
      DataSource = dsCaixaTot
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 5
    end
    object dbTotProd: TDBEdit
      Left = 341
      Top = 73
      Width = 105
      Height = 21
      Hint = 'Valor total em aberto'
      CustomHint = BalloonHint1
      TabStop = False
      Color = clBtnFace
      DataField = 'CXT_TOTALVEND'
      DataSource = dsCaixaTot
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 6
    end
    object dbTotCaixa: TDBEdit
      Left = 452
      Top = 73
      Width = 105
      Height = 21
      CustomHint = BalloonHint1
      TabStop = False
      Color = clBtnFace
      DataField = 'CXT_VLRTOTAL'
      DataSource = dsCaixaTot
      ReadOnly = True
      TabOrder = 7
    end
    object dbFechamento: TDBEdit
      Left = 563
      Top = 73
      Width = 105
      Height = 21
      CustomHint = BalloonHint1
      TabStop = False
      Color = clBtnFace
      DataField = 'CXT_VLRFECHAMENTO'
      DataSource = dsCaixaTot
      ReadOnly = True
      TabOrder = 8
    end
    object DBCheckBox1: TDBCheckBox
      Left = 706
      Top = 27
      Width = 86
      Height = 17
      CustomHint = BalloonHint1
      TabStop = False
      Caption = 'Caixa fechado'
      DataField = 'CXT_STATUS'
      DataSource = dsCaixaTot
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 9
      ValueChecked = 'F'
      ValueUnchecked = 'A'
    end
    object dbDiferenca: TDBEdit
      Left = 674
      Top = 73
      Width = 105
      Height = 21
      CustomHint = BalloonHint1
      TabStop = False
      Color = clBtnFace
      DataField = 'CXT_VLRDIFERENCA'
      DataSource = dsCaixaTot
      ReadOnly = True
      TabOrder = 10
    end
    object dbLucro: TDBEdit
      Left = 785
      Top = 73
      Width = 110
      Height = 21
      CustomHint = BalloonHint1
      TabStop = False
      Color = clBtnFace
      DataField = 'CXT_VLRLUCRO'
      DataSource = dsCaixaTot
      ReadOnly = True
      TabOrder = 11
    end
  end
  object JvDBGrid1: TJvDBGrid [5]
    Left = 8
    Top = 131
    Width = 470
    Height = 533
    CustomHint = BalloonHint1
    TabStop = False
    DataSource = dsMovHist
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    AlternateRowColor = clMoneyGreen
    ScrollBars = ssVertical
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 17
    TitleRowHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'MVH_CODIGO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MVH_TOTAL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MVH_PAGO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MVH_TROCO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MVH_TRANSACAO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MVH_DTHR'
        Visible = True
      end>
  end
  object GridItensVend: TJvDBGrid [6]
    Left = 484
    Top = 131
    Width = 507
    Height = 245
    CustomHint = BalloonHint1
    TabStop = False
    DataSource = dsVendas
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    AlternateRowColor = clMoneyGreen
    ScrollBars = ssVertical
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 17
    TitleRowHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'PRE_CODIGO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRE_DESCRICAO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ITV_QUANTIDADE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ITV_UNITARIO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ITV_TOTAL'
        Visible = True
      end>
  end
  object JvDBGrid2: TJvDBGrid [7]
    Left = 484
    Top = 401
    Width = 507
    Height = 263
    CustomHint = BalloonHint1
    TabStop = False
    DataSource = dsItensVend
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    AlternateRowColor = clMoneyGreen
    ScrollBars = ssVertical
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 17
    TitleRowHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'PRE_CODIGO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRE_DESCRICAO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUM'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ITV_UNITARIO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUM_1'
        Visible = True
      end>
  end
  inherited BalloonHint1: TBalloonHint
    Left = 856
    Top = 16
  end
  object dsCaixaTot: TDataSource
    DataSet = dmCadastros.qyCaixaTot
    Left = 144
    Top = 8
  end
  object dsMovHist: TDataSource
    DataSet = dmCadastros.qyMovHist
    OnDataChange = dsMovHistDataChange
    Left = 48
    Top = 176
  end
  object dsVendas: TDataSource
    DataSet = dmConsultas.qyItensVenda
    Left = 592
    Top = 168
  end
  object dsItensVend: TDataSource
    DataSet = dmConsultas.qyProdutosVend
    Left = 576
    Top = 480
  end
end
