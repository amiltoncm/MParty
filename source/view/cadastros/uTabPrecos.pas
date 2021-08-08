unit uTabPrecos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormNormal, Vcl.StdCtrls,
  Vcl.Buttons, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Menus, Vcl.ExtCtrls;

type
  TfrmTabPrecos = class(TfrmTmpFormNormal)
    dsTabPrecos: TDataSource;
    DBGrid1: TDBGrid;
    btImprimir: TBitBtn;
    PopupMenu1: TPopupMenu;
    Controledeestoque1: TMenuItem;
    Excluirdocontroledeestoque1: TMenuItem;
    Adicionarquantidadeaocontrole1: TMenuItem;
    N1: TMenuItem;
    pnEstoque: TPanel;
    dsEstoque: TDataSource;
    procedure FormActivate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btImprimirClick(Sender: TObject);
    procedure Controledeestoque1Click(Sender: TObject);
    procedure Adicionarquantidadeaocontrole1Click(Sender: TObject);
    procedure dsTabPrecosDataChange(Sender: TObject; Field: TField);
    procedure dsEstoqueDataChange(Sender: TObject; Field: TField);
    procedure Excluirdocontroledeestoque1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTabPrecos: TfrmTabPrecos;

implementation

{$R *.dfm}

uses dataCadastros, uDaoPrecos, uVarGlobal, uFuncoesValidacao, uDaoCaixatot,
uDaoMovHist, uRelTabPrecos, uDaoEstoque, uCadEstoque;

procedure TfrmTabPrecos.Adicionarquantidadeaocontrole1Click(Sender: TObject);
Var
vQuant: String;
begin
  if MessageDlg('Deseja realmente adiconar quantidade ao item (' + dsTabPrecos.DataSet.FieldByName('PRE_DESCRICAO').Text + ')?',
                mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    if InputQuery(dsTabPrecos.DataSet.FieldByName('PRE_DESCRICAO').Text, 'Digite a quantidade para adicionar', vQuant) then
    begin
      if TestaInteiro(vQuant) = true then
      begin
        FiltrarEstoque('PRE_CODIGO', '=', dsTabPrecos.DataSet.FieldByName('PRE_CODIGO').Text, '0');
        if dsEstoque.DataSet.FieldByName('PRE_CODIGO').IsNull then
          frmCadEstoque.ShowModal
        else
          AddEstoque(vQuant);
      end
      else
        MessageDlg('É necessário digitar uma quantidade válida!', mtWarning, [mbOk], 0);
    end;
  end;
end;

procedure TfrmTabPrecos.btImprimirClick(Sender: TObject);
begin
  frmRelTabPrecos.ShowModal;
end;

procedure TfrmTabPrecos.Controledeestoque1Click(Sender: TObject);
begin
  if VerificaEstoque(dsTabPrecos.DataSet.FieldByName('PRE_CODIGO').Text) = False then
    frmCadEstoque.ShowModal
  else
    MessageDlg('Este produto já contém saldo inicial para controle!', mtWarning, [mbOk], 0);
end;

procedure TfrmTabPrecos.dsEstoqueDataChange(Sender: TObject; Field: TField);
begin
  if dsEstoque.DataSet.FieldByName('PRE_CODIGO').IsNull then
    pnEstoque.Caption := 'Produto sem controle de estoque!'
  else
    pnEstoque.Caption := 'Estoque atual: ' + dsEstoque.DataSet.FieldByName('EST_QUANTIDADE').Text;
end;

procedure TfrmTabPrecos.dsTabPrecosDataChange(Sender: TObject; Field: TField);
begin
  if dsTabPrecos.DataSet.FieldByName('PRE_CODIGO').IsNull then
    FiltrarEstoque('PRE_CODIGO', '=', '0', '0')
  else
    FiltrarEstoque('PRE_CODIGO', '=', dsTabPrecos.DataSet.FieldByName('PRE_CODIGO').Text, '0');
end;

procedure TfrmTabPrecos.Excluirdocontroledeestoque1Click(Sender: TObject);
begin
  if MessageDlg('Deseja realmente excluir o controle de estoque do produto (' +
                dsTabPrecos.DataSet.FieldByName('PRE_DESCRICAO').Text + ')', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    if not(dsEstoque.DataSet.FieldByName('PRE_CODIGO').IsNull) then
      dsEstoque.DataSet.Delete;
  end;
end;

procedure TfrmTabPrecos.FormActivate(Sender: TObject);
begin
  FiltrarPrecos('PRE_STATUS', '=', 'A', 'PRE_DESCRICAO', '0');
  dsTabPrecos.DataSet.Active := True;
  dsEstoque.DataSet.Active := True;
  DBGrid1.SetFocus;
end;

procedure TfrmTabPrecos.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
  if dsTabPrecos.DataSet.State in [dsInsert, dsedit] then
  begin
    if MessageDlg('Existem pendências não gravadas!' + #13 +
                  'Deseja descartar as alterações?',
                  mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      dsTabPrecos.DataSet.Cancel;
      CanClose := true;
    end
    else
      CanClose := false;
  end;
  end;

end.
