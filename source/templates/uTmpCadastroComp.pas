unit uTmpCadastroComp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uTmpFormMDI, StdCtrls, Buttons, ImgList, ActnList, Db, ExtCtrls, ComCtrls,
  ToolWin, Grids, DBGrids;

type
  TfrmTmpCadastroComp = class(TfrmTmpFormMDI)
    ToolBar1: TToolBar;
    tbInserir: TToolButton;
    tbEditar: TToolButton;
    tbDeletar: TToolButton;
    tbGravar: TToolButton;
    tbCancelar: TToolButton;
    ToolButton6: TToolButton;
    tbAtualizar: TToolButton;
    ToolButton8: TToolButton;
    tbProcurar: TToolButton;
    ToolButton10: TToolButton;
    tbImprimeAtual: TToolButton;
    tbImprimeTodos: TToolButton;
    ToolButton13: TToolButton;
    tbPrimeiro: TToolButton;
    tbMenos: TToolButton;
    tbAnterior: TToolButton;
    tbProximo: TToolButton;
    tbMais: TToolButton;
    tbUltimo: TToolButton;
    ToolButton2: TToolButton;
    tbFechar: TToolButton;
    pnPrincipal: TPanel;
    pnBotoes: TPanel;
    btInserir: TBitBtn;
    btAlterar: TBitBtn;
    btDeletar: TBitBtn;
    btGravar: TBitBtn;
    btCancelar: TBitBtn;
    btArualizar: TBitBtn;
    btProcurar: TBitBtn;
    dsCadastro: TDataSource;
    actCadastro: TActionList;
    actInserir: TAction;
    actEditar: TAction;
    actDeletar: TAction;
    actGravar: TAction;
    actCancelar: TAction;
    actAtualizar: TAction;
    actProcurar: TAction;
    actFechar: TAction;
    actRelAtual: TAction;
    actRelAll: TAction;
    actPrimeiro: TAction;
    actMenos3: TAction;
    actAnterior: TAction;
    actProximo: TAction;
    actMais3: TAction;
    actUltimo: TAction;
    ImageStatus: TImageList;
    ToolButton1: TToolButton;
    actLimpaFiltro: TAction;
    pgPrincipal: TPageControl;
    tsMestre: TTabSheet;
    tsDetalhe: TTabSheet;
    spAnterior: TSpeedButton;
    spProxima: TSpeedButton;
    btLimpar: TBitBtn;
    ToolButton3: TToolButton;
    dsDetalhes: TDataSource;
    tbDetalhe: TToolBar;
    tbInserirDet: TToolButton;
    tbEditarDet: TToolButton;
    tbDeletarDet: TToolButton;
    tbGravarDet: TToolButton;
    tbCancelarDet: TToolButton;
    GridDetalhes: TDBGrid;
    btInserirDet: TBitBtn;
    btEditarDet: TBitBtn;
    btDeletarDet: TBitBtn;
    btGravarDet: TBitBtn;
    btCancelarDet: TBitBtn;
    Panel1: TPanel;
    Label10: TLabel;
    actPagePrior: TAction;
    actPageNext: TAction;
    procedure actInserirExecute(Sender: TObject);
    procedure actEditarExecute(Sender: TObject);
    procedure actDeletarExecute(Sender: TObject);
    procedure actGravarExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure actAtualizarExecute(Sender: TObject);
    procedure actFecharExecute(Sender: TObject);
    procedure actPrimeiroExecute(Sender: TObject);
    procedure actMenos3Execute(Sender: TObject);
    procedure actAnteriorExecute(Sender: TObject);
    procedure actProximoExecute(Sender: TObject);
    procedure actMais3Execute(Sender: TObject);
    procedure actUltimoExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure dsCadastroDataChange(Sender: TObject; Field: TField);
    procedure dsCadastroStateChange(Sender: TObject);
    procedure tbInserirDetClick(Sender: TObject);
    procedure tbEditarDetClick(Sender: TObject);
    procedure tbDeletarDetClick(Sender: TObject);
    procedure tbGravarDetClick(Sender: TObject);
    procedure tbCancelarDetClick(Sender: TObject);
    procedure dsDetalhesStateChange(Sender: TObject);
    procedure btInserirDetClick(Sender: TObject);
    procedure btEditarDetClick(Sender: TObject);
    procedure btDeletarDetClick(Sender: TObject);
    procedure btGravarDetClick(Sender: TObject);
    procedure btCancelarDetClick(Sender: TObject);
    procedure GridDetalhesDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure actPagePriorExecute(Sender: TObject);
    procedure actPageNextExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTmpCadastroComp: TfrmTmpCadastroComp;

implementation

uses uPrincipal;

{$R *.DFM}

procedure TfrmTmpCadastroComp.actInserirExecute(Sender: TObject);
begin
  dsCadastro.DataSet.Insert;
end;

procedure TfrmTmpCadastroComp.actEditarExecute(Sender: TObject);
begin
  dsCadastro.DataSet.Edit;
end;

procedure TfrmTmpCadastroComp.actDeletarExecute(Sender: TObject);
Var
vRegistro: String;
begin
  Try
    vRegistro := dsCadastro.DataSet.Fields[0].Text + ' - ' + dsCadastro.DataSet.Fields[1].Text;
    if messagedlg('Deseja realmente apagar o registro ' + QuotedStr(vRegistro) + ' ?', mtConfirmation,[mbYes, mbNo],0) = mrYes then
    Begin
      dsCadastro.DataSet.Delete;
      dsCadastro.DataSet.Refresh;
    end;
  except
    Begin
      Messagedlg('O registro não pode ser apagado!', mterror, [mbok], 0);
      dsCadastro.DataSet.Refresh;
    end;
  end;
end;

procedure TfrmTmpCadastroComp.actGravarExecute(Sender: TObject);
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

procedure TfrmTmpCadastroComp.actCancelarExecute(Sender: TObject);
begin
  dsCadastro.DataSet.Cancel;
end;

procedure TfrmTmpCadastroComp.actAtualizarExecute(Sender: TObject);
begin
  dsCadastro.DataSet.Refresh;
end;

procedure TfrmTmpCadastroComp.actFecharExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmTmpCadastroComp.actPrimeiroExecute(Sender: TObject);
begin
  dsCadastro.DataSet.First;
end;

procedure TfrmTmpCadastroComp.actMenos3Execute(Sender: TObject);
begin
  dsCadastro.DataSet.MoveBy(-3);
end;

procedure TfrmTmpCadastroComp.actAnteriorExecute(Sender: TObject);
begin
  dsCadastro.DataSet.Prior;
end;

procedure TfrmTmpCadastroComp.actProximoExecute(Sender: TObject);
begin
  dsCadastro.DataSet.Next;
end;

procedure TfrmTmpCadastroComp.actMais3Execute(Sender: TObject);
begin
  dsCadastro.DataSet.MoveBy(3);
end;

procedure TfrmTmpCadastroComp.actUltimoExecute(Sender: TObject);
begin
  dsCadastro.DataSet.Last;
end;

procedure TfrmTmpCadastroComp.FormActivate(Sender: TObject);
begin
  dsCadastro.DataSet.Active := True;
  dsDetalhes.DataSet.Active := True;
  pgPrincipal.ActivePage := tsMestre;
end;

procedure TfrmTmpCadastroComp.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if dsCadastro.DataSet.State in [dsInsert, dsEdit] then
    if Messagedlg('Existem alterações pendentes,' + #13 + 'deseja salvar?', mtConfirmation,
     [mbYes, mbNo],0) = mrYes then
      Canclose := False
    else
    begin
      dsCadastro.DataSet.Cancel;
      Canclose := True;
    end;
end;

procedure TfrmTmpCadastroComp.dsCadastroDataChange(Sender: TObject;
  Field: TField);
begin
  if dsCadastro.DataSet.Bof = true then
  begin
    actPrimeiro.Enabled := false;
    actMenos3.Enabled := false;
    actAnterior.Enabled := false;
    actProximo.Enabled := true;
    actMais3.Enabled := true;
    actUltimo.Enabled := true;
  end;
  if dsCadastro.DataSet.Eof = true then
  begin
    actPrimeiro.Enabled := true;
    actMenos3.Enabled := true;
    actAnterior.Enabled := true;
    actProximo.Enabled := false;
    actMais3.Enabled := false;
    actUltimo.Enabled := false;
  end;
  if ((dsCadastro.DataSet.Eof = false) and (dsCadastro.DataSet.Bof = false)) then
  begin
    actPrimeiro.Enabled := true;
    actMenos3.Enabled := true;
    actAnterior.Enabled := true;
    actProximo.Enabled := true;
    actMais3.Enabled := true;
    actUltimo.Enabled := true;
  end;
end;

procedure TfrmTmpCadastroComp.dsCadastroStateChange(Sender: TObject);
begin
  if dsCadastro.DataSet.State in [dsInsert, dsEdit] then
  Begin
    actInserir.Enabled := False;
    actEditar.Enabled := False;
    actDeletar.Enabled := False;
    actGravar.Enabled := True;
    actCancelar.Enabled := True;
    actProcurar.Enabled := False;
    actAtualizar.Enabled := False;
  end
  else
  Begin
    actInserir.Enabled := True;
    actEditar.Enabled := True;
    actDeletar.Enabled := True;
    actGravar.Enabled := False;
    actCancelar.Enabled := False;
    actProcurar.Enabled := True;
    actAtualizar.Enabled := True;
  end;
end;

procedure TfrmTmpCadastroComp.tbInserirDetClick(Sender: TObject);
begin
  dsDetalhes.DataSet.Insert;
end;

procedure TfrmTmpCadastroComp.tbEditarDetClick(Sender: TObject);
begin
  dsDetalhes.DataSet.Edit;
end;

procedure TfrmTmpCadastroComp.tbDeletarDetClick(Sender: TObject);
Var
vRegistro: String;
begin
  Try
    vRegistro := dsDetalhes.DataSet.Fields[0].Text + ' - ' + dsDetalhes.DataSet.Fields[1].Text;
    if messagedlg('Deseja realmente apagar o registro ' + QuotedStr(vRegistro) + ' ?', mtConfirmation,[mbYes, mbNo],0) = mrYes then
    Begin
      dsDetalhes.DataSet.Delete;
      dsDetalhes.DataSet.Refresh;
    end;
  except
    Begin
      Messagedlg('O registro não pode ser apagado!', mterror, [mbok], 0);
      dsDetalhes.DataSet.Refresh;
    end;
  end;
end;

procedure TfrmTmpCadastroComp.tbGravarDetClick(Sender: TObject);
begin
  Try
    dsDetalhes.DataSet.Post;
  Except
    on E: Exception do
    Begin
      MessageDlg('Erro ao gravar Alteração / Inserção!' + #13#10 +
          E.Message,mtError,[mbOk],0);
      dsDetalhes.DataSet.Refresh;
    end;
  end;
end;

procedure TfrmTmpCadastroComp.tbCancelarDetClick(Sender: TObject);
begin
  dsDetalhes.DataSet.Cancel;
end;

procedure TfrmTmpCadastroComp.dsDetalhesStateChange(Sender: TObject);
begin
  if dsDetalhes.DataSet.State in [dsInsert, dsEdit] then
  Begin
    tbInserirDet.Enabled := False;
    tbEditarDet.Enabled := False;
    tbDeletarDet.Enabled := False;
    tbGravarDet.Enabled := True;
    tbCancelarDet.Enabled := True;
    btInserirDet.Enabled := False;
    btEditarDet.Enabled := False;
    btDeletarDet.Enabled := False;
    btGravarDet.Enabled := True;
    btCancelarDet.Enabled := True;
  end
  else
  Begin
    tbInserirDet.Enabled := True;
    tbEditarDet.Enabled := True;
    tbDeletarDet.Enabled := True;
    tbGravarDet.Enabled := False;
    tbCancelarDet.Enabled := False;
    btInserirDet.Enabled := True;
    btEditarDet.Enabled := True;
    btDeletarDet.Enabled := True;
    btGravarDet.Enabled := False;
    btCancelarDet.Enabled := False;
  end;
end;

procedure TfrmTmpCadastroComp.btInserirDetClick(Sender: TObject);
begin
  dsDetalhes.DataSet.Insert;
end;

procedure TfrmTmpCadastroComp.btEditarDetClick(Sender: TObject);
begin
  dsDetalhes.DataSet.Edit;
end;

procedure TfrmTmpCadastroComp.btDeletarDetClick(Sender: TObject);
Var
vRegistro: String;
begin
  Try
    vRegistro := dsDetalhes.DataSet.Fields[0].Text + ' - ' + dsDetalhes.DataSet.Fields[1].Text;
    if messagedlg('Deseja realmente apagar o registro ' + QuotedStr(vRegistro) + ' ?', mtConfirmation,[mbYes, mbNo],0) = mrYes then
    Begin
      dsDetalhes.DataSet.Delete;
      dsDetalhes.DataSet.Refresh;
    end;
  except
    Begin
      Messagedlg('O registro não pode ser apagado!', mterror, [mbok], 0);
      dsDetalhes.DataSet.Refresh;
    end;
  end;
end;

procedure TfrmTmpCadastroComp.btGravarDetClick(Sender: TObject);
begin
  Try
    dsDetalhes.DataSet.Post;
  Except
    on E: Exception do
    Begin
      MessageDlg('Erro ao gravar Alteração / Inserção!' + #13#10 +
          E.Message,mtError,[mbOk],0);
      dsDetalhes.DataSet.Refresh;
    end;
  end;
end;

procedure TfrmTmpCadastroComp.btCancelarDetClick(Sender: TObject);
begin
  dsDetalhes.DataSet.Cancel;
end;

procedure TfrmTmpCadastroComp.GridDetalhesDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if odd(dsDetalhes.DataSet.RecNo) then
    GridDetalhes.Canvas.Brush.Color := clBtnFace
  else
    GridDetalhes.Canvas.Brush.Color:= clWhite;
  TDBGrid(Sender).Canvas.font.Color:= clBlack;
  if gdSelected in State then
    with (Sender as TDBGrid).Canvas do
    begin
      Brush.Color := clRed;
      FillRect(Rect);
      Font.Style := [fsbold];
    end;
  TDBGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);
end;

procedure TfrmTmpCadastroComp.actPagePriorExecute(Sender: TObject);
begin
  if pgPrincipal.ActivePage <> tsMestre then
    pgPrincipal.ActivePageIndex := pgPrincipal.ActivePageIndex - 1;
end;

procedure TfrmTmpCadastroComp.actPageNextExecute(Sender: TObject);
begin
  if pgPrincipal.ActivePage <> tsDetalhe then
    pgPrincipal.ActivePageIndex := pgPrincipal.ActivePageIndex + 1;
end;

end.
