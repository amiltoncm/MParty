unit uClassConexao;

interface

Type

  TConexao = class

  private

    FServerType: String;
    FServidor: String;
    FBase: String;
    FDialect: String;
    FPassword: String;
    FUser: String;

    procedure SetServerType(const Value: String);
    procedure SetDialect(const Value: String);
    procedure SetBase(const Value: String);
    procedure SetPassword(const Value: String);
    procedure SetServidor(const Value: String);
    procedure SetUser(const Value: String);

  public

    property ServerType: String read FServerType write SetServerType;
    property Base: String read FBase write SetBase;
    property User: String read FUser write SetUser;
    property Password: String read FPassword write SetPassword;
    property Servidor: String read FServidor write SetServidor;
    property Dialect: String read FDialect write SetDialect;

  end;

implementation

{ TConexao }

procedure TConexao.SetDialect(const Value: String);
begin
  FDialect := Value;
end;

procedure TConexao.SetBase(const Value: String);
begin
  FBase := Value;
end;

procedure TConexao.SetPassword(const Value: String);
begin
  FPassword := Value;
end;

procedure TConexao.SetServerType(const Value: String);
begin
  FServerType := Value;
end;

procedure TConexao.SetServidor(const Value: String);
begin
  FServidor := Value;
end;

procedure TConexao.SetUser(const Value: String);
begin
  FUser := Value;
end;

end.
