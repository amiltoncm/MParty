inherited frmConsCaixaGeral: TfrmConsCaixaGeral
  Caption = 'Consulta - Caixa Geral'
  ClientHeight = 559
  ClientWidth = 1127
  OnActivate = FormActivate
  OnKeyPress = FormKeyPress
  ExplicitWidth = 1133
  ExplicitHeight = 587
  PixelsPerInch = 96
  TextHeight = 13
  inherited btFechar: TBitBtn
    Left = 1014
    Top = 526
    ExplicitLeft = 1014
    ExplicitTop = 526
  end
  object DBGrid1: TDBGrid [1]
    Left = 8
    Top = 8
    Width = 1111
    Height = 512
    CustomHint = BalloonHint1
    TabStop = False
    DataSource = dsCaixas
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'CXT_DATA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CAI_NOME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOC_DESCRICAO'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CXT_TROCOINIC'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CXT_VLRTROCOS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CXT_TOTRETIR'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CXT_TOTALVEND'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CXT_VLRTOTAL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CXT_VLRFECHAMENTO'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CXT_VLRDIFERENCA'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CXT_VLRLUCRO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CXT_STATUS'
        Width = 64
        Visible = True
      end>
  end
  object btImprimir: TBitBtn [2]
    Left = 903
    Top = 526
    Width = 105
    Height = 25
    Hint = 'Imprime relat'#243'rio!'
    CustomHint = BalloonHint1
    Caption = '&Imprimir'
    Glyph.Data = {
      12020000424D1202000000000000120100002800000010000000100000000100
      08000000000000010000120B0000120B0000370000003700000000000000FFFF
      FF00FF00FF00F4F4E900EEEDDA00E9E8D000E6E5C900E4E3C500D6D4A700C1BF
      7A00A29F3D009C99380069660D005E5B0500706D1300716E15007B781D00827F
      23009D992B00858225008E8B2D008B882F00A4A13B00A09C3A009F9C3A00A09D
      3B008784320094913700A6A3400089863500ABA84A00B1AF6100BAB76A00BDBB
      7200BDBB7300BFBD7700C1BF7B00C2C07D00C4C28200C7C58700C3C18700C9C7
      8D00CBC99000DFDEBA00DEDDBA00E0DFBD00E2E1C1005F5D050068660D00B2B0
      5A00D1D0A200EDEDD900F9F9F300FCFCF900FFFFFF0002020202020202020202
      02020202020202020202020202020202020202020202020C0C0C0C0C0C0E0E0E
      0C0D0D0D2F0202110808080808222222112121211A30020B0B0B0B0B0B181818
      0B242323230F0202102B20201D1D1D1D1D082525251002021507070707070707
      072E2626261302021B0505050505050505052A27271402021928040404040404
      04042D291F170202341C0A0A0A0A0A0A0A0A0A0A1C3402020202120106060606
      06060112020202020202160133333232323201160202020202021E0103030303
      0303011E020202020202310135352C2C2C2C0131020202020202200101010101
      01010120020202020202090909090909090909090202}
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = btImprimirClick
  end
  object btDetalhes: TBitBtn [3]
    Left = 8
    Top = 526
    Width = 105
    Height = 25
    Hint = 'Detalhes do caixa'
    CustomHint = BalloonHint1
    Caption = '&Detalhes'
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
      C2A6A4C2A6A4C2A6A4C2A6A4C2A6A4C2A6A4C2A6A4C2A6A4C2A6A4C2A6A4C2A6
      A4C2A6A4FF00FFFF00FFFF00FFFF00FFC2A6A4FEFCFBFEFCFBFEFCFBFEFCFBFE
      FCFBFEFCFBFEFCFBFEFCFBFEFCFBFEFCFBC2A6A4FF00FFFF00FFFF00FFFF00FF
      C2A6A4FEFCFB993300993300993300993300993300993300993300993300FEFC
      FBC2A6A4FF00FFFF00FFFF00FFFF00FFC2A6A4FEFBF7993300FEFEFEFEFEFEFE
      FEFE8EA4FDB8C6FDFEFEFE993300FEFBF7C2A6A4FF00FFFF00FFFF00FFFF00FF
      C2A6A4FEF9F4993300FEFEFEFAFBFE7E98FC0335FB597AFCFEFEFE993300FEF9
      F4C2A6A4FF00FFFF00FFFF00FFFF00FFC2A6A4FEF7F0993300D6DEFE4368FC03
      35FB4066FC0436FBD9E0FE993300FEF7F0C2A6A4FF00FFFF00FFFF00FFFF00FF
      C2A6A4FEF5EC9933005274FC1442FBBCC9FDEFF2FE1A47FB4F72FC973304FEF5
      ECC2A6A4FF00FFFF00FFFF00FFFF00FFC2A6A4FEF3E9993300E4EAFED9E0FEFE
      FEFEFEFEFE98ACFD0335FB643459FEF3E9C2A6A4FF00FFFF00FFFF00FFFF00FF
      C2A6A4FFF1E5993300FEFEFEFEFEFEFEFEFEFEFEFEFEFEFE5677FC0335FBFFF1
      E5C2A6A4FF00FFFF00FFFF00FFFF00FFC2A6A4FFF0E299330099330099330099
      33009933009933008F33112235C80335FBC2A6A4FF00FFFF00FFFF00FFFF00FF
      C2A6A4FFEEDEFFEEDEFFEEDEFFEEDEFFEEDEFFEEDEC5B5A9C3B4A8C2B3A70335
      FB0335FB0335FBFF00FFFF00FFFF00FFC2A6A4FFECDAFFECDAFFECDAFFECDAFF
      ECDAFFECDAB0A296B0A296B0A296B0A296C2A6A40335FBFF00FFFF00FFFF00FF
      C2A6A4FFEAD7FFEAD7FFEAD7FFEAD7FFEAD7C9B9ACFBF8F4FBF8F4E6DAD9C2A6
      A4FF00FFFF00FFFF00FFFF00FFFF00FFC2A6A4FFE8D3FFE8D3FFE8D3FFE8D3FF
      E8D3C9B9ACFBF8F4DFCEC7C2A6A4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      C2A6A4FFE6D0FFE6D0FFE6D0FFE6D0FFE6D0C9B9ACDFCEC7C2A6A4FF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFC2A6A4C2A6A4C2A6A4C2A6A4C2A6A4C2
      A6A4C2A6A4C2A6A4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    TabOrder = 3
    OnClick = btDetalhesClick
  end
  inherited BalloonHint1: TBalloonHint
    Left = 80
    Top = 24
  end
  object dsCaixas: TDataSource
    DataSet = dmCadastros.qyCaixaTot
    Left = 152
    Top = 32
  end
  object PopupMenu1: TPopupMenu
    Images = frmPrincipal.Imagens
    Left = 120
    Top = 344
    object Detalhes1: TMenuItem
      Caption = 'Detalhes'
      Hint = 'Detalhes do caixa selecionado'
      ImageIndex = 119
      OnClick = Detalhes1Click
    end
  end
end