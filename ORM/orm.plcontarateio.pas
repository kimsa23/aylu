unit orm.plcontarateio;

interface

uses Data.DB, Contnrs, System.SysUtils, System.Classes,
  uConstantes,
  Rotina.Retornasql,
  Classe.DAO, classe.query;

type
  TPlContaRateio = class(TRegistroQuipos)
  private
    fcdautpagto: Integer;
    fvltotal: Currency;
    fcdsaida: Integer;
    fcdplcontarateio: Integer;
    fcdduplicata: Integer;
    fcdentrada: Integer;
    fcdplconta: Integer;
    fdtemissao: TDateTime;
    fnuplconta: string;
  public
    [KeyField]
    property cdplcontarateio : Integer read fcdplcontarateio write fcdplcontarateio;
    [fk, AObrigatorio]
    property cdplconta : Integer read fcdplconta write fcdplconta;
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
    property nuplconta: string read fnuplconta write fnuplconta;
  end;
  TPlContaRateioList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TPlContaRateio;
    procedure SetItem(Index: Integer; const Value: TPlContaRateio);
  public
    function New: TPlContaRateio;
    property Items[Index: Integer]: TPlContaRateio read GetItem write SetItem;
    function Ler(codigo:Integer; cdfield:string):Boolean;overload;
    function Ler(DataSet: TDataset):boolean;overload;
  end;

implementation

function TPlContaRateioList.GetItem(Index: Integer): TPlContaRateio;
begin
  Result := TPlContaRateio(Inherited Items[Index]);
end;

function TPlContaRateioList.Ler(DataSet: TDataset): boolean;
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

function TPlContaRateioList.Ler(codigo: Integer; cdfield: string): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_plcontarateio, codigo, cdfield));
  try
    result := Ler(q.q);
  finally
    FreeAndNil(q);
  end;
end;

function TPlContaRateioList.New: TPlContaRateio;
begin
  Result := TPlContaRateio.Create;
  Add(Result);
end;

procedure TPlContaRateioList.SetItem(Index: Integer; const Value: TPlContaRateio);
begin
  Put(Index, Value);
end;

end.
