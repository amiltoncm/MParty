unit uTmpFormNormalMov;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormNormal, Vcl.StdCtrls,
  Vcl.Buttons, Data.DB;

type
  TfrmTmpFormNormalMov = class(TfrmTmpFormNormal)
    dsMovimento: TDataSource;
    procedure FormActivate(Sender: TObject);
    procedure btFecharClick(Sender: TObject);
    procedure btGravarClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTmpFormNormalMov: TfrmTmpFormNormalMov;

implementation

{$R *.dfm}

procedure TfrmTmpFormNormalMov.btFecharClick(Sender: TObject);
begin
  dsMovimento.DataSet.Cancel;
  inherited;
end;

procedure TfrmTmpFormNormalMov.btGravarClick(Sender: TObject);
begin
  Try
    dsMovimento.DataSet.Post;
  Except
    MessageDlg('Não foi posível gravar as alterações!', mtError, [mbok], 0);
  End;
  // Close;
end;

procedure TfrmTmpFormNormalMov.FormActivate(Sender: TObject);
begin
  inherited;
  dsMovimento.DataSet.Active := true;
  dsMovimento.DataSet.Insert;
end;

procedure TfrmTmpFormNormalMov.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if dsMovimento.DataSet.State in [dsInsert] then
  begin
    if MessageDlg('Deseja cancelar o lançamento?', mtConfirmation,
      [mbYes, mbNo], 0) = mrYes then
      CanClose := true
    else
      CanClose := False;
  end;
end;

end.
