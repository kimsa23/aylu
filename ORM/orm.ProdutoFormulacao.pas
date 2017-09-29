unit orm.ProdutoFormulacao;

interface

uses contnrs, Data.DB, System.SysUtils, System.Classes,
  uConstantes,
  Rotina.Retornasql,
  classe.query, Classe.DAO;

type
  TProdutoFormulacao = class(TRegistroQuipos)
  private
    Fboquociente: String;
    Fbometodoprocesso: String;
    Fcdtpequipamento: Integer;
    Fcdproduto: Integer;
    Fcdformulacao: Integer;
  public
    [keyfield]
    property cdproduto : Integer read Fcdproduto write fcdproduto;
    [keyfield]
    property cdformulacao : Integer read Fcdformulacao write fcdformulacao;
    [fk]
    property cdtpequipamento : Integer read Fcdtpequipamento write fcdtpequipamento;
    property boquociente : String read Fboquociente write fboquociente;
    property bometodoprocesso : String read Fbometodoprocesso write fbometodoprocesso;
  end;
  TprodutoformulacaoList = class(TObjectList)
  private
    function  GetItem(Index: Integer): Tprodutoformulacao;
    procedure SetItem(Index: Integer; const Value: Tprodutoformulacao);
  public
    function New: Tprodutoformulacao;
    property Items[Index: Integer]: Tprodutoformulacao read GetItem write SetItem;
    function Ler(codigo:Integer; cdfield:string=_cdproduto):boolean;overload;
    function Ler(sqlwhere:string):Boolean;overload;
    function Ler(DataSet: TDataset):boolean;overload;
    function ListaProduto:string;
    function Excluir(boscript:boolean=false):string;
  end;

implementation

function TprodutoformulacaoList.Ler(DataSet: TDataset): boolean;
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

function TprodutoformulacaoList.Excluir(boscript: boolean): string;
var
  I: Integer;
begin
  result := '';
  for I := 0 to count - 1 do
  begin
    result := items[i].Delete(boscript);
  end;
end;

function TprodutoformulacaoList.GetItem(Index: Integer): Tprodutoformulacao;
begin
  Result := Tprodutoformulacao(Inherited Items[Index]);
end;

function TprodutoformulacaoList.Ler(codigo: Integer; cdfield:string=_cdproduto): boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_produtoformulacao, codigo, cdfield));
  try
    result := Ler(q.q);
  finally
    FreeAndNil(q);
  end;
end;

function TprodutoformulacaoList.Ler(sqlwhere: string): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_where(_produtoformulacao, sqlwhere));
  try
    result := Ler(q.q);
  finally
    FreeAndNil(q);
  end;
end;

function TprodutoformulacaoList.ListaProduto: string;
var
  I: Integer;
begin
  result := '';
  for I := 0 to count -1 do
  begin
    if result <> '' then
    begin
      result := result + #13;
    end;
    result := result + Items[i].cdproduto.ToString;
  end;
end;

function TprodutoformulacaoList.New: Tprodutoformulacao;
begin
  Result := Tprodutoformulacao.Create;
  Add(Result);
end;

procedure TprodutoformulacaoList.SetItem(Index: Integer; const Value: Tprodutoformulacao);
begin
  Put(Index, Value);
end;

end.
