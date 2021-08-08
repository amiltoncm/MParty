unit uDaoFestasDatas;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB;

procedure ListarFestasDatas(vfOrdem: String; vfLimite: String);
procedure FiltrarFestasDatas(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String; vfLimite: String);
procedure InitValuesFestasDatas(vfDataInic: TDate; vfDataFinal: TDate);
function TestaData(vfData: TDate): boolean;

const
ctCampos = 'FES_CODIGO, FES_DATA';
ctTabelas = 'FESTASDATAS';

implementation

uses dataCadastros, uFuncoesDatas, uVarGlobal;

{--- Lista todos os registros da tabela ----------------------------------------}

procedure ListarFestasDatas(vfOrdem: String; vfLimite: String);
begin
  dmCadastros.qyFestasDatas.Close;
  dmCadastros.qyFestasDatas.SQL.Clear;
  dmCadastros.qyFestasDatas.SQL.Add('SELECT '+ ctCampos + ' FROM ' + ctTabelas);
  if vfOrdem <> '0' then
    dmCadastros.qyFestasDatas.SQL.Add(' ORDER BY ' + vfOrdem);
  if vfLimite <> '0' then
    dmCadastros.qyFestasDatas.SQL.Add(' LIMIT ' + vfLimite);
  dmCadastros.qyFestasDatas.Open;
end;

{--- Filtra registros da tabela ------------------------------------------------}

procedure FiltrarFestasDatas(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String; vfLimite: String);
begin
  dmCadastros.qyFestasDatas.Close;
  dmCadastros.qyFestasDatas.SQL.Clear;
  dmCadastros.qyFestasDatas.SQL.Add('SELECT ' + ctCampos + ' FROM ' + ctTabelas + ' WHERE ');
  dmCadastros.qyFestasDatas.SQL.Add(vfCampoFil + ' ' + vfOperador + ' ');
  dmCadastros.qyFestasDatas.SQL.Add(QuotedStr(vfParametro));
  if vfOrdem <> '0' then
    dmCadastros.qyFestasDatas.SQL.Add(' ORDER BY ' + vfOrdem);
  if vfLimite <> '0' then
    dmCadastros.qyFestasDatas.SQL.Add(' LIMIT ' + vfLimite);
  dmCadastros.qyFestasDatas.Open;
end;

procedure InitValuesFestasDatas(vfDataInic: TDate; vfDataFinal: TDate);
Var
vNumDias, vCont: integer;
begin
  if dmCadastros.qyFestasDatas.Active = false then
    dmCadastros.qyFestasDatas.Active := true;
  vNumDias := ContarDias(vfDataInic, vfDataFinal);
  for vCont := 0 to vNumDias do
  begin
    try
      dmCadastros.qyFestasDatas.Insert;
      dmCadastros.qyFestasDatasFES_CODIGO.Text := vgFestaAberta;
      dmCadastros.qyFestasDatasFES_DATA.Value := vfDataInic + vCont;
      dmCadastros.qyFestasDatas.Post;
    except
      on E: Exception do
      begin
        MessageDlg('Erro ao gravar Alteração / Inserção!' + #13#10 +
                    E.Message,mtError,[mbOk],0);
        dmCadastros.qyFestas.Refresh;
      end;
    end;
  end;
end;

function TestaData(vfData: TDate): boolean;
begin
  dmCadastros.qyFestasDatas.Close;
  dmCadastros.qyFestasDatas.SQL.Clear;
  dmCadastros.qyFestasDatas.SQL.Add('SELECT '+ ctCampos + ' FROM ' + ctTabelas);
  dmCadastros.qyFestasDatas.SQL.Add(' WHERE FES_DATA = ');
  dmCadastros.qyFestasDatas.SQL.Add(QuotedStr(FormatDateTime(vgMaskDataSQL, (vfData))));
  dmCadastros.qyFestasDatas.SQL.Add(' AND FES_CODIGO = ');
  dmCadastros.qyFestasDatas.SQL.Add(vgFestaAberta);
  dmCadastros.qyFestasDatas.Open;
  if dmCadastros.qyFestasDatasFES_CODIGO.IsNull then
    Result := false
  else
    Result := true;
end;

end.
