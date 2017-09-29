unit orm.PedidoMaterialFornecedor;

interface

uses Data.DB, contnrs, System.SysUtils, System.Classes,
  uConstantes,
  Rotina.Retornasql,
  Classe.DAO, classe.query, classe.gerar;

type
  TPedidoMaterialFornecedor = class(TRegistroQuipos)
  private
    Fnucotacao: Integer;
    Fcdpedidomaterialfornecedor: Integer;
    Fcditcontfornecedor: Integer;
    Fcdpedidomaterial: Integer;
    Fcdordcompra: Integer;
    Fcdcondpagto: Integer;
    Fcdfornecedor: LargeInt;
    Fcdclfornecedor: Integer;
    Fnmitcontfornecedor: string;
    Fdtprventrega: TDate;
    Fdtcotacao: TDate;
  public
    [keyfield]
    property cdpedidomaterialfornecedor : Integer read Fcdpedidomaterialfornecedor write Fcdpedidomaterialfornecedor;
    [fk]
    property cdpedidomaterial : Integer read Fcdpedidomaterial write Fcdpedidomaterial;
    [fk]
    property cdfornecedor : LargeInt read Fcdfornecedor write Fcdfornecedor;
    [fk]
    property cdordcompra : Integer read Fcdordcompra write Fcdordcompra;
    [fk]
    property cdcondpagto : Integer read Fcdcondpagto write Fcdcondpagto;
    [fk]
    property cditcontfornecedor : Integer read Fcditcontfornecedor write Fcditcontfornecedor;
    property nucotacao : Integer read Fnucotacao write Fnucotacao;
    property dtcotacao : TDate read Fdtcotacao write Fdtcotacao;
    property dtprventrega : TDate read Fdtprventrega write Fdtprventrega;
    property nmitcontfornecedor : string read Fnmitcontfornecedor write Fnmitcontfornecedor;
    [fk]
    property cdclfornecedor : Integer read Fcdclfornecedor write Fcdclfornecedor;
  end;
  TPedidoMaterialFornecedorList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TPedidoMaterialFornecedor;
    procedure SetItem(Index: Integer; const Value: TPedidoMaterialFornecedor);
  public
    function  New: TPedidoMaterialFornecedor;
    property  Items[Index: Integer]: TPedidoMaterialFornecedor read GetItem write SetItem;
    function  Insert(cdpedidomaterial:integer): TPedidoMaterialFornecedor;
    function  sql_insert:string;
    function Ler(codigo:Integer):boolean; overload;
    function Ler(Dataset:TDataset):boolean; overload;
  end;

implementation

function TPedidoMaterialFornecedorList.GetItem(Index: Integer): TPedidoMaterialFornecedor;
begin
  Result := Tpedidomaterialfornecedor(Inherited Items[Index]);
end;

function TPedidoMaterialFornecedorList.Insert(
  cdpedidomaterial: integer): TPedidoMaterialFornecedor;
begin
  result := new;
  result.state     := dsInsert;
  Result.cdpedidomaterial   := cdpedidomaterial;
  Result.cdpedidomaterialfornecedor := QGerar.GerarCodigo(_pedidomaterialfornecedor);
end;

function TPedidoMaterialFornecedorList.Ler(Dataset: TDataset): boolean;
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

function TPedidoMaterialFornecedorList.Ler(codigo: Integer):boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_pedidomaterialfornecedor, codigo, _cdpedidomaterial));
  try
    result := Ler(q.q);
  finally
    FreeAndNil(q);
  end;
end;

function TPedidoMaterialFornecedorList.New: TPedidoMaterialFornecedor;
begin
  Result := Tpedidomaterialfornecedor.Create;
  Add(Result);
end;

procedure TPedidoMaterialFornecedorList.SetItem(Index: Integer; const Value: TPedidoMaterialFornecedor);
begin
  Put(Index, Value);
end;

function TPedidoMaterialFornecedorList.sql_insert: string;
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

end.
