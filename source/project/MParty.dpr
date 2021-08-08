program MParty;

uses
  Forms,
  uPrincipal in '..\view\estrutura\uPrincipal.pas' {frmPrincipal},
  uTmpForm in '..\templates\uTmpForm.pas' {frmTmpForm},
  uTmpFormNormal in '..\Templates\uTmpFormNormal.pas' {frmTmpFormNormal},
  uTmpFormNormalMov in '..\Templates\uTmpFormNormalMov.pas' {frmTmpFormNormalMov},
  uTmpFormMDI in '..\templates\uTmpFormMDI.pas' {frmTmpFormMDI},
  Vcl.Themes,
  Vcl.Styles,
  uVarGlobal in '..\Var\uVarGlobal.pas',
  uFuncoesDB in '..\Funcoes\uFuncoesDB.pas',
  uFuncoesFormatacao in '..\Funcoes\uFuncoesFormatacao.pas',
  uFuncoesMail in '..\Funcoes\uFuncoesMail.pas',
  uFuncoesMath in '..\Funcoes\uFuncoesMath.pas',
  uFuncoesSeguranca in '..\Funcoes\uFuncoesSeguranca.pas',
  uFuncoesSistema in '..\Funcoes\uFuncoesSistema.pas',
  uFuncoesString in '..\Funcoes\uFuncoesString.pas',
  uFuncoesValidacao in '..\Funcoes\uFuncoesValidacao.pas',
  uFuncoesLogs in '..\funcoes\uFuncoesLogs.pas',
  uDaoUsuarios in '..\Dao\uDaoUsuarios.pas',
  dataTmpConexao in '..\Dados\dataTmpConexao.pas' {dmTmpConexao: TDataModule},
  dataCadastros in '..\dados\dataCadastros.pas' {dmCadastros: TDataModule},
  uErConexao in '..\view\mensagens\uErConexao.pas' {frmErConexao},
  uSenha in '..\view\estrutura\uSenha.pas' {frmSenha},
  uSobre in '..\view\mensagens\uSobre.pas' {frmSobre},
  uSplash in '..\view\mensagens\uSplash.pas' {frmSplash},
  uSql in '..\view\uteis\uSql.pas' {frmSQL},
  dataGestao in '..\Dados\dataGestao.pas' {dmGestao: TDataModule},
  uTecladoVirtual in '..\view\uteis\uTecladoVirtual.pas' {frmTecladoVirtual},
  dataConfig in '..\Dados\dataConfig.pas' {dmConfig: TDataModule},
  dataConsultas in '..\Dados\dataConsultas.pas' {dmConsultas: TDataModule},
  uTmpCadastro in '..\Templates\uTmpCadastro.pas' {frmTmpCadastro},
  uTmpCadastroComp in '..\Templates\uTmpCadastroComp.pas' {frmTmpCadastroComp},
  uTmpConsultaMDI in '..\Templates\uTmpConsultaMDI.pas' {frmTmpConsultaMDI},
  uTmpConsultaNormal in '..\Templates\uTmpConsultaNormal.pas' {frmTmpConsultaNormal},
  uTmpProcura in '..\Templates\uTmpProcura.pas' {frmTmpProcura},
  uTmpRelFormNormal in '..\Templates\uTmpRelFormNormal.pas' {frmTmpRelFormNormal},
  uTmpRelFormNormalDefault in '..\Templates\uTmpRelFormNormalDefault.pas' {frmTmpRelFormNormalDefault},
  dataLookups in '..\dados\dataLookups.pas' {dmLookups: TDataModule},
  uCadUsuarios in '..\view\cadastros\uCadUsuarios.pas' {frmCadUsuarios},
  uDaoCaixas in '..\dao\uDaoCaixas.pas',
  uDaoFestas in '..\dao\uDaoFestas.pas',
  uDaoCaixatot in '..\dao\uDaoCaixatot.pas',
  uDaoLocais in '..\dao\uDaoLocais.pas',
  uDaoPrecos in '..\dao\uDaoPrecos.pas',
  uNovaFesta in '..\view\cadastros\uNovaFesta.pas' {frmNovaFesta},
  uFuncoesDatas in '..\funcoes\uFuncoesDatas.pas',
  uFesta in '..\view\estrutura\uFesta.pas' {frmFesta},
  uTabPrecos in '..\view\cadastros\uTabPrecos.pas' {frmTabPrecos},
  uCadCaixas in '..\view\cadastros\uCadCaixas.pas' {frmCadCaixas},
  uCadLocais in '..\view\cadastros\uCadLocais.pas' {frmCadLocais},
  uNovoCaixa in '..\view\movimentacoes\uNovoCaixa.pas' {frmNovoCaixa},
  uDaoMovHist in '..\dao\uDaoMovHist.pas',
  uMovCaixa in '..\view\movimentacoes\uMovCaixa.pas' {frmMovCaixa},
  uFechamento in '..\view\estrutura\uFechamento.pas' {frmFechamento},
  uConsCaixaGeral in '..\view\consultas\uConsCaixaGeral.pas' {frmConsCaixaGeral},
  uDaoFestasDatas in '..\dao\uDaoFestasDatas.pas',
  uRelGeral in '..\view\relatorios\uRelGeral.pas' {frmRelGeral},
  uRelCaixa in '..\view\relatorios\uRelCaixa.pas' {frmRelCaixa},
  uProdutosVendidos in '..\view\consultas\uProdutosVendidos.pas' {frmProdutosVendidos},
  uRelProdVend in '..\view\relatorios\uRelProdVend.pas' {frmRelProdVend},
  dataTestSGDB in '..\dados\dataTestSGDB.pas' {dmTestSGDB: TDataModule},
  uClassConexao in '..\classes\uClassConexao.pas',
  uCfgBase in '..\view\uteis\uCfgBase.pas' {frmCfgBase},
  uFuncoesMsg in '..\funcoes\uFuncoesMsg.pas',
  uRelTabPrecos in '..\view\relatorios\uRelTabPrecos.pas' {frmRelTabPrecos},
  uProcCaixas in '..\view\procuras\uProcCaixas.pas' {frmProcCaixas},
  uProcUsuarios in '..\view\procuras\uProcUsuarios.pas' {frmProcUsuarios},
  uDaoEstoque in '..\dao\uDaoEstoque.pas',
  uCadEstoque in '..\view\cadastros\uCadEstoque.pas' {frmCadEstoque},
  uDaoConsultas in '..\dao\uDaoConsultas.pas',
  uDetCaixa in '..\view\consultas\uDetCaixa.pas' {frmDetCaixa},
  uConsEstoque in '..\view\consultas\uConsEstoque.pas' {frmConsEstoque},
  uDaoSistema in '..\dao\uDaoSistema.pas',
  uClassSistema in '..\classes\uClassSistema.pas',
  uFuncoesRegistro in '..\funcoes\uFuncoesRegistro.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'MParty';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdmTestSGDB, dmTestSGDB);
  Application.CreateForm(TfrmCfgBase, frmCfgBase);
  Application.CreateForm(TfrmErConexao, frmErConexao);
  Application.CreateForm(TfrmTmpForm, frmTmpForm);
  Application.CreateForm(TfrmTmpFormNormal, frmTmpFormNormal);
  Application.CreateForm(TfrmTmpFormNormalMov, frmTmpFormNormalMov);
  Application.CreateForm(TfrmTmpConsultaNormal, frmTmpConsultaNormal);
  Application.CreateForm(TfrmTmpRelFormNormal, frmTmpRelFormNormal);
  Application.CreateForm(TfrmTmpProcura, frmTmpProcura);
  Application.CreateForm(TfrmTmpRelFormNormalDefault, frmTmpRelFormNormalDefault);
  Application.CreateForm(TdmTmpConexao, dmTmpConexao);
  Application.CreateForm(TdmCadastros, dmCadastros);
  Application.CreateForm(TdmConfig, dmConfig);
  Application.CreateForm(TdmGestao, dmGestao);
  Application.CreateForm(TdmConsultas, dmConsultas);
  Application.CreateForm(TdmLookups, dmLookups);
  Application.CreateForm(TfrmSenha, frmSenha);
  Application.CreateForm(TfrmSobre, frmSobre);
  Application.CreateForm(TfrmSplash, frmSplash);
  Application.CreateForm(TfrmSQL, frmSQL);
  Application.CreateForm(TfrmTecladoVirtual, frmTecladoVirtual);
  Application.CreateForm(TfrmNovaFesta, frmNovaFesta);
  Application.CreateForm(TfrmTabPrecos, frmTabPrecos);
  Application.CreateForm(TfrmNovoCaixa, frmNovoCaixa);
  Application.CreateForm(TfrmMovCaixa, frmMovCaixa);
  Application.CreateForm(TfrmFechamento, frmFechamento);
  Application.CreateForm(TfrmConsCaixaGeral, frmConsCaixaGeral);
  Application.CreateForm(TfrmRelGeral, frmRelGeral);
  Application.CreateForm(TfrmRelCaixa, frmRelCaixa);
  Application.CreateForm(TfrmProdutosVendidos, frmProdutosVendidos);
  Application.CreateForm(TfrmRelProdVend, frmRelProdVend);
  Application.CreateForm(TfrmRelTabPrecos, frmRelTabPrecos);
  Application.CreateForm(TfrmProcCaixas, frmProcCaixas);
  Application.CreateForm(TfrmProcUsuarios, frmProcUsuarios);
  Application.CreateForm(TfrmProcUsuarios, frmProcUsuarios);
  Application.CreateForm(TfrmCadEstoque, frmCadEstoque);
  Application.CreateForm(TfrmDetCaixa, frmDetCaixa);
  Application.CreateForm(TfrmConsEstoque, frmConsEstoque);
  Application.Run;
end.