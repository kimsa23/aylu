unit orm.UFOrigemDestino;

interface

uses contnrs, System.SysUtils, System.Classes,
  uConstantes,
  Rotina.Retornasql,
  Classe.DAO, classe.query;

type
  TUFOrigemDestino = class(TPersintentObject)
  protected
    Falicms: double;
    Fcdufdestino: integer;
    Fcduf: integer;
  public
    [keyfield]
    property cduf : integer read Fcduf write fcduf;
    [keyfield]
    property cdufdestino : integer read Fcdufdestino write fcdufdestino;
    [AObrigatorio]
    property alicms : double read Falicms write falicms;
  end;
  TUFOrigemDestinoList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TUFOrigemDestino;
    procedure SetItem(Index: Integer; const Value: TUFOrigemDestino);
  public
    function New: TUFOrigemDestino;
    property Items[Index: Integer]: TUFOrigemDestino read GetItem write SetItem;
    function Ler(codigo:Integer):Boolean;
  end;

implementation

function TUFOrigemDestinoList.GetItem(Index: Integer): TUFOrigemDestino;
begin
  Result := TUFOrigemDestino(Inherited Items[Index]);
end;

function TUFOrigemDestinoList.Ler(codigo: Integer): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_UFOrigemDestino, codigo, _cduf));
  try
    clear;
    result := q.q.RecordCount > 0;
    if not result then
    begin
      Exit;
    end;
    while not q.q.Eof do
    begin
      new.Select(q.q);
      q.q.Next;
    end;
  finally
    FreeAndNil(q);
  end;
end;

function TUFOrigemDestinoList.New: TUFOrigemDestino;
begin
  Result := TUFOrigemDestino.Create;
  Add(Result);
end;

procedure TUFOrigemDestinoList.SetItem(Index: Integer; const Value: TUFOrigemDestino);
begin
  Put(Index, Value);
end;

end.
