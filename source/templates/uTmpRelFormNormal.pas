unit uTmpRelFormNormal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uTmpFormNormal, StdCtrls, Buttons, Menus, ppEndUsr, Db,
  ppCtrls, ppBands, ppPrnabl, ppClass, ppVar, ppCache, ppProd, ppReport,
  ppDB, ppComm, ppRelatv, ppDBPipe, ppViewr, ppParameter;

type
  TfrmTmpRelFormNormal = class(TfrmTmpFormNormal)
    lbCaption: TLabel;
    sbExportar: TSpeedButton;
    btVisualizar: TBitBtn;
    btImprimir: TBitBtn;
    dbDados: TppDBPipeline;
    Relatorio: TppReport;
    ppTitleBand1: TppTitleBand;
    ppHeaderBand1: TppHeaderBand;
    ppLinha1: TppLine;
    ppLinha2: TppLine;
    ppDetailBand1: TppDetailBand;
    ppLinha3: TppLine;
    ppFooterBand1: TppFooterBand;
    dsDados: TDataSource;
    ppDesigner: TppDesigner;
    PopupMenu1: TPopupMenu;
    Configurarelatrio1: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure btVisualizarClick(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
    procedure sbExportarClick(Sender: TObject);
    procedure RelatorioPreviewFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTmpRelFormNormal: TfrmTmpRelFormNormal;

implementation

{$R *.DFM}

procedure TfrmTmpRelFormNormal.FormActivate(Sender: TObject);
begin
  inherited;
  dsDados.DataSet.Active := True;
  //frmTmpRelatorio.Caption := Relatorio.PrinterSetup.DocumentName;
  lbCaption.Caption := Relatorio.PrinterSetup.DocumentName;
  //ExtraOptions1.PDF.Title := dmConfig.qyEmpresaemp_razao.Text;
  //ExtraOptions1.PDF.Creator := dmConfig.qyEmpresaemp_razao.Text;
  //ExtraOptions1.PDF.Author := dmConfig.qyEmpresaemp_razao.Text;
  //ExtraOptions1.PDF.Keywords := dmConfig.qyEmpresaemp_razao.Text;
  //ExtraOptions1.PDF.Subject := dmConfig.qyEmpresaemp_razao.Text;
end;

procedure TfrmTmpRelFormNormal.btVisualizarClick(Sender: TObject);
begin
  inherited;
  Relatorio.DeviceType := 'Screen';
  Relatorio.ShowPrintDialog := True;
  Relatorio.Print;
  Close;
end;

procedure TfrmTmpRelFormNormal.btImprimirClick(Sender: TObject);
begin
  inherited;
  Relatorio.DeviceType := 'Printer';
  Relatorio.ShowPrintDialog := True;
  Relatorio.Print;
  Close;
end;

procedure TfrmTmpRelFormNormal.sbExportarClick(Sender: TObject);
begin
  inherited;
  Relatorio.DeviceType := 'PDFFile';
  Relatorio.ShowPrintDialog := True;
  Relatorio.Print;
  Close;
end;

procedure TfrmTmpRelFormNormal.RelatorioPreviewFormCreate(Sender: TObject);
begin
  Relatorio.PreviewForm.WindowState := wsMaximized;
  //TppViewer(Relatorio.PreviewForm.Viewer).ZoomSetting := zsPageWidth;
end;

end.
