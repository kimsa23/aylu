unit orm.ItPedidoMaterial;

interface

uses Data.DB, contnrs, System.SysUtils, System.Classes,
  uConstantes,
  ORM.Produto, orm.ItPedidoMaterialFornecedor, ORM.Empresa,
  Rotina.Retornasql,
  Classe.DAO, classe.query, classe.gerar;

type
  TItPedidoMaterial = class(TRegistroQuipos)
  private
    Fbocertificado: string;
    Fqtatendida: Double;
    Fqtsolicitada: Double;
    Fqtpeca: Double;
    Fqtpesounitario: Double;
    Fqtestoque: Double;
    Fcdordproducao: Integer;
    Fcdcntcusto: Integer;
    Fcditpedidomaterial: Integer;
    Fcdproduto: Integer;
    Fcdpedidomaterial: Integer;
    Fcdrim: Integer;
    Fdsobservacao: string;
    Fcddigitado: string;
    Fdsformula: string;
    Fcditordproducaomaterial: Integer;
    Fcditrim: Integer;
    Fproduto: TProduto;
    fitpedidomaterialfornecedor: titpedidomaterialfornecedorlist;
    fnucntcusto: string;
    procedure Setcdproduto(const Value: Integer);
  public
    property itpedidomaterialfornecedor : titpedidomaterialfornecedorlist read fitpedidomaterialfornecedor write fitpedidomaterialfornecedor;
    property produto : TProduto read Fproduto write Fproduto;
    [keyfield]
    property cditpedidomaterial : Integer read Fcditpedidomaterial write Fcditpedidomaterial;
    [fk]
    property cditordproducaomaterial : Integer read Fcditordproducaomaterial write Fcditordproducaomaterial;
    [fk]
    property cditrim : Integer read Fcditrim write Fcditrim;
    [fk]
    property cdpedidomaterial : Integer read Fcdpedidomaterial write Fcdpedidomaterial;
    [fk]
    property cdproduto : Integer read Fcdproduto write Setcdproduto;
    [fk]
    property cdcntcusto : Integer read Fcdcntcusto write Fcdcntcusto;
    [fk]
    property cdordproducao : Integer read Fcdordproducao write Fcdordproducao;
    property cddigitado : string read Fcddigitado write Fcddigitado;
    property qtsolicitada : Double read Fqtsolicitada write Fqtsolicitada;
    property qtestoque : Double read Fqtestoque write Fqtestoque;
    property qtatendida : Double read Fqtatendida write Fqtatendida;
    property qtpeca : Double read Fqtpeca write Fqtpeca;
    property qtpesounitario : Double read Fqtpesounitario write Fqtpesounitario;
    property dsformula : string read Fdsformula write Fdsformula;
    property dsobservacao : string read Fdsobservacao write Fdsobservacao;
    property bocertificado : string read Fbocertificado write Fbocertificado;
    [fk]
    property cdrim : Integer read Fcdrim write Fcdrim;
    property nucntcusto: string read fnucntcusto write fnucntcusto;
    constructor create;
    destructor  destroy; override;
  end;
  TitpedidomaterialList = class(TObjectList)
  private
    function  GetItem(Index: Integer): Titpedidomaterial;
    procedure SetItem(Index: Integer; const Value: Titpedidomaterial);
  public
    function  New: Titpedidomaterial;
    property  Items[Index: Integer]: Titpedidomaterial read GetItem write SetItem;
    function  Insert(cdpedidomaterial:integer): Titpedidomaterial;
    function  sql_insert:string;
    function Ler(codigo:Integer):boolean;overload;
    function Ler(dataset:TDataset):boolean;overload;
    class function existe_cotacao(nmfield:string; codigo:Integer):boolean;
    class function getcdpedidomaterial(nmfield: string; codigo:Integer):integer;
  end;

implementation

class function TitpedidomaterialList.existe_cotacao(nmfield:string; codigo: Integer): boolean;
begin
  result := RetornaSQLInteger('select count(*) from itpedidomaterial where cdempresa='+empresa.cdempresa.ToString+' and '+nmfield+'='+inttostr(codigo))>0;
end;

class function TitpedidomaterialList.getcdpedidomaterial(nmfield: string; codigo:Integer):integer;
begin
  result := RetornaSQLInteger('select first 1 cdpedidomaterial from itpedidomaterial where cdempresa='+empresa.cdempresa.ToString+' and '+nmfield+'='+inttostr(codigo));
end;

function TitpedidomaterialList.GetItem(Index: Integer): Titpedidomaterial;
begin
  Result := Titpedidomaterial(Inherited Items[Index]);
end;

function TitpedidomaterialList.Insert(cdpedidomaterial: integer): Titpedidomaterial;
begin
  result := new;
  result.state              := dsInsert;
  Result.cdpedidomaterial   := cdpedidomaterial;
  Result.cditpedidomaterial := QGerar.GerarCodigo(_itpedidomaterial);
end;

function TitpedidomaterialList.Ler(dataset: TDataset): boolean;
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

function TitpedidomaterialList.Ler(codigo: Integer):boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_itpedidomaterial, codigo, _cdpedidomaterial));
  try
    result := Ler(q.q);
  finally
    FreeAndNil(q);
  end;
end;

function TitpedidomaterialList.New: Titpedidomaterial;
begin
  Result := TItpedidomaterial.Create;
  Add(Result);
end;

procedure TitpedidomaterialList.SetItem(Index: Integer; const Value: Titpedidomaterial);
begin
  Put(Index, Value);
end;

function TitpedidomaterialList.sql_insert: string;
var
  i : Integer;
begin
  Result := '';
  for i := 0 to count-1 do
  begin
    if Items[i].state = dsinsert then
    begin
      result := result + Items[i].Insert(True)+#13;
    end;
  end;
end;

constructor TItPedidoMaterial.create;
begin
  inherited;
  fproduto := TProduto.create;
  fitpedidomaterialfornecedor := titpedidomaterialfornecedorlist.create;
end;

destructor TItPedidoMaterial.destroy;
begin
  FreeAndNil(fproduto);
  FreeAndNil(fitpedidomaterialfornecedor);
  inherited;
end;

procedure TItPedidoMaterial.Setcdproduto(const Value: Integer);
begin
  Fcdproduto := Value;
  if state = dsinsert then
  begin
    produto.Select(value);
    qtestoque := produto.qtestoque;
  end;
end;

end.
