unit uTmpCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormMDI, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.ToolWin, Vcl.ComCtrls, Vcl.ActnList, Vcl.ImgList, Data.DB,
  Vcl.DBCtrls, System.UITypes, Datasnap.Provider;

type
  TfrmTmpCadastro = class(TfrmTmpFormMDI)
    Panel1: TPanel;
    btNovo: TBitBtn;
    btAlterar: TBitBtn;
    btExcluir: TBitBtn;
    btGravar: TBitBtn;
    btCancelar: TBitBtn;
    btAtualizar: TBitBtn;
    btLimpar: TBitBtn;
    btProcurar: TBitBtn;
    ToolBar1: TToolBar;
    ToolButton6: TToolButton;
    tbLimpar: TToolButton;
    ToolButton9: TToolButton;
    tbProcurar: TToolButton;
    ToolButton11: TToolButton;
    ToolButton21: TToolButton;
    tbFechar: TToolButton;
    ActionList: TActionList;
    actNovo: TAction;
    actAlterar: TAction;
    actExcluir: TAction;
    actGravar: TAction;
    actCancelar: TAction;
    actAtualizar: TAction;
    actLimpar: TAction;
    actProcurar: TAction;
    actImprimeAtual: TAction;
    actImprimeTodos: TAction;
    actFechar: TAction;
    Imagens: TImageList;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    Panel2: TPanel;
    panCaption: TPanel;
    ToolButton3: TToolButton;
    actPrimeiro: TAction;
    actAnterior: TAction;
    actProximo: TAction;
    actUltimo: TAction;
    tbPrimeiro: TToolButton;
    tbAnterior: TToolButton;
    tbProximo: TToolButton;
    tbUltimo: TToolButton;
    sbPrincipal: TStatusBar;
    dsCadastro: TDataSource;
    BalloonHint1: TBalloonHint;
    procedure actNovoExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure actFecharExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure dsCadastroStateChange(Sender: TObject);
    procedure actAlterarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure actGravarExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure actPrimeiroExecute(Sender: TObject);
    procedure actAnteriorExecute(Sender: TObject);
    procedure actProximoExecute(Sender: TObject);
    procedure actUltimoExecute(Sender: TObject);
    procedure dsCadastroDataChange(Sender: TObject; Field: TField);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btLimparClick(Sender: TObject);
    procedure actLimparExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTmpCadastro: TfrmTmpCadastro;

implementation

{$R *.dfm}

procedure TfrmTmpCadastro.actAlterarExecute(Sender: TObject);
begin
  dsCadastro.DataSet.Edit;
end;

procedure TfrmTmpCadastro.actAnteriorExecute(Sender: TObject);
begin
  dsCadastro.DataSet.Prior;
end;

procedure TfrmTmpCadastro.actCancelarExecute(Sender: TObject);
begin
  dsCadastro.DataSet.Cancel;
end;

procedure TfrmTmpCadastro.actExcluirExecute(Sender: TObject);
Var
vRegistro: String;
begin
  Try
    vRegistro := dsCadastro.DataSet.Fields[0].Text + ' - ' + dsCadastro.DataSet.Fields[1].Text;
    if messagedlg('Deseja realmente apagar o registro ' + QuotedStr(vRegistro) + ' ?', mtConfirmation,[mbYes, mbNo],0) = mrYes then
    Begin
      dsCadastro.DataSet.Delete;
      //dsCadastro.DataSet.Refresh;
    end;
  except
    Begin
      Messagedlg('O registro não pode ser apagado!', mterror, [mbok], 0);
      dsCadastro.DataSet.Refresh;
    end;
  end;
end;

procedure TfrmTmpCadastro.actFecharExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmTmpCadastro.actGravarExecute(Sender: TObject);
begin
  Try
    dsCadastro.DataSet.Post;
  Except
    on E: Exception do
    Begin
      MessageDlg('Erro ao gravar Alteração / Inserção!' + #13#10 +
          E.Message,mtError,[mbOk],0);
      dsCadastro.DataSet.Refresh;
    end;
  end;
end;

procedure TfrmTmpCadastro.actLimparExecute(Sender: TObject);
begin
  dsCadastro.DataSet.Refresh;
end;

procedure TfrmTmpCadastro.actNovoExecute(Sender: TObject);
begin
  dsCadastro.DataSet.Insert;
end;

procedure TfrmTmpCadastro.actPrimeiroExecute(Sender: TObject);
begin
  dsCadastro.DataSet.First;
end;

procedure TfrmTmpCadastro.actProximoExecute(Sender: TObject);
begin
  dsCadastro.DataSet.Next;
end;

procedure TfrmTmpCadastro.actUltimoExecute(Sender: TObject);
begin
  dsCadastro.DataSet.Last;
end;

procedure TfrmTmpCadastro.btLimparClick(Sender: TObject);
begin
  inherited;
  sbPrincipal.Panels[3].Text := 'Inativo';
end;

procedure TfrmTmpCadastro.dsCadastroDataChange(Sender: TObject; Field: TField);
begin
  if dsCadastro.DataSet.Bof = true then
  begin
    actPrimeiro.Enabled := false;
    actAnterior.Enabled := false;
    actProximo.Enabled := true;
    actUltimo.Enabled := true;
  end;
  if dsCadastro.DataSet.Eof = true then
  begin
    actPrimeiro.Enabled := true;
    actAnterior.Enabled := true;
    actProximo.Enabled := false;
    actUltimo.Enabled := false;
  end;
  if ((dsCadastro.DataSet.Eof = false) and (dsCadastro.DataSet.Bof = false)) then
  begin
    actPrimeiro.Enabled := true;
    actAnterior.Enabled := true;
    actProximo.Enabled := true;
    actUltimo.Enabled := true;
  end;
end;

procedure TfrmTmpCadastro.dsCadastroStateChange(Sender: TObject);
begin
  if dsCadastro.DataSet.State in [dsInsert, dsEdit] then
  Begin
    actNovo.Enabled := False;
    actAlterar.Enabled := False;
    actExcluir.Enabled := False;
    actGravar.Enabled := True;
    actCancelar.Enabled := True;
    actProcurar.Enabled := False;
    actAtualizar.Enabled := False;
    actLimpar.Enabled := False;
    sbPrincipal.Panels[1].Text := 'Inserindo';
  end
  else
  Begin
    actNovo.Enabled := True;
    actAlterar.Enabled := True;
    actExcluir.Enabled := True;
    actGravar.Enabled := False;
    actCancelar.Enabled := False;
    actProcurar.Enabled := True;
    actAtualizar.Enabled := True;
    actLimpar.Enabled := True;
    sbPrincipal.Panels[1].Text := 'Visualizando';
  end;
end;

procedure TfrmTmpCadastro.FormActivate(Sender: TObject);
begin
  dsCadastro.DataSet.Active := True;
  sbPrincipal.Panels[3].Text := 'Inativo';
  panCaption.Caption := Self.Caption;
end;

procedure TfrmTmpCadastro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dsCadastro.DataSet.Close;
  inherited;
end;

procedure TfrmTmpCadastro.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if dsCadastro.DataSet.State in [dsInsert, dsEdit] then
  begin
    if MessageDlg('Existem informações pendentes que serão perdidas,' + #13 +
                  'deseja fechar assim mesmo?', mtConfirmation, [mbYes, mbNo], 0)
                   = mrYes then
    begin
      dsCadastro.DataSet.Cancel;
      CanClose := True;
    end
    else
      CanClose := False;
  end;
end;

end.
