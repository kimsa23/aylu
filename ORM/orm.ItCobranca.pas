unit orm.ItCobranca;

interface

uses Contnrs, Data.DB, System.SysUtils, System.Classes,
  uConstantes,
  Rotina.Retornasql,
  Classe.DAO, classe.query, classe.gerar;

type
  TItCobranca = class(TRegistroQuipos)
  private
    Fnuduplicata: string;
    Fcdduplicata: integer;
    Fcditcobranca: integer;
    Fcdcobranca: integer;
  public
    [keyfield]
    property cdcobranca : integer read Fcdcobranca write fcdcobranca;
    property cdduplicata : integer read Fcdduplicata write fcdduplicata;
    property nuduplicata : string read Fnuduplicata write fnuduplicata;
    property cditcobranca : integer read Fcditcobranca write fcditcobranca;
    function Insert(boscript:boolean=false): String;
  end;
  TItCobrancaList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TItCobranca;
    procedure SetItem(Index: Integer; const Value: TItCobranca);
  public
    function New: TItCobranca;
    property Items[Index: Integer]: TItCobranca read GetItem write SetItem;
    function Ler(codigo:Integer):Boolean;overload;
    function Ler(DataSet:TDataset):Boolean;overload;
  end;

implementation

function TItCobrancaList.GetItem(Index: Integer): TItCobranca;
begin
  Result := TItCobranca(Inherited Items[Index]);
end;

function TItCobrancaList.Ler(codigo: Integer): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_itcobranca, codigo, _cdcobranca));
  try
    Ler(q.q);
  finally
    FreeAndNil(q);
  end;
end;

function TItCobrancaList.Ler(DataSet: TDataset): Boolean;
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

function TItCobrancaList.New: TItCobranca;
begin
  Result := TItCobranca.Create;
  Add(Result);
end;

procedure TItCobrancaList.SetItem(Index: Integer; const Value: TItCobranca);
begin
  Put(Index, Value);
end;

function TItCobranca.Insert(boscript: boolean): String;
begin
  if cditcobranca = 0 then
  begin
    cditcobranca := QGerar.GerarCodigo(_itcobranca);
  end;
  result := inherited insert(boscript);
end;

end.
