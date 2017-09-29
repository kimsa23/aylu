unit orm.ItFatSaida;

interface

uses Data.DB, contnrs, System.SysUtils, forms, System.Classes,
  uConstantes,
  Dialogo.Progressbar,
  ORM.saida,
  Rotina.Retornasql,
  Classe.DAO, classe.query;

type
  TItFatSaida = class(TRegistroQuipos)
  private
    fcdsaida: integer;
    fcdfaturamento: integer;
    fsaida: TSaida;
  public
    property saida : TSaida read fsaida write fsaida;
    [keyfield]
    property cdfaturamento : integer read fcdfaturamento write fcdfaturamento;
    [keyfield]
    property cdsaida : integer read fcdsaida write fcdsaida;
    constructor create;
    destructor destroy; override;
  end;
  TItFatSaidaList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TItFatSaida;
    procedure SetItem(Index: Integer; const Value: TItFatSaida);
  public
    function New: TItFatSaida;
    property Items[Index: Integer]: TItFatSaida read GetItem write SetItem;
    function Ler(codigo:Integer; cdfield:string):Boolean;overload;
    function Ler(DataSet: TDataset):boolean;overload;
    function sqlExcluir:string;
    function IndiceNotadoCliente(cdcliente:LargeInt):integer;
    function TotalizarNotas:string;
  end;

implementation

function TItFatSaidaList.GetItem(Index: Integer): TItFatSaida;
begin
  Result := Titfatsaida(Inherited Items[Index]);
end;

function TItFatSaidaList.IndiceNotadoCliente(cdcliente: LargeInt): integer;
var
  I: Integer;
begin
  result := -1;
  for I := 0 to count -1 do
  begin
    if items[i].saida.cdcliente = cdcliente then
    begin
      result := i;
      break;
    end;
  end;
end;

function TItFatSaidaList.Ler(DataSet: TDataset): boolean;
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

function TItFatSaidaList.Ler(codigo: Integer; cdfield: string): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_itfatsaida, codigo, cdfield));
  try
    result := Ler(q.q);
  finally
    FreeAndNil(q);
  end;
end;

function TItFatSaidaList.New: TItFatSaida;
begin
  Result := Titfatsaida.Create;
  Add(Result);
end;

procedure TItFatSaidaList.SetItem(Index: Integer; const Value: TItFatSaida);
begin
  Put(Index, Value);
end;

function TItFatSaidaList.sqlExcluir: string;
var
  I: Integer;
begin
  result := '';
  for I := 0 to count - 1 do
  begin
    result := result + items[i].Delete(true)+#13;
  end;
end;

function TItFatSaidaList.TotalizarNotas: string;
var
  i : integer;
begin
  frmprogressbar := tfrmprogressbar.create(nil);
  try
    frmprogressbar.gau.maxvalue := count;
    frmprogressbar.show;
    result := '';
    for I := 0 to count - 1 do
    begin
      frmprogressbar.pnl.caption := 'Totalizar notas';
      frmprogressbar.gau.Progress := i + 1;
      application.ProcessMessages;
      items[i].saida.vltotal   := items[i].saida.itsaida.ObterValor(_vltotal);
      items[i].saida.vlproduto := items[i].saida.itsaida.ObterValor(_vlproduto);
      items[i].saida.vlservico := items[i].saida.itsaida.ObterValor(_vlservico);
      result := result + items[i].saida.Update(true)+#13;
    end;
  finally
    freeandnil(frmprogressbar);
  end;
end;

constructor TItFatSaida.create;
begin
  inherited;
  fsaida := tsaida.create;
end;

destructor TItFatSaida.destroy;
begin
  freeandnil(fsaida);
  inherited;
end;

end.
