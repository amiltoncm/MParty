unit uDaoItensVend;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB;

procedure SetItensVend(vfMovHist: Integer; vfCodPreco: String; vfQuantidade: Real);
procedure InsItensVend;
procedure EdtItensVend;
procedure PostItensVend;
procedure ListarItensVend(vfOrdem: String);
procedure FiltrarItensVend(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
function TestarCodItem(vfCodigo: String): Boolean;
procedure SomaTotal(vfCodVenda: Integer);
procedure FiltrarItensVendCai(vfNumVenda: String);
function VerificaItemIns(vfNumVenda: String; vfCodItem: String): boolean;
procedure FiltrarItenEspCx(vfNumVenda: String; vfCodItem: String);
procedure AddItemVenda(vfQuant: real);

const
ctCampos = 'I.ITV_CODIGO, I.MVH_CODIGO, I.FES_CODIGO, I.CAI_CODIGO, I.LOC_CODIGO, I.PRE_CODIGO, P.PRE_DESCRICAO, I.ITV_QUANTIDADE, I.ITV_UNITARIO, I.ITV_TOTAL';
ctTabelas = 'ITENSVEND I, PRECOS P';

implementation

uses dataCadastros, uFuncoesDB, uVarGlobal, uDaoPrecos, uDaoMovHist;

procedure SetItensVend(vfMovHist: Integer; vfCodPreco: String; vfQuantidade: Real);
begin
  dmCadastros.qyItensVendMVH_CODIGO.Value := vfMovHist;
  dmCadastros.qyItensVendFES_CODIGO.Text := vgFestaAberta;
  dmCadastros.qyItensVendCAI_CODIGO.Text := vgCodCaixa;
  dmCadastros.qyItensVendLOC_CODIGO.Text := vgCodLocal;
  dmCadastros.qyItensVendPRE_CODIGO.Text := vfCodPreco;
  dmCadastros.qyItensVendPRE_DESCRICAO.Text := GetDescProd(vfCodPreco);
  dmCadastros.qyItensVendITV_QUANTIDADE.Value := vfQuantidade;
  dmCadastros.qyItensVendITV_UNITARIO.Value := GetValuePreco(vfCodPreco);
  dmCadastros.qyItensVendITV_TOTAL.Value := dmCadastros.qyItensVendITV_QUANTIDADE.Value * dmCadastros.qyItensVendITV_UNITARIO.Value;
end;

{--- Coloca a tabela em insert  -----------------------------------------------}

procedure InsItensVend;
begin
  if dmCadastros.qyItensVend.Active = false then
    dmCadastros.qyItensVend.Active := True;
  dmCadastros.qyItensVend.Insert;
end;

{--- Coloca a tabela em edit inserindo algum valor ----------------------------}

procedure EdtItensVend;
begin
  dmCadastros.qyItensVend.Edit;
end;

{--- Dá um post na tabela -----------------------------------------------------}

procedure PostItensVend;
begin
  try
    if dmCadastros.qyItensVend.State in [dsInsert] then
      dmCadastros.qyItensVendITV_CODIGO.Value := GetCodigo('ITV_CODIGO', 'ITENSVEND');
    dmCadastros.qyItensVend.Post;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao gravar Alteração / Inserção!' + #13 +
          E.Message,mtError,[mbOk],0);
      dmCadastros.qyItensVend.Refresh;
    end;
  end;
end;

{--- Lista todos os registros da tabela ---------------------------------------}

procedure ListarItensVend(vfOrdem: String);
begin
  dmCadastros.qyItensVend.Close;
  dmCadastros.qyItensVend.SQL.Clear;
  dmCadastros.qyItensVend.SQL.Add('SELECT '+ ctCampos + ' FROM ' + ctTabelas);
  dmCadastros.qyItensVend.SQL.Add(' WHERE I.PRE_CODIGO = P.PRE_CODIGO ');
  if vfOrdem <> '0' then
    dmCadastros.qyItensVend.SQL.Add(' ORDER BY ' + vfOrdem);
  dmCadastros.qyItensVend.Open;
end;

{--- Filtra registros da tabela -----------------------------------------------}

procedure FiltrarItensVend(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
begin
  dmCadastros.qyItensVend.Close;
  dmCadastros.qyItensVend.SQL.Clear;
  dmCadastros.qyItensVend.SQL.Add('SELECT ' + ctCampos + ' FROM ' + ctTabelas);
  dmCadastros.qyItensVend.SQL.Add(' WHERE I.PRE_CODIGO = P.PRE_CODIGO AND ');
  dmCadastros.qyItensVend.SQL.Add(vfCampoFil + ' ' + vfOperador + ' ');
  dmCadastros.qyItensVend.SQL.Add(QuotedStr(vfParametro));
  if vfOrdem <> '0' then
    dmCadastros.qyItensVend.SQL.Add(' ORDER BY ' + vfOrdem);
  dmCadastros.qyItensVend.Open;
end;

function TestarCodItem(vfCodigo: String): Boolean;
begin
  dmCadastros.QTemp.Close;
  dmCadastros.QTemp.SQL.Clear;
  dmCadastros.QTemp.SQL.Add('SELECT PRE_CODIGO FROM PRECOS');
  dmCadastros.QTemp.SQL.Add('WHERE PRE_CODIGO = ' + vfCodigo);
  dmCadastros.QTemp.SQL.Add('AND PRE_STATUS = ' + QuotedStr('A'));
  dmCadastros.QTemp.Open;
  if dmCadastros.QTemp.Fields[0].IsNull then
    Result := False
  else
    Result := True;
end;

procedure SomaTotal(vfCodVenda: Integer);
Var
vTotal: Real;
begin
  dmCadastros.QTemp.Close;
  dmCadastros.QTemp.SQL.Clear;
  dmCadastros.QTemp.SQL.Add('SELECT SUM(ITV_TOTAL) FROM ITENSVEND');
  dmCadastros.QTemp.SQL.Add('WHERE MVH_CODIGO = ' + IntToStr(vfCodVenda));
  dmCadastros.QTemp.SQL.Add('AND FES_CODIGO = ' + vgFestaAberta);
  dmCadastros.QTemp.SQL.Add('AND CAI_CODIGO = ' + vgCodCaixa);
  dmCadastros.QTemp.SQL.Add('AND LOC_CODIGO = ' + vgCodLocal);
  dmCadastros.QTemp.Open;
  if dmCadastros.QTemp.Fields[0].IsNull then
    vTotal := 0
  else
    vTotal := dmCadastros.QTemp.Fields[0].Value;
  if vTotal <> dmCadastros.qyMovHistMVH_TOTAL.Value then
    AtualizaTotal(vTotal);
end;

procedure FiltrarItensVendCai(vfNumVenda: String);
begin
  dmCadastros.qyItensVend.Close;
  dmCadastros.qyItensVend.SQL.Clear;
  dmCadastros.qyItensVend.SQL.Add('SELECT ' + ctCampos + ' FROM ' + ctTabelas);
  dmCadastros.qyItensVend.SQL.Add('WHERE I.PRE_CODIGO = P.PRE_CODIGO');
  dmCadastros.qyItensVend.SQL.Add('AND I.MVH_CODIGO = ' + vfNumVenda);
  dmCadastros.qyItensVend.SQL.Add('AND I.FES_CODIGO = ' + vgFestaAberta);
  dmCadastros.qyItensVend.SQL.Add('AND I.CAI_CODIGO = ' + vgCodCaixa);
  dmCadastros.qyItensVend.SQL.Add('AND I.LOC_CODIGO = ' + vgCodLocal);
  dmCadastros.qyItensVend.SQL.Add('ORDER BY I.PRE_CODIGO');
  dmCadastros.qyItensVend.Open;
end;

function VerificaItemIns(vfNumVenda: String; vfCodItem: String): boolean;
begin
  dmCadastros.QTemp.Close;
  dmCadastros.QTemp.SQL.Clear;
  dmCadastros.QTemp.SQL.Add('SELECT ' + ctCampos + ' FROM ' + ctTabelas);
  dmCadastros.QTemp.SQL.Add('WHERE I.PRE_CODIGO = P.PRE_CODIGO');
  dmCadastros.QTemp.SQL.Add('AND I.MVH_CODIGO = ' + vfNumVenda);
  dmCadastros.QTemp.SQL.Add('AND I.FES_CODIGO = ' + vgFestaAberta);
  dmCadastros.QTemp.SQL.Add('AND I.CAI_CODIGO = ' + vgCodCaixa);
  dmCadastros.QTemp.SQL.Add('AND I.LOC_CODIGO = ' + vgCodLocal);
  dmCadastros.QTemp.SQL.Add('AND I.PRE_CODIGO = ' + vfCodItem);
  dmCadastros.QTemp.Open;
  if dmCadastros.QTemp.Fields[0].IsNull then
    Result := False
  else
    Result := True;
end;

procedure FiltrarItenEspCx(vfNumVenda: String; vfCodItem: String);
begin
  dmCadastros.qyItensVend.Close;
  dmCadastros.qyItensVend.SQL.Clear;
  dmCadastros.qyItensVend.SQL.Add('SELECT ' + ctCampos + ' FROM ' + ctTabelas);
  dmCadastros.qyItensVend.SQL.Add('WHERE I.PRE_CODIGO = P.PRE_CODIGO');
  dmCadastros.qyItensVend.SQL.Add('AND I.MVH_CODIGO = ' + vfNumVenda);
  dmCadastros.qyItensVend.SQL.Add('AND I.FES_CODIGO = ' + vgFestaAberta);
  dmCadastros.qyItensVend.SQL.Add('AND I.CAI_CODIGO = ' + vgCodCaixa);
  dmCadastros.qyItensVend.SQL.Add('AND I.LOC_CODIGO = ' + vgCodLocal);
  dmCadastros.qyItensVend.SQL.Add('AND I.PRE_CODIGO = ' + vfCodItem);
  dmCadastros.qyItensVend.Open;
end;

procedure AddItemVenda(vfQuant: real);
Var
vNovaQuant: real;
begin
  vNovaQuant := dmCadastros.qyItensVendITV_QUANTIDADE.Value + vfQuant;
  dmCadastros.qyItensVendITV_QUANTIDADE.Value := vNovaQuant;
  dmCadastros.qyItensVendITV_TOTAL.Value := dmCadastros.qyItensVendITV_QUANTIDADE.Value * dmCadastros.qyItensVendITV_UNITARIO.Value;
end;

end.
