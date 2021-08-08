unit uNovoCaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormNormal, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, wwdblook, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls;

type
  TfrmNovoCaixa = class(TfrmTmpFormNormal)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    cbCaixas: TwwDBLookupCombo;
    cbLocais: TwwDBLookupCombo;
    Label3: TLabel;
    edVlrTroco: TEdit;
    btGravar: TBitBtn;
    dsPrecos: TDataSource;
    Label6: TLabel;
    dtpData: TDateTimePicker;
    procedure btGravarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edVlrTrocoKeyPress(Sender: TObject; var Key: Char);
    procedure btFecharClick(Sender: TObject);
    procedure edVlrTrocoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNovoCaixa: TfrmNovoCaixa;

implementation

{$R *.dfm}

uses dataLookups, uFuncoesFormatacao, uDaoCaixatot, dataCadastros,
  uFesta, uFuncoesValidacao, uDaoPrecos, uDaoMovHist, uDaoFestasDatas,
  uVarGlobal;

procedure TfrmNovoCaixa.btFecharClick(Sender: TObject);
begin
  dmLookups.lkCaixaLocal.Refresh;
  inherited;
end;

procedure TfrmNovoCaixa.btGravarClick(Sender: TObject);
Var
vAbrir: boolean;
begin
  if TestaData(dtpData.Date) = true then
  begin
    if cbCaixas.Text <> '' then
    begin
      if cbLocais.Text <> '' then
      begin
        if edVlrTroco.Text <> '' then
        begin
          if edVlrTroco.Text <> '0,00' then
          begin
            vgDataCaixa := (FormatDateTime('MM/dd/yyyy', dtpData.Date));
            vgDataCx := dtpData.Date;
            if TestCaixaOpen(dmLookups.lkCaixasCAI_CODIGO.Text, dmLookups.lkLocaisLOC_CODIGO.Text) = false then
            begin
              OpenCaixaTot(dmLookups.lkCaixasCAI_CODIGO.Text, dmLookups.lkLocaisLOC_CODIGO.Text,
                           edVlrTroco.Text, dtpData.Date);
              MessageDlg('Caixa aberto com sucesso!', mtInformation, [mbOk], 0);
              Close;
            end;
          end
          else
            MessageDlg('Você deve digitar o valor do troco inicial!', mtWarning, [mbok], 0);
        end
        else
          MessageDlg('Você deve digitar o valor do troco inicial!', mtWarning, [mbok], 0);
      end
      else
        MessageDlg('Você deve selecionar o local!', mtWarning, [mbok], 0);
    end
    else
      MessageDlg('Você deve selecionar o caixa!', mtWarning, [mbok], 0);
  end
  else
    MessageDlg('A data selecionada é inválida!', mtWarning, [mbok], 0);
end;

procedure TfrmNovoCaixa.edVlrTrocoExit(Sender: TObject);
begin
  edVlrTroco.Text := FormatFloat('#,###,###,##0.00', (StrToFloat(edVlrTroco.Text)));
end;

procedure TfrmNovoCaixa.edVlrTrocoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  Key := NumeroReal(Key);
end;

procedure TfrmNovoCaixa.FormActivate(Sender: TObject);
begin
  dmLookups.Atualizar;
  FiltrarPrecos('PRE_STATUS', '=', 'A', 'PRE_DESCRICAO', '0');
  dsPrecos.DataSet.Active := True;
  cbCaixas.Clear;
  cbLocais.Clear;
  edVlrTroco.Text := '0,00';
  inherited;
  dtpData.Date := now;
  btGravar.Enabled := true;
  cbCaixas.ReadOnly := false;
  cbLocais.ReadOnly := false;
  edVlrTroco.ReadOnly := false;
  cbCaixas.SetFocus;
end;

end.
