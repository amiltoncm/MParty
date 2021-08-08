unit uSql;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, Db, StdCtrls, Buttons;

type
  TfrmSQL = class(TForm)
    memo: TMemo;
    btExecutar: TBitBtn;
    btFechar: TBitBtn;
    dsSQL: TDataSource;
    DBGrid1: TDBGrid;
    btLimpar: TBitBtn;
    SpeedButton1: TSpeedButton;
    OpenDialog: TOpenDialog;
    BalloonHint1: TBalloonHint;
    procedure btFecharClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btExecutarClick(Sender: TObject);
    procedure btLimparClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSQL: TfrmSQL;

implementation

uses dataConsultas;

{$R *.DFM}

procedure TfrmSQL.btFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmSQL.FormActivate(Sender: TObject);
begin
  memo.Clear;
  dmConsultas.SQL.Close;
  dmConsultas.SQL.SQL.Clear;
  memo.SetFocus;
end;

procedure TfrmSQL.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TfrmSQL.btExecutarClick(Sender: TObject);
begin
  Try
    dmConsultas.SQL.Close;
    dmConsultas.SQL.SQL.Clear;
    dmConsultas.SQL.SQL.Add(memo.Text);
    dmConsultas.SQL.Open;
  Except
    on E: Exception do
      MessageDlg(E.Message, mtWarning, [mbOk], 0);
  end;
end;

procedure TfrmSQL.btLimparClick(Sender: TObject);
begin
  memo.Clear;
  dmConsultas.SQL.Close;
  dmConsultas.SQL.SQL.Clear;
end;

procedure TfrmSQL.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = VK_F9 Then
    Try
      Begin
        dmConsultas.SQL.Close;
        dmConsultas.SQL.SQL.Clear;
        dmConsultas.SQL.SQL.Add(memo.Text);
        dmConsultas.SQL.Open;
      end;
    Except
      on E: Exception do
        MessageDlg(E.Message, mtWarning, [mbOk], 0);
    end;
end;

procedure TfrmSQL.SpeedButton1Click(Sender: TObject);
begin
  if OpenDialog.execute then
    memo.Lines.LoadFromFile(OpenDialog.Filename);
end;

end.
