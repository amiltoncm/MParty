unit uProcCaixas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, 
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpProcura, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Buttons, wwdblook;

type
  TfrmProcCaixas = class(TfrmTmpProcura)
    procedure Limpar;
    procedure Filtrar;
    procedure Selecionar;
    procedure FormActivate(Sender: TObject);
    procedure spLimparClick(Sender: TObject);
    procedure spProcuraClick(Sender: TObject);
    procedure btConfirmarClick(Sender: TObject);
    procedure cbProcuraKeyPress(Sender: TObject; var Key: Char);
    procedure GridProcuraKeyPress(Sender: TObject; var Key: Char);
    procedure btFecharClick(Sender: TObject);
    procedure GridProcuraDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProcCaixas: TfrmProcCaixas;

implementation

{$R *.dfm}

uses uDaoCaixas, dataCadastros, dataLookups, uCadCaixas;

procedure TfrmProcCaixas.Limpar;
begin
  ListarCaixas('CAI_NOME');
end;

procedure TfrmProcCaixas.spLimparClick(Sender: TObject);
begin
  Limpar;
end;

procedure TfrmProcCaixas.Filtrar;
begin
  FiltrarCaixas('CAI_NOME', 'LIKE', cbProcura.Text + '%', 'CAI_NOME');
end;

procedure TfrmProcCaixas.Selecionar;
begin
  Try
    if Not(dsProcura.DataSet.FieldByName('CAI_NOME').IsNull) then
    begin
      FiltrarCaixas('CAI_NOME', '=', dsProcura.DataSet.FieldByName('CAI_NOME').Text, 'CAI_NOME');
      frmCadCaixas.sbPrincipal.Panels[3].Text := 'Ativo';
      Close;
    end
    else
      MessageDlg('Não foram encontrados resultados para a seleção!', mtWarning, [mbOk], 0);
  Except
    MessageDlg('Não foram encontrados resultados para a seleção!', mtWarning, [mbOk], 0);
    cbProcura.SetFocus;
  End;
end;

procedure TfrmProcCaixas.spProcuraClick(Sender: TObject);
begin
  Filtrar;
end;

procedure TfrmProcCaixas.btConfirmarClick(Sender: TObject);
begin
  Selecionar;
end;

procedure TfrmProcCaixas.btFecharClick(Sender: TObject);
begin
  //Limpar;
  inherited;
end;

procedure TfrmProcCaixas.cbProcuraKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Filtrar;
    GridProcura.SetFocus;
  end;
end;

procedure TfrmProcCaixas.FormActivate(Sender: TObject);
begin
  inherited;
  Limpar;
end;

procedure TfrmProcCaixas.GridProcuraDblClick(Sender: TObject);
begin
  Selecionar;
end;

procedure TfrmProcCaixas.GridProcuraKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    cbProcura.SetFocus;
  if key = #13 then
    Selecionar;
end;

end.
