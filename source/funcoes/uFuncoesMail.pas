unit uFuncoesMail;

interface

uses Windows, Classes, Forms, Mapi, SysUtils, Dialogs, IdSMTP,
  IdMessage, IdBaseComponent, IdComponent, IdIOHandler, IdIOHandlerSocket,
  IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase, IdAttachmentFile, Inifiles;

  procedure SendMailIndy(vfTo, vfSubject, vfMessage, vfAttachment: String; vfMsg: boolean);

implementation

uses uVarGlobal, uFuncoesSeguranca;

procedure SendMailIndy(vfTo, vfSubject, vfMessage, vfAttachment: String; vfMsg: boolean);
var
// objetos necessários para o funcionamento
vAuthSSL: TIdSSLIOHandlerSocketOpenSSL;
vIdSMTP: TIdSMTP;
vIdMessage: TIdMessage;
vIdAttachment: TIdAttachmentFile;
//Configuração do cliente de e-mail
vHost, vUserName, vPasswd, vName, vAdress: String;
vDoor: Integer;
vAuthType, vSSLMethod, vSSLMode, vUseTLS: Integer;
vControl: Tinifile;
begin
  try
    //Busca configuração do .ini
    vControl := Tinifile.create(vgArqIni);
    //Configuração de smtp
    vHost := vControl.ReadString('emails', 'Host', '');
    vUsername := vControl.ReadString('emails', 'UserName', '');
    vPasswd := vControl.ReadString('emails', 'Password', '');
    vName := vControl.ReadString('emails', 'NameFrom', '');
    vAdress := vControl.ReadString('emails', 'AdressFrom', '');
    vDoor := StrToInt(vControl.ReadString('emails', 'Door', ''));
    //Configuração do provedor
    vAuthType := vControl.ReadInteger('provedor', 'AuthType', 0);
    vSSLMethod := vControl.ReadInteger('provedor', 'SSLMethod', 0);
    vSSLMode := vControl.ReadInteger('provedor', 'SSLMode', 0);
    vUseTLS := vControl.ReadInteger('provedor', 'UseTLS', 0);
    vControl.Free;
    vIdSMTP := TIdSMTP.Create(nil);
    vIdMessage := TIdMessage.Create(nil);
    // Configuração do SMTP
    vIdSMTP.Host := vHost;
    vIdSMTP.Username := vUserName;
    vIdSMTP.Password := vPasswd;
    vIdSMTP.Port := vDoor;
    case vAuthType of
      0: vIdSMTP.AuthType := satNone;
      1: vIdSMTP.AuthType := satDefault;
      2: vIdSMTP.AuthType := satSASL;
    end;
    // Configuração do SSL
    vAuthSSL := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
    vIdSMTP.IOHandler := vAuthSSL;
    case vSSLMethod of
      0: vAuthSSL.SSLOptions.Method := sslvSSLv2;
      1: vAuthSSL.SSLOptions.Method := sslvSSLv23;
      2: vAuthSSL.SSLOptions.Method := sslvSSLv3;
      3: vAuthSSL.SSLOptions.Method := sslvTLSv1;
    end;
    case vSSLMode of
      0: vAuthSSL.SSLOptions.Mode := sslmUnassigned;
      1: vAuthSSL.SSLOptions.Mode := sslmClient;
      2: vAuthSSL.SSLOptions.Mode := sslmServer;
      3: vAuthSSL.SSLOptions.Mode := sslmBoth;
    end;
    case vUseTLS of
      0: vIdSMTP.UseTLS := utNoTLSSupport;
      1: vIdSMTP.UseTLS := utUseImplicitTLS;
      2: vIdSMTP.UseTLS := utUseRequireTLS;
      3: vIdSMTP.UseTLS := utUseExplicitTLS;
    end;
    // Tentativa de conexão e autenticação
    try
      vIdSMTP.Connect;
      vIdSMTP.Authenticate;
    except
      on E:Exception do
      begin
        MessageDlg('Erro na conexão e/ou autenticação: ' +
                    E.Message, mtWarning, [mbOK], 0);
        Exit;
      end;
    end;
    //Formato do e-mail
    vIdMessage.ContentType := 'text/html';
    vIdMessage.CharSet := 'ISO-8859-1';
    // Configuração da mensagem - emitente
    vIdMessage.From.Address := vAdress;
    vIdMessage.From.Name := vName;
    vIdMessage.ReplyTo.EMailAddresses := vIdMessage.From.Address;
    // Configuração da mensagem - destinatário
    vIdMessage.Recipients.EMailAddresses := vfTo;
    vIdMessage.Subject := vfSubject;
    vIdMessage.Body.Text := vfMessage;
    // Anexo da mensagem (opcional)
    if FileExists(vfAttachment) then
      vIdAttachment.Create(vIdMessage.MessageParts, vfAttachment);
    // Envio da mensagem
    try
      vIdSMTP.Send(vIdMessage);
      if vfMsg = True then
        MessageDlg('Mensagem enviada com sucesso.', mtInformation, [mbOK], 0);
    except
      On E:Exception do
        MessageDlg('Erro ao enviar a mensagem: ' +
                    E.Message, mtWarning, [mbOK], 0);
    end;
  finally
    // liberação dos objetos da memória
    vIdSMTP.Disconnect;
    FreeAndNil(vIdMessage);
    FreeAndNil(vAuthSSL);
    FreeAndNil(vIdSMTP);
  end;
end;

end.
