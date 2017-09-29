unit orm.ItFormulacao;

interface

uses contnrs, System.SysUtils, System.Classes,
  uConstantes,
  Rotina.Retornasql,
  Classe.DAO, classe.query;

type
  TItFormulacao = class(TRegistroQuipos)
  private
    Fqtitem: Double;
    Fprpeso: Double;
    Fprerro: Double;
    Fnusequencia: Integer;
    Fcdformulacao: Integer;
    Fcditformulacao: Integer;
    Fcdproduto: Integer;
    Fcddigitado: string;
  public
    [keyfield]
    property cditformulacao : Integer read Fcditformulacao write Fcditformulacao;
    [fk]
    property cdformulacao : Integer read Fcdformulacao write Fcdformulacao;
    [fk]
    property cdproduto : Integer read Fcdproduto write Fcdproduto;
    property cddigitado : string read Fcddigitado write Fcddigitado;
    property qtitem : Double read Fqtitem write Fqtitem;
    property prpeso : Double read Fprpeso write Fprpeso;
    property prerro : Double read Fprerro write Fprerro;
    property nusequencia : Integer read Fnusequencia write Fnusequencia;
  end;
  TItformulacaoList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TItformulacao;
    procedure SetItem(Index: Integer; const Value: TItformulacao);
  public
    function New: TItformulacao;
    property Items[Index: Integer]: TItformulacao read GetItem write SetItem;
    function Ler(codigo:Integer):Boolean;
  end;

implementation

function TItformulacaoList.GetItem(Index: Integer): TItformulacao;
begin
  Result := TItformulacao(Inherited Items[Index]);
end;

function TItformulacaoList.Ler(codigo: Integer): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_itformulacao, codigo, _cdformulacao));
  try
    clear;
    result := q.q.RecordCount > 0;
    if not result then
    begin
      Exit;
    end;
    while not q.q.Eof do
    begin
      new.select(q.q);
      q.q.Next;
    end;
  finally
    FreeAndNil(q);
  end;
end;

function TItformulacaoList.New: TItformulacao;
begin
  Result := TItformulacao.Create;
  Add(Result);
end;

procedure TItformulacaoList.SetItem(Index: Integer; const Value: TItformulacao);
begin
  Put(Index, Value);
end;

end.
