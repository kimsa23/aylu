unit orm.CartaCorrecaoCTE;

interface

uses Contnrs, Data.DB, System.SysUtils, System.Classes,
  uConstantes,
  Rotina.Retornasql,
  Classe.DAO, classe.query;

type
  TCartaCorrecaoCTE = class(TRegistroQuipos)
  private
    Fdsxml: string;
    Fcdcte: integer;
    Ftsemissao: TDateTime;
    Fnuprotocolo: string;
    Fcdcartacorrecaocte: integer;
    Fnseqevento: integer;
  public
    [keyfield]
    property cdcartacorrecaocte : integer read Fcdcartacorrecaocte write Fcdcartacorrecaocte;
    [fk]
    property cdcte : integer read Fcdcte write Fcdcte;
    property dsxml : string read Fdsxml write Fdsxml;
    property tsemissao : TDateTime read Ftsemissao write Ftsemissao;
    property nuprotocolo : string read Fnuprotocolo write Fnuprotocolo;
    property nseqevento : integer read Fnseqevento write Fnseqevento;
  end;
  TCartaCorrecaoCTEList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TCartaCorrecaoCTE;
    procedure SetItem(Index: Integer; const Value: TCartaCorrecaoCTE);
  public
    function New: TCartaCorrecaoCTE;
    property Items[Index: Integer]: TCartaCorrecaoCTE read GetItem write SetItem;
    function Ler(codigo:Integer):Boolean;overload;
    function Ler(Dataset: TDataset):boolean;overload;
  end;

implementation

function TCartaCorrecaoCTEList.GetItem(Index: Integer): TCartaCorrecaoCTE;
begin
  Result := TCartaCorrecaoCTE(Inherited Items[Index]);
end;

function TCartaCorrecaoCTEList.Ler(codigo: Integer): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_CartaCorrecaoCTE, codigo, _cdCTE));
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

function TCartaCorrecaoCTEList.Ler(Dataset: TDataset): boolean;
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

function TCartaCorrecaoCTEList.New: TCartaCorrecaoCTE;
begin
  Result := TCartaCorrecaoCTE.Create;
  Add(Result);
end;

procedure TCartaCorrecaoCTEList.SetItem(Index: Integer; const Value: TCartaCorrecaoCTE);
begin
  Put(Index, Value);
end;

end.
