unit orm.MDFEveiculo;

interface

uses contnrs, Data.DB, System.SysUtils, System.Classes,
  uConstantes,
  Rotina.Retornasql,
  Classe.DAO, classe.query;

type
  TMDFEveiculo = class(TRegistroQuipos)
  private
    fcdmdfe : Integer;
    fcdveiculo : Integer;
  public
    [keyfield]
    property cdmdfe : Integer read fcdmdfe write fcdmdfe;
    [keyfield]
    property cdveiculo : Integer read fcdveiculo write fcdveiculo;
  end;
  TMDFEveiculoList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TMDFEveiculo;
    procedure SetItem(Index: Integer; const Value: TMDFEveiculo);
  public
    function New: TMDFEveiculo;
    property Items[Index: Integer]: TMDFEveiculo read GetItem write SetItem;
    function Ler(codigo:Integer):Boolean;overload;
    function Ler(Dataset: TDataset):boolean;overload;
  end;

implementation

function TMDFEveiculoList.GetItem(Index: Integer): TMDFEveiculo;
begin
  Result := TMDFEveiculo(Inherited Items[Index]);
end;

function TMDFEveiculoList.Ler(codigo: Integer): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_MDFEveiculo, codigo, _cdmdfe));
  try
    result := Ler(q.q);
  finally
    FreeAndNil(q);
  end;
end;

function TMDFEveiculoList.Ler(Dataset: TDataset): boolean;
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

function TMDFEveiculoList.New: TMDFEveiculo;
begin
  Result := TMDFEveiculo.Create;
  Add(Result);
end;

procedure TMDFEveiculoList.SetItem(Index: Integer; const Value: TMDFEveiculo);
begin
  Put(Index, Value);
end;

end.
