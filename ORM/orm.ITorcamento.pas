unit orm.ITorcamento;

interface

uses Data.DB, System.SysUtils, contnrs, System.Math, System.Classes,
  uConstantes,
  Rotina.Retornasql,
  orm.itorcamentorecurso, orm.itorcamentomaterial, orm.itorcamentocusto, orm.produto,
  classe.query, Classe.DAO;

type
  TITorcamento = class(TRegistroQuipos)
  private
    Fbocertificado: String;
    Fboinftecnica: String;
    Fvldespesacomercialp: Currency;
    Fvldespesaadministrativa: Currency;
    Fvldespesacomercial: Currency;
    Fvlsimples: Currency;
    Fvlvendaliquida: Currency;
    Fvltotalcipi: Currency;
    Fvlicmssubtrib: Currency;
    Fvllucro: Currency;
    Fvllucroircsp: Currency;
    Fvlipi: Currency;
    Fvldescontoproducao: Currency;
    Fvldespesafretep: Currency;
    Fvlpreparacao: Currency;
    Fvlsimplesp: Currency;
    Fvloperacao: Currency;
    Fvlcustop: Currency;
    Fvlirpj: Currency;
    Fvlircsllp: Currency;
    Fvlpreparacaop: Currency;
    Fvlcsllp: Currency;
    Fvlircsll: Currency;
    Fvllucrobruto: Currency;
    Fvldespesa: Currency;
    Fvlmaterialp: Currency;
    Fvllucrobrutop: Currency;
    Fvldesconto: Currency;
    Fvlfrete: Currency;
    Fvloperacaop: Currency;
    Fvlpisp: Currency;
    Fvliss: Currency;
    Fvlacrescimo: Currency;
    Fvltotal: Currency;
    Fvlmaterial: Currency;
    Fvlcofinsp: Currency;
    Fvldespesaembalagem: Currency;
    Fvldespesap: Currency;
    Fvlproducao: Currency;
    Fvlirpjp: Currency;
    Fvlcofins: Currency;
    Fvlissp: Currency;
    Fvlicms: Currency;
    Fvldespesaembalagemp: Currency;
    Fvlipip: Currency;
    Fvldespesaadministrativap: Currency;
    Fvlpis: Currency;
    Fvlcusto: Currency;
    Fvllucrop: Currency;
    Fvlcsll: Currency;
    Fvlvendaliquidap: Currency;
    Fvldespesasegurop: Currency;
    Fvllucroircs: Currency;
    Fvltotalsdesconto: Currency;
    Fvlunitario: Currency;
    Fvldespesafrete: Currency;
    Fvlimposto: currency;
    Fvldespesaseguro: Currency;
    Fvlicmsp: Currency;
    Fvlrecurso: Currency;
    Fvlimpostop: Currency;
    Fvlproducaop: Currency;
    Fvlrecursop: Currency;
    Falicms: Double;
    Fqtaprovado: Double;
    Fqtpreparacaop: double;
    Fqtcomprimento1: Double;
    Fprdespesafrete: Double;
    Fprdesconto: Double;
    Fqtitem: Double;
    Falmva: Double;
    Falsimples: Double;
    Fprdespesacomercial: Double;
    Fprdespesaadministrativa: Double;
    Falcofins: Double;
    Fprdespesaseguro: Double;
    Fqtoperacaop: Double;
    Fqtoperacao: Double;
    Fqthorap: Double;
    Fprlucro: Double;
    Falicmssubtrib: Double;
    Falipi: Double;
    Falcsll: Double;
    Falpis: Double;
    Fqtlargura1: Double;
    Faliss: Double;
    Fprdespesaembalagem: Double;
    Falirpj: Double;
    Fqtaltura1: Double;
    Fqtpreparacao: Double;
    Fqthora: Double;
    Fqtpeca: Double;
    Fnudiasentrega: Integer;
    Fcdtpitorcamento: Integer;
    Fcdperiodicidade: integer;
    Fcdtpipi: Integer;
    Fcdtpicms: Integer;
    Fcdproduto: integer;
    Fcdorcamento: Integer;
    Fcdstitorcamento: Integer;
    Fcdcondpagto: Integer;
    Fnusequencia: Integer;
    Fcdprodutoembalagem: Integer;
    Fnuprazoentrega: Integer;
    Fcdtpgradevalor: Integer;
    Fcditorcamento: Integer;
    Fcddigitadoembalagem: string;
    Fdsdesenhorevisao: string;
    Fnucotacao: string;
    Fnuitem: string;
    Fdsdesenhoposicao: string;
    Fnurevisaodesenho: string;
    Fdsobservacao: string;
    Fdsposicaodesenho: string;
    Fdsdesenho: string;
    Fdsproduto: string;
    Fcddigitado: string;
    Fdsformula: string;
    Fdtprventrega: TDate;
    Fdtaprovacao: TDate;
    Fitorcamentorecurso: TitorcamentorecursoList;
    Fitorcamentomaterial: TitorcamentomaterialList;
    Fitorcamentocusto: TitorcamentocustoList;
    FProduto: TProduto;
    Fnuperiodicidade: integer;
  public
    property itorcamentomaterial : TitorcamentomaterialList read Fitorcamentomaterial write Fitorcamentomaterial;
    property itorcamentocusto : TitorcamentocustoList read Fitorcamentocusto write Fitorcamentocusto;
    property itorcamentorecurso : TitorcamentorecursoList read Fitorcamentorecurso write Fitorcamentorecurso;
    property produto : TProduto read FProduto write FProduto;
    [keyfield]
    property cditorcamento : Integer read Fcditorcamento write fcditorcamento;
    [FK]
    property cdorcamento : Integer read Fcdorcamento write fcdorcamento;
    [FK]
    property cdproduto : integer read Fcdproduto write fcdproduto;
    [FK]
    property cdtpicms : Integer read Fcdtpicms write fcdtpicms;
    [FK]
    property cdtpipi : Integer read Fcdtpipi write fcdtpipi;
    [FK]
    property cdtpgradevalor : Integer read Fcdtpgradevalor write fcdtpgradevalor;
    [FK]
    property cdprodutoembalagem : Integer read Fcdprodutoembalagem write fcdprodutoembalagem;
    [FK]
    property cdtpitorcamento : Integer read Fcdtpitorcamento write fcdtpitorcamento;
    [FK]
    property cdperiodicidade : integer read Fcdperiodicidade write fcdperiodicidade;
    [FK]
    property cdcondpagto : Integer read Fcdcondpagto write fcdcondpagto;
    property qtitem : Double read Fqtitem write fqtitem;
    property qtaprovado : Double read Fqtaprovado write fqtaprovado;
    property vlunitario : Currency read Fvlunitario write fvlunitario;
    property vltotal : Currency read Fvltotal write fvltotal;
    property prlucro : Double read Fprlucro write fprlucro;
    property alicms : Double read Falicms write falicms;
    property vlicms : Currency read Fvlicms write fvlicms;
    property alipi : Double read Falipi write falipi;
    property vlipi : Currency read Fvlipi write fvlipi;
    property dsdesenho : string read Fdsdesenho write fdsdesenho;
    property dsposicaodesenho : string read Fdsposicaodesenho write fdsposicaodesenho;
    property nurevisaodesenho : string read Fnurevisaodesenho write fnurevisaodesenho;
    property nudiasentrega : Integer read Fnudiasentrega write fnudiasentrega;
    property cddigitado : string read Fcddigitado write fcddigitado;
    property vltotalcipi : Currency read Fvltotalcipi write fvltotalcipi;
    property dtprventrega : TDate read Fdtprventrega write fdtprventrega;
    property qtlargura1 : Double read Fqtlargura1 write fqtlargura1;
    property qtaltura1 : Double read Fqtaltura1 write fqtaltura1;
    property qtcomprimento1 : Double read Fqtcomprimento1 write fqtcomprimento1;
    property dsformula : string read Fdsformula write fdsformula;
    property almva : Double read Falmva write falmva;
    property vlicmssubtrib : Currency read Fvlicmssubtrib write fvlicmssubtrib;
    property vlfrete : Currency read Fvlfrete write fvlfrete;
    property vldesconto : Currency read Fvldesconto write fvldesconto;
    property alicmssubtrib : Double read Falicmssubtrib write falicmssubtrib;
    property nucotacao : string read Fnucotacao write fnucotacao;
    property nuitem : string read Fnuitem write fnuitem;
    property qtpeca : Double read Fqtpeca write fqtpeca;
    property dsobservacao : string read Fdsobservacao write fdsobservacao;
    property dsdesenhoposicao : string read Fdsdesenhoposicao write fdsdesenhoposicao;
    property dsdesenhorevisao : string read Fdsdesenhorevisao write fdsdesenhorevisao;
    property alpis : Double read Falpis write falpis;
    property vlpis : Currency read Fvlpis write fvlpis;
    property alcofins : Double read Falcofins write falcofins;
    property vlcofins : Currency read Fvlcofins write fvlcofins;
    property alcsll : Double read Falcsll write falcsll;
    property vlcsll : Currency read Fvlcsll write fvlcsll;
    property alirpj : Double read Falirpj write falirpj;
    property vlirpj : Currency read Fvlirpj write fvlirpj;
    property vlproducao : Currency read Fvlproducao write fvlproducao;
    property vlmaterial : Currency read Fvlmaterial write fvlmaterial;
    property vlcusto : Currency read Fvlcusto write fvlcusto;
    property vlpreparacao : Currency read Fvlpreparacao write fvlpreparacao;
    property vloperacao : Currency read Fvloperacao write fvloperacao;
    property qtoperacao : Double read Fqtoperacao write fqtoperacao;
    property qtpreparacao : Double read Fqtpreparacao write fqtpreparacao;
    property qthora : Double read Fqthora write fqthora;
    property vlproducaop : Currency read Fvlproducaop write fvlproducaop;
    property vlmaterialp : Currency read Fvlmaterialp write fvlmaterialp;
    property vlcustop : Currency read Fvlcustop write fvlcustop;
    property vlpreparacaop : Currency read Fvlpreparacaop write fvlpreparacaop;
    property vloperacaop : Currency read Fvloperacaop write fvloperacaop;
    property qtpreparacaop : double read Fqtpreparacaop write fqtpreparacaop;
    property qtoperacaop : Double read Fqtoperacaop write fqtoperacaop;
    property qthorap : Double read Fqthorap write fqthorap;
    property vlpisp : Currency read Fvlpisp write fvlpisp;
    property vlcofinsp : Currency read Fvlcofinsp write fvlcofinsp;
    property vlcsllp : Currency read Fvlcsllp write fvlcsllp;
    property vlirpjp : Currency read Fvlirpjp write fvlirpjp;
    property vlicmsp : Currency read Fvlicmsp write fvlicmsp;
    property vlipip : Currency read Fvlipip write fvlipip;
    property nuprazoentrega : Integer read Fnuprazoentrega write fnuprazoentrega;
    property dtaprovacao : TDate read Fdtaprovacao write fdtaprovacao;
    property vllucro : Currency read Fvllucro write fvllucro;
    property vllucrop : Currency read Fvllucrop write fvllucrop;
    property aliss : Double read Faliss write faliss;
    property vlissp : Currency read Fvlissp write fvlissp;
    property vliss : Currency read Fvliss write fvliss;
    property vlimpostop : Currency read Fvlimpostop write fvlimpostop;
    property vlimposto :currency read Fvlimposto write fvlimposto;
    property vlvendaliquidap : Currency read Fvlvendaliquidap write fvlvendaliquidap;
    property vlvendaliquida : Currency read Fvlvendaliquida write fvlvendaliquida;
    property vllucrobrutop : Currency read Fvllucrobrutop write fvllucrobrutop;
    property vllucrobruto : Currency read Fvllucrobruto write fvllucrobruto;
    property vldespesa : Currency read Fvldespesa write fvldespesa;
    property vldespesap : Currency read Fvldespesap write fvldespesap;
    property vldespesaadministrativa : Currency read Fvldespesaadministrativa write fvldespesaadministrativa;
    property vldespesaadministrativap : Currency read Fvldespesaadministrativap write fvldespesaadministrativap;
    property vldespesafretep : Currency read Fvldespesafretep write fvldespesafretep;
    property vldespesafrete : Currency read Fvldespesafrete write fvldespesafrete;
    property vldespesacomercialp : Currency read Fvldespesacomercialp write fvldespesacomercialp;
    property vldespesacomercial : Currency read Fvldespesacomercial write fvldespesacomercial;
    property vldespesaembalagemp : Currency read Fvldespesaembalagemp write fvldespesaembalagemp;
    property vldespesaembalagem : Currency read Fvldespesaembalagem write fvldespesaembalagem;
    property vldespesasegurop : Currency read Fvldespesasegurop write fvldespesasegurop;
    property vldespesaseguro : Currency read Fvldespesaseguro write fvldespesaseguro;
    property vllucroircsp : Currency read Fvllucroircsp write fvllucroircsp;
    property vllucroircs : Currency read Fvllucroircs write fvllucroircs;
    property prdespesaadministrativa : Double read Fprdespesaadministrativa write fprdespesaadministrativa;
    property prdespesafrete : Double read Fprdespesafrete write fprdespesafrete;
    property prdespesacomercial : Double read Fprdespesacomercial write fprdespesacomercial;
    property prdespesaembalagem : Double read Fprdespesaembalagem write fprdespesaembalagem;
    property prdespesaseguro : Double read Fprdespesaseguro write fprdespesaseguro;
    property vlircsllp : Currency read Fvlircsllp write fvlircsllp;
    property vlircsll : Currency read Fvlircsll write fvlircsll;
    property alsimples : Double read Falsimples write falsimples;
    property vlsimplesp : Currency read Fvlsimplesp write fvlsimplesp;
    property vlsimples : Currency read Fvlsimples write fvlsimples;
    property vlrecursop : Currency read Fvlrecursop write fvlrecursop;
    property vlrecurso : Currency read Fvlrecurso write fvlrecurso;
    property prdesconto : Double read Fprdesconto write fprdesconto;
    property vltotalsdesconto : Currency read Fvltotalsdesconto write fvltotalsdesconto;
    property nusequencia : Integer read Fnusequencia write fnusequencia;
    property dsproduto : string read Fdsproduto write fdsproduto;
    property cdstitorcamento : Integer read Fcdstitorcamento write fcdstitorcamento;
    property bocertificado : String read Fbocertificado write fbocertificado;
    property boinftecnica : String read Fboinftecnica write fboinftecnica;
    property vldescontoproducao : Currency read Fvldescontoproducao write fvldescontoproducao;
    property cddigitadoembalagem : string read Fcddigitadoembalagem write fcddigitadoembalagem;
    property vlacrescimo : Currency read Fvlacrescimo write fvlacrescimo;
    property nuperiodicidade : integer read Fnuperiodicidade write fnuperiodicidade;
    constructor create;
    destructor destroy; override;
  end;
  TItorcamentoList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TItorcamento;
    procedure SetItem(Index: Integer; const Value: TItorcamento);
  public
    function New: TItorcamento;
    property Items[Index: Integer]: TItorcamento read GetItem write SetItem;
    function Ler(codigo:Integer):Boolean;overload;
    function Ler(DataSet: TDataset):boolean;overload;
    function indice(codigo:integer):integer;
    function excluir(codigo:integer):boolean;
    procedure Limpar;
    function GetVl(nmfield:string):currency;
    function GetQt(nmfield:string):Double;
    procedure CalcularICMS(boicmssubtrib:String);
    procedure RatearFrete(valor:currency; boexibirfrete: string);
    procedure RatearDesconto(valor: currency; boitemdesconto:String);
    procedure RatearAcrescimo(valor:currency; boitemacrescimo:String);
  end;

implementation

constructor TITorcamento.create;
begin
  inherited;
  Fitorcamentorecurso := TitorcamentorecursoList.create;
  Fitorcamentomaterial := TitorcamentomaterialList.create;
  Fitorcamentocusto := TitorcamentocustoList.create;
  fproduto := tproduto.create;
end;

destructor TITorcamento.destroy;
begin
  FreeAndNil(fitorcamentorecurso);
  FreeAndNil(fitorcamentomaterial);
  FreeAndNil(fitorcamentocusto);
  FreeAndNil(fproduto);
  inherited;
end;

procedure TItorcamentoList.CalcularICMS(boicmssubtrib:String);
var
  i : integer;
  vlbase : currency;
begin
  for I := 0 to count-1 do
  begin
    if items[i].CDSTITORCAMENTO <> 4 then
    begin
      vlbase := items[i].VLTOTAL + items[i].VLFRETE;
      items[i].VLICMS := vlbase * items[i].ALICMS / 100;
      if (boicmssubtrib = _s) and (items[i].ALMVA>0) then
      begin
        vlbase := (vlbase + items[i].VLIPI) * ((items[i].ALMVA / 100)+1);
        items[i].VLICMSSUBTRIB := RoundTo((vlbase * items[i].ALICMSSUBTRIB / 100) - items[i].VLICMS, -2);
      end;
    end
    else
    begin
      items[i].VLICMSSUBTRIB := 0;
    end;
  end;
end;

function TItorcamentoList.excluir(codigo: integer):boolean;
var
  i : integer;
begin
  i := indice(codigo);
  result := i > -1;
  if result then
  begin
    Delete(i);
  end;
end;

function TItorcamentoList.GetItem(Index: Integer): TItorcamento;
begin
  Result := TItorcamento(Inherited Items[Index]);
end;

function TItorcamentoList.GetQt(nmfield: string): Double;
var
  I: Integer;
begin
  result := 0;
  for I := 0 to count - 1 do
  begin
    if items[i].cdstitorcamento = 4 then
    begin
      continue;
    end;
    if nmfield = _qtitem then
    begin
      result := result + items[i].qtitem;
    end;
  end;
end;

function TItorcamentoList.GetVl(nmfield: string): currency;
var
  I: Integer;
begin
  result := 0;
  for I := 0 to count - 1 do
  begin
    if items[i].cdstitorcamento = 4 then
    begin
      continue;
    end;
    if nmfield = _vldesconto then
    begin
      result := result + items[i].vldesconto;
    end;
    if nmfield = _vlfrete then
    begin
      result := result + items[i].vlfrete;
    end;
    if nmfield = _vlacrescimo then
    begin
      result := result + items[i].vlacrescimo;
    end;
    if nmfield = _vlicmssubtrib then
    begin
      result := result + items[i].vlicmssubtrib;
    end;
    if nmfield = _vltotal then
    begin
      result := result + items[i].vltotal;
    end;
    if nmfield = _vlipi then
    begin
      result := result + items[i].vlipi;
    end;
    if nmfield = _vltotalcipi then
    begin
      if items[i].CDTPIPI = 1 then
      begin
        result := result + items[i].VLTOTALCIPI
      end
      else
      begin
        result := result + items[i].VLTOTAL;
      end;
    end;
  end;
end;

function TItorcamentoList.indice(codigo: integer): integer;
var
  I: Integer;
begin
  result := -1;
  for I := 0 to count - 1 do
  begin
    if codigo = items[i].cditorcamento then
    begin
      result := i;
      break;
    end;
  end;
end;

function TItorcamentoList.Ler(DataSet: TDataset):boolean;
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

procedure TItorcamentoList.Limpar;
//var
  //i: Integer;
begin
  if count = 0 then
  begin
    exit;
  end;
  repeat
    delete(0);
  until count = 0;
end;

function TItorcamentoList.Ler(codigo: Integer): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_itorcamento, codigo, _cdorcamento));
  try
    clear;
    result := q.q.RecordCount > 0;
    if not result then
    begin
      Exit;
    end;
    Ler(q.q);
  finally
    FreeAndNil(q);
  end;
end;

function TItorcamentoList.New: TItorcamento;
begin
  Result := TItorcamento.Create;
  Add(Result);
end;

procedure TItorcamentoList.RatearAcrescimo(valor: currency; boitemacrescimo:String);
var
  I: Integer;
begin
  for I := 0 to count-1 do
  begin
    if (items[i].CDSTITORCAMENTO <> 4) and (getqt(_vltotal) <> 0) and (boitemacrescimo <> _s) then
    begin
      items[i].VLACRESCIMO := RoundTo(((items[i].QTITEM * items[i].VLUNITARIO) / getqt(_vltotal)) * valor, -2);
    end;
  end;
end;

procedure TItorcamentoList.RatearDesconto(valor: currency; boitemdesconto:string);
var
  I: Integer;
begin
  for I := 0 to count-1 do
  begin
    if (getqt(_vltotal) <> 0) and (boitemdesconto <> _s) then
    begin
      if items[i].CDSTITORCAMENTO <> 4 then
      begin
        items[i].vldesconto := RoundTo(((items[i].QTITEM * items[i].VLUNITARIO) / getqt(_vltotal)) * valor, -2);
      end
      else
      begin
        items[i].VLDESCONTO := 0;
      end;
    end;
  end;
end;

procedure TItorcamentoList.RatearFrete(valor: currency; boexibirfrete: string);
var
  I: Integer;
begin
  for I := 0 to count-1 do
  begin
    if items[i].CDSTITORCAMENTO <> 4 then
    begin
      if boexibirfrete <> _s then
      begin
        if (valor = 0) or (getqt(_qtitem) * items[i].QTITEM = 0) then
        begin
          items[i].VLFRETE := 0;
        end
        else
        begin
          items[i].VLFRETE := valor / getqt(_qtitem) * items[i].QTITEM;
        end;
      end;
    end
    else
    begin
      items[i].VLFRETE := 0;
    end;
  end;
end;

procedure TItorcamentoList.SetItem(Index: Integer; const Value: TItorcamento);
begin
  Put(Index, Value);
end;

end.
