unit orm.LocacaoPeriodo;

interface

uses contnrs, Data.DB, System.SysUtils, System.Classes,
  uConstantes,
  Rotina.Retornasql,
  classe.query, Classe.DAO, classe.gerar;

type
  TLocacaoPeriodo = class(TRegistroQuipos)
  private
    Fvlequipamento: currency;
    Fdtprevista: TDate;
    Fcdlocacao: integer;
    Fqtitem: integer;
    Fvllocacao: currency;
    Fnudias: integer;
    Fcdlocacaoperiodo: integer;
    Fdtemissao: TDate;
    Fdtinicio: TDate;
  public
    [keyfield]
    property cdlocacaoperiodo : integer read Fcdlocacaoperiodo write fcdlocacaoperiodo;
    [fk]
    property cdlocacao : integer read Fcdlocacao write fcdlocacao;
    property dtemissao : TDate read Fdtemissao write fdtemissao;
    property dtprevista : TDate read Fdtprevista write fdtprevista;
    property nudias : integer read Fnudias write fnudias;
    property dtinicio : TDate read Fdtinicio write fdtinicio;
    property qtitem : integer read Fqtitem write fqtitem;
    property vllocacao : currency read Fvllocacao write fvllocacao;
    property vlequipamento : currency read Fvlequipamento write fvlequipamento;
    function Insert(boscript:boolean=false): String;
  end;
  TLocacaoPeriodoList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TLocacaoPeriodo;
    procedure SetItem(Index: Integer; const Value: TLocacaoPeriodo);
  public
    function New: TLocacaoPeriodo;
    property Items[Index: Integer]: TLocacaoPeriodo read GetItem write SetItem;
    function Ler(codigo:Integer):Boolean;overload;
    function Ler(dataset:TDataset):boolean;overload;
    function Delete:boolean;
    function IndiceAntePenultimo:integer;
  end;

implementation

function TLocacaoPeriodoList.Delete: boolean;
var
  i : integer;
begin
  for i := 0 to count -1 do
  begin
    items[i].Delete;
  end;
  clear;
  result := true;
end;

function TLocacaoPeriodoList.GetItem(Index: Integer): TLocacaoPeriodo;
begin
  Result := TLocacaoPeriodo(Inherited Items[Index]);
end;

function TLocacaoPeriodoList.IndiceAntePenultimo: integer;
begin
  result := Count-1;
  if result > 0 then
  begin
    result := result -1;
  end;
end;

function TLocacaoPeriodoList.Ler(dataset: TDataset): boolean;
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

function TLocacaoPeriodoList.Ler(codigo: Integer): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_LocacaoPeriodo, codigo, _cdlocacao));
  try
    result := ler(q.q);
  finally
    FreeAndNil(q);
  end;
end;

function TLocacaoPeriodoList.New: TLocacaoPeriodo;
begin
  Result := TLocacaoPeriodo.Create;
  Add(Result);
end;

procedure TLocacaoPeriodoList.SetItem(Index: Integer; const Value: TLocacaoPeriodo);
begin
  Put(Index, Value);
end;

function TLocacaoPeriodo.Insert(boscript: boolean): String;
begin
  if cdlocacaoperiodo = 0 then
  begin
    cdlocacaoperiodo := qgerar.GerarCodigo(_locacaoperiodo);
  end;
  result := inherited insert(boscript);
end;

end.
