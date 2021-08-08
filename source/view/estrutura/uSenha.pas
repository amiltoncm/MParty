unit uSenha;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Buttons, Inifiles;

type
  TfrmSenha = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    edUsuario: TEdit;
    edSenha: TEdit;
    btLogin: TBitBtn;
    btCancelar: TBitBtn;
    spTeclado: TSpeedButton;
    lbCaps: TLabel;
    BalloonHint1: TBalloonHint;
    procedure Login;
    procedure btCancelarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btLoginClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure spTecladoClick(Sender: TObject);
    procedure edSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure edSenhaMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure edSenhaEnter(Sender: TObject);
    procedure edSenhaChange(Sender: TObject);
    procedure edSenhaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edSenhaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
  private

  ComponentePro: TComponent;
  procedure ProCode(Sender: TObject);

  public
    { Public declarations }
  end;

var
  frmSenha: TfrmSenha;
  vlLoginOK: Char;
  vlTentativa: integer;

implementation

uses dataGestao, uVarGlobal, uTecladoVirtual, uFuncoesLogs,
  dataConfig, uDaoUsuarios, dataCadastros, uFuncoesSeguranca,
  uFuncoesSistema, uPrincipal;

{$R *.dfm}

procedure TfrmSenha.ProCode(Sender: TObject);
begin
  if Assigned(ComponentePro) then
    TEdit(ComponentePro).Color := clWindow; // cor ao sair
  if (ActiveControl is TCustomEdit) or
     (ActiveControl is TComboBox) or
     (ActiveControl is TMemo) then
  begin
    TEdit(ActiveControl).Color := clSkyBlue;  // cor ao focar
    ComponentePro := ActiveControl;
  end;
end;

procedure TfrmSenha.Login;
Var
vUser, vPassword: String;
begin
  vlTentativa := vlTentativa + 1;
  vUser := edUsuario.Text;
  vPassword := EncryptMsg((edSenha.Text), Length(edSenha.Text));
  if FiltLoginUsuarios(vUser, vPassword) = true then
  Begin
    //Atribui o código do usuário na variável global (uVarGlobal)
    vgCodUsuarioLog := dmCadastros.qyUsuariosUSU_CODIGO.text;
    vgNomeUsuarioLog := dmCadastros.qyUsuariosUSU_NOME.text;
    vlLoginOK := 'S';
    //Grava log de login
    GravaLog('Login', '');
    Close;
  end
  else
  Begin
    MessageDlg('Login ou Senha inválidos!' + #13 + 'Por favor tente novamente!', mtWarning, [mbok],0);
    edSenha.Clear;
    edUsuario.SetFocus;
    if vlTentativa = 3 then
    Begin
      //grava log de erro login
      GravaLog('Erro', 'Erro de login');
      MessageDlg('Você excedeu o número de tentativas!', mtError, [mbok],0);
      Close;
    end;
  end;
end;

procedure TfrmSenha.btCancelarClick(Sender: TObject);
begin
  GravaLog('Erro', 'Cancelamento de login');
  vlLoginOK := 'N';
  Close;
end;

procedure TfrmSenha.FormActivate(Sender: TObject);
Var
vControl: TInifile;
vUser, vBuscaUser: String;
begin
  Screen.OnActiveControlChange := ProCode;
  frmSenha.Caption := 'Acesso - '+ RetornaExecutavelSemExtensao + ' Vs. ' + VersaoSistema(0);
  vControl := Tinifile.create(vgArqini);
  vBuscaUser := vControl.readstring('usuario', 'busca','');
  if vBuscaUser = 'windows' then
  begin
    vUser := UsuarioWin;
    if vUser = '' then
      vUser := vControl.readstring('usuario', 'ultimo','');
  end;
  if vBuscaUser = 'ultimo' then
    vUser := vControl.readstring('usuario', 'ultimo','');
  vControl.Free;
  edUsuario.Clear;
  edUsuario.Text := vUser;
  edSenha.Clear;
  vlLoginOK := 'N';
  vlTentativa := 0;
  edSenha.SetFocus;
  btCancelar.Repaint;
  btLogin.Repaint;
  Image1.Repaint;
  frmSenha.Repaint;
end;

procedure TfrmSenha.btLoginClick(Sender: TObject);
begin
  Login;
end;

procedure TfrmSenha.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if vlLoginOK = 'N' then
     Application.Terminate;
end;

procedure TfrmSenha.FormCreate(Sender: TObject);
var
vHSysMenu: HMENU;
begin
  vHSysMenu := GetSystemMenu(Self.Handle, False);
  if vHSysMenu <> 0 then
  begin
    EnableMenuItem(vHSysMenu, SC_CLOSE,
    MF_BYCOMMAND Or MF_GRAYED);
    DrawMenuBar(Self.Handle);
  end;
end;

procedure TfrmSenha.FormDestroy(Sender: TObject);
begin
  Screen.OnActiveControlChange := nil;
end;

procedure TfrmSenha.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
  if key = #27 then
    Close;
end;

procedure TfrmSenha.spTecladoClick(Sender: TObject);
begin
  edSenha.Clear;
  frmTecladoVirtual.ShowModal;
end;

procedure TfrmSenha.edSenhaKeyPress(Sender: TObject; var Key: Char);
begin
  if TestaCaps = true then
    lbCaps.Visible := true
  else
    lbCaps.Visible := false;
  if key = #13 then
    Login
end;

procedure TfrmSenha.edSenhaMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
Var
vKeyState: TKeyboardState;
begin
   GetKeyboardState(vKeyState);
   if (vKeyState[VK_CAPITAL] = 0) then
      edSenha.Hint := 'Digite a senha para o acesso!'+#13+'O CAPS está DESATIVADO!'
   else
      edSenha.Hint := 'Digite a senha para o acesso!'+#13+'O CAPS está ATIVADO!'
end;

procedure TfrmSenha.edSenhaEnter(Sender: TObject);
begin
  if TestaCaps = true then
    lbCaps.Visible := true
  else
    lbCaps.Visible := false;
end;

procedure TfrmSenha.edSenhaChange(Sender: TObject);
begin
  if TestaCaps = true then
    lbCaps.Visible := true
  else
    lbCaps.Visible := false;
end;

procedure TfrmSenha.edSenhaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if TestaCaps = true then
    lbCaps.Visible := true
  else
    lbCaps.Visible := false;
end;

procedure TfrmSenha.edSenhaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if TestaCaps = true then
    lbCaps.Visible := true
  else
    lbCaps.Visible := false;
end;

end.
