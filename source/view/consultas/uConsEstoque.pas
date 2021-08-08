unit uConsEstoque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormNormal, Vcl.StdCtrls,
  Vcl.Buttons, Data.DB, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid;

type
  TfrmConsEstoque = class(TfrmTmpFormNormal)
    dsEstoque: TDataSource;
    JvDBGrid1: TJvDBGrid;
    procedure FormActivate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsEstoque: TfrmConsEstoque;

implementation

{$R *.dfm}

uses dataConsultas;

procedure TfrmConsEstoque.FormActivate(Sender: TObject);
begin
  inherited;
  dsEstoque.DataSet.Active := True;
end;

procedure TfrmConsEstoque.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    Close;
end;

end.
