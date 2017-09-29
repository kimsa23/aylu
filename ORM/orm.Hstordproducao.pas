unit orm.Hstordproducao;

interface

uses contnrs, Data.DB, System.SysUtils, System.Classes,
  uConstantes,
  Rotina.Retornasql,
  Classe.DAO, classe.gerar, classe.query;

type
  THstordproducao = class(TRegistroQuipos)
  private
    Fcdstordproducao: integer;
    Fcdhstordproducao: integer;
    Fcdordproducao: integer;
    Fdsjustificativa: string;
  public
    [keyfield]
    property cdhstordproducao : integer read Fcdhstordproducao write Fcdhstordproducao;
    [fk]
    property cdordproducao : integer read Fcdordproducao write Fcdordproducao;
    [fk]
    property cdstordproducao : integer read Fcdstordproducao write Fcdstordproducao;
    property dsjustificativa : string read Fdsjustificativa write Fdsjustificativa;
    function Insert(boscript:boolean=false): String;overload;
  end;
  THstordproducaoList = class(TObjectList)
  private
    function  GetItem(Index: Integer): THstordproducao;
    procedure SetItem(Index: Integer; const Value: THstordproducao);
  public
    function New: THstordproducao;
    property Items[Index: Integer]: THstordproducao read GetItem write SetItem;
    function Ler(codigo:Integer):Boolean;overload;
    function Ler(Dataset: TDataset):boolean;overload;
  end;

implementation

function THstordproducao.Insert(boscript: boolean): String;
begin
  { TODO -oMelhoria -cRefatoração :
Na Classe RegistroQuipos colocar no insert para gerar o código quando o campo código da tabela estiver com zero
usar RTTI para determinar o nome da tabela e a propriedade do código }
  if cdhstordproducao = 0 then
  begin
    cdhstordproducao := qgerar.GerarCodigo(_hstordproducao);
  end;
  result := inherited Insert(boscript);
end;

function THstordproducaoList.GetItem(Index: Integer): THstordproducao;
begin
  Result := THstordproducao(Inherited Items[Index]);
end;

function THstordproducaoList.Ler(Dataset: TDataset): boolean;
begin
  clear;
  result := false;
  dataset.first;
  while not Dataset.Eof do
  begin
    new.Select(Dataset);
    Dataset.Next;
    result := true;
  end;
end;

function THstordproducaoList.Ler(codigo: Integer): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_hstordproducao, codigo, _cdordproducao));
  try
    result := ler(q.q);
  finally
    FreeAndNil(q);
  end;
end;

function THstordproducaoList.New: THstordproducao;
begin
  Result := THstordproducao.Create;
  Add(Result);
end;

procedure THstordproducaoList.SetItem(Index: Integer; const Value: THstordproducao);
begin
  Put(Index, Value);
end;

end.
