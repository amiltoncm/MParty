unit uDaoConsultas;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB;

procedure ConsVendas;
procedure ItensVenda(vfCodVenda: String);
procedure ItensVendaCaixa(vfCodVenda: String; vfCodCaixa: String; vfCodLocal: String);
procedure ProdutosVendidos;
procedure ProdutosVendidosCaixa(vfCodFesta: String; vfCodCaixa: String; vfCodLocal: String);
procedure ConsVendasFesta(vfFesta: String);

implementation

uses dataConsultas, uVarGlobal;

procedure ConsVendas;
begin
  dmConsultas.qyVendas.Close;
  dmConsultas.qyVendas.SQL.Clear;
  dmConsultas.qyVendas.SQL.Add('SELECT MVH_CODIGO, MVH_TOTAL, MVH_PAGO, MVH_TROCO, ');
  dmConsultas.qyVendas.SQL.Add('MVH_TRANSACAO, MVH_DTHR FROM MOVHIST ');
  dmConsultas.qyVendas.SQL.Add('WHERE FES_CODIGO = ' + vgFestaAberta);
  dmConsultas.qyVendas.SQL.Add('AND LOC_CODIGO = ' + vgCodLocal);
  dmConsultas.qyVendas.SQL.Add('AND CAI_CODIGO = ' + vgCodCaixa);
  dmConsultas.qyVendas.SQL.Add('AND CXT_DATA = ' + QuotedStr(FormatDateTime('MM/dd/yyyy', (StrToDate(vgDataCaixa)))));
  dmConsultas.qyVendas.SQL.Add('ORDER BY MVH_CODIGO');
  dmConsultas.qyVendas.Open;
end;

procedure ItensVenda(vfCodVenda: String);
begin
  dmConsultas.qyItensVenda.Close;
  dmConsultas.qyItensVenda.SQL.Clear;
  dmConsultas.qyItensVenda.SQL.Add('SELECT I.PRE_CODIGO, P.PRE_DESCRICAO, I.ITV_QUANTIDADE, ');
  dmConsultas.qyItensVenda.SQL.Add('I.ITV_UNITARIO, I.ITV_TOTAL');
  dmConsultas.qyItensVenda.SQL.Add('FROM ITENSVEND I, PRECOS P WHERE I.PRE_CODIGO = P.PRE_CODIGO ');
  dmConsultas.qyItensVenda.SQL.Add('AND FES_CODIGO = ' + vgFestaAberta);
  dmConsultas.qyItensVenda.SQL.Add('AND CAI_CODIGO = ' + vgCodCaixa);
  dmConsultas.qyItensVenda.SQL.Add('AND LOC_CODIGO = ' + vgCodLocal);
  dmConsultas.qyItensVenda.SQL.Add('AND MVH_CODIGO = ' + vfCodVenda);
  dmConsultas.qyItensVenda.SQL.Add('ORDER BY MVH_CODIGO');
  dmConsultas.qyItensVenda.Open;
end;

procedure ItensVendaCaixa(vfCodVenda: String; vfCodCaixa: String; vfCodLocal: String);
begin
  dmConsultas.qyItensVenda.Close;
  dmConsultas.qyItensVenda.SQL.Clear;
  dmConsultas.qyItensVenda.SQL.Add('SELECT I.PRE_CODIGO, P.PRE_DESCRICAO, I.ITV_QUANTIDADE, ');
  dmConsultas.qyItensVenda.SQL.Add('I.ITV_UNITARIO, I.ITV_TOTAL');
  dmConsultas.qyItensVenda.SQL.Add('FROM ITENSVEND I, PRECOS P WHERE I.PRE_CODIGO = P.PRE_CODIGO ');
  dmConsultas.qyItensVenda.SQL.Add('AND FES_CODIGO = ' + vgFestaAberta);
  dmConsultas.qyItensVenda.SQL.Add('AND CAI_CODIGO = ' + vfCodCaixa);
  dmConsultas.qyItensVenda.SQL.Add('AND LOC_CODIGO = ' + vfCodLocal);
  dmConsultas.qyItensVenda.SQL.Add('AND MVH_CODIGO = ' + vfCodVenda);
  dmConsultas.qyItensVenda.SQL.Add('ORDER BY MVH_CODIGO');
  dmConsultas.qyItensVenda.Open;
end;

procedure ProdutosVendidos;
begin
  dmConsultas.qyProdutosVend.Close;
  dmConsultas.qyProdutosVend.SQL.Clear;
  dmConsultas.qyProdutosVend.SQL.Add('SELECT I.PRE_CODIGO, P.PRE_DESCRICAO, SUM(I.ITV_QUANTIDADE), ');
  dmConsultas.qyProdutosVend.SQL.Add('I.ITV_UNITARIO, SUM(I.ITV_TOTAL) ');
  dmConsultas.qyProdutosVend.SQL.Add('FROM ITENSVEND I, PRECOS P ');
  dmConsultas.qyProdutosVend.SQL.Add('WHERE I.PRE_CODIGO = P.PRE_CODIGO ');
  dmConsultas.qyProdutosVend.SQL.Add('AND I.FES_CODIGO = ' + vgFestaAberta);
  dmConsultas.qyProdutosVend.SQL.Add('AND I.CAI_CODIGO = ' + vgCodCaixa);
  dmConsultas.qyProdutosVend.SQL.Add('AND I.LOC_CODIGO = ' + vgCodLocal);
  dmConsultas.qyProdutosVend.SQL.Add('GROUP BY I.PRE_CODIGO, P.PRE_DESCRICAO, I.ITV_UNITARIO ');
  dmConsultas.qyProdutosVend.SQL.Add('ORDER BY I.PRE_CODIGO');
  dmConsultas.qyProdutosVend.Open;
end;

procedure ProdutosVendidosCaixa(vfCodFesta: String; vfCodCaixa: String; vfCodLocal: String);
begin
  dmConsultas.qyProdutosVend.Close;
  dmConsultas.qyProdutosVend.SQL.Clear;
  dmConsultas.qyProdutosVend.SQL.Add('SELECT I.PRE_CODIGO, P.PRE_DESCRICAO, SUM(I.ITV_QUANTIDADE), ');
  dmConsultas.qyProdutosVend.SQL.Add('I.ITV_UNITARIO, SUM(I.ITV_TOTAL) ');
  dmConsultas.qyProdutosVend.SQL.Add('FROM ITENSVEND I, PRECOS P ');
  dmConsultas.qyProdutosVend.SQL.Add('WHERE I.PRE_CODIGO = P.PRE_CODIGO ');
  dmConsultas.qyProdutosVend.SQL.Add('AND I.FES_CODIGO = ' + vfCodFesta);
  dmConsultas.qyProdutosVend.SQL.Add('AND I.CAI_CODIGO = ' + vfCodCaixa);
  dmConsultas.qyProdutosVend.SQL.Add('AND I.LOC_CODIGO = ' + vfCodLocal);
  dmConsultas.qyProdutosVend.SQL.Add('GROUP BY I.PRE_CODIGO, P.PRE_DESCRICAO, I.ITV_UNITARIO ');
  dmConsultas.qyProdutosVend.SQL.Add('ORDER BY I.PRE_CODIGO');
  dmConsultas.qyProdutosVend.Open;
end;

procedure ConsVendasFesta(vfFesta: String);
begin
  dmConsultas.qyProdVendFestas.Close;
  dmConsultas.qyProdVendFestas.SQL.Clear;
  dmConsultas.qyProdVendFestas.SQL.Add('SELECT I.PRE_CODIGO, P.PRE_DESCRICAO, SUM(I.ITV_QUANTIDADE), ');
  dmConsultas.qyProdVendFestas.SQL.Add('I.ITV_UNITARIO, SUM(I.ITV_TOTAL) ');
  dmConsultas.qyProdVendFestas.SQL.Add('FROM ITENSVEND I, PRECOS P ');
  dmConsultas.qyProdVendFestas.SQL.Add('WHERE I.PRE_CODIGO = P.PRE_CODIGO ');
  dmConsultas.qyProdVendFestas.SQL.Add('AND I.FES_CODIGO = ' + vfFesta);
  dmConsultas.qyProdVendFestas.SQL.Add('AND I.PRE_CODIGO > 0 ');
  dmConsultas.qyProdVendFestas.SQL.Add('GROUP BY I.PRE_CODIGO, P.PRE_DESCRICAO, I.ITV_UNITARIO ');
  dmConsultas.qyProdVendFestas.SQL.Add('ORDER BY I.PRE_CODIGO ');
  dmConsultas.qyProdVendFestas.Open;
end;

end.
