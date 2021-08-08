unit uDetCaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormNormal, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Data.DB, Vcl.Mask, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, JvExDBGrids, JvDBGrid;

type
  TfrmDetCaixa = class(TfrmTmpFormNormal)
    Panel1: TPanel;
    Label1: TLabel;
    dbCaixa: TDBEdit;
    dsCaixaTot: TDataSource;
    Label2: TLabel;
    dbLocal: TDBEdit;
    Label3: TLabel;
    dbData: TDBEdit;
    Label5: TLabel;
    dbTrocoInic: TDBEdit;
    Label6: TLabel;
    dbRetiradas: TDBEdit;
    Label7: TLabel;
    dbTrocos: TDBEdit;
    Label8: TLabel;
    dbTotProd: TDBEdit;
    Label9: TLabel;
    dbTotCaixa: TDBEdit;
    Label10: TLabel;
    dbFechamento: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    Label11: TLabel;
    dbDiferenca: TDBEdit;
    Label12: TLabel;
    dbLucro: TDBEdit;
    Label4: TLabel;
    JvDBGrid1: TJvDBGrid;
    Label13: TLabel;
    GridItensVend: TJvDBGrid;
    dsMovHist: TDataSource;
    dsVendas: TDataSource;
    Label14: TLabel;
    JvDBGrid2: TJvDBGrid;
    dsItensVend: TDataSource;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure dsMovHistDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDetCaixa: TfrmDetCaixa;

implementation

{$R *.dfm}

uses dataCadastros, dataConsultas, uDaoConsultas, uFuncoesFormatacao;

procedure TfrmDetCaixa.dsMovHistDataChange(Sender: TObject; Field: TField);
begin
  if dsMovHist.DataSet.FieldByName('MVH_CODIGO').IsNull then
    ItensVendaCaixa('0', '0', '0')
  else
    ItensVendaCaixa(LimpaReal(dsMovHist.DataSet.FieldByName('MVH_CODIGO').Text),
                    dsMovHist.DataSet.FieldByName('CAI_CODIGO').Text,
                    dsMovHist.DataSet.FieldByName('LOC_CODIGO').Text);
end;

procedure TfrmDetCaixa.FormActivate(Sender: TObject);
begin
  inherited;
  dsCaixaTot.DataSet.Active := True;
  dsMovHist.DataSet.Active := True;
  dsVendas.DataSet.Active := True;
  dsItensVend.DataSet.Active := True;
end;

procedure TfrmDetCaixa.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    Close;
end;

end.
