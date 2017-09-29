unit orm.ParcelamentoEntrada;

interface

uses contnrs, Data.DB, System.SysUtils, Vcl.Dialogs, System.UITypes, System.Classes,
  uConstantes,
  Rotina.Retornasql, Rotina.Registro,
  Classe.DAO, classe.query;

type
  TParcelamentoEntrada = class(TRegistroQuipos)
  private
    fcdautpagto: integer;
    fcdparcelamento: integer;
    fvltotal: currency;
    fvljuros: currency;
    fcdparcelamentoentrada: integer;
    fvlautpagto: currency;
    fnuautpagto: string;
  public
    [keyfield]
    property cdparcelamentoentrada: integer read fcdparcelamentoentrada write fcdparcelamentoentrada;
    [fk, AObrigatorio]
    property cdautpagto: integer read fcdautpagto write fcdautpagto;
    [fk, AObrigatorio]
    property cdparcelamento: integer read fcdparcelamento write fcdparcelamento;
    [AObrigatorio]
    property vlautpagto: currency read fvlautpagto write fvlautpagto;
    [AObrigatorio]
    property vljuros: currency read fvljuros write fvljuros;
    [AObrigatorio]
    property nuautpagto: string read fnuautpagto write fnuautpagto;
    [AObrigatorio]
    property vltotal: currency read fvltotal write fvltotal;
  end;
  TParcelamentoEntradaList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TParcelamentoEntrada;
    procedure SetItem(Index: Integer; const Value: TParcelamentoEntrada);
  public
    function New: TParcelamentoEntrada;
    property Items[Index: Integer]: TParcelamentoEntrada read GetItem write SetItem;
    function Ler(codigo:Integer; cdfield:string=_cdparcelamento):Boolean;overload;
    function Ler(Dataset: TDataset):boolean;overload;
    procedure verificar_fornecedor_entrada(cdfornecedor: LargeInt);
    function vltotal:currency;
  end;

implementation

function TParcelamentoEntradaList.GetItem(Index: Integer): TParcelamentoEntrada;
begin
  Result := TParcelamentoEntrada(Inherited Items[Index]);
end;

function TParcelamentoEntradaList.Ler(Dataset: TDataset): boolean;
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

function TParcelamentoEntradaList.Ler(codigo: Integer; cdfield: string): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_ParcelamentoEntrada, codigo, cdfield));
  try
    result := Ler(q.q);
  finally
    FreeAndNil(q);
  end;
end;

function TParcelamentoEntradaList.New: TParcelamentoEntrada;
begin
  Result := TParcelamentoEntrada.Create;
  Add(Result);
end;

procedure TParcelamentoEntradaList.SetItem(Index: Integer; const Value: TParcelamentoEntrada);
begin
  Put(Index, Value);
end;

procedure TParcelamentoEntradaList.verificar_fornecedor_entrada(cdfornecedor: LargeInt);
var
  I: Integer;
begin
  for I := 0 to Count - 1do
  begin
    if cdfornecedor <> qregistro.InteirodoCodigo(_autpagto, Items[i].cdautpagto, _cdfornecedor) then
    begin
      MessageDlg('O contas a pagar '+Items[i].nuautpagto+' não pertence ao mesmo fornecedor do parcelamento.', mtInformation, [mbOK], 0);
      Abort;
    end;
  end;
end;

function TParcelamentoEntradaList.vltotal: currency;
var
  I: Integer;
begin
  result := 0;
  for I := 0 to count - 1 do
  begin
    result := result + items[i].vltotal;
  end;
end;

end.
