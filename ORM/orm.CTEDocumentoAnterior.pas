unit orm.CTEDocumentoAnterior;

interface

uses Contnrs, Data.DB, System.SysUtils, System.Classes,
  uConstantes,
  Rotina.Retornasql,
  orm.ItCTEDocumentoAnterior,
  Classe.DAO, classe.query;

type
  TCTEDocumentoAnterior = class(TRegistroQuipos)
  private
    Fcdcliente: LargeInt;
    Fcdctedocumentoanterior: integer;
    Fcdcte: integer;
    Fitctedocumentoanterior: TItCTEDocumentoAnteriorList;
  public
   [keyfield]
    property cdctedocumentoanterior : integer read Fcdctedocumentoanterior write Fcdctedocumentoanterior;
    [fk]
    property cdcte : integer read Fcdcte write Fcdcte;
    [fk]
    property cdcliente : LargeInt read Fcdcliente write Fcdcliente;
    property itctedocumentoanterior : TItCTEDocumentoAnteriorList read Fitctedocumentoanterior write Fitctedocumentoanterior;
    constructor create;
    destructor destroy; override;
  end;
  TCTeDocumentoAnteriorList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TCTeDocumentoAnterior;
    procedure SetItem(Index: Integer; const Value: TCTeDocumentoAnterior);
  public
    function New: TCTeDocumentoAnterior;
    property Items[Index: Integer]: TCTeDocumentoAnterior read GetItem write SetItem;
    function Ler(codigo:Integer):Boolean;overload;
    function Ler(Dataset: TDataset):boolean;overload;
    function Ler(Dataset, itdataset: TDataset):boolean;overload;
  end;

implementation

constructor TCTEDocumentoAnterior.create;
begin
  inherited;
  fitctedocumentoanterior := titctedocumentoanteriorlist.create;
end;

destructor TCTEDocumentoAnterior.destroy;
begin
  freeandnil(fitctedocumentoanterior);
  inherited;
end;

function TCTeDocumentoAnteriorList.GetItem(Index: Integer): TCTeDocumentoAnterior;
begin
  Result := TCTeDocumentoAnterior(Inherited Items[Index]);
end;

function TCTeDocumentoAnteriorList.Ler(codigo: Integer): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_CTeDocumentoAnterior, codigo, _cdCTE));
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

function TCTeDocumentoAnteriorList.Ler(Dataset: TDataset): boolean;
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

function TCTeDocumentoAnteriorList.New: TCTeDocumentoAnterior;
begin
  Result := TCTeDocumentoAnterior.Create;
  Add(Result);
end;

procedure TCTeDocumentoAnteriorList.SetItem(Index: Integer; const Value: TCTeDocumentoAnterior);
begin
  Put(Index, Value);
end;

function TCTeDocumentoAnteriorList.Ler(Dataset, itdataset: TDataset): boolean;
begin
  clear;
  result := Dataset.RecordCount > 0;
  if not result then
  begin
    Exit;
  end;
  while not Dataset.Eof do
  begin
    with new do
    begin
      Select(Dataset);
      itctedocumentoanterior.Ler(itdataset);
    end;
    Dataset.Next;
  end;
end;

end.
