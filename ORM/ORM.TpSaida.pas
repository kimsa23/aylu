unit ORM.TpSaida;

interface

uses rotina.strings, System.SysUtils, orm.empresa, Classe.DAO, orm.Serie, Contnrs, System.Classes,
  Data.DB, classe.query, rotina.retornasql, uConstantes, orm.AdicaoImportacao;

type
  TTpSaida = class(TRegistroQuipos)
  private
    fnuserie: string;
    fnucaixa: integer;
    fbonaoconsistesticmscfop: String;
    Fborepresentanteobrigatorio: String;
    Fboicms: String;
    Fbopis: String;
    Fboredespacho: String;
    Fbotpcomissao: String;
    Fboexportacao: String;
    Fbogerarrpa: String;
    Fboexibirpeso: String;
    Fboobservacaotpsaida: String;
    Fboratearpeso: String;
    Fboipi: String;
    Fboimportacao: String;
    Fbovlduplicatadiferentevltotal: String;
    Fbopedidocompra: String;
    Fbocontrolepreco: String;
    Fboestoque: String;
    Fboirrf: String;
    Fboicmssubst: String;
    Fboicmsred: String;
    Fbofrete: String;
    Fbocofins: String;
    Fbolucro: String;
    Fboinfadicional: String;
    Fboexportarxtdc: String;
    Fbocalcularfretesub: String;
    Fbopedido: String;
    Fboduplicata: String;
    Fbodescontocomissao: String;
    Fboarredondar: String;
    Fbocomissao: String;
    Fbocontribsocial: String;
    Fbofreteisentoicmssubst: String;
    Fbodshistoriconf: String;
    Fboiss: String;
    Fboinss: String;
    Fbolocacao: String;
    Fboduplicataicmsst: String;
    Falcontribsocial: double;
    Faliss: double;
    Falpis: double;
    Falinss: double;
    Falirrf: double;
    Falcofins: double;
    Fcdcfopfufsubtrib: integer;
    Fcdcfopdufsubtrib: integer;
    Fcdserie: integer;
    Fcdtpsaida: integer;
    Fcdmodelo: integer;
    Fcdcfopduf: integer;
    Fcdcfopfuf: integer;
    Fdsmarca: string;
    Femailcopia: string;
    Fnmtpsaida: string;
    Fnucasadecimalquantidade: integer;
    Fdsespecie: string;
    Ftpforncliente: string;
    Fdstituloemail: string;
    Ftpentsai: string;
    Fdsobservacao: string;
    Fnmreduzido: string;
    Fdsassuntoemail: string;
    Fnucasadecimalvlunitario: integer;
    Fserie: TSerie;
    fboitemdesconto: string;
    fboicmsoutdespesareembolso: string;
    Fcdcfopfufsubtriboutro: integer;
    Fcdcfopdufsubtriboutro: integer;
    Fcdcfopfufoutro: integer;
    Fcdcfopdufoutro: integer;
    fcdtpitemoutro: string;
    fcdtpitem: string;
    fbonalicmsred: string;
    fboexibirvlbaseicms: string;
    fboexibirbaseicmsajuste: string;
    fbovlunitarioobrigatorio: string;
    fvlunitariominimo: Currency;
  public
    [keyfield]
    property cdtpsaida : integer read Fcdtpsaida write Fcdtpsaida;
    [fk]
    property cdserie : integer read Fcdserie write Fcdserie;
    [fk]
    property cdmodelo : integer read Fcdmodelo write Fcdmodelo;
    [fk]
    property cdcfopduf : integer read Fcdcfopduf write Fcdcfopduf;
    [fk]
    property cdcfopfuf : integer read Fcdcfopfuf write Fcdcfopfuf;
    [fk]
    property cdcfopfufsubtrib : integer read Fcdcfopfufsubtrib write Fcdcfopfufsubtrib;
    [fk]
    property cdcfopdufsubtrib : integer read Fcdcfopdufsubtrib write Fcdcfopdufsubtrib;
    [fk]
    property cdcfopdufoutro : integer read Fcdcfopdufoutro write Fcdcfopdufoutro;
    [fk]
    property cdcfopfufoutro : integer read Fcdcfopfufoutro write Fcdcfopfufoutro;
    [fk]
    property cdcfopfufsubtriboutro : integer read Fcdcfopfufsubtriboutro write Fcdcfopfufsubtriboutro;
    [fk]
    property cdcfopdufsubtriboutro : integer read Fcdcfopdufsubtriboutro write Fcdcfopdufsubtriboutro;
    [fk]
    property cdtpitem : string read fcdtpitem write fcdtpitem;
    [fk]
    property cdtpitemoutro : string read fcdtpitemoutro write fcdtpitemoutro;
    property nmreduzido : string read Fnmreduzido write Fnmreduzido;
    property nmtpsaida : string read Fnmtpsaida write Fnmtpsaida;
    property tpentsai : string read Ftpentsai write Ftpentsai;
    property tpforncliente : string read Ftpforncliente write Ftpforncliente;
    property boestoque : String read Fboestoque write Fboestoque;
    property boduplicata : String read Fboduplicata write Fboduplicata;
    property bocomissao : String read Fbocomissao write Fbocomissao;
    property boiss : String read Fboiss write Fboiss;
    property boicms : String read Fboicms write Fboicms;
    property boicmssubst : String read Fboicmssubst write Fboicmssubst;
    property boicmsred : String read Fboicmsred write Fboicmsred;
    property boipi : String read Fboipi write Fboipi;
    property bocofins : String read Fbocofins write Fbocofins;
    property bopis : String read Fbopis write Fbopis;
    property bofrete : String read Fbofrete write Fbofrete;
    property bopedido : String read Fbopedido write Fbopedido;
    property boexportarxtdc : String read Fboexportarxtdc write Fboexportarxtdc;
    property bovlduplicatadiferentevltotal : String read Fbovlduplicatadiferentevltotal write Fbovlduplicatadiferentevltotal;
    property bogerarrpa : String read Fbogerarrpa write Fbogerarrpa;
    property boobservacaotpsaida : String read Fboobservacaotpsaida write Fboobservacaotpsaida;
    property dsobservacao : string read Fdsobservacao write Fdsobservacao;
    property bodshistoriconf : String read Fbodshistoriconf write Fbodshistoriconf;
    property bolucro : String read Fbolucro write Fbolucro;
    property aliss : double read Faliss write Faliss;
    property bofreteisentoicmssubst : String read Fbofreteisentoicmssubst write Fbofreteisentoicmssubst;
    property bocalcularfretesub : String read Fbocalcularfretesub write Fbocalcularfretesub;
    property dsmarca : string read Fdsmarca write Fdsmarca;
    property dsespecie : string read Fdsespecie write Fdsespecie;
    property bocontribsocial : String read Fbocontribsocial write Fbocontribsocial;
    property boinss : String read Fboinss write Fboinss;
    property alcofins : double read Falcofins write Falcofins;
    property alpis : double read Falpis write Falpis;
    property alcontribsocial : double read Falcontribsocial write Falcontribsocial;
    property alinss : double read Falinss write Falinss;
    property boirrf : String read Fboirrf write Fboirrf;
    property alirrf : double read Falirrf write Falirrf;
    property boimportacao : String read Fboimportacao write Fboimportacao;
    property boexibirpeso : String read Fboexibirpeso write Fboexibirpeso;
    property bocontrolepreco : String read Fbocontrolepreco write Fbocontrolepreco;
    property bopedidocompra : String read Fbopedidocompra write Fbopedidocompra;
    property boredespacho : String read Fboredespacho write Fboredespacho;
    property botpcomissao : String read Fbotpcomissao write Fbotpcomissao;
    property boduplicataicmsst : String read Fboduplicataicmsst write Fboduplicataicmsst;
    property boratearpeso : String read Fboratearpeso write Fboratearpeso;
    property bodescontocomissao : String read Fbodescontocomissao write Fbodescontocomissao;
    property bolocacao : String read Fbolocacao write Fbolocacao;
    property nucasadecimalquantidade : integer read Fnucasadecimalquantidade write Fnucasadecimalquantidade;
    property nucasadecimalvlunitario : integer read Fnucasadecimalvlunitario write Fnucasadecimalvlunitario;
    property borepresentanteobrigatorio : String read Fborepresentanteobrigatorio write Fborepresentanteobrigatorio;
    property dstituloemail : string read Fdstituloemail write Fdstituloemail;
    property dsassuntoemail : string read Fdsassuntoemail write Fdsassuntoemail;
    property emailcopia : string read Femailcopia write Femailcopia;
    property boinfadicional : String read Fboinfadicional write Fboinfadicional;
    property boarredondar : String read Fboarredondar write Fboarredondar;
    property boexportacao : String read Fboexportacao write Fboexportacao;
    property nuserie : string read fnuserie write fnuserie;
    property nucaixa : integer read fnucaixa write fnucaixa;
    property serie : TSerie read Fserie write Fserie;
    property bonaoconsistesticmscfop : String read fbonaoconsistesticmscfop write fbonaoconsistesticmscfop;
    property boitemdesconto : string read fboitemdesconto write fboitemdesconto;
    property boicmsoutdespesareembolso : string read fboicmsoutdespesareembolso write fboicmsoutdespesareembolso;
    property bonalicmsred : string read fbonalicmsred write fbonalicmsred;
    property boexibirvlbaseicms : string read fboexibirvlbaseicms write fboexibirvlbaseicms;
    property boexibirbaseicmsajuste : string read fboexibirbaseicmsajuste write fboexibirbaseicmsajuste;
    property bovlunitarioobrigatorio: string read fbovlunitarioobrigatorio write fbovlunitarioobrigatorio;
    property vlunitariominimo: Currency read fvlunitariominimo write fvlunitariominimo;
    constructor create;
    destructor destroy; override;
    function ObterTpFornCliente:string;
    class function UmTipoDocumento:string;
    function ObterCfop(cduf: integer):integer;
  end;
  TTPSaidaList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TTpSaida;
    procedure SetItem(Index: Integer; const Value: TTpSaida);
  public
    property Items[Index: Integer]: TTpSaida read GetItem write SetItem;
    function Ler(codigo:Integer; nmcodigo: string):Boolean;overload;
    function Ler(Dataset: TDataset):Boolean;overload;
    function Ler(sqlwhere:string):boolean;overload;
    function New: TTpSaida;
  end;

implementation

constructor TTpSaida.create;
begin
  inherited;
  fserie := tserie.Create;
end;

destructor TTpSaida.destroy;
begin
  freeandnil(fserie);
  inherited;
end;

function TTpSaida.ObterCfop(cduf: integer):integer;
begin
  if cduf = empresa.endereco.cduf then
  begin
    result := cdcfopduf
  end
  else
  begin
    result := cdcfopfuf;
  end;
end;

function TTpSaida.ObterTpFornCliente: string;
begin
  result := qstring.Maiuscula(_cliente);
  if tpforncliente = _f then
  begin
    result := qstring.Maiuscula(_fornecedor);
  end;
end;

class function TTpSaida.UmTipoDocumento: string;
begin
  if RetornaSQLInteger('select count(*) from tpsaida where cdempresa='+empresa.cdempresa.ToString) = 1 then
  begin
    result := RetornaSQLString('select cdtpsaida from tpsaida where cdempresa='+empresa.cdempresa.ToString);
  end;
end;

function TTPSaidaList.GetItem(Index: Integer): TTpSaida;
begin
  Result := TTpSaida(Inherited Items[Index]);
end;

function TTPSaidaList.Ler(codigo: Integer; nmcodigo: string): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_tpsaida, codigo, nmcodigo));
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

function TTPSaidaList.Ler(sqlwhere: string): boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_where(_tpsaida, sqlwhere));
  try
    result := Ler(q.q);
  finally
    freeandnil(q);
  end;
end;

function TTPSaidaList.Ler(Dataset: TDataset): Boolean;
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

function TTPSaidaList.New: TTpSaida;
begin
  Result := TTpsaida.Create;
  Add(Result);
end;

procedure TTPSaidaList.SetItem(Index: Integer; const Value: TTpSaida);
begin
  Put(Index, Value);
end;

end.
