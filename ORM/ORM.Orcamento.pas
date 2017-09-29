unit ORM.Orcamento;

interface

uses
  Contnrs, sysutils, ExtCtrls, Controls, Menus, ActnList, Classes,
  DB,
  rotina.Registro, uconstantes, rotina.datahora, rotina.strings, dialogo.SelecionarEntrada,
  dialogo.justificativa,
  classe.aplicacao, orm.empresa, orm.usuario, classe.gerar, classe.registrainformacao,
  classe.query, classe.executasql, rotina.retornasql, orm.produto,
  orm.cliente, orm.Formulacao, orm.pedidomaterial, orm.tpcobranca, orm.hstorcamento,
  orm.ItorcamentoRecurso, orm.itorcamentomaterial, orm.itorcamentocusto, orm.Itformulacao,
  orm.TPOrcamento, orm.ITorcamento, orm.condpagto, orm.StOrcamento, classe.dao;

Type
  TOrcamento = class(TRegistroQuipos)
  private
    ftporcamento : TTPOrcamento;
    fcdorcamento : Integer;
    fcdtporcamento : integer;
    fcdproduto : Integer;
    fcddigitado : string;
    fcliente : TCliente;
    fcdcliente : LargeInt;
    Fboitemdesconto: String;
    Fvltotalcipi: Currency;
    Fvldespesa: Currency;
    Fvlcofins: Currency;
    Fvldespesaseguro: Currency;
    Fvlpis: Currency;
    Fvlirpj: Currency;
    Fvlfrete: Currency;
    Fvltotalsdesconto: Currency;
    Fvliss: Currency;
    Fvlcomissao: Currency;
    Fvllucro: Currency;
    Fvllucrobruto: Currency;
    Fvlmaterial: Currency;
    Fvlicmssubtrib: Currency;
    Fvlacrescimo: Currency;
    Fvlircsll: Currency;
    Fvloperacao: Currency;
    Fvllucroir: Currency;
    Fvlsimples: Currency;
    Fvldesconto: Currency;
    Fvlproducao: Currency;
    Fvlpreparacao: Currency;
    Fvlimposto: Currency;
    Fvlproduto: Currency;
    Fvlcsll: Currency;
    Fvldespesaadministrativa: Currency;
    Fvltotal: Currency;
    Fvlrecurso: Currency;
    Fvlipi: Currency;
    Fvlcpp: Currency;
    Fvlcusto: Currency;
    Fvlicms: Currency;
    Fvldespesaembalagem: Currency;
    Fvldespesacomercial: Currency;
    Fvlvendaliquida: Currency;
    Fvldespesafrete: currency;
    Fqthora: Double;
    Falicms: Double;
    Fqtpreparacao: Double;
    Fqtoperacao: Double;
    Fprmulta: Double;
    Fprmoradiaria: Double;
    Fpsbruto: Double;
    Fqtaprovado: Double;
    Fqtitem: Double;
    Fprdesconto: Double;
    Fcduf: Integer;
    Fcdrepresentante: Integer;
    Fnuperiodicidade: Integer;
    Fcdtpfrete: String;
    Fcdmunicipio: Integer;
    Fcdfuncionariovendedor: Integer;
    Fcdclienteentrega: Integer;
    Fcdtpcobranca: Integer;
    Fcdorcamentoatravesde: Integer;
    Fcdfuncionarioorcamentista: Integer;
    Fcditcontcliente: Integer;
    Fcdstorcamento: Integer;
    Fcdperiodicidade: Integer;
    Fcdcondpagto: integer;
    Fcdfuncionario: Integer;
    Fnucontrato: string;
    Fnmcontato: string;
    Fnufone: string;
    Fdsobservacao: string;
    Fnmbairro: string;
    Fdsendereco: string;
    Fnufax: string;
    Fcdclienteliberado: LargeInt;
    Fdsnumero: string;
    Fdsreferencia: string;
    Fdscomplemento: string;
    Fcdtransportadora: largeint;
    Fnucep: string;
    Fnucxpostal: string;
    Fdsobsinterna: string;
    Fnucotacao: string;
    Fdtprorrogacao: TDate;
    Fdtemissao: TDate;
    Fdtprventrega: TDate;
    Fdtvalidade: TDate;
    Fdtfechamento: TDate;
    Fdtresposta: TDate;
    Fhrrespostafinal: TTime;
    Fhrresposta: TTime;
    Fnudiasrescisao: Integer;
    Fnudias: integer;
    Fnudiasmedicao: integer;
    Fdstag2: string;
    Fdstag4: string;
    Fdstag5: string;
    Fdstag3: string;
    Fdstag: string;
    Fitorcamento: TItorcamentoList;
    Fboalmoco: String;
    Fbomanutencao: String;
    Fcditcontclienteresponsavel: Integer;
    Fhrfim: TTime;
    Fhrinicio: TTime;
    Fnuperiodicidadeatendimento: Integer;
    Fcdperiodicidadeatendimento: Integer;
    ftpcobranca: ttpcobranca;
    fcondpagto: tcondpagto;
    Fstorcamento: tstorcamento;
    fdtemail: TDate;
    procedure Setstorcamento(const Value: tstorcamento);
  public
    property storcamento : tstorcamento read Fstorcamento write Setstorcamento;
    property itorcamento : TItorcamentoList read Fitorcamento write Fitorcamento;
    property tpcobranca : ttpcobranca read ftpcobranca write ftpcobranca;
    property condpagto : tcondpagto read fcondpagto write fcondpagto;
    property tporcamento : ttporcamento read ftporcamento write ftporcamento;
    property cliente : TCliente read fcliente write fcliente;
    [keyfield]
    property cdorcamento : integer read fcdorcamento write fcdorcamento;
    [FK]
    property cdtporcamento : Integer read fcdtporcamento write fcdtporcamento;
    [FK]
    property cdproduto : Integer read fcdproduto write fcdproduto;
    property cddigitado : string read fcddigitado write fcddigitado;
    [FK]
    property cdcliente : LargeInt read fcdcliente write fcdcliente;
    [FK]
    property cdstorcamento : Integer read Fcdstorcamento write Fcdstorcamento;
    [FK]
    property cdcondpagto : integer read Fcdcondpagto write Fcdcondpagto;
    [FK]
    property cdtpfrete : String read Fcdtpfrete write Fcdtpfrete;
    [FK]
    property cdrepresentante : Integer read Fcdrepresentante write Fcdrepresentante;
    [FK]
    property cdfuncionariovendedor : Integer read Fcdfuncionariovendedor write Fcdfuncionariovendedor;
    [FK]
    property cdfuncionarioorcamentista : Integer read Fcdfuncionarioorcamentista write Fcdfuncionarioorcamentista;
    [FK]
    property cdclienteliberado : LargeInt read Fcdclienteliberado write Fcdclienteliberado;
    [FK]
    property cdtpcobranca : Integer read Fcdtpcobranca write Fcdtpcobranca;
    [FK]
    property cdtransportadora : largeint read Fcdtransportadora write Fcdtransportadora;
    [FK]
    property cdfuncionario : Integer read Fcdfuncionario write Fcdfuncionario;
    [FK]
    property cduf : Integer read Fcduf write Fcduf;
    [FK]
    property cdclienteentrega : Integer read Fcdclienteentrega write Fcdclienteentrega;
    [FK]
    property cdmunicipio : Integer read Fcdmunicipio write Fcdmunicipio;
    [FK]
    property cditcontcliente : Integer read Fcditcontcliente write Fcditcontcliente;
    [FK]
    property cdorcamentoatravesde : Integer read Fcdorcamentoatravesde write Fcdorcamentoatravesde;
    property dtemissao : TDate read Fdtemissao write Fdtemissao;
    property dtprventrega : TDate read Fdtprventrega write Fdtprventrega;
    property dtvalidade : TDate read Fdtvalidade write Fdtvalidade;
    property dtprorrogacao : TDate read Fdtprorrogacao write Fdtprorrogacao;
    property nucotacao : string read Fnucotacao write Fnucotacao;
    property vltotal : Currency read Fvltotal write Fvltotal;
    property vlproduto : Currency read Fvlproduto write Fvlproduto;
    property vlicms : Currency read Fvlicms write Fvlicms;
    property prdesconto : Double read Fprdesconto write Fprdesconto;
    property vldesconto : Currency read Fvldesconto write Fvldesconto;
    property vltotalsdesconto : Currency read Fvltotalsdesconto write Fvltotalsdesconto;
    property dsobservacao : string read Fdsobservacao write Fdsobservacao;
    property dsobsinterna : string read Fdsobsinterna write Fdsobsinterna;
    property vlfrete : Currency read Fvlfrete write Fvlfrete;
    property qtitem : Double read Fqtitem write Fqtitem;
    property qtaprovado : Double read Fqtaprovado write Fqtaprovado;
    property dtfechamento : TDate read Fdtfechamento write Fdtfechamento;
    property alicms : Double read Falicms write Falicms;
    property vlipi : Currency read Fvlipi write Fvlipi;
    property vltotalcipi : Currency read Fvltotalcipi write Fvltotalcipi;
    property psbruto : Double read Fpsbruto write Fpsbruto;
    property vlicmssubtrib : Currency read Fvlicmssubtrib write Fvlicmssubtrib;
    property dsreferencia : string read Fdsreferencia write Fdsreferencia;
    property dtresposta : TDate read Fdtresposta write Fdtresposta;
    property dtemail : TDate read fdtemail write fdtemail;
    property vlpis : Currency read Fvlpis write Fvlpis;
    property vlcofins : Currency read Fvlcofins write Fvlcofins;
    property vlcsll : Currency read Fvlcsll write Fvlcsll;
    property vlirpj : Currency read Fvlirpj write Fvlirpj;
    property vlproducao : Currency read Fvlproducao write Fvlproducao;
    property vlmaterial : Currency read Fvlmaterial write Fvlmaterial;
    property vlcusto : Currency read Fvlcusto write Fvlcusto;
    property vlpreparacao : Currency read Fvlpreparacao write Fvlpreparacao;
    property vloperacao : Currency read Fvloperacao write Fvloperacao;
    property qtoperacao : Double read Fqtoperacao write Fqtoperacao;
    property qtpreparacao : Double read Fqtpreparacao write Fqtpreparacao;
    property qthora : Double read Fqthora write Fqthora;
    property vllucro : Currency read Fvllucro write Fvllucro;
    property vliss : Currency read Fvliss write Fvliss;
    property vlimposto : Currency read Fvlimposto write Fvlimposto;
    property vlvendaliquida : Currency read Fvlvendaliquida write Fvlvendaliquida;
    property vllucrobruto : Currency read Fvllucrobruto write Fvllucrobruto;
    property vldespesa : Currency read Fvldespesa write Fvldespesa;
    property vldespesaadministrativa : Currency read Fvldespesaadministrativa write Fvldespesaadministrativa;
    property vldespesafrete : currency read Fvldespesafrete write Fvldespesafrete;
    property vldespesacomercial : Currency read Fvldespesacomercial write Fvldespesacomercial;
    property vldespesaembalagem : Currency read Fvldespesaembalagem write Fvldespesaembalagem;
    property vldespesaseguro : Currency read Fvldespesaseguro write Fvldespesaseguro;
    property vllucroir : Currency read Fvllucroir write Fvllucroir;
    property vlircsll : Currency read Fvlircsll write Fvlircsll;
    property vlcpp : Currency read Fvlcpp write Fvlcpp;
    property vlsimples : Currency read Fvlsimples write Fvlsimples;
    property vlrecurso : Currency read Fvlrecurso write Fvlrecurso;
    property vlcomissao : Currency read Fvlcomissao write Fvlcomissao;
    property hrresposta : TTime read Fhrresposta write Fhrresposta;
    property hrrespostafinal : TTime read Fhrrespostafinal write Fhrrespostafinal;
    property boitemdesconto : String read Fboitemdesconto write Fboitemdesconto;
    property dsendereco : string read Fdsendereco write Fdsendereco;
    property dsnumero : string read Fdsnumero write Fdsnumero;
    property nmbairro : string read Fnmbairro write Fnmbairro;
    property nucxpostal : string read Fnucxpostal write Fnucxpostal;
    property nucep : string read Fnucep write Fnucep;
    property nufone : string read Fnufone write Fnufone;
    property nufax : string read Fnufax write Fnufax;
    property nmcontato : string read Fnmcontato write Fnmcontato;
    property dscomplemento : string read Fdscomplemento write Fdscomplemento;
    property nucontrato : string read Fnucontrato write Fnucontrato;
    [FK]
    property cdperiodicidade : Integer read Fcdperiodicidade write Fcdperiodicidade;
    property nuperiodicidade : Integer read Fnuperiodicidade write Fnuperiodicidade;
    property vlacrescimo : Currency read Fvlacrescimo write Fvlacrescimo;
    property prmulta : Double read Fprmulta write Fprmulta;
    property prmoradiaria : Double read Fprmoradiaria write Fprmoradiaria;
    property nudiasrescisao : Integer read Fnudiasrescisao write Fnudiasrescisao;
    property nudias : integer read Fnudias write Fnudias;
    property dstag : string read Fdstag write Fdstag;
    property dstag2 : string read Fdstag2 write Fdstag2;
    property dstag3 : string read Fdstag3 write Fdstag3;
    property nudiasmedicao : integer read Fnudiasmedicao write Fnudiasmedicao;
    property dstag4 : string read Fdstag4 write Fdstag4;
    property dstag5 : string read Fdstag5 write Fdstag5;
    [FK]
    property cditcontclienteresponsavel : Integer read Fcditcontclienteresponsavel write fcditcontclienteresponsavel;
    property boalmoco : String read Fboalmoco write fboalmoco;
    property hrinicio : TTime read Fhrinicio write fhrinicio;
    property hrfim : TTime read Fhrfim write fhrfim;
    property bomanutencao : String read Fbomanutencao write fbomanutencao;
    property nuperiodicidadeatendimento : Integer read Fnuperiodicidadeatendimento write Fnuperiodicidadeatendimento;
    [FK]
    property cdperiodicidadeatendimento : Integer read Fcdperiodicidadeatendimento write Fcdperiodicidadeatendimento;
    constructor create; overload;
    destructor destroy; override;
    procedure calcular_acrescimo_analise_critica(cditorcamento:string);
    function getcditorcamento(cdorcamento, cdproduto:integer):integer;
    function copiar:integer;
    function RegistrarMudancaStatus(Acdstorcamento: integer; texto:string=''): boolean;
    function AnaliseCriticaItemFoiFeito(cditorcamento:string):Boolean;
    function AnaliseCriticaItemRestrita(cditorcamento:string):Boolean;
    function SetStatus(cdstorcamento: Integer): Boolean;
    function GerarCotacao:Boolean;
    procedure AlterarVlUnitarioProdutodeAcordocomTipoCobranca;
    procedure Totalizar;
  end;

implementation

uses dialogo.analisecritica, classe.orcamentocopiar;

constructor TOrcamento.create;
begin
  inherited create;
  fstorcamento := tstorcamento.create;
  fcondpagto := tcondpagto.create;
  ftporcamento := ttporcamento.create;
  ftpcobranca := ttpcobranca.create;
  fcliente := TCliente.create;
  Fitorcamento := TItorcamentoList.Create;
end;

function TOrcamento.getcditorcamento(cdorcamento, cdproduto: integer): integer;
begin
  result := RetornaSQLInteger('select cditorcamento from itorcamento where cdempresa='+empresa.cdempresa.tostring+' and cdproduto='+cdproduto.tostring+' and cdorcamento='+cdorcamento.tostring);
  if RetornaSQLInteger('select count(*) from itorcamento where cdempresa='+empresa.cdempresa.tostring+' and cdproduto='+cdproduto.tostring+' and cdorcamento='+cdorcamento.tostring) > 0 then
  begin
    result := selecionar_Entrada(_itorcamento, cdorcamento.tostring, cdproduto);
  end;
end;

function TOrcamento.copiar: integer;
var
  orcamentocopiar : TOrcamentoCopiar;
begin
  orcamentocopiar := TOrcamentoCopiar.create;
  try
    result := orcamentocopiar.executar(cdorcamento);
  finally
    orcamentocopiar.destroy;
  end;
end;

function TOrcamento.SetStatus(cdstorcamento: Integer): Boolean;
begin
  Result := False;
  if (tporcamento.boanalisecritica = _s) and QRegistro.BooleandoCodigo(_storcamento, cdstorcamento, _boanalisecritica) and (not Analise_Critica(IntToStr(cdorcamento))) then
  begin
    Exit;
  end;
  result := ExecutaSQL('update orcamento set cdstorcamento='+cdstorcamento.ToString+' where cdempresa='+empresa.cdempresa.tostring+' and cdorcamento='+IntToStr(cdorcamento));
  if result then
  begin
    RegistrarMudancaStatus(cdstorcamento);
  end;
end;

function Torcamento.RegistrarMudancaStatus(Acdstorcamento: integer; texto:string=''): boolean;
var
  dsjustificativa : string;
  hstorcamento : THStOrcamento;
begin
  if texto <> '' then
  begin
    dsjustificativa := texto;
  end;
  if (tporcamento.bojustificarmudancastatus = _s) and (texto = '') then
  begin
    DialogoJustificativa('Justificar mudança de status', dsjustificativa);
  end;
  hstorcamento := THStOrcamento.Create;
  try
    hstorcamento.cdempresa       := empresa.cdempresa;
    hstorcamento.cdhstorcamento  := QGerar.GerarCodigo(_hstorcamento);
    hstorcamento.cdorcamento     := cdorcamento;
    hstorcamento.cdstorcamento   := Acdstorcamento;
    hstorcamento.cdusuario       := usuario.cdusuario;
    hstorcamento.cdcomputador    := StrToInt(vgcdcomputador);
    hstorcamento.tshistorico     := tsBanco;
    hstorcamento.dsjustificativa := dsjustificativa;
    result := ExecutaSQL(hstorcamento.Insert(True));
  finally
    FreeAndNil(hstorcamento);
  end;
end;

procedure TOrcamento.Setstorcamento(const Value: tstorcamento);
begin
  Fstorcamento := Value;
end;

procedure TOrcamento.Totalizar;
//var
  //i : integer;
begin
  VLPRODUTO := itorcamento.getvl(_vltotal);
  vlipi := itorcamento.getvl(_vlipi);
  vltotalcipi := itorcamento.getvl(_vltotalcipi);
  psbruto := itorcamento.getqt(_qtitem);
  itorcamento.ratearFrete(vlfrete, tporcamento.boexibirfrete);
  itorcamento.ratearDesconto(vldesconto, tporcamento.boitemacrescimo);
  itorcamento.ratearAcrescimo(vlacrescimo, tporcamento.boitemdesconto);
  if tporcamento.boitemacrescimo = _s then
  begin
    VLACRESCIMO := itorcamento.getvl(_vlacrescimo);
  end;
  itorcamento.CalcularICMS(tporcamento.boicmssubtrib);
  if tporcamento.boitemdesconto = _s then
  begin
    VLDESCONTO := itorcamento.getvl(_vldesconto);
  end;
  if tporcamento.boexibirfrete = _s then
  begin
    vlfrete := itorcamento.getvl(_vlfrete);
  end;
  vlicmssubtrib := itorcamento.getvl(_vlicmssubtrib);
  VLTOTAL := VLPRODUTO - VLDESCONTO + VLFRETE + VLICMSSUBTRIB + VLACRESCIMO;
  if VLPRODUTO = 0 then
  begin
    PRDESCONTO := 0
  end
  else
  begin
    PRDESCONTO := VLDESCONTO * 100 / VLPRODUTO;
  end;
end;

procedure TOrcamento.AlterarVlUnitarioProdutodeAcordocomTipoCobranca;
begin
  //
end;

function TOrcamento.AnaliseCriticaItemFoiFeito(cditorcamento:string):Boolean;
begin
  result := retornasqlinteger('select count(*) '+
                              'from analisecritica '+
                              'where cdempresa='+empresa.cdempresa.tostring+' and cditorcamento='+cditorcamento) > 0;
end;

procedure TOrcamento.calcular_acrescimo_analise_critica(cditorcamento: string);
  function makesql:string;
  begin
    result := 'select itorcamento.vlacrescimo'+
                    ',itorcamento.cdorcamento'+
                    ',analisecritica.cdstanalisecritica'+
                    ',sum(itanalisecriticaresposta.vlunitario) vlunitario '+
              'from itorcamento '+
              'left join analisecritica on analisecritica.cdempresa=itorcamento.cdempresa and analisecritica.cditorcamento=itorcamento.cditorcamento '+
              'left join itanalisecritica on itanalisecritica.cdempresa=analisecritica.cdempresa and itanalisecritica.cdanalisecritica=analisecritica.cdanalisecritica '+
              'left join itanalisecriticaresposta on itanalisecriticaresposta.cdempresa=itanalisecritica.cdempresa and itanalisecriticaresposta.cditanalisecritica=itanalisecritica.cditanalisecritica '+
              'where itorcamento.cdempresa='+empresa.cdempresa.tostring+' and itorcamento.cditorcamento='+cditorcamento+' '+
              'group by itorcamento.vlacrescimo'+
                      ',itorcamento.cdorcamento'+
                      ',analisecritica.cdstanalisecritica';
  end;
var
  q : TClassequery;
  sql : tstrings;
begin
  sql := TStringList.Create;
  q   := TClasseQuery.create;
  try
    q.q.SQL.Text := makesql;
    q.q.open;
    sql.Add('update orcamento set vltotal=vltotal-'+getcurrencys(q.q.fieldbyname(_vlacrescimo).AsCurrency)+' where cdempresa='+empresa.cdempresa.tostring+' and cdorcamento='+q.q.fieldbyname(_cdorcamento).AsString+';');
    if q.q.FieldByName(_cdstanalisecritica).AsString = _3 then
    begin
      Exit;
    end;
    sql.Add('update itorcamento set vlacrescimo='+getcurrencys(q.q.fieldbyname(_vlunitario).AsCurrency)+' where cdempresa='+empresa.cdempresa.tostring+' and cditorcamento='+cditorcamento+';');
    sql.Add('update orcamento set vltotal=vltotal+'+getcurrencys(q.q.fieldbyname(_vlunitario).AsCurrency)+' where cdempresa='+empresa.cdempresa.tostring+' and cdorcamento='+q.q.fieldbyname(_cdorcamento).AsString+';');
    ExecutaScript(sql);
  finally
    sql.Free;
    q.Free;
  end;
end;

function TOrcamento.AnaliseCriticaItemRestrita(cditorcamento: string): Boolean;
begin
  result := retornasqlinteger('select count(*) from analisecritica where cdstanalisecritica=3 and cdempresa='+empresa.cdempresa.tostring+' and cditorcamento='+cditorcamento) > 0;
end;

destructor TOrcamento.destroy;
begin
  freeandnil(fcondpagto);
  freeandnil(fstorcamento);
  FreeAndNil(ftporcamento);
  freeandnil(ftpcobranca);
  FreeAndNil(fcliente);
  FreeAndNil(fitorcamento);
  inherited;
end;

function TOrcamento.GerarCotacao: Boolean;
var
  f, p, x, i : Integer;
  produtoList : TProdutoList;
  itformulacao : TItformulacaoList;
  pedidomaterial : TPedidoMaterial;
begin
  produtoList := TProdutoList.Create;
  itformulacao := TItformulacaoList.Create;
  try
    itorcamento.Ler(cdorcamento);
    for i := 0 to itorcamento.Count - 1 do
    begin
      itorcamento.Items[i].produto.Select(itorcamento.Items[i].cdproduto);
      itorcamento.Items[i].produto.itprodutomaterial.Ler(itorcamento.Items[i].cdproduto);
      for x := 0 to itorcamento.Items[i].produto.itprodutomaterial.Count - 1 do
      begin
        p := produtoList.getIndiceProduto(itorcamento.Items[i].produto.itprodutomaterial.Items[x].cdproduto);
        if p = - 1 then
        begin
          produtoList.New;
          p := produtoList.Count - 1;
        end;
        produtoList.Items[p].qtpedido := produtoList.Items[p].qtpedido + (itorcamento.Items[i].produto.itprodutomaterial.Items[x].qtitem * itorcamento.Items[i].qtitem); // acumular produto
      end;
      itorcamento.Items[i].produto.produtoformulacao.Ler(itorcamento.Items[i].cdproduto);
      for x := 0 to itorcamento.Items[i].produto.produtoformulacao.Count - 1 do
      begin
        itformulacao.Ler(itorcamento.Items[i].produto.produtoformulacao.Items[x].cdformulacao);
        for f := 0 to itformulacao.Count - 1 do
        begin
          p := produtoList.getIndiceProduto(itformulacao.Items[f].cdproduto);
          if p = - 1 then
          begin
            produtoList.New;
            p := produtoList.Count - 1;
            produtoList.Items[p].cdproduto := itformulacao.Items[f].cdproduto;
          end;
          produtoList.Items[p].qtpedido := produtoList.Items[p].qtpedido + (itformulacao.Items[f].qtitem * itorcamento.Items[i].qtitem); // acumular produto
        end;
      end;
    end;
    for p := 0 to produtoList.Count - 1 do
    begin
      pedidomaterial := TPedidoMaterial.create;
      try
        pedidomaterial.cdstpedidomaterial := 1;
        pedidomaterial.cdtppedidomaterial := tporcamento.cdtppedidomaterial;
        pedidomaterial.cdpedidomaterial   := qgerar.GerarCodigo(_pedidomaterial);
        pedidomaterial.dtemissao          := DtBanco;
        pedidomaterial.dtemprego          := pedidomaterial.dtemissao;
        pedidomaterial.insert;
        pedidomaterial.ItPedidoMaterial.New;
        pedidomaterial.ItPedidoMaterial.Items[0].qtsolicitada       := produtolist.items[p].qtpedido;
        pedidomaterial.ItPedidoMaterial.Items[0].cditpedidomaterial := QGerar.GerarCodigo(_itpedidomaterial);
        pedidomaterial.ItPedidoMaterial.Items[0].cdproduto          := produtoList.Items[p].cdproduto;
        pedidomaterial.ItPedidoMaterial.Items[0].cdpedidomaterial   := pedidomaterial.cdpedidomaterial;
        pedidomaterial.ItPedidoMaterial.Items[0].cddigitado         := IntToStr(produtoList.Items[p].cdproduto);
        pedidomaterial.ItPedidoMaterial.Items[0].insert;
      finally
        FreeAndNil(pedidomaterial);
      end;
    end;
    result := True;
  finally
    FreeAndNil(produtoList);
    FreeAndNil(itformulacao);
  end;
end;

end.
