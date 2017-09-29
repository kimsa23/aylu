unit orm.PedidoDuplicata;

interface

uses contnrs, Data.DB, System.SysUtils, System.Classes,
  uConstantes,
  Rotina.Retornasql,
  Classe.DAO, classe.query;

type
  TPedidoDuplicata = class(TRegistroQuipos)
  private
    Fcdpedidoduplicata: integer;
    Fnuduplicata: string;
    Fdsobservacao: string;
    Fvlpedidoduplicata: currency;
    Fvlsaldo: currency;
    Fdtprorrogacao: TDate;
    Fcdpedido: integer;
    Fdtemissao: TDate;
  public
    [keyfield]
    property cdpedidoduplicata : integer read Fcdpedidoduplicata write fcdpedidoduplicata;
    [fk]
    property cdpedido : integer read Fcdpedido write fcdpedido;
    property vlpedidoduplicata : currency read Fvlpedidoduplicata write fvlpedidoduplicata;
    property dtprorrogacao : TDate read Fdtprorrogacao write fdtprorrogacao;
    property dtemissao : TDate read Fdtemissao write fdtemissao;
    property vlsaldo : currency read Fvlsaldo write fvlsaldo;
    property nuduplicata : string read Fnuduplicata write fnuduplicata;
    property dsobservacao : string read Fdsobservacao write fdsobservacao;
  end;
  TPedidoDuplicataList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TPedidoDuplicata;
    procedure SetItem(Index: Integer; const Value: TPedidoDuplicata);
  public
    function New: TPedidoDuplicata;
    property Items[Index: Integer]: TPedidoDuplicata read GetItem write SetItem;
    function Ler(codigo:Integer):Boolean;overload;
    function Ler(Dataset: TDataset):Boolean;overload;
  end;

implementation

function TPedidoDuplicataList.GetItem(Index: Integer): TPedidoDuplicata;
begin
  Result := TPedidoDuplicata(Inherited Items[Index]);
end;

function TPedidoDuplicataList.Ler(Dataset: TDataset): Boolean;
begin
  clear;
  result := False;
  dataset.first;
  while not dataset.Eof do
  begin
    new.Select(dataset);
    dataset.Next;
    result := True;
  end;
end;

function TPedidoDuplicataList.Ler(codigo: Integer): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_PedidoDuplicata, codigo, _cdpedido));
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

function TPedidoDuplicataList.New: TPedidoDuplicata;
begin
  Result := TPedidoDuplicata.Create;
  Add(Result);
end;

procedure TPedidoDuplicataList.SetItem(Index: Integer; const Value: TPedidoDuplicata);
begin
  Put(Index, Value);
end;

end.
