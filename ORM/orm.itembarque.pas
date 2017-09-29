unit orm.itembarque;

interface

uses Data.DB, Contnrs, classes, System.SysUtils,
  uConstantes,
  Rotina.Retornasql,
  Classe.DAO, classe.gerar, classe.query;

type
  TItEmbarque = class(TRegistroQuipos)
    private
      Fvlpeso: currency;
      Fvlfrete: currency;
      Fvltotal: currency;
      Fvlpedagio: currency;
      Fpsliquido: double;
      Fpsbruto: double;
      Fnuserie: integer;
      Fcdembarque: integer;
      Fcdcte: integer;
      Fnunota: integer;
      Fcditembarque: integer;
      Fcddestinatario: Largeint;
      Fdsxml: string;
      Fcdremetente: Largeint;
      Fnuchavenfe: string;
      Fdtemissao: TDate;
    public
      [keyfield]
      property cditembarque : integer read Fcditembarque write fcditembarque;
      [fk]
      property cdembarque : integer read Fcdembarque write fcdembarque;
      [fl]
      property cdremetente : Largeint read Fcdremetente write fcdremetente;
      [fk]
      property cddestinatario : Largeint read Fcddestinatario write fcddestinatario;
      [fk]
      property cdcte : integer read Fcdcte write fcdcte;
      property dsxml : string read Fdsxml write fdsxml;
      property nuchavenfe : string read Fnuchavenfe write fnuchavenfe;
      property nuserie : integer read Fnuserie write fnuserie;
      property nunota : integer read Fnunota write fnunota;
      property dtemissao : TDate read Fdtemissao write fdtemissao;
      property vltotal : currency read Fvltotal write fvltotal;
      property psliquido : double read Fpsliquido write fpsliquido;
      property psbruto : double read Fpsbruto write fpsbruto;
      property vlfrete : currency read Fvlfrete write fvlfrete;
      property vlpeso : currency read Fvlpeso write fvlpeso;
      property vlpedagio : currency read Fvlpedagio write fvlpedagio;
  end;
  TItembarqueList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TItembarque;
    procedure SetItem(Index: Integer; const Value: TItembarque);
  public
    function  New: TItembarque;
    property  Items[Index: Integer]: TItembarque read GetItem write SetItem;
    function  Insert(cdembarque:integer): TItembarque;overload;
    procedure Insert(dataset: TDataset);overload;
    procedure Excluir(cditembarque:integer);
    function  sql_insert:string;
    function Ler(codigo:Integer):Boolean; overload;
    function Ler(Dataset: TDataset):boolean; overload;
    function  get_qtembarque: Integer;
    function  get_vlfrete:currency;
    function  get_qtpeso: double;
    function  boctegerado:boolean;
    function  boctesemgerar:boolean;
  end;

implementation

function TItembarqueList.boctegerado: boolean;
var
  i : integer;
begin
  result := true;
  for i := 0 to count - 1 do
  begin
    result := items[i].cdcte <> 0;
    if not result then
    begin
      break;
    end;
  end;
end;

function TItembarqueList.boctesemgerar: boolean;
var
  i : integer;
begin
  result := false;
  for i := 0 to count - 1 do
  begin
    result := items[i].cdcte = 0;
    if result then
    begin
      break;
    end;
  end;
end;

procedure TItembarqueList.Excluir(cditembarque: integer);
var
  i : integer;
begin
  for i := 0 to count - 1 do
  begin
    if items[i].cditembarque = cditembarque then
    begin
      Delete(i);
      break;
    end;
  end;
end;

function TItembarqueList.GetItem(Index: Integer): TItembarque;
begin
  Result := TItembarque(Inherited Items[Index]);
end;

function TItembarqueList.get_qtembarque: Integer;
var
  i : integer;
  lista : TStrings;
begin
  lista := TStringList.Create;
  try
    for i := 0 to count - 1 do
    begin
      if lista.indexof(items[i].cddestinatario.tostring) = -1 then
      begin
        lista.Add(items[i].cddestinatario.tostring);
      end;
    end;
    result := lista.count;
  finally
    FreeAndNil(lista);
  end;
end;

function TItembarqueList.get_qtpeso: double;
var
  i : integer;
begin
  result := 0;
  for i := 0 to count - 1 do
  begin
    result := result + items[i].psbruto;
  end;
end;

function TItembarqueList.get_vlfrete: currency;
var
  i : integer;
begin
  result := 0;
  for i := 0 to count - 1 do
  begin
    result := result + items[i].vlfrete;
  end;
end;

function TItembarqueList.Insert(cdembarque: integer): TItembarque;
begin
  result := new;
  result.state     := dsInsert;
  Result.cdembarque   := cdembarque;
  Result.cditembarque := QGerar.GerarCodigo(_itembarque);
end;

procedure TItembarqueList.Insert(dataset: TDataset);
var
  i : integer;
begin
  New;
  i := count - 1;
  items[i].Select(dataset);
end;

function TItembarqueList.Ler(Dataset: TDataset): boolean;
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

function TItembarqueList.Ler(codigo: Integer): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_itembarque, codigo, _cdembarque));
  try
    clear;
    result := q.q.RecordCount > 0;
    if not result then
    begin
      Exit;
    end;
    while not q.q.Eof do
    begin
      New.select(q.q);
      q.q.Next;
    end;
  finally
    FreeAndNil(q);
  end;
end;

function TItembarqueList.New: TItembarque;
begin
  Result := TItembarque.Create;
  Add(Result);
end;

procedure TItembarqueList.SetItem(Index: Integer; const Value: TItembarque);
begin
  Put(Index, Value);
end;

function TItembarqueList.sql_insert: string;
var
  i : Integer;
begin
  Result := '';
  for i := 0 to count-1 do
  begin
    if Items[i].state = dsinsert then
    begin
      result := result + Items[i].insert(true)+#13;
    end;
  end;
end;

end.
