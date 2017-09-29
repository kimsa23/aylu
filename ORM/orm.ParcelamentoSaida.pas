unit orm.ParcelamentoSaida;

interface

uses contnrs, Data.DB, System.SysUtils, System.Classes,
  uConstantes,
  Rotina.Retornasql,
  Classe.DAO, classe.query;

type
  TParcelamentoSaida = class(TRegistroQuipos)
  private
    fnucntcusto: string;
    fcdplconta: integer;
    fcdautpagto: integer;
    fcdparcelamento: integer;
    fcdtpcobranca: integer;
    fnuplconta: string;
    fvlautpagto: currency;
    fnuautpagto: string;
    fdtvencimento: tdate;
    fcdcntcusto: integer;
    fcdparcelamentosaida: integer;
  public
    [keyfield]
    property cdparcelamentosaida: integer read fcdparcelamentosaida write fcdparcelamentosaida;
    [fk]
    property cdautpagto: integer read fcdautpagto write fcdautpagto;
    [fk, AObrigatorio]
    property cdparcelamento: integer read fcdparcelamento write fcdparcelamento;
    [fk]
    property cdtpcobranca: integer read fcdtpcobranca write fcdtpcobranca;
    [fk]
    property cdcntcusto: integer read fcdcntcusto write fcdcntcusto;
    [fk]
    property cdplconta: integer read fcdplconta write fcdplconta;
    [AObrigatorio]
    property vlautpagto: currency read fvlautpagto write fvlautpagto;
    property nuautpagto: string read fnuautpagto write fnuautpagto;
    [AObrigatorio]
    property dtvencimento: tdate read fdtvencimento write fdtvencimento;
    property nucntcusto: string read fnucntcusto write fnucntcusto;
    property nuplconta: string read fnuplconta write fnuplconta;
  end;
  TParcelamentoSaidaList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TParcelamentoSaida;
    procedure SetItem(Index: Integer; const Value: TParcelamentoSaida);
  public
    function New: TParcelamentoSaida;
    property Items[Index: Integer]: TParcelamentoSaida read GetItem write SetItem;
    function Ler(codigo:Integer; cdfield:string=_cdparcelamento):Boolean;overload;
    function Ler(Dataset: TDataset):boolean;overload;
    function Vlautpagto:currency;
  end;

implementation

function TParcelamentoSaidaList.GetItem(Index: Integer): TParcelamentoSaida;
begin
  Result := TParcelamentoSaida(Inherited Items[Index]);
end;

function TParcelamentoSaidaList.Ler(Dataset: TDataset): boolean;
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

function TParcelamentoSaidaList.Ler(codigo: Integer; cdfield: string): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_ParcelamentoSaida, codigo, cdfield));
  try
    result := Ler(q.q);
  finally
    FreeAndNil(q);
  end;
end;

function TParcelamentoSaidaList.New: TParcelamentoSaida;
begin
  Result := TParcelamentoSaida.Create;
  Add(Result);
end;

procedure TParcelamentoSaidaList.SetItem(Index: Integer; const Value: TParcelamentoSaida);
begin
  Put(Index, Value);
end;

function TParcelamentoSaidaList.Vlautpagto: currency;
var
  I: Integer;
begin
  result := 0;
  for I := 0 to count - 1 do
  begin
    result := result + items[i].vlautpagto;
  end;
end;

end.
