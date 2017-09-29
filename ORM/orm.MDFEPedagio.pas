unit orm.MDFEPedagio;

interface

uses Data.DB, contnrs, System.SysUtils, System.Classes,
  uConstantes,
  Rotina.Retornasql,
  Classe.DAO, classe.query;

type
  TMDFEPedagio = class(TRegistroQuipos)
  private
    fcdmdfe : Integer;
    fcdmdfepedagio : integer;
    fcdfornecedor : LargeInt;
    fcdresponsavel : Integer;
    fnucomprovante : string;
    fvvaleped: Currency;
  public
    [keyfield]
    property cdmdfepedagio : integer read fcdmdfepedagio write fcdmdfepedagio;
    [fk]
    property cdmdfe : Integer read fcdmdfe write fcdmdfe;
    [fk]
    property cdfornecedor : LargeInt read fcdfornecedor write fcdfornecedor;
    [fk]
    property cdresponsavel : Integer read fcdresponsavel write fcdresponsavel;
    property nucomprovante : string read fnucomprovante write fnucomprovante;
    property vvaleped: Currency read fvvaleped write fvvaleped;
  end;
  TMDFEPedagioList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TMDFEPedagio;
    procedure SetItem(Index: Integer; const Value: TMDFEPedagio);
  public
    function New: TMDFEPedagio;
    property Items[Index: Integer]: TMDFEPedagio read GetItem write SetItem;
    function Ler(codigo:Integer):Boolean;overload;
    function Ler(Dataset: TDataset):boolean;overload;
  end;

implementation

function TMDFEPedagioList.GetItem(Index: Integer): TMDFEPedagio;
begin
  Result := TMDFEPedagio(Inherited Items[Index]);
end;

function TMDFEPedagioList.Ler(codigo: Integer): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_MDFEPedagio, codigo, _cdmdfe));
  try
    result := Ler(q.q);
  finally
    FreeAndNil(q);
  end;
end;

function TMDFEPedagioList.Ler(Dataset: TDataset): boolean;
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

function TMDFEPedagioList.New: TMDFEPedagio;
begin
  Result := TMDFEPedagio.Create;
  Add(Result);
end;

procedure TMDFEPedagioList.SetItem(Index: Integer; const Value: TMDFEPedagio);
begin
  Put(Index, Value);
end;

end.
