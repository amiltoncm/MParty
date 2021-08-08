unit uDaoFestas;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB;

procedure ListarFestas(vfOrdem: String; vfLimite: String);
procedure FiltrarFestas(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String; vfLimite: String);
procedure VerifFesta;
procedure NovaFesta;
procedure GravarNovaFesta;
function NomeFesta: String;
procedure FinalizaFesta;

const
ctCampos = 'FES_CODIGO, FES_ANO, FES_DATAINIC, FES_DATAFINAL, FES_STATUS';
ctTabelas = 'FESTAS';

implementation

uses dataCadastros, uVarGlobal, uFuncoesDB, uFuncoesDatas, uDaoFestasDatas;

{--- Lista todos os registros da tabela ----------------------------------------}

procedure ListarFestas(vfOrdem: String; vfLimite: String);
begin
  dmCadastros.qyFestas.Close;
  dmCadastros.qyFestas.SQL.Clear;
  dmCadastros.qyFestas.SQL.Add('SELECT '+ ctCampos + ' FROM ' + ctTabelas);
  if vfOrdem <> '0' then
    dmCadastros.qyFestas.SQL.Add(' ORDER BY ' + vfOrdem);
  if vfLimite <> '0' then
    dmCadastros.qyFestas.SQL.Add(' LIMIT ' + vfLimite);
  dmCadastros.qyFestas.Open;
end;

{--- Filtra registros da tabela ------------------------------------------------}

procedure FiltrarFestas(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String; vfLimite: String);
begin
  dmCadastros.qyFestas.Close;
  dmCadastros.qyFestas.SQL.Clear;
  dmCadastros.qyFestas.SQL.Add('SELECT ' + ctCampos + ' FROM ' + ctTabelas + ' WHERE ');
  dmCadastros.qyFestas.SQL.Add(vfCampoFil + ' ' + vfOperador + ' ');
  dmCadastros.qyFestas.SQL.Add(QuotedStr(vfParametro));
  if vfOrdem <> '0' then
    dmCadastros.qyFestas.SQL.Add(' ORDER BY ' + vfOrdem);
  if vfLimite <> '0' then
    dmCadastros.qyFestas.SQL.Add(' LIMIT ' + vfLimite);
  dmCadastros.qyFestas.Open;
end;

{--- Verifica se existe festa em aberto ---------------------------------------}

procedure VerifFesta;
begin
  FiltrarFestas('FES_STATUS', '=', 'A', '0', '0');
  if dmCadastros.qyFestasFES_CODIGO.IsNull then
    vgFestaAberta := '0'
  else
    vgFestaAberta := dmCadastros.qyFestasFES_CODIGO.Text;
end;

{--- Dá um insert na tabela e gera dados iniciais -----------------------------}

procedure NovaFesta;
begin
  dmCadastros.qyFestas.Insert;
  dmCadastros.qyFestasFES_CODIGO.Value := GetCodigo('FES_CODIGO', 'FESTAS');
  dmCadastros.qyFestasFES_ANO.Value := Ano;
  dmCadastros.qyFestasFES_DATAINIC.Value := now;
  dmCadastros.qyFestasFES_DATAFINAL.Value := now;
  dmCadastros.qyFestasFES_STATUS.Text := 'A';
end;

procedure GravarNovaFesta;
begin
  Try
    dmCadastros.qyFestasFES_DATAINIC.Text := FormatDateTime('dd/MM/yyyy', dmCadastros.qyFestasFES_DATAINIC.Value);
    dmCadastros.qyFestasFES_DATAFINAL.Text := FormatDateTime('dd/MM/yyyy', dmCadastros.qyFestasFES_DATAFINAL.Value);
    dmCadastros.qyFestas.Post;
    vgFestaAberta := dmCadastros.qyFestasFES_CODIGO.Text;
    InitValuesFestasDatas(dmCadastros.qyFestasFES_DATAINIC.Value, dmCadastros.qyFestasFES_DATAFINAL.Value);
  except
    on E: Exception do
    Begin
      MessageDlg('Erro ao gravar Alteração / Inserção!' + #13#10 +
          E.Message,mtError,[mbOk],0);
      dmCadastros.qyFestas.Refresh;
    end;
  end;
end;

function NomeFesta: String;
begin
  Result := dmCadastros.qyFestasFES_ANO.Text + ': de ' +
             FormatDateTime('dd/MM/yyyy', dmCadastros.qyFestasFES_DATAINIC.Value) + ' a ' +
             FormatDateTime('dd/MM/yyyy', dmCadastros.qyFestasFES_DATAFINAL.Value);
end;

procedure FinalizaFesta;
begin
  FiltrarFestas('FES_STATUS', '=', 'A', '0', '0');
  if not(dmCadastros.qyFestasFES_CODIGO.IsNull) then
  begin
    dmCadastros.qyFestas.Edit;
    dmCadastros.qyFestasFES_STATUS.Text := 'F';
    try
      dmCadastros.qyFestas.Post;
      MessageDlg('Festa finalizada com sucesso!', mtInformation, [mbOK], 0);
    except
      MessageDlg('Não foi possível gravar alterações na tabela!', mtError, [mbOK], 0);
    end;
  end;
end;

end.
