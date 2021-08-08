unit uTmpFormMDI;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, uTmpForm;

type
  TfrmTmpFormMDI = class(TfrmTmpForm)
    btFechar: TBitBtn;
    procedure btFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTmpFormMDI: TfrmTmpFormMDI;

implementation

{$R *.DFM}

procedure TfrmTmpFormMDI.btFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmTmpFormMDI.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmTmpFormMDI.FormDestroy(Sender: TObject);
begin
  inherited;
  if Self <> nil then
    Self := nil;
end;

end.
