unit uDaoMovHist;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB;

procedure ListarMovHist(vfOrdem: String; vfLimite: String);
procedure FiltrarMovHist(vfCampoFil: String; vfOperador: String; vfParametro:
                		     String; vfOrdem: String; vfLimite: String);
procedure InsMovHist(vfCodVenda: Integer; vfCodLocal: String; vfCodCaixa: String; vfDtCaixa: String; vfTotal: Real;
                     vfPago: Real; vfTroco: Real);
procedure EdtMovHist;
procedure PostMovHist;
procedure FiltrarMovHistCxOpen(vfCodMovHist: String);
function GetTransacao: String;
function GetNextSell: Integer;
function TestVenda(vfCodigo: Integer): Boolean;
procedure AtualizaTotal(vfTotal: Real);
procedure FinalizarMovHist(vfPago: String; vfTroco: String);
procedure SetMovHistType(vfTipo: String);
procedure VerifMovHist(vfCodFesta: String; vfCodLocal: String; vfCodCaixa: String; vfData: String);

const
ctCampos = 'M.MVH_CODIGO, M.FES_CODIGO, M.LOC_CODIGO, M.CAI_CODIGO, M.CXT_DATA, ' +
           'M.MVH_TOTAL, M.MVH_PAGO, M.MVH_TROCO, M.MVH_TRANSACAO, M.MVH_DTHR, ' +
           'M.MVH_FINALIZADO';
ctTabelas = 'MOVHIST M';

implementation

uses dataCadastros, uFuncoesDB, uVarGlobal, uFuncoesSeguranca,
  uFuncoesFormatacao;

{--- Lista todos os registros da tabela ----------------------------------------}

procedure ListarMovHist(vfOrdem: String; vfLimite: String);
begin
  dmCadastros.qyMovHist.Close;
  dmCadastros.qyMovHist.SQL.Clear;
  dmCadastros.qyMovHist.SQL.Add('SELECT '+ ctCampos + ' FROM ' + ctTabelas);
  if vfOrdem <> '0' then
    dmCadastros.qyMovHist.SQL.Add(' ORDER BY ' + vfOrdem);
  if vfLimite <> '0' then
    dmCadastros.qyMovHist.SQL.Add(' LIMIT ' + vfLimite);
  dmCadastros.qyMovHist.Open;
end;

{--- Filtra registros da tabela -----------------------------------------------}

procedure FiltrarMovHist(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String; vfLimite: String);
begin
  dmCadastros.qyMovHist.Close;
  dmCadastros.qyMovHist.SQL.Clear;
  dmCadastros.qyMovHist.SQL.Add('SELECT ' + ctCampos + ' FROM ' + ctTabelas);
  dmCadastros.qyMovHist.SQL.Add(' WHERE ');
  dmCadastros.qyMovHist.SQL.Add(vfCampoFil + ' ' + vfOperador + ' ');
  dmCadastros.qyMovHist.SQL.Add(QuotedStr(vfParametro));
  if vfOrdem <> '0' then
    dmCadastros.qyMovHist.SQL.Add(' ORDER BY ' + vfOrdem);
  if vfLimite <> '0' then
    dmCadastros.qyMovHist.SQL.Add(' LIMIT ' + vfLimite);

  dmCadastros.qyMovHist.Open;
end;

{--- Insere registros da tabela -----------------------------------------------}

procedure InsMovHist(vfCodVenda: Integer; vfCodLocal: String; vfCodCaixa: String; vfDtCaixa: String; vfTotal: Real;
                     vfPago: Real; vfTroco: Real);
begin
  try
    if dmCadastros.qyMovHist.Active = false then
      dmCadastros.qyMovHist.Active := true;
    dmCadastros.qyMovHist.Insert;
    dmCadastros.qyMovHistMVH_CODIGO.Value := vfCodVenda;
    dmCadastros.qyMovHistFES_CODIGO.Text := vgFestaAberta;
    dmCadastros.qyMovHistLOC_CODIGO.Text := vfCodLocal;
    dmCadastros.qyMovHistCAI_CODIGO.Text := vfCodCaixa;
    dmCadastros.qyMovHistCXT_DATA.Text := vfDtCaixa;
    dmCadastros.qyMovHistMVH_TOTAL.Value := vfTotal;
    dmCadastros.qyMovHistMVH_PAGO.Value := vfPago;
    dmCadastros.qyMovHistMVH_TROCO.Value := vfTroco;
    dmCadastros.qyMovHistMVH_TRANSACAO.Value := GetTransacao;
    dmCadastros.qyMovHistMVH_DTHR.Value := now;
    dmCadastros.qyMovHistMVH_FINALIZADO.Text := 'N';
    dmCadastros.qyMovHist.Post;
    dmCadastros.qyMovHist.Refresh;
  except
    on E: Exception do
    Begin
      MessageDlg('Erro ao gravar Alteração / Inserção!' + #13#10 +
          E.Message,mtError,[mbOk],0);
      dmCadastros.qyCaixaTot.Refresh;
    end;
  end;
end;

{--- Coloca a tabela em edit inserindo algum valor ----------------------------}

procedure EdtMovHist;
begin
  dmCadastros.qyMovHist.Edit;
end;

{--- Dá um post na tabela -----------------------------------------------------}

procedure PostMovHist;
begin
  try
    dmCadastros.qyMovHist.Post;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao gravar Alteração / Inserção!' + #13 +
          E.Message,mtError,[mbOk],0);
      dmCadastros.qyMovHist.Refresh;
    end;
  end;
end;

procedure FiltrarMovHistCxOpen(vfCodMovHist: String);
begin
  dmCadastros.qyMovHist.Close;
  dmCadastros.qyMovHist.SQL.Clear;
  dmCadastros.qyMovHist.SQL.Add('SELECT ' + ctCampos + ' FROM ' + ctTabelas);
  dmCadastros.qyMovHist.SQL.Add('WHERE M.LOC_CODIGO = ' + vgCodLocal);
  dmCadastros.qyMovHist.SQL.Add('AND M.CAI_CODIGO = ' + vgCodCaixa);
  dmCadastros.qyMovHist.SQL.Add('AND M.FES_CODIGO = ' + vgFestaAberta);
  dmCadastros.qyMovHist.SQL.Add('AND M.CXT_DATA = ' + QuotedStr(FormatDateTime('MM/dd/yyyy', StrToDate(vgDataCaixa))));
  dmCadastros.qyMovHist.SQL.Add('AND M.MVH_CODIGO = ' + vfCodMovHist);
  dmCadastros.qyMovHist.Open;
end;

function GetTransacao: String;
Var
vTransacao: String;
vUnica: Boolean;
begin
  vUnica := False;
  Repeat
    vTransacao := GetRandomPassword(10, 1);
    dmCadastros.QTemp.Close;
    dmCadastros.QTemp.SQL.Clear;
    dmCadastros.QTemp.SQL.Add('SELECT MVH_TRANSACAO FROM MOVHIST');
    dmCadastros.QTemp.SQL.Add('WHERE MVH_TRANSACAO = ' + QuotedStr(vTransacao));
    dmCadastros.QTemp.open;
    if dmCadastros.QTemp.Fields[0].IsNull then
      vUnica := True;
  Until vUnica = True;
  Result := vTransacao;
end;

function GetNextSell: Integer;
Var
vResult: Integer;
begin
  dmCadastros.QTemp.Close;
  dmCadastros.QTemp.SQL.Clear;
  dmCadastros.QTemp.SQL.Add('SELECT MAX(MVH_CODIGO) FROM MOVHIST ');
  dmCadastros.QTemp.SQL.Add('WHERE FES_CODIGO = ' + vgFestaAberta);
  dmCadastros.QTemp.SQL.Add('AND LOC_CODIGO = ' + vgCodLocal);
  dmCadastros.QTemp.SQL.Add('AND CAI_CODIGO = ' + vgCodCaixa);
  dmCadastros.QTemp.SQL.Add('AND CXT_DATA = ' + QuotedStr(FormatDateTime('MM/dd/yyyy', StrToDate(vgDataCaixa))));
  dmCadastros.QTemp.SQL.Add('AND MVH_FINALIZADO = ' + QuotedStr('S'));
  dmCadastros.QTemp.Open;
  if dmCadastros.QTemp.Fields[0].IsNull then
    vResult := 1
  else
    vResult :=  dmCadastros.QTemp.Fields[0].Value + 1;
  Result := vResult;
end;

function TestVenda(vfCodigo: Integer): Boolean;
begin
  dmCadastros.QTemp.Close;
  dmCadastros.QTemp.SQL.Clear;
  dmCadastros.QTemp.SQL.Add('SELECT MVH_CODIGO FROM MOVHIST');
  dmCadastros.QTemp.SQL.Add('WHERE FES_CODIGO = ' + vgFestaAberta);
  dmCadastros.QTemp.SQL.Add('AND LOC_CODIGO = ' + vgCodLocal);
  dmCadastros.QTemp.SQL.Add('AND CAI_CODIGO = ' + vgCodCaixa);
  dmCadastros.QTemp.SQL.Add('AND CXT_DATA = ' + QuotedStr(FormatDateTime('MM/dd/yyyy', StrToDate(vgDataCaixa))));
  dmCadastros.QTemp.SQL.Add('AND MVH_CODIGO = ' + IntToStr(vfCodigo));
  dmCadastros.QTemp.Open;
  if dmCadastros.QTemp.Fields[0].IsNull then
    Result := False
  else
    Result := True;
end;

procedure AtualizaTotal(vfTotal: Real);
begin
  EdtMovHist;
  dmCadastros.qyMovHistMVH_TOTAL.Value := vfTotal;
  PostMovHist;
end;

procedure FinalizarMovHist(vfPago: String; vfTroco: String);
begin
  EdtMovHist;
  dmCadastros.qyMovHistMVH_PAGO.Value := StrToFloat(LimpaReal(vfPago));
  dmCadastros.qyMovHistMVH_TROCO.Value := StrToFloat(LimpaReal(vfTroco));
  dmCadastros.qyMovHistMVH_FINALIZADO.Value := 'S';
  PostMovHist;
end;

procedure SetMovHistType(vfTipo: String);
begin
  EdtMovHist;
  if vfTipo = 'R' then
    dmCadastros.qyMovHistMVH_TRANSACAO.Value := 'RETIRADA';
  if vfTipo = 'T' then
    dmCadastros.qyMovHistMVH_TRANSACAO.Value := 'TROCO';
  PostMovHist;
end;

procedure VerifMovHist(vfCodFesta: String; vfCodLocal: String; vfCodCaixa: String; vfData: String);
begin
  dmCadastros.qyMovHist.Close;
  dmCadastros.qyMovHist.SQL.Clear;
  dmCadastros.qyMovHist.SQL.Add('SELECT ' + ctCampos + ' FROM ' + ctTabelas);
  dmCadastros.qyMovHist.SQL.Add('WHERE M.LOC_CODIGO = ' + vfCodLocal);
  dmCadastros.qyMovHist.SQL.Add('AND M.CAI_CODIGO = ' + vfCodCaixa);
  dmCadastros.qyMovHist.SQL.Add('AND M.FES_CODIGO = ' + vfCodFesta);
  dmCadastros.qyMovHist.SQL.Add('AND M.CXT_DATA = ' + QuotedStr(FormatDateTime('MM/dd/yyyy', StrToDate(vfData))));
  dmCadastros.qyMovHist.SQL.Add('ORDER BY M.MVH_CODIGO');
  dmCadastros.qyMovHist.Open;
end;

end.
