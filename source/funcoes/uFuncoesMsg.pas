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
  SetResourceString(@SMsgDlgNo, 'Não');
  SetResourceString(@SMsgDlgInformation, 'Informação');
  SetResourceString(@SMsgDlgError, 'Erro');
  SetResourceString(@SMsgDlgWarning, 'Informação');
  SetResourceString(@SMsgDlgConfirm, 'Confirmação');
end;

end.
