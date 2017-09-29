unit orm.mdfelacunidtranspcte;

interface

uses Data.DB, contnrs, System.SysUtils, System.Classes,
  uConstantes,
  Rotina.Retornasql,
  Classe.DAO, classe.query;

type
  TMDFELacunidTranspcte = class(TRegistroQuipos)
  private
    fnlacre: string;
    fcdmdfeinfunidtranspcte: integer;
    fcdmdfelacunidtranspcte: integer;
  public
    [KeyField]
    property cdmdfelacunidtranspcte : integer read fcdmdfelacunidtranspcte write fcdmdfelacunidtranspcte;
    property nlacre : string read fnlacre write fnlacre;
    [fk, aobrigatorio]
    property cdmdfeinfunidtranspcte: integer read fcdmdfeinfunidtranspcte write fcdmdfeinfunidtranspcte;
  end;
  TMDFELacunidTranspCTEList = class(TObjectList)
  private
    function GetItem(Index: Integer): TMDFELacunidTranspcte;
    procedure SetItem(Index: Integer; const Value: TMDFELacunidTranspcte);
  public
    function New: TMDFELacunidTranspcte;
    property Items[Index: Integer]: TMDFELacunidTranspcte read GetItem write SetItem;
    function Ler(sqlwhere:string):Boolean; overload;
    function Ler(Dataset: TDataset):boolean; overload;
  end;

implementation

function TMDFELacunidTranspCTEList.GetItem(Index: Integer): TMDFELacunidTranspcte;
begin
  Result := TMDFELacunidTranspcte(Inherited Items[Index]);
end;

function TMDFELacunidTranspCTEList.Ler(sqlwhere: string): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_where(_mdfelacunidtranspcte, sqlwhere));
  try
    result := Ler(q.q);
  finally
    FreeAndNil(q);
  end;
end;

function TMDFELacunidTranspCTEList.Ler(Dataset: TDataset): boolean;
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

function TMDFELacunidTranspCTEList.New: TMDFELacunidTranspcte;
begin
  Result := TMDFELacunidTranspcte.Create;
  Add(Result);
end;

procedure TMDFELacunidTranspCTEList.SetItem(Index: Integer; const Value: TMDFELacunidTranspcte);
begin
  Put(Index, Value);
end;

end.
