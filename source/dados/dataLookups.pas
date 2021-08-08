unit dataLookups;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dataTmpConexao, Data.DB, SDEngine;

type
  TdmLookups = class(TdmTmpConexao)
    lkCaixas: TSDQuery;
    lkCaixasCAI_CODIGO: TIntegerField;
    lkCaixasCAI_NOME: TStringField;
    lkLocais: TSDQuery;
    lkLocaisLOC_CODIGO: TIntegerField;
    lkLocaisLOC_DESCRICAO: TStringField;
    lkCaixaLocal: TSDQuery;
    lkCaixaLocalCAI_CODIGO: TIntegerField;
    lkCaixaLocalCAI_NOME: TStringField;
    lkCaixaLocalFES_CODIGO: TIntegerField;
    lkCaixaLocalLOC_CODIGO: TIntegerField;
    lkCaixaLocalLOC_DESCRICAO: TStringField;
    lkFestas: TSDQuery;
    lkFestasFES_ANO: TIntegerField;
    lkFestasFES_DATAINIC: TDateTimeField;
    lkFestasFES_DATAFINAL: TDateTimeField;
    lkFestasFES_CODIGO: TIntegerField;
    lkCaixaLocalCXT_DATA: TDateTimeField;
    procedure Atualizar;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmLookups: TdmLookups;

implementation

{$R *.dfm}

procedure TdmLookups.Atualizar;
begin
  lkCaixas.Active := False;
  lkCaixas.Active := True;
  lkLocais.Active := False;
  lkLocais.Active := True;
  lkCaixaLocal.Active := False;
  lkCaixaLocal.Active := True;
  lkFestas.Active := False;
  lkFestas.Active := True;
end;

procedure TdmLookups.DataModuleCreate(Sender: TObject);
begin
  inherited;
  Atualizar;
end;

end.
