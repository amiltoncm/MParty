unit uDaoCaixatot;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB;

procedure EdtCaixatot;
procedure PostCaixatot;
procedure ListarCaixatot(vfOrdem: String; vfLimite: String);
procedure FiltrarCaixaTot(vfCodLocal: String; vfCodCaixa: String; vfOrdem: String; vfLimite: String);
procedure SaldoCaixaTot(vfCodFesta: String; vfCodLocal: String; vfCodCaixa: String; vfDataCaixa: String);
procedure VerifCaixas(vfCodLocal: String; vfCodCaixa: String; vfOrdem: String; vfLimite: String; vfDataSel: String);
procedure OpenCaixaTot(vfCodCaixa: String; vfCodLocais: String; vfTrocoInicial: String; vfDataCaixa: TDate);
function TestCaixaOpen(vfCaixa: String; vfLocal: String): Boolean;
function TestCaixaVal(vfCaixa: String; vfLocal: String): Boolean;
procedure AtualizaSaldo(vfCaixa: String; vfLocal: String);
procedure EfetuarRetirada(vfCaixa: String; vfLocal: String; vfValor: String);
procedure AddTroco(vfCaixa: String; vfLocal: String; vfValor: String);
procedure EnviarTroco(vfCaixa: String; vfLocal: String; vfValor: String);
function VerifCaixaOpen: boolean;
function LoginCaixaTot(vfCodCaixa: String): boolean;
procedure AddCaixa(vfValor: Real);

const
ctCampos = 'T.FES_CODIGO, F.FES_ANO, T.LOC_CODIGO, L.LOC_DESCRICAO, T.CAI_CODIGO, ' +
           'C.CAI_NOME, T.CXT_DATA, T.CXT_TROCOINIC, T.CXT_TOTRETIR, T.CXT_VLRTROCOS, T.CXT_TOTALVEND, ' +
           'T.CXT_VLRTOTAL, T.CXT_VLRFECHAMENTO, T.CXT_VLRDIFERENCA, T.CXT_VLRLUCRO, T.CXT_STATUS';
ctTabelas = 'CAIXATOT T, FESTAS F, LOCAIS L, CAIXAS C';

implementation

uses dataCadastros, uVarGlobal, uFuncoesDatas, uDaoMovHist, uFuncoesFormatacao;

{--- Coloca a tabela em edit inserindo algum valor ----------------------------}

procedure EdtCaixatot;
begin
  dmCadastros.qyCaixaTot.Edit;
end;

{--- Dá um post na tabela -----------------------------------------------------}

procedure PostCaixatot;
begin
  try
    dmCadastros.qyCaixatot.Post;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao gravar Alteração / Inserção!' + #13 +
          E.Message,mtError,[mbOk],0);
      dmCadastros.qyCaixatot.Refresh;
    end;
  end;
end;

{--- Lista todos os registros da tabela ---------------------------------------}

procedure ListarCaixatot(vfOrdem: String; vfLimite: String);
begin
  dmCadastros.qyCaixaTot.Close;
  dmCadastros.qyCaixaTot.SQL.Clear;
  dmCadastros.qyCaixaTot.SQL.Add('SELECT '+ ctCampos + ' FROM ' + ctTabelas);
  dmCadastros.qyCaixaTot.SQL.Add(' WHERE T.FES_CODIGO = F.FES_CODIGO ');
  dmCadastros.qyCaixaTot.SQL.Add('AND T.LOC_CODIGO = L.LOC_CODIGO ');
  dmCadastros.qyCaixaTot.SQL.Add('AND T.CAI_CODIGO = C.CAI_CODIGO');
  if vfOrdem <> '0' then
    dmCadastros.qyCaixaTot.SQL.Add(' ORDER BY ' + vfOrdem);
  if vfLimite <> '0' then
    dmCadastros.qyCaixaTot.SQL.Add(' LIMIT ' + vfLimite);
  dmCadastros.qyCaixaTot.Open;
end;

{--- Filtra registros da tabela -----------------------------------------------}

procedure FiltrarCaixaTot(vfCodLocal: String; vfCodCaixa: String; vfOrdem: String; vfLimite: String);
begin
  dmCadastros.qyCaixaTot.Close;
  dmCadastros.qyCaixaTot.SQL.Clear;
  dmCadastros.qyCaixaTot.SQL.Add('SELECT '+ ctCampos + ' FROM ' + ctTabelas);
  dmCadastros.qyCaixaTot.SQL.Add(' WHERE T.FES_CODIGO = F.FES_CODIGO ');
  dmCadastros.qyCaixaTot.SQL.Add('AND T.LOC_CODIGO = L.LOC_CODIGO ');
  dmCadastros.qyCaixaTot.SQL.Add('AND T.CAI_CODIGO = C.CAI_CODIGO ');
  dmCadastros.qyCaixaTot.SQL.Add('AND T.FES_CODIGO  = ');
  dmCadastros.qyCaixaTot.SQL.Add(vgFestaAberta);
  dmCadastros.qyCaixatot.SQL.Add(' AND T.LOC_CODIGO = ');
  dmCadastros.qyCaixaTot.SQL.Add(vfCodLocal);
  dmCadastros.qyCaixatot.SQL.Add(' AND T.CAI_CODIGO = ');
  dmCadastros.qyCaixaTot.SQL.Add(vfCodCaixa);
  dmCadastros.qyCaixatot.SQL.Add(' AND T.CXT_DATA = ' + QuotedStr(FormatDateTime('MM/dd/yyyy', (StrToDate(vgDataCaixa)))));
  if vfOrdem <> '0' then
    dmCadastros.qyCaixaTot.SQL.Add(' ORDER BY ' + vfOrdem);
  if vfLimite <> '0' then
    dmCadastros.qyCaixaTot.SQL.Add(' LIMIT ' + vfLimite);
  dmCadastros.qyCaixaTot.Open;
end;

procedure SaldoCaixaTot(vfCodFesta: String; vfCodLocal: String; vfCodCaixa: String; vfDataCaixa: String);
begin
  dmCadastros.qyCaixaTot.Close;
  dmCadastros.qyCaixaTot.SQL.Clear;
  dmCadastros.qyCaixaTot.SQL.Add('SELECT '+ ctCampos + ' FROM ' + ctTabelas);
  dmCadastros.qyCaixaTot.SQL.Add(' WHERE T.FES_CODIGO = F.FES_CODIGO ');
  dmCadastros.qyCaixaTot.SQL.Add('AND T.LOC_CODIGO = L.LOC_CODIGO ');
  dmCadastros.qyCaixaTot.SQL.Add('AND T.CAI_CODIGO = C.CAI_CODIGO ');
  dmCadastros.qyCaixaTot.SQL.Add('AND T.FES_CODIGO  = ');
  dmCadastros.qyCaixaTot.SQL.Add(vfCodFesta);
  dmCadastros.qyCaixatot.SQL.Add(' AND T.LOC_CODIGO = ');
  dmCadastros.qyCaixaTot.SQL.Add(vfCodLocal);
  dmCadastros.qyCaixatot.SQL.Add(' AND T.CAI_CODIGO = ');
  dmCadastros.qyCaixaTot.SQL.Add(vfCodCaixa);
  dmCadastros.qyCaixatot.SQL.Add(' AND T.CXT_DATA = ' + QuotedStr(FormatDateTime('MM/dd/yyyy', (StrToDate(vfDataCaixa)))));
  dmCadastros.qyCaixaTot.Open;
end;

procedure VerifCaixas(vfCodLocal: String; vfCodCaixa: String; vfOrdem: String; vfLimite: String; vfDataSel: String);
begin
  dmCadastros.qyCaixaTot.Close;
  dmCadastros.qyCaixaTot.SQL.Clear;
  dmCadastros.qyCaixaTot.SQL.Add('SELECT '+ ctCampos + ' FROM ' + ctTabelas);
  dmCadastros.qyCaixaTot.SQL.Add(' WHERE T.FES_CODIGO = F.FES_CODIGO ');
  dmCadastros.qyCaixaTot.SQL.Add('AND T.LOC_CODIGO = L.LOC_CODIGO ');
  dmCadastros.qyCaixaTot.SQL.Add('AND T.CAI_CODIGO = C.CAI_CODIGO ');
  dmCadastros.qyCaixaTot.SQL.Add('AND T.FES_CODIGO  = ');
  dmCadastros.qyCaixaTot.SQL.Add(vgFestaAberta);
  dmCadastros.qyCaixatot.SQL.Add(' AND T.LOC_CODIGO = ');
  dmCadastros.qyCaixaTot.SQL.Add(vfCodLocal);
  dmCadastros.qyCaixatot.SQL.Add(' AND T.CAI_CODIGO = ');
  dmCadastros.qyCaixaTot.SQL.Add(vfCodCaixa);
  if vfDataSel <> '0' then
    dmCadastros.qyCaixatot.SQL.Add(' AND T.CXT_DATA = ' + QuotedStr(FormatDateTime('MM/dd/yyyy', (StrToDate(vgDataCaixa)))));
  if vfOrdem <> '0' then
    dmCadastros.qyCaixaTot.SQL.Add(' ORDER BY ' + vfOrdem);
  if vfLimite <> '0' then
    dmCadastros.qyCaixaTot.SQL.Add(' LIMIT ' + vfLimite);
  dmCadastros.qyCaixaTot.Open;
end;

procedure OpenCaixaTot(vfCodCaixa: String; vfCodLocais: String; vfTrocoInicial: String; vfDataCaixa: TDate);
begin
  try
    dmCadastros.qyCaixaTot.Active := True;
    dmCadastros.qyCaixaTot.Insert;
    dmCadastros.qyCaixaTotFES_CODIGO.Text := vgFestaAberta;
    dmCadastros.qyCaixaTotLOC_CODIGO.Text := vfCodLocais;
    dmCadastros.qyCaixaTotCAI_CODIGO.Text := vfCodCaixa;
    dmCadastros.qyCaixaTotCXT_DATA.Text := FormatDateTime('dd/MM/yyyy', vfDataCaixa);
    dmCadastros.qyCaixaTotCXT_TROCOINIC.Text := LimpaReal(vfTrocoInicial);
    dmCadastros.qyCaixaTotCXT_TOTRETIR.Value := 0;
    dmCadastros.qyCaixaTotCXT_VLRTROCOS.Value := 0;
    dmCadastros.qyCaixaTotCXT_VLRFECHAMENTO.Text := LimpaReal(vfTrocoInicial);
    dmCadastros.qyCaixaTotCXT_VLRDIFERENCA.Value := 0;
    dmCadastros.qyCaixaTotCXT_VLRLUCRO.Value := 0;
    dmCadastros.qyCaixaTotCXT_TOTALVEND.Value := 0;
    dmCadastros.qyCaixaTotCXT_VLRTOTAL.Text := LimpaReal(vfTrocoInicial);
    dmCadastros.qyCaixaTotCXT_STATUS.Text := 'A';
    dmCadastros.qyCaixaTot.Post;
  except
    on E: Exception do
    Begin
      MessageDlg('Erro ao gravar Alteração / Inserção!' + #13#10 +
          E.Message,mtError,[mbOk],0);
      dmCadastros.qyCaixaTot.Refresh;
    end;
  end;
end;

function TestCaixaOpen(vfCaixa: String; vfLocal: String): Boolean;
begin
  dmCadastros.QTemp.Close;
  dmCadastros.QTemp.SQL.Clear;
  dmCadastros.QTemp.SQL.Add('SELECT CXT_STATUS FROM CAIXATOT WHERE FES_CODIGO = ');
  dmCadastros.QTemp.SQL.Add(vgFestaAberta);
  dmCadastros.QTemp.SQL.Add(' AND CAI_CODIGO = ');
  dmCadastros.QTemp.SQL.Add(vfCaixa);
  dmCadastros.QTemp.SQL.Add(' AND LOC_CODIGO = ');
  dmCadastros.QTemp.SQL.Add(vfLocal);
  dmCadastros.QTemp.SQL.Add(' AND CXT_DATA = ' + QuotedStr(FormatDateTime('MM/dd/yyyy', vgDataCx)));
  dmCadastros.QTemp.Open;
  if dmCadastros.QTemp.Fields[0].IsNull then
    Result := false
  else
  begin
    if dmCadastros.QTemp.Fields[0].Text = 'A' then
      MessageDlg('O caixa selecionado já está aberto!', mtWarning, [mbok], 0);
    if dmCadastros.QTemp.Fields[0].Text = 'F' then
      MessageDlg('O caixa selecionado já está fechado!', mtWarning, [mbok], 0);
    Result := true;
  end;
end;

function TestCaixaVal(vfCaixa: String; vfLocal: String): Boolean;
begin
  dmCadastros.QTemp.Close;
  dmCadastros.QTemp.SQL.Clear;
  dmCadastros.QTemp.SQL.Add('SELECT CXT_STATUS FROM CAIXATOT WHERE FES_CODIGO = ');
  dmCadastros.QTemp.SQL.Add(vgFestaAberta);
  dmCadastros.QTemp.SQL.Add(' AND CAI_CODIGO = ');
  dmCadastros.QTemp.SQL.Add(vfCaixa);
  dmCadastros.QTemp.SQL.Add(' AND LOC_CODIGO = ');
  dmCadastros.QTemp.SQL.Add(vfLocal);
  dmCadastros.QTemp.SQL.Add(' AND CXT_DATA = ' + QuotedStr(FormatDateTime('MM/dd/yyyy', StrToDate(vgDataCaixa))));
  dmCadastros.QTemp.Open;
  if dmCadastros.QTemp.Fields[0].IsNull then
    Result := false
  else
    Result := true;
end;

procedure AtualizaSaldo(vfCaixa: String; vfLocal: String);
Var
vTrocoInic, vTotRet, vTotTroc, vTotVend: real;
vVlrTot, vVlrFec, vVlrDif, vVlrLucro: real;
begin
  //Zera variáveis
  vTrocoInic := 0; //Pega valor da tabela - Ok
  vTotRet := 0;    //Pega valor da tabela - Ok
  vTotTroc := 0;   //Pega valor da tabela - Ok
  vTotVend := 0;   //Pega do cálculo abaixo - Ok
  vVlrTot := 0;    //Calculo = vTrocoInic - vTotRet + vTotTroc + vTotVend
  vVlrFec := 0;    //Pega valor da tabela - Ok
  vVlrDif := 0;    //Calculo = vVlrTot - vVlrFec
  vVlrLucro := 0;  //Calculo = vTotVend - vTrocInic
  FiltrarCaixaTot(vfLocal, vfCaixa, '0', '0');
  if not(dmCadastros.qyCaixaTotCAI_CODIGO.IsNull) then
  begin
    dmCadastros.qyCaixaTot.Edit;
    //Atribui valor as variáveis
    vTrocoInic := dmCadastros.qyCaixaTotCXT_TROCOINIC.Value;
    vTotRet := dmCadastros.qyCaixaTotCXT_TOTRETIR.Value;
    vTotTroc := dmCadastros.qyCaixaTotCXT_VLRTROCOS.Value;
    vTotVend := dmCadastros.qyCaixaTotCXT_TOTALVEND.Value;
    //Atualiza Valor total
    vVlrTot := vTrocoInic - vTotRet + vTotTroc + vTotVend;
    dmCadastros.qyCaixaTotCXT_VLRTOTAL.Value := vVlrTot;
    vVlrFec := vVlrTot;
    dmCadastros.qyCaixaTotCXT_VLRFECHAMENTO.Value := vVlrFec;
    //Atualiza diferenca
    vVlrDif := vVlrTot - vVlrFec;
    dmCadastros.qyCaixaTotCXT_VLRDIFERENCA.Value := vVlrDif;
    //Atualiza lucro
    vVlrLucro := vTotVend - vTrocoInic;
    dmCadastros.qyCaixaTotCXT_VLRLUCRO.Value := vVlrLucro;
    try
      dmCadastros.qyCaixaTot.Post;
      dmCadastros.qyCaixaTot.Refresh;
    except
      on E: Exception do
      begin
        MessageDlg('Erro ao gravar Alteração / Inserção!' + #13#10 +
                   E.Message,mtError,[mbOk],0);
        dmCadastros.qyCaixaTot.Refresh;
      end;
    end;
  end;
end;

procedure EfetuarRetirada(vfCaixa: String; vfLocal: String; vfValor: String);
begin
  try
    FiltrarCaixaTot(vfLocal, vfCaixa, '0', '0');
    dmCadastros.qyCaixaTot.Edit;
    dmCadastros.qyCaixaTotCXT_TOTRETIR.Value := dmCadastros.qyCaixaTotCXT_TOTRETIR.Value +
                                                (StrToFloat(LimpaReal(vfValor)));
    dmCadastros.qyCaixaTot.Post;
    AtualizaSaldo(vfCaixa, vfLocal);
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao gravar Alteração / Inserção!' + #13#10 +
                  E.Message,mtError,[mbOk],0);
      dmCadastros.qyCaixaTot.Refresh;
    end;
  end;
end;

procedure AddTroco(vfCaixa: String; vfLocal: String; vfValor: String);
begin
  try
    FiltrarCaixaTot(vfLocal, vfCaixa, '0', '0');
    dmCadastros.qyCaixaTot.Edit;
    dmCadastros.qyCaixaTotCXT_VLRTROCOS.Value := dmCadastros.qyCaixaTotCXT_VLRTROCOS.Value +
                                                (StrToFloat(LimpaReal(vfValor)));
    dmCadastros.qyCaixaTot.Post;
    AtualizaSaldo(vfCaixa, vfLocal);
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao gravar Alteração / Inserção!' + #13#10 +
                  E.Message,mtError,[mbOk],0);
      dmCadastros.qyCaixaTot.Refresh;
    end;
  end;
end;

procedure EnviarTroco(vfCaixa: String; vfLocal: String; vfValor: String);
begin
  try
    FiltrarCaixaTot(vfLocal, vfCaixa, '0', '0');
    dmCadastros.qyCaixaTot.Edit;
    dmCadastros.qyCaixaTotCXT_VLRTROCOS.Value := dmCadastros.qyCaixaTotCXT_VLRTROCOS.Value +
                                                (StrToFloat(LimpaReal(vfValor)));
    dmCadastros.qyCaixaTot.Post;
    //InsMovHist(vfLocal, vfCaixa, '2', '1', 'TROCO: R$ ' + FormatFloat('#,###,###,##0.00',(StrToFloat(LimpaReal(vfValor)))));
    AtualizaSaldo(vfCaixa, vfLocal);
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao gravar Alteração / Inserção!' + #13#10 +
                  E.Message,mtError,[mbOk],0);
      dmCadastros.qyCaixaTot.Refresh;
    end;
  end;
end;

function VerifCaixaOpen: boolean;
begin
  dmCadastros.QTemp.Close;
  dmCadastros.QTemp.SQL.Clear;
  dmCadastros.QTemp.SQL.Add('SELECT * FROM CAIXATOT WHERE CXT_STATUS = ');
  dmCadastros.QTemp.SQL.Add(QuotedStr('A'));
  dmCadastros.QTemp.Open;
  if dmCadastros.QTemp.Fields[0].IsNull then
    Result := false
  else
    Result := true;
end;

function LoginCaixaTot(vfCodCaixa: String): boolean;
begin
  dmCadastros.qyCaixaTot.Close;
  dmCadastros.qyCaixaTot.SQL.Clear;
  dmCadastros.qyCaixaTot.SQL.Add('SELECT '+ ctCampos + ' FROM ' + ctTabelas);
  dmCadastros.qyCaixaTot.SQL.Add(' WHERE T.FES_CODIGO = F.FES_CODIGO ');
  dmCadastros.qyCaixaTot.SQL.Add('AND T.LOC_CODIGO = L.LOC_CODIGO ');
  dmCadastros.qyCaixaTot.SQL.Add('AND T.CAI_CODIGO = C.CAI_CODIGO ');
  dmCadastros.qyCaixatot.SQL.Add('AND T.CAI_CODIGO = ');
  dmCadastros.qyCaixaTot.SQL.Add(vfCodCaixa);
  dmCadastros.qyCaixatot.SQL.Add(' AND T.CXT_STATUS = ' + QuotedStr('A'));
  dmCadastros.qyCaixaTot.Open;
  if dmCadastros.qyCaixaTotCAI_CODIGO.IsNull then
    Result := False
  else
  begin
    vgFestaAberta := dmCadastros.qyCaixaTotFES_CODIGO.Text;
    vgCodLocal := dmCadastros.qyCaixaTotLOC_CODIGO.Text;
    vgDataCaixa := FormatDateTime('dd/MM/yyyy', dmCadastros.qyCaixaTotCXT_DATA.Value);
    Result := True;
  end;
end;

procedure AddCaixa(vfValor: Real);
Var
vAnt, vTotal: Real;
begin
  vAnt := dmCadastros.qyCaixaTotCXT_TOTALVEND.Value;
  vTotal := vAnt + vfValor;
  dmCadastros.qyCaixaTotCXT_TOTALVEND.Value := vTotal;
end;

end.
