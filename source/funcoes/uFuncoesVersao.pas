unit uFuncoesVersao; //A partir de 1.1.6.33
interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB, JPeg, Registry, ShellApi, UrlMon;

procedure ControleVersao;
procedure AtualizaSistemaFunc;
function DownloadFile(Source, Dest: string): Boolean;
function VersaoExe(ArquivoExe : string): String;
//procedure ListaVersao;
procedure VerificaVersao;
//procedure Pesquisar(vParametro: String);
//procedure VerificaModulos;

implementation

uses dataConfig, uFuncoesWeb, uPrincipal, uVarGlobal, uFuncoesSistema;

procedure ControleVersao;
Var
vVersaoAtual: String;
begin
{
  vVersaoAtual := Trim(PegaVersao(0));
  dmConfig.qyVersao.Close;
  dmConfig.qyVersao.SQL.Clear;
  dmConfig.qyVersao.SQL.Add('select ver_id, ver_obs from versao where ver_id = ');
  dmConfig.qyVersao.SQL.Add(QuotedStr(vVersaoAtual));
  dmConfig.qyVersao.Open;
  if dmConfig.qyVersaover_id.IsNull then
  begin
    //Atualiza vers�o e descreve altera��es e corre��es
    dmConfig.qyVersao.Insert;
    dmConfig.qyVersaover_id.Text := vVersaoAtual;
    //dmConfig.qyVersaover_obs.Value := dmConfig.qyVersaover_obs.Value + FormatDateTime('dd/mm/yyyy', Date) +  ' - ' + 'Seguran�a - Conclu�do configura��o de acesso aos menus!' + '!' + #13;
    //dmConfig.qyVersaover_obs.Value := dmConfig.qyVersaover_obs.Value + FormatDateTime('dd/mm/yyyy', Date) +  ' - ' + 'Seguran�a - Inclu�do procedimento de seguran�a ao exportar exames para PDF!' + '!' + #13;
    //dmConfig.qyVersaover_obs.Value := dmConfig.qyVersaover_obs.Value + FormatDateTime('dd/mm/yyyy', Date) +  ' - ' + 'Financeiro - Inclu�do n�mero (ID) da cobran�a na baixa!' + '!' + #13;
    //dmConfig.qyVersaover_obs.Value := dmConfig.qyVersaover_obs.Value + FormatDateTime('dd/mm/yyyy', Date) +  ' - ' + 'Atualiza��o de software - Alterado para upload de v�rios m�dulos!' + '!' + #13;
    //dmConfig.qyVersaover_obs.Value := dmConfig.qyVersaover_obs.Value + FormatDateTime('dd/mm/yyyy', Date) +  ' - ' + 'Financeiro - Inclu�do op��o de "marcar/desmarcar todos" na baixa de duplicatas!' + #13;
    //dmConfig.qyVersaover_obs.Value := dmConfig.qyVersaover_obs.Value + FormatDateTime('dd/mm/yyyy', Date) +  ' - ' + 'Citologia - Corrigido notas na Citologia!' + #13;
    //dmConfig.qyVersaover_obs.Value := dmConfig.qyVersaover_obs.Value + FormatDateTime('dd/mm/yyyy', Date) +  ' - ' + 'Captura de documentos (Scanner) - Inclu�do captura de documentos!' + #13;

    //dmConfig.qyVersaover_obs.Value := dmConfig.qyVersaover_obs.Value + FormatDateTime('dd/mm/yyyy', Date) +  ' - ' + 'M�dulo de Etiquetas (Vs. 1.0.0.6) - Alterado layout do c�digo de barras!' + #13;
    //dmConfig.qyVersaover_obs.Value := dmConfig.qyVersaover_obs.Value + FormatDateTime('dd/mm/yyyy', Date) +  ' - ' + 'M�dulo de Expedi��o (Vs. 1.0.0.6) - Alterado para aparecer as iniciais na Histologia!' + #13;
    //dmConfig.qyVersaover_obs.Value := dmConfig.qyVersaover_obs.Value + FormatDateTime('dd/mm/yyyy', Date) +  ' - ' + 'Atualiza��o - Alterado fun��o de atualiza��o do sistema!' + #13;
    dmConfig.qyVersaover_obs.Value := dmConfig.qyVersaover_obs.Value + FormatDateTime('dd/mm/yyyy', Date) +  ' - ' + 'Consultas exames - Inclu�do aba financeiro!';
    dmConfig.qyVersao.Post;
  end;
}
end;

function DownloadFile(Source, Dest: string): Boolean;
Begin
  try
    Result :=  UrlDownloadToFile(nil, PChar(source), PChar(Dest), 0, nil) = 0;
  except
    Result := False;
  end;
end;

procedure AtualizaSistemaFunc;
Var
vPath, vDownloads: String;
Begin
  vPath := DiretorioSemBarra(ExtractFileDir(Application.ExeName));
  vDownloads := vPath + '\Update.exe';
  if FileExists(vDownloads) then
  Begin
    if MessageDlg('Para continuar com a atualiza��o o Sistema ser� fechado!' +
    #13 + 'Deseja continuar?', mtConfirmation, [mbYes, mbno], 0) = mrYes then
    Begin
      WinExec(PAnsiChar(vDownloads), SW_SHOWNORMAL);
      Application.Terminate;
    end;
  end
  else
    Messagedlg('M�dulo n�o instalado!', mtInformation,[mbok],0);
end;

function VersaoExe(ArquivoExe : string): String;
type
PFFI = ^vs_FixedFileInfo;
var
F: PFFI;
Handle: Dword;
Len: Longint;
Data: Pchar;
Buffer: Pointer;
Tamanho: Dword;
Parquivo: Pchar;
Arquivo: String;
begin
  Arquivo := ArquivoExe;
  Parquivo := StrAlloc(Length(Arquivo) + 1);
  StrPcopy(Parquivo, Arquivo);
  Len := GetFileVersionInfoSize(Parquivo, Handle);
  Result := '';
  if Len > 0 then
  begin
    Data := StrAlloc(Len + 1);
    if GetFileVersionInfo(Parquivo, Handle, Len, Data) then
    begin
      VerQueryValue(Data, '', Buffer, Tamanho);
      F := PFFI(Buffer);
      Result := Format('%d.%d.%d.%d', [HiWord(F^.dwFileVersionMs), LoWord
          (F^.dwFileVersionMs), HiWord(F^.dwFileVersionLs), LoWord
          (F^.dwFileVersionLs)]);
    end;
    StrDispose(Data);
  end;
  StrDispose(Parquivo);
end;

procedure VerificaVersao;
Var
vVersaoExe, vVersaoBD: String;
vLocUpdate, vDestUpdate, vPath: String;
vArqVersao: TextFile;
vValorVersao, vVersaoAtual: String;
Begin
  //Verifica a vers�o na rede local
  //Verifica versao do executavel
  dmConfig.qyConfig.Active := true;
  vVersaoExe := Trim(PegaVersao(0));
  //Verifica versao salva no Banco
  vVersaoBD := Trim(dmConfig.qyConfigcfg_versao.Text);
  //Verifica se as vers�es n�o s�o iguais
  if (vVersaoExe <> vVersaoBD) then
  Begin
    //Verifica qual vers�o � maior
    if vVersaoExe > vVersaoBD then
    Begin
      //caso a vers�o do execut�vel seja maior, atualiza banco de dados
      dmConfig.qyConfig.Edit;
      dmConfig.qyConfigcfg_versao.Text := Trim(vVersaoExe);
      dmConfig.qyConfig.Post;

      //Atualiza tamb�m a tabela de m�dulos
{
      //1 - Genesis
      dmConfig.qyModulos.Close;
      dmConfig.qyModulos.SQL.Clear;
      dmConfig.qyModulos.SQL.Add('select mod_codigo, mod_executavel, mod_nome, mod_descricao, ');
      dmConfig.qyModulos.SQL.Add('mod_versaoinst from modulos ');
      dmConfig.qyModulos.SQL.Add('where mod_codigo = 1');
      dmConfig.qyModulos.Open;
      dmConfig.qyModulos.Edit;
      dmConfig.qyModulosmod_versaoinst.Text := Trim(vVersaoExe);
      dmConfig.qyModulos.Post;
    end
    else
    Begin
      //caso a vers�o do BD seja maior, avisa que existe uma vers�o maior dispon�vel
      if MessageDlg('Existem m�quinas em sua rede com nova vers�o dispon�vel: ' + vVersaoBD + #13 + 'Deseja atualizar o sistema via internet?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        AtualizaSistemaFunc;
    end;
  end;

  //Verifica a vers�o pela internet

  //Verifica se o micro possui conex�o com a internet
  if ConectadoWeb = true then
  begin
    vLocUpdate := 'http://www.nextinf.com/genesis/update/Genesis.ver';
    vDestUpdate := vPath + '\Genesis.ver';
    if DownloadFile(vLocUpdate, vDestUpdate) = true then
    begin
      try
        AssignFile(vArqVersao, vDestUpdate);
        Reset(vArqVersao);
        Readln(vArqVersao, vValorVersao);
        CloseFile(vArqVersao);
        vVersaoAtual := Trim(PegaVersao(0));
        vVersaoAtual := TrimChar(vVersaoAtual, ' ');
        vValorVersao := TrimChar(vValorVersao, ' ');
        if vVersaoAtual < vValorVersao then
        begin
          if MessageDlg('Existe uma nova vers�o dispon�vel na internet: ' + vValorVersao + #13 + 'Deseja atualizar o sistema?',
          mtConfirmation, [mbYes, mbNo], 0) = mrYes then
            AtualizaSistemaFunc;
        end;
      except;
      end;
    end;
  end;
end;

procedure ListaVersao;
begin
  dmConfig.qyVersao.Close;
  dmConfig.qyVersao.SQL.Clear;
  dmConfig.qyVersao.SQL.Add('select ver_id, ver_obs from versao order by ver_id desc');
  dmConfig.qyVersao.Open;
end;

procedure Pesquisar(vParametro: String);
begin
  dmConfig.qyVersao.Close;
  dmConfig.qyVersao.SQL.Clear;
  dmConfig.qyVersao.SQL.Add('select ver_id, ver_obs from versao where ver_obs like ');
  dmConfig.qyVersao.SQL.Add(QuotedStr('%' + vParametro + '%'));
  dmConfig.qyVersao.SQL.Add('order by ver_id desc');
  dmConfig.qyVersao.Open;
end;

procedure VerificaModulos;
Var
vCaptura, vConfig, vEtiquetas, vExpedicao, vGera_xml, vIntegrador, vPrint: String; //Path dos execut�veis instalados
vVerCaptura, vVerConfig, vVerEtiquetas, vVerExpedicao, vVerGera_xml, vVerIntegrador, vVerPrint: String; //Vers�o dos execut�veis instalados
vVersaoAtual: String; //Pega vers�o atualizada no Banco de dados
vVerErros: Integer;
begin
  vVerErros := 0;
  dmConfig.qyModulos.Close;
  dmConfig.qyModulos.SQL.Clear;
  dmConfig.qyModulos.SQL.Add('select mod_codigo, mod_executavel, mod_nome, mod_descricao, mod_versaoinst ');
  dmConfig.qyModulos.SQL.Add('from modulos order by mod_codigo');
  dmConfig.qyModulos.Open;

  dmConfig.qyModulos.Next;
  //Captura
  vVersaoAtual := Trim(dmConfig.qyModulosmod_versaoinst.Text);
  vCaptura := vgDirProgram + '\Captura.exe';
  vVerCaptura := VersaoExe(vCaptura);
  if vVersaoAtual <> vVerCaptura then
  begin
    MessageDlg('O m�dulo de CAPTURA est� desatualizado!', mtWarning, [mbok], 0);
    vVerErros := 1;
  end;

  dmConfig.qyModulos.Next;
  //Config
  vVersaoAtual := Trim(dmConfig.qyModulosmod_versaoinst.Text);
  vConfig := vgDirProgram + '\Config.exe';
  vVerConfig := VersaoExe(vConfig);
  if vVersaoAtual <> vVerConfig then
  begin
    MessageDlg('O m�dulo de CONFIGURA��O est� desatualizado!', mtWarning, [mbok], 0);
    vVerErros := 1;
  end;

  dmConfig.qyModulos.Next;
  //Etiquetas
  vVersaoAtual := Trim(dmConfig.qyModulosmod_versaoinst.Text);
  vEtiquetas := vgDirProgram + '\Etiquetas.exe';
  vVerEtiquetas := VersaoExe(vEtiquetas);
  if vVersaoAtual <> vVerEtiquetas then
  begin
    MessageDlg('O m�dulo de ETIQUETAS est� desatualizado!', mtWarning, [mbok], 0);
    vVerErros := 1;
  end;

  dmConfig.qyModulos.Next;
  //Expedicao
  vVersaoAtual := Trim(dmConfig.qyModulosmod_versaoinst.Text);
  vExpedicao := vgDirProgram + '\Expedicao.exe';
  vVerExpedicao := VersaoExe(vExpedicao);
  if vVersaoAtual <> vVerExpedicao then
  begin
    MessageDlg('O m�dulo de EXPEDI��O est� desatualizado!', mtWarning, [mbok], 0);
    vVerErros := 1;
  end;

  dmConfig.qyModulos.Next;
  //Gera_xml
  vVersaoAtual := Trim(dmConfig.qyModulosmod_versaoinst.Text);
  vGera_xml := vgDirProgram + '\Gera_xml.exe';
  vVerGera_xml := VersaoExe(vGera_xml);
  if vVersaoAtual <> vVerGera_xml then
  begin
    MessageDlg('O m�dulo de XML / TISS est� desatualizado!', mtWarning, [mbok], 0);
    vVerErros := 1;
  end;

  dmConfig.qyModulos.Next;
  //Integrador
  vVersaoAtual := Trim(dmConfig.qyModulosmod_versaoinst.Text);
  vIntegrador := vgDirProgram + '\Integrador.exe';
  vVerIntegrador := VersaoExe(vIntegrador);
  if vVersaoAtual <> vVerIntegrador then
  begin
    MessageDlg('O m�dulo de INTEGRA��O est� desatualizado!', mtWarning, [mbok], 0);
    vVerErros := 1;
  end;

  dmConfig.qyModulos.Next;
  //Print
  vVersaoAtual := Trim(dmConfig.qyModulosmod_versaoinst.Text);
  vPrint := vgDirProgram + '\Print.exe';
  vVerPrint := VersaoExe(vPrint);
  if vVersaoAtual <> vVerPrint then
  begin
    MessageDlg('O m�dulo de IMPRESS�O est� desatualizado!', mtWarning, [mbok], 0);
    vVerErros := 1;
  end;

  if vVerErros = 1 then
  begin
    frmVerificaVersaoweb.ShowModal;
    AtualizaSistemaFunc;
  end;
}
    End; //Retirar
  End; //Retirar
end;

end.
