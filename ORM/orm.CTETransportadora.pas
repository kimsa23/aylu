unit orm.CTETransportadora;

interface

uses Data.DB, System.SysUtils, classes, Contnrs,
  uConstantes,
  Rotina.Registro, Rotina.Retornasql,
  orm.veiculo, ORM.Autpagto, ORM.Empresa,
  Classe.DAO, classe.query, classe.Executasql;

type
  TCTETransportadora = class(TRegistroQuipos)
  private
    Fvlacrescimo: currency;
    Fvldesconto: currency;
    Fnuseguradora: string;
    Fcdveiculocarreta: integer;
    Fvladiantamento: currency;
    Fvlservico: currency;
    Fdsobservacao: string;
    Fcdcte: integer;
    Fcdautpagto: integer;
    Fvlsestsenat: currency;
    Fcdproprietario: LargeInt;
    Fcdveiculo: integer;
    Fvlpedagio: currency;
    Fvlinss: currency;
    Fvlsaldo: currency;
    Fvlirrf: currency;
    Fvlfrete: currency;
    Fcdveiculocarreta2: integer;
    Fcdtransportadora: largeint;
    Fvlfretepeso: currency;
    Fveiculocarreta2: tveiculo;
    Fveiculocarreta: tveiculo;
    Fveiculo: tveiculo;
    fvlseguroambiental: Currency;
  public
    [keyfield]
    property cdcte : integer read Fcdcte write Fcdcte;
    [keyfield]
    property cdtransportadora : largeint read Fcdtransportadora write Fcdtransportadora;
    [fk]
    property cdveiculo : integer read Fcdveiculo write Fcdveiculo;
    [fk]
    property cdveiculocarreta : integer read Fcdveiculocarreta write Fcdveiculocarreta;
    [fk]
    property cdautpagto : integer read Fcdautpagto write Fcdautpagto;
    [fk]
    property cdveiculocarreta2 : integer read Fcdveiculocarreta2 write Fcdveiculocarreta2;
    [fk]
    property cdproprietario : LargeInt read Fcdproprietario write Fcdproprietario;
    property vlservico : currency read Fvlservico write Fvlservico;
    property vlfrete : currency read Fvlfrete write Fvlfrete;
    property vlpedagio : currency read Fvlpedagio write Fvlpedagio;
    property vladiantamento : currency read Fvladiantamento write Fvladiantamento;
    property vlinss : currency read Fvlinss write Fvlinss;
    property vlsestsenat : currency read Fvlsestsenat write Fvlsestsenat;
    property vldesconto : currency read Fvldesconto write Fvldesconto;
    property vlsaldo : currency read Fvlsaldo write Fvlsaldo;
    property dsobservacao : string read Fdsobservacao write Fdsobservacao;
    property vlacrescimo : currency read Fvlacrescimo write Fvlacrescimo;
    property vlirrf : currency read Fvlirrf write Fvlirrf;
    property nuseguradora : string read Fnuseguradora write Fnuseguradora;
    property vlfretepeso : currency read Fvlfretepeso write Fvlfretepeso;
    property veiculo : tveiculo read Fveiculo write Fveiculo;
    property veiculocarreta : tveiculo read Fveiculocarreta write Fveiculocarreta;
    property veiculocarreta2 : tveiculo read Fveiculocarreta2 write Fveiculocarreta2;
    property vlseguroambiental: Currency read fvlseguroambiental write fvlseguroambiental;
    function GetVlAutpagto:currency;
    function GearAutpagto(cdfornecedor:largeint):boolean;
    function GetQtEixos:integer;
    constructor create;
    destructor destroy; override;
  end;
  TCTETransportadoraList = class(TObjectList)
  private
    function GetItem(Index: Integer): TCTETransportadora;
    procedure SetItem(Index: Integer; const Value: TCTETransportadora);
  public
    function New: TCTETransportadora;
    property Items[Index: Integer]: TCTETransportadora read GetItem write SetItem;
    function Ler(codigo:Integer):Boolean;overload;
    function Ler(Dataset: TDataset):boolean;overload;
    function ExcluirAutpagto(boscript:boolean=false):string;
    function Excluir(boscript:boolean=false):string;
    function CheckBaixaAutpagto:boolean;
  end;

implementation

constructor TCTETransportadora.create;
begin
  inherited;
  fveiculo := tveiculo.Create;
  fveiculocarreta := tveiculo.Create;
  fveiculocarreta2 := tveiculo.Create;
end;

destructor TCTETransportadora.destroy;
begin
  freeandnil(fveiculo);
  freeandnil(fveiculocarreta);
  freeandnil(fveiculocarreta2);
end;

function TCTETransportadora.GearAutpagto(cdfornecedor:largeint): boolean;
var
  autpagto : tautpagto;
  sql : tstrings;
begin
  autpagto := tautpagto.Create;
  sql      := TStringList.create;
  try
    if empresa.financeiro.rpa.nucntcusto <> '' then
    begin
      autpagto.cdcntcusto   := empresa.financeiro.rpa.cdcntcusto;
      autpagto.nucntcusto   := empresa.financeiro.rpa.nucntcusto;
    end;
    if empresa.financeiro.rpa.nuplconta <> '' then
    begin
      autpagto.cdplconta    := empresa.financeiro.rpa.cdplconta;
      autpagto.nuplconta    := empresa.financeiro.rpa.nuplconta;
    end;
    autpagto.cdfornecedor := cdfornecedor;
    autpagto.vlautpagto   := GetVlAutpagto;
    autpagto.dshistorico  := 'Pagto de Frete do CTE '+inttostr(cdcte);
    if empresa.faturamento.cte.nucntcusto <> '' then
    begin
      autpagto.nucntcusto := empresa.faturamento.cte.nucntcusto;
      autpagto.cdcntcusto := empresa.faturamento.cte.cdcntcusto;
    end;
    if empresa.faturamento.cte.nuplconta <> '' then
    begin
      autpagto.nuplconta := empresa.faturamento.cte.nuplconta;
      autpagto.cdplconta := empresa.faturamento.cte.cdplconta;
    end;
    sql.add(autpagto.Insert(true));
    cdautpagto := autpagto.cdautpagto;
    sql.add(Update(true));
    result := ExecutaScript(sql);
  finally
    freeandnil(autpagto);
    freeandnil(sql);
  end;
end;

function TCTETransportadora.GetQtEixos: integer;
begin
  result := veiculo.nueixos + veiculocarreta.nueixos + veiculocarreta2.nueixos;
end;

function TCTETransportadora.GetVlAutpagto: currency;
begin
  result := vlfrete - vldesconto + vlpedagio + vlacrescimo - vlirrf - vlinss - vlsestsenat
end;

function TCTETransportadoraList.CheckBaixaAutpagto: boolean;
var
  I: Integer;
begin
  result := False;
  for I := 0 to count - 1 do
  begin
    result := (items[i].cdautpagto <> 0) and RegistroExiste(_baixa, _cdautpagto+'='+inttostr(items[i].cdautpagto));
    if result then
    begin
      break;
    end;
  end;
end;

function TCTETransportadoraList.Excluir(boscript: boolean): string;
var
  I: Integer;
begin
  for I := 0 to count - 1 do
  begin
    result := result + items[i].delete(boscript)+#13;
  end;
end;

function TCTETransportadoraList.ExcluirAutpagto(boscript: boolean): string;
var
  i : integer;
  autpagto : tautpagto;
begin
  for I := 0 to Count - 1 do
  begin
    autpagto := tautpagto.Create;
    try
      if (Items[i].cdautpagto <> 0) and autpagto.Select(Items[i].cdautpagto) then
      begin
        result := result + autpagto.Delete(boscript)+#13;
      end;
    finally
      freeandnil(autpagto);
    end;
  end;
end;

function TCTETransportadoraList.GetItem(Index: Integer): TCTETransportadora;
begin
  Result := TCTETransportadora(Inherited Items[Index]);
end;

function TCTETransportadoraList.Ler(codigo: Integer): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_CTETransportadora, codigo, _cdCTE));
  try
    clear;
    result := q.q.RecordCount > 0;
    if not result then
    begin
      Exit;
    end;
    Ler(q.q);
  finally
    FreeAndNil(q);
  end;
end;

function TCTETransportadoraList.Ler(Dataset: TDataset): boolean;
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

function TCTETransportadoraList.New: TCTETransportadora;
begin
  Result := TCTETransportadora.Create;
  Add(Result);
end;

procedure TCTETransportadoraList.SetItem(Index: Integer; const Value: TCTETransportadora);
begin
  Put(Index, Value);
end;

end.
