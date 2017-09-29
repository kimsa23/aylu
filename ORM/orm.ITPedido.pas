unit orm.ITPedido;

interface

uses Data.DB, contnrs, System.SysUtils, forms, System.Classes,
  uConstantes,
  Dialogo.Progressbar,
  Rotina.Retornasql,
  ORM.Produto, ORM.Ordproducao, orm.ItPedidoEstrutura,
  Classe.DAO, classe.gerar, classe.query;

type
  TITPedido = class(TRegistroQuipos)
  private
    fstate : TDataSetState;
    fcditpedido : Integer;
    fcdpedido : integer;
    fcdproduto : Integer;
    fcdtpgradevalor : Integer;
    fcdstitpedido : Integer;
    fcditorcamento : Integer;
    fcdtpicms : Integer;
    fcdprodutoembalagem : Integer;
    fcdtpipi : Integer;
    fcdprofissional : Integer;
    fcdfornecedor : LargeInt;
    fqtitem : Double;
    fvlunitario : currency;
    fqtatendida : Double;
    fcddigitado : string;
    fvltotal : Currency;
    fvlipi : Currency;
    falipi : Double;
    fvltotalcipi : Currency;
    fdtprventrega : TDate;
    fqtlargura1 : Double;
    fqtlargura2 : Double;
    fqtaltura1 : Double;
    fqtaltura2 : Double;
    fqtcomprimento1 : Double;
    fqtcomprimento2 : Double;
    fqtdiametroexterno : Double;
    fqtdiametroexterno2 : Double;
    fqtdiametrofuro : Double;
    fqtcomprimento3 : Double;
    fqtdiametrocorpo : Double;
    fdsformula : string;
    fqtpeso : Double;
    fvlquilo : Currency;
    fdsdesenho : string;
    fvlmaquina : Currency;
    fvlpeca : Currency;
    falmva : Double;
    fvlicmssubtrib : Currency;
    fvlfrete : Currency;
    fvldesconto : Currency;
    falicms : Double;
    falicmssubtrib : Double;
    fnucotacao : string;
    fnuitem : string;
    fvlicms : Currency;
    fqtpeca : Double;
    fdsobservacao : string;
    fdsdesenhoposicao : string;
    fdsdesenhorevisao : string;
    fprlucro : Double;
    fdsposicaodesenho : string;
    fnurevisaodesenho : string;
    fnudiasentrega : Integer;
    falpis : Double;
    fvlpis : Currency;
    falcofins : Double;
    fvlcofins : Currency;
    falcsll : Double;
    fvlcsll : Currency;
    falirpj : Double;
    fvlirpj : Currency;
    fvlproducao : Currency;
    fvlmaterial : Currency;
    fvlcusto : Currency;
    fvlpreparacao : Currency;
    fvloperacao : Currency;
    fqtoperacao : Double;
    fqtpreparacao : Double;
    fqthora : Double;
    fvlproducaop : Currency;
    fvlmaterialp : Currency;
    fvlcustop : Currency;
    fvlpreparacaop : Currency;
    fvloperacaop : Currency;
    fqtpreparacaop : Double;
    fqtoperacaop : Double;
    fqthorap : Double;
    fvlpisp : Currency;
    fvlcofinsp : Currency;
    fvlcsllp : Currency;
    fvlirpjp : Currency;
    fvlicmsp : Currency;
    fvlipip : Currency;
    fnuprazoentrega : Integer;
    fdtaprovacao : TDate;
    fvllucro : Currency;
    fvllucrop : Currency;
    faliss : Double;
    fvlissp : Currency;
    fvliss : Currency;
    fvlimpostop : Currency;
    fvlimposto : Currency;
    fvlvendaliquidap : Currency;
    fvlvendaliquida : Currency;
    fvllucrobrutop : Currency;
    fvllucrobruto : Currency;
    fvldespesa : Currency;
    fvldespesap : Currency;
    fvldespesaadministrativa : Currency;
    fvldespesaadministrativap : Currency;
    fvldespesafretep : Currency;
    fvldespesafrete : Currency;
    fvldespesacomercialp : Currency;
    fvldespesacomercial : Currency;
    fvldespesaembalagemp : Currency;
    fvldespesaembalagem : Currency;
    fvldespesasegurop : Currency;
    fvldespesaseguro : Currency;
    fvllucroircsp : Currency;
    fvllucroircs : Currency;
    fprdespesaadministrativa : Double;
    fprdespesafrete : Double;
    fprdespesacomercial : Double;
    fprdespesaembalagem : Double;
    fprdespesaseguro : Double;
    fvlircsllp : Currency;
    fvlircsll : Currency;
    falcpp : double;
    fvlcppp : Double;
    fvlcpp : Double;
    falsimples : Double;
    fvlsimplesp : Currency;
    fvlsimples : Currency;
    fvlsimplessp : Currency;
    fvlrecursop : Currency;
    fvlrecurso : Currency;
    fboipibcicms : String;
    fnuitpedido : Integer;
    fprdesconto : Double;
    fqtconferencia : Double;
    fcddigitadoembalagem : string;
    fdtrevisao : TDate;
    fcdstembarque : Integer;
    fnurevisao : Integer;
    fcdtprevisaocomercial : Integer;
    fdtembarque : TDate;
    fhrembarque : TTime;
    fdtdesembarque : TDate;
    fcdtpvolume : Integer;
    fqtvolume : Integer;
    fcdtransportadora : largeint;
    fvlacrescimo : Currency;
    fdtemissao : TDate;
    fqtpecaatendida : Double;
    fcdtpitpedido : Integer;
    fproduto: TProduto;
    fordproducao: TOrdProducao;
    fitpedidoestrutura : TitpedidoestruturaList;
  public
    property itpedidoestrutura : TitpedidoestruturaList read fitpedidoestrutura write fitpedidoestrutura;
    property ordproducao : TOrdProducao read fordproducao write fordproducao;
    property produto: TProduto read fproduto write fproduto;
    property state : TDataSetState read fstate write fstate;
    [keyfield]
    property cditpedido : Integer read fcditpedido write fcditpedido;
    [fk]
    property cdpedido : integer read fcdpedido write fcdpedido;
    [fk]
    property cdproduto : Integer read fcdproduto write fcdproduto;
    [fk]
    property cdtpgradevalor : Integer read fcdtpgradevalor write fcdtpgradevalor;
    [fk]
    property cdstitpedido : Integer read fcdstitpedido write fcdstitpedido;
    [fk]
    property cditorcamento : Integer read fcditorcamento write fcditorcamento;
    [fk]
    property cdtpicms : Integer read fcdtpicms write fcdtpicms;
    [fk]
    property cdprodutoembalagem : Integer read fcdprodutoembalagem write fcdprodutoembalagem;
    [fk]
    property cdtpipi : Integer read fcdtpipi write fcdtpipi;
    [fk]
    property cdprofissional : Integer read fcdprofissional write fcdprofissional;
    [fk]
    property cdfornecedor : LargeInt read fcdfornecedor write fcdfornecedor;
    property qtitem : Double read fqtitem write fqtitem;
    property vlunitario : currency read fvlunitario write fvlunitario;
    property qtatendida : Double read fqtatendida write fqtatendida;
    property cddigitado : string read fcddigitado write fcddigitado;
    property vltotal : Currency read fvltotal write fvltotal;
    property vlipi : Currency read fvlipi write fvlipi;
    property alipi : Double read falipi write falipi;
    property vltotalcipi : Currency read fvltotalcipi write fvltotalcipi;
    property dtprventrega : TDate read fdtprventrega write fdtprventrega;
    property qtlargura1 : Double read fqtlargura1 write fqtlargura1;
    property qtlargura2 : Double read fqtlargura2 write fqtlargura2;
    property qtaltura1 : Double read fqtaltura1 write fqtaltura1;
    property qtaltura2 : Double read fqtaltura2 write fqtaltura2;
    property qtcomprimento1 : Double read fqtcomprimento1 write fqtcomprimento1;
    property qtcomprimento2 : Double read fqtcomprimento2 write fqtcomprimento2;
    property qtdiametroexterno : Double read fqtdiametroexterno write fqtdiametroexterno;
    property qtdiametroexterno2 : Double read fqtdiametroexterno2 write fqtdiametroexterno2;
    property qtdiametrofuro : Double read fqtdiametrofuro write fqtdiametrofuro;
    property qtcomprimento3 : Double read fqtcomprimento3 write fqtcomprimento3;
    property qtdiametrocorpo : Double read fqtdiametrocorpo write fqtdiametrocorpo;
    property dsformula : string read fdsformula write fdsformula;
    property qtpeso : Double read fqtpeso write fqtpeso;
    property vlquilo : Currency read fvlquilo write fvlquilo;
    property dsdesenho : string read fdsdesenho write fdsdesenho;
    property vlmaquina : Currency read fvlmaquina write fvlmaquina;
    property vlpeca : Currency read fvlpeca write fvlpeca;
    property almva : Double read falmva write falmva;
    property vlicmssubtrib : Currency read fvlicmssubtrib write fvlicmssubtrib;
    property vlfrete : Currency read fvlfrete write fvlfrete;
    property vldesconto : Currency read fvldesconto write fvldesconto;
    property alicms : Double read falicms write falicms;
    property alicmssubtrib : Double read falicmssubtrib write falicmssubtrib;
    property nucotacao : string read fnucotacao write fnucotacao;
    property nuitem : string read fnuitem write fnuitem;
    property vlicms : Currency read fvlicms write fvlicms;
    property qtpeca : Double read fqtpeca write fqtpeca;
    property dsobservacao : string read fdsobservacao write fdsobservacao;
    property dsdesenhoposicao : string read fdsdesenhoposicao write fdsdesenhoposicao;
    property dsdesenhorevisao : string read fdsdesenhorevisao write fdsdesenhorevisao;
    property prlucro : Double read fprlucro write fprlucro;
    property dsposicaodesenho : string read fdsposicaodesenho write fdsposicaodesenho;
    property nurevisaodesenho : string read fnurevisaodesenho write fnurevisaodesenho;
    property nudiasentrega : Integer read fnudiasentrega write fnudiasentrega;
    property alpis : Double read falpis write falpis;
    property vlpis : Currency read fvlpis write fvlpis;
    property alcofins : Double read falcofins write falcofins;
    property vlcofins : Currency read fvlcofins write fvlcofins;
    property alcsll : Double read falcsll write falcsll;
    property vlcsll : Currency read fvlcsll write fvlcsll;
    property alirpj : Double read falirpj write falirpj;
    property vlirpj : Currency read fvlirpj write fvlirpj;
    property vlproducao : Currency read fvlproducao write fvlproducao;
    property vlmaterial : Currency read fvlmaterial write fvlmaterial;
    property vlcusto : Currency read fvlcusto write fvlcusto;
    property vlpreparacao : Currency read fvlpreparacao write fvlpreparacao;
    property vloperacao : Currency read fvloperacao write fvloperacao;
    property qtoperacao : Double read fqtoperacao write fqtoperacao;
    property qtpreparacao : Double read fqtpreparacao write fqtpreparacao;
    property qthora : Double read fqthora write fqthora;
    property vlproducaop : Currency read fvlproducaop write fvlproducaop;
    property vlmaterialp : Currency read fvlmaterialp write fvlmaterialp;
    property vlcustop : Currency read fvlcustop write fvlcustop;
    property vlpreparacaop : Currency read fvlpreparacaop write fvlpreparacaop;
    property vloperacaop : Currency read fvloperacaop write fvloperacaop;
    property qtpreparacaop : Double read fqtpreparacaop write fqtpreparacaop;
    property qtoperacaop : Double read fqtoperacaop write fqtoperacaop;
    property qthorap : Double read fqthorap write fqthorap;
    property vlpisp : Currency read fvlpisp write fvlpisp;
    property vlcofinsp : Currency read fvlcofinsp write fvlcofinsp;
    property vlcsllp : Currency read fvlcsllp write fvlcsllp;
    property vlirpjp : Currency read fvlirpjp write fvlirpjp;
    property vlicmsp : Currency read fvlicmsp write fvlicmsp;
    property vlipip : Currency read fvlipip write fvlipip;
    property nuprazoentrega : Integer read fnuprazoentrega write fnuprazoentrega;
    property dtaprovacao : TDate read fdtaprovacao write fdtaprovacao;
    property vllucro : Currency read fvllucro write fvllucro;
    property vllucrop : Currency read fvllucrop write fvllucrop;
    property aliss : Double read faliss write faliss;
    property vlissp : Currency read fvlissp write fvlissp;
    property vliss : Currency read fvliss write fvliss;
    property vlimpostop : Currency read fvlimpostop write fvlimpostop;
    property vlimposto : Currency read fvlimposto write fvlimposto;
    property vlvendaliquidap : Currency read fvlvendaliquidap write fvlvendaliquidap;
    property vlvendaliquida : Currency read fvlvendaliquida write fvlvendaliquida;
    property vllucrobrutop : Currency read fvllucrobrutop write fvllucrobrutop;
    property vllucrobruto : Currency read fvllucrobruto write fvllucrobruto;
    property vldespesa : Currency read fvldespesa write fvldespesa;
    property vldespesap : Currency read fvldespesap write fvldespesap;
    property vldespesaadministrativa : Currency read fvldespesaadministrativa write fvldespesaadministrativa;
    property vldespesaadministrativap : Currency read fvldespesaadministrativap write fvldespesaadministrativap;
    property vldespesafretep : Currency read fvldespesafretep write fvldespesafretep;
    property vldespesafrete : Currency read fvldespesafrete write fvldespesafrete;
    property vldespesacomercialp : Currency read fvldespesacomercialp write fvldespesacomercialp;
    property vldespesacomercial : Currency read fvldespesacomercial write fvldespesacomercial;
    property vldespesaembalagemp : Currency read fvldespesaembalagemp write fvldespesaembalagemp;
    property vldespesaembalagem : Currency read fvldespesaembalagem write fvldespesaembalagem;
    property vldespesasegurop : Currency read fvldespesasegurop write fvldespesasegurop;
    property vldespesaseguro : Currency read fvldespesaseguro write fvldespesaseguro;
    property vllucroircsp : Currency read fvllucroircsp write fvllucroircsp;
    property vllucroircs : Currency read fvllucroircs write fvllucroircs;
    property prdespesaadministrativa : Double read fprdespesaadministrativa write fprdespesaadministrativa;
    property prdespesafrete : Double read fprdespesafrete write fprdespesafrete;
    property prdespesacomercial : Double read fprdespesacomercial write fprdespesacomercial;
    property prdespesaembalagem : Double read fprdespesaembalagem write fprdespesaembalagem;
    property prdespesaseguro : Double read fprdespesaseguro write fprdespesaseguro;
    property vlircsllp : Currency read fvlircsllp write fvlircsllp;
    property vlircsll : Currency read fvlircsll write fvlircsll;
    property alcpp : double read falcpp write falcpp;
    property vlcppp : Double read fvlcppp write fvlcppp;
    property vlcpp : Double read fvlcpp write fvlcpp;
    property alsimples : Double read falsimples write falsimples;
    property vlsimplesp : Currency read fvlsimplesp write fvlsimplesp;
    property vlsimples : Currency read fvlsimples write fvlsimples;
    property vlsimplessp : Currency read fvlsimplessp write fvlsimplessp;
    property vlrecursop : Currency read fvlrecursop write fvlrecursop;
    property vlrecurso : Currency read fvlrecurso write fvlrecurso;
    property boipibcicms : String read fboipibcicms write fboipibcicms;
    property nuitpedido : Integer read fnuitpedido write fnuitpedido;
    property prdesconto : Double read fprdesconto write fprdesconto;
    property qtconferencia : Double read fqtconferencia write fqtconferencia;
    property cddigitadoembalagem : string read fcddigitadoembalagem write fcddigitadoembalagem;
    property dtrevisao : TDate read fdtrevisao write fdtrevisao;
    property cdstembarque : Integer read fcdstembarque write fcdstembarque;
    property nurevisao : Integer read fnurevisao write fnurevisao;
    property cdtprevisaocomercial : Integer read fcdtprevisaocomercial write fcdtprevisaocomercial;
    property dtembarque : TDate read fdtembarque write fdtembarque;
    property hrembarque : TTime read fhrembarque write fhrembarque;
    property dtdesembarque : TDate read fdtdesembarque write fdtdesembarque;
    [fk]
    property cdtpvolume : Integer read fcdtpvolume write fcdtpvolume;
    property qtvolume : Integer read fqtvolume write fqtvolume;
    [fk]
    property cdtransportadora : largeint read fcdtransportadora write fcdtransportadora;
    property vlacrescimo : Currency read fvlacrescimo write fvlacrescimo;
    property dtemissao : TDate read fdtemissao write fdtemissao;
    property qtpecaatendida : Double read fqtpecaatendida write fqtpecaatendida;
    [fk]
    property cdtpitpedido : Integer read fcdtpitpedido write fcdtpitpedido;
    constructor create;
    destructor destroy; override;
    function Gerar_Ordem_Producao(cdtpordproducao: Integer):Integer;
  end;
  TITPedidoList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TITPedido;
    procedure SetItem(Index: Integer; const Value: TITPedido);
  public
    function New: TItPedido;
    property Items[Index: Integer]: TItPedido read GetItem write SetItem;
    function Insert(cdpedido:integer): TItPedido;
    function sql_insert:string;
    function Ler(codigo:Integer):boolean;overload;
    function Ler(Dataset: TDataset):boolean;overload;
    function VlTotal:currency;
    procedure ZerarVlTotalUnitario;
    function sqlUpdate:string;
    function Indice(cdproduto, cdtpgradevalor: integer):integer;
  end;

implementation

constructor TITPedido.create;
begin
  inherited;
  fproduto := tproduto.create;
  fordproducao := tordproducao.create;
  fitpedidoestrutura := TitpedidoestruturaList.create;
end;

destructor TITPedido.destroy;
begin
  FreeAndNil(fproduto);
  freeandnil(fordproducao);
  FreeAndNil(fitpedidoestrutura);
  inherited;
end;

function TITPedido.Gerar_Ordem_Producao(cdtpordproducao: Integer): Integer;
  function Gerar: integer;
  var
    qtd, qttotal, qtunidade : Double;
    ordproducao : TOrdProducao;
  begin
    frmprogressbar := Tfrmprogressbar.Create(nil);
    try
      qtd := qtitem;
      qttotal := qtitem;
      if produto.tpqtitem = _s then
      begin
        qtd := 1;
      end;
      qtunidade := 0;
      frmprogressbar.gau.MaxValue := Trunc(qttotal);
      frmprogressbar.Show;
      repeat
        frmprogressbar.gau.Progress := Trunc(qtunidade);
        Application.ProcessMessages;
        ordproducao := TOrdProducao.create;
        try
          result := ordproducao.GerarOrdProducaoPedido(cditpedido, cdtpordproducao, qtd);
        finally
          FreeAndNil(ordproducao);
        end;
        qtunidade := qtunidade + qtd;
      until qtunidade >= qttotal;
    finally
      FreeAndNil(frmprogressbar);
    end;
  end;
begin
  result := 0;
  if not Tordproducao.JaExisteOrdproducao(_pedido, cditpedido) then
  begin
    produto.Select(cdproduto);
    result := Gerar;
  end;
end;

function TITPedidoList.GetItem(Index: Integer): TITPedido;
begin
  Result := TItPedido(Inherited Items[Index]);
end;

function TITPedidoList.Indice(cdproduto, cdtpgradevalor: integer): integer;
var
  I: Integer;
begin
  result := -1;
  for I := 0 to count - 1 do
  begin
    if (items[i].cdproduto = cdproduto) and (items[i].cdtpgradevalor = cdtpgradevalor) then
    begin
      result := i;
      break;
    end;
  end;
end;

function TITPedidoList.Insert(cdpedido: integer): TItPedido;
begin
  result            := new;
  result.state      := dsInsert;
  Result.cdpedido   := cdpedido;
  Result.cditpedido := QGerar.GerarCodigo(_itpedido);
end;

function TITPedidoList.Ler(Dataset: TDataset): boolean;
begin
  clear;
  result := false;
  dataset.first;
  while not Dataset.Eof do
  begin
    new.Select(Dataset);
    Dataset.Next;
    result := true;
  end;
end;

function TITPedidoList.New: TItPedido;
begin
  Result := TItPedido.Create;
  Add(Result);
  result.qtatendida := 0;
  result.qtitem := 1;
end;

function TITPedidoList.Ler(codigo: Integer):boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_itpedido, codigo, _cdpedido));
  try
    result := Ler(q.q);
  finally
    FreeAndNil(q);
  end;
end;

procedure TITPedidoList.SetItem(Index: Integer; const Value: TITPedido);
begin
  Put(Index, Value);
end;

function TITPedidoList.sqlUpdate: string;
var
  i : integer;
begin
  result := '';
  for I := 0 to count - 1 do
  begin
    result := result + items[i].Update(true)+#13;
  end;
end;

function TITPedidoList.sql_insert: string;
var
  i : Integer;
begin
  Result := '';
  for i := 0 to count-1 do
  begin
    if Items[i].state = dsinsert then
    begin
      result := result + Items[i].Insert(True)+#13;
    end;
  end;
end;

function TITPedidoList.VlTotal: currency;
var
  I: Integer;
begin
  result := 0;
  for I := 0 to count - 1 do
  begin
    result := result + items[i].vltotal;
  end;
end;

procedure TITPedidoList.ZerarVlTotalUnitario;
var
  I: Integer;
begin
  for I := 0 to count - 1 do
  begin
    items[i].vlunitario := 0;
    items[i].vltotal := 0;
  end;
end;

end.
