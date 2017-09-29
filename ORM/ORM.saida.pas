﻿unit ORM.saida;

interface

uses
  System.Actions, System.UITypes, System.Math,
  forms, windows, SysUtils, classes, dialogs, controls, StdCtrls, Contnrs,
  DB,
  pcnConversao, ACBrNFe,
  dialogo.ProgressBar, rotina.montarsql, rotina.strings, uconstantes,
  rotina.numero, rotina.registro, dialogo.SelecionarEntrada, localizar.pedido, uDtmMain,
  ulocalizar, urichedit, rotina.datahora, rotina.rotinas, orm.UFOrigemDestino,

  orm.locacao, orm.empresa, orm.produto, orm.locacaodevolucao,
  classe.form, rotina.retornasql, classe.gerar, classe.executasql, classe.query, classe.aplicacao,
  classe.dao, classe.registrainformacao,
  orm.usuario, orm.movto, orm.duplicata, orm.cliente, orm.fornecedor, orm.transportadora, orm.CFOP, orm.uf,
  classe.livrofiscal, orm.condpagto,
  orm.CartaCorrecao, orm.ITSaida,
  orm.SaidaReferenciada, orm.Itsaidafretesub, orm.TpSaida, orm.Serie;

type
  TSaida = class(TRegistroQuipos)
  private
    fvfcpufdest: currency;
    fvicmsufremet: currency;
    fvicmsufdest: currency;
    fSaidaReferenciada: TSaidaReferenciadaList;
    fboconsumidorfinal: String;
    fcdindpres : string;
    fuf: tuf;
    fufsaida: tuf;
    fufembarque: tuf;
    ACBrNFe: TACBrNFe;
    Ftpsaida: TTpSaida;
    Fboretencaocofins: String;
    Fboimportacao: String;
    Fboenviado: String;
    Fboimpressa: String;
    Fboexportado: String;
    Fboretencaocontribsocial: String;
    Fboretencaoiss: String;
    Fboretencaopis: String;
    Fboretencaoirrf: String;
    Fbodescontocomissao: String;
    Fboretencaoinss: String;
    Fvlpissubtrib: Currency;
    Fvltotal: Currency;
    Fvlbaseicmssubtrib: Currency;
    Fvllucro: Currency;
    Fvlbaseiss: Currency;
    Fvlicmssubtrib: Currency;
    Fvlservico: Currency;
    Fvlcofinssubtrib: Currency;
    Fvltotaltributo: Currency;
    Fvlicms: Currency;
    Fvlbasecofins: Currency;
    Fvlseguro: Currency;
    Fvlfretesub: Currency;
    Fvlbasepis: Currency;
    Fvloutipi: Currency;
    Fvlbaseinss: Currency;
    Fvlouticms: Currency;
    Fvlbasecontribsocial: Currency;
    Fvlicmsred: Currency;
    Fvlproduto: Currency;
    Fvlicmssfrete: Currency;
    Fvlfrete: Currency;
    Fvlcofins: Currency;
    Fvlbasepissubtrib: Currency;
    Fvlbaseipi: Currency;
    Fvlbaseicmsred: Currency;
    Fvldesconto: Currency;
    Fvlbaseicms: Currency;
    Fvlpis: currency;
    Fvlii: Currency;
    Fvloutdespesa: Currency;
    Fvliss: Currency;
    Fvlbaseirrf: Currency;
    Fvlliquido: Currency;
    Fvlcomissao: currency;
    Fvlirrf: Currency;
    Fvlbasefretesub: Currency;
    Fvlliqsdesc: Currency;
    Fvlisentaicms: Currency;
    Fvlbasecofinssubtrib: Currency;
    Fvlinss: Currency;
    Fvlcontribsocial: Currency;
    Fvlisentaipi: Currency;
    Fvlipi: Currency;
    Fvlipisfrete: Currency;
    Fpsliquido: Double;
    Fprcomissao: Double;
    Falinss: Double;
    Falfretesub: Double;
    Falpissubtrib: Double;
    Fprtotaltributo: Double;
    Falcontribsocial: Double;
    Falirrf: Double;
    Fpsbruto: Double;
    Falcofinssubtrib: Double;
    Fprdesconto: Double;
    Fcdtpfrete: String;
    Fcdtransporte: Integer;
    Fnusaida: Integer;
    Fcdsaida: Integer;
    Fcdufembarque: Integer;
    Fcdtpsaida: Integer;
    Fcdordserv: Integer;
    Fnseqevento: Integer;
    Fcdtpcobranca: Integer;
    Fcdtpformaemissaonfe: Integer;
    Fcdentrada: Integer;
    Fnulote: Integer;
    Fnucaixa: Integer;
    Fcdcfop: Integer;
    Fcdnfefinalidade: Integer;
    Fqtvolume: Integer;
    Fcdufsaida: Integer;
    Fcdtpsaidaecf: Integer;
    Fcdrepresentante: Integer;
    Fnucupom: integer;
    Fcdserie: Integer;
    Fcdcondpagto: Integer;
    Fcdsaidadevolucao: Integer;
    Fcnf: Integer;
    Fcdplconta: Integer;
    Fcduf: Integer;
    Fcdufocorrencia: Integer;
    Fnuplaca: string;
    Fdsespecie: string;
    Fnuvolume: string;
    Fnmredespacho: string;
    Fnuchavenfse: string;
    Ftpimp: string;
    Fprocemi: string;
    Fdsmarca: string;
    Fdscancelamento: string;
    Fnurecibonfe: string;
    Ftpemis: string;
    Fdsxmlcancel: string;
    Ftpdevolucao: string;
    Fdslocalexporta: string;
    Fnuplconta: string;
    Fdshistorico: string;
    Ftpamb: string;
    Fnudocfiscalicms: string;
    Fdslocalembarque: string;
    Fnuchavenfe: string;
    Fcdfornecedor: LargeInt;
    Fdsobservacao: string;
    Ftpentsai: string;
    Fcdv: string;
    Fdslocaldespacho: string;
    Ffinnfe: string;
    Fnustdocumento: string;
    Fnuprotocoloinutilizacao: string;
    Fnuprotocolocancelamento: string;
    Fcdcliente: LargeInt;
    Fdsxml: string;
    Fnuprotocoloautorizacao: string;
    Fnuprotocolodenegacao: string;
    Findpag: string;
    Fcdtransportadora: LargeInt;
    Fdtsaida: TDate;
    Fdtemissao: TDate;
    Fdtreferencia: TDate;
    Fhrsaida: TTime;
    Ftsprotocoloautorizacao: TDateTime;
    fitsaida: TItsaidaList;
    Fitsaidafretesub: TItsaidafretesub;
    fduplicata: TDuplicataList;
    fcliente: TCliente;
    ffornecedor: TFornecedor;
    ftransportadora: TTransportadora;
    fserie: TSerie;
    fcfop: TCFOP;
    fbooutdespesaitem: String;
    Fcartacorrecao: TCartaCorrecaoList;
    Fcondpagto: TCondpagto;
    fboitemdesconto: string;
    fborateiocntcusto: string;
    fborateioplconta: string;
    fnucntcusto: string;
    fcdcntcusto: integer;
    fcdrateiocntcusto: integer;
    fcdrateioplconta: Integer;
  public
    property uf : tuf read fuf write fuf;
    property ufembarque : tuf read fufembarque write fufembarque;
    property ufsaida : tuf read fufsaida write fufsaida;
    property cfop : TCFOP read fcfop write fcfop;
    property serie : TSerie read fserie write fserie;
    property transportadora : TTransportadora read ftransportadora write ftransportadora;
    property cliente : TCliente read fcliente write fcliente;
    property fornecedor : TFornecedor read ffornecedor write ffornecedor;
    property duplicata : TDuplicataList read fduplicata write fduplicata;
    property itsaida : TItsaidaList read fitsaida write fitsaida;
    property SaidaReferenciada : TSaidaReferenciadaList read fSaidaReferenciada write fSaidaReferenciada;
    property itsaidafretesub : TItsaidafretesub read Fitsaidafretesub write Fitsaidafretesub;
    property cartacorrecao : TCartaCorrecaoList read Fcartacorrecao write Fcartacorrecao;
    property condpagto : TCondpagto read Fcondpagto write Fcondpagto;
    [keyfield]
    property cdsaida : Integer read Fcdsaida write fcdsaida;
    property boconsumidorfinal : String read fboconsumidorfinal write fboconsumidorfinal;
    property cdindpres : string read fcdindpres write fcdindpres;
    [fk]
    property cdtpsaida : Integer read Fcdtpsaida write fcdtpsaida;
    [fk]
    property cdtransportadora : LargeInt read Fcdtransportadora write fcdtransportadora;
    [fk]
    property cdrepresentante : Integer read Fcdrepresentante write fcdrepresentante;
    [fk]
    property cduf : Integer read Fcduf write fcduf;
    [fk]
    property cdserie : Integer read Fcdserie write fcdserie;
    [fk]
    property cdcfop : Integer read Fcdcfop write fcdcfop;
    [fk]
    property cdfornecedor : LargeInt read Fcdfornecedor write fcdfornecedor;
    [fk]
    property cdcondpagto : Integer read Fcdcondpagto write fcdcondpagto;
    [fk]
    property cdcliente : LargeInt read Fcdcliente write fcdcliente;
    [fk]
    property cdtransporte : Integer read Fcdtransporte write fcdtransporte;
    [fk]
    property cdtpcobranca : Integer read Fcdtpcobranca write fcdtpcobranca;
    [fk]
    property cdtpsaidaecf : Integer read Fcdtpsaidaecf write fcdtpsaidaecf;
    [fk]
    property cdordserv : Integer read Fcdordserv write fcdordserv;
    [fk]
    property cdplconta : Integer read Fcdplconta write fcdplconta;
    [fk]
    property cdnfefinalidade : Integer read Fcdnfefinalidade write fcdnfefinalidade;
    [fk]
    property cdtpfrete : String read Fcdtpfrete write fcdtpfrete;
    [fk]
    property nudocfiscalicms : string read Fnudocfiscalicms write fnudocfiscalicms;
    [fk]
    property nustdocumento : string read Fnustdocumento write fnustdocumento;
    [fk]
    property cdufocorrencia : Integer read Fcdufocorrencia write fcdufocorrencia;
    [fk]
    property cdtpformaemissaonfe : Integer read Fcdtpformaemissaonfe write fcdtpformaemissaonfe;
    [FK]
    property cdrateiocntcusto: integer read fcdrateiocntcusto write fcdrateiocntcusto;
    [FK]
    property cdrateioplconta: Integer read fcdrateioplconta write fcdrateioplconta;
    property nusaida : Integer read Fnusaida write fnusaida;
    property tpentsai : string read Ftpentsai write ftpentsai;
    property dtemissao : TDate read Fdtemissao write fdtemissao;
    property vltotal : Currency read Fvltotal write fvltotal;
    property vlliquido : Currency read Fvlliquido write fvlliquido;
    property vlliqsdesc : Currency read Fvlliqsdesc write fvlliqsdesc;
    property prcomissao : Double read Fprcomissao write fprcomissao;
    property vlcomissao : currency read Fvlcomissao write fvlcomissao;
    property prdesconto : Double read Fprdesconto write fprdesconto;
    property vldesconto : Currency read Fvldesconto write fvldesconto;
    property vlseguro : Currency read Fvlseguro write fvlseguro;
    property vloutdespesa : Currency read Fvloutdespesa write fvloutdespesa;
    property vlfrete : Currency read Fvlfrete write fvlfrete;
    property vlbaseipi : Currency read Fvlbaseipi write fvlbaseipi;
    property vlipi : Currency read Fvlipi write fvlipi;
    property vlisentaipi : Currency read Fvlisentaipi write fvlisentaipi;
    property vloutipi : Currency read Fvloutipi write fvloutipi;
    property vlipisfrete : Currency read Fvlipisfrete write fvlipisfrete;
    property vlicmssubtrib : Currency read Fvlicmssubtrib write fvlicmssubtrib;
    property vlbaseicmssubtrib : Currency read Fvlbaseicmssubtrib write fvlbaseicmssubtrib;
    property vlbaseicms : Currency read Fvlbaseicms write fvlbaseicms;
    property vlicms : Currency read Fvlicms write fvlicms;
    property vlisentaicms : Currency read Fvlisentaicms write fvlisentaicms;
    property vlouticms : Currency read Fvlouticms write fvlouticms;
    property vlicmsred : Currency read Fvlicmsred write fvlicmsred;
    property vlbaseicmsred : Currency read Fvlbaseicmsred write fvlbaseicmsred;
    property vlicmssfrete : Currency read Fvlicmssfrete write fvlicmssfrete;
    property vlbaseiss : Currency read Fvlbaseiss write fvlbaseiss;
    property vliss : Currency read Fvliss write fvliss;
    property vlbasepis : Currency read Fvlbasepis write fvlbasepis;
    property vlpis : currency read Fvlpis write fvlpis;
    property vlbasecofins : Currency read Fvlbasecofins write fvlbasecofins;
    property vlcofins : Currency read Fvlcofins write fvlcofins;
    property psliquido : Double read Fpsliquido write fpsliquido;
    property psbruto : Double read Fpsbruto write fpsbruto;
    property hrsaida : TTime read Fhrsaida write fhrsaida;
    property dtsaida : TDate read Fdtsaida write fdtsaida;
    property nuplaca : string read Fnuplaca write fnuplaca;
    property vlproduto : Currency read Fvlproduto write fvlproduto;
    property vlservico : Currency read Fvlservico write fvlservico;
    property dsobservacao : string read Fdsobservacao write fdsobservacao;
    property boimpressa : String read Fboimpressa write fboimpressa;
    property boexportado : String read Fboexportado write fboexportado;
    property bodescontocomissao : String read Fbodescontocomissao write fbodescontocomissao;
    property nucaixa : Integer read Fnucaixa write fnucaixa;
    property nucupom : integer read Fnucupom write fnucupom;
    property dshistorico : string read Fdshistorico write fdshistorico;
    property vlfretesub : Currency read Fvlfretesub write fvlfretesub;
    property vllucro : Currency read Fvllucro write fvllucro;
    property alirrf : Double read Falirrf write falirrf;
    property vlirrf : Currency read Fvlirrf write fvlirrf;
    property nuplconta : string read Fnuplconta write fnuplconta;
    property dsxml : string read Fdsxml write fdsxml;
    property vlbasefretesub : Currency read Fvlbasefretesub write fvlbasefretesub;
    property alfretesub : Double read Falfretesub write falfretesub;
    property dsxmlcancel : string read Fdsxmlcancel write fdsxmlcancel;
    property nuchavenfe : string read Fnuchavenfe write fnuchavenfe;
    property boenviado : String read Fboenviado write fboenviado;
    property dsmarca : string read Fdsmarca write fdsmarca;
    property dsespecie : string read Fdsespecie write fdsespecie;
    property vlpissubtrib : Currency read Fvlpissubtrib write fvlpissubtrib;
    property vlcofinssubtrib : Currency read Fvlcofinssubtrib write fvlcofinssubtrib;
    property vlbasepissubtrib : Currency read Fvlbasepissubtrib write fvlbasepissubtrib;
    property alpissubtrib : Double read Falpissubtrib write falpissubtrib;
    property vlbasecofinssubtrib : Currency read Fvlbasecofinssubtrib write fvlbasecofinssubtrib;
    property alcofinssubtrib : Double read Falcofinssubtrib write falcofinssubtrib;
    property boretencaopis : String read Fboretencaopis write fboretencaopis;
    property boretencaocofins : String read Fboretencaocofins write fboretencaocofins;
    property boretencaoinss : String read Fboretencaoinss write fboretencaoinss;
    property boretencaocontribsocial : String read Fboretencaocontribsocial write fboretencaocontribsocial;
    property vlbaseinss : Currency read Fvlbaseinss write fvlbaseinss;
    property alinss : Double read Falinss write falinss;
    property vlinss : Currency read Fvlinss write fvlinss;
    property vlbasecontribsocial : Currency read Fvlbasecontribsocial write fvlbasecontribsocial;
    property alcontribsocial : Double read Falcontribsocial write falcontribsocial;
    property vlcontribsocial : Currency read Fvlcontribsocial write fvlcontribsocial;
    property vlbaseirrf : Currency read Fvlbaseirrf write fvlbaseirrf;
    property boretencaoirrf : String read Fboretencaoirrf write fboretencaoirrf;
    property boretencaoiss : String read Fboretencaoiss write fboretencaoiss;
    property boimportacao : String read Fboimportacao write fboimportacao;
    property cnf : Integer read Fcnf write fcnf;
    property indpag : string read Findpag write findpag;
    property tpimp : string read Ftpimp write ftpimp;
    property tpemis : string read Ftpemis write ftpemis;
    property tpamb : string read Ftpamb write ftpamb;
    property procemi : string read Fprocemi write fprocemi;
    property cdv : string read Fcdv write fcdv;
    property finnfe : string read Ffinnfe write ffinnfe;
    property nurecibonfe : string read Fnurecibonfe write fnurecibonfe;
    property nuprotocoloautorizacao : string read Fnuprotocoloautorizacao write fnuprotocoloautorizacao;
    property nuprotocolodenegacao : string read Fnuprotocolodenegacao write fnuprotocolodenegacao;
    property nuprotocolocancelamento : string read Fnuprotocolocancelamento write fnuprotocolocancelamento;
    property nuprotocoloinutilizacao : string read Fnuprotocoloinutilizacao write fnuprotocoloinutilizacao;
    property dscancelamento : string read Fdscancelamento write fdscancelamento;
    property nulote : Integer read Fnulote write fnulote;
    property qtvolume : Integer read Fqtvolume write fqtvolume;
    property nuvolume : string read Fnuvolume write fnuvolume;
    property nuchavenfse : string read Fnuchavenfse write fnuchavenfse;
    property nseqevento : Integer read Fnseqevento write fnseqevento;
    property vlii : Currency read Fvlii write fvlii;
    property dtreferencia : TDate read Fdtreferencia write fdtreferencia;
    property vltotaltributo : Currency read Fvltotaltributo write fvltotaltributo;
    property prtotaltributo : Double read Fprtotaltributo write fprtotaltributo;
    property nmredespacho : string read Fnmredespacho write fnmredespacho;
    property tsprotocoloautorizacao : TDateTime read Ftsprotocoloautorizacao write ftsprotocoloautorizacao;
    [fk]
    property cdentrada : Integer read Fcdentrada write fcdentrada;
    [fk]
    property cdsaidadevolucao : Integer read Fcdsaidadevolucao write fcdsaidadevolucao;
    property tpdevolucao : string read Ftpdevolucao write ftpdevolucao;
    [fk]
    property cdufembarque : Integer read Fcdufembarque write fcdufembarque;
    property dslocalembarque : string read Fdslocalembarque write fdslocalembarque;
    [fk]
    property cdufsaida : Integer read Fcdufsaida write fcdufsaida;
    property dslocalexporta : string read Fdslocalexporta write fdslocalexporta;
    property dslocaldespacho : string read Fdslocaldespacho write fdslocaldespacho;
    property tpsaida : TTpSaida read Ftpsaida write Ftpsaida;
    property vfcpufdest : currency read fvfcpufdest write fvfcpufdest;
    property vicmsufdest : currency read fvicmsufdest write fvicmsufdest;
    property vicmsufremet : currency read fvicmsufremet write fvicmsufremet;
    property booutdespesaitem : String read fbooutdespesaitem write fbooutdespesaitem;
    property boitemdesconto : string read fboitemdesconto write fboitemdesconto;
    property borateiocntcusto : string read fborateiocntcusto write fborateiocntcusto;
    property borateioplconta : string read fborateioplconta write fborateioplconta;
    [fk]
    property cdcntcusto : integer read fcdcntcusto write fcdcntcusto;
    property nucntcusto : string read fnucntcusto write fnucntcusto;
    constructor create;
    destructor destroy; override;
    function CancelarNF(cdsaida:string; nustdocumento_:string; nuchave:string=''):boolean;
    function carregarxml(xml:string): Boolean;
    function Copiar:integer;
    function EntradaProdutoData(dti, dtf: TDate; nudias: Integer): boolean;
    function EntradaProduto(cdsaida:string; nudias: Integer=0):boolean;
    function EntradaEstoqueNotaFazParteLivroProducao(codigo:string):Boolean;
    function ExistebaixaDuplicata(cdsaida:string):boolean;
    function exportarpdf(path:string; dti, dtf:TDate; cdcliente:string=''):Boolean;overload;
    function Exportarpdf(path:string; lista:TStrings):Boolean;overload;
    function Exportarxml(path:string; lista:TStrings):Boolean;
    function gerar_devolucao_simples(cdentrada, cdtpsaida, cdcfop:integer):Integer;
    function gerarfretesub(cdsaida: integer; alicmssubtrib: Double; dtemissao: TDate):string;
    function ObterTpComissao(cdtpcomissaoproduto, cdrepresentante:string):string;
    function ImprimirDanfe(cdsaida: string; boshowdialog:Boolean=True; bomostrarview:Boolean=true): Boolean;
    function NotaFiscalFazParteLivroProducao(codigo:string):boolean;
    function RecalcularComissao(dti, dtf: TDate):boolean;
    function RecalcularPisCofins(dti, dtf: TDate):Boolean;
    procedure set_serie_tpsaida_forma_emissao(formaemissao: TpcnTipoEmissao);
    function aNotaEDifal:boolean;
    function getAlICMSInterEstadual:double;
    function dtemissaoVazia:boolean;
    function dtemissaoMaiorLivroFiscal:boolean;
    function dtemissaoAcimaMesAtual:boolean;
    function dtsaidaMenorDtemissao:boolean;
    function ConsistirCFOPDestinatario:string;
    function GetSGUFDestinatario:string;
    function DuplicidadeNotaFiscal:boolean;
    function InserirTudo(boscript:boolean):string;
    procedure Salvar;
    procedure DistribuicaoDescontoItem;
    procedure DistribuicaoFreteItem;
    procedure distribuicaooutdespesaitem;
    procedure CalcularValoresItem;
    procedure AtribuicaoValorImposto;
    procedure calcular_retencao_valor_liquido;
    function  get_total_qtitem:Double;
    procedure DistribuicaoPesoItem;
    function  GerarDuplicata:Boolean;
    procedure DistribuicaoComissaoDuplicata;
    procedure gravartotais;
    procedure ZerarCamposNFE;
    procedure VerifidarFinalidadeDevolucao;
    class function VerificarNFEEnviadaSemChave(dti: TDate=0; dtf:TDate=0):boolean;
    class function VerificarNFENaoEnviada(dti: TDate=0; dtf:TDate=0):boolean;
    class function Imprimir(cdsaida:string):boolean;overload;
    class function CodigoNotaFiscal (nusaida:string):integer;overload;
    class function CodigoNotaFiscal (nusaida, cdserie: integer):integer;overload;
    function CfopCabecalhoInexistenteNosItens:boolean;
    function ExibirNUCLFISCAL:Boolean;
  end;
  TSaidaList = class(TObjectList)
  private
    function  GetItem(Index: Integer): Tsaida;
    procedure SetItem(Index: Integer; const Value: Tsaida);
  public
    property Items[Index: Integer]: Tsaida read GetItem write SetItem;
    function Ler(Dataset: TDataset):Boolean;overload;
    function Ler(sqlwhere:string):boolean;overload;
    function New: Tsaida;
    function indice(value:Integer):Integer;
    class function GerarContasAReceber(dti, dtf:TDate):Boolean;
  end;
  TTelaSaida = class
  protected
    Ftela: TSaida;
    Fdados: TSaida;
    procedure setStatusLocacao;
    procedure setStatusOrdproducao;
  public
    property dados : TSaida read Fdados write Fdados;
    property tela : TSaida read Ftela write Ftela;
    constructor create;
    destructor destroy; override;
    function getLocacaoPosterior: string;
    procedure salvar;
    procedure excluir;
  end;

implementation

uses Localizar.Produto,
  dialogo.RichEdit,
  ACBrNFeNotasFiscais,
  Impressao.relatoriopadrao,
  acbr.nfereport,
  Recalcular.Comissao,
  Recalculo.SaldoConta,
  Recalcular.PisCofins, orm.regrast, orm.ordproducao;

class function TSaida.Imprimir(cdsaida:string):boolean;
begin
  if not codigoexiste(_saida, cdsaida) then
  begin
    result := false;
    exit;
  end;
  ImpimirRelatorioPadrao1(325, cdsaida);
  result := true;
end;

function TSaida.gerarfretesub(cdsaida: integer; alicmssubtrib:Double; dtemissao: TDate):string;
var
  q : TClasseQuery;
  boexiste : Boolean;
begin
  result := '';
  if tpsaida.bocalcularfretesub <> _s then
  begin
    exit;
  end;
  if alicmssubtrib = 0 then
  begin
    messagedlg('Aliquota de ICMS de Sub Trib não foi preenchido.'#13+
               'Para gerar a nota de Frete de Sub. Tributária preencha a aliquota de ICMS Sub Trib.', mtinformation, [mbok], 0);
    abort;
  end;
  q := TClasseQuery.create('select sum(vlfretesub) vlfretesub'+
                                 ',sum(vlfretesub)*0.2 vlcredito'+
                                 ',sum(vlfretesub)*0.8 vlicms'+
                                 ',sum(vlbasefretesub) vlbasefretesub '+
                           'from saida '+
                           'inner join cliente on cliente.cdcliente=saida.cdcliente and saida.cdempresa=cliente.cdempresa '+
                           'where saida.cdempresa='+empresa.cdempresa.ToString+' '+
                           'and saida.dtemissao between '+GettsBanco(Primeiro_dia_mes(dtemissao))+' and '+quotedstr(datafinalmes(dtemissao))+' '+
                           'and alfretesub='+getfloats(alicmssubtrib)+' and saida.tpentsai=''S'' and cliente.cduf<>'+inttostr(empresa.endereco.cduf));
  try
    if q.q.fieldbyname(_vlfretesub).AsCurrency = 0 then
    begin
      exit;
    end;
    boexiste := itsaidafretesub.select(cdsaida);
    itsaidafretesub.alfretesub     := alicmssubtrib;
    itsaidafretesub.vlbasefretesub := q.q.fieldbyname(_vlbasefretesub).AsCurrency;
    itsaidafretesub.vlfretesub     := q.q.fieldbyname(_vlfretesub).AsCurrency;
    itsaidafretesub.vlcredito      := q.q.fieldbyname(_vlcredito).AsCurrency;
    itsaidafretesub.vlicms         := q.q.fieldbyname(_vlicms).AsCurrency;
    if boexiste then
    begin
      itsaidafretesub.update;
    end
    else
    begin
      itsaidafretesub.cdsaida := cdsaida;
      itsaidafretesub.insert;
    end;
    result := 'Aliquota: '               + getfloats(alicmssubtrib)+'%'#13+
              'Valor do Imposto Devido: '+ FormatFloat(__moeda, q.q.fieldbyname(_vlfretesub).AsCurrency)+#13+
              'Credito Presumido: '      + formatfloat(__moeda, q.q.fieldbyname(_vlcredito ).ascurrency)+#13+
              'ICMS a Recolher: '        + formatfloat(__moeda, q.q.fieldbyname(_vlicms    ).ascurrency);
  finally
    freeandnil(q);
  end;
end;

class function TSaida.CodigoNotaFiscal(nusaida:string):integer;
var
  cont : integer;
begin
  Result := 0;
  cont := RetornaSQLInteger('select count(*) from saida where cdempresa='+empresa.cdempresa.ToString+' and nusaida='+nusaida);
  if cont = 0 then
  begin
    exit
  end;
  if cont = 1 then
  begin
    result := RetornaSQLInteger('select cdsaida from saida where cdempresa='+empresa.cdempresa.ToString+' and nusaida='+nusaida)
  end
  else if cont > 1 then
  begin
    result := selecionar_Entrada(_saida, nusaida);
    if result = 0 then
    begin
      result := -1;
    end;
  end;
end;

function TSaida.CfopCabecalhoInexistenteNosItens: boolean;
var
  I: Integer;
begin
  result := true;
  for I := 0 to itsaida.count - 1 do
  begin
    if itsaida.items[i].cdcfop = cdcfop then
    begin
      result := false;
      break;
    end;
  end;
end;

class function TSaida.CodigoNotaFiscal(nusaida, cdserie: integer):integer;
begin
  Result := RetornaSQLInteger('select cdsaida from saida where cdempresa='+empresa.cdempresa.ToString+' and cdserie='+inttostr(cdserie)+' and nusaida='+inttostr(nusaida));
end;

function TSaida.ConsistirCFOPDestinatario: string;
var
  igualdiferente : string;
begin
  result := '';
  if not (((cdcliente <> 0) or (cdfornecedor <> 0)) and (cdcfop <> 0)) then
  begin
    exit;
  end;
  if GetSGUFDestinatario = empresa.endereco.sguf then
  begin
    if tpsaida.tpentsai = _S then
    begin
      if (copy(inttostr(cdcfop), 1, 1) <> _5) and (copy(inttostr(cdcfop), 1, 1) <> _7) then
      begin
        igualdiferente := 'igual';
        result := '5 ou 7';
      end;
    end
    else if tpsaida.tpentsai = _E then
    begin
      if (copy(inttostr(cdcfop), 1, 1) <> _1) and (copy(inttostr(cdcfop), 1, 1) <> _3) then
      begin
        igualdiferente := 'igual';
        result := '1 ou 3';
      end;
    end;
  end
  else
  begin
    if tpsaida.tpentsai = _S then
    begin
      if (copy(inttostr(cdcfop), 1, 1) <> _6) and (copy(inttostr(cdcfop), 1, 1) <> _7) then
      begin
        igualdiferente := 'diferente';
        result := '6 ou 7';
      end;
    end
    else if (tpsaida.tpentsai = _E) and (copy(inttostr(cdcfop), 1, 1) <> _2) and (copy(inttostr(cdcfop), 1, 1) <> _3) then
    begin
      igualdiferente := 'diferente';
      result := '2 ou 3';
    end;
  end;
  if result <> '' then
  begin
    result := 'Número de CFOP inválido!'#13+
              tpsaida.ObterTpFornCliente+' é da unidade federativa '+igualdiferente+' da Empresa.'#13+
              'Digite um número que comece com '+result+' para continuar.';
  end;
end;

function TSaida.aNotaEDifal: boolean;
begin
  result := (tpentsai = _s) and (cdcliente <> 0) and (boconsumidorfinal = _s)and (cdcfop > 6000) and (cdcfop < 7000);
end;

procedure TSaida.AtribuicaoValorImposto;
begin
  VLBASEICMS   := itsaida.vlbaseicms;
  VLICMS       := itsaida.vlicms;
  VLISS        := itsaida.vliss;
  VLBASEISS    := itsaida.vlbaseiss;
  VLinss       := itsaida.vlinss;
  VLBASEinss   := itsaida.vlbaseinss;
  VLirrf       := itsaida.vlirrf;
  VLBASEirrf   := itsaida.vlbaseirrf;
  vlpis        := itsaida.vlpis;
  vlbasepis    := itsaida.vlbasepis;
  vlcofins     := itsaida.vlcofins;
  vlbasecofins := itsaida.vlbasecofins;

  if tpsaida.bocontribsocial <> _s then
  begin
    VLcontribsocial     := 0;
    VLBASEcontribsocial := 0;
  end
  else
  begin
    if alcontribsocial > 0 then
    begin
      VLcontribsocial     := itsaida.vlbaseiss * (alcontribsocial / 100);
      VLBASEcontribsocial := itsaida.vlbaseiss;
    end
    else
    begin
      VLcontribsocial     := itsaida.vliss;
      VLBASEcontribsocial := itsaida.vlbaseiss;
    end;
  end;

  if tpsaida.bofrete <> _s then
  begin
    vlfrete := 0;
  end;
end;

procedure TSaida.CalcularValoresItem;
begin
  vlservico  := itsaida.vlservico;
  vliss      := itsaida.vliss;
  vlbaseiss  := itsaida.vlbaseiss;
  vlinss     := itsaida.vlinss;
  vlbaseinss := itsaida.vlbaseinss;
  vlirrf     := itsaida.vlirrf;
  vlbaseirrf := itsaida.vlbaseirrf;
  vlproduto  := itsaida.vlproduto;
  if tpsaida.boratearpeso <> _s then
  begin
    psbruto   := itsaida.psbruto;
    psliquido := itsaida.psliquido;
  end;
  vlipi             := itsaida.vlipi;
  vlicms            := itsaida.vlicms;
  vlbaseicms        := itsaida.vlbaseicms;
  vlicmssubtrib     := itsaida.vlicmssubtrib;
  vlbaseicmssubtrib := itsaida.vlbaseicmssubtrib;
  vlbaseipi         := itsaida.vlbaseipi;
  vlpis             := itsaida.vlpis;
  vlbasepis         := itsaida.vlbasepis;
  vlbasecofins      := itsaida.vlbasecofins;
  vlcofins          := itsaida.vlcofins;
  vlcomissao        := itsaida.vlcomissao;
  vllucro           := itsaida.vllucro;
  vltotaltributo    := itsaida.vltotaltributo;
end;

procedure TSaida.calcular_retencao_valor_liquido;
begin
  if boretencaoiss = _S then
  begin
    vlliquido := vlliquido - vliss;
  end;
  if boretencaoirrf = _s then
  begin
    vlliquido := vlliquido - vlirrf;
  end;
  if boretencaoinss = _s then
  begin
    vlliquido := vlliquido - vlinss;
  end;
  if boretencaocontribsocial = _s then
  begin
    vlliquido := vlliquido - vlcontribsocial;
  end;
  if boretencaocofins = _s then
  begin
    vlliquido := vlliquido - vlcofins;
  end;
  if boretencaopis = _s then
  begin
    vlliquido := vlliquido - vlpis;
  end;
end;

function TSaida.CancelarNF(cdsaida:string; nustdocumento_:string; nuchave:string=''):boolean;
  procedure set_status_locacao;
  var
    cditsaida_excluir, cdlocacaodevolucao, sql, cdlocacao_excluir : TStrings;
    locacao : TLocacao;
    procedure excluir_locacao_na_lista;
    var
      x: integer;
    begin
      for x := 0 to itsaida.count - 1 do
      begin
        if itsaida.items[x].cdlocacao <> 0 then
        begin
          cdlocacao_excluir.Add(IntToStr(itsaida.items[x].cdlocacao));
          cditsaida_excluir.Add(IntToStr(itsaida.items[x].cditsaida));
        end;
      end;
    end;
    procedure processar_exclusao_locacao;
    var
      i : integer;
    begin
      for i := 0 to cdlocacao_excluir.Count - 1 do
      begin
        locacao.Select(strtoint(cdlocacao_excluir[i]));
        if locacao.cdstlocacao = 8 then
        begin
          if locacao.vlrecebido > 0 then
          begin
            locacao.cdstlocacao := 7;
          end
          else if not locacao.ExisteDevolucao then
          begin
            if not locacao.ExisteFaturamento(cditsaida_excluir[i]) then
            begin
              locacao.cdstlocacao := 4;
            end
            else
            begin
              locacao.cdstlocacao := locacao.getStatusAnteriorAtual;
              if locacao.cdstlocacao = 2 then
              begin
                locacao.cdstlocacao := locacao.getStatusAnteriorAtual(_4);
              end;
            end;
          end
          else
          begin
            locacao.hstlocacao.Ler(locacao.cdlocacao);
            locacao.cdstlocacao := RetornaSQLInteger('select first 1 cdstlocacao from hstlocacao '+
                                                     'where cdempresa='+empresa.cdempresa.ToString+' and cdlocacao='+cdlocacao_excluir[i]+' and cdstlocacao<>8 '+
                                                     'order by CDHSTLOCACAO desc');
          end;
        end
        else if locacao.cdstlocacao = 2 then
        begin
          locacao.cdstlocacao := 5
        end
        else if locacao.cdstlocacao = 7 then
        begin
          locacao.cdstlocacao := 6;
        end;
        sql.Add(locacao.Update(true));
        locacao.RegistrarMudancaStatus(locacao.cdstlocacao);
      end;
    end;
  begin
    if tpsaida.bolocacao <> _s then
    begin
      Exit;
    end;
    cdlocacao_excluir  := TStringList.Create;
    cditsaida_excluir  := TStringList.Create;
    sql                := TStringList.Create;
    cdlocacaodevolucao := TStringList.Create;
    locacao            := TLocacao.create;
    try
      excluir_locacao_na_lista;
      processar_exclusao_locacao;
      if sql.Count > 0 then
      begin
        ExecutaScript(sql);
      end;
    finally
      FreeAndNil(cdlocacao_excluir);
      FreeAndNil(cditsaida_excluir);
      FreeAndNil(cdlocacaodevolucao);
      FreeAndNil(sql);
      FreeAndNil(locacao);
    end;
  end;
  procedure set_status_ordproducao;
  var
    i : Integer;
    sql, cditpedido_excluir : TStrings;
    ordproducao : tordproducao;
  begin
    if tpsaida.bopedido <> _s then
    begin
      Exit;
    end;
    cditpedido_excluir := TStringList.Create;
    sql                := TStringList.Create;
    ordproducao := tordproducao.create;
    try
      for i := 0 to itsaida.count - 1 do
      begin
        if itsaida.items[i].cditpedido <> 0 then
        begin
          cditpedido_excluir.Add(IntToStr(itsaida.items[i].cditpedido));
        end;
      end;
      for i := 0 to cditpedido_excluir.Count - 1 do
      begin
        if ordproducao.Select(_cditpedido+'='+cditpedido_excluir[i]) then
        begin
          ordproducao.cdstordproducao := 6;
          ordproducao.dtentrega := 0;
          sql.Add(ordproducao.Update(true));
          sql.Add(ordproducao.RegistrarMudancaStatus(true));
        end;
      end;
      if sql.Count > 0 then
      begin
        ExecutaScript(sql);
      end;
    finally
      freeandnil(cditpedido_excluir);
      freeandnil(sql);
      freeandnil(ordproducao);
    end;
  end;
var
  sql : tstrings;
begin
  sql := tstringlist.create;
  try
    nustdocumento := nustdocumento_;
    cdcliente := 0;
    vlbaseiss := 0;
    VLBASEINSS := 0;
    VLBASECONTRIBSOCIAL := 0;
    VLBASEIRRF := 0;
    ALINSS := 0;
    ALCONTRIBSOCIAL := 0;
    ALIRRF := 0;
    VLISS := 0;
    VLINSS := 0;
    VLCONTRIBSOCIAL := 0;
    VLIRRF := 0;
    BORETENCAOISS := '';
    BORETENCAOPIS := '';
    BORETENCAOCOFINS := '';
    BORETENCAOINSS := '';
    BORETENCAOCONTRIBSOCIAL := '';
    BORETENCAOIRRF := '';
    cdfornecedor := 0;
    cdtransportadora := 0;
    cdrepresentante := 0;
    cdcfop := 0;
    cdcondpagto := 0;
    cdtpcobranca := 0;
    cdtransporte := 0;
    cdordserv := 0;
    dshistorico := '';
    NUPLCONTA := '';
    cdplconta := 0;
    cdtpfrete := '';
    NUPLACA := '';
    cduf := 0;
    dsobservacao := '';
    prcomissao := 0;
    vlcomissao := 0;
    vlfrete := 0;
    vltotal := 0;
    vlproduto := 0;
    vlservico := 0;
    VLLIQUIDO := 0;
    psbruto := 0;
    psliquido := 0;
    vlbaseicms := 0;
    vlicms := 0;
    vlisentaicms := 0;
    vlouticms := 0;
    vlicmssfrete := 0;
    vlbaseipi := 0;
    vlipi := 0;
    vlisentaipi := 0;
    vloutipi := 0;
    vlipisfrete := 0;
    VLBaSeICMSSUBTRIB := 0;
    VLICMSSUBTRIB := 0;
    VLBASEICMSRED := 0;
    VLICMSRED := 0;
    VLBASEPIS := 0;
    VLPIS := 0;
    VLBASECOFINS := 0;
    VLCOFINS := 0;
    VLBASEFRETESUB := 0;
    VLFRETESUB := 0;
    alFRETESUB := 0;
    QTVOLUME := 0;
    BOIMPORTACAO := '';
    prdesconto := 0;
    vldesconto := 0;
    vllucro := 0;
    vlseguro := 0;
    vloutdespesa := 0;
    VLLIQSDESC := 0;
    if nuchave <> '' then
    begin
      nuchavenfe := nuchave;
    end;
    sql.Add(update(true));
    sql.Add('delete from movto where cdempresa='+empresa.cdempresa.ToString+' and cditsaida in (select cditsaida from itsaida where cdempresa='+empresa.cdempresa.ToString+' and cdsaida='+cdsaida+');');
    sql.text := sql.Text + itsaida.Excluir(true);
    sql.Add('delete from itcobranca where cdempresa='+empresa.cdempresa.ToString+' and cdduplicata in (select cdduplicata from duplicata where cdempresa='+empresa.cdempresa.ToString+' and cdsaida='+cdsaida+');');
    if duplicata.count > 0 then
    begin
      sql.Add(duplicata.Excluir(true));
    end;
    sql.Add('delete from devolucao where cdempresa='+empresa.cdempresa.ToString+' and cditsaidavenda in (select cditsaida from itsaida where cdempresa='+empresa.cdempresa.ToString+' and cdsaida='+cdsaida+');');
    sql.Add('delete from devolucao where cdempresa='+empresa.cdempresa.ToString+' and cditsaidadevolucao in (select cditsaida from itsaida where cdempresa='+empresa.cdempresa.ToString+' and cdsaida='+cdsaida+');');
    sql.Add('delete from itfatsaida where cdempresa='+empresa.cdempresa.ToString+' and cdsaida='+cdsaida+';');
    saidareferenciada.Ler(cdsaida.ToInteger);
    if saidareferenciada.count>0 then
    begin
      sql.Add(saidareferenciada.excluir(true));
    end;
    sql.Add('update ordserv set cdsaida=null where cdempresa='+empresa.cdempresa.ToString+' and cdsaida='+cdsaida+';');
    result := ExecutaScriptFire(sql);
    if result then
    begin
      set_status_locacao;
      set_status_ordproducao;
    end;
  finally
    freeandnil(sql);
  end;
end;

function TSaida.ExibirNUCLFISCAL: Boolean;
begin
  result := (tpsaida.serie.nudocfiscalicms = _55) or
            (tpsaida.serie.nudocfiscalicms = _20) or
            (tpsaida.serie.nudocfiscalicms = _02) or
            (tpsaida.serie.nudocfiscalicms = _2d) or
            (tpsaida.serie.nudocfiscalicms = _01) or
            (tpsaida.serie.nudocfiscalicms = _00);
end;

function TSaida.ExistebaixaDuplicata(cdsaida:string):boolean;
begin
  result := RetornaSQLInteger('select count(*) '+
                              'from baixa '+ 
                              'inner join duplicata on duplicata.cdduplicata=baixa.cdduplicata and baixa.cdempresa=duplicata.cdempresa '+
                              'where duplicata.cdempresa='+empresa.cdempresa.ToString+' and duplicata.cdsaida='+cdsaida) > 0;
end;

destructor TSaida.destroy;
begin
  FreeAndNil(fcondpagto);
  FreeAndNil(fcartacorrecao);
  FreeAndNil(fsaidareferenciada);
  FreeAndNil(fserie);
  FreeAndNil(fcfop);
  FreeAndNil(ftransportadora);
  FreeAndNil(fcliente);
  FreeAndNil(ffornecedor);
  FreeAndNil(fduplicata);
  freeandnil(ACBrNFe);
  freeandnil(ftpsaida);
  FreeAndNil(fitsaida);
  FreeAndNil(fitsaidafretesub);
  FreeAndNil(fufsaida);
  FreeAndNil(fufembarque);
  FreeAndNil(fuf);
  inherited;
end;

procedure TSaida.DistribuicaoComissaoDuplicata;
var
  qtparcela : integer;
  vloriginal, vlparcela : currency;
  I: Integer;
begin
  if duplicata.Count = 0 then
  begin
    Exit;
  end;
  vloriginal := vlcomissao;
  qtparcela  := duplicata.Count;
  if (tpsaida.boduplicataicmsst = _s) and (vlicmssubtrib > 0) then
  begin
    qtparcela := qtparcela - 1;
  end;
  vlparcela  := RoundTo(vlcomissao / qtparcela, -2);
  for I := 0 to duplicata.Count - 1 do
  begin
    if (i = 0) and (tpsaida.boduplicataicmsst = _s) and (vlicmssubtrib > 0) then
    begin
      duplicata.Items[i].vlcomissao := 0;
      Continue;
    end;
    if i = duplicata.Count - 1 then
    begin
      duplicata.Items[i].vlcomissao := vloriginal;
      Break;
    end;
    duplicata.Items[i].vlcomissao := vlparcela;
    vloriginal                    := vloriginal - vlparcela;
  end;
end;

procedure TSaida.DistribuicaoDescontoItem;
var
  vldescontorateado : Currency;
  I: Integer;
begin
  vldescontorateado := 0;
  if boitemdesconto = _s then
  begin
    vldesconto := 0;
    for I := 0 to itsaida.Count - 1 do
    begin
      vldesconto := vldesconto + itsaida.Items[i].vldesconto;
    end;
    exit;
  end;
  for I := 0 to itsaida.Count - 1 do
  begin
    if vltotal = 0 then
    begin
      itsaida.Items[i].vldesconto := 0;
    end
    else if vlproduto + vlservico > 0 then
    begin
      itsaida.Items[i].vldesconto := RoundTo(vldesconto / (vlproduto + vlservico)* itsaida.Items[i].vltotal, -2);
    end
    else
    begin
      itsaida.Items[i].vldesconto := 0;
    end;
    vldescontorateado := vldescontorateado + itsaida.Items[i].vldesconto;
    if i = itsaida.Count - 1 then
    begin
      if vldescontorateado < vldesconto then
      begin
        itsaida.Items[i].vldesconto := itsaida.Items[i].vldesconto + (vldesconto - vldescontorateado);
      end
      else if vldescontorateado > vldesconto then
      begin
        itsaida.Items[i].vldesconto := itsaida.Items[i].vldesconto - (vldescontorateado - vldesconto);
      end;
    end;
  end;
end;

procedure TSaida.DistribuicaoFreteItem;
var
  vlfreterateado : currency;
  I: Integer;
begin
  if psbruto = 0 then
  begin
    Exit;
  end;
  vlfreterateado := 0;
  for I := 0 to itsaida.Count - 1 do
  begin
    itsaida.Items[i].vlfrete := vlfrete / psbruto * itsaida.Items[i].psbruto;
    vlfreterateado           := vlfreterateado + itsaida.Items[i].vlfrete;
    if i = itsaida.Count -1 then
    begin
      if vlfreterateado < vlfrete then
      begin
        itsaida.Items[i].vlfrete := itsaida.Items[i].vlfrete + (vlfrete - vlfreterateado)
      end
      else if vlfreterateado > vlfrete then
      begin
        itsaida.Items[i].vlfrete := itsaida.Items[i].vlfrete - (vlfreterateado - vlfrete);
      end;
    end;
  end;
end;

constructor TSaida.create;
begin
  inherited;
  fcondpagto         := tcondpagto.create;
  fcartacorrecao     := tcartacorrecaoList.create;
  fsaidareferenciada := tsaidareferenciadalist.create;
  fuf                := tuf.create;
  fufsaida           := TUF.create;
  fufembarque        := TUF.create;
  fserie             := tserie.create;
  fcfop              := tcfop.Create;
  fcliente           := TCliente.create;
  ffornecedor        := TFornecedor.create;
  ftransportadora    := ttransportadora.create;
  fduplicata         := TDuplicataList.Create;
  ACBrNFe            := TACBrNFe.Create(nil);
  ftpsaida           := Ttpsaida.create;
  fitsaida           := TItsaidaList.Create;
  Fitsaidafretesub   := TItsaidafretesub.create;
end;

function TSaida.Copiar: integer;
var
  i : integer;
  vltotaltributo, vl_a_tributar : currency;
  saida1 : TSaida;
begin
  saida1 := TSaida.create;
  try
    saida1.CopiarObjeto(self);
    result         := qgerar.GerarCodigo(_saida);
    saida1.cdsaida := Result;
    repeat // número de série
      saida1.nusaida := qgerar.GerarCodigo(_serie, inttostr(tpsaida.cdserie));
    until TSaida.CodigoNotaFiscal(saida1.nusaida, saida1.cdserie) = 0;
    saida1.zerarCamposNFE;
    saida1.dtemissao   := DtBanco;
    saida1.dtsaida     := saida1.dtemissao;
    if saida1.cdindpres = '' then
    begin
      saida1.cdindpres := _0;
    end;
    if saida1.boconsumidorfinal = '' then
    begin
      saida1.boconsumidorfinal := _n;
    end;
    if saida1.nudocfiscalicms = _55 then
    begin
      saida1.nustdocumento := _98
    end
    else
    begin
      saida1.nustdocumento := _00;
    end;
    vltotaltributo := 0;
    vl_a_tributar  := 0;
    for I := 0 to itsaida.Count - 1 do
    begin
      saida1.itsaida.New;
      saida1.itsaida.Items[i].CopiarObjeto(itsaida.Items[i]);
      saida1.itsaida.Items[i].cdsaida        := saida1.cdsaida;
      saida1.itsaida.Items[i].cditsaida      := QGerar.GerarCodigo(_itsaida);
      saida1.itsaida.Items[i].cdpedido       := 0;
      saida1.itsaida.Items[i].nupedido       := '';
      saida1.itsaida.Items[i].cditpedido     := 0;
      saida1.itsaida.Items[i].prtotaltributo := itsaida.Items[i].ObterPrTotalTributo;
      saida1.itsaida.Items[i].vltotaltributo := itsaida.Items[i].CalcularVlTotalTributo;
      vltotaltributo                         := vltotaltributo + saida1.itsaida.Items[i].vltotaltributo;
      vl_a_tributar                          := vl_a_tributar  + itsaida.Items[i].CalcularVlaTributar;
    end;
    saida1.vltotaltributo := vltotaltributo;
    saida1.prtotaltributo := vltotaltributo * 100 / vl_a_tributar;
    if saida1.cdcondpagto > 0 then
    begin
      saida1.GerarDuplicata;
    end;
    saida1.Insert;
    for I := 0 to saida1.itsaida.Count - 1 do
    begin
      saida1.itsaida.Items[i].Insert;
    end;
    saida1.duplicata.Inserir;
  finally
    FreeAndNil(saida1);
  end;
end;

function TSaida.EntradaProdutoData(dti, dtf: TDate; nudias: Integer): boolean;
var
  c : TClasseQuery;
begin
  c := TClasseQuery.Create('select cdsaida from saida where cdempresa='+empresa.cdempresa.ToString+' and dtemissao between '+getdtbanco(dti)+' and '+getdtbanco(dtf));
  frmprogressbar := Tfrmprogressbar.Create(nil);
  try
    frmprogressbar.gau.MaxValue := c.q.RecordCount;
    frmprogressbar.Show;
    while not c.q.Eof do
    begin
      frmprogressbar.gau.Progress := c.q.RecNo;
      Application.ProcessMessages;
      EntradaProduto(c.q.fieldbyname(_cdsaida).AsString, nudias);
      c.q.Next;
    end;
    result := True;
  finally
    FreeAndNil(c);
    FreeAndNil(frmprogressbar);
  end;
end;

function TSaida.EntradaProduto(cdsaida:string; nudias: Integer=0):boolean;
var
  q : TClasseQuery;
  sql : TStrings;
  i : integer;
  procedure gerar_entrada;
  var
    movto : TMovto;
  begin
    movto := tmovto.create;
    try
      movto.cdmovto   := QGerar.GerarCodigo(_movto);
      movto.dtemissao := DtBanco;
      movto.cdtpmovto := 2;
      movto.cditsaida := q.q.fieldbyname(_cditsaida).AsInteger;
      movto.dtemissao := q.q.fieldbyname(_dtemissao).AsDateTime - nudias;
      sql.Add(movto.Insert(true));
      movto.ItMovto.New;
      movto.ItMovto.Items[movto.ItMovto.Count-1].cdmovto   := movto.cdmovto;
      movto.ItMovto.Items[movto.ItMovto.Count-1].cditmovto := qgerar.GerarCodigo(_itmovto);
      movto.ItMovto.Items[movto.ItMovto.Count-1].cdproduto := q.q.fieldbyname(_cdproduto).AsInteger;
      movto.ItMovto.Items[movto.ItMovto.Count-1].qtitem    := q.q.fieldbyname(_qtitem).AsFloat;
      movto.ItMovto.Items[movto.ItMovto.Count-1].cddigitado := q.q.fieldbyname(_cdproduto).AsString;
      sql.Add(movto.ItMovto.Items[movto.ItMovto.count-1].Insert(true));
    finally
      FreeAndNil(movto);
    end;
  end;
  procedure atualizar_entrada;
  begin
    sql.add('delete from movto where cdempresa='+empresa.cdempresa.ToString+' and cditsaida='+q.q.fieldbyname(_cditsaida).asstring+';');
    gerar_entrada;
  end;
begin // gerar baixa dos produtos
  q   := TClasseQuery.create('select itsaida.cdsaida'+
                                    ',itsaida.cditsaida'+
                                    ',itsaida.cdproduto'+
                                    ',itsaida.qtitem'+
                                    ',itsaida.tsinclusao'+
                                    ',itsaida.cdusuarioi'+
                                    ',itsaida.cdcomputadori'+
                                    ',itsaida.tsalteracao'+
                                    ',itsaida.cdusuarioa'+
                                    ',itsaida.cdcomputadora'+
                                    ',movto.cditsaida cditsaida1'+
                                    ',itmovto.qtitem qtitem1'+
                                    ',saida.dtemissao'+
                                    ',itsaida.CDEMPRESA'+
                                    ',saida.dtemissao '+
                              'from itsaida '+
                              'left join saida on saida.cdsaida=itsaida.cdsaida and itsaida.cdempresa=saida.cdempresa '+
                              'left join cfop on cfop.cdcfop=itsaida.cdcfop '+
                              'left join movto on movto.cditsaida=itsaida.cditsaida and itsaida.cdempresa=movto.cdempresa '+
                              'left join itmovto on itmovto.cdmovto=movto.cdmovto and itmovto.cdproduto=itsaida.cdproduto and itmovto.cdempresa=movto.cdempresa '+
                              'where itsaida.cdempresa='+empresa.cdempresa.ToString+' and cfop.bolivroproducao=''S'' and saida.tpentsai=''S'' and itsaida.cdsaida='+cdsaida);
  sql := tstringlist.create;
  try
    while not q.q.Eof do
    begin
      if q.q.fieldbyname(_cdsaida).IsNull then
      begin
        gerar_entrada
      end
      else if q.q.fieldbyname(_qtitem).AsInteger <> q.q.fieldbyname(_qtitem+_1).AsInteger then
      begin
        Atualizar_entrada;
      end;
      q.q.next;
    end;
    for i := 0 to sql.count - 1 do
    begin
      ExecutaSQL(sql[i]);
    end;
    result := true;
  finally
    freeandnil(q);
    freeandnil(sql);
  end;
end;

function TSaida.gerar_devolucao_simples(cdentrada, cdtpsaida, cdcfop:integer):integer;
var
  s, sit, csaida, citsaida: TClasseQuery;
  cliente : tcliente;
  fornecedor : tfornecedor;
  procedure set_st;
  var
    cdst : string;
    regrast : TRegraSt;
  begin
    regrast := tregrast.create;
    try
      cdst := regrast.GetST(_saida, citsaida.q.fieldbyname(_cdproduto).Asinteger, citsaida.q.fieldbyname(_cdcfop).Asinteger, _icms);
      if cdst <> '' then
      begin
        citsaida.q.fieldbyname(_nusticms).AsString := cdst;
      end;
      cdst := regrast.GetST(_saida, citsaida.q.fieldbyname(_cdproduto).AsInteger, citsaida.q.fieldbyname(_cdcfop).AsInteger, _ipi);
      if cdst <> '' then
      begin
        citsaida.q.fieldbyname(_nustipi).AsString := cdst;
      end;
      cdst := regrast.GetST(_saida, citsaida.q.fieldbyname(_cdproduto).AsInteger, citsaida.q.fieldbyname(_cdcfop).AsInteger, _pis);
      if cdst <> '' then
      begin
        citsaida.q.fieldbyname(_nustpis).AsString := cdst;
      end;
      cdst := regrast.GetST(_saida, citsaida.q.fieldbyname(_cdproduto).AsInteger, citsaida.q.fieldbyname(_cdcfop).AsInteger, _cofins);
      if cdst <> '' then
      begin
        citsaida.q.fieldbyname(_nustcofins).AsString := cdst;
      end;
    finally
      freeandnil(regrast);
    end;
  end;
  procedure Inserir_saida;
  var
    x, i : integer;
  begin
    csaida.q.Insert;
    for i := 0 to csaida.q.FieldCount - 1 do
    begin
      for x := 0 to s.q.FieldCount - 1 do
      begin
        if csaida.q.Fields[i].FieldName = s.q.Fields[x].FieldName then
        begin
           if csaida.q.Fields[i].FieldName = uppercase(_cdcfop) then
           begin
             csaida.q.Fields[i].AsInteger := cdcfop
           end
           else
           begin
             qregistro.set_field_type_assign(s.q, csaida.q, csaida.q.Fields[i].FieldName, i);
           end;
        end;
      end;
    end;
    RegistraInformacao_(csaida.q);
    tpsaida.Select(cdtpsaida);
    result                                          := qgerar.GerarCodigo(_saida);
    csaida.q.FieldByName(_cdsaida).asInteger        := result;
    csaida.q.FieldByName(_cdentrada).AsInteger      := cdentrada;
    csaida.q.FieldByName(_dtemissao).AsDateTime     := DtBanco;
    csaida.q.FieldByName(_cdtpsaida).AsInteger      := cdtpsaida;
    csaida.q.FieldByName(_dtsaida).AsDateTime       := csaida.q.FieldByName(_dtemissao).AsDateTime;
    csaida.q.FieldByName(_cdserie).AsInteger        := qregistro.InteirodoCodigo(_tpsaida, cdtpsaida, _cdserie);
    tpsaida.cdserie                                 := csaida.q.FieldByName(_cdserie).asinteger;
    csaida.q.FieldByName(_tpentsai).AsString        := qregistro.StringdoCodigo(_tpsaida, cdtpsaida, _tpentsai);
    csaida.q.FieldByName(_nudocfiscalicms).AsString := NomedoCodigo(_serie,  csaida.q.FieldByName(_cdserie).AsString, _nudocfiscalicms);
    csaida.q.FieldByName(_nustdocumento).AsString   := _98;
    csaida.q.FieldByName(_dsxml).Clear;
    csaida.q.FieldByName(_nuchavenfe).Clear;

    csaida.q.FieldByName(_cdnfefinalidade).asstring   := _4;
    csaida.q.FieldByName(_cdindpres).AsString         := _0;
    csaida.q.FieldByName(_boconsumidorfinal).AsString := _n;
    repeat
      csaida.q.FieldByName(_NUsaida).Asinteger := qgerar.GerarCodigo(_serie, inttostr(tpsaida.cdserie));
    until tsaida.CodigoNotaFiscal(csaida.q.FieldByName(_NUsaida).AsInteger, csaida.q.FieldByName(_cdserie).AsInteger) = 0;
    csaida.q.FieldByName(_dtemissao).AsDateTime     := DtBanco;
    csaida.q.FieldByName(_dtsaida).AsDateTime       := DtBanco;
    aplicacao.aplyupdates(csaida.q);
    cliente.select(csaida.q.FieldByName(_cdcliente).AsLargeInt);
    fornecedor.select(csaida.q.FieldByName(_cdfornecedor).AsLargeInt);
  end;
  procedure inserir_itsaida;
    procedure set_cfop(i:Integer);
      function se_cfop_nao_preenchido_tipo_nota_fiscal:Boolean;
      begin
        result := (tpsaida.cdcfopfufsubtrib = 0) and (tpsaida.cdcfopdufsubtrib = 0) and (tpsaida.cdcfopfuf = 0) and (tpsaida.cdcfopduf = 0);
      end;
    var
      tbldestinatario : string;
    begin
      if se_cfop_nao_preenchido_tipo_nota_fiscal then
      begin
        citsaida.q.Fields[i].AsInteger := cdcfop;
        Exit;
      end;
      if not csaida.q.fieldbyname(_cdcliente).IsNull then
      begin
        tbldestinatario := _cliente
      end
      else if not csaida.q.fieldbyname(_cdfornecedor).isnull then
      begin
        tbldestinatario := _fornecedor;
      end;
      if BooleandoCodigo(_sticms, citsaida.q.Fieldbyname(_nusticms).asstring, _boicmssubtrib, _nu, True) then
      begin
        if (empresa.endereco.cduf <> qregistro.inteirodocodigo(tbldestinatario, csaida.q.fieldbyname(_cd+tbldestinatario).asstring, _cduf)) then
        begin
          citsaida.q.Fields[i].asinteger := tpsaida.cdcfopfufsubtrib
        end
        else
        begin
          citsaida.q.Fields[i].asinteger := tpsaida.cdcfopdufsubtrib;
        end;
      end
      else if (empresa.endereco.cduf <> qregistro.inteirodocodigo(tbldestinatario, csaida.q.fieldbyname(_cd+tbldestinatario).asstring, _cduf)) then
      begin
        citsaida.q.Fields[i].asinteger := tpsaida.cdcfopfuf
      end
      else
      begin
        citsaida.q.Fields[i].asinteger := tpsaida.cdcfopduf;
      end;
    end;
  var
    x, i : integer;
    registro : TRegraSTRecord;
    regrast : tregrast;
    procedure setRegistroRegraST;
    begin
      registro.cdcfopduf        := tpsaida.cdcfopduf;
      registro.cdcfopfuf        := tpsaida.cdcfopfuf;
      registro.cdcfopdufsubtrib := tpsaida.cdcfopdufsubtrib;
      registro.cdcfopfufsubtrib := tpsaida.cdcfopfufsubtrib;
      if cliente.cduf <> 0 then
      begin
        registro.cduf     := cliente.cduf;
        registro.tpregime := cliente.get_tpregime;
      end
      else
      begin
        registro.cduf     := fornecedor.cduf;
        registro.tpregime := fornecedor.get_tpregime;
      end;
      registro.tpentsai := tpsaida.tpentsai;
    end;
  begin
    sit.q.Open;
    while not sit.q.Eof do
    begin
      citsaida.q.Insert;
      for i := 0 to citsaida.q.FieldCount - 1 do
      begin
        for x := 0 to sit.q.FieldCount - 1 do
        begin
          if citsaida.q.Fields[i].FieldName = sit.q.Fields[x].FieldName then
          begin
            qregistro.set_field_type_assign(sit.q, citsaida.q, x, i);
            if sit.q.Fields[x].FieldName = UpperCase(_cdcfop) then
            begin
              set_cfop(i);
            end;
          end;
        end;
      end;
      set_st;
      RegistraInformacao_(citsaida.q);
      citsaida.q.FieldByName(_cdsaida).AsInteger   := result;
      citsaida.q.FieldByName(_cditsaida).AsInteger := Qgerar.GerarCodigo(_itsaida);
      citsaida.q.FieldByName(_cdtpregimeicms).AsString := empresa.get_cdtpregimeicms;
      SetRegistroRegraST;
      regrast := tregrast.create;
      try
        regrast.GetRegraST(citsaida.q, registro);
      finally
        freeandnil(regrast);
      end;
      citsaida.q.FieldByName(_cdplconta).Clear;
      citsaida.q.FieldByName(_nuplconta).Clear;
      if citsaida.q.FieldByName(_alpis).asfloat = 0 then
      begin
        citsaida.q.FieldByName(_alpis).clear;
      end;
      if citsaida.q.FieldByName(_alcofins).asfloat = 0 then
      begin
        citsaida.q.FieldByName(_alcofins).clear;
      end;
      if citsaida.q.FieldByName(_alipi).asfloat = 0 then
      begin
        citsaida.q.FieldByName(_alipi).clear;
      end;
      if citsaida.q.FieldByName(_alicms).asfloat = 0 then
      begin
        citsaida.q.FieldByName(_alicms).clear;
      end;
      aplicacao.aplyupdates(citsaida.q);
      sit.q.Next;
    end;
  end;
  procedure Inserir_Referencia;
  var
    saidareferenciada : TSaidaReferenciada;
  begin
    saidareferenciada := tsaidareferenciada.Create;
    try
      saidareferenciada.cdsaida             := csaida.q.FieldByName(_cdsaida).AsInteger;
      saidareferenciada.cdsaidareferenciada := qgerar.GerarCodigo(_saidareferenciada);
      saidareferenciada.cdentradaorigem     := s.q.FieldByName(_cdentrada).AsInteger;
      saidareferenciada.nudocumento         := s.q.FieldByName(_nuentrada).AsInteger;
      saidareferenciada.nuchavenfe          := s.q.FieldByName(_nuchavenfe).AsString;
      saidareferenciada.insert;
    finally
      freeandnil(saidareferenciada);
    end;
  end;
begin
  s          := TClasseQuery.Create(QRetornaSQL.get_select_from(_entrada  , cdentrada));
  sit        := TClasseQuery.Create(QRetornaSQL.get_select_from(_Itentrada, cdentrada, _cdentrada));
  csaida     := TClasseQuery.Create(QRetornaSQL.get_select_from(_saida    , _0), true);
  citsaida   := TClasseQuery.Create(QRetornaSQL.get_select_from(_itsaida  , _0), true);
  cliente    := tcliente.create;
  fornecedor := tfornecedor.create;
  try
    inserir_saida;
    inserir_itsaida;
    inserir_referencia;
  finally
    freeandnil(s);
    freeandnil(sit);
    freeandnil(csaida);
    freeandnil(citsaida);
    freeandnil(cliente);
    freeandnil(fornecedor);
  end;
end;

function TSaida.exportarpdf(path: string; dti, dtf: TDate; cdcliente: string): Boolean;
  function makesql:string;
  begin
    result := 'select saida.nuchavenfe'+
                    ',saida.dsxml'+
                    ',saida.nusaida'+
                    ',saida.dtemissao'+
                    ',tpsaida.nucasadecimalvlunitario'+
                    ',tpsaida.nucasadecimalquantidade '+
              'from saida '+
              'inner join tpsaida on tpsaida.cdempresa=saida.cdempresa and tpsaida.cdtpsaida=saida.cdtpsaida '+
              'where saida.cdempresa='+empresa.cdempresa.ToString+' and saida.dsxml is not null and saida.nustdocumento=''00'' and saida.dtemissao between '+getdtbanco(dti)+' and '+getdtbanco(dtf);
    if cdcliente <> '' then
    begin
      result := result + ' and saida.cdcliente='+cdcliente;
    end;
    result := Result +' order by saida.cdsaida';
  end;
var
  q : TClasseQuery;
begin
  frmprogressbar := Tfrmprogressbar.Create(nil);
  q := tclassequery.create;
  try
    q.q.open(makesql);
    frmprogressbar.gau.MaxValue := q.q.RecordCount;
    frmprogressbar.Show;
    while not q.q.eof do
    begin
      frmprogressbar.gau.Progress := q.q.RecNo;
      frmprogressbar.pnl.Caption :='Exportando registro '+inttostr(q.q.RecNo)+' de '+inttostr(q.q.RecordCount);
      application.ProcessMessages;
      carregarxml(q.q.FieldByName(_dsxml).AsString);
      NFEGerarPDF(q.q.FieldByName(_nucasadecimalquantidade).AsInteger, q.q.FieldByName(_nucasadecimalvlunitario).AsInteger, ACBrNFe, path);
      q.q.next;
    end;
    result := True;
  finally
    q.free;
    FreeAndNil(frmprogressbar);
  end;
end;

function TSaida.exportarpdf(path:string; lista:TStrings): Boolean;
var
  y, qtd1500, inicio, final : integer;
  function get_cdsaida(inicio, final:integer):string;
  var
    i : Integer;
  begin
    result := '';
    for i := inicio to final do
    begin
      if result <> '' then
      begin
        result := result + ',';
      end;
      Result := result + lista[i];
    end;
  end;
  procedure processar_dados(inicio, final:Integer);
  var
    q : TClasseQuery;
    arquivo : tstrings;
  begin
    arquivo        := tstringlist.create;
    frmprogressbar := tfrmprogressbar.Create(nil);
    frmprogressbar.pnl.Caption  := 'Lendo registros. Aguarde...';
    frmprogressbar.Show;
    q       := TClasseQuery.Create('select saida.nuchavenfe'+
                                        ',saida.dsxml'+
                                        ',saida.nusaida'+
                                        ',saida.dtemissao'+
                                        ',tpsaida.nucasadecimalvlunitario'+
                                        ',tpsaida.nucasadecimalquantidade '+
                                  'from saida '+
                                  'inner join tpsaida on tpsaida.cdempresa=saida.cdempresa and tpsaida.cdtpsaida=saida.cdtpsaida '+
                                  'where saida.cdempresa='+empresa.cdempresa.ToString+' and saida.dsxml is not null and saida.nustdocumento=''00'' and saida.cdsaida in ('+get_cdsaida(inicio, final)+')');
    try
      Application.ProcessMessages;
      frmprogressbar.gau.MaxValue := q.q.RecordCount;
      while not q.q.eof do
      begin
        frmprogressbar.pnl.Caption  := 'Processando...';
        frmprogressbar.gau.Progress := q.q.RecNo;
        Application.ProcessMessages;
        carregarxml(q.q.fieldbyname(_dsxml).asstring);
        NFEGerarPDF(q.q.fieldbyname(_nucasadecimalquantidade).AsInteger, q.q.fieldbyname(_nucasadecimalvlunitario).AsInteger, ACBrNFe, path);
        q.q.next;
        result := true;
      end;
    finally
      freeandnil(q);
      freeandnil(arquivo);
      freeandnil(frmprogressbar);
    end;
  end;
begin
  result  := false;
  qtd1500 := lista.Count div 1500;
  if qtd1500 * 1500 < lista.Count then
  begin
    qtd1500 := qtd1500 + 1;
  end;
  for y := 1 to qtd1500 do
  begin
    inicio := 1 + ((y-1) * 1500);
    final  := 1500 * y;
    if final > lista.Count then
    begin
      final := lista.Count;
    end;
    processar_dados(inicio -1, final - 1);
  end;
end;

function TSaida.ImprimirDanfe(cdsaida: string; boshowdialog:Boolean=True; bomostrarview:Boolean=true): Boolean;
var
  q : TClasseQuery;
begin
  q := tclassequery.create;
  try
    q.q.open('select s.NUSTdocumento'+
                    ',s.nuchavenfe'+
                    ',s.dsxml'+
                    ',s.nusaida'+
                    ',s.dtemissao'+
                    ',t.nucasadecimalvlunitario'+
                    ',t.nucasadecimalquantidade '+
              'from saida s '+
              'left join tpsaida t on t.cdempresa=s.cdempresa and t.cdtpsaida=s.cdtpsaida '+
              'where s.cdempresa='+empresa.cdempresa.ToString+' and s.dsxml is not null and s.cdsaida='+cdsaida);
    while not q.q.eof do
    begin
      carregarxml(q.q.FieldByName(_dsxml).AsString);
      NFEImprimir(q.q.FieldByName(_nucasadecimalquantidade).AsInteger, q.q.FieldByName(_nucasadecimalvlunitario).AsInteger, acbrnfe, q.q.FieldByName(_nustdocumento).AsString=_02, _saida, boshowdialog, bomostrarview);
      q.q.next;
    end;
    result := True;
  finally
    freeandnil(q);
  end;
end;

function TSaida.InserirTudo(boscript: boolean): string;
var
  I: Integer;
begin
  result := insert(boscript);
  for I := 0 to itsaida.Count - 1 do
  begin
    result := result + #13 + itsaida.items[i].insert(boscript);
  end;
  for i := 0 to duplicata.Count - 1 do
  begin
    result := result + #13 + duplicata.items[i].Insert(boscript);
  end;
end;

function TSaida.carregarxml(xml:string): Boolean;
var
  texto : TStringStream;
begin
  texto := TStringStream.Create('');
  try
    ACBrNFe.NotasFiscais.Clear;
    texto.WriteString(xml);
    ACBrNFe.NotasFiscais.LoadFromStream(texto);
    result := True;
  finally
    freeandnil(texto);
  end;
end;

procedure TSaida.distribuicaooutdespesaitem;
var
  vloutdespesaItem, vloutdespesarateado : Currency;
  I: Integer;
begin
  vloutdespesarateado := 0;
  vloutdespesaItem := 0;
  for I := 0 to itsaida.Count - 1 do
  begin
    if booutdespesaitem = _s then
    begin
      vloutdespesaItem := vloutdespesaItem + itsaida.Items[i].vloutdespesa;
    end
    else
    begin
      IF vltotal = 0 then
      begin
        itsaida.Items[i].vloutdespesa := 0;
      end
      else
      begin
        if vlproduto + vlservico > 0 then
        begin
          itsaida.Items[i].vloutdespesa := QRotinas.roundqp(((itsaida.Items[i].qtitem * itsaida.Items[i].vlunitario) / (vlproduto + vlservico)) * VLOUTDESPESA, tpsaida.boarredondar=_s);
        end
        else
        begin
          itsaida.Items[i].vloutdespesa := 0;
        end;
      end;
      vloutdespesarateado := vloutdespesarateado + itsaida.Items[i].vloutdespesa;
      if i = itsaida.Count -1 then
      begin
        if vloutdespesarateado < VLOUTDESPESA then
        begin
          itsaida.Items[i].vloutdespesa := itsaida.Items[i].vloutdespesa + (VLOUTDESPESA - vloutdespesarateado);
        end
        else if vloutdespesarateado > vloutdespesa then
        begin
          itsaida.Items[i].vloutdespesa := itsaida.Items[i].VLOUTDESPESA - (vloutdespesarateado - VLOUTDESPESA);
        end;
      end;
    end;
  end;
  if booutdespesaitem = _s then
  begin
    vloutdespesa := vloutdespesaItem;
  end
end;

procedure TSaida.DistribuicaoPesoItem;
var
  psliquidorateado, psbrutorateado : Double;
  qtitem : Double;
  I: Integer;
begin
  if (tpsaida.boratearpeso <> _s) then
  begin
    Exit;
  end;
  qtitem           := get_total_qtitem;
  psliquidorateado := 0;
  psbrutorateado   := 0;
  for I := 0 to itsaida.Count - 1 do
  begin
    //ratear_peso_bruto;
    if psbruto > 0 then
    begin
      itsaida.Items[i].psbruto := psbruto / qtitem * itsaida.Items[i].qtitem;
      psbrutorateado           := psbrutorateado + itsaida.Items[i].psbruto;
      if i = itsaida.Count - 1 then
      begin
        if psbrutorateado < psbruto then
        begin
          itsaida.Items[i].psbruto := itsaida.Items[i].psbruto + (psbruto - psbrutorateado)
        end
        else if psbrutorateado > psbruto then
        begin
          itsaida.Items[i].psbruto := itsaida.Items[i].psbruto - (psbrutorateado - psbruto);
        end;
      end;
    end;
    //ratear_peso_liquido;
    if psliquido > 0 then
    begin
      itsaida.Items[i].psliquido := psliquido / qtitem * itsaida.Items[i].qtitem;
      psliquidorateado           := psliquidorateado + itsaida.Items[i].psliquido;
      if i = itsaida.Count - 1 then
      begin
        if psliquidorateado < psliquido then
        begin
          itsaida.Items[i].psliquido := itsaida.Items[i].psliquido + (psliquido - psliquidorateado)
        end
        else if psliquidorateado > psliquido then
        begin
          itsaida.Items[i].psliquido := itsaida.Items[i].psliquido - (psliquidorateado - psliquido);
        end;
      end;
    end;
  end;
end;

function TSaida.dtemissaoAcimaMesAtual: boolean;
begin
  result := dtemissao > Ultimo_Dia_Mes(DtBanco)+1
end;

function TSaida.dtemissaoMaiorLivroFiscal: boolean;
begin
  result := empresa.livro.bolivrofiscal and (dtemissao <= tlivrofiscal.ultimodia) and (not tLivroFiscal.PermiteAlterarNota(tlivrofiscal.UltimoDia))
end;

function TSaida.dtemissaoVazia: boolean;
begin
  result := dtemissao = strtodate(_30_12_1899);
end;

function TSaida.dtsaidaMenorDtemissao: boolean;
begin
  result := (dtsaida<> strtodate(_30_12_1899)) and (dtsaida < dtemissao);
end;

function TSaida.DuplicidadeNotaFiscal: boolean;
begin
  result := RetornaSQLInteger('select count(*) from saida where cdempresa='+empresa.cdempresa.ToString+' and nusaida='+inttostr(nusaida)+' and cdsaida<>'+inttostr(cdsaida)+' and cdserie='+inttostr(cdserie)) > 0;
end;

function TSaida.Exportarxml(path: string; lista: TStrings): Boolean;
var
  y, qtd1500, inicio, final : integer;
  function get_cdsaida(inicio, final:integer):string;
  var
    i : Integer;
  begin
    result := '';
    for i := inicio to final do
    begin
      if result <> '' then
      begin
        result := result + ',';
      end;
      Result := result + lista[i];
    end;
  end;
  procedure processar_dados(inicio, final:Integer);
  var
    c : TClasseQuery;
    arquivo : tstrings;
  begin
    c := TClasseQuery.Create('select nuchavenfe,dsxml,dsxmlcancel,nusaida,dtemissao from saida where dsxml is not null and cdempresa='+empresa.cdempresa.ToString+' and cdsaida in ('+get_cdsaida(inicio, final)+')');
    arquivo := tstringlist.create;
    frmprogressbar := tfrmprogressbar.Create(nil);
    try
      frmprogressbar.pnl.Caption  := 'Lendo registros. Aguarde...';
      frmprogressbar.Show;
      Application.ProcessMessages;
      c.q.open;
      frmprogressbar.gau.MaxValue := c.q.RecordCount;
      while not c.q.eof do
      begin
        frmprogressbar.pnl.Caption  := 'Processando...';
        frmprogressbar.gau.Progress := c.q.RecNo;
        Application.ProcessMessages;
        if c.q.fieldbyname(_dsxmlcancel).asstring <> '' then
        begin
          arquivo.text := c.q.fieldbyname(_dsxmlcancel).asstring;
        end
        else
        begin
          arquivo.Text := c.q.fieldbyname(_dsxml).asstring;
        end;
        if c.q.fieldbyname(_nuchavenfe).AsString <> '' then
        begin
          arquivo.SaveToFile(path+'\'+c.q.fieldbyname(_nuchavenfe).AsString+'.'+_xml)
        end
        else
        begin
          arquivo.SaveToFile(path+'\NF '+c.q.fieldbyname(_nusaida).AsString+' - Emissao '+FormatDateTime('DD-MM-YYYY', c.q.fieldbyname(_dtemissao).AsDateTime)+'.'+_xml);
        end;
        c.q.next;
        result := true;
      end;
    finally
      freeandnil(c);
      freeandnil(arquivo);
      freeandnil(frmprogressbar);
    end;
  end;
begin
  result  := false;
  qtd1500 := lista.Count div 1500;
  if qtd1500 * 1500 < lista.Count then
  begin
    qtd1500 := qtd1500 + 1;
  end;
  for y := 1 to qtd1500 do
  begin
    inicio := 1 + ((y-1) * 1500);
    final  := 1500 * y;
    if final > lista.Count then
    begin
      final := lista.Count;
    end;
    processar_dados(inicio -1, final - 1);
  end;
end;

function TSaida.GerarDuplicata: Boolean;
var
  i : Integer;
begin
  duplicata.Clear;
  if cdcondpagto = 0 then
  begin
    result := False;
    Exit;
  end;
  if tpsaida.cdtpsaida = 0 then
  begin
    tpsaida.Select(cdtpsaida);
  end;
  if condpagto.cdcondpagto = 0 then
  begin
    condpagto.Select(cdcondpagto);
    condpagto.itcondpagto.Ler(cdcondpagto);
  end;
  if tpsaida.boduplicataicmsst = _s then
  begin
    condpagto.GerarParcela(dtemissao, vlliquido - vlicmssubtrib, vlcomissao, vlicmssubtrib);
  end
  else
  begin
    condpagto.GerarParcela(dtemissao, vlliquido, vlcomissao);
  end;
  for i := 0 to condpagto.parcela.Count - 1 do
  begin
    duplicata.New;
    duplicata.Items[i].cdduplicata     := QGerar.GerarCodigo(_duplicata);
    duplicata.Items[i].cdsaida         := cdsaida;
    duplicata.Items[i].cdsaida         := cdsaida;
    duplicata.Items[i].nuduplicata     := nusaida.ToString+tduplicata.ObterNuduplicata(i, condpagto.parcela.Count);
    duplicata.Items[i].dsparcela       := tduplicata.ObterDsparcela(i, condpagto.parcela.Count);
    duplicata.Items[i].cdtpcobranca    := cdtpcobranca;
    duplicata.Items[i].dshistorico     := dshistorico;
    duplicata.Items[i].cdplconta       := cdplconta;
    duplicata.Items[i].nuplconta       := nuplconta;
    duplicata.Items[i].cdCntCusto      := cdcntcusto;
    duplicata.Items[i].nuCntCusto      := nucntcusto;
    duplicata.Items[i].cdcliente       := cdcliente;
    duplicata.Items[i].cdrepresentante := cdrepresentante;
    duplicata.Items[i].dtemissao       := dtemissao;
    duplicata.Items[i].dtvencimento    := condpagto.parcela.Items[i].dtvencimento;
    duplicata.Items[i].dtentrada       := dtsaida;
    duplicata.Items[i].dtprorrogacao   := condpagto.parcela.Items[i].dtvencimento;
    duplicata.Items[i].vlduplicata     := condpagto.parcela.Items[i].valor;
    duplicata.Items[i].vlsaldo         := condpagto.parcela.Items[i].valor;
    duplicata.Items[i].vlcomissao      := condpagto.parcela.Items[i].vlcomissao;
  end;
  result := true;
end;

function TSaida.getAlICMSInterEstadual: double;
var
  uforigem : TUFOrigemDestino;
begin
  Result := 0;
  if (cliente.cdcliente <> cdcliente) and (cdcliente <> 0) then
  begin
    cliente.select(cdcliente);
  end;
  uforigem := TUFOrigemDestino.create;
  try
    uforigem.cduf := empresa.endereco.cduf;
    uforigem.cdufdestino := cliente.cduf;
    if uforigem.Select then
    begin
      result := uforigem.alicms;
    end;
  finally
    freeandnil(uforigem);
  end;
end;

function TSaida.GetSGUFDestinatario: string;
begin
  if cdcliente <> 0 then
  begin
    result := qregistro.stringdocodigo(_uf, cliente.cduf, _sguf);
  end
  else if cdfornecedor <> 0 then
  begin
    result := qregistro.stringdocodigo(_uf, fornecedor.cduf, _sguf);
  end;
end;

function TSaida.get_total_qtitem: Double;
var
  I: Integer;
begin
  Result := 0;
  for I := 0 to itsaida.Count - 1 do
  begin
    result := result + itsaida.Items[i].qtitem;
  end;
end;

procedure TSaida.gravartotais;
begin
  distribuicaodescontoitem;
  distribuicaooutdespesaitem;
  distribuicaofreteitem;
  CalcularValoresItem;
  if tpsaida.boicmssubst <> _s then
  begin
    vlicmssubtrib := 0;
    vlbaseicmssubtrib := 0;
  end
  else
  begin
    vlicmssubtrib     := itsaida.vlicmssubtrib;
    vlbaseicmssubtrib := itsaida.vlbaseicmssubtrib;
  end;
  if tpsaida.boipi <> _s then
  begin
    vlipi     := 0;
    vlbaseipi := 0;
  end
  else
  begin
    vlipi     := itsaida.vlipi;
    vlbaseipi := itsaida.vlbaseipi;
  end;
  vltotal   := vlproduto + VLSERVICO + vlfrete + vlipi - VLDESCONTO + vlseguro + vlii + vlicmssubtrib + vloutdespesa;
  vlliquido := vltotal;
  calcular_retencao_valor_liquido;
  atribuicaovalorimposto;
  if tpsaida.boratearpeso <> _s then
  begin
    psliquido := itsaida.psliquido;
    psbruto   := itsaida.psbruto;
  end;
  vlproduto := itsaida.vlproduto;
  if tpsaida.bolucro = _s then
  begin
    vllucro := itsaida.vllucro;
  end;

  if tpsaida.bocomissao <> _s then
  begin
    vlcomissao := 0;
    prcomissao := 0;
  end
  else
  begin
    vlcomissao := itsaida.vlcomissao;
  end;

  DistribuicaoPesoItem;
  distribuicaofreteitem;
  distribuicaodescontoitem;
  CalcularValoresItem;
  if (not ((vlfrete > 0) and (tpsaida.bofreteisentoicmssubst = _s))) or
            (((cdcliente <> 0 ) and
            ((qregistro.StringdoCodigo(_uf, QRegistro.InteirodoCodigo(_cliente, cdcliente, _cduf), _sguf) = Empresa.endereco.sguf) or (tpsaida.bofreteisentoicmssubst = _s)))) then
  begin
    vlbasefretesub := 0;
    alfretesub     := 0;
    vlfretesub     := 0;
  end
  else
  begin
    vlbasefretesub := vlfrete;
    vlfretesub     := vlbasefretesub * alfretesub / 100;
  end;
  if (tpsaida.boobservacaotpsaida <> _s) and (dsobservacao = '') then
  begin
    dsobservacao := tpsaida.dsobservacao;
  end;
  vltotaltributo := itsaida.vltotaltributo;
  prtotaltributo := 0;
  if itsaida.vltotaltributo <> 0 then
  begin
    prtotaltributo := (vltotaltributo * 100) / vltotal;
  end;
end;

function TSaida.ObterTpComissao(cdtpcomissaoproduto, cdrepresentante: string): string;
var
  cdtpcomissaorepresentante : string;
begin
  result := '';
  cdtpcomissaorepresentante := NomedoCodigo(_representante, cdrepresentante, _cdtpcomissaorepresentante);
  if (cdtpcomissaorepresentante = '') or (cdtpcomissaoproduto = '') then
  begin
    Exit;
  end;
  result := RetornaSQLString('select cdtpcomissao from tpcomissao where cdempresa='+empresa.cdempresa.ToString+' and cdtpcomissaoproduto='+cdtpcomissaoproduto+' and cdtpcomissaorepresentante='+cdtpcomissaorepresentante);
end;

function TSaida.RecalcularComissao(dti, dtf: TDate):boolean;
begin
  result := recalcular_comissao(dti, dtf);
end;

procedure TSaida.set_serie_tpsaida_forma_emissao(formaemissao: TpcnTipoEmissao);
  function get_serie(bonovo:Boolean=False):string;
  var
    nuserie :string;
  begin
    if bonovo then
    begin
      if formaemissao in [teNormal, teOffLine, teFSDA, teDPEC, teSVCAN, teSVCRS, teSVCSP] then
      begin
        nuserie := '<''900'' '
      end
      else if formaemissao in [teSCAN, teContingencia] then
      begin
        nuserie := '>=''900'' ';
      end;
    end
    else
    begin
      if formaemissao in [teSCAN, teContingencia] then
      begin
        nuserie := '<''900'' '
      end
      else if formaemissao in [teNormal, teOffLine, teFSDA, teDPEC, teSVCAN, teSVCRS, teSVCSP] then
      begin
        nuserie := '>=''900'' ';
      end;
    end;
    result := RetornaSQLString('select first 1 cdserie from serie where cdempresa='+empresa.cdempresa.ToString+' and nudocfiscalicms=''55'' and nuserie'+nuserie+' and boativar=''S'' order by nuserie')
  end;
var
  cdserie : string;
begin
  cdserie := get_serie;
  if cdserie = '' then
  begin
    MessageDlg('Está faltando a configuração da série de contigência (900) em Tabelas=>Tributação=>Série.', mtInformation, [mbOK], 0);
    Abort;
  end;
  cdserie := get_serie(True);
  if cdserie = '' then
  begin
    MessageDlg('Está faltando a configuração da série nfe de ambiente normal em Tabelas=>Tributação=>Série.', mtInformation, [mbOK], 0);
    Abort;
  end;
  ExecutaSQL('update tpsaida set cdserie='+get_serie(True)+' where cdempresa='+empresa.cdempresa.ToString+' and cdserie='+get_serie);
end;

function TSaida.NotaFiscalFazParteLivroProducao(codigo: string): boolean;
begin
  result := RetornaSQLInteger('select count(*) '+
                              'from itsaida i '+
                              'inner join itlivro l on l.cdempresa=i.cdempresa and l.cditsaida=i.cditsaida '+
                              'where i.cdempresa='+empresa.cdempresa.ToString+' and i.cdsaida='+codigo) > 0;
end;

function TSaida.EntradaEstoqueNotaFazParteLivroProducao(codigo: string): Boolean;
begin
  result := RetornaSQLInteger('select count(*) '+
                              'from itsaida i '+
                              'inner join movto m on m.cdempresa=i.cdempresa and m.cditsaida=i.cditsaida '+
                              'inner join itmovto t on t.cdempresa=m.cdempresa and m.cdmovto=t.cdmovto '+
                              'inner join itlivro l on l.cdempresa=t.cdempresa and l.cditmovto=t.cditmovto '+
                              'where i.cdempresa='+empresa.cdempresa.ToString+' and i.cdsaida='+codigo) > 0;
end;

class function TSaida.VerificarNFEEnviadaSemChave(dti: TDate=0; dtf:TDate=0):boolean;
  function makesql:string;
  begin
    result := 'select count(*) from saida where cdempresa='+empresa.cdempresa.ToString+' and nustdocumento=99';
    if dti > 0 then
    begin
      result := result + ' and dtemissao between '+GetDtBanco(dti)+' and '+getdtbanco(dtf);
    end;
  end;
var
  i : Integer;
begin
  i      := RetornaSQLInteger(makesql);
  result := i > 0;
  if result then
  begin
    MessageDlg('Existe(m) '+inttostr(i)+' nota(s) enviada mas sem a chave.', mtInformation, [mbOK], 0);
  end;
end;

class function TSaida.VerificarNFENaoEnviada(dti: TDate=0; dtf:TDate=0):boolean;
  function makesql:string;
  begin
    result := 'select count(*) from saida where cdempresa='+empresa.cdempresa.ToString+' and nustdocumento=98';
    if dti > 0 then
    begin
      result := result + ' and dtemissao between '+GetDtBanco(dti)+' and '+getdtbanco(dtf);
    end;
  end;
var
  i : Integer;
begin
  i      := RetornaSQLInteger(makesql);
  result := i > 0;
  if result then
  begin
    MessageDlg('Existe(m) '+inttostr(i)+' nota(s) não enviada.', mtInformation, [mbOK], 0);
  end;
end;

procedure TSaida.VerifidarFinalidadeDevolucao;
begin
  if cdcfop <> 5201 then
  begin
    exit;
  end;
  if cdnfefinalidade <> 4 then
  begin
    if messagedlg('A nota está com o CFOP de devolução mas a finalidade está como '+qregistro.NomedoCodigo(_nfefinalidade, cdnfefinalidade)+'.'#13+
               'Alterar a finalidade para "Devolução"?', mtconfirmation, [mbyes, mbno], 0) = mrno then
    begin
      abort;
    end;
    cdnfefinalidade := 4;
    update;
  end
  else
  begin
    if SaidaReferenciada.Count = 0 then
    begin
      messagedlg('Para nota fiscal de devolução é necessário pelo menos alguma nota fiscal referenciada.'#13'Favor preencher na aba "Referenciada".', mtinformation, [mbok], 0);
      abort;
    end;
  end;
end;

procedure TSaida.ZerarCamposNFE;
begin
  nuchavenfe  := '';
  dsxml       := '';
  dsxmlcancel := '';
  nSeqEvento  := 0;
  nuprotocoloautorizacao  := '';
  nuprotocolodenegacao    := '';
  nuprotocolocancelamento := '';
  nuprotocoloinutilizacao := '';
end;

function TSaida.RecalcularPisCofins(dti, dtf: TDate): Boolean;
begin
  result := Recalcular_pis_cofins(dti, dtf);
end;

procedure TSaida.Salvar;
begin
  DistribuicaoDescontoItem;
end;

constructor TTelaSaida.create;
begin
  inherited;
  fdados := tsaida.create;
  Ftela  := tsaida.create;
end;

destructor TTelaSaida.destroy;
begin
  FreeAndNil(fdados);
  FreeAndNil(ftela);
  inherited;
end;

procedure TTelaSaida.setStatusLocacao;
var
  cditsaida_excluir, cdlocacaodevolucao, sql, cdlocacao_incluir, cdlocacao_excluir : TStrings;
  boencontrou : boolean;
  cdstlocacao : integer;
  locacao : TLocacao;
  function get_stlocacao_devolucao(i: Integer; itsaida: TItsaida):Integer;
  var
    p, x, z : integer;
    locacaodevolucaoList : tlocacaodevolucaolist;
  begin
    if itsaida.cdlocacaodevolucao = 0 then
    begin
      result := 2;
      Exit;
    end;
    cdlocacaodevolucao.Add(IntToStr(itsaida.cdlocacaodevolucao));
    locacaodevolucaolist := TLocacaoDevolucaoList.Create;
    try
      locacao.select(itsaida.cdlocacao);
      locacaodevolucaolist.Ler(itsaida.cdlocacao, true);
      p := 0;
      for z := 0 to locacaodevolucaolist.Count - 1 do
      begin
        for x := 0 to cdlocacaodevolucao.Count - 1 do
        begin
          if locacaodevolucaolist.Items[z].cdlocacaodevolucao = strtoint(cdlocacaodevolucao[i]) then
          begin
            Inc(p);
          end;
        end;
      end;
      result := 7;
      if p = locacaodevolucaolist.Count then
      begin
        result := 2;
      end;
    finally
      FreeAndNil(locacaodevolucaolist);
    end;
  end;
  function get_stlocacao_7(i:Integer):Integer;
  begin
    locacao.Select(tela.itsaida.Items[i].cdlocacao);
    if locacao.qtsaldo = 0 then
    begin
      result := 2
    end
    else
    begin
      result := 8;
    end;
  end;
  procedure incluir_locacao_na_lista;
  var
    i, x: integer;
  begin
    for i := 0 to tela.itsaida.Count - 1 do
    begin
      boencontrou := False;
      for x := 0 to dados.itsaida.Count - 1 do
      begin
        if tela.itsaida.items[i].cditsaida = dados.itsaida.items[x].cditsaida then
        begin
          boencontrou := True;
          if (tela.itsaida.items[i].cdlocacao <> dados.itsaida.items[x].cdlocacao) then
          begin
            if (tela.itsaida.items[i].cdlocacao <> 0) and (dados.itsaida.items[x].cdlocacao = 0) then
            begin
              cdlocacao_incluir.Add(IntToStr(tela.itsaida.items[i].cdlocacao))
            end
            else if (tela.itsaida.items[i].cdlocacao = 0)  and (dados.itsaida.items[x].cdlocacao <> 0) then
            begin
              cdlocacao_excluir.Add(IntToStr(dados.itsaida.items[x].cdlocacao));
              cditsaida_excluir.Add(IntToStr(dados.itsaida.items[x].cditsaida));
            end
            else
            begin
              cdlocacao_incluir.Add(IntToStr(tela.itsaida.items[i].cdlocacao));
              cditsaida_excluir.Add(IntToStr(tela.itsaida.items[i].cditsaida));
              cdlocacao_excluir.Add(IntToStr(dados.itsaida.items[x].cdlocacao));
            end;
          end;
        end;
      end;
      if not boencontrou then
      begin
        cdlocacao_incluir.Add(IntToStr(tela.itsaida.items[i].cdlocacao));
      end;
    end;
  end;
  procedure excluir_locacao_na_lista;
  var
    i, x: integer;
  begin
    for x := 0 to dados.itsaida.count - 1 do
    begin
      boencontrou := False;
      for i := 0 to tela.itsaida.count - 1 do
      begin
        if tela.itsaida.items[i].cditsaida = dados.itsaida.items[x].cditsaida then
        begin
          boencontrou := True;
          break;
        end;
      end;
      if (not boencontrou) and (dados.itsaida.items[x].cdlocacao <> 0) then
      begin
        cdlocacao_excluir.Add(IntToStr(dados.itsaida.items[x].cdlocacao));
        cditsaida_excluir.Add(IntToStr(dados.itsaida.items[x].cditsaida));
      end;
    end;
  end;
  procedure processar_inclusao_locacao;
  var
    i : integer;
  begin
    for i := 0 to cdlocacao_incluir.Count - 1 do
    begin
      cdstlocacao := InteirodoCodigo(_locacao, cdlocacao_incluir[i], _cdstlocacao);
      if cdstlocacao = 5 then
      begin
        cdstlocacao := get_stlocacao_devolucao(i, tela.itsaida.Items[i])
      end
      else if cdstlocacao = 4 then
      begin
        cdstlocacao := 8
      end
      else if cdstlocacao = 9 then
      begin
        cdstlocacao := 8
      end
      else if cdstlocacao = 6 then
      begin
        cdstlocacao := 7
      end
      else if cdstlocacao = 7 then
      begin
        cdstlocacao := get_stlocacao_7(i);
      end;
      if cdlocacao_incluir[i] = '' then
      begin
        messagedlg('Código da Locação é um campo obrigatório.', mtinformation, [mbOK], 0);
        abort;
      end;
      sql.Add('update locacao set cdstlocacao='+inttostr(cdstlocacao)+' where cdempresa='+empresa.cdempresa.ToString+' and cdlocacao='+cdlocacao_incluir[i]);
      sql.Add('insert into hstlocacao(CDHSTLOCACAO,CDLOCACAO,CDSTLOCACAO,DSJUSTIFICATIVA,'+_sqlreg+
              qgerar.GerarCodigo(_hstlocacao).ToString+','+cdlocacao_incluir[i]+','+inttostr(cdstlocacao)+',NULL,'+SQLRegistra);
    end;
  end;
  procedure processar_exclusao_locacao;
  var
    i : integer;
  begin
    for i := 0 to cdlocacao_excluir.Count - 1 do
    begin
      locacao.cdlocacao := strtoint(cdlocacao_excluir[i]);
      cdstlocacao       := InteirodoCodigo(_locacao, cdlocacao_excluir[i], _cdstlocacao);
      if cdstlocacao = 8 then
      begin
        if ValordoCodigo(_locacao, cdlocacao_excluir[i], _vlrecebido) > 0 then
        begin
          cdstlocacao := 7;
        end
        else if not locacao.ExisteDevolucao then
        begin
          if not locacao.ExisteFaturamento(cditsaida_excluir[i]) then
          begin
            cdstlocacao := 4;
          end
          else
          begin
            cdstlocacao := locacao.getStatusAnteriorAtual;
            if cdstlocacao = 2 then
            begin
              cdstlocacao := locacao.getStatusAnteriorAtual(_4);
            end;
          end;
        end
        else
        begin
          cdstlocacao := RetornaSQLInteger('select first 1 cdstlocacao '+
                                           'from hstlocacao '+
                                           'where cdempresa='+empresa.cdempresa.ToString+' and cdlocacao='+cdlocacao_excluir[i]+' and cdstlocacao<>8 '+
                                           'order by CDHSTLOCACAO desc');
        end;
      end
      else if cdstlocacao = 2 then
      begin
        cdstlocacao := 5
      end
      else if cdstlocacao = 7 then
      begin
        cdstlocacao := 6;
      end;
      sql.Add('update locacao set cdstlocacao='+inttostr(cdstlocacao)+' where cdempresa='+empresa.cdempresa.ToString+' and cdlocacao='+cdlocacao_excluir[i]);
      sql.Add('insert into hstlocacao(CDHSTLOCACAO,CDLOCACAO,CDSTLOCACAO,DSJUSTIFICATIVA,'+_sqlreg+
              qgerar.GerarCodigo(_hstlocacao).ToString+','+cdlocacao_excluir[i]+','+inttostr(cdstlocacao)+',NULL,'+SQLRegistra);
    end;
  end;
begin
  if tela.tpsaida.bolocacao <> _s then
  begin
    Exit;
  end;
  cdlocacao_incluir := TStringList.Create;
  cdlocacao_excluir := TStringList.Create;
  cditsaida_excluir := TStringList.Create;
  sql := TStringList.Create;
  cdlocacaodevolucao := TStringList.Create;
  locacao := TLocacao.create;
  try
    incluir_locacao_na_lista;
    excluir_locacao_na_lista;
    processar_inclusao_locacao;
    processar_exclusao_locacao;
    if sql.Count > 0 then
    begin
      ExecutaScript(sql);
    end;
  finally
    FreeAndNil(cdlocacao_incluir);
    FreeAndNil(cdlocacao_excluir);
    FreeAndNil(cditsaida_excluir);
    FreeAndNil(cdlocacaodevolucao);
    FreeAndNil(sql);
    FreeAndNil(locacao);
  end;
end;

procedure TTelaSaida.setStatusOrdproducao;
var
  i, x : Integer;
  sql, cditpedido_incluir, cditpedido_excluir : TStrings;
  boencontrou : boolean;
  ordproducao : TOrdproducao;
begin
  if tela.tpsaida.bopedido <> _s then
  begin
    Exit;
  end;
  cditpedido_incluir := TStringList.Create;
  cditpedido_excluir := TStringList.Create;
  sql                := TStringList.Create;
  ordproducao := tordproducao.create;
  try
    for i := 0 to tela.itsaida.count - 1 do
    begin
      boencontrou := False;
      for x := 0 to dados.itsaida.count - 1 do
      begin
        if tela.itsaida.items[i].cditsaida = dados.itsaida.items[x].cditsaida then
        begin
          boencontrou := True;
          if (tela.itsaida.items[i].cditpedido <> dados.itsaida.items[x].cditpedido) then
          begin
            if (tela.itsaida.items[i].cditpedido <> 0) and (dados.itsaida.items[x].cditpedido = 0) then
            begin
              cditpedido_incluir.Add(IntToStr(tela.itsaida.items[i].cditpedido))
            end
            else if (tela.itsaida.items[i].cditpedido = 0)  and (dados.itsaida.items[x].cditpedido <> 0) then
            begin
              cditpedido_excluir.Add(IntToStr(dados.itsaida.items[x].cditpedido))
            end
            else
            begin
              cditpedido_incluir.Add(IntToStr(tela.itsaida.items[i].cditpedido));
              cditpedido_excluir.Add(IntToStr(dados.itsaida.items[x].cditpedido));
            end;
          end;
        end;
      end;
      if (not boencontrou) and (tela.itsaida.items[i].cditpedido <> 0) then
      begin
        cditpedido_incluir.Add(IntToStr(tela.itsaida.items[i].cditpedido));
      end;
    end;
    for x := 0 to dados.itsaida.count - 1 do
    begin
      boencontrou := False;
      for i := 0 to tela.itsaida.count - 1 do
      begin
        if tela.itsaida.items[i].cditsaida = dados.itsaida.items[x].cditsaida then
        begin
          boencontrou := True;
          break;
        end;
      end;
      if (not boencontrou) and (dados.itsaida.items[x].cditpedido <> 0) then
      begin
        cditpedido_excluir.Add(IntToStr(dados.itsaida.items[x].cditpedido));
      end;
    end;
    for i := 0 to cditpedido_incluir.Count - 1 do
    begin
      if ordproducao.Select(_cditpedido+'='+cditpedido_incluir[i]) then
      begin
        ordproducao.dtentrega := tela.dtemissao;
        ordproducao.cdstordproducao := 7;
        sql.Add(ordproducao.Update(true));
        sql.Add(ordproducao.RegistrarMudancaStatus(true));
      end;
    end;
    for i := 0 to cditpedido_excluir.Count - 1 do
    begin
      if ordproducao.Select(_cditpedido+'='+cditpedido_excluir[i]) then
      begin
        ordproducao.dtentrega := 0;
        ordproducao.cdstordproducao := 6;
        sql.Add(ordproducao.Update(true));
        sql.Add(ordproducao.RegistrarMudancaStatus(true));
      end;
    end;
    if sql.Count > 0 then
    begin
      ExecutaScript(sql);
    end;
  finally
    freeandnil(cditpedido_incluir);
    freeandnil(cditpedido_excluir);
    freeandnil(sql);
  end;
end;

procedure TTelaSaida.salvar;
begin
  setStatusLocacao;
  setStatusOrdproducao;
end;

procedure TTelaSaida.excluir;
begin
  setStatusLocacao;
  setStatusOrdproducao;
end;

function TTelaSaida.getLocacaoPosterior: string;
var
  i : Integer;
begin
  for i := 0 to dados.itsaida.count - 1 do
  begin
    if dados.itsaida.items[i].cdlocacao <> 0 then
    begin
      if QRegistro.InteirodoCodigo(_locacao, dados.itsaida.items[i].cdlocacao, _cdstlocacao) = 9 then // status renovada
      begin
        messagedlg('Não pode excluir a nota fiscal da locacao '+inttostr(dados.itsaida.items[i].cdlocacao)+#13'porque ela está no status de Renovada.', mtinformation, [mbok], 0);
        abort;
      end;
      result := RetornaSQLString('select first 1 itsaida.cdlocacao '+
                                 'from itsaida '+
                                 'inner join saida on saida.cdempresa=itsaida.cdempresa and saida.cdsaida=itsaida.cdsaida '+
                                 'where itsaida.cdlocacao='+inttostr(dados.itsaida.items[i].cdlocacao)+' and saida.cdserie='+inttostr(dados.cdserie)+' and saida.cdempresa='+dados.cdempresa.ToString+' '+
                                 'and saida.nusaida>'+inttostr(dados.nusaida));
      if result <> '' then
      begin
        Exit;
      end;
    end;
  end;
end;

class function TSaidaList.GerarContasAReceber(dti, dtf: TDate): Boolean;
var
  lista : TSaidaList;
  i: Integer;
begin
  lista := TSaidaList.Create;
  frmprogressbar := Tfrmprogressbar.Create(nil);
  try
    lista.Ler(_dtemissao+' '+_between+' '+formatdatetime(_mm_dd_yyyy, dti).QuotedString+' '+_and+' '+formatdatetime(_mm_dd_yyyy, dtf).QuotedString);
    frmprogressbar.gau.MaxValue := lista.Count;
    frmprogressbar.Show;
    for i := 0 to lista.Count - 1 do
    begin
      frmprogressbar.gau.Progress := i + 1;
      frmprogressbar.pnl.Caption := 'Processando '+frmprogressbar.gau.Progress.ToString+' de '+frmprogressbar.gau.MaxValue.ToString+' Nota: '+lista.Items[i].nusaida.ToString;
      Application.ProcessMessages;
      if lista.Items[i].cdcondpagto = 0 then
      begin
        Continue;
      end;
      lista.Items[i].duplicata.Ler(lista.Items[i].cdsaida);
      if lista.Items[i].duplicata.Count = 0  then
      begin
        lista.Items[i].GerarDuplicata;
        lista.Items[i].duplicata.Inserir;
      end;
    end;
    result := True;
  finally
    FreeAndNil(lista);
    FreeAndNil(frmprogressbar);
  end;
end;

function TSaidaList.GetItem(Index: Integer): Tsaida;
begin
  Result := TSaida(Inherited Items[Index]);
end;

function TSaidaList.indice(value: Integer): Integer;
var
  I: Integer;
begin
  result := -1;
  for I := 0 to count - 1 do
  begin
    if items[i].cdsaida = value then
    begin
      result := i;
      Break;
    end;
  end;
end;

function TSaidaList.Ler(sqlwhere: string): boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_where(_saida, sqlwhere));
  try
    result := Ler(q.q);
  finally
    FreeAndNil(q);
  end;
end;

function TSaidaList.Ler(Dataset: TDataset): Boolean;
begin
  clear;
  result := False;
  dataset.first;
  while not dataset.Eof do
  begin
    new.select(dataset);
    dataset.Next;
    result := True;
  end;
end;

function TSaidaList.New: Tsaida;
begin
  Result := TSaida.Create;
  Add(Result);
end;

procedure TSaidaList.SetItem(Index: Integer; const Value: Tsaida);
begin
  Put(Index, Value);
end;

end.
