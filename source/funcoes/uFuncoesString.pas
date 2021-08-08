unit uFuncoesString;

interface

uses SysUtils;

function RemoveAcento(vfStr: String): String;
function PrimeiroNome(vfNome: String): String;
function DataExtenso(vfCidade: String; vfData: TDateTime): String;
function PegarInicias(vfValor: String): String;

implementation

function RemoveAcento(vfStr: String): String;
const
cComAcento = '‡‚ÍÙ˚„ı·ÈÌÛ˙Á¸¿¬ ‘€√’¡…Õ”⁄«‹';
cSemAcento = 'aaeouaoaeioucuAAEOUAOAEIOUCU';
var
vX: Integer;
begin;
  for vX := 1 to Length(vfStr) do
    if Pos(vfStr[vX], cComAcento) <> 0 then
      vfStr[vX] := cSemAcento[Pos(vfStr[vX], cComAcento)];
  Result := vfStr;
end;

function PrimeiroNome(vfNome: String): String;
Var
vI, vTamanho: Integer;
vAux: String;
vSobre: Boolean;
Begin
  vSobre := false;
  vAux := '';
  vTamanho := Length(vfNome);
  for vI := 1 to vTamanho do
  Begin
    if vfNome[vI] = ' ' then
      vSobre := True;
      if vSobre <> true then
        vAux := vAux + vfNome[vI];
  end;
  result := vAux;
end;

function DataExtenso(vfCidade: String; vfData: TDateTime): String;
Const
cMes: Array[1..12] of String = ('janeiro', 'fevereiro', 'marÁo', 'abril', 'maio',
'junho', 'julho', 'agosto', 'setembro', 'outubro', 'novembro', 'dezembro');
Var
vDia, vMes, vAno: Word;
Begin
  DecodeDate(vfData, vAno, vMes, vDia);
  Result := vfCidade + ', ' + IntToStr(vDia) + ' de ' + cMes[vMes]+' de '+ IntToStr(vAno);
end;

function PegarInicias(vfValor: String): String;
Var
vI: Integer;
begin
  for vI := 1 to Length(vfValor) do
  begin
    if (Length(Trim(vfValor[vI - 1])) = 0) then
      Result := Result + copy(vfValor, vI, 1);
  end;
end;

end.
