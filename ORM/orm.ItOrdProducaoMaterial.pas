unit orm.ItOrdProducaoMaterial;

interface

uses contnrs, System.SysUtils, System.Classes,
  uConstantes,
  Rotina.Retornasql,
  ORM.Produto,
  classe.gerar, classe.query, Classe.DAO;

type
  TItOrdProducaoMaterial = class(TRegistroQuipos)
  private
    fcditordproducaomaterial : Integer;
    fcdordproducao : Integer;
    fcdproduto : Integer;
    fcdmaterial : integer;
    fcdformulacao : Integer;
    fcdtpequipamento : Integer;
    fcdforma : Integer;
    fqtitem : Double;
    fqtpesounitario : Double;
    fqtpeca : Double;
    fvlunitario : Currency;
    fvltotal : Currency;
    fcddigitado : string;
    fdsposicao : string;
    falicms : Double;
    falipi : Double;
    fborecuperaicms : String;
    fborecuperaipi : String;
    fvlicms : Currency;
    fvlipi : Currency;
    fvlfrete : Currency;
    fvlfinal : Currency;
    falpis : Double;
    falcofins : Double;
    fvlpis : Currency;
    fvlcofins : Currency;
    fborecuperapis : String;
    fborecuperacofins : String;
    fdsformula : string;
    fdtpreventrega : TDate;
    fdsobservacao : string;
    fqtfaixai : Double;
    fqtfaixaf : Double;
    fqtconsumo : Double;
    fnubag : string;
    fnulote : string;
    fqtestoque : Double;
    fnumistura : Integer;
    fqtitem2 : Double;
    FProduto: TProduto;
    //fmovto: TMovtoList;
    fnuestrutural: string;
  public
    property produto : TProduto read FProduto write FProduto;
    //property movto : TMovtoList read fmovto write fmovto;
    [keyfield]
    property cditordproducaomaterial : Integer  read fcditordproducaomaterial write fcditordproducaomaterial;
    [fk]
    property cdordproducao : Integer read fcdordproducao write fcdordproducao;
    [fk]
    property cdproduto : Integer read fcdproduto write fcdproduto;
    [fk]
    property cdmaterial : integer read fcdmaterial write fcdmaterial;
    [fk]
    property cdformulacao : Integer read fcdformulacao write fcdformulacao;
    [fk]
    property cdtpequipamento : Integer read fcdtpequipamento write fcdtpequipamento;
    [fk]
    property cdforma : Integer read fcdforma write fcdforma;
    property qtitem : Double read fqtitem write fqtitem;
    property qtpesounitario : Double read fqtpesounitario write fqtpesounitario;
    property qtpeca : Double read fqtpeca write fqtpeca;
    property vlunitario : Currency read fvlunitario write fvlunitario;
    property vltotal : Currency read fvltotal write fvltotal;
    property cddigitado : string read fcddigitado write fcddigitado;
    property dsposicao : string read fdsposicao write fdsposicao;
    property alicms : Double read falicms write falicms;
    property alipi : Double read falipi write falipi;
    property borecuperaicms : String read fborecuperaicms write fborecuperaicms;
    property borecuperaipi : String read fborecuperaipi write fborecuperaipi;
    property vlicms : Currency read fvlicms write fvlicms;
    property vlipi : Currency read fvlipi write fvlipi;
    property vlfrete : Currency read fvlfrete write fvlfrete;
    property vlfinal : Currency read fvlfinal write fvlfinal;
    property alpis : Double read falpis write falpis;
    property alcofins : Double read falcofins write falcofins;
    property vlpis : Currency read fvlpis write fvlpis;
    property vlcofins : Currency read fvlcofins write fvlcofins;
    property borecuperapis : String read fborecuperapis write fborecuperapis;
    property borecuperacofins : String read fborecuperacofins write fborecuperacofins;
    property dsformula : string read fdsformula write fdsformula;
    property dtpreventrega : TDate read fdtpreventrega write fdtpreventrega;
    property dsobservacao : string read fdsobservacao write fdsobservacao;
    property qtfaixai : Double read fqtfaixai write fqtfaixai;
    property qtfaixaf : Double read fqtfaixaf write fqtfaixaf;
    property qtconsumo : Double read fqtconsumo write fqtconsumo;
    property nubag : string read fnubag write fnubag;
    property nulote : string read fnulote write fnulote;
    property qtestoque : Double read fqtestoque write fqtestoque;
    property numistura : Integer read fnumistura write fnumistura;
    property qtitem2 : Double read fqtitem2 write fqtitem2;
    property nuestrutural : string read fnuestrutural write fnuestrutural;
    constructor create;
    destructor destroy; override;
    function ExisteCotacao:Boolean;
    function ExisteRequisicao:Boolean;
  end;
  TItOrdProducaoMaterialList = class(TObjectList)
  private
    function GetItem(Index: Integer): TItOrdProducaoMaterial;
    procedure SetItem(Index: Integer; const Value: TItOrdProducaoMaterial);
  public
    function New: TItOrdProducaoMaterial;
    property Items[Index: Integer]: TItOrdProducaoMaterial read GetItem write SetItem;
    function Ler(codigo:Integer; cdfield:string=_cdordproducao):Boolean;overload;
    function Ler(sqlwhere: string):Boolean;overload;
    function Excluir(boscript:boolean=false):string;
    function gerarBaixaEstoque(data: TDate): Boolean;
    function existeMateriaPrimaParaBaixarEstoque:Boolean;
    procedure excluirbaixaestoque;
  end;

implementation

uses orm.movto;

constructor TItOrdProducaoMaterial.create;
begin
  inherited create;
  FProduto := TProduto.create;
  //fmovto := TMovtoList.create;
end;

destructor TItOrdProducaoMaterial.destroy;
begin
  FreeAndNil(fproduto);
  //FreeAndNil(fmovto);
  inherited;
end;

function TItOrdProducaoMaterial.ExisteCotacao: Boolean;
begin
  result := RetornaSQLInteger('select count(*) from itpedidomaterial where cdempresa='+cdempresa.tostring+' and cditordproducaomaterial='+inttostr(cditordproducaomaterial))>0;
end;

function TItOrdProducaoMaterial.ExisteRequisicao: Boolean;
begin
  result := RetornaSQLInteger('select count(*) from itrim where cdempresa='+cdempresa.tostring+' and cditordproducaomaterial='+inttostr(cditordproducaomaterial))>0;
end;

function TItOrdProducaoMaterialList.Excluir(boscript: Boolean=false):string;
var
  i : Integer;
begin
  for i := 0 to Count - 1 do
  begin
    if result <> '' then
    begin
      result := result + #13;
    end;
    result := result + items[i].Delete;
  end;
end;

procedure TItOrdProducaoMaterialList.excluirbaixaestoque;
var
  I: Integer;
  movto : tmovtolist;
  x: Integer;
begin
  for I := 0 to count - 1 do
  begin
    movto := tmovtolist.Create;
    try
      if movto.Ler(_cditordproducaomaterial, items[i].cditordproducaomaterial) then
      begin
        for x := 0 to movto.Count - 1 do
        begin
          items[i].qtconsumo :=  items[i].qtconsumo - movto.items[x].itmovto.getqtitem;
          movto.Items[x].Delete;
        end;
        items[i].Update;
      end;
    finally
      freeandnil(movto);
    end;
  end;
end;

function TItOrdProducaoMaterialList.existeMateriaPrimaParaBaixarEstoque: Boolean;
var
  i : integer;
begin
  result := False;
  for i := 0 to count-1 do
  begin
    if Items[i].qtitem > Items[i].qtconsumo then
    begin
      result := True;
      Break;
    end;
  end;
end;

function TItOrdProducaoMaterialList.gerarBaixaEstoque(data: TDate): Boolean;
var
  movto : TMovto;
  i : Integer;
begin
  result := False;
  for i := 0 to count - 1 do
  begin
    if Items[i].qtconsumo < Items[i].qtitem then
    begin
      movto := TMovto.create;
      try
        movto.cdmovto                 := QGerar.GerarCodigo(_movto);
        movto.cdtpmovto               := 1;
        movto.cdordproducao           := items[i].cdordproducao;
        movto.cditordproducaomaterial := Items[i].cditordproducaomaterial;
        movto.dtemissao               := data;
        movto.Insert;
        movto.ItMovto.New;
        movto.ItMovto.Items[0].cditordproducaomaterial := Items[i].cditordproducaomaterial;
        movto.ItMovto.Items[0].cdmovto    := movto.cdmovto;
        movto.ItMovto.Items[0].cditmovto  := QGerar.GerarCodigo(_itmovto);
        movto.ItMovto.Items[0].cdproduto  := Items[i].cdproduto;
        movto.ItMovto.Items[0].qtitem     := Items[i].qtitem - Items[i].qtconsumo;
        movto.ItMovto.Items[0].qtitem2    := Items[i].qtitem2;
        movto.ItMovto.Items[0].cddigitado := Items[i].cddigitado;
        movto.ItMovto.Items[0].insert;
        Items[i].qtconsumo := Items[i].qtconsumo + movto.ItMovto.Items[0].qtitem;
        Items[i].Update;
        Result := True;
      finally
        FreeAndNil(movto);
      end;
    end;
  end;
end;

function TItOrdProducaoMaterialList.GetItem(Index: Integer): TItOrdProducaoMaterial;
begin
  Result := TItOrdProducaoMaterial(Inherited Items[Index]);
end;

function TItOrdProducaoMaterialList.Ler(codigo: Integer; cdfield:string=_cdordproducao): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_itordproducaomaterial, codigo, cdfield));
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

function TItOrdProducaoMaterialList.Ler(sqlwhere: string): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_where(_ItOrdproducaoMaterial, sqlwhere));
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

function TItOrdProducaoMaterialList.New: TItOrdProducaoMaterial;
begin
  Result := TItOrdProducaoMaterial.Create;
  Add(Result);
end;

procedure TItOrdProducaoMaterialList.SetItem(Index: Integer; const Value: TItOrdProducaoMaterial);
begin
  Put(Index, Value);
end;

end.
