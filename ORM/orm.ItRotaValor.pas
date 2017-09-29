unit orm.ItRotaValor;

interface

uses contnrs, System.SysUtils, Data.DB, System.Classes,
  uConstantes,
  Rotina.Retornasql,
  Classe.DAO, classe.query, classe.gerar;

type
  TItRotaValor = class(TRegistroQuipos)
  private
    Fvlunitario: currency;
    Fcdrota: integer;
    Fqtitem: integer;
    Fcditrotavalor: integer;
  public
    [keyfield]
    property cditrotavalor : integer read Fcditrotavalor write fcditrotavalor;
    [fk]
    property cdrota : integer read Fcdrota write fcdrota;
    property qtitem : integer read Fqtitem write fqtitem;
    property vlunitario : currency read Fvlunitario write fvlunitario;
  end;
  TItRotaValorList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TItRotaValor;
    procedure SetItem(Index: Integer; const Value: TItRotaValor);
  public
    function New: TItRotaValor;
    property Items[Index: Integer]: TItRotaValor read GetItem write SetItem;
    function Insert(cdrota:integer): TItRotaValor;
    function sql_insert:string;
    function Ler(codigo:Integer):Boolean;
  end;

implementation

function TItRotaValorList.GetItem(Index: Integer): TItRotaValor;
begin
  Result := TItRotaValor(Inherited Items[Index]);
end;

function TItRotaValorList.Insert(cdrota: integer): TItRotaValor;
begin
  result := new;
  result.state     := dsInsert;
  Result.cdrota    := cdrota;
  Result.cditrotavalor := QGerar.GerarCodigo(_itrotavalor);
end;

function TItRotaValorList.Ler(codigo: Integer): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_itrotavalor, codigo, _cdrota));
  try
    clear;
    result := q.q.RecordCount > 0;
    if not result then
    begin
      Exit;
    end;
    while not q.q.Eof do
    begin
      New.Select(q.q);
      q.q.Next;
    end;
  finally
    FreeAndNil(q);
  end;
end;

function TItRotaValorList.New: TItRotaValor;
begin
  Result := TItRotaValor.Create;
  Add(Result);
end;

procedure TItRotaValorList.SetItem(Index: Integer; const Value: TItRotaValor);
begin
  Put(Index, Value);
end;

function TItRotaValorList.sql_insert: string;
var
  i : Integer;
begin
  Result := '';
  for i := 0 to count-1 do
  begin
    if Items[i].state = dsinsert then
    begin
      result := result + Items[i].insert(true)+#13;
    end;
  end;
end;

end.
