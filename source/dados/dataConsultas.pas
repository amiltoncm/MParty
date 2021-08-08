unit dataConsultas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dataTmpConexao, DB, SDEngine;

type
  TdmConsultas = class(TdmTmpConexao)
    SessaoConsultas: TSDSession;
    SQL: TSDQuery;
    qyVendas: TSDQuery;
    qyVendasMVH_CODIGO: TIntegerField;
    qyVendasMVH_TOTAL: TFloatField;
    qyVendasMVH_PAGO: TFloatField;
    qyVendasMVH_TROCO: TFloatField;
    qyVendasMVH_TRANSACAO: TStringField;
    qyVendasMVH_DTHR: TDateTimeField;
    qyItensVenda: TSDQuery;
    qyItensVendaPRE_CODIGO: TIntegerField;
    qyItensVendaPRE_DESCRICAO: TStringField;
    qyItensVendaITV_QUANTIDADE: TFloatField;
    qyItensVendaITV_UNITARIO: TFloatField;
    qyItensVendaITV_TOTAL: TFloatField;
    qyProdutosVend: TSDQuery;
    qyProdutosVendPRE_CODIGO: TIntegerField;
    qyProdutosVendPRE_DESCRICAO: TStringField;
    qyProdutosVendSUM: TFloatField;
    qyProdutosVendITV_UNITARIO: TFloatField;
    qyProdutosVendSUM_1: TFloatField;
    qyProdVendFestas: TSDQuery;
    qyProdVendFestasPRE_CODIGO: TIntegerField;
    qyProdVendFestasPRE_DESCRICAO: TStringField;
    qyProdVendFestasSUM: TFloatField;
    qyProdVendFestasITV_UNITARIO: TFloatField;
    qyProdVendFestasSUM_1: TFloatField;
    qyConsEstoque: TSDQuery;
    qyConsEstoqueEST_CODIGO: TIntegerField;
    qyConsEstoquePRE_DESCRICAO: TStringField;
    qyConsEstoqueEST_QUANTIDADE: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmConsultas: TdmConsultas;

implementation

{$R *.dfm}

end.
