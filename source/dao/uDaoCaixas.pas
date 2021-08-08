unit uDaoCaixas;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB;

procedure ListarCaixas(vfOrdem: String);
procedure FiltrarCaixas(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
function LoginCaixa(vfCaixa: String; vfSenha: String): String;

const
ctCampos = 'CAI_CODIGO, CAI_NOME, CAI_SENHA, CAI_ATIVO';
ctTabelas = 'CAIXAS';

implementation

uses dataCadastros;

{--- Lista todos os registros da tabela ----------------------------------------}

procedure ListarCaixas(vfOrdem: String);
begin
  dmCadastros.qyCaixas.Close;
  dmCadastros.qyCaixas.SQL.Clear;
  dmCadastros.qyCaixas.SQL.Add('SELECT '+ ctCampos + ' FROM ' + ctTabelas);
  if vfOrdem <> '0' then
    dmCadastros.qyCaixas.SQL.Add(' ORDER BY ' + vfOrdem);
  dmCadastros.qyCaixas.Open;
end;

{--- Filtra registros da tabela ------------------------------------------------}

procedure FiltrarCaixas(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
begin
  dmCadastros.qyCaixas.Close;
  dmCadastros.qyCaixas.SQL.Clear;
  dmCadastros.qyCaixas.SQL.Add('SELECT ' + ctCampos + ' FROM ' + ctTabelas + ' WHERE ');
  dmCadastros.qyCaixas.SQL.Add(vfCampoFil + ' ' + vfOperador + ' ');
  dmCadastros.qyCaixas.SQL.Add(QuotedStr(vfParametro));
  if vfOrdem <> '0' then
    dmCadastros.qyCaixas.SQL.Add(' ORDER BY ' + vfOrdem);
  dmCadastros.qyCaixas.Open;
end;

function LoginCaixa(vfCaixa: String; vfSenha: String): String;
begin
  dmCadastros.QTemp.Close;
  dmCadastros.QTemp.SQL.Clear;
  dmCadastros.QTemp.SQL.Add('SELECT CAI_CODIGO FROM CAIXAS ');
  dmCadastros.QTemp.SQL.Add('WHERE CAI_NOME = ' + QuotedStr(vfCaixa));
  dmCadastros.QTemp.SQL.Add('AND CAI_SENHA = ' + QuotedStr(vfSenha));
  dmCadastros.QTemp.SQL.Add('AND CAI_ATIVO = ' + QuotedStr('S'));
  dmCadastros.QTemp.Open;
  if dmCadastros.QTemp.Fields[0].IsNull then
    Result := '0'
  else
    result := dmCadastros.QTemp.Fields[0].Text;
end;

end.
