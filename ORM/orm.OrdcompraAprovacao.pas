unit orm.OrdcompraAprovacao;

interface

uses contnrs, System.SysUtils, System.Classes,
  uConstantes,
  Rotina.Retornasql,
  classe.query, Classe.DAO;

type
  TOrdcompraAprovacao = class(TRegistroQuipos)
  private
    FcdOrdcompraAprovacao: Integer;
    Fbofinanceiro: String;
    Fboaprovado: String;
    Fcdordcompra: Integer;
    Fcdusuario: Integer;
    Fdsobservacao: string;
  public
    [keyfield]
    property cdordcompraaprovacao : Integer read Fcdordcompraaprovacao write Fcdordcompraaprovacao;
    [FK]
    property cdusuario : Integer read Fcdusuario write Fcdusuario;
    [FK]
    property cdordcompra : Integer read Fcdordcompra write Fcdordcompra;
    property boaprovado : String read Fboaprovado write Fboaprovado;
    property dsobservacao : string read Fdsobservacao write Fdsobservacao;
    property bofinanceiro : String read Fbofinanceiro write Fbofinanceiro;
  end;
  TordcompraAprovacaoList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TordcompraAprovacao;
    procedure SetItem(Index: Integer; const Value: TordcompraAprovacao);
  public
    function bofinanceiro: Boolean;
    function New: TordcompraAprovacao;
    property Items[Index: Integer]: TordcompraAprovacao read GetItem write SetItem;
    function Ler(nmcdfield: string; codigo:Integer):Boolean;overload;
  end;

implementation

function TordcompraAprovacaoList.bofinanceiro: Boolean;
var
  i : Integer;
begin
  result := False;
  for i := 0 to count-1 do
  begin
    if Items[i].bofinanceiro = _s then
    begin
      result := True;
      Break;
    end;
  end;
end;

function TordcompraAprovacaoList.GetItem(Index: Integer): TordcompraAprovacao;
begin
  Result := TordcompraAprovacao(Inherited Items[Index]);
end;

function TordcompraAprovacaoList.Ler(nmcdfield: string; codigo: Integer): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_ordcompraAprovacao, codigo, nmcdfield));
  try
    clear;
    result := q.q.RecordCount > 0;
    if not result then
    begin
      Exit;
    end;
    while not q.q.Eof do
    begin
      New.Select(q.q);
      q.q.Next;
    end;
  finally
    FreeAndNil(q);
  end;
end;

function TordcompraAprovacaoList.New: TordcompraAprovacao;
begin
  Result := TordcompraAprovacao.Create;
  Add(Result);
end;

procedure TordcompraAprovacaoList.SetItem(Index: Integer; const Value: TordcompraAprovacao);
begin
  Put(Index, Value);
end;

end.
