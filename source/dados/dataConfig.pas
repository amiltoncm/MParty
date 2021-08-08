unit dataConfig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dataTmpConexao, DB, SDEngine;

type
  TdmConfig = class(TdmTmpConexao)
    qyEmpresa: TSDQuery;
    qyEmpresaEMP_CODIGO: TIntegerField;
    qyEmpresaEMP_RAZAO: TStringField;
    qyEmpresaEMP_CNPJ: TStringField;
    qyEmpresaEMP_IE: TStringField;
    qyEmpresaEMP_IMUN: TStringField;
    qyEmpresaEMP_LOGRADOURO: TStringField;
    qyEmpresaEMP_NUMERO: TIntegerField;
    qyEmpresaEMP_COMPLEMENTO: TStringField;
    qyEmpresaEMP_BAIRRO: TStringField;
    qyEmpresaEMP_CIDADE: TStringField;
    qyEmpresaEMP_UF: TStringField;
    qyEmpresaEMP_CEP: TStringField;
    qyEmpresaEMP_FONE: TStringField;
    qyEmpresaEMP_EMAIL: TStringField;
    qyEmpresaEMP_HOMEPAGE: TStringField;
    updEmpresa: TSDUpdateSQL;
    qyConfig: TSDQuery;
    qyConfigCFG_CODIGO: TIntegerField;
    qyConfigCFG_CODCIDADEPADRAO: TIntegerField;
    qyConfigCFG_VERSAO: TStringField;
    updConfig: TSDUpdateSQL;
    SessaoConfig: TSDSession;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmConfig: TdmConfig;

implementation

{$R *.dfm}

end.
