unit uCadEstoque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormNormalMov, Vcl.StdCtrls,
  Vcl.ExtCtrls, Data.DB, Vcl.Buttons, Vcl.Mask, Vcl.DBCtrls;

type
  TfrmCadEstoque = class(TfrmTmpFormNormalMov)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dsPrecos: TDataSource;
    dbCodigo: TDBEdit;
    dbProduto: TDBEdit;
    dbPreco: TDBEdit;
    dbEstoque: TDBEdit;
    btGravar: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure btGravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadEstoque: TfrmCadEstoque;

implementation

{$R *.dfm}

uses dataCadastros, uDaoEstoque;

procedure TfrmCadEstoque.btGravarClick(Sender: TObject);
begin
  PostEstoque;
  Close;
end;

procedure TfrmCadEstoque.FormActivate(Sender: TObject);
begin
  inherited;
  InsEstoque;
  SetCodEstoque(dsPrecos.DataSet.FieldByName('PRE_CODIGO').Text);
  dbEstoque.SetFocus;
end;

end.
