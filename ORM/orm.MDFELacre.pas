unit orm.MDFELacre;

interface

uses contnrs, Data.DB, System.SysUtils, System.Classes,
  uConstantes,
  Rotina.Retornasql,
  classe.query, Classe.DAO;

type
  TMDFELacre = class(TRegistroQuipos)
  private
    fcdmdfe : Integer;
    fcdmdfelacre : Integer;
    fnulacre : string;
  public
    [keyfield]
    property cdmdfelacre : Integer read fcdmdfelacre write fcdmdfelacre;
    [fk]
    property cdmdfe : Integer read fcdmdfe write fcdmdfe;
    property nulacre : string read fnulacre write fnulacre;
  end;
  TMDFELacreList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TMDFELacre;
    procedure SetItem(Index: Integer; const Value: TMDFELacre);
  public
    function New: TMDFELacre;
    property Items[Index: Integer]: TMDFELacre read GetItem write SetItem;
    function Ler(codigo:Integer):Boolean;overload;
    function Ler(Dataset: TDataset):boolean;overload;
  end;

implementation

function TMDFELacreList.GetItem(Index: Integer): TMDFELacre;
begin
  Result := TMDFELacre(Inherited Items[Index]);
end;

function TMDFELacreList.Ler(codigo: Integer): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_MDFELacre, codigo, _cdmdfe));
  try
    result := Ler(q.q);
  finally
    FreeAndNil(q);
  end;
end;

function TMDFELacreList.Ler(Dataset: TDataset): boolean;
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

function TMDFELacreList.New: TMDFELacre;
begin
  Result := TMDFELacre.Create;
  Add(Result);
end;

procedure TMDFELacreList.SetItem(Index: Integer; const Value: TMDFELacre);
begin
  Put(Index, Value);
end;

end.
