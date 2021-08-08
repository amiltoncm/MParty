unit uFuncoesLogs;

interface

uses Windows, Forms, Controls, SysUtils, Graphics, Dialogs, Inifiles;

procedure GravaArqText(vfFile, vfMsg: String);
procedure GravaLog(vfTipo, vfMsg: String);

implementation

uses uVarGlobal;

procedure GravaArqText(vfFile, vfMsg: String);
Var
vArq: TextFile;
begin
  //Cria log com erro
  AssignFile(vArq, vfFile);
  if FileExists (vfFile) then
    DeleteFile(vfFile);
  if not FileExists(vfFile) then
    ReWrite(vArq);
  vfFile := vfMsg;
  Append(vArq);
  WriteLn(vArq, vfFile);
  CloseFile(vArq);
end;

procedure GravaLog(vfTipo, vfMsg: String);
Var
vControl: TInifile;
vLocArq, vLog: String;
vArq: TextFile;
begin
  vControl := TInifile.Create(vgArqIni);
  //grava nome do ultimo usuario
  if vfTipo = 'Login' then //Entrada no sistema
  begin
    vControl.WriteString('usuario', 'ultimo', vgNomeUsuarioLog);
    vLocArq := vControl.readstring('Logs', 'conexao', '');
    vLog := vgNomeUsuarioLog + ' - ' + vfTipo + '  - ' + FormatDateTime('dd/MM/yyyy', (now)) + ' - ' + TimeToStr(now) + #13;
  end;
  if vfTipo = 'Logout' then //Saída do sistema
  begin
    vLocArq := vControl.readstring('Logs', 'conexao', '');
    vLog := vgNomeUsuarioLog + ' - ' + vfTipo + ' - ' + FormatDateTime('dd/MM/yyyy', (now)) + ' - ' + TimeToStr(now) + #13;
  end;
  if vfTipo = 'Cancel' then //Cancelamento de login
  begin
    vLocArq := vControl.readstring('Logs', 'conexao', '');
    vLog := vfMsg + FormatDateTime('dd/MM/yyyy', (now)) + ' - ' + TimeToStr(now) + #13;
  end;
  if vfTipo = 'Erro' then //Erros em geral
  begin
    vLocArq := vControl.readstring('Logs', 'erro', '');
    vLog := vfMsg + ' - ' + FormatDateTime('dd/MM/yyyy', (now)) + ' - ' + TimeToStr(now) + #13;
  end;
  //grava log de login/logout e erros em geral
  AssignFile(vArq, vLocArq);
  if not FileExists(vLocArq) then
    ReWrite(vArq);
  Append(vArq);
  WriteLn(vArq, vLog);
  CloseFile(vArq);
  vControl.Free;
end;

end.
