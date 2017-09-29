unit orm.ItMovto;

interface

uses Contnrs, Data.DB, classes, System.SysUtils,
  uConstantes,
  Rotina.Retornasql, Rotina.Registro,
  orm.ItOrdProducaoMaterial,
  Classe.DAO, classe.Executasql, classe.query;

type
  TItmovto = class(TRegistroQuipos)
  private
    fcditmovto : Integer;
    fcdmovto : Integer;
    fcdcntcusto : integer;
    fcdproduto : integer;
    fcditlote : Integer;
    fqtitem : Double;
    fvlunitario : Currency;
    fvltotal : Currency;
    fcddigitado : string;
    fvlsaldovalor : Currency;
    fdsobservacao : string;
    fqtitem2 : Double;
    fcditordproducaomaterial: integer;
    fnucntcusto: string;
  public
    [keyfield]
    property cditmovto : Integer read fcditmovto write fcditmovto;
    [fk]
    property cditordproducaomaterial : integer read fcditordproducaomaterial write fcditordproducaomaterial;
    [fk]
    property cdmovto : Integer read fcdmovto write fcdmovto;
    [fk]
    property cdcntcusto : integer read fcdcntcusto write fcdcntcusto;
    [fk]
    property cdproduto : integer read fcdproduto write fcdproduto;
    [fk]
    property cditlote : Integer read fcditlote write fcditlote;
    property qtitem : Double read fqtitem write fqtitem;
    property vlunitario : Currency read fvlunitario write fvlunitario;
    property vltotal : Currency read fvltotal write fvltotal;
    property cddigitado : string read fcddigitado write fcddigitado;
    property vlsaldovalor : Currency read fvlsaldovalor write fvlsaldovalor;
    property dsobservacao : string read fdsobservacao write fdsobservacao;
    property qtitem2 : Double read fqtitem2 write fqtitem2;
    property nucntcusto: string read fnucntcusto write fnucntcusto;
    function Delete(boscript:boolean=false):string;
    function Insert(boscript: boolean=false): String;
  end;
  TItMovtoList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TItMovto;
    procedure SetItem(Index: Integer; const Value: TItMovto);
  public
    function New: TItMovto;
    property Items[Index: Integer]: TItMovto read GetItem write SetItem;
    function sqlInsert:string;
    function sqlDelete:string;
    function Ler(codigo:Integer; cdfield:string=_cdmovto):Boolean;overload;
    function Ler(Dataset: TDataset):boolean;overload;
    function getqtitem:double;
  end;

implementation

//uses orm.OrdProducao;

function TItmovto.Delete(boscript: boolean): string;
var
  itordproducaomaterial : TItOrdProducaoMaterial;
  sql : TStrings;
begin
  result := '';
  itordproducaomaterial := TItOrdProducaoMaterial.create;
  sql := TStringList.Create;
  try
    if cditordproducaomaterial > 0 then
    begin
      itordproducaomaterial.Select(cditordproducaomaterial);
      itordproducaomaterial.qtconsumo := itordproducaomaterial.qtconsumo - qtitem;
      sql.Add(itordproducaomaterial.Update(true));
    end;
    sql.Add(inherited delete(true));
    result := sql.Text;
    if not boscript then
    begin
      ExecutaScript(sql);
    end;
  finally
    FreeAndNil(itordproducaomaterial);
    FreeAndNil(sql);
  end;
end;

function TItMovtoList.sqlInsert: string;
var
  i : Integer;
begin
  Result := '';
  for i := 0 to count-1 do
  begin
    result := result + Items[i].Insert(true)+#13;
  end;
end;

function TItMovtoList.GetItem(Index: Integer): TItMovto;
begin
  Result := TItMovto(Inherited Items[Index]);
end;

function TItMovtoList.getqtitem: double;
var
  I: Integer;
begin
  result := 0;
  for I := 0 to count - 1 do
  begin
    result := result + items[i].qtitem;
  end;
end;

function TItMovtoList.Ler(Dataset: TDataset): boolean;
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

function TItMovtoList.New: TItMovto;
begin
  Result := TItMovto.Create;
  Add(Result);
end;

procedure TItMovtoList.SetItem(Index: Integer; const Value: TItMovto);
begin
  Put(Index, Value);
end;

function TItMovtoList.Ler(codigo: Integer; cdfield:string=_cdmovto):boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_itmovto, codigo, cdfield));
  try
    result := Ler(q.q);
  finally
    FreeAndNil(q);
  end;
end;

function TItMovtoList.sqlDelete: string;
var
  i : Integer;
begin
  Result := '';
  for i := 0 to count-1 do
  begin
    if result <> '' then
    begin
      result := result + #13;
    end;
    result := result + Items[i].Delete(true);
  end;
end;

function TItmovto.Insert(boscript: boolean): String;
begin
  if (cdcntcusto <> 0) and (nucntcusto <> '') then
  begin
    nucntcusto := qregistro.stringdocodigo(_cntcusto, cdcntcusto, _nunivel);
  end;
  result := inherited insert(boscript);
end;

end.
