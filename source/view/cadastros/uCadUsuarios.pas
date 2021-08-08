unit uCadUsuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpCadastro, Data.DB, 
  Vcl.ImgList, Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, Vcl.Buttons, 
  Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, wwdbedit, Wwdotdot, Wwdbcomb;

const
InputBoxMessage = WM_USER + 200;

type
  TfrmCadUsuarios = class(TfrmTmpCadastro)
    lbCodigo: TLabel;
    dbCodigo: TDBEdit;
    lbDescricao: TLabel;
    dbDescricao: TDBEdit;
    Label1: TLabel;
    dbSenha: TDBEdit;
    cbAtivo: TwwDBComboBox;
    Label2: TLabel;
    procedure InputBoxSetPasswordChar(var Msg: TMessage); Message InputBoxMessage;
    procedure FormDestroy(Sender: TObject);
    procedure actGravarExecute(Sender: TObject);
    procedure actNovoExecute(Sender: TObject);
    procedure actAlterarExecute(Sender: TObject);
    procedure actAtualizarExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure actLimparExecute(Sender: TObject);
    procedure actProcurarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadUsuarios: TfrmCadUsuarios;

implementation

{$R *.dfm}

uses dataCadastros, uDaoUsuarios, uProcUsuarios, uFuncoesDB, uFuncoesSeguranca;

procedure TfrmCadUsuarios.InputBoxSetPasswordChar(var Msg: TMessage);
Var
hInputForm, hEdit: HWND;
Begin
  hInputForm := Screen.Forms[0].Handle;
  if (hInputForm <> 0) then
  Begin
    hEdit := FindWindowEx(hInputForm, 0, 'TEdit', nil);
    SendMessage(hEdit, EM_SETPASSWORDCHAR, Ord('*'),0);
  end;
end;

procedure TfrmCadUsuarios.FormDestroy(Sender: TObject);
begin
  inherited;
  if frmCadUsuarios <> nil then
    frmCadUsuarios := nil;
end;

procedure TfrmCadUsuarios.actGravarExecute(Sender: TObject);
Var
vSenha: string;
vOK: Boolean;
begin
  PostMessage(Handle, InputBoxMessage, 0, 0);
  vOK := InputQuery('Confirmação da senha', 'Digite a senha novamente', vSenha);
  if vOK then
  begin
    if vSenha = dbSenha.Text then
    begin
      dmCadastros.qyUsuariosusu_senha.Text := EncryptMsg((vSenha), Length(vSenha));
      if dsCadastro.DataSet.State in [dsInsert] then
        dsCadastro.DataSet.FieldByName('USU_CODIGO').Value := GetCodigo('USU_CODIGO', 'USUARIOS');
      inherited;
    end
    else
    begin
      Messagedlg('A senha não foi confirmada!', mtError, [mbok],0);
      dbSenha.SetFocus;
    end;
  end;
end;

procedure TfrmCadUsuarios.actAlterarExecute(Sender: TObject);
begin
  inherited;
  dbDescricao.SetFocus;
end;

procedure TfrmCadUsuarios.actAtualizarExecute(Sender: TObject);
begin
  dsCadastro.DataSet.Refresh;
end;

procedure TfrmCadUsuarios.actExcluirExecute(Sender: TObject);
begin
  if dsCadastro.DataSet.FieldByName('USU_CODIGO').Value > 0 then
    inherited
  else
    MessageDlg('O usuário MASTER não pode ser apagado!', mtWarning, [mbOk], 0);
end;

procedure TfrmCadUsuarios.actLimparExecute(Sender: TObject);
begin
  ListarUsuarios('USU_NOME');
  sbPrincipal.Panels[3].Text := 'Inativo';
  inherited;
end;

procedure TfrmCadUsuarios.actNovoExecute(Sender: TObject);
begin
  inherited;
  dbDescricao.SetFocus;
end;

procedure TfrmCadUsuarios.FormActivate(Sender: TObject);
begin
  inherited;
  ListarUsuarios('USU_NOME');
  dbDescricao.SetFocus;
end;

procedure TfrmCadUsuarios.actProcurarExecute(Sender: TObject);
begin
  ListarUsuarios('USU_NOME');
  frmProcUsuarios.ShowModal;
end;

end.
