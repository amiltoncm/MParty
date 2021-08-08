unit uFuncoesSeguranca;

interface

uses WinApi.Windows, System.SysUtils;

function EncryptMsg(vfMsg1: String; vfEncryptNo: Integer): String;
function DecryptMsg(vfMsg1: String; vfDecryptNo: Integer): String;
function GetRandomPassword(vfSize: Integer; vfTipo: Integer): String;

implementation

function EncryptMsg(vfMsg1: String; vfEncryptNo: Integer): String;
Var
vResultStr: String;
vTemp: Char;
vI, vEncryptIndex: integer;
begin
  vResultStr := '';
  vTemp := ' ';
  For vI := 1 to Length(vfMsg1) do
  Begin
    For vEncryptIndex := 1 to vfEncryptNo do
    Begin
      vTemp := Succ(vfMsg1[vI]);
      vfMsg1[vI] := vTemp;
    end;
    vResultStr := vResultStr + vTemp;
  end;
  EncryptMsg := vResultStr;
end;

function DecryptMsg(vfMsg1: String; vfDecryptNo: Integer): String;
Var
vResultStr: String;
vTemp: Char;
vI, vDecryptIndex: integer;
begin
  vResultStr := '';
  vTemp := ' ';
  For vI := 1 to Length(vfMsg1) do
  Begin
    For vDecryptIndex := 1 to vfDecryptNo do
    Begin
      vTemp := Pred(vfMsg1[vI]);
      vfMsg1[vI] := vTemp;
    end;
    vResultStr := vResultStr + vTemp;
  end;
  DecryptMsg := vResultStr;
end;

function GetRandomPassword(vfSize: Integer; vfTipo: Integer): String;
Var
vI: Integer;
vChave: String;
const
ctStr0 = '23456789CDEFGHIJKLMNOPQRSTUVWXYZ';
ctStr1 = '1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
ctStr2 = '1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ';
ctStr3 = '1234567890abcdefghijklmnopqrstuvwxyz';
ctStr4 = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
ctStr5 = '1234567890';
ctStr6 = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
ctStr7 = 'abcdefghijklmnopqrstuvwxyz';
begin
  vChave := '';
  for vI := 1 to vfSize do
  begin
    case vfTipo of
      0 : vChave := vChave + ctStr0[Random(Length(ctStr0)) + 1];
      1 : vChave := vChave + ctStr1[Random(Length(ctStr1)) + 1];
      2 : vChave := vChave + ctStr2[Random(Length(ctStr2)) + 1];
      3 : vChave := vChave + ctStr3[Random(Length(ctStr3)) + 1];
      4 : vChave := vChave + ctStr4[Random(Length(ctStr4)) + 1];
      5 : vChave := vChave + ctStr5[Random(Length(ctStr5)) + 1];
      6 : vChave := vChave + ctStr6[Random(Length(ctStr6)) + 1];
      7 : vChave := vChave + ctStr7[Random(Length(ctStr7)) + 1];
    end;
  end;
  Result := vChave;
end;

end.
