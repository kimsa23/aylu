unit orm.ItOrdproducaoCusto;

interface

uses contnrs, System.SysUtils, System.Classes,
  uConstantes,
  Rotina.Retornasql,
  Classe.DAO, classe.query;

type
  TItOrdproducaoCusto = class(TRegistroQuipos)
  private
    fcditordproducaocusto : Integer;
    fcdordproducao : Integer;
    fcdproduto : Integer;
    fvltotal : Currency;
    fcddigitado : string;
    fqtitem : Double;
    fvlunitario : currency;
    fqtdias : Integer;
    fnusequencia : Integer;
    fdsobservacao : string;
  public
    [keyfield]
    property cditordproducaocusto : Integer read fcditordproducaocusto write fcditordproducaocusto;
    [fk]
    property cdordproducao : Integer read fcdordproducao write fcdordproducao;
    [fk]
    property cdproduto : Integer read fcdproduto write fcdproduto;
    property vltotal : Currency read fvltotal write fvltotal;
    property cddigitado : string read fcddigitado write fcddigitado;
    property qtitem : Double read fqtitem write fqtitem;
    property vlunitario : currency read fvlunitario write fvlunitario;
    [AObrigatorio]
    property qtdias : Integer read fqtdias write fqtdias;
    property nusequencia : Integer read fnusequencia write fnusequencia;
    property dsobservacao : string read fdsobservacao write fdsobservacao;
  end;
  TItOrdproducaoCustoList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TItOrdproducaoCusto;
    procedure SetItem(Index: Integer; const Value: TItOrdproducaoCusto);
  public
    function New: TItOrdproducaoCusto;
    property Items[Index: Integer]: TItOrdproducaoCusto read GetItem write SetItem;
    function Ler(codigo:Integer):Boolean;
    function Excluir(boscript:boolean=false):string;
    function getNudiascusto:Integer;
  end;

implementation

function TItOrdproducaoCustoList.Excluir(boscript: boolean): string;
var
  i : Integer;
begin
  for i := 0 to Count - 1 do
  begin
    if result <> '' then
    begin
      result := result + #13;
    end;
    result := result + items[i].Delete(boscript);
  end;
end;

function TItOrdproducaoCustoList.GetItem(Index: Integer): TItOrdproducaoCusto;
begin
  Result := TItOrdproducaoCusto(Inherited Items[Index]);
end;

function TItOrdproducaoCustoList.getNudiascusto: Integer;
var
  i : Integer;
begin
  result := 0;
  for i := 0 to Count - 1 do
  begin
    if result < Items[i].qtdias then
    begin
      result := Items[i].qtdias;
    end;
  end;
end;

function TItOrdproducaoCustoList.Ler(codigo: Integer): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_itordproducaocusto, codigo, _cdordproducao));
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

function TItOrdproducaoCustoList.New: TItOrdproducaoCusto;
begin
  Result := TItOrdproducaoCusto.Create;
  Add(Result);
end;

procedure TItOrdproducaoCustoList.SetItem(Index: Integer; const Value: TItOrdproducaoCusto);
begin
  Put(Index, Value);
end;

end.
