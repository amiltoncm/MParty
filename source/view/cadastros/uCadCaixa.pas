unit uCadCaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpCadastro, Data.DB, Vcl.ImgList,
  Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TfrmCadCaixa = class(TfrmTmpCadastro)
    Label1: TLabel;
    dbCodigo: TDBEdit;
    Label2: TLabel;
    dbNome: TDBEdit;
    procedure actNovoExecute(Sender: TObject);
    procedure actAlterarExecute(Sender: TObject);
    procedure actAtualizarExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure actLimparExecute(Sender: TObject);
    procedure actProcurarExecute(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadCaixa: TfrmCadCaixa;

implementation

{$R *.dfm}

uses dataCadastro, uDaoCaixa, dataCadastros;

procedure TfrmCadCaixa.actAlterarExecute(Sender: TObject);
begin
  inherited;
  //dbCodigo.SetFocus;
end;

procedure TfrmCadCaixa.actAtualizarExecute(Sender: TObject);
begin
  dsCadastro.DataSet.Refresh;
end;

procedure TfrmCadCaixa.actLimparExecute(Sender: TObject);
begin
  ListarCaixa('CAI_NOME');
  sbPrincipal.Panels[3].Text := 'Inativo';
  inherited;
end;

procedure TfrmCadCaixa.actNovoExecute(Sender: TObject);
begin
  inherited;
  //dbCodigo.SetFocus;
end;

procedure TfrmCadCaixa.FormActivate(Sender: TObject);
begin
  inherited;
  ListarCaixa('CAI_NOME');
  //dbCodigo.SetFocus;
end;

procedure TfrmCadCaixa.FormDestroy(Sender: TObject);
begin
  if frmCadCaixa <> nil then
    frmCadCaixa := nil;
end;

procedure TfrmCadCaixa.actProcurarExecute(Sender: TObject);
begin
  //frmProcCaixa.ShowModal;
end;

end.
