unit uPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ToolWin, ComCtrls, Menus, ExtCtrls, ShellApi, Inifiles,
  ActnList, JvComponentBase, JvSerialMaker;

type
  TfrmPrincipal = class(TForm)
    Imagens: TImageList;
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    teis1: TMenuItem;
    ToolBar1: TToolBar;
    ImgFundoTela: TImage;
    ActionList1: TActionList;
    actFechar: TAction;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    Sair1: TMenuItem;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    actMaximizaTodas: TAction;
    actMinimizaTodas: TAction;
    actFechaAtiva: TAction;
    actFecharTodas: TAction;
    BalloonHint1: TBalloonHint;
    ToolButton10: TToolButton;
    N1: TMenuItem;
    actBloquear: TAction;
    ToolButton9: TToolButton;
    ToolButton11: TToolButton;
    Bloquearsistema1: TMenuItem;
    Janelas1: TMenuItem;
    Maximimzarjanelas1: TMenuItem;
    Minimizarjanelas1: TMenuItem;
    Fecharjanela1: TMenuItem;
    Fecharjanelas1: TMenuItem;
    actSobre: TAction;
    Sobre1: TMenuItem;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    actNovaFesta: TAction;
    NovaFesta1: TMenuItem;
    N2: TMenuItem;
    actAbrirFesta: TAction;
    actAbrirFesta1: TMenuItem;
    actCadCaixa: TAction;
    Cadastros2: TMenuItem;
    N3: TMenuItem;
    Caixas1: TMenuItem;
    actCadLocais: TAction;
    actCadLocais1: TMenuItem;
    Timer1: TTimer;
    actProdVend: TAction;
    Consultas1: TMenuItem;
    ProdutosVendidos1: TMenuItem;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    ToolButton17: TToolButton;
    ToolButton18: TToolButton;
    ToolButton19: TToolButton;
    actFinalizar: TAction;
    ToolButton20: TToolButton;
    actCadUsuarios: TAction;
    ToolButton21: TToolButton;
    ToolButton22: TToolButton;
    N4: TMenuItem;
    Usurios1: TMenuItem;
    StatusBar1: TStatusBar;
    JvSerialMaker1: TJvSerialMaker;
    procedure DisplayHint(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure actFecharExecute(Sender: TObject);
    procedure actMaximizaTodasExecute(Sender: TObject);
    procedure actMinimizaTodasExecute(Sender: TObject);
    procedure actFechaAtivaExecute(Sender: TObject);
    procedure actFecharTodasExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actBloquearExecute(Sender: TObject);
    procedure actSobreExecute(Sender: TObject);
    procedure actNovaFestaExecute(Sender: TObject);
    procedure actAbrirFestaExecute(Sender: TObject);
    procedure actCadCaixaExecute(Sender: TObject);
    procedure actCadLocaisExecute(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure actProdVendExecute(Sender: TObject);
    procedure actFinalizarExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure actCadUsuariosExecute(Sender: TObject);

  private

    FClientInstance, FPrevClient: TFarProc;
    Procedure ClientWindow(Var Message: TMessage);

  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses uVarGlobal, uFuncoesSistema, uSenha, uSobre, uNovaFesta, uDaoFestas,
  uFesta, uCadCaixas, uCadLocais, uProdutosVendidos, uFuncoesMsg, uDaoCaixatot,
  uCadUsuarios, uDaoSistema, uFuncoesSeguranca, dataCadastros, uFuncoesRegistro;

{$R *.dfm}

procedure TfrmPrincipal.DisplayHint(Sender: TObject);
begin
  StatusBar1.Panels[5].Text := Application.Hint;
  if frmFesta <> nil then
    frmFesta.StatusBar1.Panels[5].Text := Application.Hint;
end;

procedure TfrmPrincipal.ClientWindow(Var Message: TMessage);
Var
DisplayContext: hDC;
Row, Col: Word;
Begin
  with Message do
  case Msg of
  WM_ERASEBKGND:
  Begin
    DisplayContext := TWMEraseBkGnd(Message).DC;
    For Row := 0 to ClientHeight DIV ImgFundoTela.Picture.Height DO
      For Col := 0 TO ClientWidth  DIV ImgFundoTela.Picture.Width DO
        BitBlt(DisplayContext, Col*ImgFundoTela.Picture.Width,
    Row * ImgFundoTela.Picture.Height,
    ImgFundoTela.Picture.Width, ImgFundoTela.Picture.Height,
    ImgFundoTela.Picture.BitMap.Canvas.Handle, 0, 0, SRCCOPY);
    Result := 1;
  end
  else
    Result := CallWindowProc(FPrevClient, ClientHandle, Msg, wParam, LParam);
  end;
end;

procedure TfrmPrincipal.FormActivate(Sender: TObject);
begin
  TraduzMensagens;
  //Verifica registro
  VerRegistro;
end;

procedure TfrmPrincipal.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if MessageDlg('Deseja realmente sair do sistema?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    Canclose := true
  else
    Canclose := false;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
var
hSysMenu: HMENU;
vControl: TInifile;
begin
  if hSysMenu <> 0 then
  begin
    EnableMenuItem(hSysMenu, SC_CLOSE,
    MF_BYCOMMAND Or MF_GRAYED);
    DrawMenuBar(Self.Handle);
  end;
  Application.HintPause := 1;
  Application.HintHidePause := 1;
  //Carrega variáveis padrões
  vgPath := DiretorioSemBarra(ExtractFileDir(Application.exename));
  vgArqIni := (vgPath + '\' + RetornaExecutavelSemExtensao + '.ini');
  hSysMenu := GetSystemMenu(Self.Handle, False);
  vControl := Tinifile.create(vgArqIni);
  vgDirTemp := vControl.ReadString('Temp', 'Diretorio', '');
  vgDirImagens := vControl.ReadString('Imagens', 'Diretorio', '');
  vgFundo := vControl.ReadString('Imagens', 'Logo','');
  vgMaskDataSQL := vControl.ReadString('Mascara', 'Data','');
  vControl.free;
  {$IFDEF DEBUG}
    frmPrincipal.Caption := Application.Title + ' - Vs. ' + VersaoSistema(0) + ' - (DEBUG)';
    vgCodUsuarioLog := '0';
    vgNomeUsuarioLog := 'MASTER';
  {$ELSE IF}
    frmPrincipal.Caption := Application.Title + ' - Vs. ' + VersaoSistema(0);
  {$ENDIF}
  //Carrega imagem de fundo
  ImgFundoTela.Picture.LoadFromFile(vgFundo);
  FClientInstance := MakeObjectInstance(ClientWindow);
  FPrevClient := Pointer(GetWindowLong(ClientHandle, GWL_WNDPROC));
  SetWindowLong(ClientHandle, GWL_WNDPROC, Longint(FClientInstance));
  Application.OnHint := DisplayHint;
end;

procedure TfrmPrincipal.actFecharExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrincipal.actMaximizaTodasExecute(Sender: TObject);
var
X : Byte;
begin
  try
    for X := 0 to Pred(MDIChildCount) do
      MDIChildren[X].WindowState := wsNormal;
    ActiveMDIChild.WindowState := wsNormal;
  except
  end;
end;

procedure TfrmPrincipal.actMinimizaTodasExecute(Sender: TObject);
var
X : Byte;
begin
  try
    for X := 0 to Pred(MDIChildCount) do
      MDIChildren[X].WindowState := wsMinimized;
    ActiveMDIChild.WindowState := wsMinimized;
  except
  end;
end;

procedure TfrmPrincipal.actNovaFestaExecute(Sender: TObject);
begin
  VerifFesta;
  if vgFestaAberta = '0' then
    frmNovaFesta.ShowModal
  else
    MessageDlg('Existe registro de festas em aberto, é necessário fechá-la para gerar uma nova',
               mtWarning, [mbOk], 0);
end;

procedure TfrmPrincipal.actProdVendExecute(Sender: TObject);
begin
  frmProdutosVendidos.ShowModal;
end;

procedure TfrmPrincipal.actSobreExecute(Sender: TObject);
begin
  frmSobre.ShowModal;
end;

procedure TfrmPrincipal.actAbrirFestaExecute(Sender: TObject);
begin
  VerifFesta;
  if vgFestaAberta <> '0' then
  begin
    FiltrarFestas('FES_CODIGO', '=', vgFestaAberta, '0', '0');
    CriaFormMDI(TfrmFesta, frmFesta);
  end
  else
    MessageDlg('Não existe festa aberta, por favor crie a festa primeiro!', mtWarning, [mbOk], 0);
end;

procedure TfrmPrincipal.actBloquearExecute(Sender: TObject);
begin
  frmSenha.ShowModal;
  frmPrincipal.StatusBar1.Panels[4].Text := 'Usuário: ' + vgCodUsuarioLog + ' - ' + vgNomeUsuarioLog;
end;

procedure TfrmPrincipal.actCadCaixaExecute(Sender: TObject);
begin
  CriaFormMDI(TfrmCadCaixas, frmCadCaixas);
end;

procedure TfrmPrincipal.actCadLocaisExecute(Sender: TObject);
begin
  CriaFormMDI(TfrmCadLocais, frmCadLocais);
end;

procedure TfrmPrincipal.actCadUsuariosExecute(Sender: TObject);
begin
  CriaFormMDI(TfrmCadUsuarios, frmCadUsuarios);
end;

procedure TfrmPrincipal.actFechaAtivaExecute(Sender: TObject);
begin
  try
    ActiveMDIChild.Close;
  except
  end;
end;

procedure TfrmPrincipal.actFecharTodasExecute(Sender: TObject);
var
X : Byte;
begin
  if MDIChildCount > 0 then
    for X := 0 to Pred(MDIChildCount) do
      MDIChildren[X].Close;
end;

procedure TfrmPrincipal.actFinalizarExecute(Sender: TObject);
begin
  VerifFesta;
  if vgFestaAberta <> '0' then
  begin
    if VerifCaixaOpen = false then
    begin
      FiltrarFestas('FES_CODIGO', '=', vgFestaAberta, '0', '0');
      if MessageDlg('Deseja realmente finalizar a festa ' + NomeFesta + '?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        FinalizaFesta;
    end
    else
      MessageDlg('Existe(m) caixa(s) aberto(s) para fechamento!' +#13 + #13 + 'Favor efetuar o fechamento dos mesmos!', mtWarning, [mbok], 0);
  end
  else
    MessageDlg('Não existe festa aberta para finalizar!', mtInformation, [mbOK], 0);
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  {$IFDEF DEBUG}
    vgCodUsuarioLog := '0';
    vgNomeUsuarioLog := 'MASTER';
  {$ELSE IF}
    frmSenha.ShowModal;
  {$ENDIF}
  frmPrincipal.StatusBar1.Panels[4].Text := 'Usuário: ' + vgCodUsuarioLog + ' - ' + vgNomeUsuarioLog;
end;

procedure TfrmPrincipal.Timer1Timer(Sender: TObject);
begin
  StatusBar1.Panels[1].Text := DateToStr(now);
  StatusBar1.Panels[3].Text := TimeToStr(now);
  if frmFesta <> nil then
  begin
    frmFesta.StatusBar1.Panels[1].Text := DateToStr(now);
    frmFesta.StatusBar1.Panels[3].Text := TimeToStr(now);
  end;
end;

end.
