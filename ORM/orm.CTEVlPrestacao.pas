unit orm.CTEVlPrestacao;

interface

uses Contnrs, System.SysUtils, System.Classes,
  uConstantes,
  Rotina.Retornasql,
  classe.dao, classe.query;

type
  TCTEVlPrestacao = class(TRegistroQuipos)
  private
    Fprprestacao: double;
    Fcdcte: integer;
    Fcdctetpvlprestacao: integer;
    Fvlprestacao: currency;
    Fcdctevlprestacao: integer;
  public
    [keyfield]
    property cdctevlprestacao : integer read Fcdctevlprestacao write Fcdctevlprestacao;
    [fk]
    property cdcte : integer read Fcdcte write Fcdcte;
    [fk]
    property cdctetpvlprestacao : integer read Fcdctetpvlprestacao write Fcdctetpvlprestacao;
    property vlprestacao : currency read Fvlprestacao write Fvlprestacao;
    property prprestacao : double read Fprprestacao write Fprprestacao;
  end;
  TCTEVlPrestacaoList = class(TObjectList)
  private
    function GetItem(Index: Integer): TCTEVlPrestacao;
    procedure SetItem(Index: Integer; const Value: TCTEVlPrestacao);
  public
    function New: TCTEVlPrestacao;
    property Items[Index: Integer]: TCTEVlPrestacao read GetItem write SetItem;
    function Ler(codigo:Integer):Boolean;
    function Excluir(boscript:boolean=false):string;
  end;

implementation

function TCTEVlPrestacaoList.Excluir(boscript: boolean): string;
var
  I: Integer;
begin
  for I := 0 to count - 1 do
  begin
    result := result + items[i].delete(boscript)+#13;
  end;
end;

function TCTEVlPrestacaoList.GetItem(Index: Integer): TCTEVlPrestacao;
begin
  Result := TCTEVlPrestacao(Inherited Items[Index]);
end;

function TCTEVlPrestacaoList.Ler(codigo: Integer): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_CTEVlPrestacao, codigo, _cdCTE));
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

function TCTEVlPrestacaoList.New: TCTEVlPrestacao;
begin
  Result := TCTEVlPrestacao.Create;
  Add(Result);
end;

procedure TCTEVlPrestacaoList.SetItem(Index: Integer; const Value: TCTEVlPrestacao);
begin
  Put(Index, Value);
end;

end.
