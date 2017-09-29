unit orm.CTEInformacaoSeguro;

interface

uses Data.DB, Contnrs, System.SysUtils, System.Classes,
  uConstantes,
  Rotina.Retornasql,
  classe.dao, classe.query;

type
  TCTEInformacaoSeguro = class(TRegistroQuipos)
  private
    Fcdcteinformacaoseguro: integer;
    Fnuapolice: string;
    Fcdcte: integer;
    Fcdfornecedor: LargeInt;
    Fnuaverbacao: string;
    Fcdtpcteresponsavelseguro: integer;
    Fvlcarga: currency;
  public
    [keyfield]
    property cdcteinformacaoseguro : integer read Fcdcteinformacaoseguro write Fcdcteinformacaoseguro;
    [fk]
    property cdcte : integer read Fcdcte write Fcdcte;
    [fk]
    property cdtpcteresponsavelseguro : integer read Fcdtpcteresponsavelseguro write Fcdtpcteresponsavelseguro;
    [fk]
    property cdfornecedor : LargeInt read Fcdfornecedor write Fcdfornecedor;
    property nuapolice : string read Fnuapolice write Fnuapolice;
    property nuaverbacao : string read Fnuaverbacao write Fnuaverbacao;
    property vlcarga : currency read Fvlcarga write Fvlcarga;
  end;
  TCTEInformacaoSeguroList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TCTEInformacaoSeguro;
    procedure SetItem(Index: Integer; const Value: TCTEInformacaoSeguro);
  public
    function New: TCTEInformacaoSeguro;
    property Items[Index: Integer]: TCTEInformacaoSeguro read GetItem write SetItem;
    function Ler(codigo:Integer):Boolean;overload;
    function Ler(Dataset: TDataset):boolean;overload;
    function Excluir(boscript:boolean=false):string;
  end;

implementation

function TCTEInformacaoSeguroList.Excluir(boscript: boolean): string;
var
  I: Integer;
begin
  for I := 0 to count - 1 do
  begin
    result := result + items[i].Delete(boscript)+#13;
  end;
end;

function TCTEInformacaoSeguroList.GetItem(Index: Integer): TCTEInformacaoSeguro;
begin
  Result := TCTEInformacaoSeguro(Inherited Items[Index]);
end;

function TCTEInformacaoSeguroList.Ler(codigo: Integer): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_CTEInformacaoSeguro, codigo, _cdCTE));
  try
    clear;
    result := q.q.RecordCount > 0;
    if not result then
    begin
      Exit;
    end;
    ler(q.q);
  finally
    FreeAndNil(q);
  end;
end;

function TCTEInformacaoSeguroList.Ler(Dataset: TDataset): boolean;
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

function TCTEInformacaoSeguroList.New: TCTEInformacaoSeguro;
begin
  Result := TCTEInformacaoSeguro.Create;
  Add(Result);
end;

procedure TCTEInformacaoSeguroList.SetItem(Index: Integer; const Value: TCTEInformacaoSeguro);
begin
  Put(Index, Value);
end;

end.
