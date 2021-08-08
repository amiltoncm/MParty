unit uDaoUsuarios;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB;

procedure ListarUsuarios(vfOrdem: String);
procedure FiltrarUsuarios(vfCampoFil: String; vfOperador: String; vfParametro: String; vfOrdem: String);
function FiltLoginUsuarios(vfUsuario: String; vfSenha: String): boolean;

const
ctCampos = 'USU_CODIGO, USU_NOME, USU_SENHA, USU_ATIVO';
ctTabelas = 'USUARIOS';

implementation

uses dataCadastros;

{--- Lista todos os registros da tabela ---------------------------------------}

procedure ListarUsuarios(vfOrdem: String);
begin
  dmCadastros.qyUsuarios.Close;
  dmCadastros.qyUsuarios.SQL.Clear;
  dmCadastros.qyUsuarios.SQL.Add('SELECT ' + ctCampos + ' FROM ' + ctTabelas);
  dmCadastros.qyUsuarios.SQL.Add('WHERE USU_CODIGO > 0');
  if vfOrdem <> '0' then
    dmCadastros.qyUsuarios.SQL.Add(' ORDER BY ' + vfOrdem);
  dmCadastros.qyUsuarios.Open;
end;

{--- Filtra registros da tabela -----------------------------------------------}

procedure FiltrarUsuarios(vfCampoFil: String; vfOperador: String; vfParametro: String; vfOrdem: String);
begin
  dmCadastros.qyUsuarios.Close;
  dmCadastros.qyUsuarios.SQL.Clear;
  dmCadastros.qyUsuarios.SQL.Add('SELECT ' + ctCampos + ' FROM ' + ctTabelas + ' WHERE ');
  dmCadastros.qyUsuarios.SQL.Add(vfCampoFil + ' ' + vfOperador + ' ');
  dmCadastros.qyUsuarios.SQL.Add(QuotedStr(vfParametro));
  dmCadastros.qyUsuarios.SQL.Add('AND USU_CODIGO > 0');
  if vfOrdem <> '0' then
    dmCadastros.qyUsuarios.SQL.Add(' ORDER BY ' + vfOrdem);
  dmCadastros.qyUsuarios.Open;
end;

{--- Filtra registros da tabela -----------------------------------------------}

function FiltLoginUsuarios(vfUsuario: String; vfSenha: String): boolean;
Var
vResult: Boolean;
begin
  dmCadastros.qyUsuarios.Close;
  dmCadastros.qyUsuarios.SQL.Clear;
  dmCadastros.qyUsuarios.SQL.Add('SELECT ' + ctCampos + ' FROM ' + ctTabelas);
  dmCadastros.qyUsuarios.SQL.Add(' WHERE USU_NOME = ');
  dmCadastros.qyUsuarios.SQL.Add(QuotedStr(vfUsuario));
  dmCadastros.qyUsuarios.SQL.Add(' AND USU_SENHA = ');
  dmCadastros.qyUsuarios.SQL.Add(QuotedStr(vfSenha));
  dmCadastros.qyUsuarios.SQL.Add(' AND USU_ATIVO = ');
  dmCadastros.qyUsuarios.SQL.Add(QuotedStr('S'));
  dmCadastros.qyUsuarios.Open;
  if dmCadastros.qyUsuariosUSU_CODIGO.IsNull then
    vResult := false
  else
    vResult := true;
  Result := vResult;
end;

end.
