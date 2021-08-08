unit uFuncoesWeb;

interface

uses
  WinInet, Winapi.Windows;

function ConectadoWeb: boolean;

implementation

function ConectadoWeb: boolean;
var
flags : DWORD;
begin
  // verifica se está conectado a internet usando a API do Windows, é preciso declarar a uses WinInet.
  if not InternetGetConnectedState(@flags, 0) then
    result := false
  else
    result := true;
end;

end.

