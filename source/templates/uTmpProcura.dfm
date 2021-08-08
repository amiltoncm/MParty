inherited frmTmpProcura: TfrmTmpProcura
  Caption = 'frmTmpProcura'
  ClientHeight = 268
  ClientWidth = 464
  KeyPreview = False
  ExplicitWidth = 470
  ExplicitHeight = 300
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 8
    Top = 8
    Width = 124
    Height = 13
    CustomHint = BalloonHint1
    Caption = 'Digite a busca pelo campo'
  end
  object lbCampo: TLabel [1]
    Left = 138
    Top = 8
    Width = 52
    Height = 13
    Hint = 'Campo selecionado para a busca'
    CustomHint = BalloonHint1
    Caption = '(CAMPO)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    Transparent = True
  end
  object spProcura: TSpeedButton [2]
    Left = 313
    Top = 27
    Width = 23
    Height = 21
    Hint = 'Procurar!'
    CustomHint = BalloonHint1
    Flat = True
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFB68082B68082B68082B68082B78183B781
      83B78183B78183B78183FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB3
      7E80F9EBD3F5E2C2F2DCB5F2D8A9F4D49EF3D298F9DB9BB78183FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFA47476E1D6C7DDCEBADCC8AFE4CCACECD0
      A8EDCD9CF4D399B78183FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8F
      726CB5B0A9B2A89CB4A797CEBBA3E3CBAAECCFA6F4D59EB78183FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FF0077FF715B558583820077FF8C847AAB9F8FCEBB
      A3E5CCABF2D8A9B78183B88284B98384B78283B48081A576768760600077FF00
      77FF0077FF0077FF76716D8B837AB4A897DCC6ADF5DDB6B68082B78183FDECCF
      F2DAB9EDD2AB0077FF0077FF0077FF0077FF0077FF0077FF0077FF0077FFB3A8
      9CE3D5BFEFE1C3B68082B88284FEF2DDF4DFC5EFD7B6D9BF9B0077FF0077FF70
      5C4C9090900077FF0077FF858381B5AEA6A3766CB18076B68082BA8E85FFF9EA
      F6E5D1EFDCC2DBC5A70077FF0077FF6F5C4B7B7B7B0077FF0077FF8F8F8FB7B5
      B3A3766CE3A65FCC8B62BA8E85FFFEF9F9EDDEF3E2CF0077FF0077FF0077FF00
      77FF0077FF0077FF0077FF0077FFCEC9C9AA7B71D29C7BFF00FFCB9A82FFFFFF
      FCF3EBF8EBDDF2E2CEE5D1B90077FF0077FF0077FF0077FFDCA887DCA887DCA8
      87B18076FF00FFFF00FFCB9A82FFFFFFFFFCF9FBF4EBF8EBDCF3E2CE0077FFDA
      C6A8A373750077FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDCA887FFFFFF
      FFFFFFFEFCF9FCF3EBF9EBDCB58378B48277B27D7FFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFE3B18EFFFFFFFFFFFFFFFFFFFFFEFDEBDDD8B8857ADA
      9B5EC0846FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFEDBD92FFFFFF
      FFFFFFFFFFFFFFFFFFE8DFE2B8857ADEA475FF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFEDBD92DCA887DCA887DCA887DCA887DCA887B8857AFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    ParentShowHint = False
    ShowHint = True
  end
  object spLimpar: TSpeedButton [3]
    Left = 336
    Top = 27
    Width = 23
    Height = 21
    Hint = 'Limpa o filtro'
    CustomHint = BalloonHint1
    Flat = True
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF008F8D8D009190900098969600969595009290
      90008F8D8D00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF008F8D8D009B9A9A00BEBEBF00BFBEC000B6B6B400B7B3AF00BAB2
      B200B8B0B0009C9898008F8D8D00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF0099999900B5B4B400D7D7D800B1AFAB00A8A69900ABABA900A1A2AA00AFA6
      9600A5999300CAB7B600B7AAAA008D8C8C00FF00FF00FF00FF00FF00FF008F8D
      8D00B6B4B500E1DFE000ABA8A000D2D0BC00FEF4D900DDCED100BDB7D700FFFF
      EB00DEDDD5009C948900CAAFAF00B9AAAA008F8D8D00FF00FF00FF00FF00ABA5
      AB0095BE970035883C00DADDC300FFF7D800F6D5A600F3C69000F3BC8100F3CD
      9D00FFFCE600F2F6F0009B908400D6B6B7009F989800FF00FF008F8D8D0092A7
      91003DB2560042CE6D0067AF6400F9F6CE00FFFAD500FBF1C800F7DAAC00F2C8
      9600F5D29E00FFEDD300D8D7CE00A9918A00C7B0B000A3999A008A9689002093
      2E0041D169005AE58A0040CB6B0083C07900FEFFDD00FEFFDD00FDFAD500FFED
      BE00FCCC9400F4BF8900FFF9E200A3988900D1B2B200A3999A002082260016A5
      280032C1500042CD66003DBF60001D942F0095C18100C1BCAA0084847C00B1B2
      9A00AB977C00DCAA7500DACDD2009897A000D3B2AE00AC9F9F00458848004C94
      4F001CAB2F0027B943005EA56200CEE2C800D3E7B600C0C0AA00545456004142
      3F0088867600D2A97A00C7BBCE008D8EA000D5B4B000AB9E9E00A99EA800A4BC
      A4000F991A0011A9250073B37700FFFFFF00FFFFF700FFFFDF00DBDBC0006768
      5F00B7AD9200FFDAA700FFF2CE00ABA09300D2B3B500A29899008F8D8D00BCBB
      BB003298380003A3120029973100E5ECE300FFFFFF00FFFFFB00FFFFF000EDED
      D6005D5C5300AC9F8C00DFDFC700B59F9B00CCB3B300A2989900FF00FF00A39E
      A10097BA98000C931600009D0E0041A04600B0D1B200EEF5EF00F8FBF800FFFF
      FE00F2F2DA00CCD0B500B0A89C00D9BABB00A1999900FF00FF00FF00FF008F8D
      8D00B3ADB20090B892001E9426000090090000880B0012821C002F8B3E00D0E6
      CE00EDEDE000BCB6A900D4B9BA00B2A6A6008F8D8D00FF00FF00FF00FF00FF00
      FF0094949300AFACAF00BDC9BD00A0BCA1008AAB870095AE8900A9B89C00C2C1
      B600C2B7B400D1BCBD00B0A5A50094949400FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF008F8D8D00A09D9F00BDB7BC00CAC3C900C5C0C500C1BBBE00BDB5
      B600B2ACAE009C9A9A008F8D8D00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF008F8D8D008F8D8D0093929200949292008F8E
      8E008F8D8D00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    ParentShowHint = False
    ShowHint = True
  end
  inherited btFechar: TBitBtn
    Left = 352
    Top = 235
    TabOrder = 3
    ExplicitLeft = 352
    ExplicitTop = 235
  end
  object btConfirmar: TBitBtn [5]
    Left = 252
    Top = 235
    Width = 95
    Height = 25
    Hint = 'Clique para selecionar o registro'
    CustomHint = BalloonHint1
    Caption = 'Selecionar'
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FF331400451B00572200572200471C00361600FF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF491C00491C00803200A54100AA
      4200AA4200A74100843400511F00511F00FF00FFFF00FFFF00FFFF00FFFF00FF
      5923006E2B00AF4400B14500AA4200A54100AA4200AA4200AF4400B14500702C
      00361600FF00FFFF00FFFF00FF5923007B3000C54D00B84800AA4200A54100CA
      884FE6C6A7AF500BA74100AA4200B14500702C00511F00FF00FFFF00FF592300
      D45300CC5000BB4900AA4200C27738FAF4EEFFFFFFDEB48CA94200A74100AA42
      00B14500511F00FF00FF5F2500A03F00EB5C00CC5000B14500C67A3AFCF7F3FF
      FFFFFFFFFFFFFFFFD9A679A94200A74100AF4400843400451B005F2500D75400
      EB5C00D45300CC8242FCF8F4FEFEFCFCFAF6FEFEFCFEFBF8FFFFFFD5A070A944
      01AC43009E3E00451B00772E00F66000F86200F86200FEF2E7FFFFFFF2AD6FF7
      CFAAFFFFFFD19866F4E7DAFFFFFFD9A77AAA4200AA42004F1F00893500FF7813
      FF6A04FB6300FFEAD4FFBB7EFF6400FFD1A6FFFFFFBF6A25C07230FBF7F2E1BA
      95AC4300AA4200572200893500FF8829FF801EF05E00FB7410FB6703FB6300FC
      D3ABFFFFFFD77D31C54D00CA6011C65405B84800A541004B1D00893500FF801E
      FFAD67FF6400EE5D00FB6300FB6300FED3ABFFFFFFE18031CF5100CF5100C54D
      00BB4900953A004B1D00FF00FFE65A00FFC693FF9842E15800EB5C00FB6300FE
      D4ACFFFFFFE78332CF5100CA4F00C04B00C74E00752D00FF00FFFF00FFE65A00
      FF892BFFDAB7FF9741F86200E95B00FED5AFFFFFFFEB8431D95500D45300D754
      00B44600752D00FF00FFFF00FFFF00FFC54D00FF9842FFE2C6FFBB7FFF8728FF
      750FFF6B05FF6E08FF6E08FF6701CA4F00702C00FF00FFFF00FFFF00FFFF00FF
      FF00FFFF801EFF801EFFBA7DFFD5ADFFC591FFB574FFA558FF8323D75400D754
      00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE15800FF700AFF
      7D19FF7813FB6300B64700FF00FFFF00FFFF00FFFF00FFFF00FF}
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  object GridProcura: TDBGrid [6]
    Left = 8
    Top = 54
    Width = 448
    Height = 175
    Hint = 'Registros filtrados'
    CustomHint = BalloonHint1
    DataSource = dsProcura
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = GridProcuraDrawColumnCell
  end
  object cbProcura: TwwDBLookupCombo [7]
    Left = 8
    Top = 27
    Width = 299
    Height = 21
    Hint = 'Digite a busca e tecle ENTER'
    CustomHint = BalloonHint1
    DropDownAlignment = taLeftJustify
    Options = [loColLines, loRowLines, loTitles, loSearchOnBackspace]
    TabOrder = 0
    AutoDropDown = True
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
    ShowMatchText = True
  end
  object dsProcura: TDataSource
    Left = 64
    Top = 232
  end
end