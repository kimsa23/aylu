unit orm.mdfeautxml;

interface

uses Data.DB, contnrs, System.SysUtils, System.Classes,
  uConstantes,
  Rotina.Retornasql,
  Classe.DAO, classe.query;

type
  TMDFEAutXML = class(TRegistroQuipos)
  private
    fcdmdfeautxml: integer;
    fcdmdfe: Integer;
    fbomanual: string;
    fnucnpjcpf: string;
  public
    [KeyField]
    property cdmdfeautxml : integer read fcdmdfeautxml write fcdmdfeautxml;
    [FK, AObrigatorio]
    property cdmdfe : Integer read fcdmdfe write fcdmdfe;
    [AObrigatorio]
    property nucnpjcpf : string read fnucnpjcpf write fnucnpjcpf;
    property bomanual : string read fbomanual write fbomanual;
  end;
  TMDFEAutXMLList = class(TObjectList)
  private
    function GetItem(Index: Integer): TMDFEAutXML;
    procedure SetItem(Index: Integer; const Value: TMDFEAutXML);
  public
    function New: TMDFEAutXML;
    property Items[Index: Integer]: TMDFEAutXML read GetItem write SetItem;
    function Ler(sqlwhere:string):Boolean; overload;
    function Ler(Dataset: TDataset):boolean; overload;
  end;

implementation

function TMDFEAutXMLList.GetItem(Index: Integer): TMDFEAutXML;
begin
  Result := TMDFEAutXML(Inherited Items[Index]);
end;

function TMDFEAutXMLList.Ler(sqlwhere: string): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_where(_mdfeautxml, sqlwhere));
  try
    result := Ler(q.q);
  finally
    FreeAndNil(q);
  end;
end;

function TMDFEAutXMLList.Ler(Dataset: TDataset): boolean;
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

function TMDFEAutXMLList.New: TMDFEAutXML;
begin
  Result := TMDFEAutXML.Create;
  Add(Result);
end;

procedure TMDFEAutXMLList.SetItem(Index: Integer; const Value: TMDFEAutXML);
begin
  Put(Index, Value);
end;

end.
