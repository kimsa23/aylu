unit orm.ItOrdproducao;

interface

uses contnrs, System.Classes, System.SysUtils,
  uConstantes,
  Rotina.Retornasql, Rotina.DataHora,
  ORM.Movto, ORM.Produto,
  classe.query, classe.gerar, Classe.DAO;

type
  TItOrdproducao = class(TRegistroQuipos)
  private
    fcditordproducao : Integer;
    fcdordproducao : integer;
    fcdstitordproducao : Integer;
    fcdproduto : integer;
    fcdprodutomateriaprima : Integer;
    fqtitem : Double;
    fqtproducao : Double;
    fcddigitado : string;
    fnubag : string;
    fnulote : string;
    fhrinicio : TTime;
    fhrfim : TTime;
    fdsobservacao : string;
    fcddigitadomateriaprima : string;
    fqtespessura : Double;
    fqtlargura : Double;
    fqtcomprimento : Double;
  public
    [keyfield]
    property cditordproducao : Integer read fcditordproducao write fcditordproducao;
    [fk]
    property cdordproducao : integer read fcdordproducao write fcdordproducao;
    [fk]
    property cdstitordproducao : Integer read fcdstitordproducao write fcdstitordproducao;
    [fk]
    property cdproduto : integer read fcdproduto write fcdproduto;
    [fk]
    property cdprodutomateriaprima : Integer read fcdprodutomateriaprima write fcdprodutomateriaprima;
    property qtitem : Double read fqtitem write fqtitem;
    property qtproducao : Double read fqtproducao write fqtproducao;
    property cddigitado : string read fcddigitado write fcddigitado;
    property nubag : string read fnubag write fnubag;
    property nulote : string read fnulote write fnulote;
    property hrinicio : TTime read fhrinicio write fhrinicio;
    property hrfim : TTime read fhrfim write fhrfim;
    property dsobservacao : string read fdsobservacao write fdsobservacao;
    property cddigitadomateriaprima : string read fcddigitadomateriaprima write fcddigitadomateriaprima;
    property qtespessura : Double read fqtespessura write fqtespessura;
    property qtlargura : Double read fqtlargura write fqtlargura;
    property qtcomprimento : Double read fqtcomprimento write fqtcomprimento;
    function Insert(boscript:boolean=false): String;overload;
  end;
  TItOrdProducaoList = class(TObjectList)
  private
    function GetItem(Index: Integer): TItOrdProducao;
    procedure SetItem(Index: Integer; const Value: TItOrdProducao);
  public
    function New: TItOrdProducao;
    function inserirProdutoInexistente(sql: TStrings; cdproduto:Integer):string;
    function inserirProdutoRestoQuantidade(cdordproducao, cdproduto: integer; qtitem: Double):string;
    function gerarEntradaEstoque:string;
    function ExcluirMovto:string;
    function GerarBaixaMateriaPrima(data:TDate):String;
    function SumQtitem:double;
    function Ler(codigo:Integer):Boolean;
    property Items[Index: Integer]: TItOrdProducao read GetItem write SetItem;
  end;

implementation

function TItOrdproducao.Insert(boscript: boolean): String;
begin
  if cdstitordproducao = 0 then
  begin
    cdstitordproducao := 1;
  end;
  result := inherited Insert(boscript);
end;

function TItOrdProducaoList.ExcluirMovto:string;
var
  I: Integer;
  movto : tmovtolist;
  x: Integer;
begin
  result := '';
  for I := 0 to count - 1 do
  begin
    movto := tmovtolist.Create;
    try
      if movto.Ler(_cditordproducao+'='+inttostr(items[i].cditordproducao)) then
      begin
        for x := 0 to movto.Count - 1 do
        begin
          if result <> '' then
          begin
            result := result + #13;
          end;
          result := result + movto.Items[x].Delete(true);
        end;
      end;
    finally
      freeandnil(movto);
    end;
  end;
end;

function TItOrdProducaoList.GerarBaixaMateriaPrima(data:TDate): string;
var
  movto : TMovto;
  i : integer;
begin
  result := '';
  for I := 0 to count - 1 do
  begin
    if (items[i].cdproduto = items[i].cdprodutomateriaprima) or (items[i].cdprodutomateriaprima = 0) then
    begin
      continue;
    end;
    movto := tmovto.create;
    try
      movto.cdmovto         := QGerar.GerarCodigo(_movto);
      movto.dtemissao       := data;
      movto.cdordproducao   := items[i].cdordproducao;
      movto.cdtpmovto       := 1;
      movto.cditordproducao := items[i].cditordproducao;
      result := result + movto.Insert(true) + #13;

      movto.ItMovto.new;
      movto.ItMovto.Items[movto.ItMovto.Count-1].cdmovto    := movto.cdmovto;
      movto.ItMovto.Items[movto.ItMovto.Count-1].cditmovto  := QGerar.GerarCodigo(_itmovto);
      movto.ItMovto.Items[movto.ItMovto.Count-1].cdproduto  := items[i].cdprodutomateriaprima;
      movto.ItMovto.Items[movto.ItMovto.Count-1].cddigitado := items[i].cddigitadomateriaprima;
      movto.ItMovto.Items[movto.ItMovto.Count-1].qtitem     := items[i].qtproducao;
      result := result + movto.ItMovto.Items[movto.ItMovto.count-1].Insert + #13;
    finally
      freeandnil(movto);
    end;
  end;
end;

function TItOrdProducaoList.gerarEntradaEstoque: string;
var
  i : Integer;
  movto : TMovto;
begin
  result := '';
  for i := 0 to Count - 1 do
  begin
    if (items[i].cdproduto = items[i].cdprodutomateriaprima) then
    begin
      continue;
    end;
    movto := tmovto.create;
    try
      movto.cdmovto         := QGerar.GerarCodigo(_movto);
      movto.dtemissao       := DtBanco;
      movto.cdtpmovto       := 2; //TODO - Entrada de estoque - os códigos de tipo de movimentação de estoque devem ser fixo
      movto.cdordproducao   := Items[i].cdordproducao;
      movto.cditordproducao := Items[i].cditordproducao;
      result := result + movto.Insert(true) + #13;
      movto.itmovto.New;
      movto.itmovto.Items[0].cdmovto    := movto.cdmovto;
      movto.itmovto.Items[0].cditmovto  := QGerar.GerarCodigo(_itmovto);
      movto.itmovto.Items[0].cdproduto  := Items[i].cdproduto;
      movto.ItMovto.Items[0].cddigitado := Items[i].cddigitado;
      movto.ItMovto.Items[0].qtitem     := Items[i].qtproducao;
      result := result +  movto.ItMovto.Items[0].insert(true) +#13;
    finally
      FreeAndNil(movto);
    end;
  end;
end;

function TItOrdProducaoList.GetItem(Index: Integer): TItOrdProducao;
begin
  Result := TItOrdProducao(Inherited Items[Index]);
end;

function TItOrdProducaoList.inserirProdutoInexistente(sql: TStrings; cdproduto:Integer): string;
var
  i : Integer;
  produto : TProduto;
begin
  Result  := '';
  for i := 0 to count-1 do
  begin
    if items[i].cddigitado = '' then
    begin
      produto := TProduto.create;
      try
        sql.add(produto.copiarPlaca(cdproduto, Items[i].qtespessura, Items[i].qtlargura, Items[i].qtcomprimento));
        Items[i].cdproduto  := produto.cdproduto;
        Items[i].cddigitado := produto.cdalternativo;
        Items[i].qtproducao := Items[i].qtitem;
        if Items[i].cddigitado = '' then
        begin
          Items[i].cddigitado := IntToStr(Items[i].cdproduto);
        end;
        sql.add(Items[i].Update(true));
      finally
        FreeAndNil(produto);
      end;
    end;
  end;
end;

function TItOrdProducaoList.inserirProdutoRestoQuantidade(cdordproducao, cdproduto: integer; qtitem: Double):string;
begin
  new;
  Items[count-1].qtitem     := qtitem;
  Items[count-1].qtproducao := qtitem;
  Items[count-1].cdproduto  := cdproduto;
  Items[count-1].cddigitado := inttostr(cdproduto);
  Items[count-1].cditordproducao := qgerar.gerarcodigo(_itordproducao);
  Items[count-1].cdordproducao   := cdordproducao;
  result := Items[count-1].Insert(True);
end;

function TItOrdProducaoList.Ler(codigo: Integer): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_itordproducao, codigo, _cdordproducao));
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

function TItOrdProducaoList.New: TItOrdProducao;
begin
  Result := TItOrdProducao.Create;
  Add(Result);
end;

procedure TItOrdProducaoList.SetItem(Index: Integer; const Value: TItOrdProducao);
begin
  Put(Index, Value);
end;

function TItOrdProducaoList.SumQtitem: double;
var
  i : Integer;
begin
  result := 0;
  for i := 0 to Count - 1 do
  begin
    result := result + Items[i].qtitem;
  end;
end;

end.
