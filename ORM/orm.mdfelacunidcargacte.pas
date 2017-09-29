unit orm.mdfelacunidcargacte;

interface

uses Data.DB, contnrs, System.SysUtils, System.Classes,
  uConstantes,
  Rotina.Retornasql,
  Classe.DAO, classe.query;

type
  TMDFELacUnidCargaCte = class(TRegistroQuipos)
  private
    fnlacre: string;
    fcdinfunidcargacte: integer;
    fcdmdfelacunidcargacte: integer;
  public
    [KeyField]
    property cdmdfelacunidcargacte : integer read fcdmdfelacunidcargacte write fcdmdfelacunidcargacte;
    property nlacre : string read fnlacre write fnlacre;
    [fk, aobrigatorio]
    property cdinfunidcargacte: integer read fcdinfunidcargacte write fcdinfunidcargacte;
  end;
  TMDFELacUnidCargaCteList = class(TObjectList)
  private
    function GetItem(Index: Integer): TMDFELacUnidCargaCte;
    procedure SetItem(Index: Integer; const Value: TMDFELacUnidCargaCte);
  public
    function New: TMDFELacUnidCargaCte;
    property Items[Index: Integer]: TMDFELacUnidCargaCte read GetItem write SetItem;
    function Ler(sqlwhere:string):Boolean; overload;
    function Ler(Dataset: TDataset):boolean; overload;
  end;

implementation

function TMDFELacUnidCargaCteList.GetItem(Index: Integer): TMDFELacUnidCargaCte;
begin
  Result := TMDFELacUnidCargaCte(Inherited Items[Index]);
end;

function TMDFELacUnidCargaCteList.Ler(sqlwhere: string): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_where(_mdfelacunidcargacte, sqlwhere));
  try
    result := Ler(q.q);
  finally
    FreeAndNil(q);
  end;
end;

function TMDFELacUnidCargaCteList.Ler(Dataset: TDataset): boolean;
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

function TMDFELacUnidCargaCteList.New: TMDFELacUnidCargaCte;
begin
  Result := TMDFELacUnidCargaCte.Create;
  Add(Result);
end;

procedure TMDFELacUnidCargaCteList.SetItem(Index: Integer; const Value: TMDFELacUnidCargaCte);
begin
  Put(Index, Value);
end;

end.
