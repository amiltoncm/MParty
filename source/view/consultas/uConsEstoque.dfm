inherited frmConsEstoque: TfrmConsEstoque
  Caption = 'Consulta Estoque (Produtos controlados)'
  ClientHeight = 436
  ClientWidth = 393
  OnActivate = FormActivate
  OnKeyPress = FormKeyPress
  ExplicitWidth = 399
  ExplicitHeight = 464
  PixelsPerInch = 96
  TextHeight = 13
  inherited btFechar: TBitBtn
    Left = 280
    Top = 403
    ExplicitLeft = 281
    ExplicitTop = 403
  end
  object JvDBGrid1: TJvDBGrid [1]
    Left = 8
    Top = 8
    Width = 377
    Height = 389
    CustomHint = BalloonHint1
    TabStop = False
    DataSource = dsEstoque
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 1
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
        FieldName = 'EST_CODIGO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRE_DESCRICAO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EST_QUANTIDADE'
        Visible = True
      end>
  end
  inherited BalloonHint1: TBalloonHint
    Left = 488
    Top = 296
  end
  object dsEstoque: TDataSource
    DataSet = dmConsultas.qyConsEstoque
    Left = 80
    Top = 184
  end
end
