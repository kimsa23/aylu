unit orm.TpClienteMensalidade;

interface

uses Contnrs, Data.DB, System.SysUtils, System.Classes,
  uConstantes,
  Rotina.Retornasql,
  Classe.DAO, classe.query;

type
  TTpClienteMensalidade = class(TRegistroQuipos)
  private
    fcdtpclientemensalidade: integer;
    fnudiamensalidade: integer;
    fvltpclientemensalidade: currency;
    fnmtpclientemensalidade: string;
  public
    [keyfield]
    property cdtpclientemensalidade : integer read fcdtpclientemensalidade write fcdtpclientemensalidade;
    [AObrigatorio]
    property nmtpclientemensalidade : string read fnmtpclientemensalidade write fnmtpclientemensalidade;
    property vltpclientemensalidade : currency read fvltpclientemensalidade write fvltpclientemensalidade;
    property nudiamensalidade : integer read fnudiamensalidade write fnudiamensalidade;
  end;
  TTpClienteMensalidadeList = class(TObjectList)
  private
    function GetItem(Index: Integer): TTpClienteMensalidade;
    procedure SetItem(Index: Integer; const Value: TTpClienteMensalidade);
  public
    function New: TTpClienteMensalidade;
    property Items[Index: Integer]: TTpClienteMensalidade read GetItem write SetItem;
    function Ler(sqlwhere: string):Boolean;overload;
    function Ler(DataSet: TDataset):boolean;overload;
    function indice(codigo:integer):integer;
  end;

implementation

function TTpClienteMensalidadeList.GetItem(Index: Integer): TTpClienteMensalidade;
begin
  Result := TTpClienteMensalidade(Inherited Items[Index]);
end;

function TTpClienteMensalidadeList.indice(codigo: integer): integer;
var
  I: Integer;
begin
  result := -1;
  for I := 0 to count - 1 do
  begin
    if codigo = items[i].cdtpclientemensalidade then
    begin
      result := i;
    end;
  end;
end;

function TTpClienteMensalidadeList.Ler(DataSet: TDataset): boolean;
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

function TTpClienteMensalidadeList.Ler(sqlwhere: string): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_where(_TpClientemensalidade, sqlwhere));
  try
    result := Ler(q.q);
  finally
    FreeAndNil(q);
  end;
end;

function TTpClienteMensalidadeList.New: TTpClienteMensalidade;
begin
  Result := TTpClienteMensalidade.Create;
  Add(Result);
end;

procedure TTpClienteMensalidadeList.SetItem(Index: Integer; const Value: TTpClienteMensalidade);
begin
  Put(Index, Value);
end;

end.
