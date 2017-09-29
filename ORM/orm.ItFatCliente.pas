unit orm.ItFatCliente;

interface

uses Data.DB, Contnrs, System.SysUtils, System.Classes,
  uConstantes,
  Rotina.Retornasql,
  Classe.DAO, classe.query;

type
  TItFatCliente = class(TRegistroQuipos)
  private
    fcdcliente: LargeInt;
    fcditfatcliente: integer;
    fcdfaturamento: integer;
  public
    [keyfield]
    property cditfatcliente : integer read fcditfatcliente write fcditfatcliente;
    [fk, AObrigatorio]
    property cdfaturamento : integer read fcdfaturamento write fcdfaturamento;
    [fk, AObrigatorio]
    property cdcliente : LargeInt read fcdcliente write fcdcliente;
  end;
  TItFatClienteList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TItFatCliente;
    procedure SetItem(Index: Integer; const Value: TItFatCliente);
  public
    function New: TItFatCliente;
    property Items[Index: Integer]: TItFatCliente read GetItem write SetItem;
    function Ler(codigo:Integer; cdfield:string):Boolean;overload;
    function Ler(DataSet: TDataset):boolean;overload;
  end;

implementation

function TItFatClienteList.GetItem(Index: Integer): TItFatCliente;
begin
  Result := TItFatCliente(Inherited Items[Index]);
end;

function TItFatClienteList.Ler(DataSet: TDataset): boolean;
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

function TItFatClienteList.Ler(codigo: Integer; cdfield: string): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_itfatcliente, codigo, cdfield));
  try
    result := Ler(q.q);
  finally
    FreeAndNil(q);
  end;
end;

function TItFatClienteList.New: TItFatCliente;
begin
  Result := TItFatCliente.Create;
  Add(Result);
end;

procedure TItFatClienteList.SetItem(Index: Integer; const Value: TItFatCliente);
begin
  Put(Index, Value);
end;

end.
