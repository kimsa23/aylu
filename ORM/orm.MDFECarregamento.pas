unit orm.MDFECarregamento;

interface

uses contnrs, Data.DB, System.SysUtils, System.Classes,
  uConstantes,
  Rotina.Retornasql,
  Classe.DAO, classe.query;

type
  TMDFECarregamento = class(TRegistroQuipos)
  private
    fcdmdfe : Integer;
    fcdmunicipio : Integer;
  public
    [keyfield]
    property cdmdfe : Integer read fcdmdfe write fcdmdfe;
    [keyfield]
    property cdmunicipio : Integer read fcdmunicipio write fcdmunicipio;
  end;
  TMDFECarregamentoList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TMDFECarregamento;
    procedure SetItem(Index: Integer; const Value: TMDFECarregamento);
  public
    function New: TMDFECarregamento;
    property Items[Index: Integer]: TMDFECarregamento read GetItem write SetItem;
    function Ler(codigo:Integer):Boolean;overload;
    function Ler(Dataset: TDataset):boolean;overload;
  end;

implementation

function TMDFECarregamentoList.GetItem(Index: Integer): TMDFECarregamento;
begin
  Result := TMDFECarregamento(Inherited Items[Index]);
end;

function TMDFECarregamentoList.Ler(codigo: Integer): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_MDFECarregamento, codigo, _cdmdfe));
  try
    result := Ler(q.q);
  finally
    FreeAndNil(q);
  end;
end;

function TMDFECarregamentoList.Ler(Dataset: TDataset): boolean;
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

function TMDFECarregamentoList.New: TMDFECarregamento;
begin
  Result := TMDFECarregamento.Create;
  Add(Result);
end;

procedure TMDFECarregamentoList.SetItem(Index: Integer; const Value: TMDFECarregamento);
begin
  Put(Index, Value);
end;

end.
