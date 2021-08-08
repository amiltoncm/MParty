unit uMovCaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormNormal, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons, wwdblook, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.Menus, Vcl.ActnList, Vcl.Mask, Vcl.DBCtrls, JvExDBGrids, JvDBGrid;

type
  TfrmMovCaixa = class(TfrmTmpFormNormal)
    Panel1: TPanel;
    Label1: TLabel;
    cbCaixas: TwwDBLookupCombo;
    Panel2: TPanel;
    Panel3: TPanel;
    dsVendas: TDataSource;
    dsMovHist: TDataSource;
    Label2: TLabel;
    Label3: TLabel;
    PopupMenu1: TPopupMenu;
    PopupMenu2: TPopupMenu;
    actMoves: TActionList;
    Label4: TLabel;
    Label5: TLabel;
    dbTrocoInic: TDBEdit;
    dsTotalizacao: TDataSource;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBCheckBox1: TDBCheckBox;
    dbRetiradas: TDBEdit;
    dbTrocos: TDBEdit;
    dbTotProd: TDBEdit;
    dbTotCaixa: TDBEdit;
    Label9: TLabel;
    dbFechamento: TDBEdit;
    dbDiferenca: TDBEdit;
    dbLucro: TDBEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    btAtualizar: TBitBtn;
    Adicionarprodutoigual1: TMenuItem;
    Retornarproduto1: TMenuItem;
    N1: TMenuItem;
    Adicionarnovoproduto1: TMenuItem;
    N2: TMenuItem;
    Retiradadocaixa1: TMenuItem;
    Enviodetrocoaocaixa1: TMenuItem;
    N3: TMenuItem;
    Fechamentodocaixa1: TMenuItem;
    sbFechamento: TSpeedButton;
    btImprimir: TBitBtn;
    sbColetas: TSpeedButton;
    sbDoacoes: TSpeedButton;
    JvDBGrid1: TJvDBGrid;
    dsCaixa: TDataSource;
    dbLocal: TDBEdit;
    dbData: TDBEdit;
    Label13: TLabel;
    Label14: TLabel;
    GridItensVend: TJvDBGrid;
    procedure Retirada;
    procedure Troco;
    procedure Fechamento;
    procedure cbCaixasKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure btAtualizarClick(Sender: TObject);
    procedure Retiradadocaixa1Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure Enviodetrocoaocaixa1Click(Sender: TObject);
    procedure sbFechamentoClick(Sender: TObject);
    procedure Fechamentodocaixa1Click(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
    procedure sbColetasClick(Sender: TObject);
    procedure sbDoacoesClick(Sender: TObject);
    procedure dsMovHistDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMovCaixa: TfrmMovCaixa;

implementation

{$R *.dfm}

uses dataLookups, uDaoMovHist, dataCadastros, uPrincipal, uDaoCaixatot,
     uFuncoesValidacao, uTabPrecos, uVarGlobal, uFechamento, uRelCaixa,
  dataConsultas, uDaoConsultas, uFuncoesFormatacao;

procedure TfrmMovCaixa.Retirada;
Var
vValor: String;
begin
  if dsTotalizacao.DataSet .FieldByName('CXT_STATUS').Text = 'A' then
  begin
    InputQuery('Retirada (Saída)', 'Digite o valor da retirada do caixa ' , vValor);
    if TestaReal(vValor) = True then
      EfetuarRetirada(dmLookups.lkCaixaLocalCAI_CODIGO.Text, dmLookups.lkCaixaLocalLOC_CODIGO.Text, vValor)
    else
      MessageDlg('Valor inválido: ' + vValor, mtWarning, [mbok], 0);
  end
  else
    MessageDlg('Este caixa está fechado e não pode ser alterado!', mtWarning, [mbOk], 0);
end;

procedure TfrmMovCaixa.Troco;
Var
vValor: String;
begin
  if dsTotalizacao.DataSet .FieldByName('CXT_STATUS').Text = 'A' then
  begin
    InputQuery('Troco (Entrada)', 'Digite o valor do troco enviado ao caixa ' , vValor);
    if TestaReal(vValor) = True then
      EnviarTroco(dmLookups.lkCaixaLocalCAI_CODIGO.Text, dmLookups.lkCaixaLocalLOC_CODIGO.Text, vValor)
    else
      MessageDlg('Valor inválido: ' + vValor, mtWarning, [mbok], 0);
  end
  else
    MessageDlg('Este caixa está fechado e não pode ser alterado!', mtWarning, [mbOk], 0);
end;

procedure TfrmMovCaixa.Fechamento;
begin
  if Not(dsMovHist.DataSet.FieldByName('MVH_CODIGO').IsNull) then
  begin
    if dsTotalizacao.DataSet .FieldByName('CXT_STATUS').Text = 'A' then
    begin
      if MessageDlg('Deseja realmente fechar o caixa?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        frmFechamento.ShowModal
    end
    else
      MessageDlg('Este caixa está fechado e não pode ser alterado!', mtWarning, [mbOk], 0);
  end
  else
    MessageDlg('Você deve selecionar um caixa!', mtWarning, [mbOk], 0);
end;

procedure TfrmMovCaixa.Retiradadocaixa1Click(Sender: TObject);
begin
  Retirada;
end;

procedure TfrmMovCaixa.Fechamentodocaixa1Click(Sender: TObject);
begin
  Fechamento;
end;

procedure TfrmMovCaixa.FormActivate(Sender: TObject);
begin
  inherited;
  cbCaixas.Text := '';
  dmLookups.Atualizar;
  dsCaixa.DataSet.Active := True;
  VerifCaixas('0', '0', '0', '0', '0');
  VerifMovHist('0', '0', '0', '01/01/2000');
  SaldoCaixaTot('0', '0', '0', '01/01/2000');
  cbCaixas.SetFocus;
end;

procedure TfrmMovCaixa.SpeedButton4Click(Sender: TObject);
begin
  Troco;
end;

procedure TfrmMovCaixa.SpeedButton5Click(Sender: TObject);
begin
  Retirada;
end;

procedure TfrmMovCaixa.sbFechamentoClick(Sender: TObject);
begin
  Fechamento;
end;

procedure TfrmMovCaixa.sbColetasClick(Sender: TObject);
begin
  AtualizaSaldo(dmLookups.lkCaixaLocalCAI_CODIGO.Text, dmLookups.lkCaixaLocalLOC_CODIGO.Text);
end;

procedure TfrmMovCaixa.sbDoacoesClick(Sender: TObject);
begin
  AtualizaSaldo(dmLookups.lkCaixaLocalCAI_CODIGO.Text, dmLookups.lkCaixaLocalLOC_CODIGO.Text);
end;

procedure TfrmMovCaixa.btAtualizarClick(Sender: TObject);
begin
  if ((cbCaixas.Text <> '') and (cbCaixas.Text <> ' ')) then
  begin
    VerifMovHist(dmLookups.lkCaixaLocalFES_CODIGO.Text, dmLookups.lkCaixaLocalLOC_CODIGO.Text,
                 dmLookups.lkCaixaLocalCAI_CODIGO.Text, dmLookups.lkCaixaLocalCXT_DATA.Text);
    SaldoCaixaTot(dmLookups.lkCaixaLocalFES_CODIGO.Text, dmLookups.lkCaixaLocalLOC_CODIGO.Text,
                 dmLookups.lkCaixaLocalCAI_CODIGO.Text, dmLookups.lkCaixaLocalCXT_DATA.Text);
  end
  else
    MessageDlg('Você deve selecionar um caixa para efetuar o filtro!', mtWarning, [mbOk], 0);
end;

procedure TfrmMovCaixa.btImprimirClick(Sender: TObject);
begin
  frmRelCaixa.lbNomeCaixa.Caption := cbCaixas.Text;
  frmRelCaixa.ShowModal;
end;

procedure TfrmMovCaixa.cbCaixasKeyPress(Sender: TObject; var Key: Char);
begin
  Key := #0;
end;

procedure TfrmMovCaixa.dsMovHistDataChange(Sender: TObject; Field: TField);
begin
  if dsMovHist.DataSet.FieldByName('MVH_CODIGO').IsNull then
    ItensVendaCaixa('0', '0', '0')
  else
    ItensVendaCaixa(LimpaReal(dsMovHist.DataSet.FieldByName('MVH_CODIGO').Text),
                    dsMovHist.DataSet.FieldByName('CAI_CODIGO').Text,
                    dsMovHist.DataSet.FieldByName('LOC_CODIGO').Text);
end;

procedure TfrmMovCaixa.Enviodetrocoaocaixa1Click(Sender: TObject);
begin
  Troco;
end;

end.
