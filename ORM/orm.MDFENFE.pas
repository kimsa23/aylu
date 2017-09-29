unit orm.MDFENFE;

interface

uses contnrs, Data.DB, System.SysUtils, System.Classes,
  uConstantes,
  Rotina.Retornasql,
  classe.query, Classe.DAO;

type
  TMDFENFE = class(TRegistroQuipos)
  private
    fcdmdfe : Integer;
    //fcdcteremetentenota : Integer;
    fcdmunicipio : Integer;
    fnuchavenfe : string;
    Fcdmdfenfe: integer;
    findreentrega: string;
    procedure Setcdmdfenfe(const Value: integer);
  public
    [keyfield]
    property cdmdfenfe : integer read Fcdmdfenfe write Setcdmdfenfe;
    [fk]
    property cdmdfe : Integer read fcdmdfe write fcdmdfe;
    [fk]
    property cdmunicipio : Integer read fcdmunicipio write fcdmunicipio;
    property nuchavenfe : string read fnuchavenfe write fnuchavenfe;
    property indreentrega: string read findreentrega write findreentrega;
  end;
  TMDFENFEList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TMDFENFE;
    procedure SetItem(Index: Integer; const Value: TMDFENFE);
  public
    function New: TMDFENFE;
    property Items[Index: Integer]: TMDFENFE read GetItem write SetItem;
    function Ler(sqlwhere:string):Boolean; overload;
    function Ler(Dataset: TDataset):boolean; overload;
    function Cancelar(boscript:boolean=false):string;
  end;

implementation

function TMDFENFEList.Cancelar(boscript: boolean): string;
var
  I: Integer;
begin
  result := '';
  for I := 0 to count - 1 do
  begin
    if result <> '' then
    begin
      result := result + #13;
    end;
    result := result + items[i].Delete(boscript);
  end;
end;

function TMDFENFEList.GetItem(Index: Integer): TMDFENFE;
begin
  Result := TMDFENFE(Inherited Items[Index]);
end;

function TMDFENFEList.Ler(Dataset: TDataset): boolean;
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

function TMDFENFEList.Ler(sqlwhere:string): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_where(_MDFENFE, sqlwhere));
  try
    result := Ler(q.q);
  finally
    FreeAndNil(q);
  end;
end;

function TMDFENFEList.New: TMDFENFE;
begin
  Result := TMDFENFE.Create;
  Add(Result);
end;

procedure TMDFENFEList.SetItem(Index: Integer; const Value: TMDFENFE);
begin
  Put(Index, Value);
end;

procedure TMDFENFE.Setcdmdfenfe(const Value: integer);
begin
  Fcdmdfenfe := Value;
end;

end.
