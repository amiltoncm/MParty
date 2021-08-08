unit uTmpConsultaMDI;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormMDI, Vcl.StdCtrls, Vcl.Buttons,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Wwdbigrd, Wwdbgrid;

type
  TfrmTmpConsultaMDI = class(TfrmTmpFormMDI)
    Label4: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    edParametro: TEdit;
    btFiltrar: TBitBtn;
    btLimpar: TBitBtn;
    dsConsultas: TDataSource;
    btSelecionar: TBitBtn;
    cbCampo: TComboBox;
    cbFiltro: TComboBox;
    GridConsultas: TwwDBGrid;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTmpConsultaMDI: TfrmTmpConsultaMDI;

implementation

{$R *.dfm}

procedure TfrmTmpConsultaMDI.FormActivate(Sender: TObject);
begin
  inherited;
  cbCampo.ItemIndex := 0;
  cbFiltro.ItemIndex := 0;
  edParametro.Clear;
  cbCampo.SetFocus;
end;

end.
