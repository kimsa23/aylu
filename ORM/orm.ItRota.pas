unit orm.ItRota;

interface

uses Data.DB, contnrs, System.SysUtils, System.Classes,
  uConstantes,
  Rotina.Retornasql,
  Classe.DAO, classe.query, classe.gerar;

type
  TItRota = class(TRegistroQuipos)
  private
    Fcditrota: integer;
    Fcduf: integer;
    Fnusequencia: integer;
    Fcdrota: integer;
    Fcdmunicipio: integer;
    Fcdcliente: LargeInt;
    Fnmbairro: string;
    Fdsobservacao: string;
  public
    [keyfield]
    property cditrota : integer read Fcditrota write fcditrota;
    [fk]
    property cdrota : integer read Fcdrota write fcdrota;
    [fk]
    property cdcliente : LargeInt read Fcdcliente write fcdcliente;
    [fk]
    property cduf : integer read Fcduf write fcduf;
    [fk]
    property cdmunicipio : integer read Fcdmunicipio write fcdmunicipio;
    property nusequencia : integer read Fnusequencia write fnusequencia;
    property dsobservacao : string read Fdsobservacao write fdsobservacao;
    property nmbairro : string read Fnmbairro write fnmbairro;
  end;
  TItRotaList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TItRota;
    procedure SetItem(Index: Integer; const Value: TItRota);
  public
    function New: TItRota;
    property Items[Index: Integer]: TItRota read GetItem write SetItem;
    function Insert(cdrota:integer): TItRota;
    function sql_insert:string;
    function Ler(codigo:Integer):Boolean;overload;
    function Ler(Dataset:TDataset):Boolean;overload;
    function ExisteCliente(cdcliente:LargeInt):boolean;
  end;

implementation

function TItRotaList.ExisteCliente(cdcliente: LargeInt): boolean;
var
  i : integer;
begin
  result := false;
  for i := 0 to Count - 1 do
  begin
    if items[i].cdcliente = cdcliente then
    begin
      result := true;
      break;
    end;
  end;
end;

function TItRotaList.GetItem(Index: Integer): TItRota;
begin
  Result := TItRota(Inherited Items[Index]);
end;

function TItRotaList.Insert(cdrota: integer): TItRota;
begin
  result          := new;
  result.state    := dsInsert;
  Result.cdrota   := cdrota;
  Result.cditrota := QGerar.GerarCodigo(_itrota);
  result.nusequencia := count;
end;

function TItRotaList.Ler(Dataset: TDataset): Boolean;
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

function TItRotaList.Ler(codigo: Integer): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_itrota, codigo, _cdrota));
  try
    Ler(q.q);
  finally
    FreeAndNil(q);
  end;
end;

function TItRotaList.New: TItRota;
begin
  Result := TItRota.Create;
  Add(Result);
end;

procedure TItRotaList.SetItem(Index: Integer; const Value: TItRota);
begin
  Put(Index, Value);
end;

function TItRotaList.sql_insert: string;
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
