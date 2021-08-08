unit uTmpForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.StdCtrls, Vcl.Forms, Vcl.Dialogs;

type

  { TfrmTmpForm }

  TfrmTmpForm = class(TForm)
    procedure FormActivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private

  ComponentePro: TComponent;
  procedure ProCode(Sender: TObject);

  public
    { Public declarations }
  end;

var
  frmTmpForm: TfrmTmpForm;

implementation

{$R *.dfm}

procedure TfrmTmpForm.FormActivate(Sender: TObject);
begin
  Screen.OnActiveControlChange := ProCode;
end;

procedure TfrmTmpForm.FormDestroy(Sender: TObject);
begin
  Screen.OnActiveControlChange := nil;
end;

procedure TfrmTmpForm.ProCode(Sender: TObject);
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

procedure TfrmTmpForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

end.
