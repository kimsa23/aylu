unit ORM.Cliente;

interface

uses
  system.UITypes,
  forms, dialogs, StdCtrls, classes, ComCtrls, controls, ExtCtrls, sysutils, Contnrs,
  sqlexpr, DB,
  ACBrValidador, ACBrUtil,
  rotina.datahora, rotina.strings, uconstantes, dialogo.progressbar, rotina.registro, rotina.montarsql, uDtmMain,
  classe.copiarregistro, classe.registrainformacao, classe.executasql, rotina.retornasql,
  orm.empresa, classe.Endereco, classe.aplicacao, classe.query, classe.gerar,
  orm.uf, orm.Municipio, orm.Pais, classe.DAO, orm.ClienteEntrega, orm.StCliente, orm.TpClienteMensalidade,
  orm.ItClienteEmail, orm.ItClienteCampanha, orm.TpCliente,
  cxDBLookupComboBox;

type
  TCliente = class(TRegistroQuipos)
  private
    Fbocofins: string;
    Fboicms: string;
    Fbonenviarpdf: string;
    Fbongerarboletofaturamento: string;
    Fbopis: string;
    Fboipi: string;
    Fbosincronizado: string;
    Fbonfeenviarpdf: string;
    Fbopendentecobranca: string;
    Fboconsumidorfinal: string;
    Fvllimite: Currency;
    Fvlfat6meses: Currency;
    Fpricmsduplicatacte: double;
    Fcdsuframa: integer;
    Fcdrepresentante: integer;
    Fcdtpregime: integer;
    Fcdproduto: integer;
    Fcdufcbrnc: integer;
    Fcdcontrato: integer;
    Fcdstcliente: integer;
    Fcdindiedest: integer;
    Fcdtpcliente: integer;
    Fcdplconta: integer;
    Fcduf: integer;
    Fcdtpclientemensalidade: integer;
    Fcdpais: integer;
    Fcdcntcusto: integer;
    Fnudiamensalidade: integer;
    Fcdmunicipio: integer;
    Fcdrmatividade: integer;
    Fcdmunicipiocbrnc: integer;
    Fcdfuncionariovendedor: integer;
    Fdsobservacao: string;
    Fdscomplemento: string;
    Fnuplconta: string;
    Fnucnpj: string;
    Fnucntcorrente: string;
    Fnucpf: string;
    Fnufone2cbrnc: string;
    Fdscomcbrnc: string;
    Ftpfaturamentovalor: string;
    Fnufone3cbrnc: string;
    Fnuidentid: string;
    Fnmconjuge: string;
    Fnufone2: string;
    Fcdestcivil: string;
    Fnmnaturalidade: string;
    Fdsnumero: string;
    Fnucxpcbrnc: string;
    Fnufax: string;
    Fdsobsfinanc: string;
    Fnucep: string;
    Fnufone1cbrnc: string;
    Fnucxpostal: string;
    Fnmmae: string;
    Fdsendcbrnc: string;
    Fcdfornecedorseguradora: LargeInt;
    Fnufone1: string;
    Fdsnumcbrnc: string;
    Fnuapolice: string;
    Frzsocial: string;
    Fnufone3: string;
    Fcdsexo: string;
    Fnucntcontabil: string;
    Fnucei: string;
    Fnuddg2: string;
    Fcdclienteantigo: string;
    Femail: string;
    Fnmcliente: string;
    Fnucepcbrnc: string;
    Fhomepage: string;
    Fnufaxcbrnc: string;
    Fnmbairro: string;
    Ftppessoa: string;
    Fdsendereco: string;
    Fnmpai: string;
    Fnuinscmunicipal: string;
    Fnumei: string;
    Fnuramal: string;
    Fnucelular: string;
    Fcdcliente: LargeInt;
    Fnuinscest: string;
    Fnucae: string;
    Fnuddg1: string;
    Fnmbaicbrnc: string;
    Fdtconsultaspc: TDate;
    Fdtdesfiliacao: TDate;
    Fdtcadastro: TDate;
    Fdtfundacao: TDate;
    Fdtcadastrosocio: TDate;
    Fdtlimite: TDate;
    Fdtvalidade: TDate;
    Fdtnascimento: TDate;
    Fstcliente: tstcliente;
    Fcdtpcobranca: integer;
    Fcdcondpagto: integer;
    Fitclienteemail: titclienteemaillist;
    fitclientecampanha: TItClienteCampanhaList;
    fclienteentrega: TClienteEntregaList;
    fnucnpjcbrnc: string;
    Fnufone4: string;
    Fnufone5: string;
    ftpcliente: TTpCliente;
    fnucntcusto: string;
    fdsobservacaocteremetente: string;
    fnucontrato: string;
  public
    property tpcliente: TTpCliente read ftpcliente write ftpcliente;
    property clienteentrega : TClienteEntregaList read fclienteentrega write fclienteentrega;
    property itclientecampanha : TItClienteCampanhaList read fitclientecampanha write fitclientecampanha;
    property itclienteemail : titclienteemaillist read Fitclienteemail write Fitclienteemail;
    property stcliente : tstcliente read Fstcliente write Fstcliente;
    [keyfield]
    property cdcliente : LargeInt read Fcdcliente write Fcdcliente;
    [fk]
    property cdstcliente : integer read Fcdstcliente write Fcdstcliente;
    [fk]
    property cdrepresentante : integer read Fcdrepresentante write Fcdrepresentante;
    [fk]
    property cduf : integer read Fcduf write Fcduf;
    [fk]
    property cdufcbrnc : integer read Fcdufcbrnc write Fcdufcbrnc;
    [fk]
    property cdtpcliente : integer read Fcdtpcliente write Fcdtpcliente;
    [fk]
    property cdtpclientemensalidade : integer read Fcdtpclientemensalidade write Fcdtpclientemensalidade;
    [fk]
    property cdrmatividade : integer read Fcdrmatividade write Fcdrmatividade;
    [fk]
    property cdfuncionariovendedor : integer read Fcdfuncionariovendedor write Fcdfuncionariovendedor;
    [fk]
    property cdmunicipio : integer read Fcdmunicipio write Fcdmunicipio;
    [fk]
    property cdmunicipiocbrnc : integer read Fcdmunicipiocbrnc write Fcdmunicipiocbrnc;
    [fk]
    property cdcontrato : integer read Fcdcontrato write Fcdcontrato;
    [fk]
    property cdproduto : integer read Fcdproduto write Fcdproduto;
    [fk]
    property cdtpregime : integer read Fcdtpregime write Fcdtpregime;
    [fk]
    property cdpais : integer read Fcdpais write Fcdpais;
    property nmcliente : string read Fnmcliente write Fnmcliente;
    property rzsocial : string read Frzsocial write Frzsocial;
    property dsendereco : string read Fdsendereco write Fdsendereco;
    property dsnumero : string read Fdsnumero write Fdsnumero;
    property dscomplemento : string read Fdscomplemento write Fdscomplemento;
    property nucxpostal : string read Fnucxpostal write Fnucxpostal;
    property nmbairro : string read Fnmbairro write Fnmbairro;
    property nucep : string read Fnucep write Fnucep;
    property nufone1 : string read Fnufone1 write Fnufone1;
    property nufone2 : string read Fnufone2 write Fnufone2;
    property nufone3 : string read Fnufone3 write Fnufone3;
    property nufone4 : string read Fnufone4 write Fnufone4;
    property nufone5 : string read Fnufone5 write Fnufone5;
    property nufax : string read Fnufax write Fnufax;
    property dsendcbrnc : string read Fdsendcbrnc write Fdsendcbrnc;
    property dsnumcbrnc : string read Fdsnumcbrnc write Fdsnumcbrnc;
    property dscomcbrnc : string read Fdscomcbrnc write Fdscomcbrnc;
    property nmbaicbrnc : string read Fnmbaicbrnc write Fnmbaicbrnc;
    property nucxpcbrnc : string read Fnucxpcbrnc write Fnucxpcbrnc;
    property nucepcbrnc : string read Fnucepcbrnc write Fnucepcbrnc;
    property nufone1cbrnc : string read Fnufone1cbrnc write Fnufone1cbrnc;
    property nufone2cbrnc : string read Fnufone2cbrnc write Fnufone2cbrnc;
    property nufone3cbrnc : string read Fnufone3cbrnc write Fnufone3cbrnc;
    property nufaxcbrnc : string read Fnufaxcbrnc write Fnufaxcbrnc;
    property tppessoa : string read Ftppessoa write Ftppessoa;
    property nuinscest : string read Fnuinscest write Fnuinscest;
    property nucnpj : string read Fnucnpj write Fnucnpj;
    property nuinscmunicipal : string read Fnuinscmunicipal write Fnuinscmunicipal;
    property nuidentid : string read Fnuidentid write Fnuidentid;
    property nucpf : string read Fnucpf write Fnucpf;
    property cdestcivil : string read Fcdestcivil write Fcdestcivil;
    property cdsexo : string read Fcdsexo write Fcdsexo;
    property dtnascimento : TDate read Fdtnascimento write Fdtnascimento;
    property nmmae : string read Fnmmae write Fnmmae;
    property nmpai : string read Fnmpai write Fnmpai;
    property nmconjuge : string read Fnmconjuge write Fnmconjuge;
    property email : string read Femail write Femail;
    property homepage : string read Fhomepage write Fhomepage;
    property nucntcontabil : string read Fnucntcontabil write Fnucntcontabil;
    property dtfundacao : TDate read Fdtfundacao write Fdtfundacao;
    property dtcadastro : TDate read Fdtcadastro write Fdtcadastro;
    property dtlimite : TDate read Fdtlimite write Fdtlimite;
    property vllimite : Currency read Fvllimite write Fvllimite;
    property vlfat6meses : Currency read Fvlfat6meses write Fvlfat6meses;
    property boconsumidorfinal : string read Fboconsumidorfinal write Fboconsumidorfinal;
    property nuramal : string read Fnuramal write Fnuramal;
    property nucae : string read Fnucae write Fnucae;
    property dsobsfinanc : string read Fdsobsfinanc write Fdsobsfinanc;
    property dsobservacao : string read Fdsobservacao write Fdsobservacao;
    property nudiamensalidade : integer read Fnudiamensalidade write Fnudiamensalidade;
    property dtcadastrosocio : TDate read Fdtcadastrosocio write Fdtcadastrosocio;
    property nmnaturalidade : string read Fnmnaturalidade write Fnmnaturalidade;
    property nucntcorrente : string read Fnucntcorrente write Fnucntcorrente;
    property bopendentecobranca : string read Fbopendentecobranca write Fbopendentecobranca;
    property tpfaturamentovalor : string read Ftpfaturamentovalor write Ftpfaturamentovalor;
    property bongerarboletofaturamento : string read Fbongerarboletofaturamento write Fbongerarboletofaturamento;
    property dtdesfiliacao : TDate read Fdtdesfiliacao write Fdtdesfiliacao;
    property nucelular : string read Fnucelular write Fnucelular;
    property bonfeenviarpdf : string read Fbonfeenviarpdf write Fbonfeenviarpdf;
    property bosincronizado : string read Fbosincronizado write Fbosincronizado;
    property cdclienteantigo : string read Fcdclienteantigo write Fcdclienteantigo;
    property bonenviarpdf : string read Fbonenviarpdf write Fbonenviarpdf;
    property cdsuframa : integer read Fcdsuframa write Fcdsuframa;
    property boipi : string read Fboipi write Fboipi;
    property bopis : string read Fbopis write Fbopis;
    property bocofins : string read Fbocofins write Fbocofins;
    property boicms : string read Fboicms write Fboicms;
    property dtvalidade : TDate read Fdtvalidade write Fdtvalidade;
    property nuddg1 : string read Fnuddg1 write Fnuddg1;
    property nuddg2 : string read Fnuddg2 write Fnuddg2;
    property pricmsduplicatacte : double read Fpricmsduplicatacte write Fpricmsduplicatacte;
    property dtconsultaspc : TDate read Fdtconsultaspc write Fdtconsultaspc;
    [fk]
    property cdplconta : integer read Fcdplconta write Fcdplconta;
    [fk]
    property cdcntcusto : integer read Fcdcntcusto write Fcdcntcusto;
    property nuplconta : string read Fnuplconta write Fnuplconta;
    property nucei : string read Fnucei write Fnucei;
    property numei : string read Fnumei write Fnumei;
    property cdindiedest : integer read Fcdindiedest write Fcdindiedest;
    [fk]
    property cdfornecedorseguradora : LargeInt read Fcdfornecedorseguradora write Fcdfornecedorseguradora;
    property nuapolice : string read Fnuapolice write Fnuapolice;
    [fk]
    property cdcondpagto : integer read Fcdcondpagto write Fcdcondpagto;
    [fk]
    property cdtpcobranca : integer read Fcdtpcobranca write Fcdtpcobranca;
    property nucnpjcbrnc : string read fnucnpjcbrnc write fnucnpjcbrnc;
    property nucntcusto: string read fnucntcusto write fnucntcusto;
    property dsobservacaocteremetente: string read fdsobservacaocteremetente write fdsobservacaocteremetente;
    property nucontrato: string read fnucontrato write fnucontrato;
    function hint_rzsocial : string;
    function CdSaidaMaiorFatura:integer;
    function CdSaidaPrimeiraVenda:integer;
    function CdSaidaUltimaVenda:integer;
    function ConsistirMunicipio           (cdcliente:string):boolean;
    function ConsistirNumero              (cdcliente:string):boolean;
    function ConsistirProprietarioEmDebito(tppessoa, nucpfcnpj:string):string;
    function ConsistirProprietarioEmOutroCadastro(nucpfcnpj:string):string;
    procedure Corrigir_Numero_Endereco;
    constructor create;
    destructor destroy; override;
    function DiasMaiorAtraso              (dti, dtf:TDate):extended;
    function DiasMedioAtraso              (dti, dtf:TDate):extended;
    function DTMaiorFatura:TDate;
    function DTPrimeiraVenda:TDate;
    function DTUltimaVenda:TDate;
    function ExportarNFE(path: string; dti, dtf: TDate; bocliente:Boolean=true):boolean;
    function Exportarcte(path: string; dti, dtf: TDate; cdstcte: string; bocliente:Boolean=true): boolean;
    function GerarCodigoCNPJCPF: string;
    function GerarCodigoReduzido:string;
    procedure Listaemail(lstemail:TStrings; tpfinalidade:string=_nfe);overload;
    function NumeroDiasAtraso             (dti, dtf: TDate; cdcliente:string):integer;
    function NuSaidaMaiorFatura  :string;
    function NUSaidaPrimeiraVenda:string;
    function NUSaidaUltimaVenda  :string;
    procedure inserir_restricao(lstcdcliente, cdstcliente, cdtpcliente:TStrings; tabela:string; lsttabela:TStrings);
    function setrestricao(tabela:string):boolean;
    function vlMaiorAcumulo: currency;
    function dtMaiorAcumulo: tdate;
    function VlAtrasado : currency;
    function VlCreditoUtilizado: currency;
    function NuDiasAtrasoMedio: integer;
    function NuDiasAtrasoMedio12: integer;
    function NuDiasMaiorAtrasoMedio : integer;
    function NuDiasMaiorAtrasoMedio12: integer;
    function DtMaiorAtrasoMedio : TDate;
    function DtMaiorAtrasoMedio12 : TDate;
    function NuTituloAtrasado : integer;
    function nudiasmaioratraso : integer;
    function dtmaioratraso : TDate;
    function VlJuroNRecebido : currency;
    function VlLimiteCredito : currency;
    function VLMaiorFatura : currency;
    function VLPedidoAberto : currency;
    function VLPrimeiraVenda : currency;
    function VLUltimaVenda : currency;
    procedure Consistir_dados_nfe;
    function get_cdindiedest(cduf:integer; tppessoa:string; nuinscest: string):integer;
    procedure formatar_cnpj_cpf;
    function get_tpregime: string;
    function ConsistirDadosparaBoleto:boolean;
    function ObterListaEmailNFE:string;
    class function getListaEmailBoleto(value:Largeint):string;overload;
    class function GetListaEmail(value:Largeint):string;
    function ValidarNuinscestParaDocumentoEletronico:boolean;
    function Insert(boscript:boolean=false): String;
    function CodigoParticipante: string;
  end;
  TClienteList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TCliente;
    procedure SetItem(Index: Integer; const Value: TCliente);
  public
    function New: TCliente;
    property Items[Index: Integer]: TCliente read GetItem write SetItem;
    function Ler(codigo:Integer; cdfield:string):Boolean;overload;
    function Ler(sqlwhere: string):Boolean;overload;
    function Ler(DataSet: TDataset):boolean;overload;
    function ExisteNaLista(codigo:LargeInt):boolean;
    function Indice(codigo:LargeInt):integer;
  end;

implementation

function TCliente.CodigoParticipante: string;
begin
  if tppessoa = _f then
  begin
    result := removercaracteres(nucpf);
  end
  else
  begin
    result := removercaracteres(nucnpj);
  end;
end;

function TCliente.ConsistirDadosparaBoleto: boolean;
begin
  if rzsocial = '' then
  begin
    MessageDlg('Razão social não preenchido no cliente '+cdcliente.ToString+'.', mtInformation, [mbOK], 0);
    Abort;
  end;
  if (nucepcbrnc = '') and (nucep = '') then
  begin
    MessageDlg('Número do CEP não preenchido no cliente '+cdcliente.ToString+'.', mtInformation, [mbOK], 0);
    Abort;
  end;
  if (dsendcbrnc = '') and (dsendereco = '') then
  begin
    MessageDlg('Endereço não preenchido no cliente '+cdcliente.ToString+'.', mtInformation, [mbOK], 0);
    Abort;
  end;
  if (dsnumcbrnc = '') and (dsnumero = '') then
  begin
    MessageDlg('Número do Endereço não preenchido no cliente '+cdcliente.ToString+'.', mtInformation, [mbOK], 0);
    Abort;
  end;
  if (nmbaicbrnc = '') and (nmbairro = '') then
  begin
    MessageDlg('Bairro não preenchido no cliente '+cdcliente.ToString+'.', mtInformation, [mbOK], 0);
    Abort;
  end;
  if (cdufcbrnc = 0) and (cduf = 0) then
  begin
    MessageDlg('UF não preenchido no cliente '+cdcliente.ToString+'.', mtInformation, [mbOK], 0);
    Abort;
  end;
  if (cdmunicipiocbrnc = 0) and (cdmunicipio = 0) then
  begin
    MessageDlg('Município não preenchido no cliente '+cdcliente.ToString+'.', mtInformation, [mbOK], 0);
    Abort;
  end;
  if tppessoa = _f then
  begin
    if OnlyNumber(nucpf) = '' then
    begin
      MessageDlg('CPF não preenchido no cliente '+cdcliente.ToString+'.', mtInformation, [mbOK], 0);
      Abort;
    end;
  end
  else if OnlyNumber(nucnpj) = '' then
  begin
    MessageDlg('CNPJ não preenchido no cliente '+cdcliente.ToString+'.', mtInformation, [mbOK], 0);
    Abort;
  end;
  result := true;
end;

function TCliente.ConsistirMunicipio(cdcliente:string):boolean;
begin
  result := RetornaSQLString('select cdmunicipio from cliente where cdempresa='+empresa.cdempresa.ToString+' and cdcliente='+cdcliente) <> '';
  if result then
  begin
    exit;
  end;
  MessageDlg('Município não digitada no cadastro do cliente.'#13'Altere o cadastro do cliente para continuar.', mtinformation, [mbok], 0);
end;

function TCliente.ConsistirNumero(cdcliente:string):boolean;
begin
  result := RetornaSQLString('select dsnumero from cliente where cdempresa='+empresa.cdempresa.ToString+' and cdcliente='+cdcliente) <> '';
  if result then
  begin
    exit;
  end;
  MessageDlg('Número do Endereço não foi digitada no cadastro do cliente.'#13'Altere o cadastro do cliente para continuar.', mtinformation, [mbok], 0);
end;


procedure  TCliente.Corrigir_Numero_Endereco;
var
  q : tClasseQuery;
  dsnumero, dsendereco : string;
  r, i : integer;
  chave : boolean;
  sql : tstrings;
begin
  q              := tClasseQuery.create('select cdcliente,dsendereco,dsnumero,dscomplemento from cliente where cdempresa='+empresa.cdempresa.ToString+' and dsnumero is null or (dsnumero='''')');
  frmprogressbar := tfrmprogressbar.create(nil);
  sql            := tstringlist.create;
  try
    frmprogressbar.gau.MaxValue := q.q.RecordCount;
    frmprogressbar.Show;
    r := 0;
    while not q.q.Eof do
    begin
      inc(r);
      frmprogressbar.gau.Progress := r;
      application.ProcessMessages;
      dsendereco := q.q.fieldbyname(_dsendereco).asstring;
      chave      := false;
      dsnumero   := '';
      for i := length(dsendereco) downto 1 do
      begin
        if dsendereco[i] in [_0, _1, _2, _3, _4, _5, _6, _7, _8, _9] then
        begin
          chave := true
        end
        else
        begin
          if (dsendereco[i] = ' ') and chave and ((dsendereco[i-1] = ',') or (dsendereco[i-1] = '-'))then
          begin
            dsnumero := copy(dsendereco, i + 1, length(dsendereco) - i);
            dsendereco := copy(dsendereco, 1, i-2);
            break;
          end;
          chave := false;
        end;
        if not chave then
        begin
          break;
        end;
      end;
      if dsnumero <> ''  then
      begin
        sql.add('update cliente set dsendereco='+quotedstr(dsendereco)+',dsnumero='+quotedstr(dsnumero)+' where cdempresa='+empresa.cdempresa.ToString+' and cdcliente='+q.q.fieldbyname(_cdcliente).asstring);
      end;
      q.q.Next;
    end;
    ExecutaScript(sql);
  finally
     freeandnil(q);
     freeandnil(sql);
     freeandnil(frmprogressbar);
  end;
end;

function TCliente.NumeroDiasAtraso(dti, dtf: TDate; cdcliente:string):integer;
var
  dtis, dtfs : string;
  q : tClasseQuery;
  atrasomedio, nudiassoma : Extended;
  r : integer;
begin
  atrasomedio := 0;
  nudiassoma  := 0;
  dtis        := formatdatetime(_mm_dd_yyyy, dti);
  dtfs        := formatdatetime(_mm_dd_yyyy, dtf);
  q := tClasseQuery.create;
  try
    r := RetornaSQLInteger('select count(*) '+
                           'from duplicata '+
                           'where cdempresa='+empresa.cdempresa.ToString+' and cdstduplicata=2 and dtbaixa>dtprorrogacao and cdcliente='+cdcliente+' and dtemissao between '+quotedstr(dtis)+' and '+quotedstr(dtfs));
    q.q.sql.text  := 'select dtbaixa '+
                           ',dtprorrogacao '+
                      'from duplicata '+
                      'where cdempresa='+empresa.cdempresa.ToString+' and cdstduplicata=2 and dtbaixa>dtprorrogacao and cdcliente='+cdcliente+' and dtemissao between '+quotedstr(dtis)+' and '+quotedstr(dtfs);
    q.q.open;
    while not q.q.Eof do
    begin
      nudiassoma := nudiassoma + (q.q.fieldbyname(_dt+_baixa).AsDateTime - q.q.fieldbyname(_dtprorrogacao).AsDateTime);
      q.q.next;
    end;
    if r > 0 then
    begin
      atrasomedio := nudiassoma / r;
    end;
    result := strtoint(formatfloat(__integer, atrasomedio));
  finally
    freeandnil(q);
  end;
end;

function TCliente.DiasMedioAtraso(dti, dtf:TDate):extended;
var
  q : tClasseQuery;
  nudias : extended;
  r : integer;
begin
  result := 0;
  nudias := 0;
  q := tClasseQuery.create;
  try
    r := RetornaSQLInteger('select count(*) '+
                                 'from duplicata '+
                                 'where cdempresa='+empresa.cdempresa.ToString+' and dtemissao between '+getdtbanco(dti)+' and '+getdtbanco(dtf)+' and cdstduplicata=2 and dtbaixa>dtprorrogacao and cdcliente='+cdcliente.ToString);
    q.q.sql.text  := 'select dtbaixa'+
                            ',dtprorrogacao '+
                       'from duplicata '+
                       'where cdempresa='+empresa.cdempresa.ToString+' and dtemissao between '+getdtbanco(dti)+' and '+getdtbanco(dtf)+' and cdstduplicata=2 and dtbaixa>dtprorrogacao and cdcliente='+cdcliente.ToString;
    q.q.open;
    while not q.q.Eof do
    begin
      nudias := nudias + (q.q.fieldbyname(_dt+_baixa).AsDateTime - q.q.fieldbyname(_dtprorrogacao).AsDateTime);
      q.q.next;
    end;
    if r > 0 then
    begin
      result := nudias / r;
    end;
  finally
    freeandnil(q);
  end;
end;

function TCliente.DiasMaiorAtraso(dti, dtf:TDate):extended;
var
  q : tClasseQuery;
begin
  result := 0;
  q := tClasseQuery.create('select dtbaixa'+
                                 ',dtprorrogacao '+
                           'from duplicata '+
                           'where cdempresa='+empresa.cdempresa.ToString+' and dtemissao between '+getdtbanco(dti)+' and '+getdtbanco(dtf)+' '+
                           'and cdstduplicata=2 and dtbaixa>dtprorrogacao and cdcliente='+cdcliente.ToString);
  try
    while not q.q.Eof do
    begin
      if result < q.q.fieldbyname(_dt+_baixa).AsDateTime - q.q.fieldbyname(_dtprorrogacao).AsDateTime then
      begin
        result := q.q.fieldbyname(_dt+_baixa).AsDateTime - q.q.fieldbyname(_dtprorrogacao).AsDateTime;
      end;
      q.q.next;
    end;
  finally
    freeandnil(q);
  end;
end;

function TCliente.ConsistirProprietarioEmDebito(tppessoa, nucpfcnpj:string):string;
begin
  if tppessoa = _F then
  begin
   result := RetornaSQLString('select i.cdcliente ' +
                              'from itproprietario i ' +
                              'inner join cliente c on c.cdcliente=i.cdcliente and i.cdempresa=c.cdempresa ' +
                              'inner join duplicata d on d.cdcliente=c.cdcliente and d.cdempresa=c.cdempresa '+
                              'where d.cdstduplicata=1 and i.cdempresa='+empresa.cdempresa.ToString+' and i.nucpfcnpj='+quotedstr(nucpfcnpj)+' and i.cdcliente<>'+cdcliente.ToString+' and d.dtprorrogacao<'+quotedstr(DtBancos)+' '+
                              'group by i.cdcliente')
  end
  else if tppessoa = _J then
  begin
   result := RetornaSQLString('select c.cdcliente ' +
                              'from cliente c ' +
                              'inner join duplicata d on d.cdcliente=c.cdcliente and c.cdempresa=d.cdempresa '+
                              'where d.cdstduplicata=1 and c.cdempresa='+empresa.cdempresa.ToString+' and c.nucnpj='+quotedstr(nucpfcnpj)+' and c.cdcliente<>'+cdcliente.ToString+' and d.dtprorrogacao<'+quotedstr(DtBancos)+' '+
                              'group by c.cdcliente')
  end;
end;

function TCliente.ConsistirProprietarioEmOutroCadastro(nucpfcnpj:string):string;
var
  codigo : TStrings;
  q : TClasseQuery;
begin
  codigo := TStringList.Create;
  q := tClasseQuery.Create('select c.cdcliente,c.rzsocial ' +
                           'from itproprietario i ' +
                           'inner join cliente c on c.cdcliente=i.cdcliente and i.cdempresa=c.cdempresa ' +
                           'where i.cdempresa='+empresa.cdempresa.ToString+' and i.nucpfcnpj='+quotedstr(nucpfcnpj)+' and i.cdcliente<>'+cdcliente.ToString+' '+
                           'group by c.cdcliente,c.rzsocial');
  try
    while not q.q.Eof do
    begin
      codigo.Add(q.q.fieldbyname(_cdcliente).asstring+' - ' +q.q.fieldbyname(_rzsocial).AsString);
      q.q.Next;
    end;
    result := codigo.Text;
  finally
    freeandnil(q);
    freeandnil(codigo);
  end;
end;

procedure TCliente.Consistir_dados_nfe;
begin
  if removercaracteres(nucep) = ''then
  begin
    MessageDlg('Número do CEP do Cliente não está preenchido.', mtInformation, [mbOK], 0);
    Abort;
  end;
  if RemoverEspacosVazios(dsnumero) = '' then
  begin
    MessageDlg('Número do Endereço do Cliente não está preenchido.', mtInformation, [mbOK], 0);
    Abort;
  end;
  if RemoverEspacosVazios(dsendereco) = '' then
  begin
    MessageDlg('Endereço do Cliente não está preenchido.', mtInformation, [mbOK], 0);
    Abort;
  end;

  if qregistro.stringdocodigo(_uf, cduf, _sguf) <> 'EX' then
  begin
    if tppessoa = _J then
    begin
      if removercaracteres(nucnpj) = '' then
      begin
        MessageDlg('CNPJ do Cliente não está preenchido.', mtInformation, [mbOK], 0);
        Abort;
      end;
    end
    else if removercaracteres(nucpf) = '' then
    begin
      MessageDlg('CPF do Cliente não está preenchido.', mtInformation, [mbOK], 0);
      Abort;
    end;
  end;
  if (Length(removercaracteres(nufone1)) <> 0) and (Length(removercaracteres(nufone1)) <> 10) then
  begin
    MessageDlg('Número do Telefone do destinatário não está preenchido completamente.', mtInformation, [mbOK], 0);
    Abort;
  end;
  if (not ((tppessoa = _F) and (nuinscest = ''))) and (ValidarIE(nuinscest, qregistro.stringdocodigo(_uf, cduf, _sguf)) <> '') then
  begin
    MessageDlg('Número da Inscrição Estadual inválida do destinatário.'#13'Altere o cadastro antes de continuar.', mtInformation, [mbOK], 0);
    Abort;
  end;
end;

function TCliente.CdSaidaPrimeiraVenda:integer;
var
  dt : TDate;
begin
  result := 0;
  dt := RetornaSQLData('select min(dtemissao) from saida where cdempresa='+empresa.cdempresa.ToString+' and cdcliente='+cdcliente.ToString);
  if dt = strtodate(_30_12_1899) then
  begin
    exit;
  end;
  result := RetornaSQLInteger('select cdsaida from saida where cdempresa='+empresa.cdempresa.ToString+' and cdcliente='+cdcliente.ToString+' and dtemissao='+getdtbanco(dt)+' order by cdsaida');
end;

function TCliente.NuSaidaPrimeiraVenda:string;
var
  dt : TDate;
begin
  dt := RetornaSQLData('select min(dtemissao) from saida where cdempresa='+empresa.cdempresa.ToString+' and cdcliente='+cdcliente.ToString);
  if dt = strtodate(_30_12_1899) then
  begin
    exit;
  end;
  result := RetornaSQLString('select nusaida from saida where cdempresa='+empresa.cdempresa.ToString+' and cdcliente='+cdcliente.ToString+' and dtemissao='+getdtbanco(dt)+' order by cdsaida');
end;

function TCliente.VLPrimeiraVenda: currency;
var
  dt : TDate;
begin
  result := 0;
  dt := RetornaSQLData('select min(dtemissao) from saida where cdempresa='+empresa.cdempresa.ToString+' and cdcliente='+cdcliente.ToString);
  if dt = strtodate(_30_12_1899) then
  begin
    exit;
  end;
  result := RetornaSQLCurrency('select vltotal from saida where cdempresa='+empresa.cdempresa.ToString+' and cdcliente='+cdcliente.ToString+' and dtemissao='+getdtbanco(dt)+' order by cdsaida');
end;

function TCliente.DTPrimeiraVenda:TDate;
begin
  result := RetornaSQLData('select min(dtemissao) from saida where cdempresa='+empresa.cdempresa.ToString+' and cdcliente='+cdcliente.ToString);
end;

function TCliente.CdSaidaUltimaVenda:integer;
var
  dt : TDate;
begin
  result := 0;
  dt := RetornaSQLData('select max(dtemissao) from saida where cdempresa='+empresa.cdempresa.ToString+' and cdcliente='+cdcliente.ToString);
  if dt = strtodate(_30_12_1899) then
  begin
    exit;
  end;
  result := RetornaSQLInteger('select cdsaida from saida where cdempresa='+empresa.cdempresa.ToString+' and cdcliente='+cdcliente.ToString+' and dtemissao='+getdtbanco(dt)+' order by cdsaida desc');
end;

function TCliente.NuSaidaUltimaVenda:string;
var
  dt : TDate;
begin
  dt := RetornaSQLData('select max(dtemissao) from saida where cdempresa='+empresa.cdempresa.ToString+' and cdcliente='+cdcliente.ToString);
  if dt = strtodate(_30_12_1899) then
  begin
    exit;
  end;
  result := RetornaSQLString('select nusaida from saida where cdempresa='+empresa.cdempresa.ToString+' and cdcliente='+cdcliente.ToString+' and dtemissao='+getdtbanco(dt)+' order by cdsaida desc');
end;

function TCliente.VLUltimaVenda: currency;
var
  dt : TDate;
begin
  result := 0;
  dt := RetornaSQLData('select max(dtemissao) from saida where cdempresa='+empresa.cdempresa.ToString+' and cdcliente='+cdcliente.ToString);
  if dt = strtodate(_30_12_1899) then
  begin
    exit;
  end;
  result := RetornaSQLCurrency('select vltotal from saida where cdempresa='+empresa.cdempresa.ToString+' and cdcliente='+cdcliente.ToString+' and dtemissao='+getdtbanco(dt)+' order by cdsaida desc');
end;

function TCliente.DTUltimaVenda:TDate;
begin
  result := RetornaSQLData('select max(dtemissao) from saida where cdempresa='+empresa.cdempresa.ToString+' and cdcliente='+cdcliente.ToString);
end;

function TCliente.CdSaidaMaiorFatura:integer;
var
  vl: currency;
begin
  result := 0;
  vl     := RetornaSQLCurrency('select max(vltotal) from saida where cdempresa='+empresa.cdempresa.ToString+' and cdcliente='+cdcliente.ToString);
  if vl <= 0 then
  begin
    exit;
  end;
  result := RetornaSQLInteger('select cdsaida from saida where cdempresa='+empresa.cdempresa.ToString+' and cdcliente='+cdcliente.ToString+' and vltotal='+getcurrencys(vl));
end;

function TCliente.NuSaidaMaiorFatura:string;
var
  vl: currency;
begin
  vl := RetornaSQLCurrency('select max(vltotal) from saida where cdempresa='+empresa.cdempresa.ToString+' and cdcliente='+cdcliente.ToString);
  if vl <= 0 then
  begin
    exit;
  end;
  result := RetornaSQLString('select nusaida cdsaida from saida where cdempresa='+empresa.cdempresa.ToString+' and cdcliente='+cdcliente.ToString+' and vltotal='+getcurrencys(vl));
end;

function TCliente.DTMaiorFatura:TDate;
var
  vl : currency;
begin
  vl := RetornaSQLCurrency('select max(vltotal) from saida where cdempresa='+empresa.cdempresa.ToString+' and cdcliente='+cdcliente.ToString);
  if vl <= 0 then
  begin
    result := 0;
    exit;
  end;
  result := RetornaSQLData('select dtemissao from saida where cdempresa='+empresa.cdempresa.ToString+' and cdcliente='+cdcliente.ToString+' and vltotal='+getcurrencys(vl));
end;

function TCliente.VLMaiorFatura:currency;
begin
  result := RetornaSQLCurrency('select max(vltotal) from saida where cdempresa='+empresa.cdempresa.ToString+' and cdcliente='+cdcliente.ToString);
end;

function TCliente.VlLimiteCredito:currency;
begin
  result := 0;
  if cdcliente = 0 then
  begin
    exit;
  end;
  result := RetornaSQLCurrency('select vllimite from cliente where cdempresa='+empresa.cdempresa.ToString+' and cdcliente='+cdcliente.ToString);
end;

function TCliente.VlPedidoAberto:currency;
var
  q : tClasseQuery;
begin
  result := 0;
  q := tClasseQuery.Create('select qtitem'+
                                 ',qtatendida'+
                                 ',vlunitario'+
                                 ',(select qtpedidoatendido from empresa) qtpedidoatendido '+
                           'from pedido '+
                           'inner join itpedido on itpedido.cdpedido=pedido.cdpedido and pedido.cdempresa=itpedido.cdempresa '+
                           'inner join stpedido on stpedido.cdstpedido=pedido.cdstpedido and stpedido.cdempresa=pedido.cdstpedido '+
                           'where ((nmstpedido=''ABERTO'') or (nmstpedido=''PARCIAL'')) and cdcliente='+cdcliente.ToString+' and pedido.cdempresa='+empresa.cdempresa.ToString);
  try
    while not q.q.eof do
    begin
      if (q.q.fieldbyname(_qtitem).Ascurrency-q.q.fieldbyname(_qtatendida).Ascurrency-q.q.fieldbyname(_qtpedidoatendido).Ascurrency) > 0 then
      begin
        result := result + ((q.q.fieldbyname(_qtitem).Ascurrency - q.q.fieldbyname(_qtatendida).Ascurrency) * q.q.fieldbyname(_vlunitario).Ascurrency);
      end;
      q.q.Next;
    end;
  finally
    freeandnil(q);
  end;
end;

function TCliente.VlJuroNRecebido:currency;
begin
  result := RetornaSQLCurrency('select sum(vljurosnrecebido) from duplicata where cdempresa='+empresa.cdempresa.ToString+' and cdcliente='+cdcliente.ToString);
end;

constructor TCliente.create;
begin
  inherited;
  ftpcliente := TTpCliente.Create;
  fclienteentrega := tclienteentregalist.create;
  fitclienteemail := titclienteemaillist.Create;
  fstcliente := tstcliente.create;
  fitclientecampanha := titclientecampanhaList.create;
end;

function TCliente.ExportarNFE(path: string; dti, dtf: TDate; bocliente:Boolean=true): boolean;
var
  q : tClasseQuery;
  arquivo : tstrings;
begin
  result  := false;
  q       := tClasseQuery.create;
  arquivo := tstringlist.create;
  try
    q.q.sql.text   := 'select S.nuchavenfe,S.dsxml,S.nusaida,S.dtemissao '+
                       'from saida s '+
                       'where s.cdempresa='+empresa.cdempresa.ToString+' and s.dsxml is not null and (s.nustdocumento=''02'' or s.nustdocumento=''00'') '+
                       'and s.dtemissao between '+getdtbanco(dti)+' and '+getdtbanco(dtf);
    if bocliente then
    begin
      q.q.sql.text := q.q.sql.text + ' and cdcliente='+cdcliente.ToString;
    end;
    q.q.open;
    while not q.q.eof do
    begin
      arquivo.Text := q.q.fieldbyname(_dsxml).asstring;
      if q.q.fieldbyname(_nuchavenfe).AsString <> '' then
      begin
        arquivo.SaveToFile(path+'\'+q.q.fieldbyname(_nuchavenfe).AsString+'.'+_xml);
      end
      else
      begin
        arquivo.SaveToFile(path+'\NF '+q.q.fieldbyname(_nusaida).AsString+' - Emissao '+FormatDateTime('DD-MM-YYYY', q.q.fieldbyname(_dtemissao).AsDateTime)+'.'+_xml);
      end;
      q.q.next;
      result := true;
    end;
  finally
    freeandnil(q);
    freeandnil(arquivo);
  end;
end;

function TCliente.Exportarcte(path: string; dti, dtf: TDate; cdstcte: string; bocliente:Boolean=true): boolean;
var
  s : TClasseQuery;
  arquivo : tstrings;
begin
  result  := false;
  s       := TClasseQuery.create;
  arquivo := tstringlist.create;
  try
    s.q.sql.text := 'select nuchavenfe,dsxml,dsxmlcancel,cdcte,dtemissao '+
                     'from cte '+
                     'where cdempresa='+empresa.cdempresa.ToString+' and cdstcte='+cdstcte+' and dtemissao between '+getdtbanco(dti)+' and '+getdtbanco(dtf);
    if bocliente then
    begin
      s.q.sql.text := s.q.sql.text + ' and (('+_cdremetente   +'='+cdcliente.ToString+' and cdctetptomador=1) or '+
                                                  '('+_cddestinatario+'='+cdcliente.ToString+' and cdctetptomador=4) or '+
                                                  '('+_cdtomador     +'='+cdcliente.ToString+' and cdctetptomador=5) or '+
                                                  '('+_cdrecebedor   +'='+cdcliente.ToString+' and cdctetptomador=3) or '+
                                                  '('+_cdexpedidor   +'='+cdcliente.ToString+' and cdctetptomador=2))';
    end;
    s.q.open;
    while not s.q.eof do
    begin
      if cdstcte = _3 then
      begin
        arquivo.Text := s.q.fieldbyname(_dsxml).asstring
      end
      else if cdstcte = _2 then
      begin
        arquivo.Text := s.q.fieldbyname(_dsxmlcancel).asstring;
      end;
      if s.q.fieldbyname(_nuchavenfe).AsString <> '' then
      begin
        if cdstcte = _3 then
        begin
          arquivo.SaveToFile(path+'\'+s.q.fieldbyname(_nuchavenfe).AsString+'.'+_xml)
        end
        else if cdstcte = _2 then
        begin
          arquivo.SaveToFile(path+'\'+s.q.fieldbyname(_nuchavenfe).AsString+'-ProcCancCTe.'+_xml);
        end;
      end
      else
      begin
        if cdstcte = _3 then
        begin
          arquivo.SaveToFile(path+'\cte '+s.q.fieldbyname(_cdcte).AsString+' - Emissao '+FormatDateTime('DD-MM-YYYY', s.q.fieldbyname(_dtemissao).AsDateTime)+'.'+_xml)
        end
        else if cdstcte = _2 then
        begin
          arquivo.SaveToFile(path+'\cte '+s.q.fieldbyname(_cdcte).AsString+' - Emissao '+FormatDateTime('DD-MM-YYYY', s.q.fieldbyname(_dtemissao).AsDateTime)+'-ProcCancCTe.'+_xml);
        end;
      end;
      s.q.next;
      result := true;
    end;
  finally
    freeandnil(s);
    freeandnil(arquivo);
  end;
end;

procedure TCliente.Listaemail(lstemail: TStrings; tpfinalidade:string=_nfe);
  function get_tpfinalidade:string;
  begin
    if tpfinalidade = _nfe then
    begin
      result := result + _nfe
    end
    else
    begin
      Result := Result + _boleto;
    end;
  end;
var
  q : tclassequery;
begin
  email := RetornaSQLString('select email from cliente where cdempresa='+empresa.cdempresa.ToString+' and cdcliente='+cdcliente.ToString);
  q     := TClasseQuery.Create('select email from itclienteemail where cdempresa='+empresa.cdempresa.ToString+' and cdcliente='+cdcliente.ToString+' and bo'+get_tpfinalidade+'=''S''');
  try
    while not q.q.Eof do
    begin
      lstemail.Add(q.q.fieldbyname(_email).AsString);
      q.q.Next;
    end;
  finally
    freeandnil(q);
  end;
end;

destructor TCliente.destroy;
begin
  FreeAndNil(ftpcliente);
  freeandnil(fclienteentrega);
  freeandnil(fitclienteemail);
  freeandnil(fitclientecampanha);
  freeandnil(fstcliente);
  inherited;
end;

function TCliente.setrestricao(tabela: string):boolean;
begin
  result := RetornaSQLInteger('select count(*) from '+_cliente+tabela+' where cdempresa='+empresa.cdempresa.ToString+' and cdcliente='+cdcliente.ToString)>0;
end;

function TCliente.GerarCodigoReduzido: string;
var
  q : tClasseQuery;
  newcod : integer;
  lsttabela : TStrings;
  reg_alterado : Integer;
  procedure atualizar_tabela(tabela:string; dsadicional: string=''; nome:string='cdcliente');
  begin
    if tabela = _duplicata then
    begin
      ExecutaSQL('update '+tabela+' set cdtp'+tabela+'=1 where cdtp'+tabela+' is null');
    end;
    ExecutaSQL('update '+tabela+' set '+nome+dsadicional+'='+newcod.ToString+' where cdempresa='+empresa.cdempresa.ToString+' and '+nome+dsadicional+'='+q.q.fieldbyname(_cdcliente).AsString);
  end;
  procedure preencher_lista_tabela;
  begin
    lsttabela.Text := _adntcliente+#13+
                      _aprovacao+#13+
                      _cheque+#13+
                      _contrato+#13+
                      _duplicata+#13+
                      _entrada+#13+
                      _hadntcliente+#13+
                      _hestoquecliente+#13+
                      _intervencao+#13+
                      _itlp1a+#13+
                      _itrota+#13+
                      _locacao+#13+
                      _movbancario+#13+
                      _negociacao+#13+
                      _ordserv+#13+
                      _orcamento+#13+
                      _pedido+#13+
                      _saida+#13+
                      _paciente+#13+
                      _clientefilial+#13+
                      _tarefa;
  end;
  procedure trocar_codigo_na_lista_tabela;
  var
    i : Integer;
  begin
    for i := 0 to lsttabela.Count - 1 do
    begin
      atualizar_tabela(lsttabela[i]);
    end;
  end;
begin
  q              := tClasseQuery.Create('SELECT CDCLIENTE,NUCNPJ,NUCPF FROM CLIENTE where cdempresa='+empresa.cdempresa.ToString+' ORDER BY CDCLIENTE');
  frmprogressbar := Tfrmprogressbar.Create(nil);
  lsttabela      := TStringList.Create;
  try
    frmprogressbar.gau.MaxValue := q.q.RecordCount;
    frmprogressbar.Show;
    reg_alterado := 0;
    while not q.q.Eof do
    begin
      Application.Title := q.q.fieldbyname(_cdcliente).AsString;
      frmprogressbar.gau.Progress := q.q.RecNo;
      Application.ProcessMessages;
      if ((removercaracteres(RemoverCaracterInicio(q.q.FieldByName(_nucnpj).AsString, _0)) <> q.q.FieldByName(_cdcliente).AsString) and
         (removercaracteres(RemoverCaracterInicio(q.q.FieldByName(_nucpf).AsString, _0)) <> q.q.FieldByName(_cdcliente).AsString) and
         (Length(q.q.fieldbyname(_cdcliente).AsString) <7))
         or (q.q.fieldbyname(_cdcliente).AsString = '')then
      begin
        q.q.Next;
        continue;
      end;
      inc(reg_alterado);
      // copiar dados do cliente
      newcod := copiar_registro(q.q.fieldbyname(_cdcliente).AsLargeInt, _cliente    , _cdcliente,     0, '', '');
      // copiar dados dos itens
      copiar_registro(q.q.fieldbyname(_cdcliente).AsLargeInt, _clientecondpagto     , _cdcliente, newcod, '', '');
      copiar_registro(q.q.fieldbyname(_cdcliente).AsLargeInt, _clienteentrega       , _cdcliente, newcod, '', '');
      copiar_registro(q.q.fieldbyname(_cdcliente).AsLargeInt, _clientetpcobranca    , _cdcliente, newcod, '', '');
      copiar_registro(q.q.fieldbyname(_cdcliente).AsLargeInt, _itbanco , _cdcliente , newcod, '', '');
      copiar_registro(q.q.fieldbyname(_cdcliente).AsLargeInt, _itclientearquivo     , _cdcliente, newcod, '', '');
      copiar_registro(q.q.fieldbyname(_cdcliente).AsLargeInt, _itclienteemail       , _cdcliente, newcod, '', '');
      copiar_registro(q.q.fieldbyname(_cdcliente).AsLargeInt, _itclienteinfcomercial, _cdcliente, newcod, '', '');
      copiar_registro(q.q.fieldbyname(_cdcliente).AsLargeInt, _itclienteproduto     , _cdcliente, newcod, '', '');
      copiar_registro(q.q.fieldbyname(_cdcliente).AsLargeInt, _itcontcliente        , _cdcliente, newcod, '', '');
      copiar_registro(q.q.fieldbyname(_cdcliente).AsLargeInt, _itproprietario       , _cdcliente, newcod, '', '');
      copiar_registro(q.q.fieldbyname(_cdcliente).AsLargeInt, _itrefcomercial       , _cdcliente, newcod, '', '');

      preencher_lista_tabela;
      trocar_codigo_na_lista_tabela;

      // alterar dados nas tabelas relacionadas
      atualizar_tabela(_cte          , '', _cddestinatario);
      atualizar_tabela(_cte          , '', _cdremetente);
      atualizar_tabela(_cte          , '', _cdrecebedor);
      atualizar_tabela(_cte          , '', _cdtomador);
      atualizar_tabela(_cte          , '', _cdexpedidor);
      atualizar_tabela(_clientefilial, '', _cdclientefilial);
      atualizar_tabela(_paciente     , '', _cdclientefilial);
      atualizar_tabela(_locacao      , '', _cdclientecoresponsavel);

      ExecutaSQL('UPDATE ORCAMENTO '+
                 'set ORCAMENTO.cditcontcliente=NULL '+
                 'WHERE cdempresa='+empresa.cdempresa.ToString+' and CDITCONTCLIENTE IN (SELECT CDITCONTCLIENTE '+
                                                                               'FROM ITCONTCLIENTE '+
                                                                               'WHERE cdempresa='+empresa.cdempresa.ToString+' and CDCLIENTE='+q.q.fieldbyname(_cdcliente).AsString+')');
      ExecutaSQL('delete from cliente where cdempresa='+empresa.cdempresa.ToString+' and cdcliente='+q.q.fieldbyname(_cdcliente).AsString);
      q.q.Next;
    end;
    ShowMessage('Foram alterados '+inttostr(reg_alterado)+' registro(s).');
  finally
    freeandnil(q);
    freeandnil(frmprogressbar);
    freeandnil(lsttabela);
  end;
end;

class function TCliente.GetListaEmail(value: Largeint): string;
var
  cliente : TCliente;
begin
  result := Tcliente.getListaEmailBoleto(value);
  if result = '' then
  begin
    cliente := tcliente.create;
    try
      cliente.select(value);
      result := cliente.email;
    finally
      freeandnil(cliente);
    end;
  end;
end;

function TCliente.GerarCodigoCNPJCPF: string;
var
  s : TClasseQuery;
  newcod : integer;
  reg_alterado : Integer;
  procedure atualizar_tabela(tabela:string; dsadicional: string=''; nome:string='cdcliente');
  begin
    if tabela = _duplicata then
    begin
      ExecutaSQL('update '+tabela+' set cdtp'+tabela+'=1 where cdtp'+tabela+' is null');
    end;
    ExecutaSQL('update '+tabela+' set '+nome+dsadicional+'='+newcod.ToString+' where cdempresa='+empresa.cdempresa.ToString+' and '+nome+dsadicional+'='+s.q.fieldbyname(_cdcliente).AsString);
  end;
  function codigo_for_cpf_cnpj:Boolean;
  begin
    result := (removercaracteres(RemoverCaracterInicio(s.q.FieldByName(_nucnpj).AsString, _0)) = s.q.FieldByName(_cdcliente).AsString) or
              (removercaracteres(RemoverCaracterInicio(s.q.FieldByName(_nucpf).AsString, _0)) = s.q.FieldByName(_cdcliente).AsString);
  end;
  function cnpj_cpf_preenchido:boolean;
  begin
    result := (removercaracteres(RemoverCaracterInicio(s.q.FieldByName(_nucnpj).AsString, _0)) <> '') or
              (removercaracteres(RemoverCaracterInicio(s.q.FieldByName(_nucpf).AsString , _0)) <> '');
  end;
  function codigo_cpf_cnpj:integer;
  var
    texto : string;
  begin
    texto := removercaracteres(RemoverCaracterInicio(s.q.FieldByName(_nucnpj).AsString, _0));
    if texto = '' then
    begin
      texto := removercaracteres(RemoverCaracterInicio(s.q.FieldByName(_nucpf).AsString , _0));
    end;
    result := strtoint(texto);
  end;
begin
  s := tClasseQuery.Create('SELECT CDCLIENTE,NUCNPJ,NUCPF FROM CLIENTE where cdempresa='+empresa.cdempresa.ToString);
  frmprogressbar := Tfrmprogressbar.Create(nil);
  try
    frmprogressbar.gau.MaxValue := s.q.RecordCount;
    frmprogressbar.Show;
    reg_alterado := 0;
    while not s.q.Eof do
    begin
      Application.Title           := s.q.fieldbyname(_cdcliente).AsString;
      frmprogressbar.gau.Progress := s.q.RecNo;
      Application.ProcessMessages;

      if Codigo_for_CPF_CNPJ or (not cnpj_cpf_preenchido) then
      begin
        s.q.Next;
        continue;
      end;
      newcod := codigo_cpf_cnpj;
      if qregistro.CodigoExiste(_cliente, newcod) then
      begin
        s.q.Next;
        continue;
      end;
      inc(reg_alterado);
      // copiar dados do cliente
      newcod := copiar_registro(s.q.fieldbyname(_cdcliente).AsLargeInt, _cliente            , _cdcliente, newcod, '', '');
      // copiar dados dos itens
      copiar_registro(s.q.fieldbyname(_cdcliente).AsLargeInt, _clientecondpagto     , _cdcliente, newcod, '', '');
      copiar_registro(s.q.fieldbyname(_cdcliente).AsLargeInt, _clienteentrega       , _cdcliente, newcod, '', '');
      copiar_registro(s.q.fieldbyname(_cdcliente).AsLargeInt, _clientetpcobranca    , _cdcliente, newcod, '', '');
      copiar_registro(s.q.fieldbyname(_cdcliente).AsLargeInt, _itbanco , _cdcliente , newcod, '', '');
      copiar_registro(s.q.fieldbyname(_cdcliente).AsLargeInt, _itclientearquivo     , _cdcliente, newcod, '', '');
      copiar_registro(s.q.fieldbyname(_cdcliente).AsLargeInt, _itclienteemail       , _cdcliente, newcod, '', '');
      copiar_registro(s.q.fieldbyname(_cdcliente).AsLargeInt, _ITCLIENTEINFCOMERCIAL, _cdcliente, newcod, '', '');
      copiar_registro(s.q.fieldbyname(_cdcliente).AsLargeInt, _itclienteproduto     , _cdcliente, newcod, '', '');
      copiar_registro(s.q.fieldbyname(_cdcliente).AsLargeInt, _itcontcliente        , _cdcliente, newcod, '', '');
      copiar_registro(s.q.fieldbyname(_cdcliente).AsLargeInt, _itproprietario       , _cdcliente, newcod, '', '');
      copiar_registro(s.q.fieldbyname(_cdcliente).AsLargeInt, _itrefcomercial       , _cdcliente, newcod, '', '');

      // alterar dados nas tabelas relacionadas
      atualizar_tabela(_adntcliente);
      atualizar_tabela(_aprovacao);
      atualizar_tabela(_cheque);
      atualizar_tabela(_contrato);
      atualizar_tabela(_cte, '', _cddestinatario);
      atualizar_tabela(_cte, '', _cdremetente);
      atualizar_tabela(_cte, '', _cdrecebedor);
      atualizar_tabela(_cte, '', _cdtomador);
      atualizar_tabela(_cte, '', _cdexpedidor);
      atualizar_tabela(_clientefilial, '', _cdclientefilial);
      atualizar_tabela(_paciente, '', _cdclientefilial);
      atualizar_tabela(_duplicata);
      atualizar_tabela(_entrada);
      atualizar_tabela(_equipamento);
      atualizar_tabela(_h+_adntcliente);
      atualizar_tabela(_h+_estoque+_cliente);
      atualizar_tabela(_intervencao);
      atualizar_tabela(_itlp1a);
      atualizar_tabela(_it+_rota);
      atualizar_tabela(_locacao);
      atualizar_tabela(_movbancario);
      atualizar_tabela(_negociacao);
      atualizar_tabela(_ordserv);
      atualizar_tabela(_pedido);
      atualizar_tabela(_saida);
      atualizar_tabela(_tarefa);
      atualizar_tabela(_paciente);
      atualizar_tabela(_clientefilial);
      ExecutaSQL('delete from cliente where cdempresa='+empresa.cdempresa.ToString+' and cdcliente='+s.q.fieldbyname(_cdcliente).AsString);
      s.q.Next;
    end;
    ShowMessage('Foram alterados '+inttostr(reg_alterado)+' registro(s).');
  finally
    freeandnil(s);
    freeandnil(frmprogressbar);
  end;
end;

procedure TCliente.inserir_restricao(lstcdcliente, cdstcliente, cdtpcliente: TStrings; tabela: string; lsttabela: TStrings);
  function makesql:string;
  begin
    result := 'select cdcliente from cliente where cdempresa='+empresa.cdempresa.ToString;
    sqlmontarlista(lstcdcliente, _cliente, _cdcliente, result);
    sqlmontarlista(cdtpcliente , _cliente, _cdtpcliente, result);
    sqlmontarlista(cdstcliente , _cliente, _cdstcliente, result);
  end;
  function makesql_insert:string;
  begin
    result := QRetornaSQL.get_select_from(_cliente+uppercase(tabela), _0);
  end;
var
  q : TClasseQuery;
  qi : TClasseQuery;
  i : Integer;
begin
  q  := TClasseQuery.Create;
  qi := TClasseQuery.Create(makesql_insert, true);
  frmprogressbar := Tfrmprogressbar.Create(nil);
  try
    q.q.SQL.Text  := makesql;
    q.q.open;
    frmprogressbar.gau.MaxValue := q.q.RecordCount;
    frmprogressbar.Show;
    while not q.q.Eof do
    begin
      frmprogressbar.gau.Progress := q.q.RecNo;
      Application.ProcessMessages;
      for i := 0 to lsttabela.Count - 1 do
      begin
        if not RegistroExiste(_cliente+tabela, _cdempresa+'='+empresa.cdempresa.ToString+' and '+_cdcliente+'='+q.q.fieldbyname(_cdcliente).AsString+' and cd'+tabela+'='+lsttabela[i]) then
        begin
          qi.q.Insert;
          qi.q.FieldByName(_cdcliente).asstring := q.q.fieldbyname(_cdcliente).AsString;
          qi.q.FieldByName(_cd+tabela).AsString := lsttabela[i];
          qi.q.FieldByName(_cdclientetpcobranca).AsInteger := qgerar.GerarCodigo(_cliente+tabela);
          RegistraInformacao_(qi.q);
          qi.q.Post;
        end;
      end;
      q.q.Next;
    end;
    messagedlg(_msg_Configuracao_Aplicada, mtinformation, [mbok], 0);
  finally
    freeandnil(frmprogressbar);
    freeandnil(q);
    freeandnil(qi);
  end;
end;

function TCliente.Insert(boscript: boolean): String;
begin
  if nmcliente = '' then
  begin
    nmcliente := rzsocial;
  end;
  if cdstcliente = 0 then
  begin
    cdstcliente := QRegistro.CodigoStatusNovo(_cliente);
  end;
  if dtcadastro = 0 then
  begin
    dtcadastro  := DtBanco;
  end;
  result := inherited insert(boscript);
end;

class function TCliente.getListaEmailBoleto(value: Largeint): string;
var
  I: Integer;
  lista : Titclienteemaillist;
begin
  Lista := Titclienteemaillist.create;
  try
    result := '';
    lista.Ler(value, _cdcliente);
    for I := 0 to lista.count - 1 do
    begin
      if lista.items[i].boboleto = _s then
      begin
        if result <> '' then
        begin
          result := result + ';';
        end;
        result := result + lista.items[i].email;
      end;
    end;
  finally
    FreeAndNil(lista);
  end;
end;

function TCliente.get_cdindiedest(cduf: integer; tppessoa, nuinscest: string): integer;
begin
  result := 1;
  if cduf = 99 then
  begin
    result := 3;
  end
  else if (tppessoa = _f) or (nuinscest = qstring.Maiuscula(_ISENTO)) or (nuinscest = '') then
  begin
    result := 2;
  end;
end;

procedure TCliente.formatar_cnpj_cpf;
var
  q : tclassequery;
  sql : tstrings;
  function get_formatar_cnpj_cpf:string;
  begin
    result := 'nucnpj='+formatarcnpj(q.q.fieldbyname(_nucnpj).asstring).QuotedString;
    if q.q.fieldbyname(_tppessoa).asstring = _f then
    begin
      result := 'nucpf='+quotedstr(formatarcpf(q.q.fieldbyname(_nucpf).asstring));
    end;
  end;
begin
  q   := tclassequery.create('select cdcliente,nucnpj,nucpf,tppessoa from cliente where cdempresa='+empresa.cdempresa.ToString);
  sql := tstringlist.create;
  try
    while not q.q.Eof do
    begin
      sql.add('update cliente set '+get_formatar_cnpj_cpf+' where cdempresa='+empresa.cdempresa.ToString+' and cdcliente='+q.q.fieldbyname(_cdcliente).asstring);
      q.q.next;
    end;
    if (sql.count > 0) and ExecutaScript(sql) then
    begin
      MessageDlg('Formatação concluída.', mtInformation, [mbOK], 0);
    end;
  finally
    FreeAndNil(q);
    FreeAndNil(sql);
  end;
end;

function TCliente.vlMaiorAcumulo: currency;
var
  s : TClasseQuery;
  lst, vlduplicata, dtemissao, dtvencimento : TStrings;
  vvalor, maioracumulo : Currency;
  dtinicial, dtfinal : TDate;
  i : integer;
begin
  result := 0;
  if RetornaSQLInteger('select count(*) from duplicata where cdempresa='+empresa.cdempresa.ToString+' and cdcliente='+cdcliente.ToString) = 0 then
  begin
    exit;
  end;
  s            := TClasseQuery.create('select dtemissao,dtprorrogacao,vlduplicata from duplicata where cdempresa='+empresa.cdempresa.ToString+' and cdcliente='+cdcliente.ToString+' order by dtemissao');
  vlduplicata  := TStringList.create;
  dtemissao    := TStringList.create;
  dtvencimento := TStringList.create;
  lst          := TStringList.Create;
  try
    vlduplicata.Add (s.q.fieldbyname(_vl+_duplicata).asstring);
    dtemissao.Add   (formatdatetime(_dd_mm_yyyy, s.q.fieldbyname(_dt+_emissao).AsDateTime));
    dtvencimento.add(formatdatetime(_dd_mm_yyyy, s.q.fieldbyname(_dtprorrogacao).AsDateTime));

    maioracumulo   := s.q.fieldbyname(_vl+_duplicata).ascurrency;
    dtinicial      := s.q.fieldbyname(_dt+_emissao).AsDateTime;
    dtfinal        := s.q.fieldbyname(_dtprorrogacao).AsDateTime;

    vvalor:= maioracumulo;

    s.q.next;
    while not s.q.Eof do
    begin
      if s.q.fieldbyname(_dt+_emissao).AsDateTime >= dtinicial then
      begin
        dtinicial := s.q.fieldbyname(_dt+_emissao).AsDateTime;
        if dtfinal <= s.q.fieldbyname(_dtprorrogacao).AsDateTime then
        begin
          dtfinal := s.q.fieldbyname(_dtprorrogacao).AsDateTime;
        end;
        maioracumulo := maioracumulo + s.q.fieldbyname(_vl+_duplicata).ascurrency;
      end;

      vlduplicata.add (s.q.fieldbyname(_vl+_duplicata).asstring);
      dtemissao.add   (formatdatetime(_dd_mm_yyyy, s.q.fieldbyname(_dt+_emissao).AsDateTime));
      dtvencimento.add(formatdatetime(_dd_mm_yyyy, s.q.fieldbyname(_dtprorrogacao).AsDateTime));
      lst.clear;

      for i := 0 to vlduplicata.count - 1 do
      begin
        if (dtinicial > strtodate(dtemissao[i])) and (dtinicial > strtodate(dtvencimento[i])) then
        begin
          maioracumulo := maioracumulo - strtofloat(vlduplicata[i]);
          lst.add(inttostr(i));
        end;
      end;

      if lst.Count > 0 then
      begin
        for i := lst.count - 1 downto 0 do
        begin
          vlduplicata.Delete (strtoint(lst[i]));
          dtemissao.delete   (strtoint(lst[i]));
          dtvencimento.Delete(strtoint(lst[i]));
        end;
      end;

      if maioracumulo > vvalor then
      begin
        vvalor:= maioracumulo;
      end;
      s.q.Next;
    end;
    if maioracumulo > 0 then
    begin
      result := vvalor
    end;
  finally
    freeandnil(s);
    freeandnil(vlduplicata);
    freeandnil(dtemissao);
    freeandnil(dtvencimento);
    freeandnil(lst);
  end;
end;

function TCliente.dtMaiorAcumulo: tdate;
var
  s : TClasseQuery;
  lst, vlduplicata, dtemissao, dtvencimento : TStrings;
  vlmaioracumulo, maioracumulo : Currency;
  data , dtinicial, dtfinal : TDate;
  i : integer;
begin
  result := 0;
  if RetornaSQLInteger('select count(*) from duplicata where cdempresa='+empresa.cdempresa.ToString+' and cdcliente='+cdcliente.ToString) = 0 then
  begin
    exit;
  end;
  s            := TClasseQuery.create('select dtemissao,dtprorrogacao,vlduplicata from duplicata where cdempresa='+empresa.cdempresa.ToString+' and cdcliente='+cdcliente.ToString+' order by dtemissao');
  vlduplicata  := TStringList.create;
  dtemissao    := TStringList.create;
  dtvencimento := TStringList.create;
  lst          := TStringList.Create;
  try
    vlduplicata.Add (s.q.fieldbyname(_vlduplicata).asstring);
    dtemissao.Add   (formatdatetime(_dd_mm_yyyy, s.q.fieldbyname(_dt+_emissao).AsDateTime));
    dtvencimento.add(formatdatetime(_dd_mm_yyyy, s.q.fieldbyname(_dtprorrogacao).AsDateTime));

    maioracumulo   := s.q.fieldbyname(_vl+_duplicata).ascurrency;
    dtinicial      := s.q.fieldbyname(_dt+_emissao).AsDateTime;
    dtfinal        := s.q.fieldbyname(_dtprorrogacao).AsDateTime;

    vlmaioracumulo := maioracumulo;
    data := dtinicial;

    s.q.next;
    while not s.q.Eof do
    begin
      if s.q.fieldbyname(_dt+_emissao).AsDateTime >= dtinicial then
      begin
        dtinicial := s.q.fieldbyname(_dt+_emissao).AsDateTime;
        if dtfinal <= s.q.fieldbyname(_dtprorrogacao).AsDateTime then
        begin
          dtfinal := s.q.fieldbyname(_dtprorrogacao).AsDateTime;
        end;
        maioracumulo := maioracumulo + s.q.fieldbyname(_vl+_duplicata).ascurrency;
      end;

      vlduplicata.add (s.q.fieldbyname(_vl+_duplicata).asstring);
      dtemissao.add   (formatdatetime(_dd_mm_yyyy, s.q.fieldbyname(_dt+_emissao).AsDateTime));
      dtvencimento.add(formatdatetime(_dd_mm_yyyy, s.q.fieldbyname(_dtprorrogacao).AsDateTime));
      lst.clear;

      for i := 0 to vlduplicata.count - 1 do
      begin
        if (dtinicial > strtodate(dtemissao[i])) and (dtinicial > strtodate(dtvencimento[i])) then
        begin
          maioracumulo := maioracumulo - strtofloat(vlduplicata[i]);
          lst.add(inttostr(i));
        end;
      end;

      if lst.Count > 0 then
      begin
        for i := lst.count - 1 downto 0 do
        begin
          vlduplicata.Delete (strtoint(lst[i]));
          dtemissao.delete   (strtoint(lst[i]));
          dtvencimento.Delete(strtoint(lst[i]));
        end;
      end;

      if maioracumulo > vlmaioracumulo then
      begin
        vlmaioracumulo := maioracumulo;
        data := dtinicial;
      end;
      s.q.Next;
    end;
    if maioracumulo > 0 then
    begin
      result := data;
    end;
  finally
    freeandnil(s);
    freeandnil(vlduplicata);
    freeandnil(dtemissao);
    freeandnil(dtvencimento);
    freeandnil(lst);
  end;
end;

function TCliente.ValidarNuinscestParaDocumentoEletronico: boolean;
begin
  result := true;
  if (cdindiedest = 2) or ((cdindiedest = 3) and (nuinscest = '')) then
  begin
    exit;
  end;
  if (not ((tppessoa = _F) and (nuinscest = ''))) and (ValidarIE(nuinscest, qregistro.stringdocodigo(_uf, cduf, _sguf)) <> '') then
  begin
    result := false;
    MessageDlg('Número da Inscrição Estadual inválida do '+cdcliente.ToString+' - '+rzsocial+'.', mtInformation, [mbOK], 0);
    Abort;
  end;
end;

function TCliente.VlAtrasado: currency;
var
  sql : string;
begin
  result := 0;
  if cdcliente = 0 then
  begin
    exit;
  end;
  sql := 'select sum(vlsaldo) from duplicata where cdempresa='+empresa.cdempresa.ToString+' and cdstduplicata=1 and cdcliente='+cdcliente.ToString+' and dtprorrogacao<';
  if DiadaSemana(_segunda, DtBanco) then
  begin
    result := RetornaSQLCurrency(sql+getdtbanco(DtBanco-2))
  end
  else
  begin
    result := RetornaSQLCurrency(sql+quotedstr(DtBancos));
  end;
end;

function TCliente.VlCreditoUtilizado: currency;
begin
  result := 0;
  if cdcliente = 0 then
  begin
    exit;
  end;
  result := RetornaSQLCurrency('select sum(vlsaldo) from duplicata where cdempresa='+empresa.cdempresa.ToString+' and cdcliente='+cdcliente.ToString+' and cdstduplicata=1');
end;

function TCliente.NuDiasAtrasoMedio: integer;
var
  s : TClasseQuery;
  dif, nudiassoma : extended;
  r : integer;
begin
  result := 0;
  nudiassoma := 0;
  s := TClasseQuery.create('select max(baixa.dtbaixa) dtbaixa'+
                                 ',duplicata.dtprorrogacao'+
                                 ',duplicata.nuduplicata '+
                           'from duplicata '+
                           'left join baixa on baixa.cdduplicata=duplicata.cdduplicata and baixa.cdempresa=duplicata.cdempresa '+
                           'where duplicata.cdstduplicata=2 and duplicata.dtbaixa>duplicata.dtprorrogacao and baixa.vlbaixa<>baixa.vldevolucao '+
                           'and duplicata.cdcliente='+cdcliente.ToString+' and duplicata.cdempresa='+empresa.cdempresa.ToString+' '+
                           'group by duplicata.nuduplicata'+
                                   ',duplicata.dtprorrogacao');
  try
    r := 0;
    while not s.q.Eof do
    begin
      inc(r);
      dif := (s.q.fieldbyname(_dtbaixa).AsDateTime - s.q.fieldbyname(_dtprorrogacao).AsDateTime);
      nudiassoma := nudiassoma + dif;
      s.q.next;
    end;
    if r > 0 then
    begin
      result := strtoint(FormatFloat(__integerpuro, nudiassoma / r));
    end;
  finally
    freeandnil(s);
  end;
end;

function TCliente.NuDiasAtrasoMedio12: integer;
var
  q : TClasseQuery;
  dif, nudiassoma : extended;
  r : integer;
begin
  result := 0;
  nudiassoma := 0;
  q := TClasseQuery.create('select max(b.dtbaixa) dtbaixa'+
                                 ',d.dtprorrogacao'+
                                 ',d.nuduplicata '+
                           'from duplicata d '+
                           'left join baixa b on b.cdduplicata=d.cdduplicata and d.cdempresa=b.cdempresa '+
                           'where d.cdempresa='+empresa.cdempresa.ToString+' and d.cdstduplicata=2 and d.dtbaixa>d.dtprorrogacao and b.vlbaixa<>b.vldevolucao and d.cdcliente='+cdcliente.ToString+' '+
                           'and d.dtemissao>='+getdtbanco(dtbanco-365)+' '+
                           'group by d.nuduplicata,d.dtprorrogacao');
  try
    r := 0;
    while not q.q.Eof do
    begin
      inc(r);
      dif := (q.q.fieldbyname(_dtbaixa).AsDateTime - q.q.fieldbyname(_dtprorrogacao).AsDateTime);
      nudiassoma := nudiassoma + dif;
      q.q.next;
    end;
    if r > 0 then
    begin
      result := strtoint(FormatFloat(__integerpuro, nudiassoma / r));
    end;
  finally
    freeandnil(q);
  end;
end;

function TCliente.NuDiasMaiorAtrasoMedio: integer;
var
  q : TClasseQuery;
  nudias : extended;
begin
  result := 0;
  nudias := 0;
  q      := TClasseQuery.create;
  try
    q.q.Open('select max(baixa.dtbaixa) dtbaixa'+
                   ',duplicata.dtprorrogacao'+
                   ',duplicata.nuduplicata '+
             'from duplicata '+
             'left join baixa on baixa.cdduplicata=duplicata.cdduplicata and baixa.cdempresa=duplicata.cdempresa '+
             'where duplicata.cdstduplicata=2 and duplicata.dtbaixa>duplicata.dtprorrogacao and baixa.vlbaixa<>baixa.vldevolucao '+
             'and duplicata.cdcliente='+cdcliente.ToString+' and duplicata.cdempresa='+empresa.cdempresa.ToString+' '+
             'group by duplicata.nuduplicata'+
                     ',duplicata.dtprorrogacao');
    while not q.q.Eof do
    begin
      if nudias < q.q.fieldbyname(_dtbaixa).AsDateTime - q.q.fieldbyname(_dtprorrogacao).AsDateTime then
      begin
        nudias := q.q.fieldbyname(_dtbaixa).AsDateTime - q.q.fieldbyname(_dtprorrogacao).AsDateTime;
        result := strtoint(formatfloat(__integerpuro, nudias));
      end;
      q.q.next;
    end;
  finally
    q.free;
  end;
end;

function TCliente.NuDiasMaiorAtrasoMedio12: integer;
var
  q : TClasseQuery;
  nudias : extended;
begin
  result := 0;
  nudias := 0;
  q := TClasseQuery.create('select max(b.dtbaixa) dtbaixa'+
                                 ',d.dtprorrogacao'+
                                 ',d.nuduplicata '+
                           'from duplicata d '+
                           'left join baixa b on b.cdduplicata=d.cdduplicata and d.cdempresa=b.cdempresa '+
                           'where d.cdempresa='+empresa.cdempresa.ToString+' and d.cdstduplicata=2 and d.dtbaixa>d.dtprorrogacao and b.vlbaixa<>b.vldevolucao and d.cdcliente='+cdcliente.ToString+' '+
                           'and d.dtemissao>='+getdtbanco(dtbanco-365)+' '+
                           'group by d.nuduplicata,d.dtprorrogacao');
  try
    while not q.q.Eof do
    begin
      if nudias < q.q.fieldbyname(_dtbaixa).AsDateTime - q.q.fieldbyname(_dtprorrogacao).AsDateTime then
      begin
        nudias := q.q.fieldbyname(_dtbaixa).AsDateTime - q.q.fieldbyname(_dtprorrogacao).AsDateTime;
        result := strtoint(formatfloat(__integerpuro, nudias));
      end;
      q.q.next;
    end;
  finally
    freeandnil(q);
  end;
end;

function TCliente.DtMaiorAtrasoMedio: TDate;
var
  s : TClasseQuery;
  nudias : extended;
begin
  result := 0;
  nudias := 0;
  s      := TClasseQuery.create('select max(baixa.dtbaixa) dtbaixa'+
                                      ',duplicata.dtprorrogacao'+
                                      ',duplicata.nuduplicata '+
                                'from duplicata '+
                                'left join baixa on baixa.cdduplicata=duplicata.cdduplicata and baixa.cdempresa=duplicata.cdempresa '+
                                'where duplicata.cdstduplicata=2 and duplicata.dtbaixa>duplicata.dtprorrogacao and baixa.vlbaixa<>baixa.vldevolucao and duplicata.cdcliente='+cdcliente.ToString+' '+
                                'and duplicata.cdempresa='+empresa.cdempresa.ToString+' '+
                                'group by duplicata.nuduplicata'+
                                        ',duplicata.dtprorrogacao');
  try
    while not s.q.Eof do
    begin
      if nudias < s.q.fieldbyname(_dtbaixa).AsDateTime - s.q.fieldbyname(_dtprorrogacao).AsDateTime then
      begin
        nudias := s.q.fieldbyname(_dtbaixa).AsDateTime - s.q.fieldbyname(_dtprorrogacao).AsDateTime;
        result := s.q.fieldbyname(_dtprorrogacao).AsDateTime;
      end;
      s.q.next;
    end;
  finally
    freeandnil(s);
  end;
end;

function TCliente.DtMaiorAtrasoMedio12: TDate;
var
  q : TClasseQuery;
  nudias : extended;
begin
  result := 0;
  nudias := 0;
  q := TClasseQuery.create('select max(b.dtbaixa) dtbaixa'+
                                 ',d.dtprorrogacao'+
                                 ',d.nuduplicata '+
                           'from duplicata d '+
                           'left join baixa b on b.cdduplicata=d.cdduplicata and d.cdempresa=b.cdempresa '+
                           'where d.cdempresa='+empresa.cdempresa.ToString+' and d.cdstduplicata=2 and d.dtbaixa>d.dtprorrogacao and b.vlbaixa<>b.vldevolucao and d.cdcliente='+cdcliente.ToString+' '+
                           'and d.dtemissao>='+getdtbanco(dtbanco-365)+' '+
                           'group by d.nuduplicata,d.dtprorrogacao');
  try
    while not q.q.Eof do
    begin
      if nudias < q.q.fieldbyname(_dtbaixa).AsDateTime - q.q.fieldbyname(_dtprorrogacao).AsDateTime then
      begin
        nudias := q.q.fieldbyname(_dtbaixa).AsDateTime - q.q.fieldbyname(_dtprorrogacao).AsDateTime;
        result := q.q.fieldbyname(_dtprorrogacao).AsDateTime;
      end;
      q.q.next;
    end;
  finally
    freeandnil(q);
  end;
end;

function TCliente.NuTituloAtrasado: integer;
var
  sql : string;
begin
  sql := 'select count(vlsaldo) vlsaldo '+
         'from duplicata '+
         'where cdempresa='+empresa.cdempresa.ToString+' and cdstduplicata=1 and cdcliente='+cdcliente.ToString+' and dtprorrogacao<';
  if DiadaSemana(_segunda, DtBanco) then
  begin
    result := RetornaSQLInteger(sql+getdtbanco(DtBanco-3))
  end
  else
  begin
    result := RetornaSQLInteger(sql+getdtbanco(DtBanco));
  end;
end;

function TCliente.ObterListaEmailNFE: string;
begin
  itclienteemail.Ler(cdcliente, _cliente);
  result := itclienteemail.ListaEmailNFE;
  if result = '' then
  begin
    result := email;
  end;
end;

function TCliente.nudiasmaioratraso: integer;
var
  q : TClasseQuery;
begin
  result := 0;
  q := TClasseQuery.create('select count(vlsaldo) vlsaldo '+
                                 ',min(dtprorrogacao) dtprorrogacao '+
                           'from duplicata '+
                           'where cdempresa='+empresa.cdempresa.ToString+' and cdstduplicata=1 and cdcliente='+cdcliente.ToString+' and dtprorrogacao<'+getdtbanco(DtBanco));
  try
    if q.q.fieldbyname(_vlsaldo).asinteger > 0 then
    begin
      result := strtoint(formatfloat(__integerpuro, dtbanco - q.q.fieldbyname(_dtprorrogacao).AsDateTime));
    end;
  finally
    freeandnil(q);
  end;
end;

function TCliente.dtmaioratraso: TDate;
var
  q : TClasseQuery;
begin
  result := 0;
  q := TClasseQuery.create('select count(vlsaldo) vlsaldo'+
                                  ',min(dtprorrogacao) dtprorrogacao '+
                             'from duplicata '+
                             'where cdempresa='+empresa.cdempresa.ToString+' and cdstduplicata=1 and cdcliente='+cdcliente.ToString+' and dtprorrogacao<'+getdtbanco(DtBanco));
  try
    if q.q.fieldbyname(_vlsaldo).asinteger > 0 then
    begin
      result := q.q.fieldbyname(_dtprorrogacao).AsDateTime;
    end;
  finally
    freeandnil(q);
  end;
end;

function TCliente.hint_rzsocial: string;
begin
  if tppessoa = _J then
  begin
    result := 'CNPJ: '+nucnpj+' Inscrição Estadual: '+nuinscest
  end
  else
  begin
    result := 'CPF: '+nucpf;
  end;
  result := result + #13'Endereço: '+dsendereco;
  if dsnumero <> '' then
  begin
    result := result+', '+dsnumero;
  end;
  if dscomplemento <> '' then
  begin
    result := result+', '+dscomplemento;
  end;
  result := result + ' Fone: '+nufone1+
                 #13'Bairro: '+nmbairro+
                   ' Cidade: '+qregistro.nomedocodigo(_municipio, cdmunicipio)+
                       ' UF: '+qregistro.stringdocodigo(_uf, cduf, _sguf)+
                      ' CEP: '+nucep;
  if cdtpregime <> 0 then
  begin
    result := result + #13'Tipo Regime:'+qregistro.nomedocodigo(_tpregime, cdtpregime);
  end;
  if cdtpcliente <> 0 then
  begin
    result := result + #13'Tipo cliente: '+qregistro.nomedocodigo(_tpcliente, cdtpcliente);
  end;
end;

function TCliente.get_tpregime:string;
begin
  result := tppessoa;
  if tppessoa = _J then
  begin
    if (cdtpregime = 1) or (cdtpregime = 2) then
    begin
      result := _S
    end
    else if (cdtpregime = 3) or (cdtpregime = 4) then
    begin
      result := _D;
    end;
  end;
end;

function TClienteList.ExisteNaLista(codigo: LargeInt): boolean;
var
  i : integer;
begin
  result := false;
  for I := 0 to count -1  do
  begin
    if items[i].cdcliente = codigo then
    begin
      result := true;
      break;
    end;
  end;
end;

function TClienteList.GetItem(Index: Integer): TCliente;
begin
  Result := TCliente(Inherited Items[Index]);
end;

function TClienteList.Indice(codigo: LargeInt): integer;
var
  I: Integer;
begin
  result := -1;
  for I := 0 to count - 1 do
  begin
    if items[i].cdcliente = codigo then
    begin
      result := i;
      break;
    end;
  end;
end;

function TClienteList.Ler(DataSet: TDataset): boolean;
begin
  clear;
  result := false;
  dataset.first;
  while not dataset.Eof do
  begin
    new.Select(dataset);
    dataset.Next;
    result := true;
  end;
end;

function TClienteList.Ler(sqlwhere: string): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_where(_cliente, sqlwhere));
  try
    result := Ler(q.q);
  finally
    FreeAndNil(q);
  end;
end;

function TClienteList.Ler(codigo: Integer; cdfield:string): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_Cliente, codigo, cdfield));
  try
    clear;
    result := q.q.RecordCount > 0;
    if not result then
    begin
      Exit;
    end;
    while not q.q.Eof do
    begin
      New.Select(q.q);
      q.q.Next;
    end;
  finally
    FreeAndNil(q);
  end;
end;

function TClienteList.New: TCliente;
begin
  Result := TCliente.Create;
  Add(Result);
end;

procedure TClienteList.SetItem(Index: Integer; const Value: TCliente);
begin
  Put(Index, Value);
end;

end.
