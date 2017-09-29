unit orm.MDFEUFPercurso;

interface

uses contnrs, Data.DB, System.SysUtils, System.Classes,
  uConstantes,
  Rotina.Retornasql,
  Classe.DAO, classe.query;

type
  TMDFEUFPercurso = class(TRegistroQuipos)
  private
    fcdmdfe : Integer;
    fcduf : Integer;
  public
    [keyfield]
    property cdmdfe : integer read fcdmdfe write fcdmdfe;
    [keyfield]
    property cduf : integer read fcduf write fcduf;
  end;
  TMDFEUFPercursoList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TMDFEUFPercurso;
    procedure SetItem(Index: Integer; const Value: TMDFEUFPercurso);
  public
    function New: TMDFEUFPercurso;
    property Items[Index: Integer]: TMDFEUFPercurso read GetItem write SetItem;
    function Ler(codigo:Integer):Boolean;overload;
    function Ler(Dataset: TDataset):boolean;overload;
  end;

implementation

function TMDFEUFPercursoList.GetItem(Index: Integer): TMDFEUFPercurso;
begin
  Result := TMDFEUFPercurso(Inherited Items[Index]);
end;

function TMDFEUFPercursoList.Ler(codigo: Integer): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_MDFEUFPercurso, codigo, _cdmdfe));
  try
    result := Ler(q.q);
  finally
    FreeAndNil(q);
  end;
end;

function TMDFEUFPercursoList.Ler(Dataset: TDataset): boolean;
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

function TMDFEUFPercursoList.New: TMDFEUFPercurso;
begin
  Result := TMDFEUFPercurso.Create;
  Add(Result);
end;

procedure TMDFEUFPercursoList.SetItem(Index: Integer; const Value: TMDFEUFPercurso);
begin
  Put(Index, Value);
end;

end.
