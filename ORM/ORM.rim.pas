unit ORM.rim;

interface

uses
  system.UITypes,
  sysutils, Dialogs, Classes, Controls, Contnrs, DB,
  rotina.strings, uconstantes, rotina.datahora, rotina.Registro,
  orm.movto, orm.itmovto, orm.empresa, orm.ordproducao, orm.produto, orm.ItOrdProducaoMaterial,
  classe.query, classe.executasql, rotina.retornasql, classe.gerar, orm.usuario,
  orm.itpedidomaterial, orm.TpRim, orm.ItRim, orm.pedidomaterial, classe.dao;

Type
  TRim = class(TRegistroQuipos)
  private
    FItRim : TItRimList;
    ftprim : TTpRim;
    fcdrim : integer;
    fcdstrim : Integer;
    fcdcntcusto : Integer;
    fcdtprim : Integer;
    fcdfuncionario : Integer;
    fcdtpaplicacao : Integer;
    fdtemissao : TDate;
    fdsobservacao : string;
    fdtprevista : TDate;
    fdsaplicacao: string;
    fnucntcusto: string;
  public
    property ItRim : TItRimList read FItRim write FItRim;
    property tprim : TTpRim read ftprim write ftprim;
    [keyfield]
    property cdrim : integer read fcdrim write fcdrim;
    [fk]
    property cdstrim : Integer read fcdstrim write fcdstrim;
    [fk]
    property cdcntcusto : Integer read fcdcntcusto write fcdcntcusto;
    [fk]
    property cdtprim : Integer read fcdtprim write fcdtprim;
    [fk]
    property cdfuncionario : Integer read fcdfuncionario write fcdfuncionario;
    [fk]
    property cdtpaplicacao : Integer read fcdtpaplicacao write fcdtpaplicacao;
    property dtemissao : TDate read fdtemissao write fdtemissao;
    property dsobservacao : string read fdsobservacao write fdsobservacao;
    property dtprevista : TDate read fdtprevista write fdtprevista;
    property dsaplicacao : string read fdsaplicacao write fdsaplicacao;
    property nucntcusto: string read fnucntcusto write fnucntcusto;
    constructor create;
    destructor destroy; override;
    procedure new;
    function salvar:Boolean;
    function Baixar(cdtpMovto: Integer; data: TDate): boolean;overload;
    function Estornar:boolean;
    function set_cdstrim_:integer;
    function gerar_rim(tabela:string; codigo:Integer):Integer;
    function gerar_rim_pedido(codigo:Integer):Integer;
    function Gerar_Cotacao(codigo:Integer):integer;
  end;

implementation

function TRim.set_cdstrim_:integer;
var
  i, iaberto, iparcial, iatendido : Integer;
begin
  ItRim.Ler(cdrim, _cdrim);
  iaberto   := 0;
  iparcial  := 0;
  iatendido := 0;
  for i := 0 to ItRim.Count - 1 do
  begin
    if ItRim.Items[i].qtatendida = 0 then
    begin
      Inc(iaberto);
    end
    else if ItRim.Items[i].qtatendida > 0 then
    begin
      if itrim.Items[i].qtatendida < itrim.Items[i].qtitem then
      begin
        Inc(iparcial);
      end
      else
      begin
        Inc(iatendido);
      end;
    end;
  end;
  if iparcial > 0 then
  begin
    result := 3;
  end
  else if (iatendido > 0) then
  begin
    if iaberto = 0 then
    begin
      result := 2;
    end
    else
    begin
      result := 3;
    end;
  end
  else
  begin
    result := 1;
  end;
end;

function TRim.Baixar(cdtpMovto: Integer; data: TDate): boolean;
var
  i : Integer;
  movto : TMovto;
begin
  for i := 0 to itrim.count-1 do
  begin
    movto := tmovto.create;
    try
      movto.cdmovto   := QGerar.GerarCodigo(_movto);
      movto.dtemissao := data;
      movto.cdtpmovto := cdtpMovto;
      movto.cditrim   := itrim.Items[i].cditrim;
      movto.cdordproducao           := itrim.Items[i].cdordproducao;
      movto.cditordproducaomaterial := ItRim.Items[i].cditordproducaomaterial;
      movto.Insert;

      movto.ItMovto.New;
      movto.ItMovto.Items[0].cdmovto    := movto.cdmovto;
      movto.ItMovto.Items[0].cditmovto  := QGerar.GerarCodigo(_itmovto);
      movto.ItMovto.Items[0].cdcntcusto := cdcntcusto;
      movto.ItMovto.Items[0].nucntcusto := nucntcusto;
      movto.ItMovto.Items[0].cdproduto  := itrim.Items[i].cdproduto;
      movto.ItMovto.Items[0].cddigitado := itrim.Items[i].cddigitado;
      movto.ItMovto.Items[0].qtitem     := itrim.Items[i].qtitem;
      movto.ItMovto.Items[0].Insert;
      itrim.Items[i].qtatendida := itrim.Items[i].qtatendida + itrim.Items[i].qtitem;
      itrim.Items[i].update;
    finally
      FreeAndNil(movto);
    end;
  end;
  cdstrim := set_cdstrim_;
  Update;
  result := true;
end;

function TRim.Estornar:boolean;
var
  i : Integer;
  movto : TMovto;
begin
  for i := 0 to itrim.Count -1 do
  begin
    movto := tmovto.create;
    try
      if movto.Select(qregistro.CodigodoInteiro(_movto, itrim.Items[i].cditrim, _cditrim)) then
      begin
        movto.Delete;
        itrim.Items[i].qtatendida := 0;
        itrim.Items[i].update;
      end;
    finally
      FreeAndNil(movto);
    end;
  end;
  cdstrim := set_cdstrim_;
  Update;
  Result := True;
end;

constructor TRim.create;
begin
  inherited;
  ftprim := TTpRim.create;
  FItRim := TItRimList.Create;
end;

destructor TRim.destroy;
begin
  FreeAndNil(ftprim);
  FreeAndNil(fItRim);
  inherited;
end;

function TRim.gerar_rim(tabela: string; codigo: Integer): Integer;
begin
  result := 0;
  if tabela = _pedido then
  begin
    result := gerar_rim_pedido(codigo);
  end;
end;

function TRim.gerar_rim_pedido(codigo: Integer): Integer;
  function makesql:string;
  begin
    result := 'select ordproducao.cdordproducao '+
              'from ordproducao '+
              'inner join itpedido on itpedido.cdempresa=ordproducao.cdempresa and itpedido.cditpedido=ordproducao.cditpedido '+
              'where itpedido.cdempresa='+empresa.cdempresa.ToString+' and itpedido.cdpedido='+inttostr(codigo);
  end;
var
  itordproducaomaterial : TItOrdProducaoMaterialList;
  i : integer;
  q : tclassequery;
begin
  result := -1;
  q := tclassequery.create(makesql);
  itordproducaomaterial := TItOrdProducaoMaterialList.create;
  try
    while not q.q.eof do
    begin
      if tordproducao.existeRequisicao(q.q.fieldbyname(_cdordproducao).asinteger) then
      begin
        q.q.next;
        continue;
      end;
      itordproducaomaterial.Ler(q.q.fieldbyname(_cdordproducao).asinteger);
      if state <> dsinsert then
      begin
        new;
        dtemissao := DtBanco;
        cdstrim   := 1;
        cdtprim   := 1;
        cdfuncionario := usuario.funcionario.cdfuncionario;
      end;
      for i := 0 to ItOrdProducaoMaterial.Count - 1 do
      begin
        ItRim.Insert(cdrim);
        itrim.Items[itrim.count-1].cdproduto               := ItOrdProducaoMaterial.Items[i].cdproduto;
        itrim.Items[itrim.count-1].cdordproducao           := ItOrdProducaoMaterial.Items[i].cdordproducao;
        itrim.Items[itrim.count-1].qtitem                  := ItOrdProducaoMaterial.Items[i].qtitem;
        itrim.Items[itrim.count-1].cddigitado              := ItOrdProducaoMaterial.Items[i].cddigitado;
        itrim.Items[itrim.count-1].dtprevista              := ItOrdProducaoMaterial.Items[i].dtpreventrega;
        itrim.Items[itrim.count-1].cditordproducaomaterial := ItOrdProducaoMaterial.Items[i].cditordproducaomaterial;
      end;
      q.q.Next;
    end;
    if state = dsinsert then
    begin
      if ItRim.Count = 0 then
      begin
        result := -2;
      end
      else
      begin
        salvar;
        result := cdrim;
      end;
    end;
  finally
    freeandnil(q);
    FreeAndNil(itordproducaomaterial);
  end;
end;

procedure TRim.new;
begin
  state         := dsinsert;
  cdrim         := QGerar.GerarCodigo(_rim);
  cdtprim       := 0;
  cdstrim       := 0;
  cdcntcusto   := 0;
  nucntcusto    := '';
  cdfuncionario := 0;
  cdtpaplicacao := 0;
  dtemissao     := 0;
  dtprevista    := 0;
  dsobservacao  := '';
  itrim.Clear;
end;

function TRim.salvar: Boolean;
var
  sql : TStrings;
begin
  sql := TStringList.Create;
  try
    sql.Add(Self.insert(true));
    sql.text := sql.text + itrim.sql_insert;
    result := ExecutaScript(sql);
  finally
    FreeAndNil(sql);
  end;
end;

function TRim.Gerar_Cotacao(codigo: Integer): integer;
var
  pedidomaterial : TPedidoMaterial;
  i : integer;
begin
  result := 0;
  pedidomaterial := tpedidomaterial.create;
  try
    // carregar itens da matéria-prima
    itrim.Ler(codigo, _cdrim);
    for i := 0 to itrim.Count - 1 do
    begin
      // verificar se o item já foi gerado cotação
      if TitpedidomaterialList.existe_cotacao(_cditrim, itrim.Items[i].cditrim) then
      begin
        Continue;
      end;
      // gerar cotação
      if pedidomaterial.ItPedidoMaterial.Count = 0 then
      begin
        pedidomaterial.cdpedidomaterial   := QGerar.GerarCodigo(_pedidomaterial);
        pedidomaterial.dtemissao          := DtBanco;
        pedidomaterial.dtemprego          := pedidomaterial.dtemissao + 1;
        pedidomaterial.cdstpedidomaterial := 1;
        pedidomaterial.cdtppedidomaterial := 1;
        pedidomaterial.vltotal            := 0;
        if usuario.funcionario.cdfuncionario > 0 then
        begin
          pedidomaterial.cdfuncionariosolicitante := usuario.funcionario.cdfuncionario;
        end;
      end;
      pedidomaterial.ItPedidoMaterial.Insert(pedidomaterial.cdpedidomaterial);
      pedidomaterial.ItPedidoMaterial.Items[pedidomaterial.ItPedidoMaterial.Count-1].state                   := dsInsert;
      pedidomaterial.ItPedidoMaterial.Items[pedidomaterial.ItPedidoMaterial.Count-1].cdproduto               := itrim.Items[i].cdproduto;
      pedidomaterial.ItPedidoMaterial.Items[pedidomaterial.ItPedidoMaterial.Count-1].cditrim                 := itrim.Items[i].cditrim;
      pedidomaterial.ItPedidoMaterial.Items[pedidomaterial.ItPedidoMaterial.Count-1].cdrim                   := codigo;
      pedidomaterial.ItPedidoMaterial.Items[pedidomaterial.ItPedidoMaterial.Count-1].cdordproducao           := itrim.Items[i].cdordproducao;
      pedidomaterial.ItPedidoMaterial.Items[pedidomaterial.ItPedidoMaterial.Count-1].cditordproducaomaterial := itrim.Items[i].cditordproducaomaterial;
      pedidomaterial.ItPedidoMaterial.Items[pedidomaterial.ItPedidoMaterial.Count-1].cddigitado              := itrim.Items[i].cddigitado;
      pedidomaterial.ItPedidoMaterial.Items[pedidomaterial.ItPedidoMaterial.Count-1].qtsolicitada            := itrim.Items[i].qtitem;
      if itrim.Items[i].cditordproducaomaterial > 0 then
      begin
        itrim.Items[i].itordproducaomaterial.Select(itrim.Items[i].cditordproducaomaterial);
        pedidomaterial.ItPedidoMaterial.Items[pedidomaterial.ItPedidoMaterial.Count-1].qtpeca         := itrim.Items[i].itordproducaomaterial.qtpeca;
        pedidomaterial.ItPedidoMaterial.Items[pedidomaterial.ItPedidoMaterial.Count-1].qtpesounitario := itrim.Items[i].itordproducaomaterial.qtpesounitario;
        pedidomaterial.ItPedidoMaterial.Items[pedidomaterial.ItPedidoMaterial.Count-1].dsformula      := itrim.Items[i].itordproducaomaterial.dsformula;
      end;
    end;
    if pedidomaterial.ItPedidoMaterial.Count > 0 then
    begin
      pedidomaterial.Insert;
      for I := 0 to pedidomaterial.itpedidomaterial.count-1 do
      begin
        pedidomaterial.itpedidomaterial.items[i].Insert;
      end;
      for I := 0 to pedidomaterial.pedidomaterialfornecedor.count - 1 do
      begin
        pedidomaterial.pedidomaterialfornecedor.items[i].insert;
      end;
      result := pedidomaterial.cdpedidomaterial;
    end;
  finally
    FreeAndNil(pedidomaterial);
  end;
end;

end.
