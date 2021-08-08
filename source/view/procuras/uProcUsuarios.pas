unit uProcUsuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpProcura, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Buttons, wwdblook;

type
  TfrmProcUsuarios = class(TfrmTmpProcura)
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
  frmProcUsuarios: TfrmProcUsuarios;

implementation

{$R *.dfm}

uses uDaoUsuarios, dataCadastros, dataLookups, uCadUsuarios;

procedure TfrmProcUsuarios.Limpar;
begin
  ListarUsuarios('USU_NOME');
end;

procedure TfrmProcUsuarios.spLimparClick(Sender: TObject);
begin
  Limpar;
end;

procedure TfrmProcUsuarios.Filtrar;
begin
  FiltrarUsuarios('USU_NOME', 'LIKE', cbProcura.Text + '%', 'USU_NOME');
end;

procedure TfrmProcUsuarios.Selecionar;
begin
  Try
    if Not(dsProcura.DataSet.FieldByName('USU_NOME').IsNull) then
    begin
      FiltrarUsuarios('USU_NOME', '=', dsProcura.DataSet.FieldByName('USU_NOME').Text, 'USU_NOME');
      frmCadUsuarios.sbPrincipal.Panels[3].Text := 'Ativo';
      Close;
    end
    else
      MessageDlg('Não foram encontrados resultados para a seleção!', mtWarning, [mbOk], 0);
  Except
    MessageDlg('Não foram encontrados resultados para a seleção!', mtWarning, [mbOk], 0);
    cbProcura.SetFocus;
  End;
end;

procedure TfrmProcUsuarios.spProcuraClick(Sender: TObject);
begin
  Filtrar;
end;

procedure TfrmProcUsuarios.btConfirmarClick(Sender: TObject);
begin
  Selecionar;
end;

procedure TfrmProcUsuarios.btFecharClick(Sender: TObject);
begin
  //Limpar;
  inherited;
end;

procedure TfrmProcUsuarios.cbProcuraKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Filtrar;
    GridProcura.SetFocus;
  end;
end;

procedure TfrmProcUsuarios.FormActivate(Sender: TObject);
begin
  inherited;
  Limpar;
end;

procedure TfrmProcUsuarios.GridProcuraDblClick(Sender: TObject);
begin
  Selecionar;
end;

procedure TfrmProcUsuarios.GridProcuraKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    cbProcura.SetFocus;
  if key = #13 then
    Selecionar;
end;

end.
