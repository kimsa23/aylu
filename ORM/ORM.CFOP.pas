unit ORM.CFOP;

interface

uses sysutils, dialogs, System.UITypes,
  classe.query, rotina.retornasql,
  uconstantes, rotina.Registro, classe.dao;

Type
  TCFOP = class(TPersintentObject)
  private
    Fbodifal: string;
    Fbocompra: string;
    Fboexibirtributos: string;
    Fnusticmssimples: string;
    Fcdcfop: Integer;
    Fbodiferencialaliquota: string;
    Fnustpis: string;
    Fnustcofins: string;
    Fbocalcularibpt: string;
    Fboicmssubtrib: string;
    Fboestoqueterceiro: string;
    Fnustpissimples: string;
    Fnustcofinssimples: string;
    Fboufdiferente: string;
    Fboativar: string;
    Fbopedido: string;
    Fbotributadaciapi: string;
    Fnustipi: string;
    Fbosaidaciapi: string;
    Fdscfop: string;
    Fboaceitaicmssubtrib: string;
    Fnustipisimples: string;
    Fcdcfopdevolucao: Integer;
    Fnmcfop: string;
    Fbogeracontasreceber: string;
    Fbolivroproducao: string;
    Fbodevolucao: string;
    Fdsmensagem: string;
    Fbocte: string;
    Fcdtpitem: string;
    Fnudocfiscalicms: string;
    Fnusticms: string;
  public
    [keyfield]
    property cdcfop : Integer read Fcdcfop write Fcdcfop;
    property nusticms : string read Fnusticms write Fnusticms;
    property nustipi : string read Fnustipi write Fnustipi;
    property nustpis : string read Fnustpis write Fnustpis;
    property nustcofins : string read Fnustcofins write Fnustcofins;
    property nudocfiscalicms : string read Fnudocfiscalicms write Fnudocfiscalicms;
    property cdcfopdevolucao : Integer read Fcdcfopdevolucao write Fcdcfopdevolucao;
    property nusticmssimples : string read Fnusticmssimples write Fnusticmssimples;
    property nustcofinssimples : string read Fnustcofinssimples write Fnustcofinssimples;
    property nustipisimples : string read Fnustipisimples write Fnustipisimples;
    property nustpissimples : string read Fnustpissimples write Fnustpissimples;
    property cdtpitem : string read Fcdtpitem write Fcdtpitem;
    property nmcfop : string read Fnmcfop write Fnmcfop;
    property bogeracontasreceber : string read Fbogeracontasreceber write Fbogeracontasreceber;
    property bodiferencialaliquota : string read Fbodiferencialaliquota write Fbodiferencialaliquota;
    property dscfop : string read Fdscfop write Fdscfop;
    property bolivroproducao : string read Fbolivroproducao write Fbolivroproducao;
    property bocte : string read Fbocte write Fbocte;
    property dsmensagem : string read Fdsmensagem write Fdsmensagem;
    property botributadaciapi : string read Fbotributadaciapi write Fbotributadaciapi;
    property bosaidaciapi : string read Fbosaidaciapi write Fbosaidaciapi;
    property boestoqueterceiro : string read Fboestoqueterceiro write Fboestoqueterceiro;
    property boicmssubtrib : string read Fboicmssubtrib write Fboicmssubtrib;
    property boativar : string read Fboativar write Fboativar;
    property boexibirtributos : string read Fboexibirtributos write Fboexibirtributos;
    property bocalcularibpt : string read Fbocalcularibpt write Fbocalcularibpt;
    property bodevolucao : string read Fbodevolucao write Fbodevolucao;
    property boaceitaicmssubtrib : string read Fboaceitaicmssubtrib write Fboaceitaicmssubtrib;
    property bopedido : string read Fbopedido write Fbopedido;
    property boufdiferente : string read Fboufdiferente write Fboufdiferente;
    property bocompra : string read Fbocompra write Fbocompra;
    property bodifal : string read Fbodifal write Fbodifal;
    class function VerificarCFOPCTE(codigo:integer):boolean;
  end;

implementation

class function TCFOP.VerificarCFOPCTE(codigo: integer): boolean;
var
  cfop : tcfop;
begin
  cfop := tcfop.Create;
  try
    result := cfop.Select(codigo);
    if not result then
    begin
      exit;
    end;
    result := cfop.bocte = _s;
    if result then
    begin
      messagedlg('CFOP '+codigo.ToString+' está configurado para emissão de CTE.', mtinformation, [mbok], 0);
    end;
  finally
    freeandnil(cfop);
  end;
end;

end.
