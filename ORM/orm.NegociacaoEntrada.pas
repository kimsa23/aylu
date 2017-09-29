unit orm.NegociacaoEntrada;

interface

uses contnrs, Data.DB, System.SysUtils, Vcl.Dialogs, System.UITypes, System.Classes,
  uConstantes,
  Rotina.Retornasql, Rotina.Registro,
  Classe.DAO, classe.query;

type
  TNegociacaoEntrada = class(TRegistroQuipos)
  private
    fcdnegociacao: integer;
    fvlduplicata: currency;
    fnuduplicata: string;
    fcdnegociacaoentrada: integer;
    fvltotal: currency;
    fvljuros: currency;
    fvlcomissao: currency;
    fcdduplicata: integer;
  public
    [keyfield, AObrigatorio]
    property cdnegociacaoentrada : integer read fcdnegociacaoentrada write fcdnegociacaoentrada;
    [fk, AObrigatorio]
    property cdduplicata : integer read fcdduplicata write fcdduplicata;
    [fk, AObrigatorio]
    property cdnegociacao : integer read fcdnegociacao write fcdnegociacao;
    [AObrigatorio]
    property vlduplicata : currency read fvlduplicata write fvlduplicata;
    [AObrigatorio]
    property vljuros : currency read fvljuros write fvljuros;
    [AObrigatorio]
    property nuduplicata : string read fnuduplicata write fnuduplicata;
    [AObrigatorio]
    property vltotal : currency read fvltotal write fvltotal;
    [AObrigatorio]
    property vlcomissao : currency read fvlcomissao write fvlcomissao;
  end;
  TNegociacaoEntradaList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TNegociacaoEntrada;
    procedure SetItem(Index: Integer; const Value: TNegociacaoEntrada);
  public
    function  New: TNegociacaoEntrada;
    property  Items[Index: Integer]: TNegociacaoEntrada read GetItem write SetItem;
    function  Ler(codigo:Integer; cdfield:string=_cdnegociacao):Boolean;overload;
    function  Ler(Dataset: TDataset):boolean;overload;
    procedure verificar_cliente_entrada(cdcliente: LargeInt);
    function  Soma(nmcampo:string):currency;
  end;

implementation

function TNegociacaoEntradaList.GetItem(Index: Integer): TNegociacaoEntrada;
begin
  Result := TNegociacaoEntrada(Inherited Items[Index]);
end;

function TNegociacaoEntradaList.Ler(Dataset: TDataset): boolean;
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

function TNegociacaoEntradaList.Ler(codigo: Integer; cdfield: string): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_negociacaoentrada, codigo, cdfield));
  try
    result := Ler(q.q);
  finally
    FreeAndNil(q);
  end;
end;

function TNegociacaoEntradaList.New: TNegociacaoEntrada;
begin
  Result := TNegociacaoEntrada.Create;
  Add(Result);
end;

procedure TNegociacaoEntradaList.SetItem(Index: Integer; const Value: TNegociacaoEntrada);
begin
  Put(Index, Value);
end;

function TNegociacaoEntradaList.Soma(nmcampo: string): currency;
var
  I: Integer;
begin
  result := 0;
  for I := 0 to count - 1 do
  begin
    if nmcampo = _vltotal then
    begin
      result := result + items[i].vltotal;
    end;
    if nmcampo = _vlcomissao then
    begin
      result := result + items[i].vlcomissao;
    end;
  end;
end;

procedure TNegociacaoEntradaList.verificar_cliente_entrada(cdcliente: LargeInt);
var
  I: Integer;
begin
  for I := 0 to Count - 1do
  begin
    if cdcliente <> qregistro.InteirodoCodigo(_duplicata, Items[i].cdduplicata, _cdcliente) then
    begin
      MessageDlg('O contas a receber '+Items[i].nuduplicata+' não pertence ao mesmo cliente da negociação.', mtInformation, [mbOK], 0);
      Abort;
    end;
  end;
end;

end.
