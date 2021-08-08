unit uCadLocais;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpCadastro, Data.DB, Vcl.ImgList,
  Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TfrmCadLocais = class(TfrmTmpCadastro)
    Label1: TLabel;
    dbCodigo: TDBEdit;
    Label2: TLabel;
    dbDescricao: TDBEdit;
    procedure actNovoExecute(Sender: TObject);
    procedure actAlterarExecute(Sender: TObject);
    procedure actAtualizarExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure actLimparExecute(Sender: TObject);
    procedure actProcurarExecute(Sender: TObject);
    procedure actGravarExecute(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadLocais: TfrmCadLocais;

implementation

{$R *.dfm}

uses dataCadastros, uDaoLocais, uFuncoesDB, dataLookups;

procedure TfrmCadLocais.actAlterarExecute(Sender: TObject);
begin
  inherited;
  dbDescricao.SetFocus;
end;

procedure TfrmCadLocais.actAtualizarExecute(Sender: TObject);
begin
  dsCadastro.DataSet.Refresh;
end;

procedure TfrmCadLocais.actGravarExecute(Sender: TObject);
begin
  if dsCadastro.DataSet.State in [dsInsert] then
    dsCadastro.DataSet.FieldByName('LOC_CODIGO').Value := GetCodigo('LOC_CODIGO', 'LOCAIS');
  dmLookups.Atualizar;
  inherited;
end;

procedure TfrmCadLocais.actLimparExecute(Sender: TObject);
begin
  ListarLocais('LOC_DESCRICAO', '0');
  sbPrincipal.Panels[3].Text := 'Inativo';
  inherited;
end;

procedure TfrmCadLocais.actNovoExecute(Sender: TObject);
begin
  inherited;
  dbDescricao.SetFocus;
end;

procedure TfrmCadLocais.FormActivate(Sender: TObject);
begin
  inherited;
  ListarLocais('LOC_DESCRICAO', '0');
  dbDescricao.SetFocus;
end;

procedure TfrmCadLocais.FormDestroy(Sender: TObject);
begin
  if frmCadLocais <> nil then
    frmCadLocais := nil;
end;

procedure TfrmCadLocais.actProcurarExecute(Sender: TObject);
begin
  //frmProcLocais.ShowModal;
end;

end.
