unit ORM.Ordproducao;

interface

uses System.Actions, System.UITypes, Classes, sysutils, forms, Controls, Dialogs, math, Contnrs, DB,
  uconstantes,
  classe.email, classe.dao, classe.aplicacao, classe.executasql, classe.registrainformacao,
  classe.gerar, classe.query,
  orm.Itformulacao, orm.Hstordproducao, orm.TpOrdproducao, orm.movto, orm.pedidomaterial,
  orm.Formulacao, orm.apontamento, orm.produto, orm.ItMovto, orm.empresa, orm.usuario,
  orm.ItOrdProducaoRecurso, orm.itorcamentomaterial, orm.ItorcamentoRecurso, orm.itorcamentocusto,
  orm.ItOrdProducaoMaterial, orm.ItOrdproducaoCusto, orm.ItOrdproducao, orm.produtoformulacao,
  //orm.ITPedido,
  rotina.strings, rotina.Registro, rotina.datahora, rotina.retornasql,
  dialogo.RichEdit, dialogo.databalanco, dialogo.progressbar;

type
  TOrdProducao = class(TRegistroQuipos)
  private
    FApontamento   : TApontamentoList;
    FItOrdProducao : TItOrdProducaoList;
    FItOrdProducaoCusto : TItOrdProducaoCustoList;
    FItOrdProducaoMaterial : TItOrdProducaoMaterialList;
    FItOrdProducaoRecurso : TItOrdProducaoRecursoList;
    ftpordproducao : TTpOrdproducao;
    fcdordproducao : Integer;
    fcditpedido : integer;
    fcdstordproducao : Integer;
    fcdcliente : LargeInt;
    fcdtpordproducao : Integer;
    fcdfuncionario : Integer;
    fcdmunicipio : integer;
    fcdproduto : integer;
    fcdtpmotivorevisao : integer;
    fcdtpequipamento : Integer;
    fcdformulacao : Integer;
    fcdequipamento : Integer;
    fcditrequisicaoproducao : Integer;
    fcdfuncionariosolicitante : integer;
    fcdentrada : Integer;
    fcdequipamento2 : Integer;
    fcdorcamento : Integer;
    fdtemissao : TDate;
    fdtentrega : TDate;
    fdtprventrega : TDate;
    fdsobservacao : string;
    fqthoraorcada : Double;
    fqthoraproducao : Double;
    fvloperacao : Currency;
    fvloperacaop : Currency;
    fvlpreparacao : Currency;
    fvlpreparacaop : Currency;
    fvlrecurso : Currency;
    fvlrecursop : Currency;
    fqtoperacao : Double;
    fqtoperacaop : Double;
    fqtpreparacao : Double;
    fqtpreparacaop : Double;
    fqthora : Double;
    fqthorap : Double;
    fvlmaterial : Currency;
    fvlmaterialp : Currency;
    fvlproducao : Currency;
    fvlproducaop : Currency;
    fvlcusto : Currency;
    fvlcustop : Currency;
    fdsdesenho : string;
    fdsdesenhoposicao : string;
    fdsdesenhorevisao : string;
    fnudiascusto : Integer;
    fdtprvinstalacao : TDate;
    fcddigitado : string;
    fqtproducao : Double;
    fqtquociente : Integer;
    fnuestrutural : string;
    fnumistura : integer;
    fcdpesagem : string;
    fqtpesomistura : Double;
    fdtprevisaoproducao : TDate;
    fdtproducao : TDate;
    fnuentrada : Integer;
    fdstag : string;
    fqtpeca : Double;
    fqtpecaproducao : Double;
    Fqtitem: double;
    Fproduto: TProduto;
    fnurevisao: string;
    fboimpresso: string;
  public
    property produto : TProduto read Fproduto write Fproduto;
    property Apontamento : TApontamentoList read FApontamento write FApontamento;
    property ItOrdProducao : TItOrdProducaoList read FItOrdProducao write FItOrdProducao;
    property ItOrdProducaoCusto : TItOrdProducaoCustoList read FItOrdProducaoCusto write FItOrdProducaoCusto;
    property ItOrdProducaoMaterial : TItOrdProducaoMaterialList read FItOrdProducaoMaterial write FItOrdProducaoMaterial;
    property ItOrdProducaoRecurso : TItOrdProducaoRecursoList read FItOrdProducaoRecurso write FItOrdProducaoRecurso;
    property tpordproducao : TTpOrdproducao read ftpordproducao write ftpordproducao;
    [keyfield]
    property cdordproducao : Integer read fcdordproducao write fcdordproducao;
    [fk]
    property cditpedido : integer read fcditpedido write fcditpedido;
    [fk]
    property cdstordproducao : Integer read fcdstordproducao write fcdstordproducao;
    [fk]
    property cdcliente : LargeInt read fcdcliente write fcdcliente;
    [fk]
    property cdtpordproducao : Integer read fcdtpordproducao write fcdtpordproducao;
    [fk]
    property cdfuncionario : Integer read fcdfuncionario write fcdfuncionario;
    [fk]
    property cdmunicipio : integer read fcdmunicipio write fcdmunicipio;
    [fk]
    property cdproduto : integer read fcdproduto write fcdproduto;
    [fk]
    property cdtpmotivorevisao : integer read fcdtpmotivorevisao write fcdtpmotivorevisao;
    [fk]
    property cdtpequipamento : Integer read fcdtpequipamento write fcdtpequipamento;
    [fk]
    property cdformulacao : Integer read fcdformulacao write fcdformulacao;
    [fk]
    property cdequipamento : Integer read fcdequipamento write fcdequipamento;
    [fk]
    property cditrequisicaoproducao : Integer read fcditrequisicaoproducao write fcditrequisicaoproducao;
    [fk]
    property cdfuncionariosolicitante : integer read fcdfuncionariosolicitante write fcdfuncionariosolicitante;
    [fk]
    property cdentrada : Integer read fcdentrada write fcdentrada;
    [fk]
    property cdequipamento2 : Integer read fcdequipamento2 write fcdequipamento2;
    [fk]
    property cdorcamento : Integer read fcdorcamento write fcdorcamento;
    property dtemissao : TDate read fdtemissao write fdtemissao;
    property dtentrega : TDate read fdtentrega write fdtentrega;
    property dtprventrega : TDate read fdtprventrega write fdtprventrega;
    property dsobservacao : string read fdsobservacao write fdsobservacao;
    property qthoraorcada : Double read fqthoraorcada write fqthoraorcada;
    property qthoraproducao : Double read fqthoraproducao write fqthoraproducao;
    property vloperacao : Currency read fvloperacao write fvloperacao;
    property vloperacaop : Currency read fvloperacaop write fvloperacaop;
    property vlpreparacao : Currency read fvlpreparacao write fvlpreparacao;
    property vlpreparacaop : Currency read fvlpreparacaop write fvlpreparacaop;
    property vlrecurso : Currency read fvlrecurso write fvlrecurso;
    property vlrecursop : Currency read fvlrecursop write fvlrecursop;
    property qtoperacao : Double read fqtoperacao write fqtoperacao;
    property qtoperacaop : Double read fqtoperacaop write fqtoperacaop;
    property qtpreparacao : Double read fqtpreparacao write fqtpreparacao;
    property qtpreparacaop : Double read fqtpreparacaop write fqtpreparacaop;
    property qthora : Double read fqthora write fqthora;
    property qthorap : Double read fqthorap write fqthorap;
    property vlmaterial : Currency read fvlmaterial write fvlmaterial;
    property vlmaterialp : Currency read fvlmaterialp write fvlmaterialp;
    property vlproducao : Currency read fvlproducao write fvlproducao;
    property vlproducaop : Currency read fvlproducaop write fvlproducaop;
    property vlcusto : Currency read fvlcusto write fvlcusto;
    property vlcustop : Currency read fvlcustop write fvlcustop;
    property dsdesenho : string read fdsdesenho write fdsdesenho;
    property dsdesenhoposicao : string read fdsdesenhoposicao write fdsdesenhoposicao;
    property dsdesenhorevisao : string read fdsdesenhorevisao write fdsdesenhorevisao;
    property nudiascusto : Integer read fnudiascusto write fnudiascusto;
    property dtprvinstalacao : TDate read fdtprvinstalacao write fdtprvinstalacao;
    property qtitem : double read Fqtitem write Fqtitem;
    property cddigitado : string read fcddigitado write fcddigitado;
    property qtproducao : Double read fqtproducao write fqtproducao;
    property qtquociente : Integer read fqtquociente write fqtquociente;
    property nuestrutural : string read fnuestrutural write fnuestrutural;
    property numistura : integer read fnumistura write fnumistura;
    property cdpesagem : string read fcdpesagem write fcdpesagem;
    property qtpesomistura : Double read fqtpesomistura write fqtpesomistura;
    property dtprevisaoproducao : TDate read fdtprevisaoproducao write fdtprevisaoproducao;
    property dtproducao : TDate read fdtproducao write fdtproducao;
    property nuentrada : Integer read fnuentrada write fnuentrada;
    property dstag : string read fdstag write fdstag;
    property qtpeca : Double read fqtpeca write fqtpeca;
    property qtpecaproducao : Double read fqtpecaproducao write fqtpecaproducao;
    property nurevisao : string read fnurevisao write fnurevisao;
    property boimpresso : string read fboimpresso write fboimpresso;
    constructor create;
    destructor destroy; override;
    class function existeRequisicao(codigo:Integer):boolean;
    class function getCdordproducaoComEstrutura(Data: TDate; cdtpequipamento, cdproduto: integer; nuestrutural: string):Integer;
    class function getCdordproducaoSemEstrutura(Data: TDate; cdtpequipamento, cdproduto: integer; lstapontamento: tapontamentolist):Integer;
    class function JaExisteOrdproducao(tabela:string; cditem: integer):Boolean;
    function AjustarDadosApontamento: boolean;
    procedure CalcularTempoPrevisto;
    function copiarde(codigo: integer):boolean;
    function CorrigirNomeProdutoBeneficiado:boolean;
    procedure dispararEventoEmailMudancaStatus(cdstordproducao:integer);
    function GerarCorte:boolean;
    function GerarCotacao(codigo:Integer):integer;
    function GerarCustodoItorcamento:boolean;
    function GerarCustodoProduto:boolean;
    function GerarEntradaEstoqueProdutoOP(data: TDate=0):Boolean;
    function GerarMovtoItordproducao:boolean;
    function GerarMovtoItordproducaoMaterial:boolean;
    function GerarMovtoPesagem(data: TDate; lstcddigitado, lstnulotebag:string):Boolean;
    function GerarMaterialdaFormulacao:boolean;
    function GerarMaterialdoItformulacao(cdformulacao: Integer; cdtpequipamento:Integer=0; qtd : Double=0): Boolean;
    function GerarMaterialdoItorcamento:boolean;
    function GerarMaterialdoProduto:boolean;
    function GerarOrdProducaoPedido(cditem, cdtipo: Integer; qtd: double): integer;
    function GerarOrdProducaoRequisicaoproducao(cditem, cdtipo: Integer; qtd: Double; cdformulacao_: Integer=0):Integer;
    function GerarRecursodoItorcamento:boolean;
    function GerarRecursodoProduto:boolean;
    function GerarRequisicao(codigo:Integer):Integer;
    function getCdpedido(codigo:string):string;
    function nuestruturalSomenteNesteApontamento(codigo:integer):Boolean;
    function RegistrarMudancaStatus(boscript:boolean=false):string;
    class function seMesmoProdutoFormulacao(codigo:string; var cdproduto, cdformulacao:string):Boolean;
    procedure RecriarOPdoMetodoProcessodoProduto;
    class function AcabamentoConcluido:boolean;
  end;
  TOrdProducaoList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TOrdProducao;
    procedure SetItem(Index: Integer; const Value: TOrdProducao);
  public
    function New: TOrdProducao;
    property Items[Index: Integer]: TOrdProducao read GetItem write SetItem;
    function Ler(codigo:Integer; cdfield:string):Boolean;overload;
    function Ler(DataSet: TDataset):boolean;overload;
    function Ler(sqlwhere: string):Boolean;overload;
  end;

implementation

uses orm.rim,
  orm.itprodutomaterial,
  orm.itrequisicaoproducao,
  orm.ItProdutoRecurso,
  orm.itprodutocusto,
  orm.eventoemail,
  orm.pedido,
  orm.ITPedido,
  orm.requisicaoproducao,
  orm.orcamento;

constructor TOrdProducao.create;
begin
  inherited;
  fproduto := tproduto.create;
  FApontamento           := TApontamentoList.Create;
  fItOrdProducaoRecurso  := TItOrdProducaoRecursoList.Create;
  fItOrdProducaoMaterial := TItOrdProducaoMaterialList.Create;
  fItOrdproducaoCusto    := TItOrdproducaoCustoList.Create;
  fItOrdProducao         := TItOrdProducaoList.Create;
  ftpordproducao         := Ttpordproducao.create;
end;

class function TOrdProducao.seMesmoProdutoFormulacao(codigo:string; var cdproduto, cdformulacao:string):Boolean;
var
  cdproduto1, cdformulacao1:string;
begin
  cdproduto1 := NomedoCodigo(_ordproducao, codigo, _cdproduto);
  if cdproduto1 = '' then
  begin
    MessageDlg('Não está definido o produto para a Ordem de Produção '+codigo+'.', mtInformation, [mbOK], 0);
    Abort;
  end;
  cdformulacao1 := NomedoCodigo(_ordproducao, codigo, _cdformulacao);
  if cdformulacao1 = '' then
  begin
    MessageDlg('Não está definido o formulação para a Ordem de Produção '+codigo+'.', mtInformation, [mbOK], 0);
    Abort;
  end;
  if cdproduto = '' then
  begin
    cdproduto := cdproduto1;
  end;
  if cdformulacao = '' then
  begin
    cdformulacao := cdformulacao1;
  end;
  if (cdproduto <> cdproduto1) or (cdformulacao1 <> cdformulacao) then
  begin
    MessageDlg('Produto e formulação devem ser o mesmo (ordem de produção '+codigo+').', mtInformation, [mbOK], 0);
    Abort;
  end;
  result := True;
end;

class function TOrdProducao.JaExisteOrdproducao(tabela: string; cditem: Integer): Boolean;
begin
  result := RegistroExiste(_ordproducao,  _cdit+tabela+'='+inttostr(cditem));
end;

class function TOrdProducao.AcabamentoConcluido: boolean;
var
  itordproducaorecursos : titordproducaorecursolist;
  ordproducao : tordproducao;
  I: Integer;
begin
  itordproducaorecursos := titordproducaorecursolist.create;
  ordproducao := tordproducao.create;
  frmprogressbar := tfrmprogressbar.Create(nil);
  try
   itordproducaorecursos.Ler(_cdtpequipamento+'=2 and cdstitordproducaorecurso=4');
   frmprogressbar.gau.MaxValue := itordproducaorecursos.count;
   frmprogressbar.Show;
   for I := 0 to itordproducaorecursos.count - 1 do
   begin
     frmprogressbar.gau.Progress := i + 1;
     application.ProcessMessages;
     ordproducao.Select(itordproducaorecursos.Items[i].cdordproducao);
     if ordproducao.cdstordproducao <> 7 then
     begin
       ordproducao.cdstordproducao := 7;
       ordproducao.Update;
       ordproducao.RegistrarMudancaStatus;
     end;
   end;
   result := true;
  finally
    freeandnil(itordproducaorecursos);
    freeandnil(ordproducao);
    freeandnil(frmprogressbar);
  end;
end;

function TOrdProducao.AjustarDadosApontamento: boolean;
var
  c : TClasseQuery;
  dti, dtf : TDate;
  cdsaida : string;
begin
  if not dlgDataInicioFinal(dti, dtf) then
  begin
    result := False;
    Exit;
  end;
  ExecutaSQL('update APONTAMENTO set qtduracao=((extract(HOUR FROM HRDURACAO)*60)+extract(minute FROM HRDURACAO)) * 0.01666666666666667 where cdempresa='+empresa.cdempresa.tostring+' and hrduracao is not null');
  frmprogressbar := Tfrmprogressbar.Create(nil);
  c              := TClasseQuery.Create('SELECT CDORDPRODUCAO'+
                                              ',DTEMISSAO'+
                                              ',DTPRVENTREGA'+
                                              ',CDSTORDPRODUCAO'+
                                              ',QTHORAORCADA'+
                                              ',QTHORAPRODUCAO'+
                                              ',CDITPEDIDO '+
                                        'FROM ORDPRODUCAO '+
                                        'WHERE cdempresa='+empresa.cdempresa.tostring+' and DTEMISSAO BETWEEN '+GetDtBanco(dti)+' and '+GetDtBanco(dtf), true);
  try
    frmprogressbar.gau.MaxValue := c.q.RecordCount;
    frmprogressbar.Show;
    while not c.q.Eof do
    begin
      frmprogressbar.pnl.Caption  := 'Processando... Registro '+inttostr(c.q.recno)+' de '+inttostr(c.q.RecordCount);
      frmprogressbar.gau.Progress := c.q.RecNo;
      Application.ProcessMessages;

      cdordproducao := c.q.fieldbyname(_cdordproducao).AsInteger;
      cditpedido    := c.q.fieldbyname(_cditpedido).AsInteger;
      qtitem        := CurrencydoCodigo(_itpedido, c.q.fieldbyname(_cditpedido).AsString, _qtitem);

      c.q.Edit;
      c.q.FieldByName(_dtemissao).AsDateTime     := QRegistro.DatadoCodigo(_pedido, qregistro.inteirodocodigo(_itpedido, c.q.fieldbyname(_cditpedido).AsInteger, _cdpedido), _dtemissao);
      c.q.FieldByName(_dtprventrega).AsDateTime  := QRegistro.DatadoCodigo(_itpedido, c.q.fieldbyname(_cditpedido).asinteger, _dtprventrega);
      if c.q.FieldByName(_dtprventrega).AsDateTime = 0 then
      begin
        c.q.FieldByName(_dtprventrega).Clear;
      end;
      c.q.FieldByName(_qthoraorcada).AsFloat   := RetornaSQLCurrency('SELECT SUM(QTPREPARACAO+QTOPERACAO) FROM itordproducaorecurso WHERE cdempresa='+empresa.cdempresa.tostring+' and cdordproducao='+c.q.fieldbyname(_cd+_ordproducao).AsString);
      c.q.FieldByName(_qthoraproducao).AsFloat := RetornaSQLCurrency('SELECT sum(QTDURACAO) FROM APONTAMENTO WHERE cdempresa='+empresa.cdempresa.tostring+' and HRDURACAO IS NOT NULL and cdordproducao='+c.q.fieldbyname(_cd+_ordproducao).AsString);
      if cditpedido <> 0 then
      begin
        cdsaida := RetornaSQLString('select cdsaida from itsaida where cdempresa='+empresa.cdempresa.tostring+' and cditpedido='+inttostr(cditpedido));
        if cdsaida <> '' then
        begin
          c.q.FieldByName(_cdstordproducao).AsInteger := 8;
          cdordproducao := c.q.FieldByName(_cdordproducao).AsInteger;
          cdstordproducao := c.q.FieldByName(_cdstordproducao).AsInteger;
          RegistrarMudancaStatus;
        end;
      end
      else if c.q.FieldByName(_qthoraproducao).AsFloat > 0 then
      begin
        c.q.FieldByName(_cdstordproducao).AsInteger := 6;
        cdordproducao := c.q.FieldByName(_cdordproducao).AsInteger;
        cdstordproducao := c.q.FieldByName(_cdstordproducao).AsInteger;
        RegistrarMudancaStatus;
      end;
      aplicacao.aplyupdates(c.q);
      c.q.Next;
    end;
    result := True;
  finally
    FreeAndNil(c);
    FreeAndNil(frmprogressbar);
  end;
end;

procedure TOrdProducao.RecriarOPdoMetodoProcessodoProduto;
begin
  ItOrdProducaoCusto.Ler(cdordproducao);
  ItOrdProducaoMaterial.ler(cdordproducao);
  ItOrdProducaoRecurso.Ler(_cdordproducao, cdordproducao);
  ItOrdProducaoCusto.Excluir;
  ItOrdProducaoMaterial.Excluir;
  ItOrdProducaoRecurso.excluir;
  GerarRecursodoProduto;
  GerarMaterialdoProduto;
  GerarMaterialdaFormulacao;
  GerarCustodoProduto;
end;

function TOrdProducao.RegistrarMudancaStatus(boscript: boolean=false):string;
var
  hstordproducao : thstordproducao;
begin
  hstordproducao := thstordproducao.Create;
  try
    hstordproducao.cdordproducao := cdordproducao;
    hstordproducao.cdstordproducao := cdstordproducao;
    result := hstordproducao.insert(boscript);
  finally
    freeandnil(hstordproducao);
  end;
  if tpordproducao.cdtpordproducao = 0 then
  begin
    tpordproducao.Select(cdtpordproducao);
  end;
  if tpordproducao.cdstordproducaogerarestoque = cdstordproducao then
  begin
    GerarEntradaEstoqueProdutoOP(dtemissao);
  end;
  dispararEventoEmailMudancaStatus(cdstordproducao);
end;

function TOrdProducao.copiarde(codigo: integer):boolean;
var
  citordproducaorecurso_, citordproducaomaterial_, citordproducaocusto_,
  citordproducaorecurso, citordproducaomaterial, citordproducaocusto : TClasseQuery;
  procedure inserir_recurso;
  var
    i : Integer;
  begin
    citordproducaorecurso_.q.Open;
    while not citordproducaorecurso_.q.Eof do
    begin
      citordproducaorecurso.q.Insert;
      for i := 0 to citordproducaorecurso.q.FieldCount - 1 do
      begin
        qregistro.set_field_type_assign(citordproducaorecurso_.q, citordproducaorecurso.q, i);
      end;
      RegistraInformacao_(citordproducaorecurso.q);
      citordproducaorecurso.q.FieldByName(_cdordproducao).Asinteger         := cdordproducao;
      citordproducaorecurso.q.FieldByName(_cditordproducaorecurso).AsInteger := qgerar.GerarCodigo(_itordproducaorecurso);
      aplicacao.aplyupdates(citordproducaorecurso.q);
      citordproducaorecurso_.q.Next;
    end;
  end;
  procedure inserir_material;
  var
    i : Integer;
  begin
    citordproducaomaterial_.q.Open;
    while not citordproducaomaterial_.q.Eof do
    begin
      citordproducaomaterial.q.Insert;
      for i := 0 to citordproducaomaterial.q.FieldCount - 1 do
      begin
        qregistro.set_field_type_assign(citordproducaomaterial_.q, citordproducaomaterial.q, i);
      end;
      RegistraInformacao_(citordproducaomaterial.q);
      citordproducaomaterial.q.FieldByName(_cdordproducao).AsInteger          := cdordproducao;
      citordproducaomaterial.q.FieldByName(_cditordproducaomaterial).AsInteger := qgerar.GerarCodigo(_itordproducaomaterial);
      aplicacao.aplyupdates(citordproducaomaterial.q);
      citordproducaomaterial_.q.Next;
    end;
  end;
  procedure inserir_custo;
  var
    i : Integer;
  begin
    citordproducaocusto_.q.Open;
    while not citordproducaocusto_.q.Eof do
    begin
      citordproducaocusto.q.Insert;
      for i := 0 to citordproducaocusto.q.FieldCount - 1 do
      begin
        qregistro.set_field_type_assign(citordproducaocusto_.q, citordproducaocusto.q, i);
      end;
      RegistraInformacao_(citordproducaocusto.q);
      citordproducaocusto.q.FieldByName(_cdordproducao).AsInteger       := cdordproducao;
      citordproducaocusto.q.FieldByName(_cditordproducaocusto).AsInteger := qgerar.GerarCodigo(_itordproducaocusto);
      aplicacao.aplyupdates(citordproducaocusto.q);
      citordproducaocusto_.q.Next;
    end;
  end;
begin
  citordproducaorecurso_  := TClasseQuery.Create(QRetornaSQL.get_select_from(_itordproducaorecurso , codigo, _cdordproducao));
  citordproducaomaterial_ := TClasseQuery.Create(QRetornaSQL.get_select_from(_itordproducaomaterial, codigo, _cdordproducao));
  citordproducaocusto_    := TClasseQuery.Create(QRetornaSQL.get_select_from(_itordproducaocusto   , codigo, _cdordproducao));
  citordproducaorecurso   := TClasseQuery.Create(QRetornaSQL.get_select_from(_itordproducaorecurso , _0), true);
  citordproducaomaterial  := TClasseQuery.Create(QRetornaSQL.get_select_from(_itordproducaomaterial, _0), true);
  citordproducaocusto     := TClasseQuery.Create(QRetornaSQL.get_select_from(_itordproducaocusto   , _0), true);
  try
    inserir_recurso;
    inserir_material;
    inserir_custo;
    result := True;
  finally
    freeandnil(citordproducaorecurso_);
    freeandnil(citordproducaomaterial_);
    freeandnil(citordproducaocusto_);
    freeandnil(citordproducaorecurso);
    freeandnil(citordproducaomaterial);
    freeandnil(citordproducaocusto);
  end;
end;

function TOrdProducao.CorrigirNomeProdutoBeneficiado: boolean;
var
  q : tclassequery;
  produto : tproduto;
begin
  q := tclassequery.create('select cdproduto from itordproducao where cdempresa='+empresa.cdempresa.tostring+' group by cdproduto');
  produto := tproduto.create;
  frmprogressbar := tfrmprogressbar.create(nil);
  try
    frmprogressbar.gau.maxvalue := q.q.recordcount;
    frmprogressbar.show;
    while not q.q.Eof do
    begin
      frmprogressbar.gau.progress := q.q.recno;
      application.ProcessMessages;
      produto.Select(q.q.FieldByName(_cdproduto).AsInteger);
      produto.tpproduto.Select(produto.cdtpproduto);
      produto.GerarNomeAutomaticamente(true);
      produto.Update;
      q.q.Next;
    end;
    result := true;
  finally
    freeandnil(q);
    freeandnil(produto);
    freeandnil(frmprogressbar);
  end;
end;

function TOrdProducao.getCdpedido(codigo: string): string;
begin
   result := RetornaSQLString('select cdpedido from itpedido i inner join ordproducao o on i.cdempresa=o.cdempresa and i.cditpedido=O.cditpedido where i.cdempresa='+empresa.cdempresa.tostring+' and o.cdordproducao='+codigo);
end;

procedure TOrdProducao.CalcularTempoPrevisto;
var
  q : TClasseQuery;
  data: TDate;
  hora : TTime;
begin
  q := TClasseQuery.Create(QRetornaSQL.get_select_from(_itordproducaorecurso, IntToStr(cdordproducao), _cdordproducao)+'order by nusequencia');
  try
    data := dtemissao;
    hora := StrToTime('07:00:00');
    while not q.q.Eof do
    begin
      q.q.Edit;
      if hora + (q.q.fieldbyname(_qtoperacao).AsFloat * StrToTime('01:00:00')) > StrToTime('17:00:00') then
      begin
        data := data + 1;
        if DayOfWeek(data) = 7 then
        begin
          data := data + 2;
        end;
        if DayOfWeek(data) = 1 then
        begin
          data := data + 1;
        end;
        hora := StrToTime('07:00:00');
      end;
      q.q.FieldByName(_DTINICIOPREVISTA).AsDateTime := data;
      q.q.FieldByName(_hrinicioprevista).AsDateTime := hora;
      hora := hora + (q.q.fieldbyname(_qtoperacao).AsFloat * StrToTime('01:00:00'));
      q.q.FieldByName(_dtterminoPREVISTA).AsDateTime := data;
      q.q.FieldByName(_hrterminoprevista).AsDateTime := hora;
      if q.q.FieldByName(_qtliberacao).AsFloat > 0 then
      begin
        data := data + q.q.FieldByName(_qtliberacao).AsFloat;
        if DayOfWeek(data) = 7 then
        begin
          data := data + 2;
        end;
        if DayOfWeek(data) = 1 then
        begin
          data := data + 1;
        end;
        hora := StrToTime('07:00:00');
      end;
      q.q.Post;
      q.q.Next;
    end;
  finally
    freeandnil(q);
  end;
end;

function TOrdProducao.GerarMovtoItordproducao: boolean;
var
  sql : TStrings;
begin
  sql := TStringList.Create;
  try
    sql.Text := itordproducao.ExcluirMovto +
                itordproducao.gerarEntradaEstoque +
                itordproducao.GerarBaixaMateriaPrima(dtemissao);
    if (tpordproducao.cdstordproducaoitordproducao <> 0) and (cdstordproducao <> tpordproducao.cdstordproducaoitordproducao) then
    begin
      cdstordproducao := tpordproducao.cdstordproducaoitordproducao;
      sql.add(update(true));
      sql.Text := sql.Text + RegistrarMudancaStatus(true);
    end;
    result := ExecutaScript(sql);
  finally
    freeandnil(sql);
  end;
end;

function TOrdProducao.GerarMovtoItordproducaoMaterial: boolean;
var
  data : TDate;
begin
  data := dtemissao;
  result := dlgDataBalanco(data) and ItOrdProducaoMaterial.gerarBaixaEstoque(data);
  if result and (tpordproducao.cdstordproducaoitordproducaomat <> 0) and (cdstordproducao <> tpordproducao.cdstordproducaoitordproducaomat) then
  begin
    cdstordproducao := tpordproducao.cdstordproducaoitordproducaomat;
    update;
    RegistrarMudancaStatus;
  end;
end;

procedure TOrdProducao.dispararEventoEmailMudancaStatus(cdstordproducao: integer);
var
  eventoemail : TEventoEmail;
  q : TClasseQuery;
  enviaremail : tenviaremail;
  function makesql:string;
  begin
    Result := LowerCase(eventoemail.dssql);
    Result := substituir(Result, ':'+_cdempresa, cdempresa.tostring);
    result := substituir(Result, ':'+_cdordproducao, inttostr(cdordproducao));
  end;
begin
  if (tpordproducao.cdstordproducaoeventoemail = 0) or (cdstordproducao <> tpordproducao.cdstordproducaoeventoemail) and (tpordproducao.cdeventoemailstordproducao = 0) then
  begin
    Exit;
  end;
  eventoemail := TEventoEmail.create;
  try
    eventoemail.cdeventoemail := tpordproducao.cdeventoemailstordproducao;
    eventoemail.Select;
    if eventoemail.dssql <> '' then
    begin
      q := TClasseQuery.create(makesql);
      try
        eventoemail.dsassunto := eventoemail.TratarAssunto(q.q);
        eventoemail.dstitulo  := eventoemail.TratarTitulo(q.q);
        if eventoemail.boenviarsilenciosamente = _s then
        begin
          enviaremail := tenviaremail.create;
          try
            enviaremail.botexto := false;
            enviaremail.boexcluir_arquivo := false;
            enviaremail.dsanexo := nil;
            enviaremail.boanexo := nil;
            enviaremail.dsdestinatario := eventoemail.dsdestinatario;
            enviaremail.dscc := eventoemail.emailcopia;
            enviaremail.dstitulo := eventoemail.dstitulo;
            enviaremail.dsmensagem := eventoemail.dsassunto;
            enviaremail.nmremetente := usuario.nmusuario;
            enviaremail.nmusuario := usuario.email_.SmtpUser;
            enviaremail.dssenha := usuario.email_.SmtpPass;
            enviaremail.tpenvio := empresa.emaile.envio;
            enviaremail.enviar_email
          finally
            freeandnil(enviaremail);
          end;
        end
        else
        begin
          Formatar_Email(false, eventoemail.dstitulo, eventoemail.dsassunto, '', eventoemail.dsdestinatario, eventoemail.emailcopia, usuario.email_.SmtpUser, usuario.email_.SmtpPass, empresa.emaile.envio);
        end;
      finally
        freeandnil(q);
      end;
    end;
  finally
    freeandnil(eventoemail);
  end
end;

function TOrdProducao.GerarMovtoPesagem(data: TDate; lstcddigitado, lstnulotebag: string): Boolean;
var
  cddigitado, nulotebag : TStrings;
  cdproduto : integer;
  I: Integer;
begin
  cddigitado := tstringlist.create;
  nulotebag  := tstringlist.create;
  try
    cddigitado.Text := lstcddigitado;
    nulotebag.Text  := lstnulotebag;
    itordproducaomaterial.Ler(cdordproducao);
    for I := 0 to itordproducaomaterial.Count - 1 do
    begin
      cdproduto := QRegistro.CodigodoString(_produto, cddigitado[i], _cdalternativo);
      if cdproduto = 0 then
      begin
        cdproduto := StrToInt(cddigitado[i]);
      end;
      itordproducaomaterial.items[i].nubag      := nulotebag[i];
      itordproducaomaterial.items[i].cdproduto  := cdproduto;
      itordproducaomaterial.items[i].cddigitado := cddigitado[i];
      itordproducaomaterial.items[i].Update;
    end;
    itordproducaomaterial.gerarBaixaEstoque(data);
    Result := true;
  finally
    FreeAndNil(nulotebag);
    FreeAndNil(cddigitado);
  end;
end;

destructor TOrdProducao.destroy;
begin
  FreeAndNil(fproduto);
  FreeAndNil(fItOrdProducaoRecurso);
  FreeAndNil(fItOrdProducaoMaterial);
  FreeAndNil(fItOrdproducaoCusto);
  FreeAndNil(fItOrdProducao);
  FreeAndNil(ftpordproducao);
  FreeAndNil(fApontamento);
  inherited;
end;

function TOrdProducao.GerarCorte: boolean;
var
  sql, aux : TStrings;
  I: Integer;
begin
  sql := TStringList.Create; // consistir a quantidade dos produtos acabados com a quantidade do produto da ordem de produção
  aux := tstringlist.create;
  try
    if trunc(qtitem * 10000) < trunc(ItOrdProducao.SumQtitem * 10000) then
    begin
      messagedlg('A quantidade dos itens não pode ser maior do que a quantidade da Ordem de Produção.', mtinformation, [mbok], 0);
      result := false;
      abort;
    end;
    if trunc(qtitem * 10000) > trunc(ItOrdProducao.SumQtitem * 10000) then
    begin
      aplicacao.con2.ExecuteDirect(ItOrdProducao.inserirProdutoRestoQuantidade(cdordproducao, tpordproducao.cdprodutocorte, qtitem - ItOrdProducao.SumQtitem));
    end;
    ItOrdProducao.inserirProdutoInexistente(sql, cdproduto); // inserir produto que não existe com cópia dos dados do produto que está na ordem de produção
    aux.text := ItOrdProducao.gerarEntradaEstoque;
    for I := 0 to aux.count - 1 do
    begin
      sql.add(aux[i]);
    end;
    //texto := ItOrdProducao.gerarEntradaEstoque; // gerar entrada de estoque dos produtos que estão no produto acabado
    aux.text := tmovto.GerarMovtoProdutoOP(cdordproducao, cdproduto, cddigitado, qtitem); // gerar baixa de estoque do produto da ordem de produção
    for I := 0 to aux.count - 1 do
    begin
      sql.add(aux[i]);
    end;
    if sql.Count > 0 then
    begin
      ExecutaScript(sql);
    end;
    result := True;
  finally
    FreeAndNil(sql);
    FreeAndNil(aux);
  end;
end;

class function TOrdProducao.existeRequisicao(codigo: Integer): boolean;
begin
  result := RegistroExiste(_itrim, _cdordproducao+'='+inttostr(codigo));
end;

function TOrdProducao.GerarCotacao(codigo: Integer): integer;
var
  pedidomaterial : TPedidoMaterial;
  i : integer;
begin
  result := 0;
  pedidomaterial := tpedidomaterial.create;
  try
    ItOrdProducaoMaterial.Ler(codigo); // carregar itens da matéria-prima
    for i := 0 to ItOrdProducaoMaterial.Count - 1 do
    begin
      if ItOrdProducaoMaterial.Items[i].ExisteCotacao then // verificar se o item já foi gerado cotação
      begin
        Continue;
      end;
      if pedidomaterial.ItPedidoMaterial.Count = 0 then // gerar cotação
      begin
        pedidomaterial.Insert;
      end;
      pedidomaterial.ItPedidoMaterial.Insert(pedidomaterial.cdpedidomaterial);
      pedidomaterial.ItPedidoMaterial.Items[pedidomaterial.ItPedidoMaterial.Count-1].state          := dsInsert;
      pedidomaterial.ItPedidoMaterial.Items[pedidomaterial.ItPedidoMaterial.Count-1].cdproduto      := ItOrdProducaoMaterial.Items[i].cdproduto;
      pedidomaterial.ItPedidoMaterial.Items[pedidomaterial.ItPedidoMaterial.Count-1].cditordproducaomaterial := ItOrdProducaoMaterial.Items[i].cditordproducaomaterial;
      pedidomaterial.ItPedidoMaterial.Items[pedidomaterial.ItPedidoMaterial.Count-1].cdordproducao  := codigo;
      pedidomaterial.ItPedidoMaterial.Items[pedidomaterial.ItPedidoMaterial.Count-1].cddigitado     := ItOrdProducaoMaterial.Items[i].cddigitado;
      pedidomaterial.ItPedidoMaterial.Items[pedidomaterial.ItPedidoMaterial.Count-1].qtsolicitada   := ItOrdProducaoMaterial.Items[i].qtitem;
      pedidomaterial.ItPedidoMaterial.Items[pedidomaterial.ItPedidoMaterial.Count-1].qtpeca         := ItOrdProducaoMaterial.Items[i].qtpeca;
      pedidomaterial.ItPedidoMaterial.Items[pedidomaterial.ItPedidoMaterial.Count-1].qtpesounitario := ItOrdProducaoMaterial.Items[i].qtpesounitario;
      pedidomaterial.ItPedidoMaterial.Items[pedidomaterial.ItPedidoMaterial.Count-1].dsformula      := ItOrdProducaoMaterial.Items[i].dsformula;
      pedidomaterial.ItPedidoMaterial.Items[pedidomaterial.ItPedidoMaterial.Count-1].dsobservacao   := ItOrdProducaoMaterial.Items[i].dsobservacao;
    end;
    if pedidomaterial.ItPedidoMaterial.Count > 0 then
    begin
      pedidomaterial.insert;
      for i := 0 to pedidomaterial.itpedidomaterial.count - 1 do
      begin
        pedidomaterial.itpedidomaterial.Items[i].insert;
      end;
      result := pedidomaterial.cdpedidomaterial;
    end;
  finally
    FreeAndNil(pedidomaterial);
  end;
end;

function TOrdProducao.GerarRequisicao(codigo: Integer): Integer;
var
  rim : trim;
  i : integer;
begin
  result := 0;
  rim := trim.create;
  try
    ItOrdProducaoMaterial.Ler(codigo); // carregar itens da matéria-prima
    for i := 0 to ItOrdProducaoMaterial.Count - 1 do
    begin
      if ItOrdProducaoMaterial.Items[i].ExisteRequisicao then // verificar se o item já foi gerado cotação
      begin
        Continue;
      end;
      if rim.Itrim.Count = 0 then // gerar cotação
      begin
        rim.new;
        rim.dtemissao := DtBanco;
        rim.cdstrim   := 1;
        rim.cdtprim   := 1;
        rim.cdfuncionario := usuario.funcionario.cdfuncionario;
      end;
      rim.Itrim.Insert(rim.cdrim);
      rim.Itrim.Items[rim.Itrim.Count-1].state          := dsInsert;
      rim.Itrim.Items[rim.Itrim.Count-1].cdproduto      := ItOrdProducaoMaterial.Items[i].cdproduto;
      rim.Itrim.Items[rim.Itrim.Count-1].cdordproducao  := ItOrdProducaoMaterial.Items[i].cdordproducao;
      rim.Itrim.Items[rim.Itrim.Count-1].cditordproducaomaterial := ItOrdProducaoMaterial.Items[i].cditordproducaomaterial;
      rim.Itrim.Items[rim.Itrim.Count-1].cddigitado     := ItOrdProducaoMaterial.Items[i].cddigitado;
      rim.Itrim.Items[rim.Itrim.Count-1].qtitem         := ItOrdProducaoMaterial.Items[i].qtitem;
      rim.Itrim.Items[rim.Itrim.Count-1].dtprevista     := ItOrdProducaoMaterial.Items[i].dtpreventrega;
    end;
    if (rim.Itrim.Count > 0) and rim.salvar then
    begin
      result := rim.cdrim;
    end;
  finally
    freeandnil(rim);
  end;
end;

function TOrdProducao.GerarMaterialdaFormulacao: boolean;
var
  produtoformulacao : TprodutoformulacaoList;
  itformulacao : TItformulacaoList;
  i, x : Integer;
begin
  Result := False;
  produtoformulacao   := TprodutoformulacaoList.Create;
  itformulacao        := TItformulacaoList.create;
  try
    produtoformulacao.Ler(cdproduto);
    for i := 0 to produtoformulacao.count - 1 do
    begin
      if (cdformulacao <> 0) and (produtoformulacao.Items[i].cdformulacao <> cdformulacao) then
      begin
        Continue;
      end;
      itformulacao.Ler(produtoformulacao.Items[i].cdformulacao);
      for x := 0 to itformulacao.count - 1 do
      begin
        ItOrdProducaoMaterial.New;
        ItOrdProducaoMaterial.Items[ItOrdProducaoMaterial.count-1].cditordproducaomaterial := QGerar.GerarCodigo(_itordproducaomaterial);
        ItOrdProducaoMaterial.Items[ItOrdProducaoMaterial.count-1].cdordproducao   := cdordproducao;
        ItOrdProducaoMaterial.Items[ItOrdProducaoMaterial.count-1].cdproduto       := itformulacao.Items[x].cdproduto;
        ItOrdProducaoMaterial.Items[ItOrdProducaoMaterial.count-1].cddigitado      := itformulacao.Items[x].cddigitado;
        ItOrdProducaoMaterial.Items[ItOrdProducaoMaterial.count-1].cdformulacao    := itformulacao.Items[x].cdformulacao;
        ItOrdProducaoMaterial.Items[ItOrdProducaoMaterial.count-1].cdtpequipamento := produtoformulacao.Items[i].cdtpequipamento;
        ItOrdProducaoMaterial.Items[ItOrdProducaoMaterial.count-1].qtconsumo       := 0;
        ItOrdProducaoMaterial.Items[ItOrdProducaoMaterial.count-1].qtitem          := itformulacao.Items[x].qtitem * qtitem;
        ItOrdProducaoMaterial.Items[ItOrdProducaoMaterial.count-1].qtitem2         := 0;
        ItOrdProducaoMaterial.Items[ItOrdProducaoMaterial.count-1].qtpeca          := 0;
        ItOrdProducaoMaterial.Items[ItOrdProducaoMaterial.count-1].vltotal         := 0;
        ItOrdProducaoMaterial.Items[ItOrdProducaoMaterial.count-1].vlicms          := 0;
        ItOrdProducaoMaterial.Items[ItOrdProducaoMaterial.count-1].vlipi           := 0;
        ItOrdProducaoMaterial.Items[ItOrdProducaoMaterial.count-1].vlfrete         := 0;
        ItOrdProducaoMaterial.Items[ItOrdProducaoMaterial.count-1].vlfinal         := 0;
        ItOrdProducaoMaterial.Items[ItOrdProducaoMaterial.count-1].vlpis           := 0;
        ItOrdProducaoMaterial.Items[ItOrdProducaoMaterial.count-1].vlcofins        := 0;
        ItOrdProducaoMaterial.Items[ItOrdProducaoMaterial.count-1].Insert;
        result := True;
      end;
    end;
  finally
    FreeAndNil(produtoformulacao);
    FreeAndNil(itformulacao);
  end;
end;

function TOrdProducao.GerarMaterialdoItorcamento: boolean;
var
  itpedido : TITPedido;
  itorcamentomaterial : TitorcamentomaterialList;
  i : Integer;
begin
  result := False;
  itpedido            := TITPedido.create;;
  itorcamentomaterial := TitorcamentomaterialList.Create;
  try
    itpedido.Select(cditpedido);
    itorcamentomaterial.Ler(itpedido.cditorcamento);
    for i := 0 to itorcamentomaterial.Count - 1 do
    begin
      ItOrdProducaoMaterial.New;
      ItOrdProducaoMaterial.Items[ItOrdProducaoMaterial.count-1].cditordproducaomaterial := QGerar.GerarCodigo(_itordproducaomaterial);
      ItOrdProducaoMaterial.Items[ItOrdProducaoMaterial.count-1].cdordproducao := cdordproducao;
      ItOrdProducaoMaterial.Items[ItOrdProducaoMaterial.count-1].cdproduto     := itorcamentomaterial.Items[i].cdproduto;
      ItOrdProducaoMaterial.Items[ItOrdProducaoMaterial.count-1].cddigitado    := itorcamentomaterial.Items[i].cddigitado;
      ItOrdProducaoMaterial.Items[ItOrdProducaoMaterial.count-1].qtconsumo     := 0;
      ItOrdProducaoMaterial.Items[ItOrdProducaoMaterial.count-1].qtitem        := itorcamentomaterial.Items[i].qtitem * qtitem;
      ItOrdProducaoMaterial.Items[ItOrdProducaoMaterial.count-1].qtitem2       := 0;
      ItOrdProducaoMaterial.Items[ItOrdProducaoMaterial.count-1].qtpeca        := itorcamentomaterial.Items[i].qtpeca * qtitem;
      ItOrdProducaoMaterial.Items[ItOrdProducaoMaterial.count-1].vltotal       := itorcamentomaterial.Items[i].vltotal * qtitem;
      ItOrdProducaoMaterial.Items[ItOrdProducaoMaterial.count-1].vlicms        := itorcamentomaterial.Items[i].vlicms * qtitem;
      ItOrdProducaoMaterial.Items[ItOrdProducaoMaterial.count-1].vlipi         := itorcamentomaterial.Items[i].vlipi * qtitem;
      ItOrdProducaoMaterial.Items[ItOrdProducaoMaterial.count-1].vlfrete       := itorcamentomaterial.Items[i].vlfrete * qtitem;
      ItOrdProducaoMaterial.Items[ItOrdProducaoMaterial.count-1].vlfinal       := itorcamentomaterial.Items[i].vlfinal * qtitem;
      ItOrdProducaoMaterial.Items[ItOrdProducaoMaterial.count-1].vlpis         := itorcamentomaterial.Items[i].vlpis * qtitem;
      ItOrdProducaoMaterial.Items[ItOrdProducaoMaterial.count-1].vlcofins      := itorcamentomaterial.Items[i].vlcofins * qtitem;
      ItOrdProducaoMaterial.Items[ItOrdProducaoMaterial.count-1].dsformula     := itorcamentomaterial.Items[i].dsformula;
      ItOrdProducaoMaterial.Items[ItOrdProducaoMaterial.count-1].Insert;
      result := True;
    end;
  finally
    FreeAndNil(itpedido);
    FreeAndNil(itorcamentomaterial);
  end;
end;

function TOrdProducao.GerarMaterialdoProduto: boolean;
var
  itprodutomaterial : TitprodutomaterialList;
  i : Integer;
begin
  result := False;
  itprodutomaterial   := TitprodutomaterialList.create;
  try
    itprodutomaterial.Ler(cdproduto);
    for i := 0 to itprodutomaterial.Count - 1 do
    begin
      ItOrdProducaoMaterial.New;
      ItOrdProducaoMaterial.Items[ItOrdProducaoMaterial.count-1].cditordproducaomaterial := QGerar.GerarCodigo(_itordproducaomaterial);
      ItOrdProducaoMaterial.Items[ItOrdProducaoMaterial.count-1].cdordproducao := cdordproducao;
      ItOrdProducaoMaterial.Items[ItOrdProducaoMaterial.count-1].cdproduto     := itprodutomaterial.Items[i].cdprodutomaterial;
      ItOrdProducaoMaterial.Items[ItOrdProducaoMaterial.count-1].cddigitado    := itprodutomaterial.Items[i].cddigitado;
      ItOrdProducaoMaterial.Items[ItOrdProducaoMaterial.count-1].cdtpequipamento := itprodutomaterial.Items[i].cdtpequipamento;
      ItOrdProducaoMaterial.Items[ItOrdProducaoMaterial.count-1].qtconsumo     := 0;
      ItOrdProducaoMaterial.Items[ItOrdProducaoMaterial.count-1].qtitem        := itprodutomaterial.Items[i].qtitem * qtitem;
      ItOrdProducaoMaterial.Items[ItOrdProducaoMaterial.count-1].qtitem2       := itprodutomaterial.Items[i].qtitem2 * qtitem;
      ItOrdProducaoMaterial.Items[ItOrdProducaoMaterial.count-1].qtpeca        := itprodutomaterial.Items[i].qtpeca * qtitem;
      ItOrdProducaoMaterial.Items[ItOrdProducaoMaterial.count-1].vlunitario    := 0;
      ItOrdProducaoMaterial.Items[ItOrdProducaoMaterial.count-1].vltotal       := 0;
      ItOrdProducaoMaterial.Items[ItOrdProducaoMaterial.count-1].vlicms        := 0;
      ItOrdProducaoMaterial.Items[ItOrdProducaoMaterial.count-1].vlipi         := 0;
      ItOrdProducaoMaterial.Items[ItOrdProducaoMaterial.count-1].vlfrete       := 0;
      ItOrdProducaoMaterial.Items[ItOrdProducaoMaterial.count-1].vlfinal       := 0;
      ItOrdProducaoMaterial.Items[ItOrdProducaoMaterial.count-1].vlpis         := 0;
      ItOrdProducaoMaterial.Items[ItOrdProducaoMaterial.count-1].vlcofins      := 0;
      ItOrdProducaoMaterial.Items[ItOrdProducaoMaterial.count-1].Insert;
      result := True;
    end;
  finally
    FreeAndNil(itprodutomaterial);
  end;
end;

function TOrdProducao.GerarRecursodoItorcamento: boolean;
var
  itpedido : TITPedido;
  itorcamentorecurso : TItorcamentoRecursoList;
  i : integer;
begin
  result := False;
  itpedido           := TITPedido.create;
  itorcamentorecurso := TitorcamentorecursoList.Create;
  try
    itpedido.Select(cditpedido);
    itorcamentorecurso.Ler(itpedido.cditorcamento);
    for i := 0 to itorcamentorecurso.Count - 1 do
    begin
      ItOrdProducaoRecurso.New;
      ItOrdProducaoRecurso.Items[ItOrdProducaoRecurso.count-1].cditordproducaorecurso   := QGerar.GerarCodigo(_itordproducaorecurso);
      ItOrdProducaoRecurso.Items[ItOrdProducaoRecurso.count-1].cdordproducao            := cdordproducao;
      ItOrdProducaoRecurso.Items[ItOrdProducaoRecurso.count-1].cdtpequipamento          := itorcamentorecurso.Items[i].cdtpequipamento;
      ItOrdProducaoRecurso.Items[ItOrdProducaoRecurso.count-1].cdtpduracao              := itorcamentorecurso.Items[i].cdtpduracao;
      ItOrdProducaoRecurso.Items[ItOrdProducaoRecurso.count-1].cdstitordproducaorecurso := 1;
      if itorcamentorecurso.Items[i].nusequencia = 1 then
      begin
        ItOrdProducaoRecurso.Items[ItOrdProducaoRecurso.count-1].cdstitordproducaorecurso := 2;
      end;
      ItOrdProducaoRecurso.Items[ItOrdProducaoRecurso.count-1].qtpreparacao             := itorcamentorecurso.Items[i].qtpreparacao * qtitem;
      ItOrdProducaoRecurso.Items[ItOrdProducaoRecurso.count-1].qtoperacao               := itorcamentorecurso.Items[i].qtoperacao * qtitem;
      ItOrdProducaoRecurso.Items[ItOrdProducaoRecurso.count-1].vlpreparacao             := itorcamentorecurso.Items[i].vlpreparacao;
      ItOrdProducaoRecurso.Items[ItOrdProducaoRecurso.count-1].vloperacao               := itorcamentorecurso.Items[i].vloperacao;
      ItOrdProducaoRecurso.Items[ItOrdProducaoRecurso.count-1].vltotaloperacao          := itorcamentorecurso.Items[i].vltotaloperacao * ItOrdProducaoRecurso.Items[ItOrdProducaoRecurso.count-1].qtoperacao;
      ItOrdProducaoRecurso.Items[ItOrdProducaoRecurso.count-1].vltotalpreparacao        := itorcamentorecurso.Items[i].vltotalpreparacao * ItOrdProducaoRecurso.Items[ItOrdProducaoRecurso.count-1].qtpreparacao;
      ItOrdProducaoRecurso.Items[ItOrdProducaoRecurso.count-1].vltotal                  := itorcamentorecurso.Items[i].vltotal;
      ItOrdProducaoRecurso.Items[ItOrdProducaoRecurso.count-1].dsobservacao             := itorcamentorecurso.Items[i].dsobservacao;
      ItOrdProducaoRecurso.Items[ItOrdProducaoRecurso.count-1].nusequencia              := itorcamentorecurso.Items[i].nusequencia;
      ItOrdProducaoRecurso.Items[ItOrdProducaoRecurso.count-1].Insert;
      result := True;
    end;
    if result then
    begin
      qthoraorcada := ItOrdProducaoRecurso.getQthoraorcada;
      Update;
    end;
  finally
    FreeAndNil(itorcamentorecurso);
    FreeAndNil(itpedido);
  end;
end;

function TOrdProducao.GerarRecursodoProduto: boolean;
var
  itprodutorecurso : TItProdutoRecursoList;
  i : integer;
begin
  result := False;
  itprodutorecurso := TitprodutorecursoList.Create;
  try
    itprodutorecurso.Ler(cdproduto);
    if itprodutorecurso.Count > 0 then
    begin
      for i := 0 to itprodutorecurso.Count - 1 do
      begin
        if itprodutorecurso.Items[i].boativado <> _s then
        begin
          Continue;
        end;
        ItOrdProducaoRecurso.New;
        ItOrdProducaoRecurso.Items[ItOrdProducaoRecurso.count-1].cditordproducaorecurso   := QGerar.GerarCodigo(_itordproducaorecurso);
        ItOrdProducaoRecurso.Items[ItOrdProducaoRecurso.count-1].cdordproducao            := cdordproducao;
        ItOrdProducaoRecurso.Items[ItOrdProducaoRecurso.count-1].cdtpequipamento          := itprodutorecurso.Items[i].cdtpequipamento;
        ItOrdProducaoRecurso.Items[ItOrdProducaoRecurso.count-1].cdtpduracao              := itprodutorecurso.Items[i].cdtpduracao;
        ItOrdProducaoRecurso.Items[ItOrdProducaoRecurso.count-1].cdstitordproducaorecurso := 1;
        if itprodutorecurso.Items[i].nusequencia = 1 then
        begin
          ItOrdProducaoRecurso.Items[ItOrdProducaoRecurso.count-1].cdstitordproducaorecurso := 2;
        end;
        ItOrdProducaoRecurso.Items[ItOrdProducaoRecurso.count-1].qtpreparacao             := itprodutorecurso.Items[i].qtpreparacao * qtitem;
        ItOrdProducaoRecurso.Items[ItOrdProducaoRecurso.count-1].qtoperacao               := itprodutorecurso.Items[i].qtoperacao * qtitem;
        ItOrdProducaoRecurso.Items[ItOrdProducaoRecurso.count-1].dsobservacao             := itprodutorecurso.Items[i].dsobservacao;
        ItOrdProducaoRecurso.Items[ItOrdProducaoRecurso.count-1].nusequencia              := itprodutorecurso.Items[i].nusequencia;
        ItOrdProducaoRecurso.Items[ItOrdProducaoRecurso.count-1].cdformulacao             := itprodutorecurso.Items[i].cdformulacao;
        ItOrdProducaoRecurso.Items[ItOrdProducaoRecurso.count-1].cdtpduracaoliberacao     := itprodutorecurso.Items[i].cdtpduracaoliberacao;
        ItOrdProducaoRecurso.Items[ItOrdProducaoRecurso.count-1].Insert;
        result := True;
      end;
    end;
    if result then
    begin
      qthoraorcada := ItOrdProducaoRecurso.getQthoraorcada;
      Update;
    end;
  finally
    FreeAndNil(itprodutorecurso);
  end;
end;

function TOrdProducao.GerarCustodoItorcamento: boolean;
var
  i : Integer;
  itorcamentocusto : TitorcamentocustoList;
  itpedido : TITPedido;
begin
  result := False;
  itorcamentocusto := TitorcamentocustoList.Create;
  itpedido         := TITPedido.create;
  try
    itpedido.Select(cditpedido);
    itorcamentocusto.Ler(itpedido.cditorcamento);
    for i := 0 to itorcamentocusto.Count - 1 do
    begin
      ItOrdProducaoCusto.New;
      ItOrdProducaoCusto.Items[i].cditordproducaocusto := QGerar.GerarCodigo(_itordproducaocusto);
      ItOrdProducaoCusto.Items[i].cdordproducao        := cdordproducao;
      ItOrdProducaoCusto.Items[i].cdproduto            := itorcamentocusto.Items[i].cdproduto;
      ItOrdProducaoCusto.Items[i].vltotal              := itorcamentocusto.Items[i].vltotal * qtitem;
      ItOrdProducaoCusto.Items[i].cddigitado           := itorcamentocusto.Items[i].cddigitado;
      ItOrdProducaoCusto.Items[i].qtitem               := itorcamentocusto.Items[i].qtitem * qtitem;
      ItOrdProducaoCusto.Items[i].vlunitario           := itorcamentocusto.Items[i].vlunitario;
      ItOrdProducaoCusto.Items[i].qtdias               := 0;
      ItOrdProducaoCusto.Items[i].nusequencia          := 1;
      ItOrdProducaoCusto.Items[i].dsobservacao         := itorcamentocusto.Items[i].dsobservacao;
      ItOrdProducaoCusto.Items[i].Insert;
      result := True;
    end;
    if result then
    begin
      nudiascusto := ItOrdProducaoCusto.getNudiascusto;
      Update;
    end;
  finally
    FreeAndNil(itorcamentocusto);
    FreeAndNil(itpedido);
  end;
end;

function TOrdProducao.GerarCustodoProduto: boolean;
var
  i : Integer;
  itprodutocusto : TitprodutocustoList;
begin
  result := False;
  itprodutocusto := TitprodutocustoList.Create;
  try
    itprodutocusto.Ler(cdproduto);
    for i := 0 to itprodutocusto.Count - 1 do
    begin
      ItOrdProducaoCusto.New;
      ItOrdProducaoCusto.Items[i].cditordproducaocusto := QGerar.GerarCodigo(_itordproducaocusto);
      ItOrdProducaoCusto.Items[i].cdordproducao        := cdordproducao;
      ItOrdProducaoCusto.Items[i].cdproduto            := itprodutocusto.Items[i].cdproduto;
      itOrdProducaoCusto.Items[i].vltotal              := 0;
      ItOrdProducaoCusto.Items[i].cddigitado           := itprodutocusto.Items[i].cddigitado;
      ItOrdProducaoCusto.Items[i].qtitem               := itprodutocusto.Items[i].qtitem * qtitem;
      ItOrdProducaoCusto.Items[i].vlunitario           := 0;
      ItOrdProducaoCusto.Items[i].qtdias               := 0;
      ItOrdProducaoCusto.Items[i].nusequencia          := 1;
      ItOrdProducaoCusto.Items[i].dsobservacao         := '';
      ItOrdProducaoCusto.Items[i].Insert;
      result := True;
    end;
    if result then
    begin
      nudiascusto := ItOrdProducaoCusto.getNudiascusto;
      Update;
    end;
  finally
    FreeAndNil(itprodutocusto);
  end;
end;

function TOrdProducao.GerarOrdProducaoPedido(cditem, cdtipo:Integer; qtd: double): integer;
var
  itpedido : Titpedido;
begin
  itpedido := titpedido.create;
  try
    itpedido.Select(cditem);
    result                   := QGerar.GerarCodigo(_ordproducao);
    cdordproducao            := result;
    dtemissao                := qregistro.datadocodigo(_pedido, itpedido.cdpedido, _dtemissao);
    qtitem                   := qtd;
    dtprventrega             := itpedido.dtprventrega;
    cditpedido               := cditem;
    cdorcamento              := qregistro.InteirodoCodigo(_itorcamento, itpedido.cditorcamento, _cdorcamento);
    dsdesenho                := itpedido.dsdesenho;
    dsdesenhoposicao         := qregistro.StringdoCodigo(_itorcamento, itpedido.cditorcamento, _dsdesenhoposicao);
    dsdesenhorevisao         := qregistro.StringdoCodigo(_itorcamento, itpedido.cditorcamento, _dsdesenhorevisao);
    qtpeca                   := itpedido.qtpeca;
    cdtpordproducao          := cdtipo;
    cdstordproducao          := qregistro.CodigoStatusNovo(_ordproducao);
    dsobservacao             := qregistro.StringdoCodigo(_itorcamento, itpedido.cditorcamento, _dsobservacao);
    cdproduto                := itpedido.cdproduto;
    cddigitado               := itpedido.cddigitado;
    qtquociente              := 1;
    //cdfuncionariosolicitante := usuario.funcionario.cdfuncionario;
    tpordproducao.Select(cdtpordproducao);
    cdfuncionario := tpordproducao.cdfuncionarioresponsavel;
    Insert;
    GerarRecursodoItorcamento;
    GerarMaterialdoItorcamento;
    GerarCustodoItorcamento;
    if (ItOrdProducaoRecurso.Count = 0) and (ItOrdProducaoMaterial.Count = 0) and (ItOrdProducaoCusto.Count = 0) then
    begin
      GerarRecursodoProduto;
      GerarMaterialdoProduto;
      GerarMaterialdaFormulacao;
      GerarCustodoProduto;
    end;
  finally
    FreeAndNil(itpedido);
  end;
end;

function TOrdProducao.GerarOrdProducaoRequisicaoproducao(cditem, cdtipo: Integer; qtd: Double; cdformulacao_: Integer=0): Integer;
var
  itrequisicaoproducao : titrequisicaoproducao;
begin
  itrequisicaoproducao := TItRequisicaoProducao.create;
  try
    itrequisicaoproducao.Select(cditem);
    result                   := QGerar.GerarCodigo(_ordproducao);
    cdordproducao            := result;
    dtemissao                := QRegistro.DatadoCodigo(_requisicaoproducao, itrequisicaoproducao.cdrequisicaoproducao, _dtemissao);
    qtitem                   := qtd;
    dtprventrega             := itrequisicaoproducao.dtprventrega;
    cditrequisicaoproducao   := itrequisicaoproducao.cditrequisicaoproducao;
    cdtpordproducao          := cdtipo;
    cdstordproducao          := qregistro.CodigoStatusNovo(_ordproducao);
    cdproduto                := itrequisicaoproducao.cdproduto;
    cddigitado               := itrequisicaoproducao.cddigitado;
    qtquociente              := 1;
    cdformulacao             := cdformulacao_;
    if cdformulacao <> 0 then
    begin
      nurevisao := QRegistro.StringdoCodigo(_formulacao, cdformulacao, _nurevisao);
    end;
    cdfuncionariosolicitante := usuario.funcionario.cdfuncionario;
    tpordproducao.Select(cdtpordproducao);
    cdfuncionario := tpordproducao.cdfuncionarioresponsavel;
    Insert;
    GerarRecursodoProduto;
    GerarMaterialdoProduto;
    GerarMaterialdaFormulacao;
    GerarCustodoProduto;
  finally
    FreeAndNil(itrequisicaoproducao);
  end;
end;

function TOrdProducao.GerarMaterialdoItformulacao(cdformulacao: Integer; cdtpequipamento:Integer=0; qtd : Double=0): Boolean;
var
  itformulacao : TItformulacaoList;
  x : Integer;
begin
  Result := False;
  itformulacao := TItformulacaoList.create;
  try
    itformulacao.Ler(cdformulacao);
    for x := 0 to itformulacao.count - 1 do
    begin
      ItOrdProducaoMaterial.Items[ItOrdProducaoMaterial.count-1].cditordproducaomaterial := QGerar.GerarCodigo(_itordproducaomaterial);
      ItOrdProducaoMaterial.Items[ItOrdProducaoMaterial.count-1].cdordproducao   := cdordproducao;
      ItOrdProducaoMaterial.Items[ItOrdProducaoMaterial.count-1].cdproduto       := itformulacao.Items[x].cdproduto;
      ItOrdProducaoMaterial.Items[ItOrdProducaoMaterial.count-1].cddigitado      := itformulacao.Items[x].cddigitado;
      ItOrdProducaoMaterial.Items[ItOrdProducaoMaterial.count-1].cdformulacao    := itformulacao.Items[x].cdformulacao;
      ItOrdProducaoMaterial.Items[ItOrdProducaoMaterial.count-1].cdtpequipamento := cdtpequipamento;
      ItOrdProducaoMaterial.Items[ItOrdProducaoMaterial.count-1].qtconsumo       := 0;
      ItOrdProducaoMaterial.Items[ItOrdProducaoMaterial.count-1].qtitem          := itformulacao.Items[x].qtitem * qtd;
      ItOrdProducaoMaterial.Items[ItOrdProducaoMaterial.count-1].qtitem2         := 0;
      ItOrdProducaoMaterial.Items[ItOrdProducaoMaterial.count-1].qtpeca          := 0;
      ItOrdProducaoMaterial.Items[ItOrdProducaoMaterial.count-1].vltotal         := 0;
      ItOrdProducaoMaterial.Items[ItOrdProducaoMaterial.count-1].vlicms          := 0;
      ItOrdProducaoMaterial.Items[ItOrdProducaoMaterial.count-1].vlipi           := 0;
      ItOrdProducaoMaterial.Items[ItOrdProducaoMaterial.count-1].vlfrete         := 0;
      ItOrdProducaoMaterial.Items[ItOrdProducaoMaterial.count-1].vlfinal         := 0;
      ItOrdProducaoMaterial.Items[ItOrdProducaoMaterial.count-1].vlpis           := 0;
      ItOrdProducaoMaterial.Items[ItOrdProducaoMaterial.count-1].vlcofins        := 0;
      ItOrdProducaoMaterial.Items[ItOrdProducaoMaterial.count-1].Insert;
      result := True;
    end;
  finally
    FreeAndNil(itformulacao);
  end;
end;

function TOrdProducao.GerarEntradaEstoqueProdutoOP(data: TDate=0): Boolean;
var
  movto : TMovto;
begin
  result := False;
  if cdproduto = 0 then
  begin
    exit;
  end;
  if qtitem = qtproducao then
  begin
    Exit;
  end;
  if data = 0 then
  begin
    data := dtbanco;
  end;
  movto := TMovto.create;
  try
    movto.cdmovto       := QGerar.GerarCodigo(_movto);
    movto.cdtpmovto     := 2;
    movto.cdordproducao := cdordproducao;
    movto.dtemissao     := data;
    movto.Insert;

    movto.ItMovto.New;
    movto.ItMovto.Items[0].cdmovto   := movto.cdmovto;
    movto.ItMovto.Items[0].cditmovto := QGerar.GerarCodigo(_itmovto);
    movto.ItMovto.Items[0].cdproduto := cdproduto;
    movto.ItMovto.Items[0].qtitem     := qtitem - qtproducao;
    movto.ItMovto.Items[0].cddigitado := cddigitado;
    movto.ItMovto.Items[0].Insert;

    qtproducao := qtproducao + movto.ItMovto.Items[0].qtitem;
    Update;
    Result := True;
  finally
    FreeAndNil(movto);
  end;
end;

function TOrdProducao.nuestruturalSomenteNesteApontamento(codigo: integer): Boolean;
var
  i : Integer;
begin
  result := true;
  Apontamento.Ler(_cdordproducao, cdordproducao);
  for i := 0 to apontamento.Count - 1 do
  begin
    if (Apontamento.Items[i].nuestrutural <> '') and (apontamento.Items[i].cdapontamento <> codigo) then
    begin
      result := false;
      Break;
    end;
  end;
end;

class function TOrdProducao.getCdordproducaoComEstrutura(Data: TDate; cdtpequipamento, cdproduto: integer; nuestrutural: string):Integer;
begin
  result := RetornaSQLInteger('select first 1 ordproducao.cdordproducao '+
                              'from ordproducao '+
                              'inner join stordproducao on stordproducao.cdstordproducao=ordproducao.cdstordproducao and stordproducao.cdempresa=ordproducao.cdempresa '+
                              'inner join itordproducaorecurso on itordproducaorecurso.cdempresa=ordproducao.cdempresa and itordproducaorecurso.cdordproducao=ordproducao.cdordproducao '+
                              'where ordproducao.cdempresa='+empresa.cdempresa.tostring+' '+
                              'and ordproducao.dtemissao<='+getdtbanco(Data)+' '+
                              'and itordproducaorecurso.cdtpequipamento='+cdtpequipamento.tostring+' '+
                              'and ordproducao.cdtpordproducao=1 '+
                              'and itordproducaorecurso.cdstitordproducaorecurso in (1,2) '+
                              'and ordproducao.cdproduto='+inttostr(cdproduto)+' '+
                              'and ordproducao.nuestrutural='+quotedstr(nuestrutural)+' '+
                              'and stordproducao.boapontamento=''S'' '+
                              'order by ordproducao.dtemissao desc');
end;

class function TOrdProducao.getCdordproducaoSemEstrutura(Data: TDate; cdtpequipamento, cdproduto: integer; lstapontamento: tapontamentolist):Integer;
var
  sql : string;
begin
  sql := 'select first 1 ordproducao.cdordproducao '+
          'from ordproducao '+
          'inner join stordproducao on stordproducao.cdempresa=ordproducao.cdempresa and ordproducao.cdstordproducao=stordproducao.cdstordproducao '+
          'inner join itordproducaorecurso on itordproducaorecurso.cdempresa=ordproducao.cdempresa and itordproducaorecurso.cdordproducao=ordproducao.cdordproducao '+
          'where ordproducao.cdempresa='+empresa.cdempresa.tostring+' '+
          'and ordproducao.dtemissao<='+getdtbanco(data)+' '+
          'and ordproducao.cdtpordproducao=1 '+
          'and itordproducaorecurso.cdstitordproducaorecurso=2 '+
          'and itordproducaorecurso.cdtpequipamento='+cdtpequipamento.tostring+' '+
          'and ordproducao.cdproduto='+inttostr(cdproduto)+' '+
          'and stordproducao.boapontamento=''S'' '+
          'and ordproducao.nuestrutural is null ';
  if lstapontamento.listacdordproducao <> '' then
  begin
    sql := sql + 'and (not ordproducao.cdordproducao in ('+lstapontamento.listacdordproducao+')) ';
  end;
  sql := sql +
          'order by ordproducao.dtemissao desc';
  result := RetornaSQLInteger(sql);
end;

function TOrdProducaoList.GetItem(Index: Integer): TOrdProducao;
begin
  Result := TOrdProducao(Inherited Items[Index]);
end;

function TOrdProducaoList.Ler(DataSet: TDataset): boolean;
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

function TOrdProducaoList.Ler(codigo: Integer; cdfield: string): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_OrdProducao, codigo, cdfield));
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

function TOrdProducaoList.New: TOrdProducao;
begin
  Result := TOrdProducao.Create;
  Add(Result);
end;

procedure TOrdProducaoList.SetItem(Index: Integer; const Value: TOrdProducao);
begin
  Put(Index, Value);
end;

function TOrdProducaoList.Ler(sqlwhere: string): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_where(_ordproducao, sqlwhere));
  try
    result := Ler(q.q);
  finally
    FreeAndNil(q);
  end;
end;

end.
