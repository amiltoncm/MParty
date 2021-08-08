unit uFechamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormNormal, Vcl.StdCtrls,
  Vcl.Buttons, Data.DB, Vcl.Mask, Vcl.DBCtrls;

type
  TfrmFechamento = class(TfrmTmpFormNormal)
    Label1: TLabel;
    dbCaixa: TDBEdit;
    dsFechamento: TDataSource;
    Label2: TLabel;
    dbLocal: TDBEdit;
    Label3: TLabel;
    dbTrocoInic: TDBEdit;
    Label4: TLabel;
    dbTotRetir: TDBEdit;
    Label5: TLabel;
    dbTrocos: TDBEdit;
    Label6: TLabel;
    dbTotVend: TDBEdit;
    Label7: TLabel;
    dbVlrTotal: TDBEdit;
    Label8: TLabel;
    dbVlrFechamento: TDBEdit;
    Label9: TLabel;
    dbVlrDif: TDBEdit;
    Label10: TLabel;
    dbVlrLucro: TDBEdit;
    btGravar: TBitBtn;
    edVlrFechamento: TEdit;
    procedure FormActivate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btGravarClick(Sender: TObject);
    procedure dbVlrFechamentoExit(Sender: TObject);
    procedure dbVlrFechamentoKeyPress(Sender: TObject; var Key: Char);
    procedure edVlrFechamentoExit(Sender: TObject);
    procedure edVlrFechamentoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFechamento: TfrmFechamento;

implementation

{$R *.dfm}

uses uDaoCaixatot, dataCadastros, uFuncoesFormatacao, uFesta, uFuncoesValidacao;

procedure TfrmFechamento.btGravarClick(Sender: TObject);
begin
  try
    dsFechamento.DataSet.FieldByName('CXT_STATUS').Text := 'F';
    dsFechamento.DataSet.Post;
    MessageDlg('Caixa fechado com sucesso!', mtInformation, [mbok], 0);
    dmCadastros.qyCaixaTot.Refresh;
    Close;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao gravar Alteração / Inserção!' + #13#10 +
                  E.Message,mtError,[mbOk],0);
      dmCadastros.qyCaixaTot.Refresh;
    end;
  end;
end;

procedure TfrmFechamento.dbVlrFechamentoExit(Sender: TObject);
Var
vVlrTotCx, vVlrVend, vVlrFech, vVlrDif, vVlrLuc, vVlrTrocoInic: real;
begin
  dsFechamento.DataSet.FieldByName('CXT_VLRTOTAL').EditMask := '#########0.00';
  vVlrTotCx := dsFechamento.DataSet.FieldByName('CXT_VLRTOTAL').Value;
  vVlrVend := dsFechamento.DataSet.FieldByName('CXT_TOTALVEND').Value;
  vVlrFech := dsFechamento.DataSet.FieldByName('CXT_VLRFECHAMENTO').Value;
  vVlrTrocoInic := dsFechamento.DataSet.FieldByName('CXT_TROCOINIC').Value;
  //Calcular diferença
  vVlrDif := vVlrFech - vVlrTotCx;
  dsFechamento.DataSet.FieldByName('CXT_VLRDIFERENCA').Value := vVlrDif;
  //Calcular lucro
  vVlrLuc := vVlrVend - vVlrTrocoInic + vVlrDif;
  dsFechamento.DataSet.FieldByName('CXT_VLRLUCRO').Value := vVlrLuc;
  dsFechamento.DataSet.FieldByName('CXT_VLRTOTAL').EditMask := '#,###,###,##0.00';
end;

procedure TfrmFechamento.dbVlrFechamentoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Key := NumeroReal(key);
end;

procedure TfrmFechamento.edVlrFechamentoExit(Sender: TObject);
Var
vVlrTotCx, vVlrVend, vVlrFech, vVlrDif, vVlrLuc, vVlrTrocoInic: real;
begin
  if TestaReal(edVlrFechamento.Text) = true then
  begin
    vVlrFech := StrToFloat(edVlrFechamento.Text);
    edVlrFechamento.Text := FormatFloat('#,###,###,##0.00', vVlrFech);
    dsFechamento.DataSet.FieldByName('CXT_VLRFECHAMENTO').Value := vVlrFech;
    vVlrTotCx := dsFechamento.DataSet.FieldByName('CXT_VLRTOTAL').Value;
    vVlrVend := dsFechamento.DataSet.FieldByName('CXT_TOTALVEND').Value;
    vVlrTrocoInic := dsFechamento.DataSet.FieldByName('CXT_TROCOINIC').Value;
    //Calcular diferença
    vVlrDif := vVlrFech - vVlrTotCx;
    dsFechamento.DataSet.FieldByName('CXT_VLRDIFERENCA').Value := vVlrDif;
    //Calcular lucro
    vVlrLuc := vVlrVend - vVlrTrocoInic + vVlrDif;
    dsFechamento.DataSet.FieldByName('CXT_VLRLUCRO').Value := vVlrLuc;
  end
  else
    MessageDlg('Valor inválido para o tipo de dados: real!', mtWarning, [mbOk], 0);
end;

procedure TfrmFechamento.edVlrFechamentoKeyPress(Sender: TObject;
  var Key: Char);
begin
  key := NumeroReal(key);
end;

procedure TfrmFechamento.FormActivate(Sender: TObject);
begin
  inherited;
  dsFechamento.DataSet.Edit;
  edVlrFechamento.Clear;
  edVlrFechamento.SetFocus;
end;

procedure TfrmFechamento.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if dsFechamento.DataSet.State in [dsEdit] then
  begin
    if MessageDlg('Deseja realmente cancelar o fechamento do caixa ' + dbCaixa.Text + '?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      CanClose := true
    else
      CanClose := false;
  end;
end;

end.
