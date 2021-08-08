unit uTmpConsultaNormal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormNormal, Vcl.StdCtrls,
  Vcl.Buttons, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfrmTmpConsultaNormal = class(TfrmTmpFormNormal)
    Label4: TLabel;
    cbCampo: TComboBox;
    Label2: TLabel;
    cbFiltro: TComboBox;
    Label1: TLabel;
    edParametro: TEdit;
    btFiltrar: TBitBtn;
    btLimpar: TBitBtn;
    GridConsulta: TDBGrid;
    dsConsultas: TDataSource;
    btSelecionar: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTmpConsultaNormal: TfrmTmpConsultaNormal;

implementation

{$R *.dfm}

end.
