unit orm.ItContratoParcela;

interface

uses Contnrs, System.SysUtils, System.Classes,
  uConstantes,
  Rotina.Registro, Rotina.Retornasql,
  ORM.duplicata,
  Classe.DAO, classe.gerar, classe.query;

type
  TItContratoParcela = class(TRegistroQuipos)
  private
    Fvlsaldo: Currency;
    Fvlsaldocorrigido: Currency;
    Fvljuros: Currency;
    Fvlsaldodevedor: Currency;
    Fvlamortizacao: Currency;
    Fvljurosadicional: Currency;
    Fcditcontratonegociacao: Integer;
    Fnuparcela: Integer;
    Fcditcontratoparcela: Integer;
    Fdtparcela: TDate;
    Fvlparcela: Currency;
    Fduplicata: TDuplicata;
    Fprcorrecao: Double;
    Fcdittpcorrecao: Integer;
    Fvlreajuste: Currency;
    Fvlsaldodevedorreajustado: Currency;
  public
    property duplicata : TDuplicata read Fduplicata write fduplicata;
    [keyfield]
    property cditcontratoparcela : Integer read Fcditcontratoparcela write fcditcontratoparcela;
    [fk]
    property cditcontratonegociacao : Integer read Fcditcontratonegociacao write fcditcontratonegociacao;
    property nuparcela : Integer read Fnuparcela write fnuparcela;
    property dtparcela : TDate read Fdtparcela write fdtparcela;
    property vlsaldo : Currency read Fvlsaldo write fvlsaldo;
    property vljuros : Currency read Fvljuros write fvljuros;
    property vljurosadicional : Currency read Fvljurosadicional write fvljurosadicional;
    property vlsaldocorrigido : Currency read Fvlsaldocorrigido write fvlsaldocorrigido;
    property vlamortizacao : Currency read Fvlamortizacao write fvlamortizacao;
    property vlsaldodevedor : Currency read Fvlsaldodevedor write fvlsaldodevedor;
    property vlparcela : Currency read Fvlparcela write fvlparcela;
    property prcorrecao : Double read Fprcorrecao write Fprcorrecao;
    [fk]
    property cdittpcorrecao : Integer read Fcdittpcorrecao write Fcdittpcorrecao;
    property vlsaldodevedorreajustado : Currency read Fvlsaldodevedorreajustado write fvlsaldodevedorreajustado;
    property vlreajuste : Currency read Fvlreajuste write fvlreajuste;
    constructor create;
    destructor  destroy; override;
  end;
  TItContratoParcelaList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TItContratoParcela;
    procedure SetItem(Index: Integer; const Value: TItContratoParcela);
  public
    function  New: TItContratoParcela;
    property  Items[Index: Integer]: TItContratoParcela read GetItem write SetItem;
    function  Insert(cditcontratonegociacao:integer): TItContratoParcela;
    function  sql_insert:string;
    function  sql_insert_duplicata:string;
    function  Ler(codigo:Integer):Boolean;
    function  indice_parcela_data_superitor(data:TDate):integer;
  end;

implementation

function TItContratoParcelaList.indice_parcela_data_superitor(data: TDate): integer;
var
  i : Integer;
begin
  result := 0;
  for i := 0 to Count - 2 do
  begin
    if Items[i].dtparcela > data then
    begin
      result := i;
      Break;
    end;
  end;
end;

function TItContratoParcelaList.GetItem(Index: Integer): TItContratoParcela;
begin
  Result := TitcontratoParcela(Inherited Items[Index]);
end;

function TItContratoParcelaList.Insert(cditcontratonegociacao: integer): TItContratoParcela;
begin
  result                        := new;
  Result.cditcontratonegociacao := cditcontratonegociacao;
  Result.cditcontratoparcela    := QGerar.GerarCodigo(_itcontratoParcela);
end;

function TItContratoParcelaList.Ler(codigo: Integer): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_itcontratoParcela, codigo, _cditcontratonegociacao));
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

function TItContratoParcelaList.New: TItContratoParcela;
begin
  Result := TItContratoParcela.Create;
  Add(Result);
end;

procedure TItContratoParcelaList.SetItem(Index: Integer; const Value: TItContratoParcela);
begin
  Put(Index, Value);
end;

function TItContratoParcelaList.sql_insert: string;
var
  i : Integer;
begin
  Result := '';
  for i := 0 to count-1 do
  begin
    result := result + Items[i].Insert(True)+#13;
  end;
end;

function TItContratoParcelaList.sql_insert_duplicata: string;
var
  i : Integer;
begin
  Result := '';
  for i := 0 to count-1 do
  begin
    result := result + Items[i].duplicata.Insert(True)+#13;
  end;
end;

constructor TItContratoParcela.create;
begin
  inherited create;
  fduplicata := TDuplicata.create;
end;

destructor TItContratoParcela.destroy;
begin
  FreeAndNil(fduplicata);
  inherited;
end;

end.
