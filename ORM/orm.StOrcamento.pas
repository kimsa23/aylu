unit orm.StOrcamento;

interface

uses contnrs, System.SysUtils, System.Classes,
  uConstantes,
  Rotina.Retornasql,
  Classe.DAO, classe.query;

type
  TStOrcamento = class(TRegistroQuipos)
  private
    Fboanalisecritica: String;
    Fnmstorcamento: string;
    Fnucor: integer;
    Fboexcluir: String;
    Fcdstorcamento: integer;
    Fbogerarinfo: String;
    Fbonovo: String;
    Fnuordem: integer;
    Fboalterar: String;
  public
    [keyfield]
    property cdstorcamento : integer read Fcdstorcamento write Fcdstorcamento;
    property nmstorcamento : string read Fnmstorcamento write Fnmstorcamento;
    property nucor : integer read Fnucor write Fnucor;
    property bonovo : String read Fbonovo write Fbonovo;
    property boalterar : String read Fboalterar write Fboalterar;
    property boexcluir : String read Fboexcluir write Fboexcluir;
    property bogerarinfo : String read Fbogerarinfo write Fbogerarinfo;
    property nuordem : integer read Fnuordem write Fnuordem;
    property boanalisecritica : String read Fboanalisecritica write Fboanalisecritica;
  end;
  TStOrcamentoList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TStOrcamento;
    procedure SetItem(Index: Integer; const Value: TStOrcamento);
  public
    function New: TStOrcamento;
    property Items[Index: Integer]: TStOrcamento read GetItem write SetItem;
    function Ler(sqlwhere:string):Boolean;
  end;

implementation

function TStOrcamentoList.GetItem(Index: Integer): TStOrcamento;
begin
  Result := TSTorcamento(Inherited Items[Index]);
end;

function TStOrcamentoList.Ler(sqlwhere:string): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_where(_storcamento, sqlwhere));
  try
    clear;
    result := q.q.RecordCount > 0;
    if not result then
    begin
      Exit;
    end;
    while not q.q.Eof do
    begin
      new.select(q.q.fieldbyname(_cdstorcamento).AsInteger);
      q.q.Next;
    end;
  finally
    FreeAndNil(q);
  end;
end;

function TStOrcamentoList.New: TStOrcamento;
begin
  Result := TSTorcamento.Create;
  Add(Result);
end;

procedure TStOrcamentoList.SetItem(Index: Integer; const Value: TStOrcamento);
begin
  Put(Index, Value);
end;

end.
