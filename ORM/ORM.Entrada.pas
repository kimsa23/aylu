unit ORM.Entrada;

interface

uses
  System.Actions, System.UITypes,
  forms, dialogs, Controls, classes, SysUtils, stdctrls, Variants, Contnrs,
  pcnNFe, pcnConversao,
  DB, dbclient,
  ACBrNFe,
  rotina.strings, rotina.datahora, rotina.Rotinas, uRichEdit, rotina.registro, rotina.numero,
  ulocalizar, dialogo.SelecionarEntrada, rotina.validadocumento, dialogo.ProgressBar,
  rotina.system, uconstantes, localizar.produto, orm.tpentrada,
  classe.aplicacao, orm.usuario, orm.empresa, classe.gerar, orm.uf, orm.itentrada,
  classe.executasql, rotina.retornasql, classe.registrainformacao, rotina.consiste, orm.movto,
  orm.produto, classe.form, orm.saida, orm.cliente, orm.fornecedor,
  classe.query, orm.autpagto, classe.dao, orm.condpagto;

type
  TEntrada = class(TRegistroQuipos)
  private
    Fbocreditosttransporte: String;
    Fboipibcicms: String;
    Fboicmsstitem: String;
    Fboretencaopis: String;
    Fboicmssubtribntotal: String;
    Fbodescontoitem: String;
    Fboretencaocofins: String;
    Fbooptantesimples: String;
    Fboarredondar: String;
    Fboexportado: String;
    Fbopagtovista: String;
    Fbofreteitem: String;
    Fvlipi: currency;
    Fvliss: currency;
    Fvlpis: currency;
    Fvlbasefretesub: currency;
    Fvlbaseipi: currency;
    Fvlcofinssubtrib: currency;
    Fvlicmssubtrib: currency;
    Fvldesconto: currency;
    Fvlliqsdesc: currency;
    Fvlbasecofinssubtrib: currency;
    Fvlisssdesc: currency;                                           
    Fvlbasepissubtrib: currency;
    Fvlliquido: currency;
    Fvlbaseicmssubtrib: currency;
    Fvlfretesub: currency;
    Fvlbasepis: currency;
    Fvltotal: currency;
    Fvlcofinsret: currency;
    Fvlpissubtrib: currency;
    Fvlbasecofins: currency;
    Fvlseguro: currency;
    Fvlinss: currency;
    Fvloutdespesa: currency;
    Fvlpisret: currency;
    Fvlservico: currency;
    Fvlicms: currency;
    Fvlirrf: currency;
    Fvlfrete: currency;
    Fvlicmssfretencontrib: currency;
    Fvlbaseicms: currency;
    Fvlcofins: currency;
    Fvlproduto: currency;
    Fvlcontribsocial: currency;
    Falcofinssubtrib: double;
    Fprdesconto: double;
    Fqtvolume: double;
    Falpissubtrib: double;
    Fprlucro: double;
    Falfretesub: double;
    Fpsliquido: double;
    Fpsbruto: double;
    Fcdentrada: integer;
    Fnuentrada: integer;
    Fcdprotocolo: integer;
    Fnseqevento: integer;
    Fcdsaida: integer;
    Fcdtpcobranca: integer;
    Fcdtpentrada: integer;
    Fcdcfop: integer;
    Fcduf: integer;
    Fcdtpfrete: String;
    Fcdtpligacaoc500: integer;
    Fcdentradact: integer;
    Fcdplconta: integer;
    Fcdcntcusto: integer;
    Fnuentradact: integer;
    Fcdcondpagto: integer;
    Fcdtransportadora: largeint;
    Fnuplaca: string;
    Fnuchavenfse: string;
    Fnmespecievolume: string;
    Fdsobservacao: string;
    Fnustdocumento: string;
    Fnuchavenfe: string;
    Fnusubserie: string;
    Fcdfornecedor: LargeInt;
    Fcdgrupotensaoc500: string;
    Fdshistorico: string;
    Fnmespecie: string;
    Fnuplconta: string;
    Fnuserie: string;
    Fcdcliente: LargeInt;
    Fcdclconsumoenergia: string;
    Fnudocfiscalicms: string;
    Fcdclconsumoagua: string;
    Fdsxml: string;
    Fhrentrada: TDate;
    Fdtentrada: TDate;
    Fdtsaida: TDate;
    Fdtemissao: Tdate;
    Ftpentrada: TTpentrada;
    FItentrada: TItentradaList;
    fcliente: tcliente;
    ffornecedor: tfornecedor;
    Fautpagto: tautpagtolist;
    Fcondpagto: tcondpagto;
    Fnucntcusto: string;
    Fvlretencao: currency;
    fborateiocntcusto: string;
    fborateioplconta: string;
    fcdrateiocntcusto: integer;
    fcdrateioplconta: Integer;
    procedure Setautpagto(const Value: tautpagtolist);
    procedure Setcondpagto(const Value: tcondpagto);
    procedure Setnucntcusto(const Value: string);
    procedure Setvlretencao(const Value: currency);
  public
    property autpagto : tautpagtolist read Fautpagto write Setautpagto;
    property cliente : tcliente read fcliente write fcliente;
    property fornecedor : tfornecedor read ffornecedor write ffornecedor;
    property Itentrada : TItentradaList read FItentrada write FItentrada;
    property tpentrada : TTpentrada read Ftpentrada write Ftpentrada;
    property condpagto : tcondpagto read Fcondpagto write Setcondpagto;
    [keyfield]
    property cdentrada : integer read Fcdentrada write Fcdentrada;
    [fk]
    property cdtpentrada : integer read Fcdtpentrada write Fcdtpentrada;
    [fk]
    property cdcfop : integer read Fcdcfop write Fcdcfop;
    [fk]
    property cduf : integer read Fcduf write Fcduf;
    [fk]
    property cdfornecedor : LargeInt read Fcdfornecedor write Fcdfornecedor;
    [fk]
    property cdcliente : LargeInt read Fcdcliente write Fcdcliente;
    [fk]
    property cdtransportadora : largeint read Fcdtransportadora write Fcdtransportadora;
    [fk]
    property cdcntcusto : integer read Fcdcntcusto write Fcdcntcusto;
    property nucntcusto : string read Fnucntcusto write Setnucntcusto;
    [fk]
    property cdcondpagto : integer read Fcdcondpagto write Fcdcondpagto;
    [fk]
    property cdtpcobranca : integer read Fcdtpcobranca write Fcdtpcobranca;
    [fk]
    property cdplconta : integer read Fcdplconta write Fcdplconta;
    [fk]
    property cdsaida : integer read Fcdsaida write Fcdsaida;
    property nustdocumento : string read Fnustdocumento write Fnustdocumento;
    property nudocfiscalicms : string read Fnudocfiscalicms write Fnudocfiscalicms;
    [fk]
    property cdtpligacaoc500 : integer read Fcdtpligacaoc500 write Fcdtpligacaoc500;
    [fk]
    property cdgrupotensaoc500 : string read Fcdgrupotensaoc500 write Fcdgrupotensaoc500;
    [fk]
    property cdclconsumoagua : string read Fcdclconsumoagua write Fcdclconsumoagua;
    [fk]
    property cdclconsumoenergia : string read Fcdclconsumoenergia write Fcdclconsumoenergia;
    [fk]
    property cdtpfrete : String read Fcdtpfrete write Fcdtpfrete;
    [FK]
    property cdrateiocntcusto: integer read fcdrateiocntcusto write fcdrateiocntcusto;
    [FK]
    property cdrateioplconta: Integer read fcdrateioplconta write fcdrateioplconta;
    property nuentrada : integer read Fnuentrada write Fnuentrada;
    property dtsaida : TDate read Fdtsaida write Fdtsaida;
    property dtemissao : Tdate read Fdtemissao write Fdtemissao;
    property vltotal : currency read Fvltotal write Fvltotal;
    property vlliquido : currency read Fvlliquido write Fvlliquido;
    property vlliqsdesc : currency read Fvlliqsdesc write Fvlliqsdesc;
    property prdesconto : double read Fprdesconto write Fprdesconto;
    property vldesconto : currency read Fvldesconto write Fvldesconto;
    property vlseguro : currency read Fvlseguro write Fvlseguro;
    property vloutdespesa : currency read Fvloutdespesa write Fvloutdespesa;
    property vlfrete : currency read Fvlfrete write Fvlfrete;
    property vlbaseipi : currency read Fvlbaseipi write Fvlbaseipi;
    property vlipi : currency read Fvlipi write Fvlipi;
    property vlicmssubtrib : currency read Fvlicmssubtrib write Fvlicmssubtrib;
    property vlbaseicmssubtrib : currency read Fvlbaseicmssubtrib write Fvlbaseicmssubtrib;
    property vlbaseicms : currency read Fvlbaseicms write Fvlbaseicms;
    property vlicms : currency read Fvlicms write Fvlicms;
    property vliss  : currency read Fvliss write Fvliss;
    property vlisssdesc : currency read Fvlisssdesc write Fvlisssdesc;
    property vlbasepis : currency read Fvlbasepis write Fvlbasepis;
    property vlpis : currency read Fvlpis write Fvlpis;
    property vlbasecofins : currency read Fvlbasecofins write Fvlbasecofins;
    property vlcofins : currency read Fvlcofins write Fvlcofins;
    property vlirrf : currency read Fvlirrf write Fvlirrf;
    property psliquido : double read Fpsliquido write Fpsliquido;
    property psbruto : double read Fpsbruto write Fpsbruto;
    property hrentrada : TDate read Fhrentrada write Fhrentrada;
    property dtentrada : TDate read Fdtentrada write Fdtentrada;
    property nuplaca : string read Fnuplaca write Fnuplaca;
    property vlproduto : currency read Fvlproduto write Fvlproduto;
    property vlservico : currency read Fvlservico write Fvlservico;
    property qtvolume : double read Fqtvolume write Fqtvolume;
    property nmespecievolume : string read Fnmespecievolume write Fnmespecievolume;
    property boexportado : String read Fboexportado write Fboexportado;
    property dsobservacao : string read Fdsobservacao write Fdsobservacao;
    property nmespecie : string read Fnmespecie write Fnmespecie;
    property vlicmssfretencontrib : currency read Fvlicmssfretencontrib write Fvlicmssfretencontrib;
    property dshistorico : string read Fdshistorico write Fdshistorico;
    property nusubserie : string read Fnusubserie write Fnusubserie;
    [fk]
    property cdprotocolo : integer read Fcdprotocolo write Fcdprotocolo;
    property prlucro : double read Fprlucro write Fprlucro;
    property booptantesimples : String read Fbooptantesimples write Fbooptantesimples;
    property nuplconta : string read Fnuplconta write Fnuplconta;
    property dsxml : string read Fdsxml write Fdsxml;
    property bopagtovista : String read Fbopagtovista write Fbopagtovista;
    property vlpissubtrib : currency read Fvlpissubtrib write Fvlpissubtrib;
    property vlbasepissubtrib : currency read Fvlbasepissubtrib write Fvlbasepissubtrib;
    property alpissubtrib : double read Falpissubtrib write Falpissubtrib;
    property vlcofinssubtrib : currency read Fvlcofinssubtrib write Fvlcofinssubtrib;
    property vlbasecofinssubtrib : currency read Fvlbasecofinssubtrib write Fvlbasecofinssubtrib;
    property alcofinssubtrib : double read Falcofinssubtrib write Falcofinssubtrib;
    property nuchavenfe : string read Fnuchavenfe write Fnuchavenfe;
    property boretencaopis : String read Fboretencaopis write Fboretencaopis;
    property boretencaocofins : String read Fboretencaocofins write Fboretencaocofins;
    property vlinss : currency read Fvlinss write Fvlinss;
    property vlcontribsocial : currency read Fvlcontribsocial write Fvlcontribsocial;
    property boipibcicms : String read Fboipibcicms write Fboipibcicms;
    property vlbasefretesub : currency read Fvlbasefretesub write Fvlbasefretesub;
    property alfretesub : double read Falfretesub write Falfretesub;
    property vlfretesub : currency read Fvlfretesub write Fvlfretesub;
    property bocreditosttransporte : String read Fbocreditosttransporte write Fbocreditosttransporte;
    property boicmssubtribntotal : String read Fboicmssubtribntotal write Fboicmssubtribntotal;
    property nuserie : string read Fnuserie write Fnuserie;
    property nuchavenfse : string read Fnuchavenfse write Fnuchavenfse;
    property vlcofinsret : currency read Fvlcofinsret write Fvlcofinsret;
    property vlpisret : currency read Fvlpisret write Fvlpisret;
    [fk]
    property cdentradact : integer read Fcdentradact write Fcdentradact;
    property nuentradact : integer read Fnuentradact write Fnuentradact;
    property bofreteitem : String read Fbofreteitem write Fbofreteitem;
    property nseqevento : integer read Fnseqevento write Fnseqevento;
    property boicmsstitem : String read Fboicmsstitem write Fboicmsstitem;
    property boarredondar : String read Fboarredondar write Fboarredondar;
    property bodescontoitem : String read Fbodescontoitem write Fbodescontoitem;
    property vlretencao : currency read Fvlretencao write Setvlretencao;
    property borateiocntcusto : string read fborateiocntcusto write fborateiocntcusto;
    property borateioplconta : string read fborateioplconta write fborateioplconta;
    constructor create;
    destructor destroy; override;
    function BaixarProdutoData(dti, dtf: TDate; nudias: Integer):boolean;
    function CodigoNotaFiscal(nu:string):integer;
    function Existebaixaautpagto(cdentrada:string):boolean;
    function ExisteBaixaConta(codigo:string):boolean;
    function existeNotaFiscal(codigo, numero, nuserie, nudocfiscalicms, cdfornecedor, cdcliente: string):boolean;
    function gerarDevolucaoSimples(cdsaida, cdtpentrada, cdcfop, nuentrada: integer; nuserie, nudocfiscalicms, nuchavenfe:string; dtemissao: TDate):Integer;
    function nfeCodigoInterno(nfea: TACBrNFe):string;
    function nfeDaDmpresa(nfea: TACBrNFe):boolean;
    function nfeExiste(nfea: TACBrNFe):boolean;
    function setst(dti, dtf: TDate):Boolean;
    function vlpisrecupera : Currency;
    function vlcofinsrecupera: Currency;
    function vlicmsrecupera: Currency;
    function vlbaseicmsrecupera: Currency;
    function vlipirecupera: Currency;
    function CfopCabecalhoInexistenteNosItens:boolean;
    function Aprovacao:boolean;
    function AprovacaoFinanceiro:boolean;
    function Desaprovacao:boolean;
    function DesaprovacaoFinanceiro:boolean;
  end;
  TEntradaList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TEntrada;
    procedure SetItem(Index: Integer; const Value: TEntrada);
  public
    function New: TEntrada;
    property Items[Index: Integer]: TEntrada read GetItem write SetItem;
    function Ler(codigo:Integer; cdfield:string):Boolean;overload;
    function Ler(Dataset: TDataset):Boolean;overload;
    function Ler(sqlwhere:string):boolean;overload;
    function indice(value:Integer):Integer;
  end;
  TTelaentrada = class
  protected
    Ftela: Tentrada;
    Fdados: Tentrada;
    procedure setFieldsItentradaTela(cdsitentrada: TClientDataSet);
  public
    property dados : Tentrada read Fdados write Fdados;
    property tela : Tentrada read Ftela write Ftela;
    constructor create;
    destructor destroy; override;
    procedure setFields(codigo:integer);
    procedure salvar(cds, cdsitentrada: TClientDataSet);
  end;

implementation

uses
  orm.regrast, dialogo.AssinaturaDigital;

function TEntrada.existeNotaFiscal(codigo, numero, nuserie, nudocfiscalicms, cdfornecedor, cdcliente: string):boolean;
  function get_pessoa:string;
  begin
    if cdfornecedor <> '' then
    begin
      result := _cdfornecedor+'='+cdfornecedor
    end
    else if cdcliente <> '' then
    begin
      result := _cdcliente   +'='+cdcliente;
    end;
  end;
begin
  result := false;
  if (cdcliente = '') and (cdfornecedor = '') then
  begin
    exit;
  end;
  result := RetornaSQLInteger('select cdentrada '+
                              'from entrada '+
                              'where cdempresa='+empresa.cdempresa.tostring+' and nuentrada='+quotedstr(numero)+' and nuserie='+quotedstr(nuserie)+' and nudocfiscalicms='+quotedstr(nudocfiscalicms)+' '+
                              'and cdentrada<>'+codigo+' and '+get_pessoa)>0;
end;

function TEntrada.CfopCabecalhoInexistenteNosItens: boolean;
var
  I: Integer;
begin
  result := true;
  for I := 0 to itentrada.count - 1 do
  begin
    if itentrada.items[i].cdcfop = cdcfop then
    begin
      result := false;
      break;
    end;
  end;
end;

function TEntrada.CodigoNotaFiscal(nu:string):integer;
var
  cont : integer;
begin
  result := -1;
  cont := RetornaSQLInteger('select count(*) from entrada where cdempresa='+empresa.cdempresa.tostring+' and nuentrada='+quotedstr(nu));
  if cont = 0 then
  begin
    result := 0;
    exit
  end;
  if cont = 1 then
  begin
    result := RetornaSQLinteger('select cdentrada from entrada where cdempresa='+empresa.cdempresa.tostring+' and nuentrada='+quotedstr(nu))
  end
  else if cont > 1 then
  begin
    result := selecionar_Entrada(_entrada, nu);
    if result = 0 then
    begin
      result := -1;
    end;
  end;
end;

function TEntrada.ExisteBaixaConta(codigo:string):boolean;
begin
  result := RegistroExiste(_baixa, _cdautpagto+'='+codigo);
end;

function TEntrada.Existebaixaautpagto(cdentrada:string):boolean;
begin
  result := RetornaSQLInteger('select count(*) from baixa inner join autpagto on autpagto.cdautpagto=baixa.cdautpagto and baixa.cdempresa=autpagto.cdempresa where baixa.cdempresa='+empresa.cdempresa.tostring+' and cdentrada='+cdentrada) > 0;
end;

constructor TEntrada.create;
begin
  inherited;
  fcondpagto := tcondpagto.create;
  fautpagto := tautpagtolist.Create;
  ftpentrada := TTpentrada.create;
  fitentrada := titentradaList.create;
  ffornecedor := TFornecedor.create;
  fcliente := TCliente.create;
end;

function TEntrada.Desaprovacao: boolean;
var
  texto :string;
  cdusuario, I: Integer;
begin
  texto := 'Desaprovar o pagamento da compra '+nuentrada.ToString+#13+
           'para o fornecedor '+cdfornecedor.ToString+' - '+fornecedor.rzsocial+#13+
           'com o valor de '+formatfloat(__moeda, vltotal)+'.';
  if not assinaturadigital(texto, cdusuario) then
  begin
    result := false;
    Exit;
  end;
  for I := 0 to autpagto.count - 1 do
  begin
    autpagto.items[i].cdusuarioaprovacao    := 0;
    autpagto.items[i].cdcomputadoraprovacao := 0;
    autpagto.items[i].tsaprovacao           := 0;
    autpagto.items[i].update;
    autpagto.items[i].RegistrarHistoricoAprovacao(1, _d);
  end;
  result := true;
end;

function TEntrada.DesaprovacaoFinanceiro: boolean;
var
  texto :string;
  cdusuario, i: Integer;
begin
  texto := 'Desaprovar o pagamento para o financeiro da compra '+nuentrada.ToString+#13+
           'para o fornecedor '+cdfornecedor.ToString+' - '+fornecedor.rzsocial+#13+
           'com o valor de '+formatfloat(__moeda, vltotal)+'.';
  if not assinaturadigital(texto, cdusuario) then
  begin
    result := false;
    Exit;
  end;
  for I := 0 to autpagto.count - 1 do
  begin
    autpagto.items[i].cdusuarioaprovacaofinanceiro    := 0;
    autpagto.items[i].cdcomputadoraprovacaofinanceiro := 0;
    autpagto.items[i].tsaprovacaofinanceiro           := 0;
    autpagto.items[i].update;
    autpagto.items[i].RegistrarHistoricoAprovacao(1, _d);
  end;
  result := true;
end;

function TEntrada.nfeDaDmpresa(nfea: TACBrNFe):boolean;
begin
  result := removercaracteres(nfea.NotasFiscais.Items[0].NFe.Dest.CNPJCPF) = Empresa.nucnpj_;
end;

function TEntrada.nfeExiste(nfea: TACBrNFe):boolean;
  function tabpessoa:string;
  begin
    if qregistro.stringdocodigo(_tpentrada, cdtpentrada, _TPFORNCLIENTE) = _F then
    begin
      result := _fornecedor
    end
    else
    begin
      result := _cliente;
    end;
  end;
begin
  result := RegistroExiste(_entrada, _cd+tabpessoa+'=' +CodigodoCampo(tabpessoa,Formatacnpj(nfea.NotasFiscais.Items[0].NFe.Emit.CNPJCPF) ,_nucnpj) +' '+
                                           'and nuentrada='+inttostr(nfea.NotasFiscais.Items[0].NFe.Ide.nNF)+' '+
                                           'and dtemissao='+getdtbanco(nfea.NotasFiscais.Items[0].NFe.Ide.dEmi));
end;

function TEntrada.nfeCodigoInterno(nfea: TACBrNFe):string;
var
  cdfornecedor : string;
begin
  cdfornecedor := CodigodoCampo(_fornecedor,Formatacnpj(nfea.NotasFiscais.Items[0].NFe.Emit.CNPJCPF) ,_nucnpj);
  if cdfornecedor = '' then
  begin
    messagedlg('Fornecedor '+nfea.NotasFiscais.Items[0].NFe.Emit.xNome+' do CNPJ '+nfea.NotasFiscais.Items[0].NFe.Emit.CNPJCPF+' não está cadastrado.'#13'Cadastre o fornecedor antes de continuar.', mtinformation, [mbok], 0);
    abort; 
  end;
  result := RetornaSQLString('select cdentrada '+
                                   'from entrada '+
                                   'where cdempresa='+empresa.cdempresa.tostring+' '+
                                   'and cdfornecedor=' +cdfornecedor+' '+
                                   'and nuentrada='+inttostr(nfea.NotasFiscais.Items[0].NFe.Ide.nNF)+' '+
                                   'and dtemissao='+getdtbanco(nfea.NotasFiscais.Items[0].NFe.Ide.dEmi));
end;

function TEntrada.setst(dti, dtf: TDate): Boolean;
var
  q : TClasseQuery;
  nusticms, nustipi, nustpis, nustcofins : string;
  sql, erro : TStrings;
  procedure get_st(var nust:string; imposto, nurecupera:string);
  var
    regrast : TRegraST;
  begin
    regrast := TRegraST.Create;
    try
      nust := regrast.GetST(_entrada, q.q.fieldbyname(_cdproduto).AsInteger, q.q.fieldbyname(_cdcfop).AsInteger, imposto);
    finally
      FreeAndNil(regrast);
    end;
    if (q.q.fieldbyname(_borecupera+imposto).AsString = _S) and (nust <> nurecupera) then
    begin
      if (q.q.fieldbyname(_nuentrada).AsString = '29383') and ((imposto = _pis) or (imposto = _cofins)) then
      begin
        Exit;
      end;
      erro.Add('Nota Fiscal: '+q.q.fieldbyname(_nuentrada).asstring+
               ' - CFOP '+q.q.fieldbyname(_cdcfop).asstring+
               ' - '+imposto+' atual '+q.q.fieldbyname(_nust+imposto).asstring+
               ' - '+imposto+' novo  '+nust+
               ' - Produto: '+q.q.fieldbyname(_cdproduto).asstring+' - '+q.q.fieldbyname(_nmproduto).asstring);
    end;
  end;
begin
  result         := False;
  erro           := TStringList.Create;
  sql            := tstringList.create;
  q              := TClasseQuery.Create('select i.cdentrada'+
                                              ',i.cditentrada'+
                                              ',i.cdproduto'+
                                              ',p.nmproduto'+
                                              ',i.nusticms'+
                                              ',i.nustipi'+
                                              ',i.nustpis'+
                                              ',i.nustcofins'+
                                              ',e.dtsaida'+
                                              ',e.nuentrada'+
                                              ',i.borecuperaicms'+
                                              ',i.borecuperapis'+
                                              ',i.borecuperaipi'+
                                              ',i.borecuperacofins'+
                                              ',e.cdcliente'+
                                              ',e.cdfornecedor'+
                                              ',i.cdcfop '+
                                        'from itentrada i '+
                                        'inner join entrada e on e.cdentrada=i.cdentrada and i.cdempresa=e.cdempresa '+
                                        'inner join produto p on p.cdproduto=i.cdproduto and i.cdempresa=p.cdempresa '+
                                        'where i.cdempresa='+empresa.cdempresa.tostring+' and e.dtsaida between '+getdtbanco(dti)+' and '+getdtbanco(dtf)+' '+
                                        'order by e.dtsaida');
  frmprogressbar := Tfrmprogressbar.Create(nil);
  try
    frmprogressbar.gau.MaxValue := 100;
    frmprogressbar.Show;
    while not q.q.Eof do
    begin
      frmprogressbar.pnl.Caption := 'Processando dia '+formatdatetime(_dd_mm_yyyy, q.q.fieldbyname(_dtsaida).asdatetime);
      frmprogressbar.gau.Progress := frmprogressbar.gau.Progress + 1;
      if frmprogressbar.gau.Progress = 100 then
      begin
        frmprogressbar.gau.Progress := 1;
      end;
      Application.ProcessMessages;
      get_st(nusticms  , _icms  , _00);
      get_st(nustipi   , _ipi   , _00);
      get_st(nustpis   , _pis   , _53);
      get_st(nustcofins, _cofins, _53);
      if (nusticms <> '') and (nustipi <> '') and (nustpis <> '') and (nustcofins <> '') then
      begin
        sql.add('update itentrada '+
                'set nusticms='+quotedstr(nusticms)+
                  ',nustipi='+quotedstr(nustipi)+
                  ',nustpis='+quotedstr(nustpis)+
                  ',nustcofins='+quotedstr(nustcofins)+' '+
                  'where cdempresa='+empresa.cdempresa.tostring+' and cdentrada='+q.q.fieldbyname(_cdentrada).asstring+' and cditentrada='+q.q.fieldbyname(_cditentrada).asstring+';');
      end
      else
      begin
        erro.Add('nusticms='+quotedstr(nusticms)+' - nustipi='+quotedstr(nustipi)+' - '+
                 'nustpis='+quotedstr(nustpis)+' - nustcofins='+quotedstr(nustcofins)+' - '+
                 'Nota Fiscal: '+q.q.fieldbyname(_nuentrada).asstring+
                 ' - Produto: '+q.q.fieldbyname(_cdproduto).asstring+' - '+q.q.fieldbyname(_nmproduto).AsString);

      end;
      q.q.Next;
    end;
    if erro.Count > 0 then
    begin
      ExibirSaidaVideo(erro);
    end
    else
    begin
      ExibirSaidaVideo(sql);
    end;
  finally
    FreeAndNil(q);
    FreeAndNil(frmprogressbar);
    FreeAndNil(erro);
    FreeAndNil(sql);
  end;
end;

procedure TEntrada.Setvlretencao(const Value: currency);
begin
  Fvlretencao := Value;
end;

function TEntrada.vlbaseicmsrecupera: Currency;
var
  I: Integer;
begin
  result := 0;
  for I := 0 to Itentrada.Count - 1 do
  begin
    if itentrada.Items[i].borecuperaicms = _s then
    begin
      result := result + itentrada.Items[i].vlbaseicms;
    end;
  end;
end;

function TEntrada.vlcofinsrecupera: Currency;
var
  I: Integer;
begin
  result := 0;
  for I := 0 to Itentrada.Count - 1 do
  begin
    if itentrada.Items[i].borecuperacofins = _s then
    begin
      result := result + itentrada.Items[i].vlcofins;
    end;
  end;
end;

function TEntrada.vlicmsrecupera: Currency;
var
  I: Integer;
begin
  result := 0;
  for I := 0 to Itentrada.Count - 1 do
  begin
    if itentrada.Items[i].borecuperaicms = _s then
    begin
      result := result + itentrada.Items[i].vlicms;
    end;
  end;
end;

function TEntrada.vlipirecupera: Currency;
var
  I: Integer;
begin
  result := 0;
  for I := 0 to Itentrada.Count - 1 do
  begin
    if itentrada.Items[i].borecuperaipi = _s then
    begin
      result := result + itentrada.Items[i].vlipi;
    end;
  end;
end;

function TEntrada.vlpisrecupera: Currency;
var
  I: Integer;
begin
  result := 0;
  for I := 0 to Itentrada.Count - 1 do
  begin
    if itentrada.Items[i].borecuperapis = _s then
    begin
      result := result + itentrada.Items[i].vlpis;
    end;
  end;
end;

function TEntrada.Aprovacao: boolean;
var
  cdusuario, I: Integer;
begin
  if not assinaturadigital('Aprovar o pagamento da compra '+nuentrada.tostring+#13+
                           'para o fornecedor '+cdfornecedor.tostring+' - '+fornecedor.rzsocial+#13+
                           'com o valor de '+formatfloat(__moeda, vltotal)+'.', cdusuario) then
  begin
    result := false;
    exit;
  end;
  for I := 0 to autpagto.count - 1 do
  begin
    autpagto.items[i].cdusuarioaprovacao    := cdusuario;
    autpagto.items[i].cdcomputadoraprovacao := vgcdcomputador.tointeger;
    autpagto.items[i].tsaprovacao           := tsBanco;
    autpagto.items[i].update;
    autpagto.items[i].RegistrarHistoricoAprovacao(1, _a);
  end;
  result := true;
end;

function TEntrada.AprovacaoFinanceiro: boolean;
var
  cdusuario, I: Integer;
begin
  if not assinaturadigital('Aprovar o pagamento para o financeiro da compra '+nuentrada.toString+#13+
                           'para o fornecedor '+cdfornecedor.toString+' - '+fornecedor.rzsocial+#13+
                           'com o valor de '+formatfloat(__moeda, vltotal)+'.', cdusuario) then
  begin
    result := false;
    exit;
  end;
  for I := 0 to autpagto.count - 1 do
  begin
    autpagto.items[i].cdusuarioaprovacaofinanceiro    := cdusuario;
    autpagto.items[i].cdcomputadoraprovacaofinanceiro := vgcdcomputador.tointeger;
    autpagto.items[i].tsaprovacao                     := tsBanco;
    autpagto.items[i].update;
    autpagto.items[i].RegistrarHistoricoAprovacao(1, _a);
  end;
  result := true;
end;

function TEntrada.BaixarProdutoData(dti, dtf: TDate; nudias: Integer): boolean;
  function BaixarProduto(cdentrada:string; nudias: Integer=0):boolean;
  var
    q : TClasseQuery;
    sql : TStrings;
    i : integer;
    texto : string;
    procedure gerar_baixa;
      function get_dtemissao:TDate;
      begin
        result := q.q.fieldbyname(_dtsaida).AsDateTime + nudias;
        if FormatDateTime(_mmYYYY, result) <>  FormatDateTime(_mmYYYY, q.q.fieldbyname(_dtsaida).AsDateTime) then
        begin
          result := Ultimo_Dia_Mes(q.q.fieldbyname(_dtsaida).AsDateTime);
        end;
      end;
    var
      movto : TMovto;
    begin
      movto := tmovto.create;
      try
        movto.cdmovto   := QGerar.GerarCodigo(_movto);
        movto.dtemissao := DtBanco;
        movto.cdtpmovto := 1;
        movto.dtemissao := get_dtemissao;
        movto.cditentrada := q.q.fieldbyname(_cditentrada).AsInteger;
        sql.Add(movto.Insert(true));
        movto.ItMovto.New;
        movto.ItMovto.Items[movto.ItMovto.Count-1].cdmovto    := movto.cdmovto;
        movto.ItMovto.Items[movto.ItMovto.Count-1].cditmovto  := QGerar.GerarCodigo(_itmovto);
        movto.ItMovto.Items[movto.ItMovto.Count-1].cdcntcusto := q.q.fieldbyname(_cdcntcusto).AsInteger;
        movto.ItMovto.Items[movto.ItMovto.Count-1].cdproduto  := q.q.fieldbyname(_cdproduto).AsInteger;
        movto.ItMovto.Items[movto.ItMovto.Count-1].qtitem     := q.q.fieldbyname(_qtitem).AsFloat;
        movto.ItMovto.Items[movto.ItMovto.Count-1].cddigitado := q.q.fieldbyname(_cdproduto).AsString;
        sql.Add(movto.ItMovto.Items[movto.ItMovto.count-1].Insert(true));
      finally
        freeandnil(movto);
      end;
    end;
    procedure atualizar_baixa;
    begin
      sql.add('delete from movto where cdempresa='+empresa.cdempresa.tostring+' and cditentrada='+q.q.fieldbyname(_cditentrada).asstring+';');
      gerar_baixa;
    end;
  begin
    sql := tstringlist.create;
    q   := TClasseQuery.create('select i.cdentrada'+
                                     ',i.cditentrada'+
                                     ',i.cdproduto'+
                                     ',i.qtitem'+
                                     ',i.cdcntcusto'+
                                     ',i.tsinclusao'+
                                     ',i.cdusuarioi'+
                                     ',i.cdcomputadori'+
                                     ',i.tsalteracao'+
                                     ',i.cdusuarioa'+
                                     ',i.cdcomputadora'+
                                     ',m.cditentrada cditentrada1'+
                                     ',im.qtitem qtitem1'+
                                     ',e.dtemissao'+
                                     ',I.CDEMPRESA'+
                                     ',e.dtsaida '+
                               'from itentrada i '+
                               'left join entrada e on e.cdentrada=i.cdentrada and i.cdempresa=e.cdempresa '+
                               'left join cfop c on c.cdcfop=i.cdcfop '+
                               'left join movto m on m.cditentrada=i.cditentrada and i.cdempresa=m.cdempresa '+
                               'left join itmovto im on im.cdmovto=m.cdmovto and im.cdproduto=i.cdproduto and im.cdempresa=m.cdempresa '+
                               'where i.cdempresa='+empresa.cdempresa.tostring+' and c.bolivroproducao=''S'' and i.cdentrada='+cdentrada);
    try
      while not q.q.Eof do
      begin
        if q.q.fieldbyname(_cdentrada).IsNull then
        begin
          gerar_baixa
        end
        else if q.q.fieldbyname(_qtitem).AsInteger <> q.q.fieldbyname(_qtitem+_1).AsInteger then
        begin
          Atualizar_baixa;
        end;
        q.q.next;
      end;
      for i := 0 to sql.count - 1 do
      begin
        texto := sql[i];
        ExecutaSQL(sql[i]);
      end;
      result := true;
    finally
      freeandnil(q);
      freeandnil(sql);
    end;
  end;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.Create('select cdentrada from entrada where cdempresa='+empresa.cdempresa.tostring+' and dtsaida between '+getdtbanco(dti)+' and '+getdtbanco(dtf));
  frmprogressbar := Tfrmprogressbar.Create(nil);
  try
    frmprogressbar.gau.MaxValue := q.q.RecordCount;
    frmprogressbar.Show;
    while not q.q.Eof do
    begin
      frmprogressbar.gau.Progress := q.q.RecNo;
      Application.ProcessMessages;
      BaixarProduto(q.q.fieldbyname(_cdentrada).AsString, nudias);
      q.q.Next;
    end;
    result := True;
  finally
    FreeAndNil(q);
    FreeAndNil(frmprogressbar);
  end;
end;

function TEntrada.gerarDevolucaoSimples(cdsaida, cdtpentrada, cdcfop, nuentrada: integer; nuserie, nudocfiscalicms, nuchavenfe:string; dtemissao: TDate):Integer;
var
  s, sit, centrada, citentrada: TClasseQuery;
  x, i : integer;
begin
  s          := TClasseQuery.Create('SELECT saida.*,s.nuSerie FROM SAIDA '+
                                    'inner join serie s on s.cdserie=saida.cdserie and s.cdempresa=saida.cdempresa '+
                                    'WHERE s.cdempresa='+empresa.cdempresa.tostring+' and CDSAIDA='+cdsaida.ToString);
  sit        := TClasseQuery.Create(QRetornaSQL.get_select_from(_itsaida, cdsaida, _cdsaida));
  centrada   := TClasseQuery.Create(QRetornaSQL.get_select_from(_entrada, _0), true);
  citentrada := TClasseQuery.Create(QRetornaSQL.get_select_from(_itentrada, _0), true);
  try
    centrada.q.Insert;
    for i := 0 to centrada.q.FieldCount - 1 do
    begin
      for x := 0 to s.q.FieldCount - 1 do
      begin
        if centrada.q.Fields[i].FieldName = s.q.Fields[x].FieldName then
        begin
           if centrada.q.Fields[i].FieldName = uppercase(_cdcfop) then
           begin
             centrada.q.Fields[i].asinteger := cdcfop
           end
           else
           begin
             qregistro.set_field_type_assign(s.q, centrada.q, i)
           end;
        end;
      end;
    end;
    RegistraInformacao_(centrada.q);
    result                                    := qgerar.GerarCodigo(_entrada);
    centrada.q.FieldByName(_cdentrada).AsInteger := result;
    // número de série
    centrada.q.FieldByName(_dtemissao).AsDateTime     := DtBanco;
    centrada.q.FieldByName(_cdtpentrada).asinteger    := cdtpentrada;
    centrada.q.FieldByName(_dtsaida).AsDateTime       := centrada.q.FieldByName(_dtemissao).AsDateTime;
    centrada.q.FieldByName(_nuentrada).asinteger      := nuentrada;
    centrada.q.FieldByName(_nuserie).AsString         := nuserie;
    centrada.q.FieldByName(_nuchavenfe).AsString      := nuchavenfe;
    centrada.q.FieldByName(_nudocfiscalicms).AsString := nudocfiscalicms;
    centrada.q.FieldByName(_dtemissao).AsDateTime     := dtemissao;
    centrada.q.FieldByName(_dtsaida).AsDateTime       := DtBanco;
    aplicacao.aplyupdates(centrada.q);

    while not sit.q.Eof do
    begin
      citentrada.q.Insert;
      for i := 0 to citentrada.q.FieldCount - 1 do
      begin
        for x := 0 to sit.q.FieldCount - 1 do
        begin
          if citentrada.q.Fields[i].FieldName = sit.q.Fields[x].FieldName then
          begin
            if sit.q.Fields[x].FieldName = UpperCase(_cdcfop) then
            begin
              citentrada.q.Fields[i].asinteger := cdcfop
            end
            else
            begin
              qregistro.set_field_type_assign(sit.q, citentrada.q, x, i);
            end;
          end;
        end;
      end;
      RegistraInformacao_(citentrada.q);
      citentrada.q.FieldByName(_cdentrada).asinteger   := result;
      citentrada.q.FieldByName(_cditentrada).AsInteger := QGerar.GerarCodigo(_itentrada);
      aplicacao.aplyupdates(citentrada.q);
      sit.q.Next;
    end;
  finally
    freeandnil(s);
    freeandnil(sit);
    freeandnil(centrada);
    freeandnil(citentrada);
  end;
end;

destructor TEntrada.destroy;
begin
  FreeAndNil(fcondpagto);
  FreeAndNil(fautpagto);
  FreeAndNil(fItentrada);
  FreeAndNil(ftpentrada);
  FreeAndNil(ffornecedor);
  FreeAndNil(fcliente);
  inherited;
end;

procedure TEntrada.Setautpagto(const Value: tautpagtolist);
begin
  Fautpagto := Value;
end;

procedure TEntrada.Setcondpagto(const Value: tcondpagto);
begin
  Fcondpagto := Value;
end;

procedure TEntrada.Setnucntcusto(const Value: string);
begin
  Fnucntcusto := Value;
end;

constructor TTelaentrada.create;
begin
  inherited;
  fdados := tentrada.create;
  Ftela  := tentrada.create;
end;

destructor TTelaentrada.destroy;
begin
  FreeAndNil(fdados);
  FreeAndNil(ftela);
  inherited;
end;

procedure TTelaentrada.salvar(cds, cdsitentrada: TClientDataSet);
begin
  tela.select(cds);
  setFieldsItentradaTela(cdsitentrada);
end;

procedure TTelaentrada.setFields(codigo: integer);
begin
  dados.select(codigo);
  dados.itentrada.Ler(codigo);
end;

procedure TTelaentrada.setFieldsItentradaTela(cdsitentrada: TClientDataSet);
begin
  tela.itentrada.Ler(cdsitentrada);
end;

function TEntradaList.GetItem(Index: Integer): TEntrada;
begin
  Result := Tentrada(Inherited Items[Index]);
end;

function TEntradaList.Ler(codigo: Integer; cdfield:string): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_entrada, codigo, cdfield));
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
    FreeAndNil(q);
  end;
end;

function TEntradaList.indice(value: Integer): Integer;
var
  I: Integer;
begin
  result := -1;
  for I := 0 to Count -1 do
  begin
    if value = Items[i].cdentrada then
    begin
      result := i;
      Break;
    end;
  end;
end;

function TEntradaList.Ler(sqlwhere: string): boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_where(_entrada, sqlwhere));
  try
    result := Ler(q.q);
  finally
    FreeAndNil(q);
  end;
end;

function TEntradaList.Ler(Dataset: TDataset): Boolean;
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

function TEntradaList.New: TEntrada;
begin
  Result := Tentrada.Create;
  Add(Result);
end;

procedure TEntradaList.SetItem(Index: Integer; const Value: TEntrada);
begin
  Put(Index, Value);
end;

end.
