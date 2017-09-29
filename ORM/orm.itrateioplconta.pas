unit orm.itrateioplconta;

interface

uses Contnrs, Data.DB, System.SysUtils, System.Classes,
  uConstantes,
  Rotina.Retornasql,
  Classe.DAO, classe.query;

type
  TItRateioPlconta = class(TRegistroQuipos)
  private
    fprrateio: double;
    fcdplconta: Integer;
    fnuplconta: string;
    fcditrateioplconta: integer;
    fcdrateioplconta: integer;
  public
    [KeyField]
    property cditrateioplconta: integer read fcditrateioplconta write fcditrateioplconta;
    [FK, AObrigatorio]
    property cdrateioplconta: integer read fcdrateioplconta write fcdrateioplconta;
    [FK, AObrigatorio]
    property cdplconta: Integer read fcdplconta write fcdplconta;
    [AObrigatorio]
    property nuplconta: string read fnuplconta write fnuplconta;
    [AObrigaorio]
    property prrateio: double read fprrateio write fprrateio;
  end;
  TItRateioPlContaList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TItRateioPlconta;
    procedure SetItem(Index: Integer; const Value: TItRateioPlconta);
  public
    function New: TItRateioPlconta;
    property Items[Index: Integer]: TItRateioPlconta read GetItem write SetItem;
    function Ler(codigo:Integer):Boolean;overload;
    function Ler(Dataset: TDataset):boolean;overload;
  end;

implementation

{ TItRateioPlContaList }

function TItRateioPlContaList.GetItem(Index: Integer): TItRateioPlconta;
begin
  Result := TItRateioPlconta(Inherited Items[Index]);
end;

function TItRateioPlContaList.Ler(codigo: Integer): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_itrateioplconta, codigo, _cdrateioplconta));
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

function TItRateioPlContaList.Ler(Dataset: TDataset): boolean;
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

function TItRateioPlContaList.New: TItRateioPlconta;
begin
  Result := TItRateioPlconta.Create;
  Add(Result);
end;

procedure TItRateioPlContaList.SetItem(Index: Integer; const Value: TItRateioPlconta);
begin
  Put(Index, Value);
end;

end.
