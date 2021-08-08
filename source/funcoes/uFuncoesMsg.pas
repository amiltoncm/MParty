unit uFuncoesMsg;

interface

uses SysUtils, Windows, Consts;

procedure SetResourceString(AResString: PResStringRec; ANewValue: PChar);
procedure TraduzMensagens();

implementation

procedure SetResourceString(AResString: PResStringRec; ANewValue: PChar);
var
vPOldProtect: DWORD;
begin
  VirtualProtect(AResString, SizeOf(AResString^), PAGE_EXECUTE_READWRITE, @vPOldProtect);
  AResString^.Identifier := Integer(ANewValue);
  VirtualProtect(AResString, SizeOf(AResString^), vPOldProtect, @vPOldProtect);
end;

procedure TraduzMensagens();
begin
  SetResourceString(@SMsgDlgYes, 'Sim');
  SetResourceString(@SMsgDlgNo, 'N�o');
  SetResourceString(@SMsgDlgInformation, 'Informa��o');
  SetResourceString(@SMsgDlgError, 'Erro');
  SetResourceString(@SMsgDlgWarning, 'Informa��o');
  SetResourceString(@SMsgDlgConfirm, 'Confirma��o');
end;

end.
