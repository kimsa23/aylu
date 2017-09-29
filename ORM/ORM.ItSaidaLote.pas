unit ORM.ItSaidaLote;

interface

uses Contnrs, Data.DB, System.SysUtils, System.Classes,
  uConstantes,
  Classe.DAO, classe.query, rotina.RetornaSql;

type
  TItSaidaLote = class(TRegistroQuipos)
  private
    fcditsaidalote: Integer;
    fcditlote: Integer;
    fcditsadia: Integer;
    fnuimei: string;
  public
    [KeyField]
    property cditsaidalote : Integer read fcditsaidalote write fcditsaidalote;
    [FK]
    property cditsadia : Integer read fcditsadia write fcditsadia;
    [FK]
    property cditlote : Integer read fcditlote write fcditlote;
    property nuimei : string read fnuimei write fnuimei;
  end;
  TItSaidaLoteList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TItSaidaLote;
    procedure SetItem(Index: Integer; const Value: TItSaidaLote);
  public
    function New: TItSaidaLote;
    property Items[Index: Integer]: TItSaidaLote read GetItem write SetItem;
    function Ler(codigo:Integer):Boolean;overload;
    function Ler(Dataset: TDataset):Boolean;overload;
  end;

implementation

function TItSaidaLoteList.GetItem(Index: Integer): TItSaidaLote;
begin
  Result := TItSaidaLote(Inherited Items[Index]);
end;

function TItSaidaLoteList.Ler(Dataset: TDataset): Boolean;
begin
  clear;
  result := False;
  dataset.first;
  while not dataset.Eof do
  begin
    new.select(dataset);
    dataset.Next;
    result := True;
  end;
end;

function TItSaidaLoteList.Ler(codigo: Integer): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_itsaidalote, codigo, _cditsaida));
  try
    clear;
    result := q.q.RecordCount > 0;
    if not result then
    begin
      Exit;
    end;
    Ler(q.q);
  finally
    freeandnil(q);
  end;
end;

function TItSaidaLoteList.New: TItSaidaLote;
begin
  Result := TItSaidaLote.Create;
  Add(Result);
end;

procedure TItSaidaLoteList.SetItem(Index: Integer; const Value: TItSaidaLote);
begin
  Put(Index, Value);
end;

end.
