unit orm.ItFornecedorConta;

interface

uses Data.DB, contnrs, System.SysUtils, System.Classes,
  uConstantes,
  Rotina.Retornasql,
  classe.query, Classe.DAO;

type
  TItFornecedorConta = class(TRegistroQuipos)
  private
    fcdfornecedor: Largeint;
    fcdbanco: Integer;
    fnuagencia: string;
    fnucntcorrente: string;
    fcditfornecedorconta: integer;
  public
    [KeyField]
    property cditfornecedorconta: integer read fcditfornecedorconta write fcditfornecedorconta;
    [FK, AObrigatorio]
    property cdfornecedor: Largeint read fcdfornecedor write fcdfornecedor;
    [FK, AObrigatorio]
    property cdbanco: Integer read fcdbanco write fcdbanco;
    property nuagencia: string read fnuagencia write fnuagencia;
    property nucntcorrente: string read fnucntcorrente write fnucntcorrente;
  end;
  TItFornecedorContaList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TItFornecedorConta;
    procedure SetItem(Index: Integer; const Value: TItFornecedorConta);
  public
    function New: TItFornecedorConta;
    property Items[Index: Integer]: TItFornecedorConta read GetItem write SetItem;
    function Ler(codigo:LargeInt; cdfield:string=_cdfornecedor):Boolean;overload;
    function Ler(DataSet: TDataset):boolean;overload;
  end;

implementation

function TItFornecedorContaList.GetItem(Index: Integer): TItFornecedorConta;
begin
  Result := Titfornecedorconta(Inherited Items[Index]);
end;

function TItFornecedorContaList.Ler(DataSet: TDataset): boolean;
begin
  clear;
  result := false;
  dataset.first;
  while not dataset.Eof do
  begin
    new.Select(dataset);
    dataset.Next;
    result := true;
  end;
end;

function TItFornecedorContaList.Ler(codigo: LargeInt; cdfield: string): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_itfornecedorconta, codigo, cdfield));
  try
    result := Ler(q.q);
  finally
    FreeAndNil(q);
  end;
end;

function TItFornecedorContaList.New: TItFornecedorConta;
begin
  Result := Titfornecedorconta.Create;
  Add(Result);
end;

procedure TItFornecedorContaList.SetItem(Index: Integer;
  const Value: TItFornecedorConta);
begin
  Put(Index, Value);
end;

end.
