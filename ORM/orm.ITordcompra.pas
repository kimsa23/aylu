unit orm.ITordcompra;

interface

uses contnrs, data.db, System.SysUtils, Vcl.Dialogs, System.Classes, System.UITypes,
  uConstantes,
  Rotina.Retornasql,
  orm.produto,
  classe.query, Classe.DAO, classe.gerar;

type
  TITordcompra = class(TRegistroQuipos)
  private
    Fboipibcicms: String;
    Fbocertificado: String;
    Fvlicms: Currency;
    Fvlunitario: Currency;
    Fvldesconto: Currency;
    Fvlpeca: Currency;
    Fvlipi: Currency;
    Fvlicmssubtrib: Currency;
    Fvltotal: Currency;
    Fqtpeca: Double;
    Falicms: Double;
    Fqtpesounitario: Double;
    Fqtatendida: double;
    Fqtitem: double;
    Falipi: Double;
    Fnukmatual: Integer;
    Fcdcntcusto: integer;
    Fcditpedido: Integer;
    Fcdproduto: integer;
    Fnuitordcompra: Integer;
    Fcdordproducao: Integer;
    Fcditordcompra: integer;
    Fcdplconta: integer;
    Fcdordcompra: integer;
    Fnukmfinal: Integer;
    Fcdtpaplicacao: Integer;
    Fcddigitado: string;
    Fnuplconta: string;
    Fdsformula: string;
    Fdsobservacao: string;
    Fdtpreventrega: TDate;
    Fproduto: TProduto;
    Fnucntcusto: string;
    fcdorcamento: integer;
    fvlfrete: currency;
  public
    property produto : TProduto read Fproduto write Fproduto;
    [keyfield]
    property cditordcompra : integer read Fcditordcompra write Fcditordcompra;
    [FK]
    property cdordcompra : integer read Fcdordcompra write Fcdordcompra;
    [FK]
    property cdplconta : integer read Fcdplconta write Fcdplconta;
    property nuplconta : string read Fnuplconta write Fnuplconta;
    [FK]
    property cdcntcusto : integer read Fcdcntcusto write Fcdcntcusto;
    property nucntcusto : string read Fnucntcusto write Fnucntcusto;
    [FK]
    property cdproduto : integer read Fcdproduto write Fcdproduto;
    property cddigitado : string read Fcddigitado write Fcddigitado;
    property qtpeca : Double read Fqtpeca write Fqtpeca;
    [Aobrigatorio]
    property qtitem: double read Fqtitem write Fqtitem;
    property qtatendida: double read Fqtatendida write Fqtatendida;
    property vlunitario : Currency read Fvlunitario write Fvlunitario;
    [FK]
    property cdtpaplicacao : Integer read Fcdtpaplicacao write Fcdtpaplicacao;
    [fk]
    property cditpedido : Integer read Fcditpedido write Fcditpedido;
    [FK]
    property cdordproducao : Integer read Fcdordproducao write Fcdordproducao;
    [FK]
    property cdorcamento : integer read fcdorcamento write fcdorcamento;
    property vltotal : Currency read Fvltotal write Fvltotal;
    property alicms : Double read Falicms write Falicms;
    property vlicms : Currency read Fvlicms write Fvlicms;
    property alipi : Double read Falipi write Falipi;
    property vlipi : Currency read Fvlipi write Fvlipi;
    property dtpreventrega : TDate read Fdtpreventrega write Fdtpreventrega;
    property dsformula : string read Fdsformula write Fdsformula;
    property dsobservacao : string read Fdsobservacao write Fdsobservacao;
    property bocertificado : String read Fbocertificado write Fbocertificado;
    property vldesconto : Currency read Fvldesconto write Fvldesconto;
    property vlicmssubtrib : Currency read Fvlicmssubtrib write Fvlicmssubtrib;
    property boipibcicms : String read Fboipibcicms write Fboipibcicms;
    property qtpesounitario : Double read Fqtpesounitario write Fqtpesounitario;
    property nuitordcompra : Integer read Fnuitordcompra write Fnuitordcompra;
    property vlpeca : Currency read Fvlpeca write Fvlpeca;
    property nukmatual : Integer read Fnukmatual write Fnukmatual;
    property nukmfinal : Integer read Fnukmfinal write Fnukmfinal;
    property vlfrete: currency read fvlfrete write fvlfrete;
    constructor create;
    destructor destroy; override;
    procedure CalcularTotal;
  end;
  TItOrdCompraList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TItOrdCompra;
    procedure SetItem(Index: Integer; const Value: TItOrdCompra);
  public
    function New: TItOrdCompra;
    property Items[Index: Integer]: TItOrdCompra read GetItem write SetItem;
    function Inserir(boscript:boolean=false):string;
    function Ler(codigo:Integer):Boolean;overload;
    function Ler(where:string):Boolean;overload;
    function Ler(DataSet: TDataset):boolean;overload;
    function vltotal:currency;
    function vlipi:currency;
    function vlfrete: currency;
    function vldesconto: currency;
    function vlicmssubtrib:currency;
    function qtitem:double;
    procedure zerarfrete;
    procedure CalcularTotal;
    procedure ExcluirItem(value:Integer);
    procedure ExcluirItensJaAtendidos;
    function CentroCustoPreenchido:Boolean;
    function PlanoContasPreenchido:Boolean;
    function AlgumValorUnitarioZerado:Boolean;
  end;

implementation

constructor TITordcompra.create;
begin
  inherited;
  fproduto := TProduto.create;
end;

destructor TITordcompra.destroy;
begin
  FreeAndNil(fproduto);
  inherited;
end;

procedure TITordcompra.CalcularTotal;
begin
  if (qtpeca > 0) and (qtpesounitario > 0) then
  begin
    qtitem := qtpesounitario * qtpeca;
    if vlpeca > 0 then
    begin
      vlunitario := (vlpeca * qtpeca) / qtitem;
    end;
  end;
  if qtitem < 0 then
  begin
    MessageDlg('Quantidade do item não pode ser negativo.', mtInformation, [mbOK], 0);
    Abort;
  end;
  vltotal := qtitem * vlunitario;
  if qtpeca = 0 then
  begin
    vlpeca := 0
  end
  else
  begin
    vlpeca := vltotal / qtpeca;
  end;
  if boipibcicms = _S then
  begin
    vlicms := (vltotal + vlipi) * alicms / 100
  end
  else
  begin
    vlicms := vltotal * alicms / 100;
  end;
  vlipi := (vlfrete + vltotal) * alipi / 100;
end;

function TItOrdCompraList.AlgumValorUnitarioZerado: Boolean;
var
  I: Integer;
begin
  for I := 0 to count - 1 do
  begin
    result := False;
    if Items[i].vlunitario = 0 then
    begin
      result := True;
      Break;
    end;
  end;
end;

procedure TItOrdCompraList.CalcularTotal;
var
  I: Integer;
begin
  for I := 0 to count - 1 do
  begin
    items[i].CalcularTotal;
  end;
end;

function TItOrdCompraList.CentroCustoPreenchido: Boolean;
var
  I: Integer;
begin
  for I := 0 to count - 1 do
  begin
    result := True;
    if Items[i].cdcntcusto = 0 then
    begin
      result := False;
      Break;
    end;
  end;
end;

procedure TItOrdCompraList.ExcluirItem(value: Integer);
var
  I: Integer;
begin
  for I := 0 to count - 1 do
  begin
    if value = Items[i].cditordcompra then
    begin
      Delete(i);
      Break;
    end;
  end;
end;

procedure TItOrdCompraList.ExcluirItensJaAtendidos;
var
  I: Integer;
  codigo : Integer;
  lista : TStrings;
begin
  lista := TStringList.Create;
  try
    for I := 0 to count -1 do
    begin
      if Items[i].qtitem <= Items[i].qtatendida then
      begin
        lista.Add(Items[i].cditordcompra.ToString);
      end;
    end;
    for i := 0 to lista.Count - 1 do
    begin
      ExcluirItem(lista[i].ToInteger);
    end;
  finally
    FreeAndNil(lista);
  end;
end;

function TItOrdCompraList.GetItem(Index: Integer): TItOrdCompra;
begin
  Result := TItOrdCompra(Inherited Items[Index]);
end;

function TItOrdCompraList.Ler(where: string): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_where(_itOrdCompra, where));
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

function TItOrdCompraList.Ler(codigo: integer): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_itOrdCompra, codigo, _cdordcompra));
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

function TItOrdCompraList.New: TItOrdCompra;
begin
  Result := TItOrdCompra.Create;
  Add(Result);
end;

function TItOrdCompraList.PlanoContasPreenchido: Boolean;
var
  I: Integer;
begin
  for I := 0 to count - 1 do
  begin
    result := True;
    if Items[i].cdplconta = 0 then
    begin
      result := False;
      Break;
    end;
  end;
end;

function TItOrdCompraList.qtitem: double;
var
  I: Integer;
begin
  result := 0;
  for I := 0 to count - 1 do
  begin
    result := result + items[i].qtitem;
  end;
end;

procedure TItOrdCompraList.SetItem(Index: Integer; const Value: TItOrdCompra);
begin
  Put(Index, Value);
end;

function TItOrdCompraList.Inserir(boscript:boolean=false): string;
var
  i : Integer;
begin
  Result := '';
  for i := 0 to count-1 do
  begin
    if items[i].cditordcompra = 0 then
    begin
      items[i].cditordcompra := QGerar.gerarcodigo(_itordcompra);
    end;
    result := result + Items[i].Insert(boscript)+#13;
  end;
end;

function TItOrdCompraList.vldesconto: currency;
var
  I: Integer;
begin
  result := 0;
  for I := 0 to count - 1 do
  begin
    result := result + items[i].vldesconto;
  end;
end;

function TItOrdCompraList.vlfrete: currency;
var
  i: Integer;
begin
  result := 0;
  for i := 0 to count - 1 do
  begin
    result := result + items[i].vlfrete;
  end;
end;

function TItOrdCompraList.vlicmssubtrib: currency;
var
  i: Integer;
begin
  result := 0;
  for i := 0 to count - 1 do
  begin
    result := result + items[i].vlicmssubtrib;
  end;
end;

function TItOrdCompraList.vlipi: currency;
var
  I: Integer;
begin
  result := 0;
  for I := 0 to count - 1 do
  begin
    result := result + items[i].vlipi;
  end;
end;

function TItOrdCompraList.vltotal: currency;
var
  I: Integer;
begin
  result := 0;
  for I := 0 to count-1 do
  begin
    result := result + items[i].vltotal;
  end;
end;

procedure TItOrdCompraList.zerarfrete;
var
  I: Integer;
begin
  for I := 0 to count-1 do
  begin
    items[i].vlfrete := 0;
    items[i].calculartotal;
  end;
end;

function TItOrdCompraList.Ler(DataSet: TDataset): boolean;
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

end.
