unit ORM.SaidaReferenciada;

interface

uses Classe.DAO, System.Classes, Contnrs, Data.DB, classe.query, rotina.retornasql, uConstantes, orm.AdicaoImportacao, System.SysUtils;

type
  TSaidaReferenciada = class(TRegistroQuipos)
  private
    Fbodigitarchave: string;
    Fcdsaidareferenciada: Integer;
    Fcdsaidaorigem: Integer;
    Fnudocumento: Integer;
    Fcdsaida: Integer;
    Fcdentradaorigem: Integer;
    Fnuchavenfe: string;
  public
    [keyfield]
    property cdsaidareferenciada : Integer read Fcdsaidareferenciada write fcdsaidareferenciada;
    [fk]
    property cdsaida : Integer read Fcdsaida write fcdsaida;
    [fk]
    property cdsaidaorigem : Integer read Fcdsaidaorigem write fcdsaidaorigem;
    [fk]
    property cdentradaorigem : Integer read Fcdentradaorigem write fcdentradaorigem;
    property nudocumento : Integer read Fnudocumento write fnudocumento;
    property nuchavenfe : string read Fnuchavenfe write fnuchavenfe;
    property bodigitarchave : string read Fbodigitarchave write Fbodigitarchave;
  end;
  TSaidaReferenciadaList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TSaidaReferenciada;
    procedure SetItem(Index: Integer; const Value: TSaidaReferenciada);
  public
    function New: TSaidaReferenciada;
    property Items[Index: Integer]: TSaidaReferenciada read GetItem write SetItem;
    function Ler(codigo:Integer):Boolean;overload;
    function Ler(Dataset: TDataset):Boolean;overload;
    function Excluir(boscript:boolean=false):string;
  end;

implementation

function TSaidaReferenciadaList.Excluir(boscript: boolean): string;
var
  I: Integer;
begin
  result := '';
  for I := 0 to count - 1 do
  begin
    if result <> '' then
    begin
      result := result + #13;
    end;
    result := result + items[i].Delete(boscript);
  end;
end;

function TSaidaReferenciadaList.GetItem(Index: Integer): TSaidaReferenciada;
begin
  Result := TSaidaReferenciada(Inherited Items[Index]);
end;

function TSaidaReferenciadaList.Ler(Dataset: TDataset): Boolean;
begin
  clear;
  result := False;
  dataset.first;
  while not dataset.Eof do
  begin
    new.select(dataset);
    dataset.Next;
    result := True;
  end;
end;

function TSaidaReferenciadaList.Ler(codigo: Integer): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_SaidaReferenciada, codigo, _cdsaida));
  try
    clear;
    result := q.q.RecordCount > 0;
    if not result then
    begin
      Exit;
    end;
    while not q.q.Eof do
    begin
      new.select(q.q);
      q.q.Next;
    end;
  finally
    freeandnil(q);
  end;
end;

function TSaidaReferenciadaList.New: TSaidaReferenciada;
begin
  Result := TSaidaReferenciada.Create;
  Add(Result);
end;

procedure TSaidaReferenciadaList.SetItem(Index: Integer; const Value: TSaidaReferenciada);
begin
  Put(Index, Value);
end;

end.
