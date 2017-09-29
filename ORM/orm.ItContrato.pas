unit orm.ItContrato;

interface

uses Contnrs, System.SysUtils, Data.DB, System.Classes,
  uConstantes,
  Rotina.Retornasql,
  classe.gerar, classe.query, Classe.DAO;

type
  TItContrato = class(TRegistroQuipos)
  private
    Fvlexcedente: Currency;
    Fvlunitario: Currency;
    Fvltotal: Currency;
    Fqtitem: double;
    Fcdcontrato: Integer;
    Fcditcontrato: Integer;
    Fcdproduto: Integer;
    Fcddigitado: string;
  public
    [keyfield]
    property cditcontrato : Integer read Fcditcontrato write fcditcontrato;
    [fk]
    property cdproduto : Integer read Fcdproduto write fcdproduto;
    [fk]
    property cdcontrato : Integer read Fcdcontrato write fcdcontrato;
    property cddigitado : string read Fcddigitado write fcddigitado;
    property qtitem : double read Fqtitem write fqtitem;
    property vlunitario : Currency read Fvlunitario write fvlunitario;
    property vltotal : Currency read Fvltotal write fvltotal;
    property vlexcedente  : Currency read Fvlexcedente write fvlexcedente;
  end;
  TItContratoList = class(TObjectList)
  private
    function  GetItem(Index: Integer): Titcontrato;
    procedure SetItem(Index: Integer; const Value: Titcontrato);
  public
    function  New: Titcontrato;
    property  Items[Index: Integer]: Titcontrato read GetItem write SetItem;
    function  Insert(cdcontrato:integer): Titcontrato;
    function  sql_insert:string;
    function  Ler(codigo:Integer):Boolean;
    function VlUnitario(cdproduto:integer):currency;
  end;

implementation

function TItContratoList.GetItem(Index: Integer): Titcontrato;
begin
  Result := Titcontrato(Inherited Items[Index]);
end;

function TItContratoList.Insert(cdcontrato: integer): Titcontrato;
begin
  result              := new;
  Result.cdcontrato   := cdcontrato;
  Result.cditcontrato := QGerar.GerarCodigo(_itcontrato);
end;

function TItContratoList.Ler(codigo: Integer): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_itcontrato, codigo, _cdcontrato));
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

function TItContratoList.New: Titcontrato;
begin
  Result := Titcontrato.Create;
  Add(Result);
end;

procedure TItContratoList.SetItem(Index: Integer; const Value: Titcontrato);
begin
  Put(Index, Value);
end;

function TItContratoList.sql_insert: string;
var
  i : Integer;
begin
  Result := '';
  for i := 0 to count-1 do
  begin
    result := result + Items[i].Insert(True)+#13;
  end;
end;

function TItContratoList.VlUnitario(cdproduto: integer): currency;
var
  I: Integer;
begin
  result := 0;
  for I := 0 to count - 1 do
  begin
    if items[i].cdproduto = cdproduto then
    begin
      result := items[i].vlunitario;
    end;
  end;
end;

end.
