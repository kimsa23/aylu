unit orm.Lp1aCiapi;

interface

uses Data.DB, contnrs, System.Classes,
  Classe.DAO;

type
  TLp1aCiapi = class(TRegistroQuipos)
  private
    Fcdcliente: LargeInt;
    Fnuparcela: integer;
    Fvlicmssubtrib: currency;
    Fvlicmsfrete: currency;
    Fcdtpmercadoriaativo: integer;
    Fcdlp1aciapi: integer;
    Fvlicms: currency;
    Fcdfornecedor: LargeInt;
    Fcddigitado: string;
    Fboativado: string;
    Fvlajuste: currency;
    Fnuserie: string;
    Fcditsaida: integer;
    Fnudocumento: integer;
    Fcdindicadoremitente: integer;
    Fnuitem: integer;
    Fcdproduto: integer;
    Fvlicmsdifaliquota: currency;
    Fcdlp1a: integer;
    Fvlsaldo: currency;
    Fnuchavenfe: string;
    Fcdtpciapi: integer;
    Fcditentrada: integer;
    Fcdindividualbem: string;
    Fvldeducao: currency;
    Fdtemissao: TDate;
    Fnudocfiscalicms: string;
  public
    [keyfield]
    property cdlp1aciapi : integer read Fcdlp1aciapi write Fcdlp1aciapi;
    [fk, AObrigatorio]
    property cdlp1a : integer read Fcdlp1a write Fcdlp1a;
    [fk]
    property cdproduto : integer read Fcdproduto write Fcdproduto;
    [fk]
    property cditsaida : integer read Fcditsaida write Fcditsaida;
    [fk]
    property cditentrada : integer read Fcditentrada write Fcditentrada;
    [fk]
    property cdtpciapi : integer read Fcdtpciapi write Fcdtpciapi;
    [fk, AObrigatorio]
    property cdtpmercadoriaativo : integer read Fcdtpmercadoriaativo write Fcdtpmercadoriaativo;
    [fk, AObrigatorio]
    property cdindicadoremitente : integer read Fcdindicadoremitente write Fcdindicadoremitente;
    [fk, AObrigatorio]
    property nudocfiscalicms : string read Fnudocfiscalicms write Fnudocfiscalicms;
    [AObrigatorio]
    property nuparcela : integer read Fnuparcela write Fnuparcela;
    [AObrigatorio]
    property vlajuste : currency read Fvlajuste write Fvlajuste;
    [AObrigatorio]
    property nudocumento : integer read Fnudocumento write Fnudocumento;
    property dtemissao : TDate read Fdtemissao write Fdtemissao;
    property vlicms : currency read Fvlicms write Fvlicms;
    property vldeducao : currency read Fvldeducao write Fvldeducao;
    property vlsaldo : currency read Fvlsaldo write Fvlsaldo;
    property boativado : string read Fboativado write Fboativado;
    [AObrigatorio]
    property cddigitado : string read Fcddigitado write Fcddigitado;
    [AObrigatorio]
    property vlicmssubtrib : currency read Fvlicmssubtrib write Fvlicmssubtrib;
    [AObrigatorio]
    property vlicmsfrete : currency read Fvlicmsfrete write Fvlicmsfrete;
    [AObrigatorio]
    property vlicmsdifaliquota : currency read Fvlicmsdifaliquota write Fvlicmsdifaliquota;
    [AObrigatorio]
    property nuitem : integer read Fnuitem write Fnuitem;
    [AObrigatorio]
    property cdindividualbem : string read Fcdindividualbem write Fcdindividualbem;
    [fk]
    property cdfornecedor : LargeInt read Fcdfornecedor write Fcdfornecedor;
    [fk]
    property cdcliente : LargeInt read Fcdcliente write Fcdcliente;
    [AObrigatorio]
    property nuserie : string read Fnuserie write Fnuserie;
    property nuchavenfe : string read Fnuchavenfe write Fnuchavenfe;
  end;
  TLp1aCiapiList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TLp1aCiapi;
    procedure SetItem(Index: Integer; const Value: TLp1aCiapi);
  public
    function New: TLp1aCiapi;
    property Items[Index: Integer]: TLp1aCiapi read GetItem write SetItem;
  end;

implementation

function TLp1aCiapiList.GetItem(Index: Integer): TLp1aCiapi;
begin
  Result := TLp1aCiapi(Inherited Items[Index]);
end;

function TLp1aCiapiList.New: TLp1aCiapi;
begin
  Result := TLp1aCiapi.Create;
  Add(Result);
end;

procedure TLp1aCiapiList.SetItem(Index: Integer; const Value: TLp1aCiapi);
begin
  Put(Index, Value);
end;

end.
