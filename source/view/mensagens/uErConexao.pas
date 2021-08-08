unit uErConexao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Menus, Inifiles;

type
  TfrmErConexao = class(TForm)
    btFechar: TBitBtn;
    memLogErro: TMemo;
    Image1: TImage;
    Image2: TImage;
    memMsgErro: TMemo;
    Label1: TLabel;
    lbMail: TLabel;
    BalloonHint1: TBalloonHint;
    sbCfgBase: TSpeedButton;
    procedure btFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure lbMailClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure sbCfgBaseClick(Sender: TObject);
  private

  ComponentePro: TComponent;
  procedure ProCode(Sender: TObject);

  public
    { Public declarations }
  end;

var
  frmErConexao: TfrmErConexao;

implementation

uses uFuncoesSistema, uFuncoesMail, uFuncoesLogs, uVarGlobal, uClassConexao,
  uCfgBase;

{$R *.DFM}

procedure TfrmErConexao.ProCode(Sender: TObject);
begin
  if Assigned(ComponentePro) then
    TEdit(ComponentePro).Color := clWindow; // cor ao sair
  if (ActiveControl is TCustomEdit) or
     (ActiveControl is TComboBox) or
     (ActiveControl is TMemo) then
  begin
    TEdit(ActiveControl).Color := clSkyBlue;  // cor ao focar
    ComponentePro := ActiveControl;
  end;
end;

procedure TfrmErConexao.sbCfgBaseClick(Sender: TObject);
begin
  frmCfgBase.ShowModal;
end;

procedure TfrmErConexao.btFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmErConexao.FormActivate(Sender: TObject);
begin
  Screen.OnActiveControlChange := ProCode;
end;

procedure TfrmErConexao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  GravaLog('Erro', 'Erro de conexão!');
  Application.Terminate;
end;

procedure TfrmErConexao.FormDestroy(Sender: TObject);
begin
  Screen.OnActiveControlChange := nil;
end;

procedure TfrmErConexao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
  if key = #27 then
    Close;
end;

procedure TfrmErConexao.lbMailClick(Sender: TObject);
Var
vLocErr, vLogError: String;
vEndSuporte, vHost, vUserName, vPasswd, vFrom, vName: String;
vControl: TInifile;
vDoor: Integer;
begin
  vControl := Tinifile.create(vgArqIni);
  vEndSuporte := vControl.ReadString('suporte', 'email', '');
  vControl.Free;
  //Pega pasta e mesnagem de erro e cria arquivo de log
  vLocErr := vgPath + '\Erro.log';
  vLogError := memLogErro.Text;
  GravaArqText(vLocErr, vLogError);
  SendMailIndy(vEndSuporte, 'Erro de conexão!', vLogError, vLocErr, true);
end;

end.
