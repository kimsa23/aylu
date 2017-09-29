unit orm.CntcustoRateio;

interface

uses Contnrs, Data.DB, System.SysUtils, System.Classes,
  uConstantes,
  Rotina.Retornasql,
  Classe.DAO, classe.query;

type
  TCntcustoRateio = class(TRegistroQuipos)
  private
    fcdautpagto: Integer;
    fvltotal: Currency;
    fcdsaida: Integer;
    fcdcntcustorateio: Integer;
    fcdduplicata: Integer;
    fcdentrada: Integer;
    fcdcntcusto: Integer;
    fdtemissao: TDateTime;
  public
    [KeyField]
    property cdcntcustorateio : Integer read fcdcntcustorateio write fcdcntcustorateio;
    [fk, AObrigatorio]
    property cdcntcusto : Integer read fcdcntcusto write fcdcntcusto;
    [fk]
    property cdsaida : Integer read fcdsaida write fcdsaida;
    [fk]
    property cdentrada : Integer read fcdentrada write fcdentrada;
    [fk]
    property cdduplicata : Integer read fcdduplicata write fcdduplicata;
    [fk]
    property cdautpagto : Integer read fcdautpagto write fcdautpagto;
    [AObrigatorio]
    property dtemissao : TDateTime read fdtemissao write fdtemissao;
    [AObrigatorio]
    property vltotal : Currency read fvltotal write fvltotal;
  end;
  TCntCustoRateioList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TCntCustoRateio;
    procedure SetItem(Index: Integer; const Value: TCntCustoRateio);
  public
    function New: TCntCustoRateio;
    property Items[Index: Integer]: TCntCustoRateio read GetItem write SetItem;
    function Ler(codigo:Integer; cdfield:string):Boolean;overload;
    function Ler(DataSet: TDataset):boolean;overload;
  end;

implementation

function TCntCustoRateioList.GetItem(Index: Integer): TCntCustoRateio;
begin
  Result := TCntCustoRateio(Inherited Items[Index]);
end;

function TCntCustoRateioList.Ler(DataSet: TDataset): boolean;
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

function TCntCustoRateioList.Ler(codigo: Integer; cdfield: string): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_cntcustorateio, codigo, cdfield));
  try
    result := Ler(q.q);
  finally
    FreeAndNil(q);
  end;
end;

function TCntCustoRateioList.New: TCntCustoRateio;
begin
  Result := TCntCustoRateio.Create;
  Add(Result);
end;

procedure TCntCustoRateioList.SetItem(Index: Integer; const Value: TCntCustoRateio);
begin
  Put(Index, Value);
end;

end.
