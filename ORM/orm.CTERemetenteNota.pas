unit orm.CTERemetenteNota;

interface

uses Data.DB, Contnrs, System.SysUtils, System.Classes,
  uConstantes,
  Rotina.Retornasql,
  ORM.Empresa,
  Classe.DAO, classe.query;

type
  TCTERemetenteNota = class(TRegistroQuipos)
  private
    Fvlproduto: currency;
    Fdsxml: string;
    Fvlicmssubtrib: currency;
    Fpsliquido: double;
    Fnuromaneio: String;
    Fcdcfop: integer;
    Fvlicms: currency;
    Fnupedido: String;
    Fcdcte: integer;
    Fcdcteremetentenota: integer;
    Fdtprevisao: TDate;
    Fvltotal: currency;
    Fpsbruto: double;
    Fnuserie: String;
    Fnunota: String;
    Fnuctetpdocoutros: string;
    Fdsoutros: string;
    Fnuchavenfe: string;
    Fvlbaseicmssubtrib: currency;
    Fvlfrete: currency;
    Fnudocfiscalicms: string;
    Fdtemissao: TDate;
    Fnupin: integer;
    Fvlbaseicms: currency;
  public
    [keyfield]
    property cdcteremetentenota : integer read Fcdcteremetentenota write Fcdcteremetentenota;
    [fk]
    property cdcte : integer read Fcdcte write Fcdcte;
    [fk]
    property cdcfop : integer read Fcdcfop write Fcdcfop;
    property nuctetpdocoutros : string read Fnuctetpdocoutros write Fnuctetpdocoutros;
    property nuserie : String read Fnuserie write Fnuserie;
    property nunota : String read Fnunota write Fnunota;
    property dtemissao : TDate read Fdtemissao write Fdtemissao;
    property nuromaneio : String read Fnuromaneio write Fnuromaneio;
    property nupedido : String read Fnupedido write Fnupedido;
    property vlbaseicms : currency read Fvlbaseicms write Fvlbaseicms;
    property vlicms : currency read Fvlicms write Fvlicms;
    property vlbaseicmssubtrib : currency read Fvlbaseicmssubtrib write Fvlbaseicmssubtrib;
    property vlicmssubtrib : currency read Fvlicmssubtrib write Fvlicmssubtrib;
    property nupin : integer read Fnupin write Fnupin;
    property vlproduto : currency read Fvlproduto write Fvlproduto;
    property vltotal : currency read Fvltotal write Fvltotal;
    property nuchavenfe : string read Fnuchavenfe write Fnuchavenfe;
    property psliquido : double read Fpsliquido write Fpsliquido;
    property psbruto : double read Fpsbruto write Fpsbruto;
    property nudocfiscalicms : string read Fnudocfiscalicms write Fnudocfiscalicms;
    property dsoutros : string read Fdsoutros write Fdsoutros;
    property dtprevisao : TDate read Fdtprevisao write Fdtprevisao;
    property vlfrete : currency read Fvlfrete write Fvlfrete;
    property dsxml : string read Fdsxml write Fdsxml;
    class function ObterCTEdeNFERepetido(nuchave:string; codigo:integer):string;
  end;
  TCTERemetenteNotaList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TCTERemetenteNota;
    procedure SetItem(Index: Integer; const Value: TCTERemetenteNota);
  public
    function New: TCTERemetenteNota;
    property Items[Index: Integer]: TCTERemetenteNota read GetItem write SetItem;
    function Ler(codigo:Integer):Boolean;overload;
    function Ler(Dataset: TDataset):boolean;overload;
    function Excluir(boscript:boolean=false):string;
  end;

implementation

class function TCTERemetenteNota.ObterCTEdeNFERepetido(nuchave: string; codigo: integer): string;
begin
  result := retornasqlstring('select cdcte from cteremetentenota where cdempresa='+empresa.cdempresa.tostring+' and nuchavenfe='+quotedstr(NUCHAVE)+' and cdcteremetentenota<>'+inttostr(codigo));
end;

function TCTERemetenteNotaList.Excluir(boscript: boolean): string;
var
  I: Integer;
begin
  for I := 0 to count - 1 do
  begin
    result := result + items[i].delete(boscript)+#13;
  end;
end;

function TCTERemetenteNotaList.GetItem(Index: Integer): TCTERemetenteNota;
begin
  Result := TCTERemetenteNota(Inherited Items[Index]);
end;

function TCTERemetenteNotaList.Ler(codigo: Integer): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_CTERemetenteNota, codigo, _cdCTE));
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

function TCTERemetenteNotaList.Ler(Dataset: TDataset): boolean;
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

function TCTERemetenteNotaList.New: TCTERemetenteNota;
begin
  Result := TCTERemetenteNota.Create;
  Add(Result);
end;

procedure TCTERemetenteNotaList.SetItem(Index: Integer; const Value: TCTERemetenteNota);
begin
  Put(Index, Value);
end;

end.
