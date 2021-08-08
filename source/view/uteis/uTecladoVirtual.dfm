object frmTecladoVirtual: TfrmTecladoVirtual
  Left = 348
  Top = 187
  CustomHint = BalloonHint1
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Teclado Virtual'
  ClientHeight = 223
  ClientWidth = 573
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object spDone: TSpeedButton
    Left = 456
    Top = 136
    Width = 23
    Height = 22
    CustomHint = frmPrincipal.BalloonHint1
    Flat = True
    Visible = False
    OnClick = spDoneClick
  end
  object TouchKeyboard1: TTouchKeyboard
    Left = 8
    Top = 35
    Width = 550
    Height = 180
    CustomHint = frmPrincipal.BalloonHint1
    GradientEnd = clSilver
    GradientStart = clGray
    Layout = 'Standard'
  end
  object meSenha: TMaskEdit
    Left = 8
    Top = 8
    Width = 121
    Height = 21
    CustomHint = frmPrincipal.BalloonHint1
    PasswordChar = '*'
    TabOrder = 1
    Text = 'meSenha'
    OnKeyPress = meSenhaKeyPress
  end
  object BalloonHint1: TBalloonHint
    Left = 336
    Top = 8
  end
end
