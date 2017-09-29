unit orm.ItPedidoEstrutura;

interface

uses contnrs, System.SysUtils, System.Classes,
  uConstantes,
  Rotina.Retornasql,
  classe.dao, classe.query;

type
  TItPedidoEstrutura = class(TRegistroQuipos)
  private
    Fbofaturado: String;
    Fcditpedidoestrutura: integer;
    Fcditpedido: Integer;
    Fnuestrutural: string;
  public
    [keyfield]
    property cditpedidoestrutura : integer read Fcditpedidoestrutura write Fcditpedidoestrutura;
    [fk]
    property cditpedido : Integer read Fcditpedido write Fcditpedido;
    property nuestrutural : string read Fnuestrutural write Fnuestrutural;
    property bofaturado : string read Fbofaturado write Fbofaturado;
  end;
  TitpedidoestruturaList = class(TObjectList)
  private
    function  GetItem(Index: Integer): Titpedidoestrutura;
    procedure SetItem(Index: Integer; const Value: Titpedidoestrutura);
  public
    function New: Titpedidoestrutura;
    property Items[Index: Integer]: Titpedidoestrutura read GetItem write SetItem;
    function Ler(codigo:Integer):boolean;
  end;

implementation

function TitpedidoestruturaList.GetItem(Index: Integer): Titpedidoestrutura;
begin
  Result := Titpedidoestrutura(Inherited Items[Index]);
end;

function TitpedidoestruturaList.Ler(codigo: Integer): boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_itpedidoestrutura, codigo, _cditpedido));
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

function TitpedidoestruturaList.New: Titpedidoestrutura;
begin
  Result := Titpedidoestrutura.Create;
  Add(Result);
end;

procedure TitpedidoestruturaList.SetItem(Index: Integer; const Value: Titpedidoestrutura);
begin
  Put(Index, Value);
end;

end.
