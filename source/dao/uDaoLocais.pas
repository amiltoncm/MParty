unit uDaoLocais;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB;

procedure ListarLocais(vfOrdem: String; vfLimite: String);
procedure FiltrarLocais(vfCampoFil: String; vfOperador: String; vfParametro: 
		     String; vfOrdem: String; vfLimite: String);

const
ctCampos = 'LOC_CODIGO, LOC_DESCRICAO';
ctTabelas = 'LOCAIS';

implementation

uses dataCadastros;

{--- Lista todos os registros da tabela ---------------------------------------}

procedure ListarLocais(vfOrdem: String; vfLimite: String);
begin
  dmCadastros.qyLocais.Close;
  dmCadastros.qyLocais.SQL.Clear;
  dmCadastros.qyLocais.SQL.Add('SELECT '+ ctCampos + ' FROM ' + ctTabelas);
  if vfOrdem <> '0' then
    dmCadastros.qyLocais.SQL.Add(' ORDER BY ' + vfOrdem);
  if vfLimite <> '0' then
    dmCadastros.qyLocais.SQL.Add(' LIMIT ' + vfLimite);
  dmCadastros.qyLocais.Open;
end;

{--- Filtra registros da tabela ------------------------------------------------}

procedure FiltrarLocais(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String; vfLimite: String);
begin
  dmCadastros.qyLocais.Close;
  dmCadastros.qyLocais.SQL.Clear;
  dmCadastros.qyLocais.SQL.Add('SELECT ' + ctCampos + ' FROM ' + ctTabelas + ' WHERE ');
  dmCadastros.qyLocais.SQL.Add(vfCampoFil + ' ' + vfOperador + ' ');
  dmCadastros.qyLocais.SQL.Add(QuotedStr(vfParametro));
  if vfOrdem <> '0' then
    dmCadastros.qyLocais.SQL.Add(' ORDER BY ' + vfOrdem);
  if vfLimite <> '0' then
    dmCadastros.qyLocais.SQL.Add(' LIMIT ' + vfLimite);
  dmCadastros.qyLocais.Open;
end;

end.
