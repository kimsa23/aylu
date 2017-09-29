unit orm.StPedidoMaterial;

interface

uses contnrs, System.SysUtils, System.Classes,
  uConstantes,
  Rotina.Retornasql,
  classe.query, Classe.DAO;

type
  TStPedidoMaterial = class(TPersintentObject)
  private
    Fnucor: integer;
    Fnmstpedidomaterial: string;
    Fboexcluir: string;
    Fbonovo: string;
    Fcdstpedidomaterial: integer;
    Fboalterar: string;
  public
    [keyfield]
    property cdstpedidomaterial : integer read Fcdstpedidomaterial write Fcdstpedidomaterial;
    property nmstpedidomaterial : string read Fnmstpedidomaterial write Fnmstpedidomaterial;
    property bonovo : string read Fbonovo write Fbonovo;
    property boalterar : string read Fboalterar write Fboalterar;
    property boexcluir : string read Fboexcluir write Fboexcluir;
    property nucor : integer read Fnucor write Fnucor;
  end;
  TStpedidomaterialList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TStpedidomaterial;
    procedure SetItem(Index: Integer; const Value: TStpedidomaterial);
  public
    function New: TStpedidomaterial;
    property Items[Index: Integer]: TStpedidomaterial read GetItem write SetItem;
    function Ler(sqlwhere:string):Boolean;
  end;

implementation

function TStpedidomaterialList.GetItem(Index: Integer): TStpedidomaterial;
begin
  Result := TSTpedidomaterial(Inherited Items[Index]);
end;

function TStpedidomaterialList.Ler(sqlwhere: string): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_where(_stpedidomaterial, sqlwhere));
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

function TStpedidomaterialList.New: TStpedidomaterial;
begin
  Result := TSTpedidomaterial.Create;
  Add(Result);
end;

procedure TStpedidomaterialList.SetItem(Index: Integer; const Value: TStpedidomaterial);
begin
  Put(Index, Value);
end;

end.
