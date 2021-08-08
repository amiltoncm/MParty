unit uFuncoesDatas;

interface

uses DateUtils, SysUtils;

function DataExtenso(vfCidade: String; vfData: TDateTime): String;
function CalculaIdade(vfDataIni, vfDataFim : TDateTime) : String;
function Ano: Integer;
function ContarDias(vfDataIni, vfDataFim : TDateTime): integer;

implementation

function DataExtenso(vfCidade: String; vfData: TDateTime): String;
Const
AMes: Array[1..12] of string = ('janeiro', 'fevereiro', 'março', 'abril', 'maio',
'junho', 'julho', 'agosto', 'setembro', 'outubro', 'novembro', 'dezembro');
Var
vDia, vMes, vAno:Word;
begin
  DecodeDate(vfData, vAno, vMes, vDia);
  Result := vfCidade + ', '+IntToStr(vDia)+' de '+aMes[vMes]+' de '+ IntToStr(vAno);
end;

function CalculaIdade(vfDataIni, vfDataFim : TDateTime) : String;
var
iDia, iMes, iAno, fDia, fMes, fAno: Word;
nDia, nMes, nAno: Double;
begin
  nMes := 0;
  DecodeDate(vfDataIni, iAno, iMes, iDia);
  DecodeDate(vfDataFim, fAno, fMes, fDia);
  nAno := fAno - iAno;
  if nAno > 0 then
    if fMes < iMes then
      nAno := nAno - 1
    else
    if(fMes = iMes) and (fDia < iDia) then
      nAno := nAno - 1;
  if fMes < iMes then
  begin
    nMes := 12 - (iMes-fMes);
    if fDia < iDia then
      nMes := nMes - 1;
    end
    else
    if fMes = iMes then
    begin
      nMes := 0;
      if fDia < iDia then
        nMes := 11;
      end
      else
      if fMes > iMes then
      begin
        nMes := fMes - iMes;
        if fDia < iDia then
          nMes := nMes - 1;
      end;
      nDia := 0;
      if fDia > iDia then
        nDia := fDia - iDia;
      if fDia < iDia then
        nDia := (vfDataFim - IncMonth(vfDataFim, -1)) - (iDia-fDia);
      Result := '';
      if nAno = 1 then
        Result := FloatToStr(nAno)+ ' Ano '
      else
      if nAno > 1 then
        Result := FloatToStr(nAno)+ ' Anos ';
      if nMes = 1 then
        Result := Result + FloatToStr(nMes)+ ' Mês '
      else
      if nMes > 1 then
        Result := Result + FloatToStr(nMes)+ ' Meses ';
      if nDia = 1 then
        Result := Result + FloatToStr(nDia)+ ' Dia '
      else
      if nDia > 1 then
        Result := Result + FloatToStr(nDia)+ ' Dias ';
end;

function Ano: Integer;
Var
vAno, vMes, vDia: Word;
begin
  DecodeDate(now, vAno, vMes, vDia);
  result := vAno;
end;

function ContarDias(vfDataIni, vfDataFim : TDateTime): integer;
begin
  Result := DaysBetween(vfDataIni, vfDataFim);
end;

end.
