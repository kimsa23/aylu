unit orm.CTEQTDCarga;

interface

uses Contnrs, Data.DB, System.SysUtils, System.Classes,
  uConstantes,
  Rotina.Retornasql,
  Classe.DAO, classe.query;

type
  TCTEQTDCarga = class(TRegistroQuipos)
  private
    Fcdcte: integer;
    Fqtitem: double;
    Fcdunidade: integer;
    Fcdcteqtdcarga: integer;
    Fcdctetpmedida: integer;
  public
    [keyfield]
    property cdcteqtdcarga : integer read Fcdcteqtdcarga write Fcdcteqtdcarga;
    [fk]
    property cdcte : integer read Fcdcte write Fcdcte;
    [fk]
    property cdunidade : integer read Fcdunidade write Fcdunidade;
    [fk]
    property cdctetpmedida : integer read Fcdctetpmedida write Fcdctetpmedida;
    property qtitem : double read Fqtitem write Fqtitem;
  end;
  TCTEQTDCargaList = class(TObjectList)
  private
    function GetItem(Index: Integer): TCTEQTDCarga;
    procedure SetItem(Index: Integer; const Value: TCTEQTDCarga);
  public
    function New: TCTEQTDCarga;
    property Items[Index: Integer]: TCTEQTDCarga read GetItem write SetItem;
    function Ler(codigo:Integer):Boolean;overload;
    function Ler(Dataset: TDataset):boolean;overload;
    function excluir(boscript:boolean=false):string;
  end;

implementation

function TCTEQTDCargaList.excluir(boscript: boolean): string;
var
  I: Integer;
begin
  for I := 0 to count - 1 do
  begin
    result := result + items[i].Delete(boscript)+#13;
  end;
end;

function TCTEQTDCargaList.GetItem(Index: Integer): TCTEQTDCarga;
begin
  Result := TCTEQTDCarga(Inherited Items[Index]);
end;

function TCTEQTDCargaList.Ler(codigo: Integer): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_CTEQTDCarga, codigo, _cdCTE));
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

function TCTEQTDCargaList.Ler(Dataset: TDataset): boolean;
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

function TCTEQTDCargaList.New: TCTEQTDCarga;
begin
  Result := TCTEQTDCarga.Create;
  Add(Result);
end;

procedure TCTEQTDCargaList.SetItem(Index: Integer; const Value: TCTEQTDCarga);
begin
  Put(Index, Value);
end;

end.
