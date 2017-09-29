unit orm.ItFatPedido;

interface

uses Data.DB, contnrs, System.SysUtils, System.Classes,
  uConstantes,
  Rotina.Retornasql,
  ORM.Pedido,
  Classe.DAO, classe.query;

type
  TItFatPedido = class(TRegistroQuipos)
  private
    fnupedido: string;
    fcdpedido: integer;
    fcdfaturamento: integer;
    fpedido: TPedido;
  public
    property pedido : TPedido read fpedido write fpedido;
    [keyfield]
    property cdfaturamento : integer read fcdfaturamento write fcdfaturamento;
    [keyfield]
    property cdpedido : integer read fcdpedido write fcdpedido;
    [AObrigatorio]
    property nupedido : string read fnupedido write fnupedido;
    constructor create;
    destructor destroy; override;
  end;
  TItFatPedidoList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TItFatPedido;
    procedure SetItem(Index: Integer; const Value: TItFatPedido);
  public
    function New: TItFatPedido;
    property Items[Index: Integer]: TItFatPedido read GetItem write SetItem;
    function Ler(codigo:Integer; cdfield:string):Boolean;overload;
    function Ler(DataSet: TDataset):boolean;overload;
    function pedido_campanha_ja_existe(cdfaturtamento: integer; cdcliente: LargeInt; cdproduto: integer):boolean;
    function TotalizarPedidos:string;
    function Indice(cdpedido:integer):integer;
    function ExistePedido(cdcliente: LargeInt; cdtppedido: integer):boolean;
    function ObterCdPedido(cdcliente: LargeInt; cdtppedido: integer):integer;
  end;

implementation

function TItFatPedidoList.ExistePedido(cdcliente: LargeInt; cdtppedido: integer): boolean;
var
  I: Integer;
begin
  result := false;
  for I := 0 to count - 1 do
  begin
    if items[i].pedido.cdpedido = 0 then
    begin
      items[i].pedido.Select(items[i].cdpedido);
    end;
    if (items[i].pedido.cdcliente = cdcliente) and (items[i].pedido.cdtppedido = cdtppedido) then
    begin
      result := true;
      break;
    end;
  end;
end;

function TItFatPedidoList.GetItem(Index: Integer): TItFatPedido;
begin
  Result := TItFatPedido(Inherited Items[Index]);
end;

function TItFatPedidoList.Indice(cdpedido: integer): integer;
var
  I: Integer;
begin
  result := -1;
  for I := 0 to count - 1 do
  begin
    if cdpedido = items[i].cdpedido then
    begin
      result := i;
      break;
    end;
  end;
end;

function TItFatPedidoList.Ler(DataSet: TDataset): boolean;
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

function TItFatPedidoList.Ler(codigo: Integer; cdfield: string): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_itfatpedido, codigo, cdfield));
  try
    result := Ler(q.q);
  finally
    FreeAndNil(q);
  end;
end;

function TItFatPedidoList.New: TItFatPedido;
begin
  Result := TItFatPedido.Create;
  Add(Result);
end;

function TItFatPedidoList.ObterCdPedido(cdcliente: LargeInt; cdtppedido: integer): integer;
var
  I: Integer;
begin
  result := -1;
  for I := 0 to count - 1 do
  begin
    if (items[i].pedido.cdcliente = cdcliente) and (items[i].pedido.cdtppedido = cdtppedido) then
    begin
      result := items[i].cdpedido;
    end;
  end;
end;

function TItFatPedidoList.pedido_campanha_ja_existe(cdfaturtamento: integer; cdcliente: LargeInt; cdproduto: integer): boolean;
var
  I: Integer;
  y: Integer;
begin
  result := false;
  for I := 0 to count - 1 do
  begin
    if items[i].pedido.cdpedido = 0 then
    begin
      items[i].pedido.select(items[i].cdpedido);
    end;
    if (items[i].pedido.cdcliente = cdcliente) then
    begin
      if items[i].pedido.itpedido.count = 0 then
      begin
        items[i].pedido.itpedido.Ler(items[i].pedido.cdpedido);
      end;
      for y := 0 to items[i].pedido.itpedido.Count - 1 do
      begin
        if items[i].pedido.itpedido.Items[y].cdproduto = cdproduto then
        begin
          result := true;
          break;
        end;
      end;
    end;
  end;
end;

procedure TItFatPedidoList.SetItem(Index: Integer; const Value: TItFatPedido);
begin
  Put(Index, Value);
end;

function TItFatPedidoList.TotalizarPedidos: string;
var
  I: Integer;
begin
  result := '';
  for I := 0 to count - 1 do
  begin
    items[i].pedido.vltotal := items[i].pedido.itpedido.VlTotal;
    //result := result + items[i].pedido.Update(true)+#13;
    items[i].pedido.Update;
  end;
end;

constructor TItFatPedido.create;
begin
  inherited;
  fpedido := tpedido.create;
end;

destructor TItFatPedido.destroy;
begin
  freeandnil(fpedido);
  inherited;
end;

end.
