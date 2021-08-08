unit uFesta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormMDI, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.ToolWin, Vcl.ComCtrls, Vcl.Menus, Vcl.ImgList, Vcl.ActnList;

type
  TfrmFesta = class(TfrmTmpFormMDI)
    ImgFundoTela: TImage;
    MainMenu1: TMainMenu;
    ToolBar1: TToolBar;
    ActionList1: TActionList;
    Imagens: TImageList;
    actTabPrecos: TAction;
    ToolButton1: TToolButton;
    Arquivo1: TMenuItem;
    abeladePreos1: TMenuItem;
    actAbrirCaixa: TAction;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    Caixas1: TMenuItem;
    Aberturadocaixa1: TMenuItem;
    ToolButton4: TToolButton;
    actFechar: TAction;
    ToolButton5: TToolButton;
    actMovCaixas: TAction;
    ToolButton6: TToolButton;
    Movimentaes1: TMenuItem;
    StatusBar1: TStatusBar;
    acVerCaixas: TAction;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    N1: TMenuItem;
    Vercaixas1: TMenuItem;
    N2: TMenuItem;
    Fechar1: TMenuItem;
    actConsEstoque: TAction;
    ToolButton7: TToolButton;
    ToolButton10: TToolButton;
    procedure FormActivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actTabPrecosExecute(Sender: TObject);
    procedure actAbrirCaixaExecute(Sender: TObject);
    procedure actFecharExecute(Sender: TObject);
    procedure actMovCaixasExecute(Sender: TObject);
    procedure acVerCaixasExecute(Sender: TObject);
    procedure actConsEstoqueExecute(Sender: TObject);
  private

    FClientInstance, FPrevClient: TFarProc;
    Procedure ClientWindow(Var Message: TMessage);

  public
    { Public declarations }
  end;

var
  frmFesta: TfrmFesta;

implementation

{$R *.dfm}

uses uDaoFestas, uVarGlobal, uTabPrecos, uNovoCaixa, uMovCaixa, uConsCaixaGeral,
  uConsEstoque, uDaoEstoque;

procedure TfrmFesta.actAbrirCaixaExecute(Sender: TObject);
begin
  frmNovoCaixa.ShowModal;
end;

procedure TfrmFesta.actConsEstoqueExecute(Sender: TObject);
begin
  ConsultaEstoque;
  frmConsEstoque.ShowModal;
end;

procedure TfrmFesta.actFecharExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmFesta.actMovCaixasExecute(Sender: TObject);
begin
  frmMovCaixa.ShowModal;
end;

procedure TfrmFesta.actTabPrecosExecute(Sender: TObject);
begin
  frmTabPrecos.ShowModal;
end;

procedure TfrmFesta.acVerCaixasExecute(Sender: TObject);
begin
  frmConsCaixaGeral.ShowModal;
end;

procedure TfrmFesta.ClientWindow(Var Message: TMessage);
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

procedure TfrmFesta.FormActivate(Sender: TObject);
begin
  Application.HintPause := 1000;
  inherited;
  Self.Caption := 'Festa ' + NomeFesta;
  Self.WindowState := wsMaximized;
end;

procedure TfrmFesta.FormCreate(Sender: TObject);
var
hSysMenu: HMENU;
begin
  inherited;
  if hSysMenu <> 0 then
  begin
    EnableMenuItem(hSysMenu, SC_CLOSE,
    MF_BYCOMMAND Or MF_GRAYED);
    DrawMenuBar(Self.Handle);
  end;
  //Carrega variáveis padrões
  hSysMenu := GetSystemMenu(Self.Handle, False);
  //Carrega imagem de fundo
  ImgFundoTela.Picture.LoadFromFile(vgFundo);
  FClientInstance := MakeObjectInstance(ClientWindow);
  FPrevClient := Pointer(GetWindowLong(ClientHandle, GWL_WNDPROC));
  SetWindowLong(ClientHandle, GWL_WNDPROC, Longint(FClientInstance));
end;

procedure TfrmFesta.FormDestroy(Sender: TObject);
begin
  inherited;
  if frmFesta <> nil then
    frmFesta := nil;
end;

end.
