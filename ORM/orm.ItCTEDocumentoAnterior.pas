unit orm.ItCTEDocumentoAnterior;

interface

uses Contnrs, Data.DB, System.SysUtils, System.Classes,
  uConstantes,
  Rotina.Retornasql,
  Classe.DAO, classe.query;

type
  TItCTEDocumentoAnterior = class(TRegistroQuipos)
  private
    Fcditctedocumentoanterior: integer;
    Fcdctedocumentoanterior: integer;
    Fnuctetpdocumentoanterior: string;
    Fnusubserie: string;
    Fnuserie: string;
    Fnudocumento: integer;
    Fnuchave: string;
    Fdtemissao: TDate;
  public
    [keyfield]
    property cditctedocumentoanterior : integer read Fcditctedocumentoanterior write Fcditctedocumentoanterior;
    [fk]
    property cdctedocumentoanterior : integer read Fcdctedocumentoanterior write Fcdctedocumentoanterior;
    property nuctetpdocumentoanterior : string read Fnuctetpdocumentoanterior write Fnuctetpdocumentoanterior;
    property nuserie : string read Fnuserie write Fnuserie;
    property nusubserie : string read Fnusubserie write Fnusubserie;
    property dtemissao : TDate read Fdtemissao write Fdtemissao;
    property nudocumento : integer read Fnudocumento write Fnudocumento;
    property nuchave : string read Fnuchave write Fnuchave;
  end;
  TItCTeDocumentoAnteriorList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TItCTeDocumentoAnterior;
    procedure SetItem(Index: Integer; const Value: TItCTeDocumentoAnterior);
  public
    function New: TItCTeDocumentoAnterior;
    property Items[Index: Integer]: TItCTeDocumentoAnterior read GetItem write SetItem;
    function Ler(codigo:Integer):Boolean;overload;
    function Ler(Dataset: TDataset):boolean;overload;
  end;

implementation

function TItCTeDocumentoAnteriorList.GetItem(Index: Integer): TItCTeDocumentoAnterior;
begin
  Result := TItCTeDocumentoAnterior(Inherited Items[Index]);
end;

function TItCTeDocumentoAnteriorList.Ler(Dataset: TDataset): boolean;
begin
  clear;
  result := false;
  dataset.first;
  while not Dataset.Eof do
  begin
    new.Select(Dataset);
    Dataset.Next;
    result := true;
  end;
end;

function TItCTeDocumentoAnteriorList.Ler(codigo: Integer): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_itCTeDocumentoAnterior, codigo, _cdCTEdocumentoanterior));
  try
    clear;
    result := q.q.RecordCount > 0;
    if not result then
    begin
      Exit;
    end;
    Ler(q.q);
  finally
    FreeAndNil(q);
  end;
end;

function TItCTeDocumentoAnteriorList.New: TItCTeDocumentoAnterior;
begin
  Result := TItCTeDocumentoAnterior.Create;
  Add(Result);
end;

procedure TItCTeDocumentoAnteriorList.SetItem(Index: Integer; const Value: TItCTeDocumentoAnterior);
begin
  Put(Index, Value);
end;

end.
