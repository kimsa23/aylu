unit orm.ItRegraStMVA;

interface

uses contnrs, System.SysUtils, System.Classes,
  uConstantes,
  Rotina.Retornasql,
  Classe.DAO, classe.query;

type
  TItRegraStMVA = class(TRegistroQuipos)
  private
    Fcditregrastmva: integer;
    Falicmssubtrib: double;
    Falmva: double;
    Fcditregrast: integer;
    Fcduf: integer;
  public
    [keyfield]
    property cditregrastmva : integer read Fcditregrastmva write fcditregrastmva;
    [fk]
    property cditregrast : integer read Fcditregrast write fcditregrast;
    [fk]
    property cduf : integer read Fcduf write fcduf;
    property alicmssubtrib : double read Falicmssubtrib write falicmssubtrib;
    property almva : double read Falmva write falmva;
  end;
  TItRegraStMVAList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TItRegraStMVA;
    procedure SetItem(Index: Integer; const Value: TItRegraStMVA);
  public
    function New: TItRegraStMVA;
    property Items[Index: Integer]: TItRegraStMVA read GetItem write SetItem;
    function Ler(codigo:Integer):Boolean; overload;
    function Ler(sqlwhere:string):boolean; overload;
  end;

implementation

function TItRegraStMVAList.GetItem(Index: Integer): TItRegraStMVA;
begin
  Result := TItRegraStMVA(Inherited Items[Index]);
end;

function TItRegraStMVAList.Ler(codigo: Integer): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_ItRegraStMVA, codigo, _cditregrast));
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

function TItRegraStMVAList.Ler(sqlwhere: string): boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_where(_ItRegraStMVA, sqlwhere));
  try
    clear;
    result := q.q.RecordCount > 0;
    if not result then
    begin
      Exit;
    end;
    while not q.q.Eof do
    begin
      new.select(q.q);
      q.q.Next;
    end;
  finally
    FreeAndNil(q);
  end;
end;

function TItRegraStMVAList.New: TItRegraStMVA;
begin
  Result := TItRegraStMVA.Create;
  Add(Result);
end;

procedure TItRegraStMVAList.SetItem(Index: Integer; const Value: TItRegraStMVA);
begin
  Put(Index, Value);
end;

end.
