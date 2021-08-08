unit uNovaFesta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormNormal, Vcl.StdCtrls,
  Vcl.Buttons, wwdbdatetimepicker, Data.DB, Vcl.Mask, Vcl.DBCtrls;

type
  TfrmNovaFesta = class(TfrmTmpFormNormal)
    Label1: TLabel;
    dbCodigo: TDBEdit;
    dsNewFesta: TDataSource;
    Label2: TLabel;
    dbAno: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    dtDtInic: TwwDBDateTimePicker;
    dtDtFinal: TwwDBDateTimePicker;
    btGravar: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure btFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btGravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNovaFesta: TfrmNovaFesta;

implementation

{$R *.dfm}

uses uDaoFestas;

procedure TfrmNovaFesta.btFecharClick(Sender: TObject);
begin
  dsNewFesta.DataSet.Cancel;
  inherited;
end;

procedure TfrmNovaFesta.btGravarClick(Sender: TObject);
begin
  inherited;
  GravarNovaFesta;
  MessageDlg('Festa criada com sucesso!', mtInformation, [mbOk], 0);
  Close;
end;

procedure TfrmNovaFesta.FormActivate(Sender: TObject);
begin
  inherited;
  NovaFesta;
  dtDtInic.SetFocus;
end;

procedure TfrmNovaFesta.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if dsNewFesta.DataSet.State in [dsEdit, dsInsert] then
  begin
    if MessageDlg('Deseja realmente cancelar a inclusão de uma nova festa?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      CanClose := true
    else
      CanClose := false;
  end;
end;

end.
