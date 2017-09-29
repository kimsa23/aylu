unit orm.ItLp1a;

interface

uses Data.DB, contnrs, System.Classes,
  Classe.DAO;

type
  TItLp1a = class(TRegistroQuipos)
  private
    Fcdcliente: Largeint;
    Fvlicmssubtrib: currency;
    Fvlcontabil: currency;
    Fcdcfop: integer;
    Fdsobservacao: string;
    Ftpsaient: string;
    Fcdcte: integer;
    Fcdtpimposto: integer;
    Fvlisentas: currency;
    Fcdfornecedor: LargeInt;
    Fcdtpop1a: integer;
    Fnuserie: string;
    Fnmespecie: string;
    Fnuemitente: string;
    Fnudocumento: integer;
    Fdtentrada: TDate;
    Fcdsaida: integer;
    Falicmssubtrib: double;
    Faliquota: Double;
    Fcditlp1a: integer;
    Fvlbase: currency;
    Fcdlp1a: integer;
    Fvloutras: currency;
    Fvlbaseicmssubtrib: currency;
    Fcdentrada: integer;
    Fvlimposto: currency;
    Fdtemissao: TDate;
    Fcduf: integer;
  public
    [keyfield]
    property cditlp1a : integer read Fcditlp1a write Fcditlp1a;
    [fk, AObrigatorio]
    property cdlp1a : integer read Fcdlp1a write Fcdlp1a;
    [fk]
    property cdsaida : integer read Fcdsaida write Fcdsaida;
    [fk]
    property cdcfop : integer read Fcdcfop write Fcdcfop;
    [fk]
    property cdtpimposto : integer read Fcdtpimposto write Fcdtpimposto;
    [fk]
    property cdentrada : integer read Fcdentrada write Fcdentrada;
    [fk]
    property cduf : integer read Fcduf write Fcduf;
    [fk]
    property cdtpop1a : integer read Fcdtpop1a write Fcdtpop1a;
    [fk]
    property cdcliente : LargeInt read Fcdcliente write Fcdcliente;
    [fk]
    property cdfornecedor : LargeInt read Fcdfornecedor write Fcdfornecedor;
    [fk]
    property cdcte : integer read Fcdcte write Fcdcte;
    property tpsaient : string read Ftpsaient write Ftpsaient;
    property dtentrada : TDate read Fdtentrada write Fdtentrada;
    property nmespecie : string read Fnmespecie write Fnmespecie;
    property nuserie : string read Fnuserie write Fnuserie;
    property nudocumento : integer read Fnudocumento write Fnudocumento;
    property nuemitente : string read Fnuemitente write Fnuemitente;
    property dtemissao : TDate read Fdtemissao write Fdtemissao;
    property vlcontabil : currency read Fvlcontabil write Fvlcontabil;
    property vlbase : currency read Fvlbase write Fvlbase;
    property aliquota : Double read Faliquota write Faliquota;
    property vlimposto : currency read Fvlimposto write Fvlimposto;
    property vlisentas : currency read Fvlisentas write Fvlisentas;
    property vloutras : currency read Fvloutras write Fvloutras;
    property dsobservacao : string read Fdsobservacao write Fdsobservacao;
    property vlbaseicmssubtrib : currency read Fvlbaseicmssubtrib write Fvlbaseicmssubtrib;
    property alicmssubtrib : double read Falicmssubtrib write Falicmssubtrib;
    property vlicmssubtrib : currency read Fvlicmssubtrib write Fvlicmssubtrib;
  end;
  TItlp1aList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TItlp1a;
    procedure SetItem(Index: Integer; const Value: TItlp1a);
  public
    function New: TItlp1a;
    property Items[Index: Integer]: TItlp1a read GetItem write SetItem;
  end;

implementation

function TItlp1aList.GetItem(Index: Integer): TItlp1a;
begin
  Result := TItlp1a(Inherited Items[Index]);
end;

function TItlp1aList.New: TItlp1a;
begin
  Result := TItlp1a.Create;
  Add(Result);
end;

procedure TItlp1aList.SetItem(Index: Integer; const Value: TItlp1a);
begin
  Put(Index, Value);
end;

end.
