unit uTmpRelFormNormalDefault;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uTmpFormNormal, StdCtrls, Menus, ppEndUsr, Db, ppCtrls, ppBands,
  ppPrnabl, ppClass, ppVar, ppCache, ppProd, ppReport, ppDB, ppComm,
  ppRelatv, ppDBPipe, Buttons, ppViewr, ppParameter;

type
  TfrmTmpRelFormNormalDefault = class(TfrmTmpFormNormal)
    btVisualizar: TBitBtn;
    btImprimir: TBitBtn;
    dbEmpresa: TppDBPipeline;
    dbDados: TppDBPipeline;
    Relatorio: TppReport;
    ppTitleBand1: TppTitleBand;
    ppNomeRel: TppSystemVariable;
    ppHeaderBand1: TppHeaderBand;
    ppLinha1: TppLine;
    ppLinha2: TppLine;
    ppDetailBand1: TppDetailBand;
    ppLinha3: TppLine;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    dsDados: TDataSource;
    dsEmpresa: TDataSource;
    ppDesigner: TppDesigner;
    PopupMenu1: TPopupMenu;
    Configurarelatrio1: TMenuItem;
    lbCaption: TLabel;
    sbExportar: TSpeedButton;
    ppSystemVariable1: TppSystemVariable;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    lbSoftware: TppLabel;
    procedure FormActivate(Sender: TObject);
    procedure btVisualizarClick(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
    procedure sbExportarClick(Sender: TObject);
    procedure RelatorioPreviewFormCreate(Sender: TObject);
    procedure lbSoftwareGetText(Sender: TObject; var Text: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTmpRelFormNormalDefault: TfrmTmpRelFormNormalDefault;

implementation

uses dataCadastros, uFuncoesSistema;

{$R *.DFM}

procedure TfrmTmpRelFormNormalDefault.FormActivate(Sender: TObject);
begin
  inherited;
  dsDados.DataSet.Active := True;
  lbCaption.Caption := Relatorio.PrinterSetup.DocumentName;
end;

procedure TfrmTmpRelFormNormalDefault.btVisualizarClick(Sender: TObject);
begin
  inherited;
  Relatorio.DeviceType := 'Screen';
  Relatorio.ShowPrintDialog := True;
  Relatorio.Print;
  Close;
end;

procedure TfrmTmpRelFormNormalDefault.btImprimirClick(Sender: TObject);
begin
  inherited;
  Relatorio.DeviceType := 'Printer';
  Relatorio.ShowPrintDialog := True;
  Relatorio.Print;
  Close;
end;

procedure TfrmTmpRelFormNormalDefault.sbExportarClick(Sender: TObject);
begin
  inherited;
  Relatorio.DeviceType := 'PDFFile';
  Relatorio.ShowPrintDialog := True;
  Relatorio.Print;
  Close;
end;

procedure TfrmTmpRelFormNormalDefault.RelatorioPreviewFormCreate(
  Sender: TObject);
begin
  Relatorio.PreviewForm.WindowState := wsMaximized;
  //TppViewer(Relatorio.PreviewForm.Viewer).ZoomSetting := zsPageWidth;
end;

procedure TfrmTmpRelFormNormalDefault.lbSoftwareGetText(Sender: TObject;
  var Text: String);
begin
  lbSoftware.Caption := 'Sysbuilder - Gestão de Custos para Construções - Vs. ' +
  VersaoSistema(0);
end;

end.
