unit dataGestao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dataTmpConexao, DB, SDEngine;

type
  TdmGestao = class(TdmTmpConexao)
    SessaoGestao: TSDSession;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmGestao: TdmGestao;

implementation

{$R *.dfm}

end.
