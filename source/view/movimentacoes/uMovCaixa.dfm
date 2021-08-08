inherited frmMovCaixa: TfrmMovCaixa
  Caption = 'Movimenta'#231#227'o do caixa'
  ClientHeight = 614
  ClientWidth = 999
  OnActivate = FormActivate
  ExplicitWidth = 1005
  ExplicitHeight = 642
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel [0]
    Left = 0
    Top = 532
    Width = 999
    Height = 82
    CustomHint = BalloonHint1
    Align = alBottom
    BevelInner = bvLowered
    Color = clMoneyGreen
    ParentBackground = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    object Label4: TLabel
      Left = 8
      Top = 6
      Width = 97
      Height = 13
      CustomHint = BalloonHint1
      Caption = 'Totaliza'#231#227'o geral'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 111
      Top = 6
      Width = 74
      Height = 13
      CustomHint = BalloonHint1
      Caption = 'Vlr. Troco inicial'
    end
    object Label6: TLabel
      Left = 222
      Top = 6
      Width = 65
      Height = 13
      CustomHint = BalloonHint1
      Caption = 'Vlr. Retiradas'
    end
    object Label7: TLabel
      Left = 331
      Top = 6
      Width = 51
      Height = 13
      CustomHint = BalloonHint1
      Caption = 'Vlr. Trocos'
    end
    object Label8: TLabel
      Left = 441
      Top = 6
      Width = 82
      Height = 13
      CustomHint = BalloonHint1
      Caption = 'Vlr. dos produtos'
    end
    object Label9: TLabel
      Left = 551
      Top = 6
      Width = 84
      Height = 13
      CustomHint = BalloonHint1
      Caption = 'Vlr. total do caixa'
    end
    object Label10: TLabel
      Left = 661
      Top = 6
      Width = 76
      Height = 13
      CustomHint = BalloonHint1
      Caption = 'Vlr. fechamento'
    end
    object Label11: TLabel
      Left = 771
      Top = 6
      Width = 64
      Height = 13
      CustomHint = BalloonHint1
      Caption = 'Vlr. diferen'#231'a'
    end
    object Label12: TLabel
      Left = 881
      Top = 6
      Width = 71
      Height = 13
      CustomHint = BalloonHint1
      Caption = 'Vlr. lucro bruto'
    end
    object dbTrocoInic: TDBEdit
      Left = 111
      Top = 23
      Width = 105
      Height = 21
      Hint = 'Troco inicial'
      CustomHint = BalloonHint1
      TabStop = False
      DataField = 'CXT_TROCOINIC'
      DataSource = dsTotalizacao
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 0
    end
    object DBCheckBox1: TDBCheckBox
      Left = 8
      Top = 23
      Width = 86
      Height = 17
      CustomHint = BalloonHint1
      TabStop = False
      Caption = 'Caixa fechado'
      DataField = 'CXT_STATUS'
      DataSource = dsTotalizacao
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 1
      ValueChecked = 'F'
      ValueUnchecked = 'A'
    end
    object dbRetiradas: TDBEdit
      Left = 221
      Top = 23
      Width = 105
      Height = 21
      Hint = 'Valor total das retiradas'
      CustomHint = BalloonHint1
      TabStop = False
      DataField = 'CXT_TOTRETIR'
      DataSource = dsTotalizacao
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 2
    end
    object dbTrocos: TDBEdit
      Left = 331
      Top = 23
      Width = 105
      Height = 21
      Hint = 'Valor total dos tickets no caixa'
      CustomHint = BalloonHint1
      TabStop = False
      DataField = 'CXT_VLRTROCOS'
      DataSource = dsTotalizacao
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 3
    end
    object dbTotProd: TDBEdit
      Left = 441
      Top = 23
      Width = 105
      Height = 21
      Hint = 'Valor total em aberto'
      CustomHint = BalloonHint1
      TabStop = False
      DataField = 'CXT_TOTALVEND'
      DataSource = dsTotalizacao
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 4
    end
    object dbTotCaixa: TDBEdit
      Left = 551
      Top = 23
      Width = 105
      Height = 21
      CustomHint = BalloonHint1
      TabStop = False
      DataField = 'CXT_VLRTOTAL'
      DataSource = dsTotalizacao
      ReadOnly = True
      TabOrder = 5
    end
    object dbFechamento: TDBEdit
      Left = 661
      Top = 23
      Width = 105
      Height = 21
      CustomHint = BalloonHint1
      TabStop = False
      DataField = 'CXT_VLRFECHAMENTO'
      DataSource = dsTotalizacao
      ReadOnly = True
      TabOrder = 6
    end
    object dbDiferenca: TDBEdit
      Left = 771
      Top = 23
      Width = 105
      Height = 21
      CustomHint = BalloonHint1
      TabStop = False
      DataField = 'CXT_VLRDIFERENCA'
      DataSource = dsTotalizacao
      ReadOnly = True
      TabOrder = 7
    end
    object dbLucro: TDBEdit
      Left = 881
      Top = 23
      Width = 110
      Height = 21
      CustomHint = BalloonHint1
      TabStop = False
      DataField = 'CXT_VLRLUCRO'
      DataSource = dsTotalizacao
      ReadOnly = True
      TabOrder = 8
    end
    object btImprimir: TBitBtn
      Left = 771
      Top = 50
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
      TabOrder = 9
      OnClick = btImprimirClick
    end
  end
  inherited btFechar: TBitBtn
    Left = 886
    Top = 581
    ExplicitLeft = 886
    ExplicitTop = 581
  end
  object Panel1: TPanel [2]
    Left = 0
    Top = 0
    Width = 999
    Height = 57
    CustomHint = BalloonHint1
    Align = alTop
    BevelInner = bvLowered
    Color = clSkyBlue
    ParentBackground = False
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 27
      Height = 13
      CustomHint = BalloonHint1
      Caption = 'Caixa'
    end
    object sbFechamento: TSpeedButton
      Left = 961
      Top = 21
      Width = 30
      Height = 30
      Hint = 'Fechamento do caixa'
      CustomHint = BalloonHint1
      Flat = True
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FF93460F93460F93460F93460F93460F93460F93460FFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF93460F35F1FF38E9FF42E5FF5ED5DE53DEE893460FFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF93460FC3D3B4BDBE9AD4A565DE8E
        3AD3822A93460FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF93460FFDC382
        EDAA60E89643DF862CD8741093460FFF00FF0000000000000000000000000000
        00000000000000000000000000000000000000000000000000000000000000FF
        00FF93460F40C55A40A93EDFBE8AEFBB89EAB67F93460FFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF93460F3DD16C9FDBAAFFFFFFFFFFFFFFFFFF93460FFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF93460F93460F93460F93460F9346
        0F93460F93460FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FF93460F93460F93460F93460F93460F93460F93460FFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF93460F35F1FF38E9FF42E5FF5ED5DE53DEE893460FFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF93460FC3D3B4BDBE9AD4A565DE8E
        3AD3822A93460FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF93460FFDC382
        EDAA60E89643DF862CD8741093460FFF00FF0000000000000000000000000000
        00000000000000000000000000000000000000000000000000000000000000FF
        00FF93460F40C55A40A93EDFBE8AEFBB89EAB67F93460FFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF93460F3DD16C9FDBAAFFFFFFFFFFFFFFFFFF93460FFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF93460F93460F93460F93460F9346
        0F93460F93460FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FF93460F93460F93460F93460F93460F93460F93460FFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF93460F35F1FF38E9FF42E5FF5ED5DE53DEE893460FFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF93460FC3D3B4BDBE9AD4A565DE8E
        3AD3822A93460FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF93460FFDC382
        EDAA60E89643DF862CD8741093460FFF00FF0000000000000000000000000000
        00000000000000000000000000000000000000000000000000000000000000FF
        00FF93460F40C55A40A93EDFBE8AEFBB89EAB67F93460FFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF93460F3DD16C9FDBAAFFFFFFFFFFFFFFFFFF93460FFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF93460F93460F93460F93460F9346
        0F93460F93460FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      ParentShowHint = False
      ShowHint = True
      OnClick = sbFechamentoClick
    end
    object sbColetas: TSpeedButton
      Left = 768
      Top = 24
      Width = 30
      Height = 30
      Hint = 'Coletas'
      CustomHint = BalloonHint1
      Flat = True
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FF5E26176C2C136C2C135A2317FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FF064DB2064DB2064DB2064DB2FF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF6C2C136C2C13BD4C00C04A00C04A00BB49005A2317
        5A2317FF00FFFF00FF064DB2064DB20364E50363E60058E30053DE064DB2064D
        B2FF00FFFF00FFFF00FFFF00FFFF00FF8F4114C75B0AC45000BC4800C75B0AC9
        5F0EBD4C00C14800BC48005A2D1F0852B8157BEA1C83F0499DF00A6CE7257FEA
        4C97EE0D68E50056E3064DB2FF00FFFF00FFFF00FF8F4114D46C18C95F0ECC6D
        1EEAC097FFFBF8FFFFFFF7E2CCD47D33C546005054571280EF1B89F33799F297
        CBF8A5CEF7D8EAFCC2DEFAA5CEF7055DE20056E3064DB2FF00FFFF00FF8F4114
        D87220D47628FCEDDDFBF2E9DD995BD58641EBC6A3D476289E41061769C52CA1
        FF2390F3208BF248A0F3D9EEFE338CEE0162E5257FEA136EE60055E2064DB2FF
        00FF99420DDE8131E38F43F2CEABFFFFFFEAC097D98E4BD98E4BC15305C54600
        89562B208BF235A6FA2C99F4208BF21280EFBDE0FB2D8CEE0468E70468E70360
        E3015BE30058E20450BFAB4E0FE38F43E79C57FEFAF4FBEFE3E7B17EE9B583E7
        B17ECC6D1ECC4C005054572CA1FF3CADFB309EF7309EF76CB8F7D9EEFE89C4F7
        499DF00B6FE90769E60364E5015BE30352C7AB4E0FEB9A50EEA35EFEF2E5FEF8
        F3FEF8F3FEF8F3E9B583D88B43CF51006F5F5031A7FF42B6FF37A9FA35A3F780
        C6FAF6FCFF80C1F848A0F31077EB0C70E9086AE60363E60352C5AB4504EB9E59
        EF9C50F3C192FFFFFFE9AA6ED87220D46C18D47D33DE813189562B2E9AFE4BBF
        FF41B2FE35A6FA3CA7F8EDF7FE3799F21280EF1681F01179ED0C70E90769E605
        52BDFF00FFAB4504FBB572EEA35EF7E2CCFFFFFFFBDABDF2CEABFEFAF4FCEDDD
        D872204186D44CC4FF4CC4FF42B6FF3EABFBD9EEFE4BA9F640A1F497CBF8137D
        ED1179ED0852B8FF00FFFF00FFAB4504EEA35EFBB572F2A660F6CEA5FCEDDDFE
        F2E5FBDABDA57D3E654D0A1E4921105B402376723392B23CB0FF62C0FF8ECCFB
        80C6FA6CB8F71886F2157BEA0852B8FF00FFFF00FFFF00FFAB4504E79C57FBB5
        72F6A960FAA459D88B4339490C004C0100740701830401830400730101500210
        5B4034A0DE41B2FE3CA7F82798F71F89EB0A5AC4FF00FFFF00FFFF00FFFF00FF
        FF00FFAB4504AB4504E08846D088471C4A0D00740700A009009D0241C24C46C4
        51009D0200A1070073010748163299DA2E9AFE0A5AC40A5AC4FF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFAB4504183402047E1406AB1A20B02F
        97DD9DFEF8F3D3F2DC97DD9D18AB2301A40A017A020544280A5AC4FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF035D1114
        B03414B034F3FBF490DA98FEF8F362CA6B73D181E0F6E20BA41401A40A054428
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF004C0311912F16B24226B54998E0A90CA622FEF8F344BF5008A314FFFFFF27
        B23200A107038609013501FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF045C0A19AA461CB55016B2420BAA2D03A11DFEF8F382D7
        8E90DA98E3F7E90EA518019E0903910A013A03FF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FF05720C19AA461CB55017B04A2DBA5C
        A7E5BCFEF8F3E3F7E998E0A91FAF2E019E0903A30D03910A013A03FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF04750916A33B1C
        B5501FB451D3F2DCA7E5BCFEF8F35FCB7D009E13009E1308A31403A30D038609
        013501FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FF068A0E1BB4502DBA5CFFFFFF3BC06AFEF8F35FCB7D2CB84F5FCB7D0C
        A62207AA18013D03FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF068A0E16AC421BB450A7E5BCD3F2DCFEF8F3A7E5
        BCE3F7E998E0A90BAA2D0C9722013D03FF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF09921616AC421CB552
        5DCE88FEF8F3BBEDCF5DCE8816B64711A33104510AFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FF068E10068E1011AA401AB04B1AB04B11AA40045C0A045C0AFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF068E10078913047E1405720CFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      ParentShowHint = False
      ShowHint = True
      OnClick = sbColetasClick
    end
    object sbDoacoes: TSpeedButton
      Left = 805
      Top = 24
      Width = 30
      Height = 30
      Hint = 'Doa'#231#245'es'
      CustomHint = BalloonHint1
      Flat = True
      Glyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        080000000000400200000000000000000000000100000001000000000000044D
        0600034D0B00034D0C0004510A0004550A00055A0B00055E0B0005590C00075F
        0F000356130003581300035C130003591400035D1400045D140005660F000569
        0F00076D0C0007710C0003611400046114000465150008651200036D1300056D
        110004691400056E1500086D10000B6A15000A6F160005711200067413000572
        150005761500057B1200067F16000A791400008C0A00009C0D0005851500058D
        1600088912000C8218000C881A0005971500089A16000C921900089E18000E98
        1E000F9D1E0000A9000000AB050000AD0C0001B00E0007A3170009A3170001AE
        110000AE140004AD150008A118000DA01C000EA41C0009AE19000AA81C0003B1
        130002B0160006B1180002B11C0007B41F0009B219000DB3190009B51A000DB3
        1E000AB91D000D8E2400168A29000C9A2000178C310011A4200014A8270019AA
        2D000FB323000DB4220009B427000FB5250007B42B000DB52C0011B5200010B5
        270011B62A0013B72E0017A6340015B3310012B7320015B7310013B7340014B8
        360017BF350018B4390013B83C0019B939001ABA3F002BAA3B000FB845001FB6
        450014B940001ABA43001CBA41001DBC420019BA450015BA4B001BBB49001DBB
        49001ABD570033A54E002BB5470026BD470024B14C0021BC490023BD4C002CBF
        4E0026AD520023BE510025BE520027BE560024BF5C002BB95F0038B752002CBE
        620041A54A0041BC5D006BBB71001EC0440022C44D003AC2470026C2530028C0
        59002BC15D0034C35F003BC45A0026C062002AC160002DC262002BC265002DC2
        65002EC764002FC3690033C067003DC5630030C3690031C66B0032C56C0034C4
        6C003BC6710043C5520049C8660055CB610055CC6F004DC5730041C875004BCA
        740046C9790048CA7A0058C679004DD07B0067D07800FF00FF004ECD800057CE
        85005DD0870066CF8A007FC6870072D4820068D3910070D5950072D6990075D5
        980078D79C0074D8990079D89E007FDAA2008BDC980093DE9A0085DCA5008BDE
        AB00A1D3A7009AE0A10099E0AA0092E0B100A1E1A700A2E2AA00A2E3AE00A2E4
        BA00B6E9BB00A7E7C300ADE7C300A7E9C300ADE8C500B4E9C000B6EACA00BCEB
        CB00BCEDD100C2ECC600C6EDCA00C7EECF00C8EECC00C3EFD600CBEFD300C8F0
        D800CDF0D800CEF1DD00D2F2DB00D5F4D800D0F2DF00D7F3E100DBF5E300E0F6
        E800E5F8EB00EBF9ED00EFFAF200F2FBF500F7FDF900FBFEFC00FFFFFF000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000A7A7A7A7A7A7
        A7A7A7040406040602A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A706101F1F1F1F1F
        1F1106A7A7A7A7A7A7A7A7A7A7A7A704101F0E0E0E0E0E0A0A161F1F04A7A7A7
        A7A7A7A7A7A7061F1B1F242926ACBA2623160A161F10A7A7A7A7A7A7A7064B4B
        4D40393947C2D558392728160A1F06A7A7A7A7A7045C635D5B459DC2DDE0E0E0
        CC9D392D1F0E1F04A7A7A7A74C86856557B6E0E0BECED8B7E0E0B739401F161F
        A7A7A71D7D7D77649EE0E0A634BBCB3387DCE09D3530161F06A7A74E92897D64
        BCE0CC5744BFCC3934BBE0BB3547281F16A7117A97927D7D95A69C5D54BFCE39
        35B7E0BF35473C1F1F04257F9797818A7D6E858554C0CC399BDBE0A635443F29
        23042B81979797818A7D6E6A79C7DCCBE0E0C2474447473028062C9497949397
        927DAAC9E0E0E0E0D0AD55444747443F2E04829FA89393978DB9E0E0D3D8D379
        5D545B5847474744380684A4BDA29281A3DEE0B86FC1D064855E5D5E57554447
        2E01A780CAB99A7DB0E0DA9772C4D385718C75655B58554A23A7A767BDD5B493
        AAE0DDA072C4D268A1DDDA8C5D5E5A5806A7A7A783CFD3B097D3E0CFA2C4D3A1
        D3E0CC856465622CA7A7A7A74FABD6D7B8A9CAE0E0DEE0E0E0C9948577855C04
        A7A7A7A7A751AFD6DAC4B0B5BDD8DDBDAE8A8A7F886917A7A7A7A7A7A7A751A4
        C4D9D9C8B8C1C1AAAFB0B3A5761DA7A7A7A7A7A7A7A7A74080AFC3D3D8D5CFD1
        C9C5B2731CA7A7A7A7A7A7A7A7A7A7A7A750749FABB0B0ABA4734CA7A7A7A7A7
        A7A7A7A7A7A7A7A7A7A7A7384031312F2AA7A7A7A7A7A7A7A7A7}
      ParentShowHint = False
      ShowHint = True
      OnClick = sbDoacoesClick
    end
    object Label13: TLabel
      Left = 191
      Top = 8
      Width = 24
      Height = 13
      CustomHint = BalloonHint1
      Caption = 'Local'
    end
    object Label14: TLabel
      Left = 374
      Top = 8
      Width = 69
      Height = 13
      CustomHint = BalloonHint1
      Caption = 'Data Abertura'
    end
    object cbCaixas: TwwDBLookupCombo
      Left = 8
      Top = 24
      Width = 177
      Height = 21
      Hint = 'Selecione o caixa'
      CustomHint = BalloonHint1
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CAI_NOME'#9'35'#9'Caixa'#9#9
        'LOC_DESCRICAO'#9'35'#9'Local'#9#9
        'CXT_DATA'#9'18'#9'Data'#9'F'#9)
      LookupTable = dmLookups.lkCaixaLocal
      LookupField = 'CAI_NOME'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnKeyPress = cbCaixasKeyPress
    end
    object btAtualizar: TBitBtn
      Left = 455
      Top = 24
      Width = 105
      Height = 25
      Hint = 'Alterar caixa e atualizar movimenta'#231#227'o'
      CustomHint = BalloonHint1
      ParentCustomHint = False
      Caption = 'Atualizar'
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00B7818300B7818300B7818300B7818300B7818300B7818300B7818300B781
        8300B7818300B7818300B7818300B7818300B7818300FF00FF00FF00FF00FF00
        FF00B7818300FEEED400D3D8A900DFD9AB00F5DBB400EDD6A700EED29F00F1CF
        9A00F0CF9700F0CF9800F0CF9800F5D49A00B7818300FF00FF00FF00FF00FF00
        FF00B7818300FDEFD900AECE900046AD380089BE690036A7290037A728007AB5
        5300D6C78A00EECC9700EECC9700F3D19900B7818300FF00FF00FF00FF00FF00
        FF00B4817600FEF3E300CDD9AE0020A31C00029A0300029A0300029A0300029A
        030041A82E00E6CA9500EECC9700F3D19900B7818300FF00FF00FF00FF00FF00
        FF00B4817600FFF7EB00CCDCB30024A51F00029A03002FA72600BBCC8E008CBD
        68000C9C0A0090BB6300EFCD9900F3D19800B7818300FF00FF00FF00FF00FF00
        FF00BA8E8500FFFCF400CBDFBA0017A11600029A03000C9D0C009AC57A00F4DB
        BB00B8C7880087BF6900F0D0A100F3D29B00B7818300FF00FF00FF00FF00FF00
        FF00BA8E8500FFFFFD00E8EDDB00B7D8A600AED39900A9CF9000AECE9000F2DE
        C000F4DBBA00B3D09200F0D4A900F5D5A300B7818300FF00FF00FF00FF00FF00
        FF00CB9A8200FFFFFF00BAE2B700FBF3EC00F7EEDF00B1D39C00AACF9000ACCD
        8E00B3CC8E00EFDAB600F2D8B200F6D9AC00B7818300FF00FF00FF00FF00FF00
        FF00CB9A8200FFFFFF008DD28E00C1E1BB00FBF3EC009CCF8F000D9D0C00029A
        030017A01400F6DEC100F4DBB900F8DDB400B7818300FF00FF00FF00FF00FF00
        FF00DCA88700FFFFFF0099D69A000D9D0E0093D18E00C0DEB40030AA2C00029A
        030024A41F00F6E2C800F7E1C200F0DAB700B7818300FF00FF00FF00FF00FF00
        FF00DCA88700FFFFFF00F6FBF60045B54600029A0300029A0300029A0300029A
        030021A41E00FCEFD900E6D9C400C6BCA900B7818300FF00FF00FF00FF00FF00
        FF00E3B18E00FFFFFF00FFFFFF00E5F5E50081CD81003BB03B0038AE37008ECD
        850045AE3D00AA877100B8857A00B8857A00B7818300FF00FF00FF00FF00FF00
        FF00E3B18E00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E8F6E800E7F5E500FFFE
        F900BEC6A800A2886C00E8B27000ECA54A00C5876800FF00FF00FF00FF00FF00
        FF00EDBD9200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00E4D4D200B8857A00FAC57700CD937700FF00FF00FF00FF00FF00FF00FF00
        FF00EDBD9200FCF7F400FCF7F300FBF6F300FBF6F300FAF5F300F9F5F300F9F5
        F300E1D0CE00B8857A00CF9B8600FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00EDBD9200DCA88700DCA88700DCA88700DCA88700DCA88700DCA88700DCA8
        8700DCA88700B8857A00FF00FF00FF00FF00FF00FF00FF00FF00}
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btAtualizarClick
    end
    object dbLocal: TDBEdit
      Left = 191
      Top = 24
      Width = 177
      Height = 21
      CustomHint = BalloonHint1
      Color = clSkyBlue
      DataField = 'LOC_DESCRICAO'
      DataSource = dsCaixa
      ReadOnly = True
      TabOrder = 2
    end
    object dbData: TDBEdit
      Left = 374
      Top = 24
      Width = 75
      Height = 21
      CustomHint = BalloonHint1
      Color = clSkyBlue
      DataField = 'CXT_DATA'
      DataSource = dsCaixa
      ReadOnly = True
      TabOrder = 3
    end
  end
  object Panel3: TPanel [3]
    Left = 0
    Top = 57
    Width = 999
    Height = 475
    CustomHint = BalloonHint1
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 3
    object Label2: TLabel
      Left = 8
      Top = 8
      Width = 74
      Height = 13
      CustomHint = BalloonHint1
      Caption = 'Movimenta'#231#245'es'
    end
    object Label3: TLabel
      Left = 484
      Top = 8
      Width = 43
      Height = 13
      CustomHint = BalloonHint1
      Caption = 'Produtos'
    end
    object JvDBGrid1: TJvDBGrid
      Left = 8
      Top = 27
      Width = 470
      Height = 442
      CustomHint = BalloonHint1
      TabStop = False
      DataSource = dsMovHist
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ReadOnly = True
      TabOrder = 0
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
  end
  object GridItensVend: TJvDBGrid [4]
    Left = 484
    Top = 84
    Width = 507
    Height = 442
    CustomHint = BalloonHint1
    TabStop = False
    DataSource = dsVendas
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
  inherited BalloonHint1: TBalloonHint
    Left = 664
  end
  object dsVendas: TDataSource
    DataSet = dmConsultas.qyItensVenda
    Left = 592
    Top = 168
  end
  object dsMovHist: TDataSource
    DataSet = dmCadastros.qyMovHist
    OnDataChange = dsMovHistDataChange
    Left = 48
    Top = 176
  end
  object PopupMenu1: TPopupMenu
    Images = frmPrincipal.Imagens
    Left = 720
    Top = 224
    object Adicionarprodutoigual1: TMenuItem
      Caption = 'Adicionar produto igual'
      Hint = 'Adiciona mais produto igual ao selecionado'
      ImageIndex = 109
    end
    object Retornarproduto1: TMenuItem
      Caption = 'Retornar produto'
      Hint = 'Retorna produto do caixa'
      ImageIndex = 94
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Adicionarnovoproduto1: TMenuItem
      Caption = 'Adicionar novo produto'
      Hint = 'Adiciona novo produto ao caixa'
      ImageIndex = 81
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object Enviodetrocoaocaixa1: TMenuItem
      Caption = 'Envio de troco ao caixa'
      Hint = 'Enviar mais troco ao caixa (sem retirar)'
      ImageIndex = 186
      OnClick = Enviodetrocoaocaixa1Click
    end
    object Retiradadocaixa1: TMenuItem
      Caption = 'Retirada do caixa'
      Hint = 'Efetuar retiradas do caixa'
      ImageIndex = 187
      OnClick = Retiradadocaixa1Click
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object Fechamentodocaixa1: TMenuItem
      Caption = 'Fechamento do caixa'
      Hint = 'Fechamento do caixa'
      ImageIndex = 10
      OnClick = Fechamentodocaixa1Click
    end
  end
  object PopupMenu2: TPopupMenu
    Images = frmPrincipal.Imagens
    Left = 216
    Top = 144
  end
  object actMoves: TActionList
    Images = frmPrincipal.Imagens
    Left = 64
    Top = 280
  end
  object dsTotalizacao: TDataSource
    DataSet = dmCadastros.qyCaixaTot
    Left = 144
    Top = 216
  end
  object dsCaixa: TDataSource
    DataSet = dmLookups.lkCaixaLocal
    Left = 128
    Top = 56
  end
end