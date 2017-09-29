unit ORM.ITSaida;

interface

uses
  forms, SysUtils, classes, dialogs, Data.DB, Contnrs, System.UITypes,
  uConstantes, dialogo.progressbar, rotina.Registro, rotina.rotinas,
  orm.produto, orm.CFOP, Classe.DAO, rotina.retornasql, classe.query, orm.locacao,
  orm.ItSaidaLote, orm.ItSaidaImportacao;

type
  TITSaida = class(TRegistroQuipos)
  private
    fpICMSUFDest: double;
    fvldifal: currency;
    fitsaidaimportacao: TItSaidaImportacaoList;
    fcfop: TCFOP;
    fproduto: tproduto;
    Fbobasepisajuste: String;
    Fboicmsincidesipi: String;
    Fboajustetotal: String;
    Fborecuperaicms: String;
    Fboicmsred: String;
    Fboalteracustomedio: String;
    Fbobaseicmssubtribajuste: String;
    Fbobaseicmsajuste: String;
    Fboicmssubtribajuste: String;
    Fbobaseipiajuste: String;
    Fborecuperapis: String;
    Fborecuperaipi: String;
    Fbobasecofinsajuste: String;
    Fborecuperaajusteicms: String;
    Fbocomissao: String;
    Fborecuperacofins: String;
    Fboipibcicms: String;
    Fvlicmssubtrib: Currency;
    Fvlipi: Currency;
    Fvlcusto: Currency;
    Fvlbasepis: Currency;
    Fvlinss: Currency;
    Fvlbasepisred: Currency;
    Fvlirrf: Currency;
    Fvlicms: Currency;
    Fvldesconto: Currency;
    Fvlbasecofins: Currency;
    Fvlicmscredito: Currency;
    Fvloutdespesa: Currency;
    Fvlbaseinss: Currency;
    Fvlpis: Currency;
    Fvlseguro: Currency;
    Fvliss: Currency;
    Fvlbaseicmsred: Currency;
    Fvlsaldovalor: Currency;
    Fvlbaseipi: Currency;
    Fvlpisred: Currency;
    Fvlbaseirrf: currency;
    Fvlcomissao: Currency;
    Fvlcofins: Currency;
    Fvlfrete: Currency;
    Fvlcustomedio: Currency;
    Fvltotal: Currency;
    Fvlbaseicmssubtrib: Currency;
    Fvltotaltributo: Currency;
    Fvlbaseicms: Currency;
    Fvlicmsred: Currency;
    Fvlbasecofinsred: Currency;
    Fvlbaseiss: Currency;
    Fvllucro: Currency;
    Fvlcofinsred: Currency;
    Falcofins: Double;
    Fprtotaltributo: Double;
    Falipi: Double;
    Fpsliquido: Double;
    Falinss: Double;
    Falicmscredito: Double;
    Fprredbcicmssubtrib: Double;
    Fvlunitario: Double;
    Fprdesconto: double;
    Fpsbruto: Double;
    Falicmsred: Double;
    Fprmrgvladicionadoicmssubtrib: Double;
    Falcofinsred: Double;
    Fqtitem: Double;
    Falicmssubtrib: Double;
    Fqtpeca: Double;
    Falirrf: Double;
    Falicms: Double;
    Falpis: Double;
    Falpisred: Double;
    Faliss: Double;
    Fprcomissao: Double;
    Fcdcomputadorl: Integer;
    Fcdstitsaida: Integer;
    Fcdmodbcicms: Integer;
    Fcdtpregimeicms: Integer;
    Fcdproduto: Integer;
    Fcdsaida: Integer;
    Fcdlocacao: Integer;
    Fcdlocacaodevolucao: Integer;
    Fcdlocacaoperiodo: Integer;
    Fcdusuariol: Integer;
    Fcdmunicipio: Integer;
    Fcditpedido: Integer;
    Fcdmodbcsticms: Integer;
    Fnuordserv: Integer;
    Fcditsaida: Integer;
    Fcdtpgradevalor: Integer;
    Fcdplconta: Integer;
    Fcdtpcomissao: Integer;
    Fcdcfop: Integer;
    Fcdpedido: Integer;
    Fcditordserv: Integer;
    Fnuitem: String;
    Fcdcntcusto: Integer;
    Fcdordserv: Integer;
    Fnusticms: string;
    Fdsinfadicional: string;
    Fnupedido: string;
    Fnustpis: string;
    Fnustcofins: string;
    Fcddigitado: string;
    Fnuplconta: string;
    Fnucotacao: string;
    Fdsobservacao: string;
    Fnucntcusto: string;
    Fcdbccalculocredito: string;
    Fnustipi: string;
    Ftsliberado: TDateTime;
    Fvfcpufdest: currency;
    Fvicmsufremet: currency;
    Fvicmsufdest: currency;
    Fpfcpufdest: double;
    Fpicmsinterpart: double;
    fvlbasedifal: currency;
    Flocacao: TLocacao;
    fvltotalcompleto: currency;
    fvlbaseicmsntributavel: currency;
    fvlbaseicmsoriginal: currency;
    fitsaidalote: TItSaidaLoteList;
  public
    property itsaidalote : TItSaidaLoteList read fitsaidalote write fitsaidalote;
    property itsaidaimportacao : TItSaidaImportacaoList read fitsaidaimportacao write fitsaidaimportacao;
    property cfop : TCFOP read fcfop write fcfop;
    property produto : tproduto read fproduto write fproduto;
    property locacao : TLocacao read Flocacao write Flocacao;
    [keyfield]
    property cditsaida : Integer read Fcditsaida write fcditsaida;
    [fk]
    property cdsaida : Integer read Fcdsaida write fcdsaida;
    [fk]
    property cdproduto : Integer read Fcdproduto write fcdproduto;
    [fk]
    property cdcntcusto : Integer read Fcdcntcusto write fcdcntcusto;
    [fk]
    property cdcfop : Integer read Fcdcfop write fcdcfop;
    [fk]
    property cdstitsaida : Integer read Fcdstitsaida write fcdstitsaida;
    [fk]
    property cdusuariol : Integer read Fcdusuariol write fcdusuariol;
    [fk]
    property cdtpgradevalor : Integer read Fcdtpgradevalor write fcdtpgradevalor;
    [fk]
    property cditpedido : Integer read Fcditpedido write fcditpedido;
    [fk]
    property cdmodbcicms : Integer read Fcdmodbcicms write fcdmodbcicms;
    [fk]
    property cdmodbcsticms : Integer read Fcdmodbcsticms write fcdmodbcsticms;
    [fk]
    property cdpedido : Integer read Fcdpedido write fcdpedido;
    [fk]
    property cdcomputadorl : Integer read Fcdcomputadorl write fcdcomputadorl;
    [fk]
    property cdmunicipio : Integer read Fcdmunicipio write fcdmunicipio;
    property nusticms : string read Fnusticms write fnusticms;
    property nustipi : string read Fnustipi write fnustipi;
    property nustpis : string read Fnustpis write fnustpis;
    property nustcofins : string read Fnustcofins write fnustcofins;
    property cdbccalculocredito : string read Fcdbccalculocredito write fcdbccalculocredito;
    [fk]
    property cdtpcomissao : Integer read Fcdtpcomissao write fcdtpcomissao;
    [fk]
    property cdtpregimeicms : Integer read Fcdtpregimeicms write fcdtpregimeicms;
    [fk]
    property cdlocacao : Integer read Fcdlocacao write fcdlocacao;
    [fk]
    property cdlocacaodevolucao : Integer read Fcdlocacaodevolucao write fcdlocacaodevolucao;
    [fk]
    property cdplconta : Integer read Fcdplconta write fcdplconta;
    [fk]
    property cdlocacaoperiodo : Integer read Fcdlocacaoperiodo write fcdlocacaoperiodo;
    property nupedido : string read Fnupedido write fnupedido;
    property cddigitado : string read Fcddigitado write fcddigitado;
    property boalteracustomedio : String read Fboalteracustomedio write fboalteracustomedio;
    property qtitem : Double read Fqtitem write fqtitem;
    property vlunitario : Double read Fvlunitario write fvlunitario;
    property vltotal : Currency read Fvltotal write fvltotal;
    property prdesconto : double read Fprdesconto write fprdesconto;
    property vldesconto : Currency read Fvldesconto write fvldesconto;
    property vloutdespesa : Currency read Fvloutdespesa write fvloutdespesa;
    property vlseguro : Currency read Fvlseguro write fvlseguro;
    property vlfrete : Currency read Fvlfrete write fvlfrete;
    property borecuperaicms : String read Fborecuperaicms write fborecuperaicms;
    property borecuperaajusteicms : String read Fborecuperaajusteicms write fborecuperaajusteicms;
    property vlbaseicms : Currency read Fvlbaseicms write fvlbaseicms;
    property alicms : Double read Falicms write falicms;
    property vlicms : Currency read Fvlicms write fvlicms;
    property alicmsred : Double read Falicmsred write falicmsred;
    property vlicmsred : Currency read Fvlicmsred write fvlicmsred;
    property vlbaseicmsred : Currency read Fvlbaseicmsred write fvlbaseicmsred;
    property prredbcicmssubtrib : Double read Fprredbcicmssubtrib write fprredbcicmssubtrib;
    property alicmssubtrib : Double read Falicmssubtrib write falicmssubtrib;
    property vlicmssubtrib : Currency read Fvlicmssubtrib write fvlicmssubtrib;
    property vlbaseicmssubtrib : Currency read Fvlbaseicmssubtrib write fvlbaseicmssubtrib;
    property borecuperaipi : String read Fborecuperaipi write fborecuperaipi;
    property vlbaseipi : Currency read Fvlbaseipi write fvlbaseipi;
    property alipi : Double read Falipi write falipi;
    property vlipi : Currency read Fvlipi write fvlipi;
    property vlbaseiss : Currency read Fvlbaseiss write fvlbaseiss;
    property aliss : Double read Faliss write faliss;
    property vliss : Currency read Fvliss write fvliss;
    property borecuperapis : String read Fborecuperapis write fborecuperapis;
    property vlbasepis : Currency read Fvlbasepis write fvlbasepis;
    property alpis : Double read Falpis write falpis;
    property vlpis : Currency read Fvlpis write fvlpis;
    property vlbasepisred : Currency read Fvlbasepisred write fvlbasepisred;
    property alpisred : Double read Falpisred write falpisred;
    property vlpisred : Currency read Fvlpisred write fvlpisred;
    property borecuperacofins : String read Fborecuperacofins write fborecuperacofins;
    property vlbasecofins : Currency read Fvlbasecofins write fvlbasecofins;
    property alcofins : Double read Falcofins write falcofins;
    property vlcofins : Currency read Fvlcofins write fvlcofins;
    property vlbasecofinsred : Currency read Fvlbasecofinsred write fvlbasecofinsred;
    property alcofinsred : Double read Falcofinsred write falcofinsred;
    property vlcofinsred : Currency read Fvlcofinsred write fvlcofinsred;
    property psliquido : Double read Fpsliquido write fpsliquido;
    property psbruto : Double read Fpsbruto write fpsbruto;
    property vlcustomedio : Currency read Fvlcustomedio write fvlcustomedio;
    property vlcusto : Currency read Fvlcusto write fvlcusto;
    property bocomissao : String read Fbocomissao write fbocomissao;
    property prcomissao : Double read Fprcomissao write fprcomissao;
    property vlcomissao : Currency read Fvlcomissao write fvlcomissao;
    property vlsaldovalor : Currency read Fvlsaldovalor write fvlsaldovalor;
    property vlirrf : Currency read Fvlirrf write fvlirrf;
    property vllucro : Currency read Fvllucro write fvllucro;
    property prmrgvladicionadoicmssubtrib : Double read Fprmrgvladicionadoicmssubtrib write fprmrgvladicionadoicmssubtrib;
    property dsinfadicional : string read Fdsinfadicional write fdsinfadicional;
    property boicmsincidesipi : String read Fboicmsincidesipi write fboicmsincidesipi;
    property boicmsred : String read Fboicmsred write fboicmsred;
    property bobaseipiajuste : String read Fbobaseipiajuste write fbobaseipiajuste;
    property alicmscredito : Double read Falicmscredito write falicmscredito;
    property vlicmscredito : Currency read Fvlicmscredito write fvlicmscredito;
    property boipibcicms : String read Fboipibcicms write fboipibcicms;
    property boicmssubtribajuste : String read Fboicmssubtribajuste write fboicmssubtribajuste;
    property boajustetotal : String read Fboajustetotal write fboajustetotal;
    property bobaseicmsajuste : String read Fbobaseicmsajuste write fbobaseicmsajuste;
    property bobasepisajuste : String read Fbobasepisajuste write fbobasepisajuste;
    property bobasecofinsajuste : String read Fbobasecofinsajuste write fbobasecofinsajuste;
    property tsliberado : TDateTime read Ftsliberado write ftsliberado;
    property nucotacao : string read Fnucotacao write fnucotacao;
    property nuitem : string read Fnuitem write fnuitem;
    property vlinss : Currency read Fvlinss write fvlinss;
    property vlbaseinss : Currency read Fvlbaseinss write fvlbaseinss;
    property alinss : Double read Falinss write falinss;
    property vlbaseirrf : currency read Fvlbaseirrf write fvlbaseirrf;
    property alirrf : Double read Falirrf write falirrf;
    property vltotaltributo : Currency read Fvltotaltributo write fvltotaltributo;
    property prtotaltributo : Double read Fprtotaltributo write fprtotaltributo;
    property nuplconta : string read Fnuplconta write fnuplconta;
    property nucntcusto : string read Fnucntcusto write fnucntcusto;
    property bobaseicmssubtribajuste : String read Fbobaseicmssubtribajuste write fbobaseicmssubtribajuste;
    property qtpeca : Double read Fqtpeca write fqtpeca;
    [fk]
    property cditordserv : Integer read Fcditordserv write fcditordserv;
    [fk]
    property cdordserv : Integer read Fcdordserv write fcdordserv;
    property nuordserv : Integer read Fnuordserv write fnuordserv;
    property dsobservacao : string read Fdsobservacao write fdsobservacao;
    property pfcpufdest : double read Fpfcpufdest write fpfcpufdest;
    property pICMSUFDest : double read fpICMSUFDest write fpICMSUFDest;
    property picmsinterpart : double read Fpicmsinterpart write fpicmsinterpart;
    property vfcpufdest : currency read Fvfcpufdest write fvfcpufdest;
    property vicmsufdest : currency read Fvicmsufdest write fvicmsufdest;
    property vicmsufremet : currency read Fvicmsufremet write fvicmsufremet;
    property vldifal : currency read fvldifal write fvldifal;
    property vlbasedifal : currency read fvlbasedifal write fvlbasedifal;
    property vlbaseicmsntributavel : currency read fvlbaseicmsntributavel write fvlbaseicmsntributavel;
    property vlbaseicmsoriginal : currency read fvlbaseicmsoriginal write fvlbaseicmsoriginal;
    property vltotalcompleto : currency read fvltotalcompleto write fvltotalcompleto;
    procedure calculardifal;
    function CalcularVlTotalTributo:Currency;
    function CalcularVlATributar:Currency;
    function ObterPrTotalTributo:Double;
    function VlTotalGeral:currency;
    constructor create;
    destructor destroy; override;
  end;
  TItsaidaList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TItsaida;
    procedure SetItem(Index: Integer; const Value: TItsaida);
  public
    procedure atualizarDifal(dataset:TDataset);
    function Excluir(boscript:boolean=false):string;
    function ObterValor(nmcampo:string):currency;
    property Items[Index: Integer]: TItsaida read GetItem write SetItem;
    function Ler(codigo:Integer):Boolean;overload;
    function Ler(Dataset: TDataset):Boolean;overload;
    function Ler(Dataset, dtsitsaidalote: TDataset):Boolean;overload;
    function Ler(sqlwhere:string):boolean;overload;
    function New: TItsaida;
    function ProcessarDifal(AlICMSInterEstadual:double):boolean;
    function PesoPreenchido:boolean;
    procedure CalcularImpostoIcmsItem;
    class procedure RecalcularBaseICMSnaoTributavel;
    function vlcomissao:Currency;
    function vllucro:Currency;
    function vltotaltributo:Currency;
    function vlservico:Currency;
    function vlproduto:Currency;
    function psbruto:Double;
    function psliquido:Double;
    function vlicms:Currency;
    function vlbaseicms:Currency;
    function vlpis:Currency;
    function vlbasepis:Currency;
    function vlcofins:Currency;
    function vlbasecofins:Currency;
    function vlicmssubtrib:Currency;
    function vlbaseicmssubtrib:Currency;
    function vlipi:Currency;
    function vlbaseipi:Currency;
    function vliss:Currency;
    function vlbaseiss:Currency;
    function vlirrf:Currency;
    function vlbaseirrf:Currency;
    function vlinss:Currency;
    function vlbaseinss:Currency;
    function ExisteCFOP(cdcfop:integer):boolean;
  end;

implementation

procedure TITSaida.calculardifal;
begin
  //vlbasedifal := vltotal + vlfrete + vloutdespesa - vldesconto + vlipi + vlseguro;
  // Raquel
  vlbasedifal := Round(pICMSUFDest/100/100);
  vlbasedifal := 1-vlbasedifal;
  vlbasedifal := vltotal * vlbasedifal+ vlipi + vloutdespesa- vldesconto+ vlfrete;
  // Afranio
  vlbasedifal := vltotal * (1-(alicms/100)) / (1 - (pICMSUFDest/100));
  // Afranio COM REDUCAO DA BASE DE CALCULO
  vlbasedifal := (vltotal- ((vltotal * alicmsred)/100));
  //vlbasedifal := vlbasedifal * (1-(alicms/100)) / (1 - (pICMSUFDest/100));
{
Base difal = Vlr produto na nfe * (1 - aliq interestadual)/(1-aliq de destino)

Difal = Base difal * Aliq Dest - ICMS DESTACADO NA nfe

2016 = 40% destino e 60% origem
}
  vFCPUFDest   := vlbasedifal * (pFCPUFDest / 100);
  vldifal      := (vlbasedifal * pICMSUFDest / 100) - vlicms;
  vICMSUFDest  := QRotinas.Roundqp(vldifal * (pICMSInterPart / 100));
  vICMSUFRemet := vldifal - vICMSUFDest;

  vlbasedifal := vltotal - (vltotal* alicmsred)/100;
  vldifal     := vlbasedifal *((pICMSUFDest-alicms)/100);
  vFCPUFDest   := vlbasedifal * (pFCPUFDest / 100);
  vICMSUFDest  := QRotinas.Roundqp(vldifal * (pICMSInterPart / 100));
  vICMSUFRemet := vldifal - vICMSUFDest;
end;

function TITSaida.CalcularVlATributar: Currency;
begin
  result := vltotal + vlipi + vloutdespesa - vldesconto + vlfrete + vlseguro + vlicmssubtrib;
end;

function TITSaida.CalcularVlTotalTributo: Currency;
begin
  result := CalcularVlATributar * prtotaltributo / 100;
end;

constructor TITSaida.create;
begin
  inherited;
  fitsaidalote := TItSaidaLoteList.Create;
  fitsaidaimportacao := titsaidaimportacaolist.create;
  fproduto := TProduto.create;
  fcfop := TCFOP.Create;
  flocacao := tlocacao.create;
end;

destructor TITSaida.destroy;
begin
  freeandnil(fitsaidalote);
  freeandnil(fitsaidaimportacao);
  freeandnil(fproduto);
  freeandnil(fcfop);
  freeandnil(flocacao);
  inherited;
end;

function TITSaida.ObterPrTotalTributo: Double;
begin
  if produto.cdproduto = 0 then
  begin
    produto.Select(cdproduto);
  end;
  result := tproduto.ObterPrtotaltributo(cdcfop, produto.nuclfiscal, produto.cdorigem);
end;

function TITSaida.VlTotalGeral: currency;
begin
  result := vltotal + vlicmssubtrib + vlipi + vlfrete - vldesconto;
end;

function TItsaidaList.vlcomissao: Currency;
var
  I: Integer;
begin
  result := 0;
  for I := 0 to count - 1 do
  begin
    result := result + Items[i].vlcomissao;
  end;
end;

function TItsaidaList.vllucro: Currency;
var
  I: Integer;
begin
  result := 0;
  for I := 0 to count - 1 do
  begin
    result := result + Items[i].vllucro;
  end;
end;

function TItsaidaList.vltotaltributo: Currency;
var
  I: Integer;
begin
  result := 0;
  for I := 0 to count - 1 do
  begin
    result := result + Items[i].vltotaltributo;
  end;
end;

function TItsaidaList.vliss: Currency;
var
  I: Integer;
begin
  result := 0;
  for I := 0 to Count - 1 do
  begin
    if Items[i].produto.tpproduto.boservico = _S then
    begin
      result := result + + Items[i].vliss;
    end;
  end;
end;

function TItsaidaList.vlbaseiss: Currency;
var
  I: Integer;
begin
  result := 0;
  for I := 0 to Count - 1 do
  begin
    if Items[i].produto.tpproduto.boservico = _S then
    begin
      result := result + + Items[i].vlbaseiss;
    end;
  end;
end;

function TItsaidaList.vlirrf: Currency;
var
  I: Integer;
begin
  result := 0;
  for I := 0 to Count - 1 do
  begin
    if Items[i].produto.tpproduto.boservico = _S then
    begin
      result := result + + Items[i].vlirrf;
    end;
  end;
end;

function TItsaidaList.vlbaseirrf: Currency;
var
  I: Integer;
begin
  result := 0;
  for I := 0 to Count - 1 do
  begin
    if Items[i].produto.tpproduto.boservico = _S then
    begin
      result := result + + Items[i].vlbaseirrf;
    end;
  end;
end;

function TItsaidaList.vlinss: Currency;
var
  I: Integer;
begin
  result := 0;
  for I := 0 to Count - 1 do
  begin
    if Items[i].produto.tpproduto.boservico = _S then
    begin
      result := result + + Items[i].vlinss;
    end;
  end;
end;

function TItsaidaList.vlbaseinss: Currency;
var
  I: Integer;
begin
  result := 0;
  for I := 0 to Count - 1 do
  begin
    if Items[i].produto.tpproduto.boservico = _S then
    begin
      result := result + + Items[i].vlbaseinss;
    end;
  end;
end;

function TItsaidaList.vlservico: Currency;
var
  I: Integer;
begin
  result := 0;
  for I := 0 to Count - 1 do
  begin
    if Items[i].produto.tpproduto.boservico = _S then
    begin
      result  := result  + Items[i].vltotal;
    end;
  end;
end;

function TItsaidaList.vlproduto: Currency;
var
  I: Integer;
begin
  result := 0;
  for I := 0 to Count - 1 do
  begin
    if Items[i].produto.tpproduto.boservico <> _S then
    begin
      result  := result  + Items[i].vltotal;
    end;
  end;
end;

function titsaidalist.psbruto:Double;
var
  I: Integer;
begin
  result := 0;
  for I := 0 to Count - 1 do
  begin
    if Items[i].produto.tpproduto.boservico <> _S then
    begin
      result := result + Items[i].psbruto;
    end;
  end;
end;
function titsaidalist.psliquido:Double;
var
  I: Integer;
begin
  result := 0;
  for I := 0 to Count - 1 do
  begin
    if Items[i].produto.tpproduto.boservico <> _S then
    begin
      result := result + Items[i].psliquido;
    end;
  end;
end;

function titsaidalist.vlicms:Currency;
var
  I: Integer;
begin
  result := 0;
  for I := 0 to Count - 1 do
  begin
    if Items[i].produto.tpproduto.boservico <> _S then
    begin
      result := result + Items[i].vlicms;
    end;
  end;
end;

function titsaidalist.vlbaseicms:Currency;
var
  I: Integer;
begin
  result := 0;
  for I := 0 to Count - 1 do
  begin
    if Items[i].produto.tpproduto.boservico <> _S then
    begin
      result := result + Items[i].vlbaseicms;
    end;
  end;
end;

function titsaidalist.vlpis:Currency;
var
  I: Integer;
begin
  result := 0;
  for I := 0 to Count - 1 do
  begin
    result := result + Items[i].vlpis;
  end;
end;

function titsaidalist.vlbasepis:Currency;
var
  I: Integer;
begin
  result := 0;
  for I := 0 to Count - 1 do
  begin
    result := result + Items[i].vlbasepis;
  end;
end;

function titsaidalist.vlcofins:Currency;
var
  I: Integer;
begin
  result := 0;
  for I := 0 to Count - 1 do
  begin
    result := result + Items[i].vlcofins;
  end;
end;

function titsaidalist.vlbasecofins:Currency;
var
  I: Integer;
begin
  result := 0;
  for I := 0 to Count - 1 do
  begin
    result := result + Items[i].vlbasecofins;
  end;
end;

function titsaidalist.vlicmssubtrib:Currency;
var
  I: Integer;
begin
  result := 0;
  for I := 0 to Count - 1 do
  begin
    if Items[i].produto.tpproduto.boservico <> _S then
    begin
      result := result + Items[i].vlicmssubtrib;
    end;
  end;
end;

function titsaidalist.vlbaseicmssubtrib:Currency;
var
  I: Integer;
begin
  result := 0;
  for I := 0 to Count - 1 do
  begin
    if Items[i].produto.tpproduto.boservico <> _S then
    begin
      result := result + Items[i].vlbaseicmssubtrib;
    end;
  end;
end;

function titsaidalist.vlipi:Currency;
var
  I: Integer;
begin
  result := 0;
  for I := 0 to Count - 1 do
  begin
    if Items[i].produto.tpproduto.boservico <> _S then
    begin
      result := result + Items[i].vlipi;
    end;
  end;
end;

function titsaidalist.vlbaseipi:Currency;
var
  I: Integer;
begin
  result := 0;
  for I := 0 to Count - 1 do
  begin
    if Items[i].produto.tpproduto.boservico <> _S then
    begin
      result := result + Items[i].vlbaseipi;
    end;
  end;
end;

procedure TItsaidaList.atualizarDifal(dataset: TDataset);
var
  I: Integer;
begin
  for I := 0 to count -1 do
  begin
    if dataset.Locate(_cditsaida, items[i].cditsaida, []) then
    begin
      dataset.Edit;
      dataset.FieldByName(_vldifal).AsCurrency      := items[i].vldifal;
      dataset.FieldByName(_vlbasedifal).AsCurrency  := items[i].vlbasedifal;
      dataset.FieldByName(_pICMSInterPart).AsFloat  := items[i].pICMSInterPart;
      dataset.FieldByName(_vFCPUFDest).AsCurrency   := items[i].vFCPUFDest;
      dataset.FieldByName(_vICMSUFDest).AsCurrency  := items[i].vICMSUFDest;
      dataset.FieldByName(_vICMSUFRemet).AsCurrency := items[i].vICMSUFRemet;
      dataset.Post;
    end;
  end;
end;

procedure TItsaidaList.CalcularImpostoIcmsItem;
var
  vlbaseicms : Currency;
  I: Integer;
  q : TClasseQuery;
  pg : tfrmprogressbar;
begin
  pg := tfrmprogressbar.Create(nil);
  try
    pg.gau.MaxValue := count;
    pg.Show;
    for I := 0 to count-1 do
    begin
      pg.gau.Progress := i + 1;
      pg.pnl.Caption := 'Recalculando Base ICMS não tributável - Nota Fiscal - Registro '+pg.gau.Progress.ToString+' de '+pg.gau.MaxValue.ToString;
      application.ProcessMessages;
      q := tclassequery.create('select tpsaida.boicms,tpsaida.boarredondar '+
                               'from saida '+
                               'inner join tpsaida on tpsaida.cdtpsaida=saida.cdtpsaida and tpsaida.cdempresa=saida.cdempresa '+
                               'where saida.cdempresa='+items[i].cdempresa.ToString+' and saida.cdsaida='+items[i].cdsaida.ToString);
      try
        if (q.q.FieldByName(_boicms).asstring <> _s) or (items[i].alicms <= 0) or (items[i].cdtpregimeicms = 2) then
        begin
          items[i].vlbaseicmsoriginal := 0;
          items[i].vlbaseicmsntributavel := 0;
        end
        else
        begin
          vlbaseicms := items[i].vltotal - items[i].vldesconto + items[i].vlseguro + items[i].vlfrete + items[i].vloutdespesa;
          if items[i].boipibcicms = _S then
          begin
            vlbaseicms := vlbaseicms + items[i].vlipi;
          end;
          vlbaseicms := QRotinas.Roundqp(vlbaseicms, q.q.FieldByName(_boarredondar).AsString = _s);
          items[i].vlbaseicmsoriginal := vlbaseicms;
          items[i].vlbaseicmsntributavel := items[i].vlbaseicmsoriginal - items[i].vlbaseicms;
        end;
      finally
        freeandnil(q);
      end;
      items[i].update;
    end;
  finally
    freeandnil(pg);
  end;
end;

function TItsaidaList.Excluir(boscript: boolean): string;
var
  I: Integer;
begin
  result := '';
  for I := 0 to count - 1 do
  begin
    if result <> '' then
    begin
      result := result + #13;
    end;
    result := result + items[i].Delete(boscript);
  end;
end;

function TItsaidaList.ExisteCFOP(cdcfop: integer): boolean;
var
  I: Integer;
begin
  result := false;
  for I := 0 to count - 1 do
  begin
    result := cdcfop = items[i].cdcfop;
    if result then
    begin
      break;
    end;
  end;
end;

function TItsaidaList.GetItem(Index: Integer): TItsaida;
begin
  Result := TItsaida(Inherited Items[Index]);
end;

function TItsaidaList.Ler(sqlwhere: string): boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_where(_itsaida, sqlwhere));
  try
    result := Ler(q.q);
  finally
    freeandnil(q);
  end;
end;

function TItsaidaList.Ler(Dataset, dtsitsaidalote: TDataset): Boolean;
begin
  clear;
  result := False;
  dataset.First;
  while not dataset.Eof do
  begin
    with New do
    begin
      select(dataset);
      itsaidalote.Ler(dtsitsaidalote);
      produto.tpproduto.boservico := Dataset.FieldByName(_boservico).AsString;
    end;
    dataset.Next;
    result := True;
  end;
end;

function TItsaidaList.Ler(codigo: Integer): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_itsaida, codigo, _cdsaida));
  try
    clear;
    result := q.q.RecordCount > 0;
    if not result then
    begin
      Exit;
    end;
    while not q.q.Eof do
    begin
      new.select(q.q);
      q.q.Next;
    end;
  finally
    freeandnil(q);
  end;
end;

function TItsaidaList.Ler(Dataset: TDataset): Boolean;
begin
  clear;
  result := False;
  dataset.First;
  while not dataset.Eof do
  begin
    new.select(dataset);
    dataset.Next;
    result := True;
  end;
end;

function TItsaidaList.New: TItsaida;
begin
  Result := TItsaida.Create;
  Add(Result);
end;

function TItsaidaList.ObterValor(nmcampo: string): currency;
var
  I: Integer;
begin
  result := 0;
  for I := 0 to count - 1 do
  begin
    if nmcampo = _vltotal then
    begin
      result := result + items[i].vltotal;
    end
    else if nmcampo = _vfcpufdest then
    begin
      result := result + items[i].vFCPUFDest;
    end
    else if nmcampo = _vicmsufdest then
    begin
      result := result + items[i].vicmsufdest;
    end
    else if nmcampo = _vicmsufremet then
    begin
      result := result + items[i].vicmsufremet;
    end
    else if nmcampo = _vlproduto then
    begin
      if items[i].produto.cdproduto = 0 then
      begin
        items[i].produto.Select(items[i].cdproduto);
      end;
      if items[i].produto.tpproduto.cdtpproduto = 0 then
      begin
        items[i].produto.tpproduto.Select(items[i].produto.cdtpproduto);
      end;
      if items[i].produto.tpproduto.boservico <> _s then
      begin
        result := result + items[i].vltotal;
      end;
    end
    else if nmcampo = _vlservico then
    begin
      if items[i].produto.cdproduto = 0 then
      begin
        items[i].produto.Select(items[i].cdproduto);
      end;
      if items[i].produto.tpproduto.cdtpproduto = 0 then
      begin
        items[i].produto.tpproduto.Select(items[i].produto.cdtpproduto);
      end;
      if items[i].produto.tpproduto.boservico = _s then
      begin
        result := result + items[i].vltotal;
      end;
    end;
  end;
end;

function TItsaidaList.PesoPreenchido: boolean;
var
  I: Integer;
begin
  result := true;
  for I := 0 to count - 1 do
  begin
    if (items[i].psliquido = 0) or (items[i].psbruto = 0) then
    begin
      result := false;
      break;
    end;
  end;
end;

function TItsaidaList.ProcessarDifal(AlICMSInterEstadual: double):boolean;
var
  i: Integer;
  mensagemerro: TStrings;
  mensagemerro2: TStrings;
begin
  mensagemerro := TStringlist.create;
  mensagemerro2 := TStringlist.create;
  try
    for i := 0 to count - 1 do
    begin
      //if (items[i].cdcfop = 6101) or (items[i].cdcfop = 6403) or (items[i].cdcfop = 6201) or (items[i].cdcfop = 6107) or (items[i].cdcfop = 6949) or (items[i].cdcfop = 6108) then
      if items[i].cfop.cdcfop <> items[i].cdcfop then
      begin
        items[i].cfop.select(items[i].cdcfop);
      end;
      if items[i].cfop.bodifal = _s then
      begin
        //if items[i].pfcpufdest = 0 then
        //begin
          //if mensagemerro.count = 0 then
          //begin
            //mensagemerro.add('Não foi preenchido % de fundo de combate a probreza no(s) produto(s)');
          //end;
          //mensagemerro.add(items[i].cddigitado+' - '+qregistro.NomedoCodigo(_produto, items[i].cdproduto)+' - '+floattostr(items[i].qtitem));
        //end;
        if items[i].pICMSUFDest = 0 then
        begin
          if mensagemerro2.count = 0 then
          begin
            mensagemerro2.add('Não foi preenchido % de ICMS do Destino no(s) produto(s)');
          end;
          mensagemerro2.add(items[i].cddigitado+' - '+qregistro.NomedoCodigo(_produto, items[i].cdproduto));
        end;
        //items[i].pICMSInterPart := 40; => 2016
        items[i].pICMSInterPart := 60; // => 2017
        //items[i].pICMSInterPart := 80; // => 2018
        //items[i].pICMSInterPart := 100; // => 2019
        items[i].calculardifal;
      end;
    end;
    if mensagemerro.Count > 0 then
    begin
      messagedlg(mensagemerro.text, mtinformation, [mbok], 0);
    end;
    if mensagemerro2.Count > 0 then
    begin
      messagedlg(mensagemerro2.text, mtinformation, [mbok], 0);
      abort;
    end;
    result := true;
  finally
    freeandnil(mensagemerro);
    freeandnil(mensagemerro2);
  end;
end;

class procedure TItsaidaList.RecalcularBaseICMSnaoTributavel;
var
  itsaida : titsaidalist;
begin
  itsaida := titsaidalist.Create;
  try
    itsaida.Ler(_alicmsred+'>'+_0);
    itsaida.CalcularImpostoIcmsItem;
  finally
    freeandnil(itsaida);
  end;
end;

procedure TItsaidaList.SetItem(Index: Integer; const Value: TItsaida);
begin
  Put(Index, Value);
end;

end.
