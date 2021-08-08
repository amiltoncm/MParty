unit dataTestSGDB;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, SDEngine, Inifiles, uClassConexao;


type
  TdmTestSGDB = class(TDataModule)
    Conexao: TSDDatabase;
  private
    { Private declarations }
  public
    function TestaConexao(vfConexao: TConexao): boolean;
  end;

var
  dmTestSGDB: TdmTestSGDB;

implementation

uses uPrincipal, uErConexao, uFuncoesSistema, uFuncoesString,
  uFuncoesSeguranca, uVarGlobal;

{$R *.dfm}

function TdmTestSGDB.TestaConexao(vfConexao: TConexao): boolean;
begin
    Result := False;
    Conexao.Connected := false;
    Conexao.Params.Clear;
    Conexao.RemoteDatabase := vfConexao.Servidor + ':' + vfConexao.Base;
    Conexao.Params.Add('USER NAME=' + vfConexao.User);
    Conexao.Params.Add('PASSWORD=' + vfConexao.Password);
    if vfConexao.ServerType = 'FIREBIRD' then
      Conexao.Params.Add('SQL DIALECT=' + vfConexao.Dialect);
    Conexao.Connected := True;
  Try
    Result := True
  except
    Result := False;
  end;
end;

end.
