unit uTecladoVirtual;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, Vcl.StdCtrls, Vcl.Mask, Vcl.Touch.Keyboard;

type
  TfrmTecladoVirtual = class(TForm)
    spDone: TSpeedButton;
    TouchKeyboard1: TTouchKeyboard;
    meSenha: TMaskEdit;
    BalloonHint1: TBalloonHint;
    procedure FormCreate(Sender: TObject);
    procedure spDoneClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure meSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure FormDestroy(Sender: TObject);

  private

  ComponentePro: TComponent;
  procedure ProCode(Sender: TObject);

  public
    { Public declarations }
  end;

var
  frmTecladoVirtual: TfrmTecladoVirtual;

implementation

uses uSenha;

{$R *.DFM}

procedure TfrmTecladoVirtual.ProCode(Sender: TObject);
begin
  if Assigned(ComponentePro) then
    TEdit(ComponentePro).Color := clWindow; // cor ao sair
  if (ActiveControl is TCustomEdit) or
     (ActiveControl is TComboBox) or
     (ActiveControl is TMemo) then
  begin
    TEdit(ActiveControl).Color := clSkyBlue;  // cor ao focar
    ComponentePro := ActiveControl;
  end;
end;

procedure TfrmTecladoVirtual.FormCreate(Sender: TObject);
Var
hSysMenu: HMENU;
begin
  hSysMenu := GetSystemMenu(Self.Handle, False);
  if hSysMenu <> 0 then
  begin
    EnableMenuItem(hSysMenu, SC_CLOSE,
    MF_BYCOMMAND Or MF_GRAYED);
    DrawMenuBar(Self.Handle);
  end;
end;

procedure TfrmTecladoVirtual.FormDestroy(Sender: TObject);
begin
  Screen.OnActiveControlChange := nil;
end;

procedure TfrmTecladoVirtual.spDoneClick(Sender: TObject);
begin
  frmSenha.edSenha.Text := meSenha.Text;
  Close;
end;

procedure TfrmTecladoVirtual.FormActivate(Sender: TObject);
begin
  Screen.OnActiveControlChange := ProCode;
  meSenha.Clear;
end;

procedure TfrmTecladoVirtual.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    Close;
end;

procedure TfrmTecladoVirtual.meSenhaKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    frmSenha.edSenha.Text := meSenha.Text;
    Close;
  end;
end;

end.
