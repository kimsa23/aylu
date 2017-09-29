unit orm.ItPedidoMaterialFornecedor;

interface

uses Data.DB, contnrs, System.SysUtils, System.Classes,
  uConstantes,
  Rotina.Retornasql,
  Classe.DAO, classe.query;

type
  TItPedidoMaterialFornecedor = Class(TRegistroQuipos)
  private
    Fborecuperaipi: string;
    Fborecuperaicms: string;
    Fbovencedor: string;
    Fvlfinal: currency;
    Fvlicmsdifaliquota: currency;
    Fvlipi: currency;
    Fvlfrete: currency;
    Fvlicmssubtrib: currency;
    Fvlreal: currency;
    Fvltotal: currency;
    Fvlunitario: currency;
    Fvlicms: currency;
    Fvldesconto: currency;
    Falipi: double;
    Falicms: double;
    Falicmsdifaliquota: double;
    Fqtitem: double;
    Fcdtpaprovacaocotacao: integer;
    Fcditpedidomaterial: integer;
    Fcdforencedor: Largeint;
    Fdtpreventrega: TDate;
  public
    [keyfield]
    property cditpedidomaterial : integer read Fcditpedidomaterial write Fcditpedidomaterial;
    [keyfield]
    property cdforencedor : Largeint read Fcdforencedor write Fcdforencedor;
    [fk]
    property cdtpaprovacaocotacao : integer read Fcdtpaprovacaocotacao write Fcdtpaprovacaocotacao;
    property vlunitario : currency read Fvlunitario write Fvlunitario;
    property vltotal : currency read Fvltotal write Fvltotal;
    property bovencedor :  string read Fbovencedor write Fbovencedor;
    property qtitem : double read Fqtitem write Fqtitem;
    property dtpreventrega : TDate read Fdtpreventrega write Fdtpreventrega;
    property alicms : double read Falicms write Falicms;
    property alipi : double read Falipi write Falipi;
    property vlfrete : currency read Fvlfrete write Fvlfrete;
    property vlicmsdifaliquota : currency read Fvlicmsdifaliquota write Fvlicmsdifaliquota;
    property vldesconto : currency read Fvldesconto write Fvldesconto;
    property vlfinal : currency read Fvlfinal write Fvlfinal;
    property borecuperaicms : string read Fborecuperaicms write Fborecuperaicms;
    property borecuperaipi : string read Fborecuperaipi write Fborecuperaipi;
    property alicmsdifaliquota : double read Falicmsdifaliquota write Falicmsdifaliquota;
    property vlreal : currency read Fvlreal write Fvlreal;
    property vlicms : currency read Fvlicms write Fvlicms;
    property vlipi : currency read Fvlipi write Fvlipi;
    property vlicmssubtrib : currency read Fvlicmssubtrib write Fvlicmssubtrib;
  end;
  TItPedidoMaterialFornecedorList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TItPedidoMaterialFornecedor;
    procedure SetItem(Index: Integer; const Value: TItPedidoMaterialFornecedor);
  public
    function  New: TItPedidoMaterialFornecedor;
    property  Items[Index: Integer]: TItPedidoMaterialFornecedor read GetItem write SetItem;
    function Ler(codigo:Integer):boolean;overload;
    function Ler(dataset:TDataset):boolean;overload;
    function ler(sqlwhere:string):boolean;overload;
  end;

implementation

function TItPedidoMaterialFornecedorList.GetItem(Index: Integer): TItPedidoMaterialFornecedor;
begin
  Result := TItPedidoMaterialFornecedor(Inherited Items[Index]);
end;

function TItPedidoMaterialFornecedorList.Ler(dataset: TDataset): boolean;
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

function TItPedidoMaterialFornecedorList.Ler(codigo: Integer): boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_itpedidomaterialfornecedor, codigo, _cditpedidomaterial));
  try
    result := Ler(q.q);
  finally
    FreeAndNil(q);
  end;
end;

function TItPedidoMaterialFornecedorList.New: TItPedidoMaterialFornecedor;
begin
  Result := TItPedidoMaterialFornecedor.Create;
  Add(Result);
end;

procedure TItPedidoMaterialFornecedorList.SetItem(Index: Integer; const Value: TItPedidoMaterialFornecedor);
begin
  Put(Index, Value);
end;

function TItPedidoMaterialFornecedorList.Ler(sqlwhere: string): boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_where(_itpedidomaterialfornecedor, sqlwhere));
  try
    result := Ler(q.q);
  finally
    FreeAndNil(q);
  end;
end;

end.
