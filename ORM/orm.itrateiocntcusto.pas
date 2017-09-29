unit orm.itrateiocntcusto;

interface

uses Contnrs, Data.DB, System.SysUtils, System.Classes,
  uConstantes,
  Rotina.Registro, Rotina.Retornasql,
  Classe.DAO, classe.query;

type
  TItRateiocntcusto = class(TRegistroQuipos)
  private
    fprrateio: double;
    fcdcntcusto: Integer;
    fnucntcusto: string;
    fcditrateiocntcusto: integer;
    fcdrateiocntcusto: integer;
  public
    [KeyField]
    property cditrateiocntcusto: integer read fcditrateiocntcusto write fcditrateiocntcusto;
    [FK, AObrigatorio]
    property cdrateiocntcusto: integer read fcdrateiocntcusto write fcdrateiocntcusto;
    [FK, AObrigatorio]
    property cdcntcusto: Integer read fcdcntcusto write fcdcntcusto;
    [AObrigatorio]
    property nucntcusto: string read fnucntcusto write fnucntcusto;
    [AObrigaorio]
    property prrateio: double read fprrateio write fprrateio;
  end;
  TItRateioCntcustoList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TItRateiocntcusto;
    procedure SetItem(Index: Integer; const Value: TItRateiocntcusto);
  public
    function New: TItRateiocntcusto;
    property Items[Index: Integer]: TItRateiocntcusto read GetItem write SetItem;
    function Ler(codigo:Integer):Boolean;overload;
    function Ler(Dataset: TDataset):boolean;overload;
  end;

implementation

function TItRateioCntcustoList.GetItem(Index: Integer): TItRateiocntcusto;
begin
  Result := TItRateiocntcusto(Inherited Items[Index]);
end;

function TItRateioCntcustoList.Ler(codigo: Integer): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_itrateiocntcusto, codigo, _cdrateiocntcusto));
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

function TItRateioCntcustoList.Ler(Dataset: TDataset): boolean;
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

function TItRateioCntcustoList.New: TItRateiocntcusto;
begin
  Result := TItRateiocntcusto.Create;
  Add(Result);
end;

procedure TItRateioCntcustoList.SetItem(Index: Integer; const Value: TItRateiocntcusto);
begin
  Put(Index, Value);
end;

end.
