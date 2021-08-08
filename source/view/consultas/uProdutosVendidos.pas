unit uProdutosVendidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormNormal, Vcl.StdCtrls,
  Vcl.Buttons, wwdblook, Data.DB, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid;

type
  TfrmProdutosVendidos = class(TfrmTmpFormNormal)
    cbFestas: TwwDBLookupCombo;
    dsProdutosVendidos: TDataSource;
    Label1: TLabel;
    btAtualizar: TBitBtn;
    btImprimir: TBitBtn;
    JvDBGrid1: TJvDBGrid;
    procedure FormActivate(Sender: TObject);
    procedure btAtualizarClick(Sender: TObject);
    procedure cbFestasKeyPress(Sender: TObject; var Key: Char);
    procedure btImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProdutosVendidos: TfrmProdutosVendidos;

implementation

{$R *.dfm}

uses dataConsultas, uDaoPrecos, uVarGlobal, dataLookups, uRelProdVend,
  uDaoConsultas;

procedure TfrmProdutosVendidos.btAtualizarClick(Sender: TObject);
begin
  if cbFestas.Text <> '' then
    ConsVendasFesta(dmLookups.lkFestasFES_CODIGO.Text)
  else
    MessageDlg('Você deve selecionar uma festa!', mtWarning, [mbOk], 0);
end;

procedure TfrmProdutosVendidos.btImprimirClick(Sender: TObject);
begin
  frmRelProdVend.lbFesta.Caption := 'Festa: ' + dmLookups.lkFestasFES_ANO.Text +
                                    ' (' + dmLookups.lkFestasFES_CODIGO.Text + ')' +
                                    ' de ' + dmLookups.lkFestasFES_DATAINIC.Text +
                                    ' a ' + dmLookups.lkFestasFES_DATAFINAL.Text;
  frmRelProdVend.ShowModal;
end;

procedure TfrmProdutosVendidos.cbFestasKeyPress(Sender: TObject; var Key: Char);
begin
  Key := #0;
end;

procedure TfrmProdutosVendidos.FormActivate(Sender: TObject);
begin
  inherited;
  cbFestas.Clear;
  ConsVendasFesta('0');
  cbFestas.SetFocus;
end;

end.
