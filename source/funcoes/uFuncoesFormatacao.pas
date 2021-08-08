unit uFuncoesFormatacao;

interface

uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
     StdCtrls, ExtCtrls, ComCtrls;

function LimpaDoc(vValor: String): String;//by Amilton
function NumeroReal(vfKey: Char ): Char;
function NumeroRealSP(vfKey: Char ): Char;
function NumerosReg(vfKey : Char ): Char;
function Numeros(vfKey : Char ): Char;
function TrocaVirgPPto(vfValor: String): String;
function LimpaBarra(vfValor: String): String;
function LimpaReal(vfValor: String): String;

implementation

function LimpaDoc(vValor: String): String;//by Amilton
Var
vValorNotDot: String;
vTamanho, vIndice: Integer;
Begin
  vTamanho := Length(vValor);
  for vIndice := 1 to vTamanho do
  Begin
    if (vValor[vIndice] <> '.') then //and (vValor[vIndice] <> '-') then
      vValorNotDot := vValorNotDot + vValor[vIndice];
  end;
  Result := vValorNotDot;
end;

function NumeroReal(vfKey: Char): Char;
begin
  if vfKey in [',', '.'] Then
    vfKey := DecimalSeparator;
  if not (vfkey in [ '0'..'9', DecimalSeparator, chr(8)]) then
    Result := #0
  else
    Result := vfKey;
end;

function NumeroRealSP(vfKey: Char): Char;
begin
  if vfKey in [',', '.'] Then
    vfKey := DecimalSeparator;
  if not (vfkey in [ '0'..'9', DecimalSeparator]) then
    Result := #0
  else
    Result := vfKey;
end;

function Numeros(vfKey: Char): Char;
begin
  if not (vfkey in [ '0'..'9', chr(8)]) then
    Result := #0
  else
    Result := vfKey;
end;

function NumerosReg(vfKey : Char):Char;
begin
  if not (vfKey in [ '0'..'9', chr(8), chr(45)]) then
    Result := #0
  else
    Result := vfKey;
end;

function TrocaVirgPPto(vfValor: String): String;
var
vI: integer;
begin
  if vfValor <> '' then
  begin
    for vI := 0 to Length(vfValor) do
    begin
      if vfValor[vI] = ',' then
        vfValor[vI] := '.';
    end;
  end;
  Result := vfValor;
end;

function LimpaBarra(vfValor: String): String;
Var
  vValorNotDot: String;
  vTamanho, vIndice: Integer;
Begin
  vTamanho := Length(vfValor);
  for vIndice := 1 to vTamanho do
  Begin
    if (vfValor[vIndice] <> '.') and (vfValor[vIndice] <> '-') then
      vValorNotDot := vValorNotDot + vfValor[vIndice];
  end;
  Result := vValorNotDot;
end;

function LimpaReal(vfValor: String): String;
Var
vValorNotDot: String;
vTamanho, vIndice: Integer;
Begin
  vTamanho := Length(vfValor);
  for vIndice := 1 to vTamanho do
  Begin
    if (vfValor[vIndice] <> '.') then
      vValorNotDot := vValorNotDot + vfValor[vIndice];
  end;
  Result := vValorNotDot;
end;

end.
