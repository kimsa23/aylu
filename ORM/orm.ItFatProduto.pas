unit orm.ItFatProduto;

interface

uses contnrs, Data.DB, System.SysUtils, System.Classes,
  uConstantes,
  Rotina.Retornasql,
  Classe.DAO, classe.query;

type
  TItFatProduto = class(TRegistroQuipos)
  private
    fcditfatproduto: integer;
    fvlunitario: currency;
    fcddigitado: string;
    fqtitem: double;
    fvltotal: currency;
    fcdproduto: integer;
    fcdfaturamento: integer;
  public
    property cditfatproduto : integer read fcditfatproduto write fcditfatproduto;
    [fk, AObrigatorio]
    property cdfaturamento : integer read fcdfaturamento write fcdfaturamento;
    [fk, AObrigatorio]
    property cdproduto : integer read fcdproduto write fcdproduto;
    [Aobrigatorio]
    property qtitem : double read fqtitem write fqtitem;
    [Aobrigatorio]
    property vlunitario : currency read fvlunitario write fvlunitario;
    [Aobrigatorio]
    property vltotal : currency read fvltotal write fvltotal;
    [Aobrigatorio]
    property cddigitado : string read fcddigitado write fcddigitado;
  end;
  TItFatProdutoList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TItFatProduto;
    procedure SetItem(Index: Integer; const Value: TItFatProduto);
  public
    function New: TItFatProduto;
    property Items[Index: Integer]: TItFatProduto read GetItem write SetItem;
    function Ler(codigo:Integer; cdfield:string):Boolean;overload;
    function Ler(DataSet: TDataset):boolean;overload;
  end;

implementation

function TItFatProdutoList.GetItem(Index: Integer): TItFatProduto;
begin
  Result := TItFatProduto(Inherited Items[Index]);
end;

function TItFatProdutoList.Ler(DataSet: TDataset): boolean;
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

function TItFatProdutoList.Ler(codigo: Integer; cdfield: string): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_itfatproduto, codigo, cdfield));
  try
    result := Ler(q.q);
  finally
    FreeAndNil(q);
  end;
end;

function TItFatProdutoList.New: TItFatProduto;
begin
  Result := TItFatProduto.Create;
  Add(Result);
end;

procedure TItFatProdutoList.SetItem(Index: Integer; const Value: TItFatProduto);
begin
  Put(Index, Value);
end;

end.
