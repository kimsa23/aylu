unit orm.itprodutocusto;

interface

uses contnrs, System.SysUtils, System.Classes,
  uConstantes,
  Rotina.Retornasql,
  Classe.DAO, classe.query;

type
  titprodutocusto = class(TRegistroQuipos)
  private
    Fqtitem: Double;
    Fcditprodutocusto: Integer;
    Fcdproduto: Integer;
    Fcdprodutocusto: Integer;
    Fcddigitado: string;
  public
    [keyfield]
    property cditprodutocusto : Integer read Fcditprodutocusto write fcditprodutocusto;
    property cdproduto : Integer read Fcdproduto write fcdproduto;
    property cdprodutocusto : Integer read Fcdprodutocusto write fcdprodutocusto;
    property qtitem : Double read Fqtitem write fqtitem;
    property cddigitado : string read Fcddigitado write fcddigitado;
  end;
  TitprodutocustoList = class(TObjectList)
  private
    function  GetItem(Index: Integer): Titprodutocusto;
    procedure SetItem(Index: Integer; const Value: Titprodutocusto);
  public
    function New: Titprodutocusto;
    property Items[Index: Integer]: Titprodutocusto read GetItem write SetItem;
    function Ler(codigo:Integer):boolean;
  end;

implementation

function TitprodutocustoList.GetItem(Index: Integer): Titprodutocusto;
begin
  Result := Titprodutocusto(Inherited Items[Index]);
end;

function TitprodutocustoList.Ler(codigo: Integer): boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_itprodutocusto, codigo, _cdprodutocusto));
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

function TitprodutocustoList.New: Titprodutocusto;
begin
  Result := Titprodutocusto.Create;
  Add(Result);
end;

procedure TitprodutocustoList.SetItem(Index: Integer; const Value: Titprodutocusto);
begin
  Put(Index, Value);
end;

end.
