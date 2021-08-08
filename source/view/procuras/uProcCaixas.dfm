inherited frmProcCaixas: TfrmProcCaixas
  Caption = 'Procura Caixas'
  ClientHeight = 349
  ClientWidth = 329
  ExplicitWidth = 335
  ExplicitHeight = 377
  PixelsPerInch = 96
  TextHeight = 13
  inherited lbCampo: TLabel
    Width = 39
    Caption = '(nome)'
    ExplicitWidth = 39
  end
  inherited spProcura: TSpeedButton
    Left = 249
    OnClick = spProcuraClick
    ExplicitLeft = 249
  end
  inherited spLimpar: TSpeedButton
    Left = 271
    OnClick = spLimparClick
    ExplicitLeft = 271
  end
  inherited btFechar: TBitBtn
    Left = 216
    Top = 316
    ExplicitLeft = 332
    ExplicitTop = 316
  end
  inherited btConfirmar: TBitBtn
    Left = 115
    Top = 316
    Anchors = [akRight, akBottom]
    OnClick = btConfirmarClick
    ExplicitLeft = 231
    ExplicitTop = 316
  end
  inherited GridProcura: TDBGrid
    Width = 313
    Height = 256
    OnDblClick = GridProcuraDblClick
    OnKeyPress = GridProcuraKeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'CAI_CODIGO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CAI_NOME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CAI_SENHA'
        Visible = False
      end>
  end
  inherited cbProcura: TwwDBLookupCombo
    Width = 225
    LookupTable = dmLookups.lkCaixas
    LookupField = 'CAI_NOME'
    Options = [loColLines, loRowLines, loTitles]
    OnKeyPress = cbProcuraKeyPress
    ExplicitWidth = 225
  end
  inherited dsProcura: TDataSource
    DataSet = dmCadastros.qyCaixas
    Left = 88
    Top = 128
  end
end
