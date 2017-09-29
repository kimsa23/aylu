unit orm.MDFETransportadora;

interface

uses Data.DB, contnrs, System.SysUtils, System.Classes,
  uConstantes,
  Rotina.Retornasql,
  Classe.DAO, classe.query;

type
  TMDFETransportadora = class(TRegistroQuipos)
  private
    fcdmdfe : Integer;
    fcdtransportadora : largeint;
  public
    [keyfield]
    property cdmdfe : Integer read fcdmdfe write fcdmdfe;
    [keyfield]
    property cdtransportadora : largeint read fcdtransportadora write fcdtransportadora;
  end;
  TMDFETransportadoraList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TMDFETransportadora;
    procedure SetItem(Index: Integer; const Value: TMDFETransportadora);
  public
    function New: TMDFETransportadora;
    property Items[Index: Integer]: TMDFETransportadora read GetItem write SetItem;
    function Ler(codigo:Integer):Boolean;overload;
    function Ler(Dataset: TDataset):boolean;overload;
  end;

implementation

function TMDFETransportadoraList.GetItem(Index: Integer): TMDFETransportadora;
begin
  Result := TMDFETransportadora(Inherited Items[Index]);
end;

function TMDFETransportadoraList.Ler(codigo: Integer): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_MDFETransportadora, codigo, _cdmdfe));
  try
    result := Ler(q.q);
  finally
    FreeAndNil(q);
  end;
end;

function TMDFETransportadoraList.Ler(Dataset: TDataset): boolean;
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

function TMDFETransportadoraList.New: TMDFETransportadora;
begin
  Result := TMDFETransportadora.Create;
  Add(Result);
end;

procedure TMDFETransportadoraList.SetItem(Index: Integer; const Value: TMDFETransportadora);
begin
  Put(Index, Value);
end;

end.
