unit orm.MDFEMunicipioPercurso;

interface

uses contnrs, System.SysUtils, System.Classes,
  uConstantes,
  Rotina.Retornasql,
  classe.query, Classe.DAO;

type
  TMDFEMunicipioPercurso = class(TRegistroQuipos)
  private
    fcdmdfe : Integer;
    fcdmunicipio : Integer;
  public
    [keyfield]
    property cdmdfe : integer read fcdmdfe write fcdmdfe;
    [keyfield]
    property cdmunicipio : integer read fcdmunicipio write fcdmunicipio;
  end;
  TMDFEMunicipioPercursoList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TMDFEMunicipioPercurso;
    procedure SetItem(Index: Integer; const Value: TMDFEMunicipioPercurso);
  public
    function New: TMDFEMunicipioPercurso;
    property Items[Index: Integer]: TMDFEMunicipioPercurso read GetItem write SetItem;
    function Ler(codigo:Integer):Boolean;
  end;

implementation

function TMDFEMunicipioPercursoList.GetItem(Index: Integer): TMDFEMunicipioPercurso;
begin
  Result := TMDFEMunicipioPercurso(Inherited Items[Index]);
end;

function TMDFEMunicipioPercursoList.Ler(codigo: Integer): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_MDFEMunicipioPercurso, codigo, _cdmdfe));
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

function TMDFEMunicipioPercursoList.New: TMDFEMunicipioPercurso;
begin
  Result := TMDFEMunicipioPercurso.Create;
  Add(Result);
end;

procedure TMDFEMunicipioPercursoList.SetItem(Index: Integer; const Value: TMDFEMunicipioPercurso);
begin
  Put(Index, Value);
end;

end.
