inherited frmProcUsuarios: TfrmProcUsuarios
  Caption = 'Procura Usu'#225'rios'
  ClientHeight = 306
  ClientWidth = 238
  ExplicitWidth = 244
  ExplicitHeight = 331
  PixelsPerInch = 96
  TextHeight = 13
  inherited lbCampo: TLabel
    Width = 39
    Caption = '(nome)'
    ExplicitWidth = 39
  end
  inherited spProcura: TSpeedButton
    Left = 183
    OnClick = spProcuraClick
    ExplicitLeft = 183
  end
  inherited spLimpar: TSpeedButton
    Left = 206
    OnClick = spLimparClick
    ExplicitLeft = 206
  end
  inherited btFechar: TBitBtn
    Left = 125
    Top = 273
    ExplicitLeft = 190
    ExplicitTop = 390
  end
  inherited cbProcura: TwwDBLookupCombo
    Width = 169
    LookupTable = dmLookups.qyProcUsuarios
    LookupField = 'USU_NOME'
    Options = [loColLines, loRowLines, loTitles]
    OnKeyPress = cbProcuraKeyPress
    ExplicitWidth = 169
  end
  inherited GridProcura: TDBGrid
    Width = 220
    Height = 213
    OnDblClick = GridProcuraDblClick
    OnKeyPress = GridProcuraKeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'USU_CODIGO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USU_NOME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USU_SENHA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'USU_ATIVO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'ACE_CODIGO'
        Visible = False
      end>
  end
  inherited btConfirmar: TBitBtn
    Left = 14
    Top = 273
    OnClick = btConfirmarClick
    ExplicitLeft = 79
    ExplicitTop = 390
  end
  inherited dsProcura: TDataSource
    DataSet = dmCadastros.qyUsuarios
    Left = 88
    Top = 128
  end
end
