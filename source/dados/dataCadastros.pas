unit dataCadastros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dataTmpConexao, DB, SDEngine;

type
  TdmCadastros = class(TdmTmpConexao)
    qyUsuarios: TSDQuery;
    SessaoCadastros: TSDSession;
    updUsuarios: TSDUpdateSQL;
    qyUsuariosUSU_CODIGO: TIntegerField;
    qyUsuariosUSU_NOME: TStringField;
    qyUsuariosUSU_SENHA: TStringField;
    qyUsuariosUSU_ATIVO: TStringField;
    qyCaixas: TSDQuery;
    qyFestas: TSDQuery;
    qyCaixaTot: TSDQuery;
    qyCaixaTotFES_CODIGO: TIntegerField;
    qyCaixaTotFES_ANO: TIntegerField;
    qyCaixaTotLOC_CODIGO: TIntegerField;
    qyCaixaTotLOC_DESCRICAO: TStringField;
    qyCaixaTotCAI_CODIGO: TIntegerField;
    qyCaixaTotCAI_NOME: TStringField;
    qyCaixaTotCXT_TROCOINIC: TFloatField;
    qyCaixaTotCXT_TOTRETIR: TFloatField;
    qyCaixaTotCXT_TOTALVEND: TFloatField;
    qyCaixaTotCXT_VLRTOTAL: TFloatField;
    qyLocais: TSDQuery;
    qyPrecos: TSDQuery;
    qyCaixasCAI_CODIGO: TIntegerField;
    qyCaixasCAI_NOME: TStringField;
    qyLocaisLOC_CODIGO: TIntegerField;
    qyLocaisLOC_DESCRICAO: TStringField;
    updCaixas: TSDUpdateSQL;
    updCaixaTot: TSDUpdateSQL;
    updFestas: TSDUpdateSQL;
    updLocais: TSDUpdateSQL;
    updPrecos: TSDUpdateSQL;
    qyFestasFES_CODIGO: TIntegerField;
    qyFestasFES_ANO: TIntegerField;
    qyFestasFES_DATAINIC: TDateTimeField;
    qyFestasFES_DATAFINAL: TDateTimeField;
    qyFestasFES_STATUS: TStringField;
    qyPrecosPRE_CODIGO: TIntegerField;
    qyPrecosPRE_DESCRICAO: TStringField;
    qyPrecosPRE_PRECO: TFloatField;
    qyPrecosPRE_STATUS: TStringField;
    qyCaixaTotCXT_STATUS: TStringField;
    qyMovHist: TSDQuery;
    updMovHist: TSDUpdateSQL;
    qyMovHistMVH_CODIGO: TIntegerField;
    qyMovHistFES_CODIGO: TIntegerField;
    qyMovHistLOC_CODIGO: TIntegerField;
    qyMovHistCAI_CODIGO: TIntegerField;
    qyCaixaTotCXT_VLRTROCOS: TFloatField;
    qyCaixaTotCXT_VLRFECHAMENTO: TFloatField;
    qyCaixaTotCXT_VLRDIFERENCA: TFloatField;
    qyCaixaTotCXT_VLRLUCRO: TFloatField;
    qyCaixaTotCXT_DATA: TDateTimeField;
    qyFestasDatas: TSDQuery;
    qyFestasDatasFES_CODIGO: TIntegerField;
    qyFestasDatasFES_DATA: TDateTimeField;
    updFestasDatas: TSDUpdateSQL;
    qyCaixasCAI_SENHA: TStringField;
    qyCaixasCAI_ATIVO: TStringField;
    qyMovHistMVH_TOTAL: TFloatField;
    qyMovHistMVH_PAGO: TFloatField;
    qyMovHistMVH_TROCO: TFloatField;
    qyMovHistCXT_DATA: TDateTimeField;
    qyMovHistMVH_TRANSACAO: TStringField;
    qyMovHistMVH_DTHR: TDateTimeField;
    qyItensVend: TSDQuery;
    updItensVend: TSDUpdateSQL;
    qyItensVendITV_CODIGO: TIntegerField;
    qyItensVendMVH_CODIGO: TIntegerField;
    qyItensVendFES_CODIGO: TIntegerField;
    qyItensVendCAI_CODIGO: TIntegerField;
    qyItensVendLOC_CODIGO: TIntegerField;
    qyItensVendPRE_CODIGO: TIntegerField;
    qyItensVendPRE_DESCRICAO: TStringField;
    qyItensVendITV_QUANTIDADE: TFloatField;
    qyItensVendITV_UNITARIO: TFloatField;
    qyItensVendITV_TOTAL: TFloatField;
    qyMovHistMVH_FINALIZADO: TStringField;
    qyEstoque: TSDQuery;
    updEstoque: TSDUpdateSQL;
    qyEstoqueEST_CODIGO: TIntegerField;
    qyEstoquePRE_CODIGO: TIntegerField;
    qyEstoqueEST_QUANTIDADE: TFloatField;
    qySistema: TSDQuery;
    updSistema: TSDUpdateSQL;
    qySistemaSIS_CODIGO: TIntegerField;
    qySistemaSIS_ID: TStringField;
    qySistemaSIS_VALIDATE: TDateTimeField;
    qySistemaSIS_SERIAL: TStringField;
    procedure qyCaixasAfterDelete(DataSet: TDataSet);
    procedure qyCaixasAfterPost(DataSet: TDataSet);
    procedure qyCaixasBeforeDelete(DataSet: TDataSet);
    procedure qyCaixasBeforePost(DataSet: TDataSet);
    procedure qyCaixasPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qyCaixasUpdateError(DataSet: TDataSet; E: EDatabaseError;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure qyCaixasAfterInsert(DataSet: TDataSet);
    procedure qyFestasAfterDelete(DataSet: TDataSet);
    procedure qyFestasAfterPost(DataSet: TDataSet);
    procedure qyFestasBeforeDelete(DataSet: TDataSet);
    procedure qyFestasBeforePost(DataSet: TDataSet);
    procedure qyFestasUpdateError(DataSet: TDataSet; E: EDatabaseError;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure qyFestasAfterInsert(DataSet: TDataSet);
    procedure qyCaixaTotAfterDelete(DataSet: TDataSet);
    procedure qyCaixaTotAfterPost(DataSet: TDataSet);
    procedure qyCaixaTotBeforeDelete(DataSet: TDataSet);
    procedure qyCaixaTotBeforePost(DataSet: TDataSet);
    procedure qyCaixaTotPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qyCaixaTotUpdateError(DataSet: TDataSet; E: EDatabaseError;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure qyCaixaTotAfterInsert(DataSet: TDataSet);
    procedure qyLocaisAfterDelete(DataSet: TDataSet);
    procedure qyLocaisAfterPost(DataSet: TDataSet);
    procedure qyLocaisBeforeDelete(DataSet: TDataSet);
    procedure qyLocaisBeforePost(DataSet: TDataSet);
    procedure qyLocaisPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qyLocaisUpdateError(DataSet: TDataSet; E: EDatabaseError;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure qyLocaisAfterInsert(DataSet: TDataSet);
    procedure qyPrecosAfterDelete(DataSet: TDataSet);
    procedure qyPrecosAfterPost(DataSet: TDataSet);
    procedure qyPrecosBeforeDelete(DataSet: TDataSet);
    procedure qyPrecosBeforePost(DataSet: TDataSet);
    procedure qyPrecosPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qyPrecosUpdateError(DataSet: TDataSet; E: EDatabaseError;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure qyPrecosAfterInsert(DataSet: TDataSet);
    procedure qyUsuariosAfterDelete(DataSet: TDataSet);
    procedure qyUsuariosAfterPost(DataSet: TDataSet);
    procedure qyUsuariosBeforeDelete(DataSet: TDataSet);
    procedure qyUsuariosBeforePost(DataSet: TDataSet);
    procedure qyUsuariosPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qyUsuariosUpdateError(DataSet: TDataSet; E: EDatabaseError;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure qyUsuariosAfterInsert(DataSet: TDataSet);
    procedure qyMovHistAfterDelete(DataSet: TDataSet);
    procedure qyMovHistAfterPost(DataSet: TDataSet);
    procedure qyMovHistBeforeDelete(DataSet: TDataSet);
    procedure qyMovHistBeforePost(DataSet: TDataSet);
    procedure qyMovHistPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qyMovHistUpdateError(DataSet: TDataSet; E: EDatabaseError;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure qyMovHistAfterInsert(DataSet: TDataSet);
    procedure qyFestasDatasAfterDelete(DataSet: TDataSet);
    procedure qyFestasDatasAfterPost(DataSet: TDataSet);
    procedure qyFestasDatasBeforeDelete(DataSet: TDataSet);
    procedure qyFestasDatasBeforePost(DataSet: TDataSet);
    procedure qyFestasDatasPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qyFestasDatasUpdateError(DataSet: TDataSet; E: EDatabaseError;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure qyFestasDatasAfterInsert(DataSet: TDataSet);
    procedure qyItensVendAfterDelete(DataSet: TDataSet);
    procedure qyItensVendAfterPost(DataSet: TDataSet);
    procedure qyItensVendBeforeDelete(DataSet: TDataSet);
    procedure qyItensVendBeforePost(DataSet: TDataSet);
    procedure qyItensVendPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qyItensVendUpdateError(DataSet: TDataSet; E: EDatabaseError;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure qyEstoqueAfterDelete(DataSet: TDataSet);
    procedure qyEstoqueAfterPost(DataSet: TDataSet);
    procedure qyEstoqueBeforeDelete(DataSet: TDataSet);
    procedure qyEstoqueBeforePost(DataSet: TDataSet);
    procedure qyEstoquePostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qyEstoqueUpdateError(DataSet: TDataSet; E: EDatabaseError;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure qySistemaAfterDelete(DataSet: TDataSet);
    procedure qySistemaAfterPost(DataSet: TDataSet);
    procedure qySistemaBeforeDelete(DataSet: TDataSet);
    procedure qySistemaBeforePost(DataSet: TDataSet);
    procedure qySistemaPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qySistemaUpdateError(DataSet: TDataSet; E: EDatabaseError;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmCadastros: TdmCadastros;

implementation

uses uDaoUsuarios, uFuncoesDB;

{$R *.dfm}

{--- qyCaixas -----------------------------------------------------------------}

procedure TdmCadastros.qyCaixasAfterDelete(DataSet: TDataSet);
begin
  qyCaixas.ApplyUpdates;
  database.Commit;
  qyCaixas.CommitUpdates;
end;

procedure TdmCadastros.qyCaixasAfterPost(DataSet: TDataSet);
begin
  qyCaixas.ApplyUpdates;
  database.Commit;
  qyCaixas.CommitUpdates;
end;

procedure TdmCadastros.qyCaixasBeforeDelete(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmCadastros.qyCaixasBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmCadastros.qyCaixasPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  database.Rollback;
end;

procedure TdmCadastros.qyCaixasUpdateError(DataSet: TDataSet;
  E: EDatabaseError; UpdateKind: TUpdateKind;
  var UpdateAction: TUpdateAction);
begin
  database.Rollback;
  qyCaixas.RollbackUpdates;
end;

procedure TdmCadastros.qyCaixasAfterInsert(DataSet: TDataSet);
begin
  qyCaixasCAI_ATIVO.Value := 'S';
end;

{--- qyCaixatot ---------------------------------------------------------------}

procedure TdmCadastros.qyCaixaTotAfterDelete(DataSet: TDataSet);
begin
  qyCaixatot.ApplyUpdates;
  database.Commit;
  qyCaixatot.CommitUpdates;
end;

procedure TdmCadastros.qyCaixaTotAfterPost(DataSet: TDataSet);
begin
  qyCaixatot.ApplyUpdates;
  database.Commit;
  qyCaixatot.CommitUpdates;
end;

procedure TdmCadastros.qyCaixaTotBeforeDelete(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmCadastros.qyCaixaTotBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmCadastros.qyCaixaTotPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  database.Rollback;
end;

procedure TdmCadastros.qyCaixaTotUpdateError(DataSet: TDataSet;
  E: EDatabaseError; UpdateKind: TUpdateKind;
  var UpdateAction: TUpdateAction);
begin
  database.Rollback;
  qyCaixatot.RollbackUpdates;
end;

procedure TdmCadastros.qyCaixaTotAfterInsert(DataSet: TDataSet);
begin
  //
end;

{--- qyEstoque ----------------------------------------------------------------}

procedure TdmCadastros.qyEstoqueAfterDelete(DataSet: TDataSet);
begin
  qyEstoque.ApplyUpdates;
  database.Commit;
  qyEstoque.CommitUpdates;
end;

procedure TdmCadastros.qyEstoqueAfterPost(DataSet: TDataSet);
begin
  qyEstoque.ApplyUpdates;
  database.Commit;
  qyEstoque.CommitUpdates;
end;

procedure TdmCadastros.qyEstoqueBeforeDelete(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmCadastros.qyEstoqueBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmCadastros.qyEstoquePostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  database.Rollback;
end;

procedure TdmCadastros.qyEstoqueUpdateError(DataSet: TDataSet; E: EDatabaseError;
  UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
begin
  database.Rollback;
  qyEstoque.RollbackUpdates;
end;

{--- qyFestas -----------------------------------------------------------------}

procedure TdmCadastros.qyFestasAfterDelete(DataSet: TDataSet);
begin
  qyFestas.ApplyUpdates;
  database.Commit;
  qyFestas.CommitUpdates;
end;

procedure TdmCadastros.qyFestasAfterPost(DataSet: TDataSet);
begin
  qyFestas.ApplyUpdates;
  database.Commit;
  qyFestas.CommitUpdates;
end;

procedure TdmCadastros.qyFestasBeforeDelete(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmCadastros.qyFestasBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmCadastros.qyFestasUpdateError(DataSet: TDataSet;
  E: EDatabaseError; UpdateKind: TUpdateKind;
  var UpdateAction: TUpdateAction);
begin
  database.Rollback;
  qyFestas.RollbackUpdates;
end;

procedure TdmCadastros.qyFestasAfterInsert(DataSet: TDataSet);
begin
  //
end;

{--- qyFestasDatas ------------------------------------------------------------}

procedure TdmCadastros.qyFestasDatasAfterDelete(DataSet: TDataSet);
begin
  qyFestasDatas.ApplyUpdates;
  database.Commit;
  qyFestasDatas.CommitUpdates;
end;

procedure TdmCadastros.qyFestasDatasAfterPost(DataSet: TDataSet);
begin
  qyFestasDatas.ApplyUpdates;
  database.Commit;
  qyFestasDatas.CommitUpdates;
end;

procedure TdmCadastros.qyFestasDatasBeforeDelete(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmCadastros.qyFestasDatasBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmCadastros.qyFestasDatasPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  database.Rollback;
end;

procedure TdmCadastros.qyFestasDatasUpdateError(DataSet: TDataSet;
  E: EDatabaseError; UpdateKind: TUpdateKind;
  var UpdateAction: TUpdateAction);
begin
  database.Rollback;
  qyFestasDatas.RollbackUpdates;
end;

procedure TdmCadastros.qyFestasDatasAfterInsert(DataSet: TDataSet);
begin
  //
end;

{--- qyItensVend --------------------------------------------------------------}

procedure TdmCadastros.qyItensVendAfterDelete(DataSet: TDataSet);
begin
  qyItensVend.ApplyUpdates;
  database.Commit;
  qyItensVend.CommitUpdates;
end;

procedure TdmCadastros.qyItensVendAfterPost(DataSet: TDataSet);
begin
  qyItensVend.ApplyUpdates;
  database.Commit;
  qyItensVend.CommitUpdates;
end;

procedure TdmCadastros.qyItensVendBeforeDelete(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmCadastros.qyItensVendBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmCadastros.qyItensVendPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  database.Rollback;
end;

procedure TdmCadastros.qyItensVendUpdateError(DataSet: TDataSet; E: EDatabaseError;
  UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
begin
  database.Rollback;
  qyItensVend.RollbackUpdates;
end;

{--- qyLocais -----------------------------------------------------------------}

procedure TdmCadastros.qyLocaisAfterDelete(DataSet: TDataSet);
begin
  qyLocais.ApplyUpdates;
  database.Commit;
  qyLocais.CommitUpdates;
end;

procedure TdmCadastros.qyLocaisAfterPost(DataSet: TDataSet);
begin
  qyLocais.ApplyUpdates;
  database.Commit;
  qyLocais.CommitUpdates;
end;

procedure TdmCadastros.qyLocaisBeforeDelete(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmCadastros.qyLocaisBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmCadastros.qyLocaisPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  database.Rollback;
end;

procedure TdmCadastros.qyLocaisUpdateError(DataSet: TDataSet;
  E: EDatabaseError; UpdateKind: TUpdateKind;
  var UpdateAction: TUpdateAction);
begin
  database.Rollback;
  qyLocais.RollbackUpdates;
end;

procedure TdmCadastros.qyLocaisAfterInsert(DataSet: TDataSet);
begin
  //
end;

{--- qyMovHist ----------------------------------------------------------------}

procedure TdmCadastros.qyMovHistAfterDelete(DataSet: TDataSet);
begin
  qyMovHist.ApplyUpdates;
  database.Commit;
  qyMovHist.CommitUpdates;
end;

procedure TdmCadastros.qyMovHistAfterPost(DataSet: TDataSet);
begin
  qyMovHist.ApplyUpdates;
  database.Commit;
  qyMovHist.CommitUpdates;
end;

procedure TdmCadastros.qyMovHistBeforeDelete(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmCadastros.qyMovHistBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmCadastros.qyMovHistPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  database.Rollback;
end;

procedure TdmCadastros.qyMovHistUpdateError(DataSet: TDataSet;
  E: EDatabaseError; UpdateKind: TUpdateKind;
  var UpdateAction: TUpdateAction);
begin
  database.Rollback;
  qyMovHist.RollbackUpdates;
end;

procedure TdmCadastros.qyMovHistAfterInsert(DataSet: TDataSet);
begin
  //
end;

{--- qyPrecos -----------------------------------------------------------------}

procedure TdmCadastros.qyPrecosAfterDelete(DataSet: TDataSet);
begin
  qyPrecos.ApplyUpdates;
  database.Commit;
  qyPrecos.CommitUpdates;
end;

procedure TdmCadastros.qyPrecosAfterPost(DataSet: TDataSet);
begin
  qyPrecos.ApplyUpdates;
  database.Commit;
  qyPrecos.CommitUpdates;
end;

procedure TdmCadastros.qyPrecosBeforeDelete(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmCadastros.qyPrecosBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmCadastros.qyPrecosPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  database.Rollback;
end;

procedure TdmCadastros.qyPrecosUpdateError(DataSet: TDataSet;
  E: EDatabaseError; UpdateKind: TUpdateKind;
  var UpdateAction: TUpdateAction);
begin
  database.Rollback;
  qyPrecos.RollbackUpdates;
end;

procedure TdmCadastros.qyPrecosAfterInsert(DataSet: TDataSet);
begin
  qyPrecosPRE_CODIGO.Value := GetCodigo('PRE_CODIGO', 'PRECOS');
  qyPrecosPRE_STATUS.Text := 'A';
end;

{--- qySistema ---------------------------------------------------------------}

procedure TdmCadastros.qySistemaAfterDelete(DataSet: TDataSet);
begin
  qySistema.ApplyUpdates;
  database.Commit;
  qySistema.CommitUpdates;
end;

procedure TdmCadastros.qySistemaAfterPost(DataSet: TDataSet);
begin
  qySistema.ApplyUpdates;
  database.Commit;
  qySistema.CommitUpdates;
end;

procedure TdmCadastros.qySistemaBeforeDelete(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmCadastros.qySistemaBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmCadastros.qySistemaPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  database.Rollback;
end;

procedure TdmCadastros.qySistemaUpdateError(DataSet: TDataSet; E: EDatabaseError;
  UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
begin
  database.Rollback;
  qySistema.RollbackUpdates;
end;

{--- qyUsuarios ---------------------------------------------------------------}

procedure TdmCadastros.qyUsuariosAfterDelete(DataSet: TDataSet);
begin
  qyUsuarios.ApplyUpdates;
  database.Commit;
  qyUsuarios.CommitUpdates;
end;

procedure TdmCadastros.qyUsuariosAfterPost(DataSet: TDataSet);
begin
  qyUsuarios.ApplyUpdates;
  database.Commit;
  qyUsuarios.CommitUpdates;
end;

procedure TdmCadastros.qyUsuariosBeforeDelete(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmCadastros.qyUsuariosBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmCadastros.qyUsuariosPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  database.Rollback;
end;

procedure TdmCadastros.qyUsuariosUpdateError(DataSet: TDataSet;
  E: EDatabaseError; UpdateKind: TUpdateKind;
  var UpdateAction: TUpdateAction);
begin
  database.Rollback;
  qyUsuarios.RollbackUpdates;
end;

procedure TdmCadastros.qyUsuariosAfterInsert(DataSet: TDataSet);
begin
  qyUsuariosUSU_ATIVO.Value := 'S';
end;

end.
