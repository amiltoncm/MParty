unit uCadCaixas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpCadastro, Data.DB, Vcl.ImgList,
  Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, wwdbedit, Wwdotdot, Wwdbcomb;

const
InputBoxMessage = WM_USER + 200;

type
  TfrmCadCaixas = class(TfrmTmpCadastro)
    Label1: TLabel;
    dbCodigo: TDBEdit;
    Label2: TLabel;
    dbNome: TDBEdit;
    Label3: TLabel;
    dbSenha: TDBEdit;
    Label4: TLabel;
    cbAtivo: TwwDBComboBox;
    procedure InputBoxSetPasswordChar(var Msg: TMessage); Message InputBoxMessage;
    procedure actNovoExecute(Sender: TObject);
    procedure actAlterarExecute(Sender: TObject);
    procedure actAtualizarExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure actLimparExecute(Sender: TObject);
    procedure actProcurarExecute(Sender: TObject);
    procedure actGravarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadCaixas: TfrmCadCaixas;

implementation

{$R *.dfm}

uses dataCadastros, uDaoCaixas, uFuncoesDB, dataLookups, uProcCaixas,
  uFuncoesSeguranca;

procedure TfrmCadCaixas.InputBoxSetPasswordChar(var Msg: TMessage);
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

procedure TfrmCadCaixas.actAlterarExecute(Sender: TObject);
begin
  inherited;
  dbNome.SetFocus;
end;

procedure TfrmCadCaixas.actAtualizarExecute(Sender: TObject);
begin
  dsCadastro.DataSet.Refresh;
end;

procedure TfrmCadCaixas.actExcluirExecute(Sender: TObject);
begin
  if dsCadastro.DataSet.FieldByName('CAI_CODIGO').Value < 1 then
    MessageDlg('O caixa geral não pode ser apagado!', mtWarning, [mbOk], 0)
  else
    inherited;
end;

procedure TfrmCadCaixas.actGravarExecute(Sender: TObject);
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
      if dsCadastro.DataSet.State in [dsInsert] then
        dsCadastro.DataSet.FieldByName('CAI_CODIGO').Value := GetCodigo('CAI_CODIGO', 'CAIXAS');
      dsCadastro.DataSet.FieldByName('CAI_SENHA').Text := EncryptMsg((vSenha), Length(vSenha));
      dmLookups.Atualizar;
      inherited;
    end
    else
    begin
      Messagedlg('A senha não foi confirmada!', mtError, [mbok],0);
      dbSenha.SetFocus;
    end;
  end;
end;

procedure TfrmCadCaixas.actLimparExecute(Sender: TObject);
begin
  ListarCaixas('CAI_NOME');
  sbPrincipal.Panels[3].Text := 'Inativo';
  inherited;
end;

procedure TfrmCadCaixas.actNovoExecute(Sender: TObject);
begin
  inherited;
  dbNome.SetFocus;
end;

procedure TfrmCadCaixas.FormActivate(Sender: TObject);
begin
  inherited;
  ListarCaixas('CAI_NOME');
  dbNome.SetFocus;
end;

procedure TfrmCadCaixas.FormDestroy(Sender: TObject);
begin
  if frmCadCaixas <> nil then
    frmCadCaixas := nil;
end;

procedure TfrmCadCaixas.actProcurarExecute(Sender: TObject);
begin
  ListarCaixas('CAI_NOME');
  frmProcCaixas.ShowModal;
end;

end.
