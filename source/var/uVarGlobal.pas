unit uVarGlobal;

interface

Var
//Dados do usuário
vgCodUsuarioLog: String;
vgNomeUsuarioLog: String;

//Variáveis padrões
vgPath: String;
vgArqIni: String;
vgDirTemp: String;
vgDirImagens: String;
vgFundo: String;

//Controle de logo do relatório
vgLogoRel: String;

//Verifica se existe alguma festa em aberto - 0 nenhuma ou o código da Festa
vgFestaAberta: String;
vgMaskDataSQL: String;

//Verifica local e caixa para inserção de novo produto
vgCodLocal: String;
vgCodCaixa: String;
vgNomeCaixa: String;
vgDataCaixa: String;
vgDataCx: TDate;
//Controle de número da venda
vgNumVenda: Integer;

implementation

end.
