unit orm.ItCartaCorrecaoCte;

interface

uses Contnrs, System.SysUtils, System.Classes,
  uConstantes,
  Rotina.Retornasql,
  Classe.DAO, classe.query;

type
  TItCartaCorrecaoCte = class(TRegistroQuipos)
  private
    Fdsitcartacorrecaocte: string;
    Fcdcartacorrecaocteitem: integer;
    Fnuitem: integer;
    Fcdcartacorrecaoctegrupo: integer;
    Fcditcartacorrecaocte: integer;
    Fcdcartacorrecaocte: integer;
  public
    [keyfield]
    property cditcartacorrecaocte : integer read Fcditcartacorrecaocte write Fcditcartacorrecaocte;
    [fk]
    property cdcartacorrecaocte : integer read Fcdcartacorrecaocte write Fcdcartacorrecaocte;
    [fk]
    property cdcartacorrecaoctegrupo : integer read Fcdcartacorrecaoctegrupo write Fcdcartacorrecaoctegrupo;
    [fk]
    property cdcartacorrecaocteitem : integer read Fcdcartacorrecaocteitem write Fcdcartacorrecaocteitem;
    property nuitem : integer read Fnuitem write Fnuitem;
    property dsitcartacorrecaocte : string read Fdsitcartacorrecaocte write Fdsitcartacorrecaocte;
  end;
  TItCartaCorrecaoCteList = class(TObjectList)
  private
    function GetItem(Index: Integer): TItCartaCorrecaoCte;
    procedure SetItem(Index: Integer; const Value: TItCartaCorrecaoCte);
  public
    function New: TItCartaCorrecaoCte;
    property Items[Index: Integer]: TItCartaCorrecaoCte read GetItem write SetItem;
    function Ler(codigo:Integer):Boolean;
  end;

implementation

function TItCartaCorrecaoCteList.GetItem(Index: Integer): TItCartaCorrecaoCte;
begin
  Result := TItCartaCorrecaoCte(Inherited Items[Index]);
end;

function TItCartaCorrecaoCteList.Ler(codigo: Integer): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_ItCartaCorrecaoCte, codigo, _cdcartacorrecaoCTE));
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

function TItCartaCorrecaoCteList.New: TItCartaCorrecaoCte;
begin
  Result := TItCartaCorrecaoCte.Create;
  Add(Result);
end;

procedure TItCartaCorrecaoCteList.SetItem(Index: Integer; const Value: TItCartaCorrecaoCte);
begin
  Put(Index, Value);
end;

end.
