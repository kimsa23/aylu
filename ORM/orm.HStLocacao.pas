unit orm.HStLocacao;

interface

uses contnrs, System.SysUtils, System.Classes,
  uConstantes,
  Rotina.Retornasql,
  classe.query, classe.gerar, Classe.DAO;

type
  THStLocacao = class(TRegistroQuipos)
  private
    Fcdlocacao: integer;
    Fcdstlocacao: integer;
    Fdsjustificativa: string;
    Fcdhstlocacao: integer;
  public
    [keyfield]
    property cdhstlocacao : integer read Fcdhstlocacao write fcdhstlocacao;
    [fk]
    property cdlocacao : integer read Fcdlocacao write fcdlocacao;
    [fk]
    property cdstlocacao : integer read Fcdstlocacao write fcdstlocacao;
    property dsjustificativa : string read Fdsjustificativa write fdsjustificativa;
    function Insert(boscript:boolean=false): String;
  end;
  THstLocacaoList = class(TObjectList)
  private
    function  GetItem(Index: Integer): THstLocacao;
    procedure SetItem(Index: Integer; const Value: THstLocacao);
  public
    function New: THstLocacao;
    property Items[Index: Integer]: THstLocacao read GetItem write SetItem;
    function Ler(codigo:Integer):Boolean;
  end;

implementation

function THstLocacaoList.GetItem(Index: Integer): THstLocacao;
begin
  Result := THstLocacao(Inherited Items[Index]);
end;

function THstLocacaoList.Ler(codigo: Integer): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_hstlocacao, codigo, _cdlocacao));
  try
    clear;
    result := q.q.RecordCount > 0;
    if not result then
    begin
      Exit;
    end;
    while not q.q.Eof do
    begin
      //thstlocacaodao.read(new, q.q.fieldbyname(_cdhstlocacao).AsInteger);
      q.q.Next;
    end;
  finally
    FreeAndNil(q);
  end;
end;

function THstLocacaoList.New: THstLocacao;
begin
  Result := THstLocacao.Create;
  Add(Result);
end;

procedure THstLocacaoList.SetItem(Index: Integer; const Value: THstLocacao);
begin
  Put(Index, Value);
end;

function THStLocacao.Insert(boscript: boolean): String;
begin
  if cdhstlocacao = 0 then
  begin
    cdhstlocacao := qgerar.GerarCodigo(_hstlocacao);
  end;
  result := inherited insert(boscript);
end;

end.
