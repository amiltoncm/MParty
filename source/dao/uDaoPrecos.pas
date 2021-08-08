unit uDaoPrecos;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB;

procedure ListarPrecos(vfOrdem: String; vfLimite: String);
procedure FiltrarPrecos(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String; vfLimite: String);
procedure ListarPrecosVal(vfOrdem: String);
function GetValuePreco(vfCodPreco: String): real;
function GetDescProd(vfCodPreco: String): String;

const
ctCampos = 'PRE_CODIGO, PRE_DESCRICAO, PRE_PRECO, PRE_STATUS';
ctTabelas = 'PRECOS';

implementation

uses dataCadastros, dataConsultas;

{--- Lista todos os registros da tabela ---------------------------------------}

procedure ListarPrecos(vfOrdem: String; vfLimite: String);
begin
  dmCadastros.qyPrecos.Close;
  dmCadastros.qyPrecos.SQL.Clear;
  dmCadastros.qyPrecos.SQL.Add('SELECT '+ ctCampos + ' FROM ' + ctTabelas);
  if vfOrdem <> '0' then
    dmCadastros.qyPrecos.SQL.Add(' ORDER BY ' + vfOrdem);
  if vfLimite <> '0' then
    dmCadastros.qyPrecos.SQL.Add(' LIMIT ' + vfLimite);
  dmCadastros.qyPrecos.Open;
end;

{--- Filtra registros da tabela -----------------------------------------------}

procedure FiltrarPrecos(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String; vfLimite: String);
begin
  dmCadastros.qyPrecos.Close;
  dmCadastros.qyPrecos.SQL.Clear;
  dmCadastros.qyPrecos.SQL.Add('SELECT ' + ctCampos + ' FROM ' + ctTabelas + ' WHERE ');
  dmCadastros.qyPrecos.SQL.Add(vfCampoFil + ' ' + vfOperador + ' ');
  dmCadastros.qyPrecos.SQL.Add(QuotedStr(vfParametro));
  if vfOrdem <> '0' then
    dmCadastros.qyPrecos.SQL.Add(' ORDER BY ' + vfOrdem);
  if vfLimite <> '0' then
    dmCadastros.qyPrecos.SQL.Add(' LIMIT ' + vfLimite);
  dmCadastros.qyPrecos.Open;
end;

procedure ListarPrecosVal(vfOrdem: String);
begin
  dmCadastros.qyPrecos.Close;
  dmCadastros.qyPrecos.SQL.Clear;
  dmCadastros.qyPrecos.SQL.Add('SELECT '+ ctCampos + ' FROM ' + ctTabelas);
  dmCadastros.qyPrecos.SQL.Add('WHERE PRE_STATUS = ' + QuotedStr('A'));
  dmCadastros.qyPrecos.SQL.Add('AND PRE_CODIGO > 0');
  if vfOrdem <> '0' then
    dmCadastros.qyPrecos.SQL.Add(' ORDER BY ' + vfOrdem);
  dmCadastros.qyPrecos.Open;
end;

function GetValuePreco(vfCodPreco: String): real;
begin
  dmCadastros.QTemp.Close;
  dmCadastros.QTemp.SQL.Clear;
  dmCadastros.QTemp.SQL.Add('SELECT PRE_PRECO FROM PRECOS WHERE PRE_CODIGO = ');
  dmCadastros.QTemp.SQL.Add(vfCodPreco);
  dmCadastros.QTemp.Open;
  if dmCadastros.QTemp.Fields[0].IsNull then
    result := 0
  else
    result := dmCadastros.QTemp.Fields[0].Value;
end;

function GetDescProd(vfCodPreco: String): String;
begin
  dmCadastros.QTemp.Close;
  dmCadastros.QTemp.SQL.Clear;
  dmCadastros.QTemp.SQL.Add('SELECT PRE_DESCRICAO FROM PRECOS WHERE PRE_CODIGO = ');
  dmCadastros.QTemp.SQL.Add(vfCodPreco);
  dmCadastros.QTemp.Open;
  if dmCadastros.QTemp.Fields[0].IsNull then
    result := 'NÃO ENCONTRADO'
  else
    result := dmCadastros.QTemp.Fields[0].Text;
end;

end.
