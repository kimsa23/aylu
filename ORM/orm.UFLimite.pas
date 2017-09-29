unit orm.UFLimite;

interface

uses contnrs, System.SysUtils, System.Classes,
  uConstantes,
  Rotina.Retornasql,
  Classe.DAO, classe.query;

type
  TUFLimite = class(TPersintentObject)
  private
    fcduflimite: integer;
    fcduf: integer;
  public
   [KeyField]
   property cduf : integer read fcduf write fcduf;
   [KeyField]
   property cduflimite : integer read fcduflimite write fcduflimite;
  end;
  TUFLimiteList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TUFLimite;
    procedure SetItem(Index: Integer; const Value: TUFLimite);
  public
    function New: TUFLimite;
    property Items[Index: Integer]: TUFLimite read GetItem write SetItem;
    function Ler(codigo:Integer):Boolean;
    function Elimite(cduf:Integer):boolean;
  end;

implementation

function TUFLimiteList.Elimite(cduf: Integer): boolean;
var
  I: Integer;
begin
  result := False;
  for I := 0 to Count - 1 do
  begin
    if Items[i].cduflimite = cduf then
    begin
      result := True;
      Break;
    end;
  end;
end;

function TUFLimiteList.GetItem(Index: Integer): TUFLimite;
begin
  Result := TUFLimite(Inherited Items[Index]);
end;

function TUFLimiteList.Ler(codigo: Integer): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_uflimite, codigo, _cduf));
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

function TUFLimiteList.New: TUFLimite;
begin
  Result := TUFLimite.Create;
  Add(Result);
end;

procedure TUFLimiteList.SetItem(Index: Integer; const Value: TUFLimite);
begin
  Put(Index, Value);
end;

end.
