unit uConsCaixaGeral;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormNormal, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Data.DB, Vcl.Menus;

type
  TfrmConsCaixaGeral = class(TfrmTmpFormNormal)
    dsCaixas: TDataSource;
    DBGrid1: TDBGrid;
    btImprimir: TBitBtn;
    btDetalhes: TBitBtn;
    PopupMenu1: TPopupMenu;
    Detalhes1: TMenuItem;
    procedure Detalhes;
    procedure FormActivate(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
    procedure Detalhes1Click(Sender: TObject);
    procedure btDetalhesClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsCaixaGeral: TfrmConsCaixaGeral;

implementation

{$R *.dfm}

uses uDaoCaixatot, dataCadastros, uRelGeral, uPrincipal, uDaoMovHist, uDetCaixa,
  uDaoConsultas;

procedure TfrmConsCaixaGeral.Detalhes;
begin
  if dsCaixas.DataSet.FieldByName('CAI_NOME').IsNull then
    MessageDlg('É necessário selecionar um caixa!', mtWarning, [mbOk], 0)
  else
  begin
    VerifMovHist(dsCaixas.DataSet.FieldByName('FES_CODIGO').Text, dsCaixas.DataSet.FieldByName('LOC_CODIGO').Text,
                 dsCaixas.DataSet.FieldByName('CAI_CODIGO').Text, dsCaixas.DataSet.FieldByName('CXT_DATA').Text);
    ProdutosVendidosCaixa(dsCaixas.DataSet.FieldByName('FES_CODIGO').Text, dsCaixas.DataSet.FieldByName('CAI_CODIGO').Text,
                          dsCaixas.DataSet.FieldByName('LOC_CODIGO').Text);
    frmDetCaixa.ShowModal;
  end;
end;

procedure TfrmConsCaixaGeral.btDetalhesClick(Sender: TObject);
begin
  Detalhes;
end;

procedure TfrmConsCaixaGeral.btImprimirClick(Sender: TObject);
begin
  frmRelGeral.ShowModal;
end;

procedure TfrmConsCaixaGeral.Detalhes1Click(Sender: TObject);
begin
  Detalhes;
end;

procedure TfrmConsCaixaGeral.FormActivate(Sender: TObject);
begin
  inherited;
  ListarCaixaTot('T.CXT_DATA, C.CAI_NOME', '0');
  btFechar.SetFocus;
end;

procedure TfrmConsCaixaGeral.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    Close;
end;

end.
