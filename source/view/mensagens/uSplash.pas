unit uSplash;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Inifiles, Registry, ComCtrls, Gauges;

type
  TfrmSplash = class(TForm)
    Image1: TImage;
    lbProjeto: TLabel;
    lbHost: TLabel;
    lbVersion: TLabel;
    Label4: TLabel;
    lbVersao: TLabel;
    lbServidor: TLabel;
    lbRegistrado: TLabel;
    lbRegister: TLabel;
    lbNSerie: TLabel;
    lbSerial: TLabel;
    lbBDados: TLabel;
    lbSGDB: TLabel;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSplash: TfrmSplash;

implementation

uses uFuncoesSistema, uFuncoesSeguranca;

{$R *.DFM}

procedure TfrmSplash.FormActivate(Sender: TObject);
Var
vPath: String;
vControl: Tinifile;
vSistema: string;
vBDados, vVersao, vRegistro, vBanco, vNSerie, vHost: String;
vFig : Thandle;
vArqDll: String;
begin
  vArqDll := RetornaExecutavelSemExtensao + '.dll';
  vFig := loadlibrary(PChar(vArqDll));
  if vFig <> 0 then
  Begin
    Image1.Picture.Bitmap.LoadFromResourceName(vFig, 'Splash');
  end
  else
  Begin
    Messagedlg('Arquivo ' + RetornaExecutavelSemExtensao + '.dll não encontrado!',mterror,[mbok],0);
    Application.Terminate;
  end;
  FreeLibrary(vFig);
  vPath := DiretorioSemBarra(ExtractFileDir(Application.ExeName));
  //função busca versão
  vVersao := VersaoSistema(0);
  //pega dados no arquivo INI
  vControl := Tinifile.create(vPath+'\' + RetornaExecutavelSemExtensao + '.ini');
  vSistema := vControl.readstring('Splash', 'Sistema','');
  vRegistro := vControl.readstring('Splash', 'Registro','');
  vNSerie := vControl.readstring('Splash', 'Serial','');
  vRegistro := DecryptMsg(vRegistro, Length(vRegistro));
  vBDados := vControl.readstring('Base', 'ServerType','');
  if vBDados = 'INTERBASE' then
  begin
    vBanco := vControl.readstring('Interbase','Versao','');
    vHost := vControl.readstring('Interbase','Servidor','');
  end;
  if vBDados = 'POSTGRESQL' then
  Begin
    vBanco := vControl.readstring('Postgre','Versao','');
    vHost := vControl.readstring('Postgre','Servidor','');
  end;
  if vBDados = 'FIREBIRD' then
  begin
    vBanco := vControl.readstring('FIREBIRD','Versao','');
    vHost := vControl.readstring('FIREBIRD','Servidor','');
  end;
  if vBDados = 'MYSQL' then
  begin
    vBanco := vControl.readstring('MYSQL','Versao','');
    vHost := vControl.readstring('MYSQL','Servidor','');
  end;
  vBanco := vBdados + ' Vs. ' + vBanco;
  vControl.Free;
  //pega dados. no registro do windows
  lbProjeto.Caption := vSistema;
  lbHost.Caption := vHost;
  lbVersion.Caption := vVersao;
  lbSerial.Caption := vNSerie;
  lbSGDB.Caption := vBanco;
  if vRegistro <> '' then
    lbRegister.Caption := vRegistro
  else
    lbRegister.Caption := 'SOFTWARE NÃO REGISTRADO';
end;

end.
