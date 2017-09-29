unit ORM.Pedido;

interface

uses
  system.UITypes, System.Actions,
  Forms, Classes, sysutils, Controls, Dialogs, Contnrs,
  DB, DBClient,
  rotina.Rotinas, dialogo.progressbar, rotina.Registro, uconstantes, rotina.datahora, rotina.strings, dialogo.SelecionarEntrada,
  orm.ordproducao, orm.empresa, classe.registrainformacao, classe.gerar, orm.produto,
  classe.query, classe.aplicacao, classe.executasql, orm.condpagto, orm.tpcobranca, orm.cliente,
  orm.funcionario, orm.tpfrete, rotina.retornasql, classe.dao, orm.ITPedido, orm.tppedido,
  orm.stpedido,orm.PedidoDuplicata;

Type
  TPedido = class(TRegistroQuipos)
  private
    FItPedido : TItpedidoList;
    ftppedido : TTPPedido;
    fcdpedido : Integer;
    fcdstpedido : integer;
    fcdcondpagto : Integer;
    fcdtpfrete : String;
    fcdcliente : LargeInt;
    fcdrepresentante : Integer;
    fcdtppedido : Integer;
    fcdtpcobranca : Integer;
    fcdfuncionario : Integer;
    fcdtransportadora : largeint;
    fcdpaciente : integer;
    fcdusuariol : Integer;
    fcdcomputadorl : Integer;
    fcdclienteentrega : LargeInt;
    fcditcontcliente : Integer;
    fcdfornecedor : LargeInt;
    fcdmunicipio : Integer;
    fcduf : integer;
    fcdorcamento : Integer;
    fcdprofissional : Integer;
    fnupedido : string;
    fdtemissao : TDate;
    fprcomissao : Double;
    fdtfechamento : TDate;
    fdtprventrega : TDate;
    fvltotal : Currency;
    fvlipi : Currency;
    fvltotalcipi : Currency;
    fvldesconto : Currency;
    fprdesconto : Double;
    fpsbruto : Double;
    fvlproduto : Currency;
    fdsobservacao : string;
    fdsobsinterna : string;
    fnucotacao : string;
    fbocertificado : String;
    fnudias : integer;
    fvlfrete : Currency;
    fvlicmssubtrib : Currency;
    fqtpedido : Double;
    fqtatendido : Double;
    fvlcomissao : Currency;
    fvlicms : Currency;
    fdsreferencia : string;
    ftsliberado : TDateTime;
    fnmredespacho : string;
    fdsendereco : string;
    fdsnumero : string;
    fnmbairro : string;
    fnucxpostal : string;
    fnucep : string;
    fnufone : string;
    fnufax : string;
    fnmcontato : string;
    fdscomplemento : string;
    fcdprofissionalcoordenador : Integer;
    fboapto : String;
    fcdtpcredito : Integer;
    fcdtpcomercial : Integer;
    fvlacrescimo : Currency;
    fstpedido: tstpedido;
    fPedidoDuplicata: TPedidoDuplicataList;
    fcondpagto: tcondpagto;
    ftpcobranca: ttpcobranca;
    fCliente: TCliente;
    fclienteentrega: TCliente;
    ffuncionario: tfuncionario;
    ftpfrete: ttpfrete;
  public
    [keyfield]
    property cdpedido : Integer read fcdpedido write fcdpedido;
    [fk]
    property cdstpedido : integer read fcdstpedido write fcdstpedido;
    [fk]
    property cdcondpagto : Integer read fcdcondpagto write fcdcondpagto;
    [fk]
    property cdtpfrete : String read fcdtpfrete write fcdtpfrete;
    [fk]
    property cdcliente : LargeInt read fcdcliente write fcdcliente;
    [fk]
    property cdrepresentante : Integer read fcdrepresentante write fcdrepresentante;
    [fk]
    property cdtppedido : Integer read fcdtppedido write fcdtppedido;
    [fk]
    property cdtpcobranca : Integer read fcdtpcobranca write fcdtpcobranca;
    [fk]
    property cdfuncionario : Integer read fcdfuncionario write fcdfuncionario;
    [fk]
    property cdtransportadora : largeint read fcdtransportadora write fcdtransportadora;
    [fk]
    property cdpaciente : integer read fcdpaciente write fcdpaciente;
    [fk]
    property cdusuariol : Integer read fcdusuariol write fcdusuariol;
    [fk]
    property cdcomputadorl : Integer read fcdcomputadorl write fcdcomputadorl;
    [fk]
    property cdclienteentrega : LargeInt read fcdclienteentrega write fcdclienteentrega;
    [fk]
    property cditcontcliente : Integer read fcditcontcliente write fcditcontcliente;
    [fk]
    property cdfornecedor : LargeInt read fcdfornecedor write fcdfornecedor;
    [fk]
    property cdmunicipio : Integer read fcdmunicipio write fcdmunicipio;
    [fk]
    property cduf : integer read fcduf write fcduf;
    [fk]
    property cdorcamento : Integer read fcdorcamento write fcdorcamento;
    [fk]
    property cdprofissional : Integer read fcdprofissional write fcdprofissional;
    property funcionario : tfuncionario read ffuncionario write ffuncionario;
    property clienteentrega : TCliente read fclienteentrega write fclienteentrega;
    property cliente : TCliente read fCliente write fCliente;
    property tpcobranca : ttpcobranca read ftpcobranca write ftpcobranca;
    property tpfrete : ttpfrete read ftpfrete write ftpfrete;
    property stpedido : tstpedido read fstpedido write fstpedido;
    property tppedido : TTPPedido read ftppedido write ftppedido;
    property itpedido : TItPedidoList read FItPedido write FItPedido;
    property condpagto : tcondpagto read fcondpagto write fcondpagto;
    property pedidoduplicata : TPedidoDuplicataList read fPedidoDuplicata write FPedidoDuplicata;
    property nupedido : string read fnupedido write fnupedido;
    property dtemissao : TDate read fdtemissao write fdtemissao;
    property prcomissao : Double read fprcomissao write fprcomissao;
    property dtfechamento : TDate read fdtfechamento write fdtfechamento;
    property dtprventrega : TDate read fdtprventrega write fdtprventrega;
    property vltotal : Currency read fvltotal write fvltotal;
    property vlipi : Currency read fvlipi write fvlipi;
    property vltotalcipi : Currency read fvltotalcipi write fvltotalcipi;
    property vldesconto : Currency read fvldesconto write fvldesconto;
    property prdesconto : Double read fprdesconto write fprdesconto;
    property psbruto : Double read fpsbruto write fpsbruto;
    property vlproduto : Currency read fvlproduto write fvlproduto;
    property dsobservacao : string read fdsobservacao write fdsobservacao;
    property dsobsinterna : string read fdsobsinterna write fdsobsinterna;
    property nucotacao : string read fnucotacao write fnucotacao;
    property bocertificado : String read fbocertificado write fbocertificado;
    property nudias : integer read fnudias write fnudias;
    property vlfrete : Currency read fvlfrete write fvlfrete;
    property vlicmssubtrib : Currency read fvlicmssubtrib write fvlicmssubtrib;
    property qtpedido : Double read fqtpedido write fqtpedido;
    property qtatendido : Double read fqtatendido write fqtatendido;
    property vlcomissao : Currency read fvlcomissao write fvlcomissao;
    property vlicms : Currency read fvlicms write fvlicms;
    property dsreferencia : string read fdsreferencia write fdsreferencia;
    property tsliberado : TDateTime read ftsliberado write ftsliberado;
    property nmredespacho : string read fnmredespacho write fnmredespacho;
    property dsendereco : string read fdsendereco write fdsendereco;
    property dsnumero : string read fdsnumero write fdsnumero;
    property nmbairro : string read fnmbairro write fnmbairro;
    property nucxpostal : string read fnucxpostal write fnucxpostal;
    property nucep : string read fnucep write fnucep;
    property nufone : string read fnufone write fnufone;
    property nufax : string read fnufax write fnufax;
    property nmcontato : string read fnmcontato write fnmcontato;
    property dscomplemento : string read fdscomplemento write fdscomplemento;
    property cdprofissionalcoordenador : Integer read fcdprofissionalcoordenador write fcdprofissionalcoordenador;
    property boapto : String read fboapto write fboapto;
    property cdtpcredito : Integer read fcdtpcredito write fcdtpcredito;
    property cdtpcomercial : Integer read fcdtpcomercial write fcdtpcomercial;
    property vlacrescimo : Currency read fvlacrescimo write fvlacrescimo;
    constructor create;
    destructor destroy; override;
    function ajustarqtpedido:Boolean;
    function copiar(nupedido:string=''):integer;
    function getprfrete(cdtransportadora, cdcliente:string):Double;
    function getcditpedido(cdpedido, cdproduto:integer):integer;
    procedure gerarparcelas;
    function excluir_ordem_producao:Boolean;
    class function Quantidade_pedido_aguardando_aprovacao:integer;
  end;
  TPedidoList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TPedido;
    procedure SetItem(Index: Integer; const Value: TPedido);
  public
    function New: TPedido;
    property Items[Index: Integer]: TPedido read GetItem write SetItem;
    function Ler(codigo:Integer; cdfield:string):Boolean;overload;
    function Ler(DataSet: TDataset):boolean;overload;
    function Ler(sqlwhere: string):Boolean;overload;
  end;

implementation


procedure Tpedido.gerarparcelas;
var
  i: Integer;
begin
  PedidoDuplicata.Clear;
  condpagto.GerarParcela(dtprventrega, vltotal);
  if (cdcondpagto = 0) or (vltotal = 0) or (condpagto.itcondpagto.Count = 0) then
  begin
    Exit;
  end;
  for i := 0 to condpagto.parcela.Count - 1 do
  begin
    pedidoduplicata.New;
    pedidoduplicata.Items[i].cdpedido          := cdpedido;
    PedidoDuplicata.Items[i].dtprorrogacao     := condpagto.parcela.Items[i].dtvencimento;
    PedidoDuplicata.Items[i].dtemissao         := dtprventrega;
    PedidoDuplicata.Items[i].vlsaldo           := condpagto.parcela.Items[i].valor;
    PedidoDuplicata.Items[i].vlpedidoduplicata := condpagto.parcela.Items[i].dtvencimento;
  end;
end;

constructor TPedido.create;
begin
  inherited;
  fcondpagto := tcondpagto.create;
  ftpfrete := ttpfrete.create;
  ffuncionario := tfuncionario.create;
  fclienteentrega := tcliente.create;
  fcliente := tcliente.create;
  ftpcobranca := ttpcobranca.create;
  FItPedido := TItPedidoList.Create;
  fPedidoDuplicata := tPedidoDuplicataList.create;
  ftppedido := TTPPedido.create;
  fstpedido := tstpedido.create;
end;

function TPedido.getcditpedido(cdpedido, cdproduto: integer): integer;
begin
  result := RetornaSQLInteger('select cditpedido from itpedido where cdempresa='+empresa.cdempresa.ToString+' and cdproduto='+cdproduto.ToString+' and cdpedido='+cdpedido.ToString);
  if RetornaSQLInteger('select count(*) from itpedido where cdempresa='+empresa.cdempresa.ToString+' and cdproduto='+cdproduto.ToString+' and cdpedido='+cdpedido.ToString) > 0 then
  begin
    result := selecionar_Entrada(_itpedido, cdpedido.ToString, cdproduto);
  end;
end;

function TPedido.getprfrete(cdtransportadora, cdcliente: string): Double;
var
  cdmunicipio : string;
begin
  result := 0;
  if (cdtransportadora = '') or (cdcliente = '') or (tppedido.boprfretecidade <> _s) then
  begin
    Exit;
  end;
  cdmunicipio := NomedoCodigo(_cliente, cdcliente, _cdmunicipio);
  if cdmunicipio = '' then
  begin
    messagedlg('Município não preenchido no cadastro do Cliente.'#13'Altere o cadastro do cliente para poder continuar.', mtinformation, [mbok], 0);
    Abort;
  end;
  if RetornaSQLInteger('select count(*) from transportadoramunicipio where cdempresa='+empresa.cdempresa.ToString+' and cdtransportadora='+cdtransportadora+' and cdmunicipio='+cdmunicipio) = 0 then
  begin
    messagedlg('Município '+nomedocodigo(_municipio, cdmunicipio)+' do Cliente não está definido o frete para a Transportadora selecionada.'#13'Adicione o município ao frete da Transportadora para poder continuar.', mtinformation, [mbok], 0);
    Abort;
  end;
  result := RetornaSQLCurrency('select prfrete from transportadoramunicipio where cdempresa='+empresa.cdempresa.ToString+' and cdtransportadora='+cdtransportadora+' and cdmunicipio='+cdmunicipio);
end;

function TPedido.ajustarqtpedido: Boolean;
begin
  result := ExecutaSQL('UPDATE PRODUTO SET QTDISPONIVEL=QTESTOQUE where cdempresa='+empresa.cdempresa.ToString);
  if not result then
  begin
    Exit;
  end;
  result := ExecutaSQL('update produto ' +
                       'set qtpedido=coalesce((SELECT SUM(I.qtitem-I.qtatendida) '+
                                              'FROM PEDIDO P '+
                                              'LEFT JOIN ITPEDIDO I ON I.CDPEDIDO=P.CDPEDIDO and i.cdempresa=p.cdempresa '+
                                              'left join stpedido s on s.cdstpedido=p.cdstpedido and s.cdempresa=p.cdempresa '+
                                              'WHERE p.cdempresa='+empresa.cdempresa.ToString+' and s.boestoquedisponivel=''S'' AND I.qtatendida<I.QTITEM '+
                                              'and i.cdproduto=produto.cdproduto), 0) '+
                       'where cdempresa='+empresa.cdempresa.ToString);
  if not result then
  begin
    Exit;
  end;
  result := ExecutaSQL('UPDATE PRODUTO SET QTDISPONIVEL=QTESTOQUE-QTPEDIDO where cdempresa='+empresa.cdempresa.ToString);
end;

function TPedido.copiar(nupedido:string=''): integer;
var
  s, sit, sequipamento, sduplicata, cpedido, citpedido, citpedidoequipamento, cpedidoduplicata : TClasseQuery;
  procedure insert_pedido;
  var
    i : Integer;
  begin
    cpedido.q.Insert;
    for i := 0 to cpedido.q.FieldCount - 1 do
    begin
      qregistro.set_field_type_assign(s.q, cpedido.q, i);
    end;
    RegistraInformacao_(cpedido.q);
    result := qgerar.GerarCodigo(_pedido);
    cpedido.q.FieldByName(_cdpedido).asinteger  := result;
    if nupedido = '' then
    begin
      cpedido.q.FieldByName(_NUPEDIDO).AsInteger := qgerar.GerarCodigo(_nupedido)
    end
    else
    begin
      cpedido.q.FieldByName(_NUPEDIDO).Asstring := nupedido;
    end;
    cpedido.q.FieldByName(_cdstpedido).AsInteger := qregistro.Codigo_status_novo(_pedido);
    cpedido.q.FieldByName(_dtfechamento).Clear;
    aplicacao.aplyupdates(cpedido.q);
  end;
  procedure insert_duplicata;
  var
    i : Integer;
  begin
    while not sduplicata.q.Eof do
    begin
      cpedidoduplicata.q.Insert;
      for i := 0 to cpedidoduplicata.q.FieldCount - 1 do
      begin
        qregistro.set_field_type_assign(sduplicata.q, cpedidoduplicata.q, i);
      end;
      RegistraInformacao_(cpedidoduplicata.q);
      cpedidoduplicata.q.FieldByName(_cdpedido).AsInteger            := result;
      cpedidoduplicata.q.FieldByName(_cdpedido+_duplicata).AsInteger := qgerar.GerarCodigo(_pedido+_duplicata);
      aplicacao.aplyupdates(cpedidoduplicata.q);
      sduplicata.q.Next;
    end;
  end;
  procedure insert_item;
  var
    i : Integer;
  begin
    while not sit.q.Eof do
    begin
      citpedido.q.Insert;
      for i := 0 to citpedido.q.FieldCount - 1 do
      begin
        qregistro.set_field_type_assign(sit.q, citpedido.q, i);
      end;
      RegistraInformacao_(citpedido.q);
      citpedido.q.FieldByName(_cdpedido).AsInteger    := result;
      citpedido.q.FieldByName(_cditpedido).AsInteger  := qgerar.GerarCodigo(_itpedido);
      citpedido.q.FieldByName(_qtatendida).AsFloat    := 0;
      citpedido.q.FieldByName(_QTCONFERENCIA).AsFloat := 0;
      sequipamento.q.Close;
      sequipamento.q.sql.text := QRetornaSQL.get_select_from(_itpedidoequipamento, sit.q.fieldbyname(_cditpedido).AsString, _cditpedido);
      sequipamento.q.Open;
      while not sequipamento.q.Eof do
      begin
        citpedidoequipamento.q.Insert;
        for i := 0 to citpedidoequipamento.q.FieldCount - 1 do
        begin
          qregistro.set_field_type_assign(sequipamento.q, citpedidoequipamento.q, i);
        end;
        RegistraInformacao_(citpedidoequipamento.q);
        citpedidoequipamento.q.FieldByName(_cditpedido).AsString              := citpedido.q.FieldByName(_cditpedido).AsString;
        citpedidoequipamento.q.FieldByName(_cditpedido+_equipamento).AsInteger := qgerar.GerarCodigo(_itpedido+_equipamento);
        sequipamento.q.Next;
      end;
      sit.q.Next;
    end;
    aplicacao.aplyupdates(citpedido.q);
  end;
begin
  s                    := TClasseQuery.Create(QRetornaSQL.get_select_from(_pedido, cdpedido));
  sit                  := TClasseQuery.Create(QRetornaSQL.get_select_from(_itpedido, cdpedido, _cdpedido));
  sequipamento         := TClasseQuery.Create;
  sduplicata           := TClasseQuery.Create(QRetornaSQL.get_select_from(_pedidoduplicata, cdpedido, _cdpedido));

  cpedido              := TClasseQuery.Create(QRetornaSQL.get_select_from(_pedido, _0), true);
  citpedido            := TClasseQuery.Create(QRetornaSQL.get_select_from(_itpedido, _0), true);
  citpedidoequipamento := TClasseQuery.Create(QRetornaSQL.get_select_from(_itpedidoequipamento, _0), true);
  cpedidoduplicata     := TClasseQuery.Create(QRetornaSQL.get_select_from(_pedidoduplicata, _0), true);
  try
    insert_pedido;
    insert_duplicata;
    insert_item;
  finally
    freeandnil(s);
    freeandnil(sit);
    freeandnil(sequipamento);
    freeandnil(sduplicata);
    freeandnil(cpedido);
    freeandnil(citpedido);
    freeandnil(citpedidoequipamento);
    freeandnil(cpedidoduplicata);
  end;
end;

function TPedido.excluir_ordem_producao:boolean;
var
  nmstpedidonew: string;
  cdstpedidonew: integer;
  q : TClasseQuery;
  sql : TStrings;
begin
  cdstpedidonew := qregistro.InteirodoCodigo(_pedido, cdpedido, _cdstpedido);
  nmstpedidonew := qregistro.NomedoCodigo(_stpedido, cdstpedidonew);
  if (cdstpedido = cdstpedidonew) or (nmstpedidonew <> UpperCase(_cancelado)) then
  begin
    Result := False;
    Exit;
  end;
  q      := TClasseQuery.create;
  result := false;
  sql    := TStringList.Create;
  try
    q.q.Open('select o.cdempresa'+
                    ',o.cdordproducao'+
                    ',o.tsinclusao'+
                    ',o.tsalteracao '+
              'from ordproducao o '+
              'inner join itpedido i on i.cdempresa=o.cdempresa and i.cditpedido=o.cditpedido '+
              'where i.cdpedido='+inttostr(cdpedido)+' and i.cdempresa='+empresa.cdempresa.ToString);
    while not q.q.Eof do
    begin
      if q.q.FieldByName(_tsinclusao).AsString <> q.q.FieldByName(_tsalteracao).AsString then
      begin
        result := False;
        Break;
      end;
      result := true;
      sql.Add('delete from ordproducao where cdempresa='+empresa.cdempresa.ToString+' and cdordproducao='+q.q.fieldbyname(_cdordproducao).asstring+';');
      q.q.Next;
    end;
    if result then
    begin
      ExecutaScript(sql);
    end;
  finally
    freeandnil(q);
    freeandnil(sql);
  end;
end;

class function TPedido.Quantidade_pedido_aguardando_aprovacao: integer;
begin
  result := RetornaSQLInteger('select count(*) from pedido where cdstpedido<>4 and cdtpcredito=1 and cdtpcomercial=1 and cdempresa='+empresa.cdempresa.ToString);
end;

function TPedidoList.Ler(DataSet: TDataset): boolean;
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

function TPedidoList.Ler(codigo: Integer; cdfield: string): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_Pedido, codigo, cdfield));
  try
    result := Ler(q.q);
  finally
    FreeAndNil(q);
  end;
end;

function TPedidoList.New: TPedido;
begin
  Result := TPedido.Create;
  Add(Result);
end;

procedure TPedidoList.SetItem(Index: Integer; const Value: TPedido);
begin
  Put(Index, Value);
end;

function TPedidoList.Ler(sqlwhere: string): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_where(_Pedido, sqlwhere));
  try
    result := Ler(q.q);
  finally
    FreeAndNil(q);
  end;
end;

function TPedidoList.GetItem(Index: Integer): TPedido;
begin
  Result := TPedido(Inherited Items[Index]);
end;

destructor TPedido.destroy;
begin
  FreeAndNil(FItpedido);
  freeandnil(ftpfrete);
  freeandnil(ffuncionario);
  freeandnil(fclienteentrega);
  freeandnil(fcliente);
  freeandnil(ftpcobranca);
  freeandnil(fcondpagto);
  freeandnil(fpedidoduplicata);
  FreeAndNil(ftppedido);
  FreeAndNil(fstpedido);
  inherited;
end;

end.
