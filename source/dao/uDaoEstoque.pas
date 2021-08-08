unit uDaoEstoque;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB;

//procedure SetValuesEstoque(vfEstoque: TEstoque);
procedure InsEstoque;
procedure EdtEstoque;
procedure PostEstoque;
procedure ListarEstoque(vfOrdem: String);
procedure FiltrarEstoque(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
function VerificaEstoque(vfCodigo: String): boolean;
procedure SetCodEstoque(vfCodigo: String);
procedure AddEstoque(vfQuant: String);
procedure SaidaEstoque(vfQuant: Real);
procedure ConsultaEstoque;

const
ctCampos = 'EST_CODIGO, PRE_CODIGO, EST_QUANTIDADE';
ctTabelas = 'ESTOQUE';

implementation

uses dataCadastros, uFuncoesDB, dataConsultas;

{--- Seta algum valor na tabela -----------------------------------------------}

{
procedure SetValuesEstoque(vfEstoque: TEstoque);
begin
  //@VINCULAR
end;
}

{--- Coloca a tabela em insert  -----------------------------------------------}

procedure InsEstoque;
begin
  if dmCadastros.qyEstoque.Active = false then
    dmCadastros.qyEstoque.Active := True;
  dmCadastros.qyEstoque.Insert;
end;

{--- Coloca a tabela em edit inserindo algum valor ----------------------------}

procedure EdtEstoque;
begin
  dmCadastros.qyEstoque.Edit;
end;

{--- Dá um post na tabela -----------------------------------------------------}

procedure PostEstoque;
begin
  try
    if dmCadastros.qyEstoque.State in [dsInsert] then
      dmCadastros.qyEstoqueEST_CODIGO.Value := GetCodigo('EST_CODIGO', 'ESTOQUE');
    dmCadastros.qyEstoque.Post;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao gravar Alteração / Inserção!' + #13 +
          E.Message,mtError,[mbOk],0);
      dmCadastros.qyEstoque.Refresh;
    end;
  end;
end;

{--- Lista todos os registros da tabela ---------------------------------------}

procedure ListarEstoque(vfOrdem: String);
begin
  dmCadastros.qyEstoque.Close;
  dmCadastros.qyEstoque.SQL.Clear;
  dmCadastros.qyEstoque.SQL.Add('SELECT '+ ctCampos + ' FROM ' + ctTabelas);
  if vfOrdem <> '0' then
    dmCadastros.qyEstoque.SQL.Add(' ORDER BY ' + vfOrdem);
  dmCadastros.qyEstoque.Open;
end;

{--- Filtra registros da tabela -----------------------------------------------}

procedure FiltrarEstoque(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
begin
  dmCadastros.qyEstoque.Close;
  dmCadastros.qyEstoque.SQL.Clear;
  dmCadastros.qyEstoque.SQL.Add('SELECT ' + ctCampos + ' FROM ' + ctTabelas + ' WHERE ');
  dmCadastros.qyEstoque.SQL.Add(vfCampoFil + ' ' + vfOperador + ' ');
  dmCadastros.qyEstoque.SQL.Add(QuotedStr(vfParametro));
  if vfOrdem <> '0' then
    dmCadastros.qyEstoque.SQL.Add(' ORDER BY ' + vfOrdem);
  dmCadastros.qyEstoque.Open;
end;

function VerificaEstoque(vfCodigo: String): boolean;
begin
  dmCadastros.qyEstoque.Close;
  dmCadastros.qyEstoque.SQL.Clear;
  dmCadastros.qyEstoque.SQL.Add('SELECT ' + ctCampos + ' FROM ' + ctTabelas);
  dmCadastros.qyEstoque.SQL.Add('WHERE PRE_CODIGO = ' + vfCodigo);
  dmCadastros.qyEstoque.Open;
  if dmCadastros.qyEstoque.FieldByName('PRE_CODIGO').IsNull then
    Result := False
  else
    Result := True;
end;

procedure SetCodEstoque(vfCodigo: String);
begin
  dmCadastros.qyEstoquePRE_CODIGO.Text := vfCodigo;
end;

procedure AddEstoque(vfQuant: String);
Var
vNovoSaldo, vAtual, vQuant: Real;
begin
  vAtual := dmCadastros.qyEstoqueEST_QUANTIDADE.Value;
  vQuant := StrToFloat(vfQuant);
  vNovoSaldo := vAtual + vQuant;
  EdtEstoque;
  dmCadastros.qyEstoqueEST_QUANTIDADE.Value := vNovoSaldo;
  PostEstoque;
end;

procedure SaidaEstoque(vfQuant: Real);
Var
vNovoSaldo: Real;
begin
  vNovoSaldo := dmCadastros.qyEstoqueEST_QUANTIDADE.Value - vfQuant;
  EdtEstoque;
  dmCadastros.qyEstoqueEST_QUANTIDADE.Value := vNovoSaldo;
  PostEstoque;
  if vNovoSaldo <= 0 then
    MessageDlg('O produto apresenta estoque de: ' + FloatToStr(vNovoSaldo) + ' unidades!',
                mtWarning, [mbOk], 0);
end;

procedure ConsultaEstoque;
begin
  dmConsultas.qyConsEstoque.Close;
  dmConsultas.qyConsEstoque.SQL.Clear;
  dmConsultas.qyConsEstoque.SQL.Add('SELECT E.EST_CODIGO, P.PRE_DESCRICAO, E.EST_QUANTIDADE ');
  dmConsultas.qyConsEstoque.SQL.Add('FROM ESTOQUE E, PRECOS P ');
  dmConsultas.qyConsEstoque.SQL.Add('WHERE E.PRE_CODIGO = P.PRE_CODIGO');
  dmConsultas.qyConsEstoque.SQL.Add('ORDER BY PRE_DESCRICAO');
  dmConsultas.qyConsEstoque.Open;
end;

end.
