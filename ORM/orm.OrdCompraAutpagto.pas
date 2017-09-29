unit orm.OrdCompraAutpagto;

interface

uses contnrs, Data.DB, System.SysUtils, System.Classes,
  uConstantes,
  Rotina.Retornasql,
  classe.query, Classe.DAO, classe.gerar;

type
  TOrdCompraAutpagto = class(TRegistroQuipos)
  private
    fdtprorrogacao: tdate;
    fvlordcompraautpagto: Currency;
    fcdordcompra: integer;
    fvlsaldo: Currency;
    fdtemissao: TDate;
    fcdordcompraautpagto: Integer;
  public
    [KeyField]
    property cdordcompraautpagto: Integer read fcdordcompraautpagto write fcdordcompraautpagto;
    [fk, AObrigatorio]
    property cdordcompra: integer read fcdordcompra write fcdordcompra;
    [AObrigatorio]
    property vlordcompraautpagto: Currency read fvlordcompraautpagto write fvlordcompraautpagto;
    [AObrigatorio]
    property dtprorrogacao: tdate read fdtprorrogacao write fdtprorrogacao;
    [AObrigatorio]
    property dtemissao: TDate read fdtemissao write fdtemissao;
    [AObrigatorio]
    property vlsaldo: Currency read fvlsaldo write fvlsaldo;
  end;
  TOrdCompraAutpagtoList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TOrdcompraAutpagto;
    procedure SetItem(Index: Integer; const Value: TOrdcompraAutpagto);
  public
    function New: TOrdcompraAutpagto;
    property Items[Index: Integer]: TOrdcompraAutpagto read GetItem write SetItem;
    function Ler(codigo:Integer):Boolean;overload;
    function Ler(DataSet: TDataset):boolean;overload;
    function Inserir(boscript:boolean=false):string;
  end;

implementation

function TOrdCompraAutpagtoList.GetItem(Index: Integer): TOrdcompraAutpagto;
begin
  Result := TOrdcompraAutpagto(Inherited Items[Index]);
end;

function TOrdCompraAutpagtoList.Ler(codigo: Integer): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_OrdCompraAutpagto, codigo, _cdordcompra));
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

function TOrdCompraAutpagtoList.Inserir(boscript: boolean): string;
var
  i : Integer;
begin
  Result := '';
  for i := 0 to count-1 do
  begin
    if items[i].cdordcompraautpagto = 0 then
    begin
      items[i].cdordcompraautpagto := QGerar.gerarcodigo(_ordcompraautpagto);
    end;
    result := result + Items[i].Insert(boscript)+#13;
  end;
end;

function TOrdCompraAutpagtoList.Ler(DataSet: TDataset): boolean;
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

function TOrdCompraAutpagtoList.New: TOrdcompraAutpagto;
begin
  Result := TOrdcompraAutpagto.Create;
  Add(Result);
end;

procedure TOrdCompraAutpagtoList.SetItem(Index: Integer; const Value: TOrdcompraAutpagto);
begin
  Put(Index, Value);
end;

end.
