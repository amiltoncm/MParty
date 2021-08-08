unit uCfgBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormNormal, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Mask, Inifiles, SDEngine, uClassConexao;

type
  TfrmCfgBase = class(TfrmTmpFormNormal)
    Label1: TLabel;
    cbSGDB: TComboBox;
    Label2: TLabel;
    edServer: TEdit;
    Label3: TLabel;
    edDatabase: TEdit;
    sbDatabase: TSpeedButton;
    odDatabase: TOpenDialog;
    Label5: TLabel;
    edUserName: TEdit;
    mePassword: TMaskEdit;
    Label6: TLabel;
    cbSQLDialect: TComboBox;
    Label7: TLabel;
    btGravar: TBitBtn;
    procedure PostCfg(vfConexao: TConexao);
    procedure sbDatabaseClick(Sender: TObject);
    procedure cbSGDBExit(Sender: TObject);
    procedure btGravarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCfgBase: TfrmCfgBase;

implementation

{$R *.dfm}

uses uVarGlobal, uFuncoesSeguranca, dataTestSGDB, uErConexao;

procedure TfrmCfgBase.PostCfg(vfConexao: TConexao);
Var
vControl: TInifile;
begin
  vfConexao.Password := EncryptMsg(vfConexao.Password, Length(vfConexao.Password));
  vControl := TIniFile.Create(vgArqIni);
  vControl.WriteString('Base', 'ServerType', vfConexao.ServerType);
  vControl.WriteString('Base', 'Servidor', vfConexao.Servidor);
  vControl.WriteString('Base', 'Base', vfConexao.Base);
  vControl.WriteString('Base', 'User', vfConexao.User);
  vControl.WriteString('Base', 'Password', vfConexao.Password);
  if vfConexao.ServerType = 'FIREBIRD' then
    vControl.WriteString('Firebird', 'Dialect', vfConexao.Dialect);
  //if vfConexao.ServerType = 'POSTGRESQL' then
  vControl.Free;
end;

procedure TfrmCfgBase.btGravarClick(Sender: TObject);
Var
vConexao: TConexao;
vMsg: String;
begin
  //Cria obj de conexão
  vConexao := TConexao.Create;
  if cbSGDB.ItemIndex = 0 then
    vConexao.ServerType := 'FIREBIRD';
  if cbSGDB.ItemIndex = 1 then
    vConexao.ServerType := 'POSTGRESQL';
  vConexao.Servidor := edServer.Text;
  vConexao.Base := edDatabase.Text;
  vConexao.User := edUserName.Text;
  vConexao.Password := mePassword.Text;
  vConexao.Dialect := IntToStr(cbSQLDialect.ItemIndex + 1);
  if dmTestSGDB.TestaConexao(vConexao) = true then
  begin
    PostCfg(vConexao);
    MessageDlg('Configuração efetuada com sucesso!' + #13 + #13 + 'O sistema deve ser reiniciado!', mtInformation, [mbok], 0);
    vConexao.Free;
    Close;
  end
  else
  begin
    MessageDlg('Problemas na configuração!', mtWarning, [mbok], 0);
    vConexao.Free;
  end;
end;

procedure TfrmCfgBase.cbSGDBExit(Sender: TObject);
begin
  if cbSGDB.ItemIndex = 0 then
  begin
    sbDatabase.Enabled := True;
    cbSQLDialect.Enabled := True;
  end
  else
  begin
    sbDatabase.Enabled := False;
    cbSQLDialect.Enabled := False;
  end;
end;

procedure TfrmCfgBase.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if frmErConexao <> nil then
    frmErConexao.Close;
end;

procedure TfrmCfgBase.FormCreate(Sender: TObject);
Var
vControl: TInifile;
vServerType: String;
begin
  inherited;
  //Verifica se existe o arquivo ini
  if FileExists(vgArqIni) then
  begin
    vControl := Tinifile.create(vgArqIni);
    vServerType := vControl.readstring('Base', 'SERVERTYPE','');
    edServer.Text :=  vControl.readstring('Base', 'Servidor','');
    edDatabase.Text :=  vControl.readstring('Base', 'Base','');
    edUserName.Text :=  vControl.readstring('Base', 'User','');
    mePassword.Text :=  vControl.readstring('Base', 'Password','');
    if vServerType = 'FIREBIRD' then
    begin
      cbSGDB.ItemIndex := 0;
      cbSQLDialect.ItemIndex := 2;
      cbSQLDialect.Enabled := True;
      sbDatabase.Enabled := True;
    end;
    if vServerType = 'POSTGRESQL' then
    begin
      cbSGDB.ItemIndex := 1;
      cbSQLDialect.Enabled := False;
      sbDatabase.Enabled := False;
    end;
    //Descriptografa senha
    mePassword.Text := DecryptMsg(mePassword.Text, Length(mePassword.Text));
  end
  else
  begin
    cbSGDB.ItemIndex := 0;
    edServer.Text := 'localhost';
    edDatabase.Clear;
    edUserName.Text := 'SYSDBA';
    mePassword.Clear;
    cbSQLDialect.ItemIndex := 2;
  end;
  vControl.Free;
end;

procedure TfrmCfgBase.sbDatabaseClick(Sender: TObject);
begin
  if odDatabase.Execute then
    edDatabase.Text := odDatabase.FileName;
end;

end.
