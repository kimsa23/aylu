unit ACBR.NFEABR;

interface

uses ACBrNFe, ACBrNFeDANFEFR, System.UITypes,
  System.SysUtils, System.Classes, dialogs,
  acbr.ACBR, orm.empresa;

type
  TNFEAcbr = class
  private
    fACBrNFe: TACBrNFe;
    fdanfe: TACBrNFeDANFEFR;
  public
    property danfe: TACBrNFeDANFEFR read fdanfe write fdanfe;
    property ACBrNFe: TACBrNFe read fACBrNFe write fACBrNFe;
    function Loadnfe(dsxml:string):boolean;
    procedure ConfigurarINI;
    constructor create;
    destructor destroy; override;
    class procedure ImprimirCartaCorrecao(dsxml, dsxmlcarta:string);
    class function DownloadXML(chave:string):string;
  end;

implementation

procedure TNFEAcbr.ConfigurarINI;
var
  ACBR : TACBR;
begin
  acbr := tacbr.create;
  try
    acbr.LerConfiguracao;
    Acbr.AplicarConfiguracao(ACBrNFe);
  finally
    freeandnil(acbr);
  end;
end;

constructor TNFEAcbr.create;
begin
  inherited;
  fACBrNFe := TACBrNFe.Create(nil);
end;

destructor TNFEAcbr.destroy;
begin
  freeandnil(fACBrNFe);
  inherited;
end;

class function TNFEAcbr.DownloadXML(chave:string): string;
var
  nfe : TNFEAcbr;
  cduf : Integer;
begin
  nfe := TNFEAcbr.create;
  try
    nfe.ConfigurarINI;
    cduf := strtoint(Copy(chave, 1, 2));
    if nfe.ACBrNFe.DistribuicaoDFePorChaveNFe(cduf, empresa.nucnpj, chave) then
    begin
      if nfe.ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Count > 0 then
      begin
        result := nfe.ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[0].XML;
      end
      else
      begin
        MessageDlg(nfe.ACBrNFe.WebServices.DistribuicaoDFe.Msg, mtInformation, [mbOK], 0);
      end;
    end;
  finally
    freeandnil(nfe);
  end;
end;

class procedure TNFEAcbr.ImprimirCartaCorrecao(dsxml, dsxmlcarta: string);
var
  nfe : tnfeacbr;
begin
  nfe := tnfeacbr.create;
  try
    nfe.Loadnfe(dsxml);
    nfe.ACBrNFe.EventoNFe.Evento.Clear;
    nfe.ACBrNFe.EventoNFe.LerXMLFromString(dsxmlcarta);
    //NFEImprimirCartaCorrecao(nfe);
  finally
    freeandnil(nfe);
  end;
end;

function TNFEAcbr.Loadnfe(dsxml: string): boolean;
var
  texto : TStringStream;
begin
  result := False;
  ACBrNFe.NotasFiscais.Clear;
  texto := TStringStream.Create('');
  try
    texto.WriteString(dsxml);
    ACBrNFe.NotasFiscais.LoadFromStream(texto);
    result := True;
  finally
    freeandnil(texto);
  end;
end;

end.
