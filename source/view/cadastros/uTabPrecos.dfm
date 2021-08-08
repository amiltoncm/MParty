inherited frmTabPrecos: TfrmTabPrecos
  BorderIcons = [biSystemMenu]
  Caption = 'Tabela de Pre'#231'os'
  ClientHeight = 600
  ClientWidth = 396
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  ExplicitTop = -72
  ExplicitWidth = 402
  ExplicitHeight = 628
  PixelsPerInch = 96
  TextHeight = 13
  inherited btFechar: TBitBtn
    Left = 283
    Top = 543
    ExplicitLeft = 283
    ExplicitTop = 543
  end
  object DBGrid1: TDBGrid [1]
    Left = 8
    Top = 8
    Width = 379
    Height = 529
    CustomHint = BalloonHint1
    DataSource = dsTabPrecos
    PopupMenu = PopupMenu1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Color = clBtnFace
        Expanded = False
        FieldName = 'PRE_CODIGO'
        ReadOnly = True
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRE_DESCRICAO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRE_PRECO'
        Visible = True
      end>
  end
  object btImprimir: TBitBtn [2]
    Left = 8
    Top = 543
    Width = 95
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
  object pnEstoque: TPanel [3]
    Left = 0
    Top = 574
    Width = 396
    Height = 26
    CustomHint = BalloonHint1
    Align = alBottom
    BevelInner = bvLowered
    Caption = 'pnEstoque'
    TabOrder = 3
  end
  inherited BalloonHint1: TBalloonHint
    Left = 96
    Top = 48
  end
  object dsTabPrecos: TDataSource
    DataSet = dmCadastros.qyPrecos
    OnDataChange = dsTabPrecosDataChange
    Left = 40
    Top = 48
  end
  object PopupMenu1: TPopupMenu
    Left = 40
    Top = 112
    object Controledeestoque1: TMenuItem
      Caption = 'Controle de estoque (Qtde. Inicial)'
      OnClick = Controledeestoque1Click
    end
    object Adicionarquantidadeaocontrole1: TMenuItem
      Caption = 'Adicionar quantidade ao controle de estoque'
      OnClick = Adicionarquantidadeaocontrole1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Excluirdocontroledeestoque1: TMenuItem
      Caption = 'Excluir do controle de estoque'
      OnClick = Excluirdocontroledeestoque1Click
    end
  end
  object dsEstoque: TDataSource
    DataSet = dmCadastros.qyEstoque
    OnDataChange = dsEstoqueDataChange
    Left = 40
    Top = 176
  end
end
