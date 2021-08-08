unit uFuncoesMath;

interface

uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
     StdCtrls, ExtCtrls, ComCtrls;

function CalculaIdade(DataIni, DataFim : TDateTime) : string;
function DataIdade(DataNascimento : String) : Integer;

implementation

function CalculaIdade(DataIni, DataFim : TDateTime) : string;
var
iDia, iMes, iAno, fDia, fMes, fAno: Word;
nDia, nMes, nAno: Double;
begin
  nMes := 0;
  DecodeDate(DataIni, iAno, iMes, iDia);
  DecodeDate(DataFim, fAno, fMes, fDia);
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
        nDia := (DataFim-IncMonth(DataFim,-1))-(iDia-fDia);
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

Function DataIdade(DataNascimento : String) : Integer;
Begin
  try
    StrToDate(DataNascimento); //-- Verifica se a data é valida
  except
    messagedlg('Data de nascimento inválida!', MTERROR, [MBOK], 0);
    abort;
  end;
  result := Trunc((Date - Strtodate(DataNascimento))/365.25);
end;

end.
