unit ORM.OrdServ;

interface

uses
  System.Actions, System.UITypes, data.db,
  ComCtrls, controls, dialogs, ActnList, ExtCtrls, forms, sysutils, classes,
  rotina.montarsql, rotina.datahora, uconstantes, rotina.registro, dialogo.progressbar, rotina.strings,
  classe.aplicacao, rotina.retornasql, orm.empresa, classe.executasql, classe.query,
  classe.registrainformacao, classe.gerar, classe.dao, orm.usuario, orm.cliente,
  orm.TPOrdserv, orm.ItOrdserv, orm.ItDefApr, orm.ItAcessorio, orm.Prioridade;

Type
  TOrdServ = class(TRegistroQuipos)
  private
    Fprcomissaoprodutoorcado: double;
    Fprcomissaoorcado: double;
    Fprcomissaoorcadoproduto: double;
    Fvlmaoobra: currency;
    Ftppreco: string;
    Ftpprecoproduto: string;
    Fvlproduto: currency;
    Fnubateria: string;
    Fnmcontato: string;
    Fnunffatura: string;
    Fcdcliente: LargeInt;
    Fhrorcadof: TTime;
    Fvlcomissaovendedor: currency;
    Fvlcomissaovendedorproduto: currency;
    Fnufone: string;
    Fnuordserv: integer;
    Fcdordservanterior: integer;
    Fcdcondpagto: integer;
    Fnunfdevolucao: string;
    Fhrentregue: TTime;
    Fdslocalizacaoconserto: string;
    Fprcomissaoatendente: double;
    Fprcomissaoatendenteproduto: double;
    Ftsliberado: TTimeStamp;
    Fdtaprovacao: TDate;
    Fvldesconto: currency;
    Fcdmodelo: integer;
    Fcdfuncionarioentregue: integer;
    Fhrdevolucaosemconserto: TTime;
    Fnuseqequipamento: string;
    Fbomedicao: boolean;
    Fdsdefenc: string;
    Fvlcomissaoservicoconserto: currency;
    Fhrconserto: TTime;
    Fdsavaliacaotecnica: string;
    Fdtsaida: TDate;
    Fprcomissaoservicoorcado: double;
    Fcdfuncionarioconserto: integer;
    Fprcomissaoorcadoservico: double;
    Fprcomissaotecnico: double;
    Fprcomissaotecnicoproduto: double;
    Fbosaida: boolean;
    Fnuimpfechamento: integer;
    Fvlservico: currency;
    Fvlcomissaovendedorservico: currency;
    Fnukm: integer;
    Fnucoleta: string;
    Fdtcomunicacao: TDate;
    Fdtorcado: TDate;
    Fdtprevorcamento: TDate;
    Fdtpronta: TDate;
    Fdsobservacao: string;
    Fnuoscliente: string;
    Fnupedido: string;
    Fcdfuncionariovendedor: integer;
    Fprcomissaoatendenteservico: double;
    Fnucontroleinterno: string;
    Fcdclientecobranca: LargeInt;
    Fhrdevolucaosemconsertohora: TTime;
    Fqtitem: double;
    Fhrenvio: TTime;
    Fcdstordserv: integer;
    Fhrconsertohora: TTime;
    Fcdtpordserv: integer;
    Fprcomissaotecnicoservico: double;
    Fdtpreventrega: TDate;
    Fnupatrimonio: string;
    Fdtgarantia: TDate;
    Fpracrescservico: double;
    Fvltotal: currency;
    Fcdetapa: integer;
    Fnuserie: string;
    Fcdmarca: integer;
    Fcdtpequipamento: integer;
    Fhrdevolucaosemconsertof: TTime;
    Fprcomissaoprodutoconserto: double;
    Fnunf: integer;
    Fvlcomissaoprodutoorcado: currency;
    Fdslocalizacaodevolvidoconserto: string;
    Fhrconsertof: TTime;
    Fvlcomissaoorcado: currency;
    Fvlcomissaoorcadoproduto: currency;
    Fdtentrada: TDate;
    Fcdsaida: integer;
    Fdsdevolucaosemconserto: string;
    Fprcomissaovendedor: double;
    Fprcomissaovendedorproduto: double;
    Fboentrada: boolean;
    Fdtpreventregaorcamento: TDate;
    Fhraprovacao: TTime;
    Fdtpedido: TDate;
    Fnuproposta: string;
    Fcditordproducao: integer;
    Fnuano: integer;
    Fvlcomissao: currency;
    Fvlcomissaoproduto: currency;
    Fvlprodutocomissao: currency;
    Fprcustoreparo: double;
    Fvlliquido: currency;
    Fhrresolucao: TTime;
    Fcdcomputadorl: integer;
    Fcdfuncionariodevolvidoconserto: integer;
    Fvlcomissaoatendente: currency;
    Fvlcomissaoatendenteproduto: currency;
    Fdtretornoorcamento: TDate;
    Fdsteste: string;
    Fhrsaida: TTime;
    Fdslocalizacaoorcado: string;
    Fvlfita: currency;
    Fnudiaspreventrega: integer;
    Fcdtpcobranca: integer;
    Fdtentregue: TDate;
    Fprcomissaoservicoconserto: double;
    Fnuestrutura: integer;
    Fnudiasvalidadeorcamento: integer;
    Fcdusuariol: integer;
    Fcdordserv: integer;
    Ftpordserv: TTPOrdserv;
    Fvlcomissaoservicoorcado: currency;
    Fhrorcado: TTime;
    Fdtdevolucaosemconserto: TDate;
    Fvlcomissaoorcadoservico: currency;
    Fvlcomissaotecnico: currency;
    Fvlcomissaotecnicoproduto: currency;
    Fdslocalizacao: string;
    Fhrprevorcamento: TTime;
    Fhrpronta: TTime;
    Fcdtpvoltagem: integer;
    Fcdrepresentante: integer;
    Fcdprioridade: integer;
    Fcdfuncionarioorcado: integer;
    Fdtconserto: TDate;
    Fprcomissaovendedorservico: double;
    Fhratendimento: TTime;
    Fcdcor: integer;
    Fnmentreguepara: string;
    Fvlcomissaoservico: currency;
    Fvlservicocomissao: currency;
    Fdsdefrec: string;
    Fdtnf: TDate;
    Fcdgarantia: integer;
    Fcdequipamento: integer;
    Fvlcomissaoatendenteservico: currency;
    Fbocontrato: boolean;
    Fvlpeca: currency;
    Fhrpreventrega: TTime;
    Fdssolinterna: string;
    Fdssolucao: string;
    Fcditentrada: integer;
    Fcdfuncionarioatendente: integer;
    Fcdcondentrega: integer;
    Fnuentreguedocumento: string;
    Fnudiasexecucao: integer;
    Fvlservicoterceiro: currency;
    Fdtfatura: TDate;
    Fhrorcadohora: TTime;
    Fvlcomissaotecnicoservico: currency;
    Fdsdefeito: string;
    Fboservicoentregue: boolean;
    Fdsobsinterna: string;
    Fdsjustificativa: string;
    Fdtenvio: TDate;
    Fnucomprimento: double;
    Fvlacrescservico: currency;
    Fdtdevolucao: TDate;
    Fcdfuncionariotecnico: integer;
    Fvlfabricar: currency;
    Fhrentrada: TTime;
    Fvlcomissaoprodutoconserto: currency;
    Fboservicointerno: boolean;
    Fcdlocalservico: integer;
    fPrioridade: TPrioridade;
    fcliente: tcliente;
    procedure Setcdlocalservico(const Value: integer);
    function  ExisteStatusMesmoNomeEtapa(cdetapa:string):Boolean;
    function  gerarSQLMudarStatusNomeEtapa(cdetapa, cdordserv:string):string;
    function  PreencherDataSaidaScript(cdordserv:string):string;
    procedure inserirRegistroCheckList(codigo: integer; tipo:string);
  public
    property cliente: tcliente read fcliente write fcliente;
    [keyfield]
    property cdordserv : integer read Fcdordserv write fcdordserv;
    [fk]
    property cdlocalservico : integer read Fcdlocalservico write Setcdlocalservico;
    [fk]
    property cdcliente : LargeInt read Fcdcliente write fcdcliente;
    [fk]
    property cdclientecobranca : LargeInt read Fcdclientecobranca write fcdclientecobranca;
    [fk]
    property cdcondentrega : integer read Fcdcondentrega write fcdcondentrega;
    [fk]
    property cdcondpagto : integer read Fcdcondpagto write fcdcondpagto;
    [fk]
    property cdequipamento : integer read Fcdequipamento write fcdequipamento;
    [fk]
    property cdetapa : integer read Fcdetapa write fcdetapa;
    [fk]
    property cdordservanterior : integer read Fcdordservanterior write fcdordservanterior;
    [fk]
    property cdprioridade : integer read Fcdprioridade write fcdprioridade;
    [fk]
    property cdstordserv : integer read Fcdstordserv write fcdstordserv;
    [fk]
    property cdtpordserv : integer read Fcdtpordserv write fcdtpordserv;
    [fk]
    property cdfuncionarioatendente : integer read Fcdfuncionarioatendente write fcdfuncionarioatendente;
    [fk]
    property cdfuncionariotecnico : integer read Fcdfuncionariotecnico write fcdfuncionariotecnico;
    [fk]
    property cdsaida : integer read Fcdsaida write fcdsaida;
    [fk]
    property cdgarantia : integer read Fcdgarantia write fcdgarantia;
    [fk]
    property cdfuncionariovendedor : integer read Fcdfuncionariovendedor write fcdfuncionariovendedor;
    [fk]
    property cdrepresentante : integer read Fcdrepresentante write fcdrepresentante;
    [fk]
    property cditentrada : integer read Fcditentrada write fcditentrada;
    [fk]
    property cdusuariol : integer read Fcdusuariol write fcdusuariol;
    [fk]
    property cdcomputadorl : integer read Fcdcomputadorl write fcdcomputadorl;
    [fk]
    property cdtpequipamento : integer read Fcdtpequipamento write fcdtpequipamento;
    [fk]
    property cdmodelo : integer read Fcdmodelo write fcdmodelo;
    [fk]
    property cdmarca : integer read Fcdmarca write fcdmarca;
    [fk]
    property cdtpcobranca : integer read Fcdtpcobranca write fcdtpcobranca;
    [fk]
    property cditordproducao : integer read Fcditordproducao write fcditordproducao;
    [fk]
    property cdtpvoltagem : integer read Fcdtpvoltagem write fcdtpvoltagem;
    property nuordserv : integer read Fnuordserv write fnuordserv;
    property dtentrada : TDate read Fdtentrada write fdtentrada;
    property hrentrada : TTime read Fhrentrada write fhrentrada;
    property dtsaida : TDate read Fdtsaida write fdtsaida;
    property hrsaida : TTime read Fhrsaida write fhrsaida;
    property dtenvio : TDate read Fdtenvio write fdtenvio;
    property dtcomunicacao : TDate read Fdtcomunicacao write fdtcomunicacao;
    property nucoleta : string read Fnucoleta write fnucoleta;
    property nuproposta : string read Fnuproposta write fnuproposta;
    property nupedido : string read Fnupedido write fnupedido;
    property nuoscliente : string read Fnuoscliente write fnuoscliente;
    property vlservico : currency read Fvlservico write fvlservico;
    property vlpeca : currency read Fvlpeca write fvlpeca;
    property vltotal : currency read Fvltotal write fvltotal;
    property nunf : integer read Fnunf write fnunf;
    property dtnf : TDate read Fdtnf write fdtnf;
    property dtpedido : TDate read Fdtpedido write fdtpedido;
    property dtfatura : TDate read Fdtfatura write fdtfatura;
    property dtdevolucao : TDate read Fdtdevolucao write fdtdevolucao;
    property dtpreventrega : TDate read Fdtpreventrega write fdtpreventrega;
    property nunfdevolucao : string read Fnunfdevolucao write fnunfdevolucao;
    property nunffatura : string read Fnunffatura write fnunffatura;
    property dsobservacao : string read Fdsobservacao write fdsobservacao;
    property dssolucao : string read Fdssolucao write fdssolucao;
    property dsdefenc : string read Fdsdefenc write fdsdefenc;
    property dsdefrec : string read Fdsdefrec write fdsdefrec;
    property pracrescservico : double read Fpracrescservico write fpracrescservico;
    property vlacrescservico : currency read Fvlacrescservico write fvlacrescservico;
    property dsteste : string read Fdsteste write fdsteste;
    property bomedicao : boolean read Fbomedicao write fbomedicao;
    property nmcontato : string read Fnmcontato write fnmcontato;
    property nufone : string read Fnufone write fnufone;
    property hratendimento : TTime read Fhratendimento write fhratendimento;
    property hrresolucao : TTime read Fhrresolucao write fhrresolucao;
    property vldesconto : currency read Fvldesconto write fvldesconto;
    property vlliquido : currency read Fvlliquido write fvlliquido;
    property dsjustificativa : string read Fdsjustificativa write fdsjustificativa;
    property dsobsinterna : string read Fdsobsinterna write fdsobsinterna;
    property dssolinterna : string read Fdssolinterna write fdssolinterna;
    property nuimpfechamento : integer read Fnuimpfechamento write fnuimpfechamento;
    property bocontrato : boolean read Fbocontrato write fbocontrato;
    property nukm : integer read Fnukm write fnukm;
    property nubateria : string read Fnubateria write fnubateria;
    property vlfabricar : currency read Fvlfabricar write fvlfabricar;
    property hrpreventrega : TTime read Fhrpreventrega write fhrpreventrega;
    property dtpronta : TDate read Fdtpronta write fdtpronta;
    property hrpronta : TTime read Fhrpronta write fhrpronta;
    property dtaprovacao : TDate read Fdtaprovacao write fdtaprovacao;
    property hraprovacao : TTime read Fhraprovacao write fhraprovacao;
    property dtprevorcamento : TDate read Fdtprevorcamento write fdtprevorcamento;
    property hrprevorcamento : TTime read Fhrprevorcamento write fhrprevorcamento;
    property nuseqequipamento : string read Fnuseqequipamento write fnuseqequipamento;
    property dslocalizacao : string read Fdslocalizacao write fdslocalizacao;
    property vlproduto : currency read Fvlproduto write fvlproduto;
    property vlservicoterceiro : currency read Fvlservicoterceiro write fvlservicoterceiro;
    property nucontroleinterno : string read Fnucontroleinterno write fnucontroleinterno;
    property tpprecoproduto : string read Ftpprecoproduto write ftpprecoproduto;
    property nudiasvalidadeorcamento : integer read Fnudiasvalidadeorcamento write fnudiasvalidadeorcamento;
    property nudiaspreventrega : integer read Fnudiaspreventrega write fnudiaspreventrega;
    property dtgarantia : TDate read Fdtgarantia write fdtgarantia;
    property boservicoentregue : boolean read Fboservicoentregue write fboservicoentregue;
    property boservicointerno : boolean read Fboservicointerno write fboservicointerno;
    property nudiasexecucao : integer read Fnudiasexecucao write fnudiasexecucao;
    property dtpreventregaorcamento : TDate read Fdtpreventregaorcamento write fdtpreventregaorcamento;
    property prcustoreparo : double read Fprcustoreparo write fprcustoreparo;
    property dtretornoorcamento : TDate read Fdtretornoorcamento write fdtretornoorcamento;
    property tppreco : string read Ftppreco write ftppreco;
    property hrenvio : TTime read Fhrenvio write fhrenvio;
    property vlfita : currency read Fvlfita write fvlfita;
    property vlmaoobra : currency read Fvlmaoobra write fvlmaoobra;
    property tsliberado : TTimeStamp read Ftsliberado write ftsliberado;
    property dsdefeito : string read Fdsdefeito write fdsdefeito;
    property dsavaliacaotecnica : string read Fdsavaliacaotecnica write fdsavaliacaotecnica;
    property nuserie : string read Fnuserie write fnuserie;
    property nucomprimento : double read Fnucomprimento write fnucomprimento;
    property nuestrutura : integer read Fnuestrutura write fnuestrutura;
    property nupatrimonio : string read Fnupatrimonio write fnupatrimonio;
    property boentrada : boolean read Fboentrada write fboentrada;
    property bosaida : boolean read Fbosaida write fbosaida;
    property qtitem : double read Fqtitem write fqtitem;
    property vlprodutocomissao : currency read Fvlprodutocomissao write fvlprodutocomissao;
    property vlservicocomissao : currency read Fvlservicocomissao write fvlservicocomissao;
    property vlcomissaovendedorproduto : currency read Fvlcomissaovendedorproduto write fvlcomissaovendedorproduto;
    property vlcomissaotecnicoproduto : currency read Fvlcomissaotecnicoproduto write fvlcomissaotecnicoproduto;
    property vlcomissaoatendenteproduto : currency read Fvlcomissaoatendenteproduto write fvlcomissaoatendenteproduto;
    property prcomissaovendedorproduto : double read Fprcomissaovendedorproduto write fprcomissaovendedorproduto;
    property prcomissaotecnicoproduto : double read Fprcomissaotecnicoproduto write fprcomissaotecnicoproduto;
    property prcomissaoatendenteproduto : double read Fprcomissaoatendenteproduto write fprcomissaoatendenteproduto;
    property prcomissaovendedorservico : double read Fprcomissaovendedorservico write fprcomissaovendedorservico;
    property prcomissaotecnicoservico : double read Fprcomissaotecnicoservico write fprcomissaotecnicoservico;
    property prcomissaoatendenteservico : double read Fprcomissaoatendenteservico write fprcomissaoatendenteservico;
    property vlcomissaovendedorservico : currency read Fvlcomissaovendedorservico write fvlcomissaovendedorservico;
    property vlcomissaotecnicoservico : currency read Fvlcomissaotecnicoservico write fvlcomissaotecnicoservico;
    property vlcomissaoatendenteservico : currency read Fvlcomissaoatendenteservico write fvlcomissaoatendenteservico;
    property vlcomissaoatendente : currency read Fvlcomissaoatendente write fvlcomissaoatendente;
    property vlcomissaotecnico : currency read Fvlcomissaotecnico write fvlcomissaotecnico;
    property vlcomissaovendedor : currency read Fvlcomissaovendedor write fvlcomissaovendedor;
    property prcomissaoatendente : double read Fprcomissaoatendente write fprcomissaoatendente;
    property prcomissaotecnico : double read Fprcomissaotecnico write fprcomissaotecnico;
    property prcomissaovendedor : double read Fprcomissaovendedor write fprcomissaovendedor;
    property vlcomissaoservico : currency read Fvlcomissaoservico write fvlcomissaoservico;
    property vlcomissaoproduto : currency read Fvlcomissaoproduto write fvlcomissaoproduto;
    property vlcomissao : currency read Fvlcomissao write fvlcomissao;
    property vlcomissaoorcadoproduto : currency read Fvlcomissaoorcadoproduto write fvlcomissaoorcadoproduto;
    property prcomissaoorcadoproduto : double read Fprcomissaoorcadoproduto write fprcomissaoorcadoproduto;
    property prcomissaoorcadoservico : double read Fprcomissaoorcadoservico write fprcomissaoorcadoservico;
    property vlcomissaoorcadoservico : currency read Fvlcomissaoorcadoservico write fvlcomissaoorcadoservico;
    property vlcomissaoorcado : currency read Fvlcomissaoorcado write fvlcomissaoorcado;
    property prcomissaoorcado : double read Fprcomissaoorcado write fprcomissaoorcado;
    property cdfuncionarioconserto : integer read Fcdfuncionarioconserto write fcdfuncionarioconserto;
    property dtconserto : TDate read Fdtconserto write fdtconserto;
    property hrconserto : TTime read Fhrconserto write fhrconserto;
    property hrconsertof : TTime read Fhrconsertof write fhrconsertof;
    property hrconsertohora : TTime read Fhrconsertohora write fhrconsertohora;
    property dslocalizacaoconserto : string read Fdslocalizacaoconserto write fdslocalizacaoconserto;
    property prcomissaoprodutoconserto : double read Fprcomissaoprodutoconserto write fprcomissaoprodutoconserto;
    property vlcomissaoprodutoconserto : currency read Fvlcomissaoprodutoconserto write fvlcomissaoprodutoconserto;
    property prcomissaoservicoconserto : double read Fprcomissaoservicoconserto write fprcomissaoservicoconserto;
    property vlcomissaoservicoconserto : currency read Fvlcomissaoservicoconserto write fvlcomissaoservicoconserto;
    property cdfuncionariodevolvidoconserto : integer read Fcdfuncionariodevolvidoconserto write fcdfuncionariodevolvidoconserto;
    property dtdevolucaosemconserto : TDate read Fdtdevolucaosemconserto write fdtdevolucaosemconserto;
    property hrdevolucaosemconserto : TTime read Fhrdevolucaosemconserto write fhrdevolucaosemconserto;
    property hrdevolucaosemconsertof : TTime read Fhrdevolucaosemconsertof write fhrdevolucaosemconsertof;
    property hrdevolucaosemconsertohora : TTime read Fhrdevolucaosemconsertohora write fhrdevolucaosemconsertohora;
    property dslocalizacaodevolvidoconserto : string read Fdslocalizacaodevolvidoconserto write fdslocalizacaodevolvidoconserto;
    property dsdevolucaosemconserto : string read Fdsdevolucaosemconserto write fdsdevolucaosemconserto;
    property cdfuncionarioorcado : integer read Fcdfuncionarioorcado write fcdfuncionarioorcado;
    property dtorcado : TDate read Fdtorcado write fdtorcado;
    property hrorcado : TTime read Fhrorcado write fhrorcado;
    property hrorcadof : TTime read Fhrorcadof write fhrorcadof;
    property hrorcadohora : TTime read Fhrorcadohora write fhrorcadohora;
    property dslocalizacaoorcado : string read Fdslocalizacaoorcado write fdslocalizacaoorcado;
    property prcomissaoprodutoorcado : double read Fprcomissaoprodutoorcado write fprcomissaoprodutoorcado;
    property vlcomissaoprodutoorcado : currency read Fvlcomissaoprodutoorcado write fvlcomissaoprodutoorcado;
    property prcomissaoservicoorcado : double read Fprcomissaoservicoorcado write fprcomissaoservicoorcado;
    property vlcomissaoservicoorcado : currency read Fvlcomissaoservicoorcado write fvlcomissaoservicoorcado;
    property cdfuncionarioentregue : integer read Fcdfuncionarioentregue write fcdfuncionarioentregue;
    property dtentregue : TDate read Fdtentregue write fdtentregue;
    property hrentregue : TTime read Fhrentregue write fhrentregue;
    property nmentreguepara : string read Fnmentreguepara write fnmentreguepara;
    property nuentreguedocumento : string read Fnuentreguedocumento write fnuentreguedocumento;
    property cdcor : integer read Fcdcor write fcdcor;
    property nuano : integer read Fnuano write fnuano;
    property tpordserv : TTPOrdserv read Ftpordserv write ftpordserv;
    property prioridade : TPrioridade read fPrioridade write fPrioridade;
    constructor create; overload;
    destructor destroy; override;
    function  AlterarEtapa(cdordserv, cdetapa, cdetapaproximo:Integer):boolean;
    function  AlterarEtapaOrdserv(cdordserv, cdetapa, cdetapaproximo:integer):boolean;
    function  checkList(codigo:integer; tipo:string):Boolean;
    function  FinalizarEtapa(cditetapa :string):string;
    function  InserirNovaEtapa(cdordserv, cdetapa :Integer):string;
    procedure limparCheckList(codigo:string);
    function  MudarEtapa(cdordserv, cdetapaproximo:integer):boolean;
    function  QtdItensEtapa(cdetapa:string):integer;
    function  QtdItensEtapaFuncionario(cdetapa, cdfuncionario:string):integer;
    function  setCheckList(codigo: integer; tipo:string):Boolean;
  end;

implementation

uses dialogo.tabela;

function TOrdserv.QtdItensEtapa(cdetapa:string):integer;
begin
  result := RetornaSQLInteger('select count(*) from ordserv where cdempresa='+empresa.cdempresa.tostring+' and cdetapa='+cdetapa);
end;

function TOrdServ.QtdItensEtapaFuncionario(cdetapa, cdfuncionario:string):integer;
begin
  result := RetornaSQLInteger('select count(*) from itetapa where cdempresa='+empresa.cdempresa.tostring+' and dtfinal is null and cdetapa='+cdetapa+' and cdfuncionario='+cdfuncionario);
end;

procedure TOrdServ.Setcdlocalservico(const Value: integer);
begin
  Fcdlocalservico := Value;
end;

function TOrdServ.AlterarEtapa(cdordserv, cdetapa, cdetapaproximo:integer):boolean;
begin // exibir form para escolher a proxima etapa sem a etapa atual
  AlterarEtapaOrdserv(cdordserv, cdetapa, cdetapaproximo);
  result := true;
end;

function TOrdserv.AlterarEtapaOrdserv(cdordserv, cdetapa, cdetapaproximo:integer):boolean;
var
  resposta : integer;
begin
  result         := false;
  if Empresa.ordserv.workbox.boconfirmarmudancaetapa then
  begin
    resposta := messagedlg('Deseja realmente mudar a '    +#13+
                           'Ordem de Servivo : '+QRegistro.CampodoCampo(_ordserv, _cdordserv, IntToStr(cdordserv), _nuordserv)+#13+
                           'da etapa : '        +qregistro.nomedocodigo(_etapa, cdetapa)  +#13+
                           'para a etapa: '     +qregistro.NomedoCodigo(_etapa, cdetapaproximo)+'?', mtconfirmation, [mbyes, mbno], 0)
  end
  else
  begin
    resposta := mryes;
  end;
  if resposta = mrno then
  begin
    exit;
  end;
  result := MudarEtapa(cdordserv, cdetapaproximo);
end;

function TOrdServ.MudarEtapa(cdordserv, cdetapaproximo:integer):boolean;
var
  sql: TStrings;
  cdstitordservf, cdstitordservi, cditetapa : string;
begin
  result := false;
  sql    := tstringlist.create;
  try
    // obter o último item da Etapa
    cditetapa := RetornaSQLString('select max(cditetapa) from itetapa where cdempresa='+empresa.cdempresa.tostring+' and cdordserv='+IntToStr(cdordserv));
    sql.add('update ordserv set cdetapa='+IntToStr(cdetapaproximo)+' where cdempresa='+empresa.cdempresa.tostring+' and cdordserv='+IntToStr(cdordserv)+';');
    try
      if cditetapa <> '' then
      begin
        sql.add(FinalizarEtapa  (cditetapa)+';');
      end;
      sql.add(InserirNovaEtapa(cdordserv, cdetapaproximo)+';');
      // verificar se a etapa de destino possui alteracao no status do servico
      cdstitordservi := NomedoCodigo(_etapa, IntToStr(cdetapaproximo), _cdstitordserv+_i);
      cdstitordservf := Nomedocodigo(_etapa, IntToStr(cdetapaproximo), _cdstitordserv+_f);

      if (cdstitordservi <> '') and (cdstitordservf <> '') then
      begin
        sql.add('update itordserv set cdstitordserv='+cdstitordservf+' where cdempresa='+empresa.cdempresa.tostring+' and cdordserv='+IntToStr(cdordserv)+' and cdstitordserv='+cdstitordservi+';');
      end;

      if NomedoCodigo(_etapa, IntToStr(cdetapaproximo)) = 'ENTREGUE' then
      begin
        sql.add(PreencherDataSaidaScript(IntToStr(cdordserv))+';');
      end;

      if ExisteStatusMesmoNomeEtapa(IntToStr(cdetapaproximo)) then
      begin
        sql.Add(gerarSQLMudarStatusNomeEtapa(IntToStr(cdetapaproximo), IntToStr(cdordserv))+';');
      end;
      result := ExecutaScript(sql);
    except
      messagedlg('Registro sendo atualizado por outro usuário.'#13'Espere durante certo tempo e depois tente novamente.', mterror, [mbok], 0);
    end;
  finally
    freeandnil(sql);
  end;
end;

function TOrdserv.PreencherDataSaidaScript(cdordserv:string):string;
begin
  result := 'update ordserv set dtsaida='+quotedstr(DtBancos)+' where cdempresa='+empresa.cdempresa.tostring+' and cdordserv='+cdordserv;
end;

function TOrdServ.InserirNovaEtapa(cdordserv, cdetapa:integer): string;
begin
  result := 'insert into itetapa(CDORDSERV,CDITETAPA,CDETAPA,CDSTITETAPA,DTINICIO,HRINICIO,'+_sqlreg+
            IntToStr(cdordserv)+','+
            qgerar.GerarCodigo(_itetapa).ToString+','+
            inttostr(cdetapa)+',1,'+
            quotedstr(dtbancos)+','+
            quotedstr(hrserver)+','+
            sqlregistra;
end;

function TOrdServ.FinalizarEtapa(CDitetapa:string): string;
begin
  result := 'update itetapa '+
            'set dtfinal='+quotedstr(dtbancos)+
            ',hrfinal='+quotedstr(hrserver)+
            ','+_tsalteracao+'='+quotedstr(tsBancos)+','+_cdusuarioa+'='+inttostr(usuario.cdusuario)+','+_cdcomputadora+'='+vgcdcomputador+' '+
            'where cdempresa='+empresa.cdempresa.tostring+' and cditetapa='+cditetapa;
end;

constructor TOrdServ.create;
begin
  inherited;
  fcliente := tcliente.create;
  ftpordserv := ttpordserv.create;
  fprioridade := tprioridade.create;
end;

function TOrdServ.ExisteStatusMesmoNomeEtapa(cdetapa:string): Boolean;
begin
  result := RetornaSQLInteger('select count(*) '+
                                    'from stordserv '+
                                    'where cdempresa='+empresa.cdempresa.tostring+' '+
                                    'and nmstordserv=(select nmetapa '+
                                                     'from etapa '+
                                                     'where cdempresa='+empresa.cdempresa.tostring+' and cdetapa='+cdetapa+')') > 0;
end;

function TOrdServ.gerarSQLMudarStatusNomeEtapa(cdetapa, cdordserv: string): string;
begin
  result := 'update ordserv '+
            'set cdstordserv=(select cdstordserv '+
                             'from stordserv '+
                             'where cdempresa='+empresa.cdempresa.tostring+' '+
                             'and nmstordserv=(select nmetapa '+
                                              'from etapa '+
                                              'where cdempresa='+empresa.cdempresa.tostring+' and cdetapa='+cdetapa+')) '+
            'where cdempresa='+empresa.cdempresa.tostring+' and cdordserv='+cdordserv;
end;

function TOrdServ.checkList(codigo: integer; tipo: string): Boolean;
begin
  if (tipo = _entrada) and (tpordserv.boentrada <> _s) then
  begin
    result := True;
    Exit;
  end;
  if (tipo = _saida) and (tpordserv.bosaida <> _s) then
  begin
    result := True;
    Exit;
  end;
  inserirRegistroCheckList(codigo, tipo);
  result := True;
  if not qregistro.BooleandoCodigo(_ordserv, codigo, _bo+tipo) then
  begin
    Abrir_dlg_Tabela(_ordserv+tipo, codigo, _cdordserv, false, false, qregistro.DatadoCodigo(_ordserv, codigo, _dtsaida)=0, false);
    result := setCheckList(codigo, tipo);
    if not result then
    begin
      Abort;
    end;
  end;
end;

function TOrdServ.setCheckList(codigo: integer; tipo: string): Boolean;
begin
  result := RetornaSQLInteger('select count(*) from ordserv'+tipo+' where CDTPRESPOSTACHECKLIST IS NULL and cdempresa='+empresa.cdempresa.tostring+' and cdordserv='+codigo.tostring) = 0;
  if result then
  begin
    ExecutaSQL('update ordserv set bo'+tipo+'=''S'' where cdempresa='+empresa.cdempresa.tostring+' and cdordserv='+codigo.tostring);
  end;
end;

procedure TOrdServ.inserirRegistroCheckList(codigo: integer; tipo: string);
var
  q : TClasseQuery;
  sql : TStrings;
begin
  if RegistroExiste(_ordserv+tipo, _cdordserv+'='+codigo.tostring) then
  begin
    Exit;
  end;
  q := TClasseQuery.create;
  sql := TStringList.Create;
  try
    q.q.Open('SELECT CDTPEQUIPAMENTO'+tipo+' '+
             'FROM TPEQUIPAMENTO'+tipo+' '+
             'WHERE BOATIVO=''S'' AND CDEMPRESA='+empresa.cdempresa.tostring+' and cdtpequipamento='+qregistro.StringdoCodigo(_ordserv, codigo, _cdtpequipamento)+' '+
             'ORDER BY NUSEQUENCIA');
    while not q.q.Eof do
    begin
      sql.Add('insert into ordserv'+tipo+
              '(CDORDSERV'+tipo+',CDORDSERV,CDTPEQUIPAMENTO'+tipo+',CDTPRESPOSTACHECKLIST,'+_sqlreg+
              QGerar.GerarCodigo(_ordserv+tipo).ToString+','+codigo.tostring+','+q.q.fieldbyname(_cdtpequipamento+tipo).AsString+',null,'+SQLRegistra+';');
      q.q.Next;
    end;
    if sql.Count > 0 then
    begin
      ExecutaScript(sql);
    end;
  finally
    freeandnil(q);
    freeandnil(sql);
  end;
end;

procedure TOrdServ.limparCheckList(codigo: string);
begin
  ExecutaSQL('delete from ordserventrada where cdempresa='+empresa.cdempresa.tostring+' and cdordserv='+codigo);
  ExecutaSQL('delete from ordservsaida where cdempresa='+empresa.cdempresa.tostring+' and cdordserv='+codigo);
  ExecutaSQL('update ordserv set boentrada=null where cdempresa='+empresa.cdempresa.tostring+' and cdordserv='+codigo);
  ExecutaSQL('update ordserv set bosaida=null where cdempresa='+empresa.cdempresa.tostring+' and cdordserv='+codigo);
end;

destructor TOrdServ.destroy;
begin
  freeandnil(fcliente);
  FreeAndNil(ftpordserv);
  FreeAndNil(fprioridade);
  inherited;
end;

end.
