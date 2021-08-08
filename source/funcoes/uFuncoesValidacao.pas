unit uFuncoesValidacao;

interface

uses SysUtils;

function Cnpj(vfNum: String): Boolean;
function Cpf(vfNum: String): Boolean;
function VerificaCEP(vfCEP: String; vfUF: String): Boolean;
function TestaInteiro(vfNumeroStr: String): boolean;
function TestaReal(vfNumeroStr: String): boolean;

implementation

uses uFuncoesFormatacao;

function Cnpj(vfNum: String): Boolean;
var
n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, d1, d2: integer;
digitado, calculado: String;
begin
  n1 := StrToInt(vfNum[1]);
  n2 := StrToInt(vfNum[2]);
  n3 := StrToInt(vfNum[4]);
  n4 := StrToInt(vfNum[5]);
  n5 := StrToInt(vfNum[6]);
  n6 := StrToInt(vfNum[8]);
  n7 := StrToInt(vfNum[9]);
  n8 := StrToInt(vfNum[10]);
  n9 := StrToInt(vfNum[12]);
  n10 := StrToInt(vfNum[13]);
  n11 := StrToInt(vfNum[14]);
  n12 := StrToInt(vfNum[15]);
  d1 := n12 * 2 + n11 * 3 + n10 * 4 + n9 * 5 + n8 * 6 + n7 * 7 + n6 * 8 + n5 * 9 + n4 * 2 + n3 * 3 + n2 * 4 + n1 * 5;
  d1 := 11-(d1 mod 11);
  if d1 >= 10 then
    d1 := 0;
  d2 := d1 * 2 + n12 * 3 + n11 * 4 + n10 * 5 + n9 * 6 + n8 * 7 + n7 * 8 + n6 * 9 + n5 * 2 + n4 * 3 + n3 * 4 + n2 * 5 + n1 * 6;
  d2 := 11-(d2 mod 11);
  if d2 >= 10 then
    d2 := 0;
  calculado := IntToStr(d1)+IntToStr(d2);
  digitado := vfNum[17]+vfNum[18];
  if calculado = digitado then
    Cnpj := True
  else
    Cnpj := False;
end;

function Cpf(vfNum: String): Boolean;
Var
n1, n2, n3, n4, n5, n6, n7, n8, n9, d1, d2: integer;
digitado, calculado: String;
begin
  n1 := StrToInt(vfNum[1]);
  n2 := StrToInt(vfNum[2]);
  n3 := StrToInt(vfNum[3]);
  n4 := StrToInt(vfNum[5]);
  n5 := StrToInt(vfNum[6]);
  n6 := StrToInt(vfNum[7]);
  n7 := StrToInt(vfNum[9]);
  n8 := StrToInt(vfNum[10]);
  n9 := StrToInt(vfNum[11]);
  d1 := n9 * 2 + n8 * 3 + n7 * 4 + n6 * 5 + n5 * 6 + n4 * 7 + n3 * 8 + n2 * 9 + n1 * 10;
  d1 := 11-(d1 mod 11);
  if d1 >= 10 then
    d1 := 0;
  d2 := d1 * 2 + n9 * 3 + n8 * 4 + n7 * 5 + n6 * 6 + n5 * 7 + n4 * 8 + n3 * 9 + n2 * 10 + n1 * 11;
  d2 := 11-(d2 mod 11);
  if d2 >= 10 then
    d2:=0;
  calculado := IntToStr(d1) + IntToStr(d2);
  digitado := vfNum[13] + vfNum[14];
  if calculado = digitado then
    Cpf := True
  else
    Cpf := False;
end;

function VerificaCEP(vfCEP: String; vfUF: String): Boolean;
Var
  vCEPInt: Integer;
  vResult: Boolean;
Begin
  Try
    vResult := True;
    // limpa mascara e converte em inteiro
    vCEPInt := StrToInt(LimpaBarra(vfCEP));
    if vfUF = 'SC' then
    Begin
      if (vCEPInt >= 88000000) and (vCEPInt <= 99999000) then
        vResult := True
      else
        vResult := False;
    end
    else if vfUF = 'AC' then
    Begin
      if (vCEPInt >= 69900000) and (vCEPInt <= 69999000) then
        vResult := True
      else
        vResult := False;
    end
    else if vfUF = 'AL' then
    Begin
      if (vCEPInt >= 57000000) and (vCEPInt <= 57999000) then
        vResult := True
      else
        vResult := False;
    end
    else if vfUF = 'AM' then
    Begin
      if (vCEPInt >= 69400000) and (vCEPInt <= 69899000) then
        vResult := True
      else
        vResult := False;
    end
    else if vfUF = 'AP' then
    Begin
      if (vCEPInt >= 68900000) and (vCEPInt <= 68999000) then
        vResult := True
      else
        vResult := False;
    end
    else if vfUF = 'BA' then
    Begin
      if (vCEPInt >= 40000000) and (vCEPInt <= 48999000) then
        vResult := True
      else
        vResult := False;
    end
    else if vfUF = 'CE' then
    Begin
      if (vCEPInt >= 60000000) and (vCEPInt <= 63999000) then
        vResult := True
      else
        vResult := False;
    end
    else if vfUF = 'DF' then
    Begin
      if (vCEPInt >= 70000000) and (vCEPInt <= 73999000) then
        vResult := True
      else
        vResult := False;
    end
    else if vfUF = 'ES' then
    Begin
      if (vCEPInt >= 29000000) and (vCEPInt <= 29999000) then
        vResult := True
      else
        vResult := False;
    end
    else if vfUF = 'GO' then
    Begin
      if (vCEPInt >= 74000000) and (vCEPInt <= 76999000) then
        vResult := True
      else
        vResult := False;
    end
    else if vfUF = 'MA' then
    Begin
      if (vCEPInt >= 65000000) and (vCEPInt <= 65999000) then
        vResult := True
      else
        vResult := False;
    end
    else if vfUF = 'MG' then
    Begin
      if (vCEPInt >= 30000000) and (vCEPInt <= 39999000) then
        vResult := True
      else
        vResult := False;
    end
    else if vfUF = 'MS' then
    Begin
      if (vCEPInt >= 79000000) and (vCEPInt <= 79999000) then
        vResult := True
      else
        vResult := False;
    end
    else if vfUF = 'MT' then
    Begin
      if (vCEPInt >= 78000000) and (vCEPInt <= 78899000) then
        vResult := True
      else
        vResult := False;
    end
    else if vfUF = 'PA' then
    Begin
      if (vCEPInt >= 66000000) and (vCEPInt <= 68899000) then
        vResult := True
      else
        vResult := False;
    end
    else if vfUF = 'PB' then
    Begin
      if (vCEPInt >= 58000000) and (vCEPInt <= 58999000) then
        vResult := True
      else
        vResult := False;
    end
    else if vfUF = 'PE' then
    Begin
      if (vCEPInt >= 50000000) and (vCEPInt <= 56999000) then
        vResult := True
      else
        vResult := False;
    end
    else if vfUF = 'PI' then
    Begin
      if (vCEPInt >= 64000000) and (vCEPInt <= 64999000) then
        vResult := True
      else
        vResult := False;
    end
    else if vfUF = 'PR' then
    Begin
      if (vCEPInt >= 80000000) and (vCEPInt <= 87999000) then
        vResult := True
      else
        vResult := False;
    end
    else if vfUF = 'RJ' then
    Begin
      if (vCEPInt >= 20000000) and (vCEPInt <= 28999000) then
        vResult := True
      else
        vResult := False;
    end
    else if vfUF = 'RN' then
    Begin
      if (vCEPInt >= 59000000) and (vCEPInt <= 59999000) then
        vResult := True
      else
        vResult := False;
    end
    else if vfUF = 'RO' then
    Begin
      if (vCEPInt >= 78900000) and (vCEPInt <= 78999000) then
        vResult := True
      else
        vResult := False;
    end
    else if vfUF = 'RR' then
    Begin
      if (vCEPInt >= 69300000) and (vCEPInt <= 69399000) then
        vResult := True
      else
        vResult := False;
    end
    else if vfUF = 'RS' then
    Begin
      if (vCEPInt >= 90000000) and (vCEPInt <= 99999000) then
        vResult := True
      else
        vResult := False;
    end
    else if vfUF = 'SE' then
    Begin
      if (vCEPInt >= 49000000) and (vCEPInt <= 49999000) then
        vResult := True
      else
        vResult := False;
    end
    else if vfUF = 'SP' then
    Begin
      if (vCEPInt >= 01001000) and (vCEPInt <= 19999000) then
        vResult := True
      else
        vResult := False;
    end
    else if vfUF = 'TO' then
    Begin
      if (vCEPInt >= 77000000) and (vCEPInt <= 77999000) then
        vResult := True
      else
        vResult := False;
    end;
    Result := vResult;
  Except
    Result := True;
  end;
end;

function TestaInteiro(vfNumeroStr: String): boolean;
Var
vNumInt: integer;
begin
  try
    vNumInt := StrToInt(vfNumeroStr);
    result := true;
  except
    result := false;
  end;
end;

function TestaReal(vfNumeroStr: String): boolean;
Var
vNumReal: real;
begin
  try
    vNumReal := StrToFloat(LimpaReal(vfNumeroStr));
    result := true;
  except
    result := false;
  end;
end;

end.
